"
I'm a Shared Pool providing access to the Kepler namespace
"
Class {
	#name : #Kepler,
	#superclass : #SharedPool,
	#classVars : [
		'SystemInterfaces'
	],
	#category : #'Kepler-System'
}

{ #category : #'class initialization' }
Kepler class >> initialize [

	<ignoreForCoverage>
	SystemInterfaces := Namespace new
]

{ #category : #configuring }
Kepler class >> register: anInterface as: anInterfaceKey [

	SystemInterfaces bind: anInterfaceKey to: anInterface
]
