"
I represent a builder of matching criterias.

My purpose it's to abstract away complex query construction for the repositories.
Usually every backend hast it's own DSL to create queries and you cannot switch 
easily between them.

My subclasses will resolve any specific details son it can generate efficient 
queries for each backend.

End users can also add new criterias and implement it for the differente backends 
they use, so really complex cases and specific situations can be solved without 
sacrifying readability and polymorphism.

"
Class {
	#name : #RepositoryMatchingCriteriaBuilder,
	#superclass : #Object,
	#category : #'Kepler-Persistence'
}

{ #category : #'string matching' }
RepositoryMatchingCriteriaBuilder >> includes: aStringInRepository substring: aString [

	self subclassResponsibility 
]

{ #category : #'identity operations' }
RepositoryMatchingCriteriaBuilder >> is: objectInRepository notStoredAs: objectInMemory [

	self subclassResponsibility 
]

{ #category : #'string matching' }
RepositoryMatchingCriteriaBuilder >> is: aStringInRepository similarTo: aString [

	self subclassResponsibility 
]

{ #category : #'identity operations' }
RepositoryMatchingCriteriaBuilder >> is: objectInRepository storedAs: objectInMemory [

	self subclassResponsibility 
]

{ #category : #'boolean operations' }
RepositoryMatchingCriteriaBuilder >> satisfying: aBooleanExpression and: aBlock [

	self subclassResponsibility 
]

{ #category : #'boolean operations' }
RepositoryMatchingCriteriaBuilder >> satisfying: aBooleanExpression or: aBlock [

	self subclassResponsibility 
]

{ #category : #'boolean operations' }
RepositoryMatchingCriteriaBuilder >> satisfyingAll: aBooleanExpressionCollection [

	self subclassResponsibility 
]

{ #category : #'boolean operations' }
RepositoryMatchingCriteriaBuilder >> satisfyingAny: aBooleanExpressionCollection [

	self subclassResponsibility 
]
