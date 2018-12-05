"
A Repository mediates between the domain and data mapping layers, acting like an in-memory domain object collection. 
Client objects construct query specifications declaratively and submit them to Repository for satisfaction. 
Objects can be added to and removed from the Repository, as they can from a simple collection of objects, and the 
mapping code encapsulated by the Repository will carry out the appropriate operations behind the scenes. 

Conceptually, a Repository encapsulates the set of objects persisted in a data store and the operations performed 
over them, providing a more object-oriented view of the persistence layer. 

Repository also supports the objective of achieving a clean separation and one-way dependency between the domain 
and data mapping layers.

I support two main APIs:
- Management: API to store, purge and update managed objects 
- Querying: API to find and retrieve objects

My concrete subclasses can support a mapping building API in the cases it's needed.
"
Class {
	#name : #Repository,
	#superclass : #Object,
	#category : #'Kepler-Persistence'
}

{ #category : #'private - accessing' }
Repository >> asMatchingCriteria: aBlockOrCriteria [

	^ aBlockOrCriteria asMatchingCriteriaIn: self
]

{ #category : #'private - preconditions' }
Repository >> assertIncludes: inMemoryObject [

	AssertionChecker
		enforce: [ ( self countMatching: [ :objectInRepository :criteria | criteria is: objectInRepository storedAs: inMemoryObject ] ) strictlyPositive ]
		because: [ '<1p> was not found.' expandMacrosWith: inMemoryObject ]
		raising: ObjectNotFound
]

{ #category : #'private - preconditions' }
Repository >> assertNoConflictsFor: aDomainObject [

	self conflictCheckingStrategy assertNoConflictsFor: aDomainObject in: self
]

{ #category : #'private - preconditions' }
Repository >> assertNoConflictsFor: anUpdatedDomainObject excluding: aDomainObject [

	self conflictCheckingStrategy assertNoConflictsFor: anUpdatedDomainObject in: self excluding: aDomainObject
]

{ #category : #'private - management' }
Repository >> basicPurge: aDomainObject [

	"aDomainObject is managed in the repository, now needs to be purged."

	^ self subclassResponsibility
]

{ #category : #'private - management' }
Repository >> basicStore: aDomainObject [

	"aDomainObject was not found in conflict according to the conflict strategy,
	now needs to be stored."

	^ self subclassResponsibility
]

{ #category : #'private - management' }
Repository >> basicUpdate: aDomainObject with: anUpdatedDomainObject [

	^ self subclassResponsibility
]

{ #category : #mappings }
Repository >> configureMappingsIn: aBlock [

	self subclassResponsibility 
]

{ #category : #'private - accessing' }
Repository >> conflictCheckingStrategy [

	^ self subclassResponsibility 
]

{ #category : #querying }
Repository >> countMatching: aCriteria [

	self subclassResponsibility
]

{ #category : #querying }
Repository >> findAll [ 
	
	self subclassResponsibility 
]

{ #category : #querying }
Repository >> findAllMatching: aCriteria [

	self subclassResponsibility
]

{ #category : #querying }
Repository >> findAllMatching: aCriteria sortedBy: aSortCriteria [

	self subclassResponsibility
]

{ #category : #'private - accessing' }
Repository >> matchingCriteriaBuilder [

	^ self subclassResponsibility
]

{ #category : #management }
Repository >> purge: aDomainObject [

	^ self
		assertIncludes: aDomainObject;
		basicPurge: aDomainObject
]

{ #category : #management }
Repository >> purgeAllMatching: aCriteria [

	self subclassResponsibility
]

{ #category : #management }
Repository >> store: aDomainObject [

	^ self
		assertNoConflictsFor: aDomainObject;
		basicStore: aDomainObject
]

{ #category : #management }
Repository >> update: aDomainObject executing: aBlock [

	self subclassResponsibility
]

{ #category : #management }
Repository >> update: aDomainObject with: anUpdatedDomainObject [

	^ self
		assertIncludes: aDomainObject;
		assertNoConflictsFor: anUpdatedDomainObject excluding: aDomainObject;
		basicUpdate: aDomainObject with: anUpdatedDomainObject
]

{ #category : #querying }
Repository >> withOneMatching: aCriteria do: foundBlock else: noneBlock [

	self subclassResponsibility
]

{ #category : #querying }
Repository >> withOneMatching: aCriteria sortedBy: aSortCriteria do: foundBlock else: noneBlock [

	self subclassResponsibility
]
