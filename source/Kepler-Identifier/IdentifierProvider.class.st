Class {
	#name : #IdentifierProvider,
	#superclass : #Object,
	#category : 'Kepler-Identifier'
}

{ #category : #providing }
IdentifierProvider >> next [

	^ self subclassResponsibility 
]
