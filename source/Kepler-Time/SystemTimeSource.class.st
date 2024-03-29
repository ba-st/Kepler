"
I'm a TimeSource.

I provide the system's current date and time.

"
Class {
	#name : 'SystemTimeSource',
	#superclass : 'TimeSource',
	#category : 'Kepler-Time',
	#package : 'Kepler-Time'
}

{ #category : 'accessing' }
SystemTimeSource >> dateTime [

	^ (ChaltenEnvironment calendarNamed: #GregorianCalendar) currentDateTime 
]
