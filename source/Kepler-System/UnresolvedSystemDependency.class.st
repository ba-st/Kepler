Class {
	#name : #UnresolvedSystemDependency,
	#superclass : #Object,
	#instVars : [
		'interface'
	],
	#category : 'Kepler-System'
}

{ #category : #'instance creation' }
UnresolvedSystemDependency class >> to: aSystemInterface [ 

	^ self new initializeTo: aSystemInterface
]

{ #category : #metaprogramming }
UnresolvedSystemDependency >> doesNotUnderstand: aMessage [

	Error signal: ('Unresolved system dependency to <1p>' expandMacrosWith: interface)
]

{ #category : #initialization }
UnresolvedSystemDependency >> initializeTo: aSystemInterface [

	interface := aSystemInterface 
]
