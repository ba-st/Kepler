tests
testStartUpAndShutDown

	| system testSystem |

	testSystem := TestSystem new.

	system := CompositeSystem of: (Array with: testSystem with: self timeSystem).
	self deny: testSystem isStarted.
	system startUp.
	self assert: testSystem isStarted.
	system shutDown.
	self deny: testSystem isStarted