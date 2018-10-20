Class {
	#name : #SystemBasedUserStoryTest,
	#superclass : #TestCase,
	#instVars : [
		'timeSource',
		'rootSystem',
		'systemBuilder'
	],
	#category : 'Kepler-SystemBasedTests'
}

{ #category : #running }
SystemBasedUserStoryTest >> buildAndStartUpSystem [

	systemBuilder := CompositeSystemBuilder new.
	self setUpRequirements.
	rootSystem := systemBuilder build.

	rootSystem startUp
]

{ #category : #'private - systems' }
SystemBasedUserStoryTest >> eventNotificationSystem [

	^ rootSystem systemImplementing: #EventNotificationSystemInterface 
]

{ #category : #configuring }
SystemBasedUserStoryTest >> requireEventNotificationSystem [

	systemBuilder add: EventNotificationSystem new
]

{ #category : #configuring }
SystemBasedUserStoryTest >> requireTimeSystem [

	systemBuilder add: (TimeSystem using: timeSource)

]

{ #category : #running }
SystemBasedUserStoryTest >> setUp [

	self setUpFixedTimeSource.
	self buildAndStartUpSystem.

]

{ #category : #running }
SystemBasedUserStoryTest >> setUpFixedTimeSource [

	timeSource := FixedTimeSource on: self systemDateTime
]

{ #category : #running }
SystemBasedUserStoryTest >> setUpRequirements [

	"Default method. Subclasses should override with the required systems for the user story test"

	
]

{ #category : #accessing }
SystemBasedUserStoryTest >> systemDateTime [

	^ (October first , 2014) atNoon
]

{ #category : #'private - systems' }
SystemBasedUserStoryTest >> timeSystem [

	^ rootSystem systemImplementing: #TimeSystemInterface

]
