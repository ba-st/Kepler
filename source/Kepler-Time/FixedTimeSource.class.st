"
I'm a TimeSource.

I provide a fixed previously given date and time. I exist only for testing purposes.

"
Class {
	#name : 'FixedTimeSource',
	#superclass : 'TimeSource',
	#instVars : [
		'dateTime'
	],
	#category : 'Kepler-Time',
	#package : 'Kepler-Time'
}

{ #category : 'instance creation' }
FixedTimeSource class >> on: aDateTime [

	^ self new initializeOn: aDateTime
]

{ #category : 'instance creation' }
FixedTimeSource class >> on: aDate at: aTimeOfDay [

	^ self on: (DateTime date: aDate timeOfDay: aTimeOfDay)
]

{ #category : 'accessing' }
FixedTimeSource >> dateTime [

	^ dateTime 
	
]

{ #category : 'initialize-release' }
FixedTimeSource >> initializeOn: aDateTime [ 

	dateTime := aDateTime
]

{ #category : 'accessing' }
FixedTimeSource >> setTimeTo: aTimeOfDay [

	dateTime := DateTime date: dateTime date timeOfDay: aTimeOfDay	
]
