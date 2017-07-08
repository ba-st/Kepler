tests
testSendingAnyMessageSignalsError

	| unresolvedSystemDependency |

	unresolvedSystemDependency := UnresolvedSystemDependency to: TimeSystemInterface.
	self
		should: [ unresolvedSystemDependency dateTime ]
		raise: Error
		withDescription: 'Unresolved system dependency to Time System Interface'