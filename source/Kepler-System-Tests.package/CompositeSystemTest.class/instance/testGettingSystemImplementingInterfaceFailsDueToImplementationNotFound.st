tests
testGettingSystemImplementingInterfaceFailsDueToImplementationNotFound

	| system |

	system := CompositeSystem of: #().

	self
		should: [ system systemImplementing: TimeSystemInterface ]
		raise: SystemImplementationNotFound