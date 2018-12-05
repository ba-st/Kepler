"
I'm an abstract Test Case for testing the Repository implementations.

My subclasses must provide a way to setup a functioning repository.
"
Class {
	#name : #RepositoryBasedTest,
	#superclass : #TestCase,
	#instVars : [
		'repository'
	],
	#category : #'Kepler-Persistence-Tests'
}

{ #category : #testing }
RepositoryBasedTest class >> isAbstract [ 

	^self name = #RepositoryBasedTest
]

{ #category : #'private - support' }
RepositoryBasedTest >> newPersonFirstNamed: aFirstName lastNamed: aLastName [

	^ KP_Person firstNamed: aFirstName lastNamed: aLastName
]

{ #category : #'private - accessing' }
RepositoryBasedTest >> repository [ 

	repository ifNil: [ self setUpRepository  ].
	^ repository 
]

{ #category : #initialization }
RepositoryBasedTest >> setUpRepository [

	self setUpRepositoryWith: DoNotCheckForConflictsStrategy new
]

{ #category : #initialization }
RepositoryBasedTest >> setUpRepositoryForConjunctiveConflictChecking [

	self
		setUpRepositoryWith:
			( CriteriaBasedConflictCheckingStrategy
				forAllIn:
					{[ :person | person firstName ].
					[ :person | person lastName ]} )
]

{ #category : #initialization }
RepositoryBasedTest >> setUpRepositoryForDisjunctiveConflictChecking [

	self
		setUpRepositoryWith:
			( CriteriaBasedConflictCheckingStrategy
				forAnyIn:
					{[ :person | person firstName ].
					[ :person | person lastName ]} )
]

{ #category : #initialization }
RepositoryBasedTest >> setUpRepositoryForSimpleConflictChecking [

	self setUpRepositoryWith: ( CriteriaBasedConflictCheckingStrategy forSingleAspectMatching: [ :person | person firstName ] )
]

{ #category : #initialization }
RepositoryBasedTest >> setUpRepositoryWith: aConflictCheckingStrategy [

	self subclassResponsibility  
	
	
]

{ #category : #'tests - querying' }
RepositoryBasedTest >> testCountMatching [

	self repository
		store: ( self newPersonFirstNamed: 'Juan' lastNamed: 'Perez' );
		store: ( self newPersonFirstNamed: 'Pablo' lastNamed: 'Perez' ).

	self
		assert: ( self repository countMatching: [ :person | person lastName = 'Perez' ] ) equals: 2;
		assert: ( self repository countMatching: [ :person | person firstName = 'Juan' ] ) equals: 1
]

{ #category : #'tests - querying' }
RepositoryBasedTest >> testFindAllMatching [

	| newPerson |

	newPerson := self newPersonFirstNamed: 'Juan' lastNamed: 'Perez'.
	
	self repository store: newPerson.
	
	self
		assert: ( self repository findAllMatching: [ :person | person firstName = 'Juan' ] ) size equals: 1;
		assert: ( self repository findAllMatching: [ :person | person firstName = 'Yoko' ] ) isEmpty
]

{ #category : #'tests - querying' }
RepositoryBasedTest >> testFindAllMatchingSortedBy [

	| sortedPersons |

	self repository
		store: ( self newPersonFirstNamed: 'Juan' lastNamed: 'Perez' );
		store: ( self newPersonFirstNamed: 'Pablo' lastNamed: 'Perez' );
		store: ( self newPersonFirstNamed: 'Juan' lastNamed: 'Quintero' );
		store: ( self newPersonFirstNamed: 'Juan' lastNamed: 'Carlos' ).

	sortedPersons := self repository findAllMatching: [ :person :criteria | criteria includes: person lastName substring: 'e' ] sortedBy: #firstName ascending , #lastName descending.

	self
		assert: sortedPersons size equals: 3;
		assert: sortedPersons first lastName equals: 'Quintero';
		assert: sortedPersons first firstName equals: 'Juan';
		assert: sortedPersons second lastName equals: 'Perez';
		assert: sortedPersons second firstName equals: 'Juan';
		assert: sortedPersons last lastName equals: 'Perez';
		assert: sortedPersons last firstName equals: 'Pablo'
]

{ #category : #'tests - management' }
RepositoryBasedTest >> testPurge [

	| newPerson |

	newPerson := self newPersonFirstNamed: 'Juan' lastNamed: 'Perez'.
	self repository store: newPerson.
	self assert: self repository findAll size equals: 1.

	self repository purge: newPerson.
	self assert: self repository findAll isEmpty
]

{ #category : #'tests - management' }
RepositoryBasedTest >> testPurgeAllMatching [

	self repository
		store: ( self newPersonFirstNamed: 'Juan' lastNamed: 'Perez' );
		store: ( self newPersonFirstNamed: 'Pablo' lastNamed: 'Perez' ).
	self assert: self repository findAll size equals: 2.

	self repository purgeAllMatching: [ :person | person lastName = 'Perez' ].

	self assert: self repository findAll isEmpty
]

{ #category : #'tests - management' }
RepositoryBasedTest >> testPurgeAllMatchingWhenNoneMatches [

	self assert: self repository findAll isEmpty.

	self repository purgeAllMatching: [ :person | person lastName = 'Perez' ].

	self assert: self repository findAll isEmpty
]

{ #category : #'tests - management' }
RepositoryBasedTest >> testPurgeAllMatchingWhenNotAllMatches [

	self repository
		store: ( self newPersonFirstNamed: 'Juan' lastNamed: 'Perez' );
		store: ( self newPersonFirstNamed: 'Pablo' lastNamed: 'Perez' ).
	self assert: self repository findAll size equals: 2.

	self repository purgeAllMatching: [ :person | person firstName = 'Pablo' ].

	self assert: self repository findAll size equals: 1.
	self repository withOneMatching: [ :person | person lastName = 'Perez' ] do: [ :person | self assert: person firstName equals: 'Juan' ] else: [ self fail ]
]

{ #category : #'tests - management' }
RepositoryBasedTest >> testStore [

	| newPerson |

	newPerson := self newPersonFirstNamed: 'Juan' lastNamed: 'Perez'.

	self repository store: newPerson.

	self
		assert: self repository findAll size equals: 1;
		assert: ( self repository findAll includes: newPerson )
]

{ #category : #'tests - conflict checking' }
RepositoryBasedTest >> testStoreWithConflict [

	| newPerson |

	self setUpRepositoryForSimpleConflictChecking.

	newPerson := self newPersonFirstNamed: 'Juan' lastNamed: 'Perez'.

	self repository store: newPerson.

	self should: [ self repository store: ( self newPersonFirstNamed: 'Juan' lastNamed: 'Carlos' ) ] raise: ConflictingObjectFound
]

{ #category : #'tests - conflict checking' }
RepositoryBasedTest >> testStoreWithConjunctiveConflictChecking [

	| newPerson |

	self setUpRepositoryForConjunctiveConflictChecking.

	newPerson := self newPersonFirstNamed: 'Juan' lastNamed: 'Perez'.

	self repository store: newPerson.

	self
		shouldnt: [ self repository store: ( self newPersonFirstNamed: 'Juan' lastNamed: 'Carlos' ) ] raise: ConflictingObjectFound;
		shouldnt: [ self repository store: ( self newPersonFirstNamed: 'Pedro' lastNamed: 'Perez' ) ] raise: ConflictingObjectFound;
		should: [ self repository store: ( self newPersonFirstNamed: 'Juan' lastNamed: 'Perez' ) ] raise: ConflictingObjectFound
]

{ #category : #'tests - conflict checking' }
RepositoryBasedTest >> testStoreWithDisjunctiveConflictChecking [

	| newPerson |

	self setUpRepositoryForDisjunctiveConflictChecking.

	newPerson := self newPersonFirstNamed: 'Juan' lastNamed: 'Perez'.

	self repository store: newPerson.

	self
		should: [ self repository store: ( self newPersonFirstNamed: 'Juan' lastNamed: 'Carlos' ) ] raise: ConflictingObjectFound;
		should: [ self repository store: ( self newPersonFirstNamed: 'Pedro' lastNamed: 'Perez' ) ] raise: ConflictingObjectFound;		
		should: [ self repository store: ( self newPersonFirstNamed: 'Juan' lastNamed: 'Perez' ) ] raise: ConflictingObjectFound
]

{ #category : #'tests - management' }
RepositoryBasedTest >> testUpdateWith [

	| newPerson |

	newPerson := self newPersonFirstNamed: 'Juan' lastNamed: 'Perez'.
	self repository store: newPerson.
	self
		assert: self repository findAll size equals: 1;
		assert: ( self repository findAll includes: newPerson ).

	self repository update: newPerson with: ( self newPersonFirstNamed: 'John' lastNamed: 'Lock' ).

	self assert: self repository findAll size equals: 1.

	self repository withOneMatching: [ :person | person firstName = 'John' ] do: [ :john | self assert: john firstName equals: 'John' ] else: [ self fail ].

	self assert: ( self repository findAllMatching: [ :person | person lastName = 'Perez' ] ) isEmpty
]

{ #category : #'tests - conflict checking' }
RepositoryBasedTest >> testUpdateWithConflict [

	| newPerson |

	self setUpRepositoryForSimpleConflictChecking.

	newPerson := self newPersonFirstNamed: 'Juan' lastNamed: 'Perez'.
	self repository store: newPerson.
	self repository store: ( self newPersonFirstNamed: 'John' lastNamed: 'Travolta' ).

	self should: [ self repository update: newPerson with: ( self newPersonFirstNamed: 'John' lastNamed: 'Lock' ) ] raise: ConflictingObjectFound
]

{ #category : #'tests - conflict checking' }
RepositoryBasedTest >> testUpdateWithConflictUsingConjunctiveConflictChecking [

	| newPerson |

	self setUpRepositoryForConjunctiveConflictChecking.

	newPerson := self newPersonFirstNamed: 'Juan' lastNamed: 'Perez'.
	self repository store: newPerson.
	self repository store: ( self newPersonFirstNamed: 'John' lastNamed: 'Travolta' ).

	self
		should: [ self repository update: newPerson with: ( self newPersonFirstNamed: 'John' lastNamed: 'Travolta' ) ] raise: ConflictingObjectFound;
		shouldnt: [ self repository update: newPerson with: ( self newPersonFirstNamed: 'John' lastNamed: 'Lock' ) ] raise: ConflictingObjectFound;
		shouldnt: [ self repository update: newPerson with: ( self newPersonFirstNamed: 'Juan' lastNamed: 'Travolta' ) ] raise: ConflictingObjectFound
]

{ #category : #'tests - conflict checking' }
RepositoryBasedTest >> testUpdateWithConflictUsingDisjunctiveConflictChecking [

	| newPerson |

	self setUpRepositoryForDisjunctiveConflictChecking.

	newPerson := self newPersonFirstNamed: 'Juan' lastNamed: 'Perez'.
	self repository store: newPerson.
	self repository store: ( self newPersonFirstNamed: 'John' lastNamed: 'Travolta' ).

	self
		should: [ self repository update: newPerson with: ( self newPersonFirstNamed: 'John' lastNamed: 'Travolta' ) ] raise: ConflictingObjectFound;
		should: [ self repository update: newPerson with: ( self newPersonFirstNamed: 'John' lastNamed: 'Lock' ) ] raise: ConflictingObjectFound;
		should: [ self repository update: newPerson with: ( self newPersonFirstNamed: 'Juan' lastNamed: 'Travolta' ) ] raise: ConflictingObjectFound
]

{ #category : #'tests - conflict checking' }
RepositoryBasedTest >> testUpdateWithoutConflict [

	| newPerson |

	self setUpRepositoryForSimpleConflictChecking.

	newPerson := self newPersonFirstNamed: 'Juan' lastNamed: 'Perez'.
	self repository
		store: newPerson;
		store: ( self newPersonFirstNamed: 'John' lastNamed: 'Travolta' ).

	self shouldnt: [ self repository update: newPerson with: ( self newPersonFirstNamed: 'Juan' lastNamed: 'Lock' ) ] raise: ConflictingObjectFound
]

{ #category : #'tests - querying' }
RepositoryBasedTest >> testWithOneMatchingSortedByDoElse [

	self repository
		store: ( self newPersonFirstNamed: 'Juan' lastNamed: 'Perez' );
		store: ( self newPersonFirstNamed: 'Pablo' lastNamed: 'Perez' );
		store: ( self newPersonFirstNamed: 'Juan' lastNamed: 'Quintero' );
		store: ( self newPersonFirstNamed: 'Juan' lastNamed: 'Carlos' ).

	self repository
		withOneMatching: [ :person :criteria | criteria includes: person lastName substring: 'e' ]
		sortedBy: #firstName ascending , #lastName descending
		do: [ :person | 
			self
				assert: person lastName equals: 'Quintero';
				assert: person firstName equals: 'Juan'
			]
		else: [ self fail ]
]
