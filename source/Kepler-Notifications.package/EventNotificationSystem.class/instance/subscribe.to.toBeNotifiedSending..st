subscribing
subscribe: aSubscriber to: anEventType toBeNotifiedSending: aMessage

	self assertNotExists: aSubscriber subscribedTo: anEventType. 

	subscriptions
		add: (Subscription of: aSubscriber to: anEventType toBeNotifiedSending: aMessage)