Class {
	#name : #SystemInterfaceTest,
	#superclass : #TestCase,
	#category : 'Kepler-System-Tests'
}

{ #category : #tests }
SystemInterfaceTest >> testCreationAndAccessing [

	| interface |

	interface := SystemInterface named: 'The interface name' offering: #(#message1 #message2 #aKeyworded:message:).
	self
		assert: interface name equals: 'The interface name';
		assertCollection: interface messages equals: #(#message1 #message2 #aKeyworded:message:)
]

{ #category : #tests }
SystemInterfaceTest >> testPrintOn [

	| interface |

	interface := SystemInterface
		named: 'The interface name'
		offering: #(#message1 #message2 #aKeyworded:message:).
	self assert: interface printString equals: 'The interface name'
]
