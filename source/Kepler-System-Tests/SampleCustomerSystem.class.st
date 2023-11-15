"
I'm a system used for testing. I don't have dependencies on another subsystems.
"
Class {
	#name : 'SampleCustomerSystem',
	#superclass : 'SubsystemImplementation',
	#instVars : [
		'customers'
	],
	#category : 'Kepler-System-Tests',
	#package : 'Kepler-System-Tests'
}

{ #category : 'registering' }
SampleCustomerSystem class >> registerInterfaces [

	self
		safelyRegisterInterfaceAt: #CustomerManagementSystem
		named: 'Customer Management'
		declaring: #( #addCustomer: ).

	self
		safelyRegisterInterfaceAt: #CustomerQueryingSystem
		named: 'Customer Querying'
		declaring: #( #customers )
]

{ #category : 'API' }
SampleCustomerSystem >> addCustomer: aCustomer [

	customers add: aCustomer.
	^ aCustomer
]

{ #category : 'API' }
SampleCustomerSystem >> customers [

	^ customers copy
]

{ #category : 'installing' }
SampleCustomerSystem >> dependencies [

	^ #()
]

{ #category : 'installing' }
SampleCustomerSystem >> implementedInterfaces [

	^ #(#CustomerQueryingSystem #CustomerManagementSystem)
]

{ #category : 'installing' }
SampleCustomerSystem >> initialize [

	super initialize.
	customers := OrderedCollection new
]

{ #category : 'installing' }
SampleCustomerSystem >> name [

	^ 'CMS'
]
