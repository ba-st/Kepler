tests
testDateTime

	| datetime timeSource allowedDrift |

	timeSource := SystemTimeSource new.
	allowedDrift := TimeUnits second with: 1.
	datetime := GregorianCalendar currentDateTime.
	self assert: (timeSource dateTime between: datetime and: (datetime next: allowedDrift))