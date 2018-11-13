"
SystemHotSwapper test case
"
Class {
	#name : #SystemHotSwapperTest,
	#superclass : #TestCase,
	#category : #'Kepler-System-Tests'
}

{ #category : #tests }
SystemHotSwapperTest >> testSwapping [

	| composite cms newCMS |

	cms := SampleCustomerSystem new.
	composite := CompositeSystem new
		register: cms;
		yourself.
	composite startUp.
	
	newCMS := FixedCustomerSystem new.

	self deny: cms = newCMS.

	self assert: composite >> #CustomerQueryingSystem equals: cms.
	(SystemHotSwapper swapSystemImplementing: #CustomerQueryingSystem with: newCMS) applyTo: composite.
	self assert: composite >> #CustomerQueryingSystem equals: newCMS
]
