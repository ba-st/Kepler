tests
testCreationAndAccessing

	| interface |

	interface := SystemInterface named: 'The interface name' offering: #(#message1 #message2 #aKeyworded:message:).
	self
		assert: interface name equals: 'The interface name';
		assertCollection: interface messages equals: #(#message1 #message2 #aKeyworded:message:)