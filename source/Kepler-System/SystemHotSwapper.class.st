"
I'm a facility to swap a subsystem implementation with another on an already started composite.
"
Class {
	#name : #SystemHotSwapper,
	#superclass : #Object,
	#instVars : [
		'interfaceKey',
		'subsystems'
	],
	#pools : [
		'Kepler'
	],
	#category : #'Kepler-System'
}

{ #category : #'private - preconditions' }
SystemHotSwapper class >> assert: aSubsystem implementsAnyIn: anInterfaceKeyCollection [

	anInterfaceKeyCollection
		detect: [ :anInterfaceKey | SystemInterfaces >> anInterfaceKey isImplementedBy: aSubsystem ]
		ifNone: [ SystemControlError
				signal:
					( '<1p> is not implementing <2s>'
						expandMacrosWith: aSubsystem
						with:
							( ( CollectionFormatter
								separatingWith: $,
								applyingToEach: [ :anInterfaceKey | ( SystemInterfaces >> anInterfaceKey ) printString ] )
								format: anInterfaceKeyCollection ) )
			]
]

{ #category : #'instance creation' }
SystemHotSwapper class >> swapSystemImplementing: anInterfaceKey with: aSubsystem [

	^ self swapSystemImplementingAll: {anInterfaceKey} with: {aSubsystem}
]

{ #category : #'instance creation' }
SystemHotSwapper class >> swapSystemImplementingAll: anInterfaceKeyCollection with: aSubsystemCollection [

	aSubsystemCollection
		do: [ :aSubsystem | self assert: aSubsystem implementsAnyIn: anInterfaceKeyCollection ].

	^ self new
		initializeSwapSystemImplementing: anInterfaceKeyCollection anyOne
		withAll: aSubsystemCollection
]

{ #category : #applying }
SystemHotSwapper >> applyTo: aCompositeSystem [

	| subsystemToSwap |

	subsystemToSwap := aCompositeSystem >> interfaceKey.
	subsystemToSwap shutDown.
	aCompositeSystem unregister: subsystemToSwap.
	( SystemHotInstaller installingAll: subsystems ) applyTo: aCompositeSystem
]

{ #category : #initialization }
SystemHotSwapper >> initializeSwapSystemImplementing: anInterfaceKey withAll: aSubsystemCollection [

	interfaceKey := anInterfaceKey.
	subsystems := aSubsystemCollection
]
