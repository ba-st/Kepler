"
A FixedTimeSourceTest is a test class for testing the behavior of FixedTimeSource
"
Class {
	#name : #FixedTimeSourceTest,
	#superclass : #TestCase,
	#category : 'Kepler-Time-Tests'
}

{ #category : #'tests-accessing' }
FixedTimeSourceTest >> testDateTime [

	| datetime timeSource |

	datetime := (January third , 1990) atNoon.
	timeSource := FixedTimeSource on: datetime date at: datetime timeOfDay.
	self assert: timeSource dateTime equals: (datetime date atTimeOfDay: TimeOfDay noon).

	datetime := (January fourth , 1990) atMidnight.
	timeSource := FixedTimeSource on: datetime.
	self assert: timeSource dateTime equals: datetime
]

{ #category : #'tests-accessing' }
FixedTimeSourceTest >> testSetTimeTo [

	| date timeSource |

	date := January third , 1990.
	timeSource := FixedTimeSource on: date at: TimeOfDay noon.
	self assert: timeSource dateTime equals: date atNoon.

	timeSource setTimeTo: TimeOfDay midnight.
	self assert: timeSource dateTime equals: date atMidnight
]
