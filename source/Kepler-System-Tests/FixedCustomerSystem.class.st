"
I'm a system implementation returning a set of predefined customers. Used for testing purposes.
"
Class {
	#name : #FixedCustomerSystem,
	#superclass : #SubsystemImplementation,
	#category : #'Kepler-System-Tests'
}

{ #category : #API }
FixedCustomerSystem >> customers [

	^ #('Pedro' 'Juan')
]

{ #category : #installing }
FixedCustomerSystem >> dependencies [

	^ #()
]

{ #category : #installing }
FixedCustomerSystem >> implementedInterfacesDo: aBlock [

	aBlock value: #CustomerQueryingSystem
]

{ #category : #installing }
FixedCustomerSystem >> name [

	^ 'CMS'
]
