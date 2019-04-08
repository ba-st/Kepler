"
A TimeSystemTest is a test class for testing the behavior of TimeSystem
"
Class {
	#name : #TimeSystemTest,
	#superclass : #TestCase,
	#instVars : [
		'timeSource'
	],
	#category : 'Kepler-Time-Tests'
}

{ #category : #running }
TimeSystemTest >> setUp [

	timeSource := FixedTimeSource on: (January third , 1990) atNoon
]

{ #category : #'tests-accessing' }
TimeSystemTest >> testAccessing [

	| timeSystem |

	timeSystem := TimeSystem using: timeSource.
	self assert: timeSystem name equals: 'Time System'
]

{ #category : #'tests-accessing' }
TimeSystemTest >> testDate [

	| timeSystem |

	timeSystem := TimeSystem using: timeSource.
	timeSystem startUp.
	self assert: timeSystem date equals: timeSource dateTime date
]

{ #category : #'tests-accessing' }
TimeSystemTest >> testDateTime [

	| timeSystem |

	timeSystem := TimeSystem using: timeSource.
	timeSystem startUp.
	self assert: timeSystem dateTime equals: timeSource dateTime
]

{ #category : #'tests-accessing' }
TimeSystemTest >> testImplements [

	| timeSystem rootSystem |

	timeSystem := TimeSystem using: timeSource.
	rootSystem := CompositeSystem new.
	rootSystem
		register: timeSystem;
		startUp.

	self assert: rootSystem >> #TimeSystemInterface equals: timeSystem
]

{ #category : #tests }
TimeSystemTest >> testInstalling [

	| rootSystem |

	rootSystem := (UserStoryTestSystemInstallation
		installing: {TimeModule}) install: '1.0'.

	self
		assert:
			(rootSystem >> #InstalledModuleRegistrationSystem) installedModules
				size
			equals: 1;
		assert:
			((rootSystem >> #InstalledModuleRegistrationSystem
				installedModuleRegisteringSystemImplementing: #TimeSystemInterface)
				isA: TimeModule)
]

{ #category : #'tests-accessing' }
TimeSystemTest >> testTimeOfDay [

	| timeSystem |

	timeSystem := TimeSystem using: timeSource.
	timeSystem startUp.
	self assert: timeSystem timeOfDay equals: timeSource dateTime timeOfDay
]
