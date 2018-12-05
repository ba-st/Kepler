"
I'm an abstract class defining the protocol required for conflict checking.
Repository instances can be configured with a conflict checking strategy, so when a 
domain object is stored or upated the appropiate message will be dispatched to the 
strategy.

Public API and Key Messages

- #assertNoConflictsFor:in: will be sent before the repository stores an object to check for conflicts with the new object.
- #assertNoConflictsFor:in:excluding: will be sent before the repository updates an object with a new version of it.

In case a conflict is detected I will raise a ConflictingObjectFound exception.
"
Class {
	#name : #ConflictCheckingStrategy,
	#superclass : #Object,
	#category : #'Kepler-Persistence'
}

{ #category : #Evaluating }
ConflictCheckingStrategy >> assertNoConflictsFor: objectInMemory in: aRepository [ 

	self subclassResponsibility
]

{ #category : #Evaluating }
ConflictCheckingStrategy >> assertNoConflictsFor: updatedObjectInMemory in: aRepository excluding: originalObjectInMemory [ 

	self subclassResponsibility
]
