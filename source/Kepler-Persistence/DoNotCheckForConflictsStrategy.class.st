"
I will not perform any conflict checking
"
Class {
	#name : #DoNotCheckForConflictsStrategy,
	#superclass : #ConflictCheckingStrategy,
	#category : #'Kepler-Persistence'
}

{ #category : #Evaluating }
DoNotCheckForConflictsStrategy >> assertNoConflictsFor: objectInMemory in: aRepository [ 

	
]

{ #category : #Evaluating }
DoNotCheckForConflictsStrategy >> assertNoConflictsFor: updatedObjectInMemory in: aRepository excluding: originalObjectInMemory [ 

	
]
