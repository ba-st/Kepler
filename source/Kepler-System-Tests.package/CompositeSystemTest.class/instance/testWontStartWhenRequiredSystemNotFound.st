tests
testWontStartWhenRequiredSystemNotFound

	| system |

	system := CompositeSystem of: (Array with: TestSystem new).

	self should: [ system startUp ] raise: Error withExceptionDo: [ :signal | self assert: signal messageText equals: 'System implementing ''Time System Interface'' not found' ]