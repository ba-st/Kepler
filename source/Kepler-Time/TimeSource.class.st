"
I'm a TimeSource. 

I provide a date and time.
"
Class {
	#name : 'TimeSource',
	#superclass : 'Object',
	#category : 'Kepler-Time',
	#package : 'Kepler-Time'
}

{ #category : 'accessing' }
TimeSource >> dateTime [
	
	self subclassResponsibility  
	
]
