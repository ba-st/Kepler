"
I represent the ""Started"" state of a system. A system in this state is ready to be used, and can be shutDown
"
Class {
	#name : #SystemStarted,
	#superclass : #SystemState,
	#category : #'Kepler-System'
}

{ #category : #testing }
SystemStarted >> isStarted [

	^ true
]

{ #category : #controlling }
SystemStarted >> shutDown [

	system shutDownWhenStarted
]

{ #category : #controlling }
SystemStarted >> startUp [

	SystemControlError signal: ('<1s> is already started.' expandMacrosWith: system name)
]
