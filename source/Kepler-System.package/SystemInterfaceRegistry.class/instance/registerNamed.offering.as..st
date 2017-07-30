registration
registerNamed: aName offering: messagesSet as: aKey

	interfaces
		at: aKey
		put: (SystemInterface named: aName offering: messagesSet)