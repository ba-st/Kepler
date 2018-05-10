"
An IntegerNumbering provides sequential integer numbers.

"
Class {
	#name : #SequentialNumberProvider,
	#superclass : #IdentifierProvider,
	#instVars : [
		'last'
	],
	#category : 'Kepler-Identifier'
}

{ #category : #'initialize-release' }
SequentialNumberProvider >> initialize [

	super initialize.
	last := 0
]

{ #category : #providing }
SequentialNumberProvider >> next [

	^ last := last + 1
]
