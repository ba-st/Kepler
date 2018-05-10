Class {
	#name : #FixedNumberProvider,
	#superclass : #IdentifierProvider,
	#instVars : [
		'identifier'
	],
	#category : 'Kepler-Identifier'
}

{ #category : #'instance creation' }
FixedNumberProvider class >> providing: anIdentifier [

	^ self new initializeProviding: anIdentifier 
]

{ #category : #'initialize-release' }
FixedNumberProvider >> initializeProviding: anIdentifier [  

	identifier := anIdentifier 
]

{ #category : #providing }
FixedNumberProvider >> next [

	^ identifier
]

{ #category : #providing }
FixedNumberProvider >> setNextTo: anIdentifier [

	identifier := anIdentifier 
]
