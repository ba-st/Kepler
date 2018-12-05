"
I'm an in-memory repository. I will keep the managed objects in an OrderedCollection and I will not provide transactional semantics.

I'm useful for testing purposes and initial prototyping.
"
Class {
	#name : #InMemoryRepository,
	#superclass : #Repository,
	#instVars : [
		'conflictCheckingStrategy',
		'contents'
	],
	#category : #'Kepler-Persistence'
}

{ #category : #'instance creation' }
InMemoryRepository class >> checkingConflictsAccordingTo: aConflictCheckingStrategy [

	^self new initializeCheckingConflictsAccordingTo: aConflictCheckingStrategy
]

{ #category : #'instance creation' }
InMemoryRepository class >> withoutCheckingConflicts [

	^ self checkingConflictsAccordingTo: DoNotCheckForConflictsStrategy new
]

{ #category : #'private - management' }
InMemoryRepository >> basicPurge: aDomainObject [

	contents
		remove: aDomainObject
		ifAbsent: [ 
			DataInconsistencyFound
				signal: ( '<1p> was expected to be found in the contents, but it was not.' expandMacrosWith: aDomainObject )
			].
	^ aDomainObject
]

{ #category : #'private - management' }
InMemoryRepository >> basicStore: aDomainObject [

	contents add: aDomainObject.
	^ aDomainObject
]

{ #category : #'private - management' }
InMemoryRepository >> basicUpdate: aDomainObject with: anUpdatedDomainObject [

	self basicPurge: aDomainObject.
	aDomainObject synchronizeWith: anUpdatedDomainObject.
	self basicStore: aDomainObject.
	^ aDomainObject
]

{ #category : #configuring }
InMemoryRepository >> configureMappingsIn: aBlock [

	
]

{ #category : #'private - accessing' }
InMemoryRepository >> conflictCheckingStrategy [

	^ conflictCheckingStrategy
]

{ #category : #querying }
InMemoryRepository >> countMatching: aCriteriaOrBlockClosure [

	^ contents count: ( self asMatchingCriteria: aCriteriaOrBlockClosure )
]

{ #category : #querying }
InMemoryRepository >> findAll [

	^ contents copy
]

{ #category : #querying }
InMemoryRepository >> findAllMatching: aCriteriaOrBlock [

	^ contents select: ( self asMatchingCriteria: aCriteriaOrBlock )
]

{ #category : #querying }
InMemoryRepository >> findAllMatching: aCriteriaOrBlock sortedBy: aSortFunction [

	^ ( self findAllMatching: aCriteriaOrBlock ) sorted: aSortFunction
]

{ #category : #initialization }
InMemoryRepository >> initializeCheckingConflictsAccordingTo: aConflictCheckingStrategy [

	conflictCheckingStrategy := aConflictCheckingStrategy.
	contents := OrderedCollection new
]

{ #category : #'private - accessing' }
InMemoryRepository >> matchingCriteriaBuilder [

	^ InMemoryRepositoryMatchingCriteriaBuilder  new
]

{ #category : #management }
InMemoryRepository >> purgeAllMatching: aCriteriaOrBlock [

	contents := contents reject: ( self asMatchingCriteria: aCriteriaOrBlock )
]

{ #category : #management }
InMemoryRepository >> update: aMutableDomainObject executing: aBlock [

	aBlock value: aMutableDomainObject
]

{ #category : #querying }
InMemoryRepository >> withOneMatching: aCriteriaOrBlock do: foundBlock else: noneBlock [

	^ contents detect: ( self asMatchingCriteria: aCriteriaOrBlock ) ifFound: foundBlock ifNone: noneBlock
]

{ #category : #querying }
InMemoryRepository >> withOneMatching: aCriteriaOrBlock sortedBy: aSortFunction do: foundBlock else: noneBlock [

	^ ( contents sorted: aSortFunction ) detect: ( self asMatchingCriteria: aCriteriaOrBlock ) ifFound: foundBlock ifNone: noneBlock
]
