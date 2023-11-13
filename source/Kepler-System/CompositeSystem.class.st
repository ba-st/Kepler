"
I'm a composite system, a system containing another systems (called subsystems). I'm the one responsible of coordinating the startUp and shutDown of a whole subsystems combination.
"
Class {
	#name : 'CompositeSystem',
	#superclass : 'SystemImplementation',
	#instVars : [
		'subsystems',
		'installationOptional'
	],
	#category : 'Kepler-System',
	#package : 'Kepler-System'
}

{ #category : 'instance creation' }
CompositeSystem class >> installedBy: anInstallation [

	^self new initializeInstalledBy: anInstallation
]

{ #category : 'subsystem lookup' }
CompositeSystem >> >> anInterfaceKey [

	^ self systemImplementing: anInterfaceKey
]

{ #category : 'initialization' }
CompositeSystem >> initialize [

	super initialize.
	subsystems := OrderedCollection new.
	installationOptional := Optional unused.
]

{ #category : 'initialization' }
CompositeSystem >> initializeInstalledBy: anInstallation [

	installationOptional := Optional containing: anInstallation
]

{ #category : 'private - accessing' }
CompositeSystem >> interfaceAt: anInterfaceKey [

	^ SystemInterfaces >> anInterfaceKey
]

{ #category : 'accessing' }
CompositeSystem >> name [

	^ installationOptional withContentDo: [ :installation | installation name ] ifUnused: [ '' ]
]

{ #category : 'subsystem management' }
CompositeSystem >> register: aSubsystem [

	AssertionChecker enforce: [ aSubsystem isStopped ] because: [ 'Cannot register a subsystem not stopped (<1s>)' expandMacrosWith: aSubsystem name ] raising: SystemControlError.
	subsystems add: aSubsystem.
	aSubsystem beChildOf: self.
	^ aSubsystem
]

{ #category : 'installing' }
CompositeSystem >> reinstall [

	subsystems do: [ :subsystem | subsystem aboutToReinstall ].
	self withInstallationDo: [ :installation | installation reinstallOn: self ]
]

{ #category : 'installing' }
CompositeSystem >> resolveSubsystemDependencies [

	subsystems do: [ :subsystem | subsystem resolveDependencies ]
]

{ #category : 'controlling' }
CompositeSystem >> restart [

	self
		shutDown;
		startUp
]

{ #category : 'private - controlling' }
CompositeSystem >> shutDownWhenStarted [

	super shutDownWhenStarted.
	subsystems do: [ :subsystem | subsystem shutDown ].
	self withInstallationDo: [ :installation | installation beAwareOfShutDownOf: self ]
]

{ #category : 'private - controlling' }
CompositeSystem >> startUpWhenStopped [

	super startUpWhenStopped.
	subsystems do: [ :subsystem | subsystem startUp ]
]

{ #category : 'subsystem lookup' }
CompositeSystem >> systemImplementing: anInterfaceKey [

	^ self systemImplementing: anInterfaceKey ifNone: [ SystemControlError signal: ('System implementing "<1p>" not found.' expandMacrosWith: (self interfaceAt: anInterfaceKey)) ]
]

{ #category : 'subsystem lookup' }
CompositeSystem >> systemImplementing: anInterfaceKey ifFound: aOneArgBlock ifNone: anExceptionalBlock [

	^ subsystems detect: [ :subsystem | subsystem implements: (self interfaceAt: anInterfaceKey) ] ifFound: aOneArgBlock ifNone: anExceptionalBlock
]

{ #category : 'subsystem lookup' }
CompositeSystem >> systemImplementing: anInterfaceKey ifNone: aNoneBlock [

	^ subsystems detect: [ :subsystem | subsystem implements: (self interfaceAt: anInterfaceKey) ] ifNone: aNoneBlock
]

{ #category : 'subsystem lookup' }
CompositeSystem >> systemsImplementing: anInterfaceKey [

	^ subsystems select: [ :subsystem | subsystem implements: (self interfaceAt: anInterfaceKey) ]
]

{ #category : 'subsystem management' }
CompositeSystem >> unregister: aSubsystem [

	aSubsystem beOrphan.
	subsystems remove: aSubsystem.
	^aSubsystem
]

{ #category : 'accessing' }
CompositeSystem >> withInstallationDo: aBlock [

	installationOptional withContentDo: aBlock
]
