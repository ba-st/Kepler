tests
testSubscribing

	self eventNotificationSystem subscribe: self to: NotifiableEvent toBeNotifiedSending: #setHasBeenNotifiedToTrue.
	self assert: self eventNotificationSystem subscriptions size equals: 1