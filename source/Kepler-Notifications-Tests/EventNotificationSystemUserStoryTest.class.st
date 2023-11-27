Class {
	#name : 'EventNotificationSystemUserStoryTest',
	#superclass : 'SystemBasedUserStoryTest',
	#instVars : [
		'hasBeenNotified'
	],
	#category : 'Kepler-Notifications-Tests',
	#package : 'Kepler-Notifications-Tests'
}

{ #category : 'accessing' }
EventNotificationSystemUserStoryTest >> eventNotificationSystem [

	^ rootSystem >> #EventNotificationSystemInterface
]

{ #category : 'tests support' }
EventNotificationSystemUserStoryTest >> setHasBeenNotifiedToTrue [

	hasBeenNotified := true
]

{ #category : 'accessing' }
EventNotificationSystemUserStoryTest >> setHasBeenNotifiedUsing: aTestEvent [ 

	hasBeenNotified := aTestEvent negate: hasBeenNotified 
]

{ #category : 'running' }
EventNotificationSystemUserStoryTest >> setUp [

	super setUp.
	hasBeenNotified := false
]

{ #category : 'running' }
EventNotificationSystemUserStoryTest >> setUpRequirements [

	self registerSubsystem: EventNotificationSystem new
]

{ #category : 'tests' }
EventNotificationSystemUserStoryTest >> testAccessing [

	self assert: self eventNotificationSystem name equals: 'Event Notification'
]

{ #category : 'tests' }
EventNotificationSystemUserStoryTest >> testNotifyingEventSendingKeyworkMessage [

	self eventNotificationSystem subscribe: self to: TestEvent toBeNotifiedSending: #setHasBeenNotifiedUsing:.
	self deny: hasBeenNotified.

	self eventNotificationSystem notifySubscribersTo: TestEvent new.
	self assert: hasBeenNotified
]

{ #category : 'tests' }
EventNotificationSystemUserStoryTest >> testNotifyingEventSendingUnaryMessage [

	self eventNotificationSystem notifySubscribersTo: NotifiableEvent new.
	self deny: hasBeenNotified.

	self eventNotificationSystem subscribe: self to: NotifiableEvent toBeNotifiedSending: #setHasBeenNotifiedToTrue.
	self deny: hasBeenNotified.

	self eventNotificationSystem notifySubscribersTo: NotifiableEvent new.
	self assert: hasBeenNotified
]

{ #category : 'tests' }
EventNotificationSystemUserStoryTest >> testRevokingSubscription [

	self eventNotificationSystem subscribe: self to: NotifiableEvent toBeNotifiedSending: #setHasBeenNotifiedToTrue.
	self assert: self eventNotificationSystem subscriptions size equals: 1.

	self eventNotificationSystem revokeSubscriptionTo: NotifiableEvent of: self.
	self assert: self eventNotificationSystem subscriptions isEmpty
]

{ #category : 'tests' }
EventNotificationSystemUserStoryTest >> testSubscribing [

	self eventNotificationSystem subscribe: self to: NotifiableEvent toBeNotifiedSending: #setHasBeenNotifiedToTrue.
	self assert: self eventNotificationSystem subscriptions size equals: 1
]

{ #category : 'tests' }
EventNotificationSystemUserStoryTest >> testSubscribingTwiceToSameEventTypeMustFail [

	self eventNotificationSystem subscribe: self to: NotifiableEvent toBeNotifiedSending: #setHasBeenNotifiedToTrue.

	self should: [ self eventNotificationSystem subscribe: self to: NotifiableEvent toBeNotifiedSending: #setHasBeenNotifiedToTrue ] raise: ConflictingObjectFound
]
