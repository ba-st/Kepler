Class {
	#name : #SystemInterface,
	#superclass : #Object,
	#instVars : [
		'name',
		'messages'
	],
	#category : 'Kepler-System'
}

{ #category : #'instance creation' }
SystemInterface class >> named: aName offering: aMessageCollection [

	^ self new initializeNamed: aName offering: aMessageCollection 
]

{ #category : #'initialize-release' }
SystemInterface >> initializeNamed: aName offering: aMessageCollection [

	name := aName.
	messages := aMessageCollection
]

{ #category : #accessing }
SystemInterface >> messages [

	^ messages
]

{ #category : #accessing }
SystemInterface >> name [

	^ name
]

{ #category : #accessing }
SystemInterface >> printOn: aStream [

	aStream nextPutAll: name
]
