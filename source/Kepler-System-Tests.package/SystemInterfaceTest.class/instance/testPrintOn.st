tests
testPrintOn

	| interface |

	interface := SystemInterface
		named: 'The interface name'
		offering: #(#message1 #message2 #aKeyworded:message:).
	self assert: interface printString equals: 'The interface name'