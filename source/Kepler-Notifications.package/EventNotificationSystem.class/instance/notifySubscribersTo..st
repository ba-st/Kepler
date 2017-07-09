notifying
notifySubscribersTo: anEvent

	subscriptions
		select: [ :subscription | subscription eventType = anEvent class ]
		thenDo: [ :subscription | 
			(MessageSend receiver: subscription subscriber selector: subscription message)
				cull: anEvent ]