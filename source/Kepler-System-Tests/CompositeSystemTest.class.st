Class {
	#name : #CompositeSystemTest,
	#superclass : #TestCase,
	#category : 'Kepler-System-Tests'
}

{ #category : #tests }
CompositeSystemTest >> testDependenciesAreResolvedOnSystemStartUp [

	| system |

	system := CompositeSystem of: (Array with: TestSystem new with: self timeSystem).

	self
		should: [ (system systemImplementing: #TestInterface) currentDateTime ]
		raise: Error
		whoseDescriptionIncludes: 'Unresolved system dependency to Time System Interface'
		description: 'Expected: Unresolved system dependency to Time System Interface'.

	system startUp.
	self shouldnt: [ (system systemImplementing: #TestInterface) currentDateTime ] raise: Error
]

{ #category : #tests }
CompositeSystemTest >> testGettingSystemImplementingInterface [

	| system timeSystem |

	timeSystem := self timeSystem.

	system := CompositeSystem of: (Array with: timeSystem).

	self assert: (system systemImplementing: #TimeSystemInterface) equals: timeSystem
]

{ #category : #tests }
CompositeSystemTest >> testGettingSystemImplementingInterfaceFailsDueToImplementationNotFound [

	| system |

	system := CompositeSystem of: #().

	self
		should: [ system systemImplementing: #TimeSystemInterface ]
		raise: Error
		withExceptionDo: [ :signal | self assert: signal messageText equals: 'System implementing ''Time System Interface'' not found' ]
]

{ #category : #tests }
CompositeSystemTest >> testSendingMessagesToSystemWithUnresolvedSystemDependencyFails [

	| system |

	system := CompositeSystem of: (Array with: TestSystem new).

	self
		should: [ (system systemImplementing: #TestInterface) currentDateTime ]
		raise: Error
		whoseDescriptionIncludes: 'Unresolved system dependency to Time System Interface'
		description: 'Expected: Unresolved system dependency to Time System Interface'
]

{ #category : #tests }
CompositeSystemTest >> testStartUpAndShutDown [

	| system testSystem |

	testSystem := TestSystem new.

	system := CompositeSystem of: (Array with: testSystem with: self timeSystem).
	self deny: testSystem isStarted.
	system startUp.
	self assert: testSystem isStarted.
	system shutDown.
	self deny: testSystem isStarted
]

{ #category : #tests }
CompositeSystemTest >> testWontStartWhenRequiredSystemNotFound [

	| system |

	system := CompositeSystem of: (Array with: TestSystem new).

	self should: [ system startUp ] raise: Error withExceptionDo: [ :signal | self assert: signal messageText equals: 'System implementing ''Time System Interface'' not found' ]
]

{ #category : #accessing }
CompositeSystemTest >> timeSystem [

	^ TimeSystem
		using: (FixedTimeSource on: September tenth , 2015 at: TimeOfDay noon)
]
