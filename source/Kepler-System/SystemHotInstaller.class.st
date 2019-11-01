"
I'm a facility to install a subsystem on an already started composite.
"
Class {
	#name : #SystemHotInstaller,
	#superclass : #Object,
	#instVars : [
		'subsystems'
	],
	#category : #'Kepler-System'
}

{ #category : #'instance creation' }
SystemHotInstaller class >> installing: aSubsystem [

	^ self installingAll: {aSubsystem}
]

{ #category : #'instance creation' }
SystemHotInstaller class >> installingAll: aSubsystemCollection [

	^self new initializeInstallingAll: aSubsystemCollection
]

{ #category : #applying }
SystemHotInstaller >> applyTo: aCompositeSystem [

	subsystems
		do: [ :subsystem | 
			aCompositeSystem register: subsystem.
			subsystem startUp
			].
	aCompositeSystem resolveSubsystemDependencies
]

{ #category : #initialization }
SystemHotInstaller >> initializeInstallingAll: aSubsystemCollection [

	subsystems := aSubsystemCollection
]
