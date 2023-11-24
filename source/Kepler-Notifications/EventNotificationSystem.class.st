"
I'm SubsystemImplementation.

I'm an event notification system and I manage subscriptions allowing to create or revoke them. Also, I receive events and notify their subscribers. 
"
Class {
	#name : 'EventNotificationSystem',
	#superclass : 'SubsystemImplementation',
	#instVars : [
		'subscriptions'
	],
	#category : 'Kepler-Notifications',
	#package : 'Kepler-Notifications'
}

{ #category : 'registering' }
EventNotificationSystem class >> registerInterfaces [
<ignoreForCoverage>
	self
		registerInterfaceAt: #EventNotificationSystemInterface
		named: 'Event Notification System Interface'
		declaring: #( #subscribe:to:toBeNotifiedSending:
			   #revokeSubscriptionTo:of: #notifySubscribersTo: )
]

{ #category : 'private - subscribing' }
EventNotificationSystem >> assertNotExists: aSubscriber subscribedTo: anEventType [

	subscriptions
		detect: [ :subscription | 
			subscription subscriber = aSubscriber
				and: [ subscription eventType = anEventType ] ]
		ifFound: [ ConflictingObjectFound
				signal: 'Object already subscribed to this event type.' ]
]

{ #category : 'installing' }
EventNotificationSystem >> dependencies [

	^ #()
]

{ #category : 'installing' }
EventNotificationSystem >> implementedInterfaces [

	^ #(#EventNotificationSystemInterface)
]

{ #category : 'initialization' }
EventNotificationSystem >> initialize [

	super initialize.
	subscriptions := OrderedCollection new
	
]

{ #category : 'accessing' }
EventNotificationSystem >> name [

	^ 'Event Notification'
]

{ #category : 'notifying' }
EventNotificationSystem >> notifySubscribersTo: anEvent [

	subscriptions
		select: [ :subscription | subscription eventType = anEvent class ]
		thenDo: [ :subscription | subscription notifyAbout: anEvent ]
]

{ #category : 'subscribing' }
EventNotificationSystem >> revokeSubscriptionTo: anEventType of: aSubscriber [

	subscriptions
		detect: [ :subscription | 
			subscription subscriber = aSubscriber
				and: [ subscription eventType = anEventType ] ]
		ifFound: [ :subscription | subscriptions remove: subscription ]
		ifNone: [ ObjectNotFound signal: 'No subscription was found to this event type.' ]
]

{ #category : 'subscribing' }
EventNotificationSystem >> subscribe: aSubscriber to: anEventType toBeNotifiedSending: aMessage [

	self assertNotExists: aSubscriber subscribedTo: anEventType. 

	subscriptions
		add: (Subscription of: aSubscriber to: anEventType toBeNotifiedSending: aMessage)
]

{ #category : 'accessing' }
EventNotificationSystem >> subscriptions [

	^ subscriptions copy
]
