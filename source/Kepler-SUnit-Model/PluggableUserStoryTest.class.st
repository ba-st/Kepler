"
I'm a kind of configurable user story test. 
My intention is to be used in composition relations with other tests that cannot subclass directly SystemBasedUserStoryTest.
The users just need to provide a block configuring the requirements.
"
Class {
	#name : #PluggableUserStoryTest,
	#superclass : #SystemBasedUserStoryTest,
	#instVars : [
		'requirementSetUp'
	],
	#category : #'Kepler-SUnit-Model'
}

{ #category : #'instance creation' }
PluggableUserStoryTest class >> requiring: aRequirementSetUpBlock [

	^self new initializeRequiring: aRequirementSetUpBlock
]

{ #category : #initialization }
PluggableUserStoryTest >> initializeRequiring: aRequirementSetUpBlock [

	requirementSetUp := aRequirementSetUpBlock
]

{ #category : #accessing }
PluggableUserStoryTest >> rootSystem [

	^ rootSystem
]

{ #category : #'private - running' }
PluggableUserStoryTest >> setUpRequirements [

	requirementSetUp value: self
]
