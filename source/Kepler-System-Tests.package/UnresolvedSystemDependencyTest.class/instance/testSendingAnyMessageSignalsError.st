tests
testSendingAnyMessageSignalsError

	| unresolvedSystemDependency |

	unresolvedSystemDependency := UnresolvedSystemDependency to: TimeSystemInterface.
	self
		should: [ unresolvedSystemDependency dateTime ]
		raise: Error
		whoseDescriptionIncludes: 'Unresolved system dependency to Time System Interface'
		description: 'Expected: Unresolved system dependency to Time System Interface'