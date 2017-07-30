actions
registerEventNotificationSystemInterface

	self
		registerInterfaceAs: #EventNotificationSystemInterface
		named: 'Event Notification System Interface'
		offering:
			#(#subscribe:to:toBeNotifiedSending: #revokeSubscriptionTo:of: #notifySubscribersTo:)