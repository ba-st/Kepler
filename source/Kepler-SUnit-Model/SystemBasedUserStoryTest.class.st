"
I'm a TestCase extension supporting system level tests.

My subclasses need to implement setUpRequirements and install here the required modules or subsystems needed for the specific case.
"
Class {
	#name : #SystemBasedUserStoryTest,
	#superclass : #TestCase,
	#instVars : [
		'rootSystem'
	],
	#category : #'Kepler-SUnit-Model'
}

{ #category : #testing }
SystemBasedUserStoryTest class >> isAbstract [

	^self name = #SystemBasedUserStoryTest
]

{ #category : #'private - configuring' }
SystemBasedUserStoryTest >> registerInstalledModuleRegistrationSystem [

	rootSystem
		systemImplementing: #InstalledModuleRegistrationSystem
		ifNone: [ self registerSubsystem: InstalledModuleRegistrationSystem new ]
]

{ #category : #'private - configuring' }
SystemBasedUserStoryTest >> registerSubsystem: aSubsystem [

	rootSystem register: aSubsystem
]

{ #category : #'private - configuring' }
SystemBasedUserStoryTest >> requireInstallationOf: aModuleFactory [

	self registerInstalledModuleRegistrationSystem.
	(aModuleFactory toInstallOn: rootSystem) install
]

{ #category : #running }
SystemBasedUserStoryTest >> setUp [

	super setUp.
	rootSystem := CompositeSystem new.
	self setUpRequirements.
	rootSystem startUp
]

{ #category : #'private - running' }
SystemBasedUserStoryTest >> setUpRequirements [

	"The subsystems or module requirements must be made explicit in this method."

	self subclassResponsibility
]

{ #category : #running }
SystemBasedUserStoryTest >> tearDown [

	rootSystem ifNotNil: [ rootSystem shutDown ].
	super tearDown
]
