tests
testRevokingSubscription

	self eventNotificationSystem subscribe: self to: NotifiableEvent toBeNotifiedSending: #setHasBeenNotifiedToTrue.
	self assert: self eventNotificationSystem subscriptions size equals: 1.

	self eventNotificationSystem revokeSubscriptionTo: NotifiableEvent of: self.
	self assert: self eventNotificationSystem subscriptions isEmpty