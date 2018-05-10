Class {
	#name : #SystemInterfaceRegistryTest,
	#superclass : #TestCase,
	#category : 'Kepler-System-Tests'
}

{ #category : #tests }
SystemInterfaceRegistryTest >> testInterfaceRegistration [

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
]

{ #category : #tests }
SystemInterfaceRegistryTest >> testLookingUpNotRegisteredInterfaceFailsDueToInterfaceNotFound [

	| registry |

	registry := SystemInterfaceRegistry empty.

	self should: [ registry >> #AnotherTestInterface ] raise: Error withExceptionDo: [ :signal | self assert: signal messageText equals: 'System interface not found under #AnotherTestInterface' ]
]
