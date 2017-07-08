subscribing
revokeSubscriptionTo: anEventType of: aSubscriber

	subscriptions
		detect: [ :subscription | 
			subscription subscriber = aSubscriber
				and: [ subscription eventType = anEventType ] ]
		ifFound: [ :subscription | subscriptions remove: subscription ]
		ifNone: [ ObjectNotFoundInSystem signal: 'No subscription was found to this event type.' ]