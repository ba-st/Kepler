"
I'm a SubsystemImplementation.

I'm a system that provides the date, the time of day or both.
"
Class {
	#name : 'TimeSystem',
	#superclass : 'SubsystemImplementation',
	#instVars : [
		'timeSource'
	],
	#category : 'Kepler-Time',
	#package : 'Kepler-Time'
}

{ #category : 'registering' }
TimeSystem class >> registerInterfaces [
<ignoreForCoverage>
	self
		registerInterfaceAt: #TimeSystemInterface
		named: 'Time System Interface'
		declaring: #( #dateTime #timeOfDay )
]

{ #category : 'instance creation' }
TimeSystem class >> using: aTimeSource [ 

	^ self new initializeUsing: aTimeSource 
]

{ #category : 'accessing' }
TimeSystem >> date [

	^ timeSource dateTime date
]

{ #category : 'accessing' }
TimeSystem >> dateTime [

	^ timeSource dateTime
]

{ #category : 'installing' }
TimeSystem >> dependencies [

	^ #()
]

{ #category : 'installing' }
TimeSystem >> implementedInterfaces [

	^ #(#TimeSystemInterface)
]

{ #category : 'initialize-release' }
TimeSystem >> initializeUsing: aTimeSource [

	timeSource := aTimeSource
]

{ #category : 'accessing' }
TimeSystem >> name [

	^ 'Time System'
]

{ #category : 'accessing' }
TimeSystem >> timeOfDay [

	^ self dateTime timeOfDay
]
