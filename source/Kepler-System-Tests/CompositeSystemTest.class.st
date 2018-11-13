"
Test Case
"
Class {
	#name : #CompositeSystemTest,
	#superclass : #TestCase,
	#category : #'Kepler-System-Tests'
}

{ #category : #tests }
CompositeSystemTest >> testCannotRegisterAnAlreadyStartedSystem [

	| composite |

	composite := CompositeSystem new
		register: SampleCustomerSystem new;
		startUp.

	self
		assert: (composite >> #CustomerManagementSystem) isStarted;
		should: [ CompositeSystem new register: composite >> #CustomerManagementSystem ]
			raise: SystemControlError
			withExceptionDo: [ :error | self assert: error messageText equals: 'Cannot register a subsystem not stopped (CMS)' ]
]

{ #category : #tests }
CompositeSystemTest >> testDependencies [

	| system |

	system := CompositeSystem new.
	system
		register: SampleProjectSystem new;
		register: SampleCustomerSystem new;
		startUp.

	system >> #CustomerManagementSystem addCustomer: 'Tesla'.

	system >> #ProjectManagementSystem addProjectNamed: 'Landing Page' for: 'Tesla'.

	self
		assert: (system >> #ProjectManagementSystem projectsFor: 'Tesla') size equals: 1;
		assert: (system >> #ProjectManagementSystem) name equals: 'Project Management'
]

{ #category : #tests }
CompositeSystemTest >> testDependenciesAreResolvedOnSystemStartUp [

	| system |

	system := CompositeSystem new.
	system
		register: SampleProjectSystem new;
		register: SampleCustomerSystem new;
		startUp.

	self should: [ (system systemImplementing: #ProjectManagementSystem) addProjectNamed: 'Landing Page' for: 'Tesla' ] raise: AssertionFailed
]

{ #category : #tests }
CompositeSystemTest >> testEmptySystem [

	| system |

	system := CompositeSystem new.

	self
		assert: system printString isEmpty;
		assert: system isStopped;
		deny: system isStarted.

	system startUp.

	self
		assert: system isStarted;
		deny: system isStopped.

	system shutDown.

	self assert: system isStopped
]

{ #category : #tests }
CompositeSystemTest >> testGettingSystemImplementingInterface [

	| system cms |

	cms := SampleCustomerSystem new.

	system := CompositeSystem new.
	system
		register: cms;
		startUp.

	self assert: system >> #CustomerManagementSystem equals: cms.

	self should: [ system >> #ProjectManagementSystem ] raise: SystemControlError
]

{ #category : #tests }
CompositeSystemTest >> testInvalidControlSequences [

	| system |

	system := CompositeSystem new.

	self should: [ system shutDown ] raise: SystemControlError.

	system startUp.

	self should: [ system startUp ] raise: SystemControlError
]

{ #category : #tests }
CompositeSystemTest >> testNotEmptySystem [

	| system cms pms |

	system := CompositeSystem new.
	cms := SampleCustomerSystem new.
	pms := SampleProjectSystem new.
	system
		register: cms;
		register: pms.


	self
		assert: system isStopped;
		assert: cms isStopped;
		assert: pms isStopped.

	system startUp.

	self
		assert: system isStarted;
		assert: cms isStarted;
		assert: pms isStarted.

	system shutDown.

	self
		assert: system isStopped;
		assert: cms isStopped;
		assert: pms isStopped
]

{ #category : #tests }
CompositeSystemTest >> testRestart [

	| system |

	system := CompositeSystem new.

	system startUp.

	self assert: system isStarted.

	system restart.

	self assert: system isStarted
]

{ #category : #tests }
CompositeSystemTest >> testSendingMessagesToSystemWithUnresolvedSystemDependencyFails [

	| system |

	system := CompositeSystem new.
	system
		register: SampleCustomerSystem new;
		register: SampleProjectSystem new.

	self
		should: [ system >> #ProjectManagementSystem addProjectNamed: 'Fail' for: 'Pedro' ]
		raise: SystemControlError
		withExceptionDo: [ :error | self assert: error messageText equals: 'Unresolved Customer Querying' ]
]

{ #category : #tests }
CompositeSystemTest >> testSystemImplementingIfFoundIfNone [

	| system cms |

	cms := SampleCustomerSystem new.

	system := CompositeSystem new.
	system
		register: cms;
		startUp.

	self
		assert:
			(system
				systemImplementing: #CustomerManagementSystem
				ifFound: [ :subsystem | 
					self assert: subsystem equals: cms.
					true ]
				ifNone: [ self fail ]);
		assert: (system systemImplementing: #ProjectManagementSystem ifFound: [ :subsystem | self fail ] ifNone: [ true ])
]

{ #category : #tests }
CompositeSystemTest >> testSystemMissingDependenciesWillNotStart [

	| composite |

	composite := CompositeSystem new.
	composite register: SampleProjectSystem new.

	self
		should: [ composite startUp ]
		raise: SystemControlError
		withExceptionDo: [ :error | self assert: error messageText equals: 'System implementing "Customer Querying" not found.' ]
]

{ #category : #tests }
CompositeSystemTest >> testSystemsImplementing [

	| system cms |

	cms := SampleCustomerSystem new.

	system := CompositeSystem new.
	system
		register: cms;
		startUp.

	self
		assert: system >> #CustomerManagementSystem equals: cms;
		assert: (system systemsImplementing: #CustomerManagementSystem) size equals: 1;
		assert: (system systemsImplementing: #CustomerManagementSystem) first equals: cms.

	self assert: (system systemsImplementing: #ProjectManagementSystem) isEmpty
]

{ #category : #tests }
CompositeSystemTest >> testWontStartWhenRequiredSystemNotFound [

	| system |

	system := CompositeSystem new.
	system register: SampleProjectSystem new.

	self should: [ system startUp ] raise: SystemControlError
]
