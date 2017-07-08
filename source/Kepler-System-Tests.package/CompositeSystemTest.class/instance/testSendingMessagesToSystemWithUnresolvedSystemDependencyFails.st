tests
testSendingMessagesToSystemWithUnresolvedSystemDependencyFails

	| system |

	system := CompositeSystem
		of: (Array with: (DataManagementSystem using: (FixedNumberProvider providing: 1))).

	self
		should: [ ((system systemImplementing: DataManagementSystemInterface)
				registerChannelNamed: 'Channel #1') ]
		raise: Error
		withDescription: 'Unresolved system dependency to Time System Interface'
