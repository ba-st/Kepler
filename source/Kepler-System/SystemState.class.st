"
I represent the current state of a system implementation
"
Class {
	#name : #SystemState,
	#superclass : #Object,
	#instVars : [
		'system'
	],
	#category : #'Kepler-System'
}

{ #category : #'instance creation' }
SystemState class >> for: aSystem [

	^ self new initializeFor: aSystem
]

{ #category : #initialization }
SystemState >> initializeFor: aSystem [

	system := aSystem
]

{ #category : #testing }
SystemState >> isStarted [

	^ false
]

{ #category : #testing }
SystemState >> isStopped [

	^ false
]

{ #category : #controlling }
SystemState >> shutDown [

	self subclassResponsibility 
]

{ #category : #controlling }
SystemState >> startUp [

	self subclassResponsibility 
]
