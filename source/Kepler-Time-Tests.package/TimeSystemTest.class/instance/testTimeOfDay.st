tests-accessing
testTimeOfDay

	| timeSystem |

	timeSystem := TimeSystem using: timeSource.
	self assert: timeSystem timeOfDay equals: timeSource dateTime timeOfDay