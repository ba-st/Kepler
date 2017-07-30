tests
testSendingAnyMessageSignalsError

	| unresolvedSystemDependency |

	unresolvedSystemDependency := UnresolvedSystemDependency to: Interfaces >> #TimeSystemInterface.
	self
		should: [ unresolvedSystemDependency dateTime ]
		raise: Error
		whoseDescriptionIncludes: 'Unresolved system dependency to Time System Interface'
		description: 'Expected: Unresolved system dependency to Time System Interface'