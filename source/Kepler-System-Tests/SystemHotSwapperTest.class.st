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
		withMessageText: 'CMS is not implementing Customer Management'
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

{ #category : #tests }
SystemHotSwapperTest >> testSwappingSystemWithDependents [

	| composite cms newCMS pms |

	cms := SampleCustomerSystem new.
	pms := SampleProjectSystem new.
	composite := CompositeSystem new
		register: cms;
		register: pms;
		yourself.
	composite startUp.

	newCMS := FixedCustomerSystem new.

	self deny: cms = newCMS.

	self
		assert: composite >> #CustomerQueryingSystem equals: cms;
		assert: pms >> #CustomerQueryingSystem equals: cms.

	( SystemHotSwapper swapSystemImplementing: #CustomerQueryingSystem with: newCMS )
		applyTo: composite.

	self
		assert: composite >> #CustomerQueryingSystem equals: newCMS;
		assert: pms >> #CustomerQueryingSystem equals: newCMS
]
