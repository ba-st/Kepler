actions
defineEventNotificationSystemInterface

	Smalltalk
		at: #EventNotificationSystemInterface
		put:
			(SystemInterface
				named: 'Event Notification System Interface'
				offering: #(#subscribe:to:toBeNotifiedSending: #revokeSubscriptionTo:of: #notifySubscribersTo:))