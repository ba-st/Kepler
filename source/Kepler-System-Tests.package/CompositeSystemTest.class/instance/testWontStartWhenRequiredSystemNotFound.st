tests
testWontStartWhenRequiredSystemNotFound

	| system |

	system := CompositeSystem
		of: (Array with: (DataManagementSystem using: (FixedNumberProvider providing: 1))).

	self should: [ system startUp ] raise: SystemImplementationNotFound