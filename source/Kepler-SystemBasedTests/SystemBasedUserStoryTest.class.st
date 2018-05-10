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

	^ (September sixth , 2015) atNoon
]

{ #category : #'accessing-system' }
SystemBasedUserStoryTest >> timeSystem [

	^ rootSystem systemImplementing: #TimeSystemInterface

]
