Class {
	#name : #EventNotificationSystem,
	#superclass : #System,
	#instVars : [
		'subscriptions'
	],
	#category : 'Kepler-Notifications'
}

{ #category : #'system specification' }
EventNotificationSystem class >> implementedInterface [

	^ SystemInterface >> #EventNotificationSystemInterface
]

{ #category : #'private-subscribing' }
EventNotificationSystem >> assertNotExists: aSubscriber subscribedTo: anEventType [

	subscriptions
		detect: [ :subscription | 
			subscription subscriber = aSubscriber
				and: [ subscription eventType = anEventType ] ]
		ifFound: [ ConflictingObjectFound
				signal: 'Object already subscribed to this event type.' ]
]

{ #category : #'initialize-release' }
EventNotificationSystem >> initialize [

	super initialize.
	subscriptions := OrderedCollection new
	
]

{ #category : #notifying }
EventNotificationSystem >> notifySubscribersTo: anEvent [

	subscriptions
		select: [ :subscription | subscription eventType = anEvent class ]
		thenDo: [ :subscription | 
			(MessageSend receiver: subscription subscriber selector: subscription message)
				cull: anEvent ]
]

{ #category : #'dependency resolution' }
EventNotificationSystem >> resolveDependecies [

	"do nothing"
]

{ #category : #subscribing }
EventNotificationSystem >> revokeSubscriptionTo: anEventType of: aSubscriber [

	subscriptions
		detect: [ :subscription | 
			subscription subscriber = aSubscriber
				and: [ subscription eventType = anEventType ] ]
		ifFound: [ :subscription | subscriptions remove: subscription ]
		ifNone: [ ObjectNotFound signal: 'No subscription was found to this event type.' ]
]

{ #category : #subscribing }
EventNotificationSystem >> subscribe: aSubscriber to: anEventType toBeNotifiedSending: aMessage [

	self assertNotExists: aSubscriber subscribedTo: anEventType. 

	subscriptions
		add: (Subscription of: aSubscriber to: anEventType toBeNotifiedSending: aMessage)
]

{ #category : #accessing }
EventNotificationSystem >> subscriptions [

	^ subscriptions copy
]
