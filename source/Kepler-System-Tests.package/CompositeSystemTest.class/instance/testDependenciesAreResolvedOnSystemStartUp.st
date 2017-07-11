tests
testDependenciesAreResolvedOnSystemStartUp

	| system |

	system := CompositeSystem of: (Array with: TestSystem new with: self timeSystem).

	self
		should: [ (system systemImplementing: TestInterface) currentDateTime ]
		raise: Error
		whoseDescriptionIncludes: 'Unresolved system dependency to Time System Interface'
		description: 'Expected: Unresolved system dependency to Time System Interface'.

	system startUp.
	self shouldnt: [ (system systemImplementing: TestInterface) currentDateTime ] raise: Error