tests
testLookingUpNotRegisteredInterfaceFailsDueToInterfaceNotFound

	| registry |

	registry := SystemInterfaceRegistry empty.

	self
		should: [ registry >> #AnotherTestInterface ]
		raise: SystemInterfaceNotFound
		whoseDescriptionIncludes: 'System interface not found under #AnotherTestInterface'
		description: 'SystemInterfaceNotFound: System interface not found under #AnotherTestInterface'