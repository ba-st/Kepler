"
I'm a Subscription.

I know what message to send to a subscriber each time the event notification system receives an event.
"
Class {
	#name : 'Subscription',
	#superclass : 'Object',
	#instVars : [
		'eventType',
		'subscriber',
		'message'
	],
	#category : 'Kepler-Notifications',
	#package : 'Kepler-Notifications'
}

{ #category : 'instance creation' }
Subscription class >> of: aSubjectOfInterest to: anEventType toBeNotifiedSending: aMessage [

	AssertionChecker
				enforce: [ aMessage argumentCount < 2 ]
				because: 'Selector should have zero or one argument at most'.

	^ self new
		  initializeOf: aSubjectOfInterest
		  to: anEventType
		  toBeNotifiedSending: aMessage
]

{ #category : 'accessing' }
Subscription >> eventType [

	^ eventType
]

{ #category : 'initialization' }
Subscription >> initializeOf: aSubscriber to: anEventType toBeNotifiedSending: aMessage [ 
	
	subscriber := aSubscriber.
	eventType := anEventType.
	message := aMessage 
]

{ #category : 'accessing' }
Subscription >> message [
	
	^ message 
]

{ #category : 'notifying' }
Subscription >> notifyAbout: anEvent [

	message argumentCount = 0
		ifTrue: [ subscriber perform: message ]
		ifFalse: [
		subscriber perform: message with:  anEvent ]
]

{ #category : 'accessing' }
Subscription >> subscriber [

	^ subscriber
]
