Class {
	#name : #CompositeSystemBuilder,
	#superclass : #Object,
	#instVars : [
		'systems'
	],
	#category : 'Kepler-System'
}

{ #category : #configuring }
CompositeSystemBuilder >> add: aSystem [

	systems at: aSystem class implementedInterface ifAbsentPut: aSystem
]

{ #category : #building }
CompositeSystemBuilder >> build [

	^ CompositeSystem of: systems
]

{ #category : #'initialize-release' }
CompositeSystemBuilder >> initialize [

	super initialize.
	systems := Dictionary new.
]
