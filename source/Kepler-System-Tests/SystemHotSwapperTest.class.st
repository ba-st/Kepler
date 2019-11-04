"
SystemHotSwapper test case
"
Class {
	#name : #SystemHotSwapperTest,
	#superclass : #TestCase,
	#instVars : [
		'composite'
	],
	#category : #'Kepler-System-Tests'
}

{ #category : #private }
SystemHotSwapperTest >> assert: aSubsystem implements: anInterfaceKey [

	self assert: ( self is: anInterfaceKey implementedBy: aSubsystem )
]

{ #category : #private }
SystemHotSwapperTest >> deny: aSubsystem implements: anInterfaceKey [

	self deny: ( self is: anInterfaceKey implementedBy: aSubsystem )
]

{ #category : #private }
SystemHotSwapperTest >> is: anInterfaceKey implementedBy: aSubsystem [

	^ aSubsystem implements: ( composite interfaceAt: anInterfaceKey )
]

{ #category : #running }
SystemHotSwapperTest >> setUp [

	super setUp.
	composite := CompositeSystem new
]

{ #category : #running }
SystemHotSwapperTest >> tearDown [

	composite shutDown.
	super tearDown
]

{ #category : #tests }
SystemHotSwapperTest >> testCantSwapWhenTheInterfaceIsNotImplemented [

	composite
		register: SampleCustomerSystem new;
		startUp.

	self
		should: [ SystemHotSwapper swapSystemImplementing: #CustomerManagementSystem with: FixedCustomerSystem new ]
		raise: SystemControlError
		withMessageText: 'CMS is not implementing Customer Management'
]

{ #category : #tests }
SystemHotSwapperTest >> testSwapping [

	| cms newCMS |

	cms := SampleCustomerSystem new.
	composite
		register: cms;
		startUp.

	cms addCustomer: 'John'.

	newCMS := FixedCustomerSystem new.

	self
		assert: composite >> #CustomerQueryingSystem equals: cms;
		assert: ( composite >> #CustomerQueryingSystem ) customers size equals: 1.

	( SystemHotSwapper swapSystemImplementing: #CustomerQueryingSystem with: newCMS )
		applyTo: composite.

	self
		assert: composite >> #CustomerQueryingSystem equals: newCMS;
		assert: ( composite >> #CustomerQueryingSystem ) customers size equals: 2
]

{ #category : #tests }
SystemHotSwapperTest >> testSwappingFailedWhenReplacementsAreMissingSomeInterfaces [

	| cms pms swapper |

	cms := SampleCustomerSystem new.
	pms := SampleProjectSystem new.
	composite
		register: cms;
		register: pms;
		startUp.

	self
		assert: composite >> #CustomerManagementSystem equals: cms;
		assert: pms >> #CustomerQueryingSystem equals: cms.

	swapper := SystemHotSwapper
		swapSystemImplementing: #CustomerManagementSystem
		with: FixedCustomerManagementSystem new.

	self
		should: [ swapper applyTo: composite ]
		raise: SystemControlError
		withMessageText: 'System implementing "Customer Querying" not found.'
]

{ #category : #tests }
SystemHotSwapperTest >> testSwappingOneImplementationWithTwoOthers [

	"This test checks that a system implementing more than one interface can be replaced
	by two or more systems implementing the required interfaces"

	| cms managementSystem queryingSystem |

	cms := SampleCustomerSystem new.
	composite
		register: cms;
		startUp.

	self
		assert: cms implements: #CustomerQueryingSystem;
		assert: cms implements: #CustomerManagementSystem.

	managementSystem := FixedCustomerManagementSystem new.
	self
		assert: managementSystem implements: #CustomerManagementSystem;
		deny: managementSystem implements: #CustomerQueryingSystem.

	queryingSystem := FixedCustomerSystem new.
	self
		assert: queryingSystem implements: #CustomerQueryingSystem;
		deny: queryingSystem implements: #CustomerManagementSystem.

	self
		assert: composite >> #CustomerQueryingSystem equals: cms;
		assert: composite >> #CustomerManagementSystem equals: cms.

	( SystemHotSwapper
		swapSystemImplementingAll: #(#CustomerQueryingSystem #CustomerManagementSystem)
		with: ( Array with: queryingSystem with: managementSystem ) ) applyTo: composite.

	self
		assert: composite >> #CustomerQueryingSystem equals: queryingSystem;
		assert: composite >> #CustomerManagementSystem equals: managementSystem
]

{ #category : #tests }
SystemHotSwapperTest >> testSwappingSystemWithDependents [

	| cms newCMS pms |

	cms := SampleCustomerSystem new.
	pms := SampleProjectSystem new.
	composite
		register: cms;
		register: pms;
		startUp.

	newCMS := FixedCustomerSystem new.

	self
		assert: composite >> #CustomerQueryingSystem equals: cms;
		assert: pms >> #CustomerQueryingSystem equals: cms.

	( SystemHotSwapper swapSystemImplementing: #CustomerQueryingSystem with: newCMS )
		applyTo: composite.

	self
		assert: composite >> #CustomerQueryingSystem equals: newCMS;
		assert: pms >> #CustomerQueryingSystem equals: newCMS
]
