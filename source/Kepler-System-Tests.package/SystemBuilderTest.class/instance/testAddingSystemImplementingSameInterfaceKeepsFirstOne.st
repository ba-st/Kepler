tests
testAddingSystemImplementingSameInterfaceKeepsFirstOne

	| system timeSystem builder anotherTimeSystem |

	timeSystem := TimeSystem
		using: (FixedTimeSource on: September tenth , 2015 at: TimeOfDay noon).

	anotherTimeSystem := TimeSystem
		using: (FixedTimeSource on: September tenth , 2016 at: TimeOfDay noon).

	builder := CompositeSystemBuilder new.
	builder add: timeSystem.
	builder add: anotherTimeSystem.
	system := builder build.

	self assert: (system systemImplementing: TimeSystemInterface) equals: timeSystem