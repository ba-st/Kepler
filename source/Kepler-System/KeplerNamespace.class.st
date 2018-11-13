Class {
	#name : #KeplerNamespace,
	#superclass : #SharedPool,
	#classVars : [
		'SystemInterface'
	],
	#category : #'Kepler-System'
}

{ #category : #'class initialization' }
KeplerNamespace class >> initialize [

	<ignoreForCoverage>
	SystemInterface := Namespace new
]
