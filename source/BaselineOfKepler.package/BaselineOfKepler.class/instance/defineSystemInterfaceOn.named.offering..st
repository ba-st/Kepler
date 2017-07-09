actions
defineSystemInterfaceOn: aGlobalName named: aName offering: messagesSet

	Smalltalk at: aGlobalName put: (SystemInterface named: aName offering: messagesSet)