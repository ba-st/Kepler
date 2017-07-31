tests
testGettingSystemImplementingInterfaceFailsDueToImplementationNotFound

	| system |

	system := CompositeSystem of: #().

	self
		should: [ system systemImplementing: #TimeSystemInterface ]
		raise: Error
		withExceptionDo: [ :signal | self assert: signal messageText equals: 'System implementing ''Time System Interface'' not found' ]