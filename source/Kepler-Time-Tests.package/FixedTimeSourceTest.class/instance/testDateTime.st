tests-accessing
testDateTime

	| datetime timeSource |

	datetime := (January third , 1990) atNoon.
	timeSource := FixedTimeSource on: datetime date at: datetime timeOfDay.
	self assert: timeSource dateTime equals: (datetime date atTimeOfDay: TimeOfDay noon).

	datetime := (January fourth , 1990) atMidnight.
	timeSource := FixedTimeSource on: datetime.
	self assert: timeSource dateTime equals: datetime