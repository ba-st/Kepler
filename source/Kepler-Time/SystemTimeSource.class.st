Class {
	#name : #SystemTimeSource,
	#superclass : #TimeSource,
	#category : 'Kepler-Time'
}

{ #category : #accessing }
SystemTimeSource >> dateTime [

	^ GregorianCalendar currentDateTime 
]
