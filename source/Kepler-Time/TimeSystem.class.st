"
A TimeSystem is a system that provides time.

Instance Variables
	timeSource:		<Object>

timeSource
	- xxxxx

"
Class {
	#name : #TimeSystem,
	#superclass : #SubsystemImplementation,
	#instVars : [
		'timeSource'
	],
	#category : #'Kepler-Time'
}

{ #category : #'system specification' }
TimeSystem class >> implementedInterface [

	^ SystemInterface >> #TimeSystemInterface
]

{ #category : #'class initialization' }
TimeSystem class >> initialize [

	SystemInterface bind: #TimeSystemInterface to: (Interface named: 'Time System Interface' declaring: #(#dateTime #timeOfDay))
]

{ #category : #'instance creation' }
TimeSystem class >> using: aTimeSource [ 

	^ self new initializeUsing: aTimeSource 
]

{ #category : #accessing }
TimeSystem >> date [

	^ timeSource dateTime date
]

{ #category : #accessing }
TimeSystem >> dateTime [

	^ timeSource dateTime
]

{ #category : #'initialize-release' }
TimeSystem >> initializeUsing: aTimeSource [ 

	super initialize.
	timeSource := aTimeSource 
]

{ #category : #'dependency resolution' }
TimeSystem >> resolveDependecies [

	"do nothing"
]

{ #category : #'starting-stopping' }
TimeSystem >> shutDown [

	"do nothing"

	
]

{ #category : #accessing }
TimeSystem >> timeOfDay [

	^ self dateTime timeOfDay
]
