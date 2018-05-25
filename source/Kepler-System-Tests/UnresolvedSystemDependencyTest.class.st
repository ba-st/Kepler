"
An UnresolvedSystemDependencyTest is a test class for testing the behavior of UnresolvedSystemDependency
"
Class {
	#name : #UnresolvedSystemDependencyTest,
	#superclass : #TestCase,
	#category : 'Kepler-System-Tests'
}

{ #category : #tests }
UnresolvedSystemDependencyTest >> testSendingAnyMessageSignalsError [

	| unresolvedSystemDependency |

	unresolvedSystemDependency := UnresolvedSystemDependency to: SystemInterface >> #TimeSystemInterface.
	self
		should: [ unresolvedSystemDependency dateTime ]
		raise: Error
		whoseDescriptionIncludes: 'Unresolved system dependency to Time System Interface'
		description: 'Expected: Unresolved system dependency to Time System Interface'
]
