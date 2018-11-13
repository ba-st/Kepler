"
SystemHotSwapper test case
"
Class {
	#name : #SystemHotSwapperTest,
	#superclass : #TestCase,
	#category : #'Kepler-System-Tests'
}

{ #category : #tests }
SystemHotSwapperTest >> testCantSwapWhenTheInterfaceIsNotImplemented [

	| composite cms newCMS |

	cms := SampleCustomerSystem new.
	composite := CompositeSystem new
		register: cms;
		yourself.
	composite startUp.

	newCMS := FixedCustomerSystem new.

	self
		should: [ (SystemHotSwapper swapSystemImplementing: #CustomerManagementSystem with: newCMS) applyTo: composite ]
		raise: SystemControlError
		withExceptionDo: [ :error | self assert: error messageText equals: 'CMS is not implementing Customer Management' ]
]

{ #category : #tests }
SystemHotSwapperTest >> testSwapping [

	| composite cms newCMS |

	cms := SampleCustomerSystem new.
	composite := CompositeSystem new
		register: cms;
		yourself.
	composite startUp.

	cms addCustomer: 'John'.

	newCMS := FixedCustomerSystem new.

	self deny: cms = newCMS.

	self
		assert: composite >> #CustomerQueryingSystem equals: cms;
		assert: (composite >> #CustomerQueryingSystem) customers size equals: 1.

	(SystemHotSwapper swapSystemImplementing: #CustomerQueryingSystem with: newCMS) applyTo: composite.

	self
		assert: composite >> #CustomerQueryingSystem equals: newCMS;
		assert: (composite >> #CustomerQueryingSystem) customers size equals: 2
]
