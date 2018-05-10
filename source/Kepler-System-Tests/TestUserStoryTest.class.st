Class {
	#name : #TestUserStoryTest,
	#superclass : #SystemBasedUserStoryTest,
	#category : 'Kepler-System-Tests'
}

{ #category : #initialization }
TestUserStoryTest >> setUpRequirements [

	super setUpRequirements.
	self requireTimeSystem.
	self requireTestSystem
]

{ #category : #'*Kepler-System-Tests' }
TestUserStoryTest >> testCurrentDateTime [

	self assert: self timeSystem dateTime equals: self systemForTest currentDateTime
]
