Extension { #name : #TestUserStoryTest }

{ #category : #'*Kepler-System-Tests' }
TestUserStoryTest >> testCurrentDateTime [

	self assert: self timeSystem dateTime equals: self systemForTest currentDateTime
]
