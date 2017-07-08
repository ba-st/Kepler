private-subscribing
assertNotExists: aSubscriber subscribedTo: anEventType

	subscriptions
		detect: [ :subscription | 
			subscription subscriber = aSubscriber
				and: [ subscription eventType = anEventType ] ]
		ifFound: [ ObjectAlreadyInSystem
				signal: 'Object already subscribed to this event type.' ]