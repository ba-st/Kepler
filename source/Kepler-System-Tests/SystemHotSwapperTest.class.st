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

	self assert: composite >> #CustomerManagementSystem equals: cms.
	(SystemHotSwapper swapSystemImplementing: #CustomerManagementSystem with: newCMS) applyTo: composite.
	self assert: composite >> #CustomerManagementSystem equals: newCMS
]
