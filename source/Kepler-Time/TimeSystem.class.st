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

{ #category : #installing }
TimeSystem >> dependencies [

	^ #()
]

{ #category : #installing }
TimeSystem >> implementedInterfacesDo: aBlock [

	aBlock value: #TimeSystemInterface
]

{ #category : #'initialize-release' }
TimeSystem >> initializeUsing: aTimeSource [

	timeSource := aTimeSource
]

{ #category : #accessing }
TimeSystem >> name [

	^ 'Time System'
]

{ #category : #accessing }
TimeSystem >> timeOfDay [

	^ self dateTime timeOfDay
]
