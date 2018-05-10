"
A SystemTimeSourceTest is a test class for testing the behavior of SystemTimeSource
"
Class {
	#name : #SystemTimeSourceTest,
	#superclass : #TestCase,
	#category : 'Kepler-Time-Tests'
}

{ #category : #tests }
SystemTimeSourceTest >> testDateTime [

	| datetime timeSource allowedDrift |

	timeSource := SystemTimeSource new.
	allowedDrift := TimeUnits second with: 1.
	datetime := GregorianCalendar currentDateTime.
	self assert: (timeSource dateTime between: datetime and: (datetime next: allowedDrift))
]
