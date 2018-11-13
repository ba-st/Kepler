"
I'm a system used for testing. I don't have dependencies on another subsystems.
"
Class {
	#name : #SampleCustomerSystem,
	#superclass : #SubsystemImplementation,
	#instVars : [
		'customers'
	],
	#category : #'Kepler-System-Tests'
}

{ #category : #API }
SampleCustomerSystem >> addCustomer: aCustomer [

	customers add: aCustomer.
	^ aCustomer
]

{ #category : #API }
SampleCustomerSystem >> customers [

	^ customers copy
]

{ #category : #installing }
SampleCustomerSystem >> dependencies [

	^ #()
]

{ #category : #installing }
SampleCustomerSystem >> implementedInterfacesDo: aBlock [

	aBlock
		value: #CustomerQueryingSystem;
		value: #CustomerManagementSystem
]

{ #category : #installing }
SampleCustomerSystem >> initialize [

	super initialize.
	customers := OrderedCollection new
]

{ #category : #installing }
SampleCustomerSystem >> name [

	^ 'CMS'
]
