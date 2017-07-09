tests-accessing
testDate

	| timeSystem |

	timeSystem := TimeSystem using: timeSource.
	self assert: timeSystem date equals: timeSource dateTime date