tests
testWontStartWhenRequiredSystemNotFound

	| system |

	system := CompositeSystem of: (Array with: TestSystem new).

	self should: [ system startUp ] raise: SystemImplementationNotFound