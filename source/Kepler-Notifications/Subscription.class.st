"
I'm a Subscription.

I know what message to send to a subscriber each time the event notification system receives an event.
"
Class {
	#name : #Subscription,
	#superclass : #Object,
	#instVars : [
		'eventType',
		'subscriber',
		'message'
	],
	#category : #'Kepler-Notifications'
}

{ #category : #'instance creation' }
Subscription class >> of: aSubjectOfInterest to: anEventType toBeNotifiedSending: aMessage [

	^ self new initializeOf: aSubjectOfInterest to: anEventType toBeNotifiedSending: aMessage 
]

{ #category : #accessing }
Subscription >> eventType [

	^ eventType
]

{ #category : #initialization }
Subscription >> initializeOf: aSubscriber to: anEventType toBeNotifiedSending: aMessage [ 
	
	subscriber := aSubscriber.
	eventType := anEventType.
	message := aMessage 
]

{ #category : #accessing }
Subscription >> message [
	
	^ message 
]

{ #category : #accessing }
Subscription >> subscriber [

	^ subscriber
]
