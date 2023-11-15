"
I'm a system implementation returning a set of predefined customers. Used for testing purposes.
"
Class {
	#name : 'FixedCustomerSystem',
	#superclass : 'SubsystemImplementation',
	#category : 'Kepler-System-Tests',
	#package : 'Kepler-System-Tests'
}

{ #category : 'registering' }
FixedCustomerSystem class >> registerInterfaces [

	[
	self
		registerInterfaceAt: #CustomerQueryingSystem
		named: 'Customer Querying'
		declaring: #( #customers ) ]
		on: ConflictingObjectFound
		do: [ :ex | ex return ]
]

{ #category : 'API' }
FixedCustomerSystem >> customers [

	^ #('Pedro' 'Juan')
]

{ #category : 'installing' }
FixedCustomerSystem >> dependencies [

	^ #()
]

{ #category : 'installing' }
FixedCustomerSystem >> implementedInterfaces [

	^ #(#CustomerQueryingSystem)
]

{ #category : 'installing' }
FixedCustomerSystem >> name [

	^ 'CMS'
]
