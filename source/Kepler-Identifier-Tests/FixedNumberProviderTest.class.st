"
A FixedNumberProviderTest is a test class for testing the behavior of FixedNumberProvider
"
Class {
	#name : #FixedNumberProviderTest,
	#superclass : #TestCase,
	#category : 'Kepler-Identifier-Tests'
}

{ #category : #'tests-providing' }
FixedNumberProviderTest >> testNext [

	| provider |

	provider := FixedNumberProvider providing: 3.
	self assert: provider next equals: 3.
	self assert: provider next equals: 3.
	provider setNextTo: 7.
	self assert: provider next equals: 7
]
