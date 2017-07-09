tests-accessing
testSetTimeTo

	| date timeSource |

	date := January third , 1990.
	timeSource := FixedTimeSource on: date at: TimeOfDay noon.
	self assert: timeSource dateTime equals: date atNoon.

	timeSource setTimeTo: TimeOfDay midnight.
	self assert: timeSource dateTime equals: date atMidnight