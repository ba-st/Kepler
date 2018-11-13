"
I'm a system implementation returning a set of predefined customers. Used for testing purposes.
"
Class {
	#name : #FixedCustomerSystem,
	#superclass : #SubsystemImplementation,
	#instVars : [
		'customers'
	],
	#category : #'Kepler-System-Tests'
}

{ #category : #'class initialization' }
FixedCustomerSystem class >> initialize [

	SystemInterface bind: #CustomerManagementSystem to: (Interface named: #CustomerManagementSystem declaring: #(customers addCustomer:))
]

{ #category : #API }
FixedCustomerSystem >> addCustomer: aCustomer [


]

{ #category : #API }
FixedCustomerSystem >> customers [

	^ customers , #('Pedro' 'Juan')
]

{ #category : #installing }
FixedCustomerSystem >> dependencies [

	^ #()
]

{ #category : #installing }
FixedCustomerSystem >> implementedInterfacesDo: aBlock [

	aBlock value: SystemInterface >> #CustomerManagementSystem
]

{ #category : #installing }
FixedCustomerSystem >> initialize [

	super initialize.
	customers := OrderedCollection new
]

{ #category : #installing }
FixedCustomerSystem >> name [

	^ 'CMS'
]

{ #category : #installing }
FixedCustomerSystem >> resolveDependencies [

	
]
