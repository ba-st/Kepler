tests
testNotifyingEventSendingKeyworkMessage

	self eventNotificationSystem subscribe: self to: TestEvent toBeNotifiedSending: #setHasBeenNotifiedUsing:.
	self deny: hasBeenNotified.

	self eventNotificationSystem notifySubscribersTo: TestEvent new.
	self assert: hasBeenNotified