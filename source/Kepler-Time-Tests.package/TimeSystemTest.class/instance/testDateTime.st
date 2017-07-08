tests-accessing
testDateTime

	| timeSystem |

	timeSystem := TimeSystem using: timeSource.
	self assert: timeSystem dateTime equals: timeSource dateTime