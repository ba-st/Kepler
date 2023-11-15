"
I'm a system implementation failing when trying to add a customer. Used for testing purposes.
"
Class {
	#name : 'FixedCustomerManagementSystem',
	#superclass : 'SubsystemImplementation',
	#category : 'Kepler-System-Tests',
	#package : 'Kepler-System-Tests'
}

{ #category : 'registering' }
FixedCustomerManagementSystem class >> registerInterfaces [

	[
	self
		registerInterfaceAt: #CustomerManagementSystem
		named: 'Customer Management'
		declaring: #( #addCustomer: ) ]
		on: ConflictingObjectFound
		do: [ :ex | ex return ]
]

{ #category : 'API' }
FixedCustomerManagementSystem >> addCustomer: aCustomer [

	SystemCommandExecutionError signal: 'Cannot add customer'
]

{ #category : 'installing' }
FixedCustomerManagementSystem >> dependencies [

	^ #()
]

{ #category : 'installing' }
FixedCustomerManagementSystem >> implementedInterfaces [

	^ #(#CustomerManagementSystem)
]

{ #category : 'installing' }
FixedCustomerManagementSystem >> name [

	^ 'CMS'
]
