Class {
	#name : #TestEvent,
	#superclass : #NotifiableEvent,
	#category : 'Kepler-Notifications-Tests'
}

{ #category : #evaluating }
TestEvent >> negate: aBoolean [
 
	^ aBoolean not
]
