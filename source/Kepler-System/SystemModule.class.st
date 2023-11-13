"
I'm a system module.
I will install one or more subsystems, and perform all the necessary post installation setup to make it work.
"
Class {
	#name : 'SystemModule',
	#superclass : 'Object',
	#category : 'Kepler-System',
	#package : 'Kepler-System'
}

{ #category : 'private' }
SystemModule >> >> anInterfaceKey [

	^ self rootSystem >> anInterfaceKey
]

{ #category : 'actions' }
SystemModule >> install [

	self >> #InstalledModuleRegistrationSystem
		ifNotRegisteredAsInstalled: self
		do: [ 
			self
				installSystems;
				postInstall ]
]

{ #category : 'private' }
SystemModule >> installSystems [

	self withSystemsToInstallDo: [ :aSubsystem | self rootSystem register: aSubsystem ]
]

{ #category : 'testing' }
SystemModule >> isEquivalentTo: anotherModule [

	^anotherModule isA: self class
]

{ #category : 'private' }
SystemModule >> name [

	self subclassResponsibility
]

{ #category : 'private' }
SystemModule >> postInstall [

	self >> #InstalledModuleRegistrationSystem registerAsInstalled: self
]

{ #category : 'printing' }
SystemModule >> printOn: aStream [

	aStream nextPutAll: self name
]

{ #category : 'private' }
SystemModule >> register: aSystemCreationBlock in: systems [

	^ systems add: aSystemCreationBlock value
]

{ #category : 'actions' }
SystemModule >> reinstall [
]

{ #category : 'private' }
SystemModule >> rootSystem [

	^ self subclassResponsibility
]

{ #category : 'private' }
SystemModule >> systemInterfacesToInstall [

	self subclassResponsibility
]

{ #category : 'private' }
SystemModule >> withSystemsToInstallDo: aBlock [

	"Modules can reflectively provide the systems to install by implementing messages matching: register*SystemForInstallationIn:
	Returning the system instance (not started)"

	| subsystemsToInstall |

	subsystemsToInstall := OrderedCollection new.

	(KeywordMessageSendingCollector
		sendingAllMessagesBeginningWith: 'register'
		andEndingWith: 'SystemForInstallationIn:'
		to: self
		with: subsystemsToInstall) value.

	subsystemsToInstall do: aBlock
]
