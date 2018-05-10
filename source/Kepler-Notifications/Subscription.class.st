Class {
	#name : #Subscription,
	#superclass : #Object,
	#instVars : [
		'eventType',
		'subscriber',
		'message'
	],
	#category : 'Kepler-Notifications'
}

{ #category : #'instance creation' }
Subscription class >> of: aSubjectOfInterest to: anEventType toBeNotifiedSending: aMessage [

	^ self new initializeOf: aSubjectOfInterest to: anEventType toBeNotifiedSending: aMessage 
]

{ #category : #accessing }
Subscription >> eventType [

	^ eventType
]

{ #category : #'initialize-release' }
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
