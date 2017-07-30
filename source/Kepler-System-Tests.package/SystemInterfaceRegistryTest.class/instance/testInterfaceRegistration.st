tests
testInterfaceRegistration

	| registry interface |

	registry := SystemInterfaceRegistry empty.
	registry
		registerNamed: 'The interface name'
		offering: #(#message1 #message2 #aKeyworded:message:)
		as: #TestInterface.

	interface := registry >> #TestInterface.
	self
		assert: interface name equals: 'The interface name';
		assertCollection: interface messages
			equals: #(#message1 #message2 #aKeyworded:message:)