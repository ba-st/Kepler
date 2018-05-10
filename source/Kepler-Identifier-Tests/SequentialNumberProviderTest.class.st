"
A SequentialNumberProviderTest is a test class for testing the behavior of SequentialNumberProvider
"
Class {
	#name : #SequentialNumberProviderTest,
	#superclass : #TestCase,
	#category : 'Kepler-Identifier-Tests'
}

{ #category : #'tests-providing' }
SequentialNumberProviderTest >> testNext [

	| provider |

	provider := SequentialNumberProvider new.
	(1 to: 100) do: [ :each | self assert: provider next equals: each ]
]
