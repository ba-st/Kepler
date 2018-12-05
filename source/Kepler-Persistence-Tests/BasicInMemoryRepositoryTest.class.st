"
I have the Unit Tests for the In Memory Repository implementation. 
"
Class {
	#name : #BasicInMemoryRepositoryTest,
	#superclass : #RepositoryBasedTest,
	#category : #'Kepler-Persistence-Tests'
}

{ #category : #initialization }
BasicInMemoryRepositoryTest >> setUpRepositoryWith: aConflictCheckingStrategy [

	repository := InMemoryRepository checkingConflictsAccordingTo: aConflictCheckingStrategy
]
