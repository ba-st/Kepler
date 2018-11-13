"
I'm a facility to swap a subsystem implementation with another on an already started composite.
"
Class {
	#name : #SystemHotSwapper,
	#superclass : #Object,
	#instVars : [
		'subsystem',
		'interfaceKey'
	],
	#pools : [
		'KeplerNamespace'
	],
	#category : #'Kepler-System'
}

{ #category : #'private - preconditions' }
SystemHotSwapper class >> assert: aSubsystem implements: anInterfaceKey [

	(SystemInterface >> anInterfaceKey isImplementedBy: aSubsystem)
		ifFalse: [ SystemControlError signal: ('<1p> is not implementing <2p>' expandMacrosWith: aSubsystem with: SystemInterface >> anInterfaceKey) ] 
]

{ #category : #'instance creation' }
SystemHotSwapper class >> swapSystemImplementing: anInterfaceKey with: aSubsystem [

	self assert: aSubsystem implements: anInterfaceKey.
	^self new initializeSwapSystemImplementing: anInterfaceKey with: aSubsystem
]

{ #category : #applying }
SystemHotSwapper >> applyTo: aCompositeSystem [

	| subsystemToSwap |

	subsystemToSwap := aCompositeSystem systemImplementing: interfaceKey.
	subsystemToSwap shutDown.
	aCompositeSystem unregister: subsystemToSwap.
	(SystemHotInstaller installing: subsystem) applyTo: aCompositeSystem
]

{ #category : #initialization }
SystemHotSwapper >> initializeSwapSystemImplementing: anInterfaceKey with: aSubsystem [

	interfaceKey := anInterfaceKey.
	subsystem := aSubsystem
]
