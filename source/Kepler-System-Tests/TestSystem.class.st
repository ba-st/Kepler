"
I am a System used for tests, to test dependency resolution
"
Class {
	#name : #TestSystem,
	#superclass : #System,
	#instVars : [
		'timeSystem',
		'started'
	],
	#category : 'Kepler-System-Tests'
}

{ #category : #'system specification' }
TestSystem class >> implementedInterface [

	^ SystemInterface >> #TestInterface
]

{ #category : #'dependency resolution' }
TestSystem >> currentDateTime [

	^ timeSystem dateTime
]

{ #category : #'initialize-release' }
TestSystem >> initialize [

	super initialize.
	timeSystem := self unresolvedSystemDependencyTo: #TimeSystemInterface.
	started := false
]

{ #category : #'initialize-release' }
TestSystem >> isStarted [

	^ started
]

{ #category : #'dependency resolution' }
TestSystem >> resolveDependecies [

	timeSystem := self resolveSystemDependencyTo: #TimeSystemInterface
]

{ #category : #'initialize-release' }
TestSystem >> shutDown [

	started := false
]

{ #category : #'initialize-release' }
TestSystem >> startUp [

	super startUp.
	started := true
]
