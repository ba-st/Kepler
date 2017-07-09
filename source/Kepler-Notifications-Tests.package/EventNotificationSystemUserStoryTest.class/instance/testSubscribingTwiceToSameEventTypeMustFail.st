tests
testSubscribingTwiceToSameEventTypeMustFail

	self eventNotificationSystem subscribe: self to: NotifiableEvent toBeNotifiedSending: #setHasBeenNotifiedToTrue.

	self should: [ self eventNotificationSystem subscribe: self to: NotifiableEvent toBeNotifiedSending: #setHasBeenNotifiedToTrue ] raise: ObjectAlreadyInSystem