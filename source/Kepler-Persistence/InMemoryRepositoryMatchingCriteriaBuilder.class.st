"
I'm an implementation for In Memory Repositories.
I will try to solve everything using plain messages without any DSL.
"
Class {
	#name : #InMemoryRepositoryMatchingCriteriaBuilder,
	#superclass : #RepositoryMatchingCriteriaBuilder,
	#category : #'Kepler-Persistence'
}

{ #category : #'string matching' }
InMemoryRepositoryMatchingCriteriaBuilder >> includes: aStringInRepository substring: aString [

	^ aStringInRepository includesSubstring: aString
]

{ #category : #'identity operations' }
InMemoryRepositoryMatchingCriteriaBuilder >> is: objectInRepository notStoredAs: objectInMemory [

	^ objectInRepository ~= objectInMemory
]

{ #category : #'string matching' }
InMemoryRepositoryMatchingCriteriaBuilder >> is: aStringInRepository similarTo: aString [

	^ aStringInRepository includesSubstring: aString
]

{ #category : #'identity operations' }
InMemoryRepositoryMatchingCriteriaBuilder >> is: anObjectInRepository storedAs: anObject [

	^ anObjectInRepository = anObject
]

{ #category : #'boolean operations' }
InMemoryRepositoryMatchingCriteriaBuilder >> satisfying: aBoolean and: aBlock [

	^ aBoolean and: aBlock
]

{ #category : #'boolean operations' }
InMemoryRepositoryMatchingCriteriaBuilder >> satisfying: aBoolean or: aBlock [

	^ aBoolean or: aBlock
]

{ #category : #'boolean operations' }
InMemoryRepositoryMatchingCriteriaBuilder >> satisfyingAll: aBooleanCollection [

	^ aBooleanCollection allSatisfy: [ :each | each ]
]

{ #category : #'boolean operations' }
InMemoryRepositoryMatchingCriteriaBuilder >> satisfyingAny: aBooleanCollection [

	^ aBooleanCollection anySatisfy: [ :each | each ]
]
