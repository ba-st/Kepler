"
I will perform conflict checking on store: and update:with: for the 
repository including me.

I can be easily created to check conflicts in:
- a single aspect of the stored object
- several aspects signaling conflict when all match the same time
- several aspects signaling conflict when any of this match

The users can also provide a more complex behavior.
"
Class {
	#name : #CriteriaBasedConflictCheckingStrategy,
	#superclass : #ConflictCheckingStrategy,
	#instVars : [
		'conflictCriteriaBlock'
	],
	#category : #'Kepler-Persistence'
}

{ #category : #'instance creation' }
CriteriaBasedConflictCheckingStrategy class >> accordingTo: aBlockOrMatchingCriteria [

	^ self new initializeAccordingTo: aBlockOrMatchingCriteria
]

{ #category : #private }
CriteriaBasedConflictCheckingStrategy class >> compare: objectInRepository to: objectInMemory with: aMonadycBlock [

	^ ( aMonadycBlock value: objectInRepository ) = ( aMonadycBlock value: objectInMemory )
]

{ #category : #private }
CriteriaBasedConflictCheckingStrategy class >> compare: objectInRepository to: objectInMemory withAll: aMonadycBlockCollection [

	^ aMonadycBlockCollection
		collect: [ :aMonadycBlock | self compare: objectInRepository to: objectInMemory with: aMonadycBlock ]
]

{ #category : #'instance creation' }
CriteriaBasedConflictCheckingStrategy class >> forAllIn: aMonadycBlockCollection [

	^ self
		accordingTo: [ :objectInRepository :criteria :objectInMemory | 
			criteria
				satisfyingAll: ( self compare: objectInRepository to: objectInMemory withAll: aMonadycBlockCollection )
			]
]

{ #category : #'instance creation' }
CriteriaBasedConflictCheckingStrategy class >> forAnyIn: aMonadycBlockCollection [

	^ self
		accordingTo: [ :objectInRepository :criteria :objectInMemory | 
			criteria
				satisfyingAny: ( self compare: objectInRepository to: objectInMemory withAll: aMonadycBlockCollection )
			]
]

{ #category : #'instance creation' }
CriteriaBasedConflictCheckingStrategy class >> forSingleAspectMatching: aMonadycBlock [

	^ self
		accordingTo:
			[ :objectInRepository :criteria :objectInMemory | self compare: objectInRepository to: objectInMemory with: aMonadycBlock ]
]

{ #category : #Evaluating }
CriteriaBasedConflictCheckingStrategy >> assertNoConflictsFor: objectInMemory in: aRepository [

	self
		assertNoConflictsFor: objectInMemory
		in: aRepository
		accordingTo: [ :objectInRepository :criteria | 
			conflictCriteriaBlock
				value: objectInRepository
				value: criteria
				value: objectInMemory
			]
]

{ #category : #private }
CriteriaBasedConflictCheckingStrategy >> assertNoConflictsFor: objectInMemory in: aRepository accordingTo: matchingCriteria [

	AssertionChecker
		refuse: [ ( aRepository countMatching: matchingCriteria ) strictlyPositive ]
		because: [ 'Something is in conflict with <1p>' expandMacrosWith: objectInMemory ]
		raising: ConflictingObjectFound
]

{ #category : #Evaluating }
CriteriaBasedConflictCheckingStrategy >> assertNoConflictsFor: updatedObjectInMemory in: aRepository excluding: originalObjectInMemory [

	self
		assertNoConflictsFor: updatedObjectInMemory
		in: aRepository
		accordingTo:
			[ :objectInRepository :criteria | 
				criteria 
					satisfying: ( criteria is: objectInRepository notStoredAs: originalObjectInMemory ) 
					and: [ conflictCriteriaBlock value: objectInRepository value: criteria value: updatedObjectInMemory ] ]
]

{ #category : #initialization }
CriteriaBasedConflictCheckingStrategy >> initializeAccordingTo: aBlock [

	conflictCriteriaBlock := aBlock 
]
