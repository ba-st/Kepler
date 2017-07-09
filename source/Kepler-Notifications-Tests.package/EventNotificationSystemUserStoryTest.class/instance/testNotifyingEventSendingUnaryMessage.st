tests
testNotifyingEventSendingUnaryMessage

	self eventNotificationSystem notifySubscribersTo: NotifiableEvent new.
	self deny: hasBeenNotified.

	self eventNotificationSystem subscribe: self to: NotifiableEvent toBeNotifiedSending: #setHasBeenNotifiedToTrue.
	self deny: hasBeenNotified.

	self eventNotificationSystem notifySubscribersTo: NotifiableEvent new.
	self assert: hasBeenNotified