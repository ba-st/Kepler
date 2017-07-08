tests
testSendingMessagesToSystemWithUnresolvedSystemDependencyFails

	| system |

	system := CompositeSystem of: (Array with: TestSystem new).

	self
		should: [ (system systemImplementing: TestInterface) currentDateTime ]
		raise: Error
		whoseDescriptionIncludes: 'Unresolved system dependency to Time System Interface'
		description: 'Expected: Unresolved system dependency to Time System Interface'