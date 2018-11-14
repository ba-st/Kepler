"
I'm a facility to install a subsystem on an already started composite.
"
Class {
	#name : #SystemHotInstaller,
	#superclass : #Object,
	#instVars : [
		'subsystem'
	],
	#category : #'Kepler-System'
}

{ #category : #'instance creation' }
SystemHotInstaller class >> installing: aSubsystem [

	^self new initializeInstalling: aSubsystem
]

{ #category : #applying }
SystemHotInstaller >> applyTo: aCompositeSystem [

	aCompositeSystem register: subsystem.
	subsystem startUp.
	aCompositeSystem resolveSubsystemDependencies
]

{ #category : #initialization }
SystemHotInstaller >> initializeInstalling: aSubsystem [

	subsystem := aSubsystem
]
