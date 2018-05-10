Extension { #name : #SystemBasedUserStoryTest }

{ #category : #'*Kepler-System-Tests' }
SystemBasedUserStoryTest >> requireTestSystem [

	systemBuilder add: TestSystem new
]

{ #category : #'*Kepler-System-Tests' }
SystemBasedUserStoryTest >> systemForTest [

	^ rootSystem systemImplementing: #TestInterface
]
