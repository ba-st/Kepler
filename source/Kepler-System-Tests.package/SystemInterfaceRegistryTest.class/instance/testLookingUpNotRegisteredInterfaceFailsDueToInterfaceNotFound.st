tests
testLookingUpNotRegisteredInterfaceFailsDueToInterfaceNotFound

	| registry |

	registry := SystemInterfaceRegistry empty.

	self should: [ registry >> #AnotherTestInterface ] raise: Error withExceptionDo: [ :signal | self assert: signal messageText equals: 'System interface not found under #AnotherTestInterface' ]