"
I'm a sample system module installing a customer management system
"
Class {
	#name : 'SampleCustomerModule',
	#superclass : 'SystemModule',
	#instVars : [
		'rootSystem'
	],
	#category : 'Kepler-System-Tests',
	#package : 'Kepler-System-Tests'
}

{ #category : 'instance creation' }
SampleCustomerModule class >> toInstallOn: aCompositeSystem [ 

	^ self new initializeToInstallOn: aCompositeSystem 
]

{ #category : 'initialization' }
SampleCustomerModule >> initializeToInstallOn: aCompositeSystem [ 
	
	rootSystem := aCompositeSystem 
]

{ #category : 'private' }
SampleCustomerModule >> name [

	^ 'Customer'
]

{ #category : 'private' }
SampleCustomerModule >> registerCustomerManagementSystemForInstallationIn: systems [

	^ self register: [ SampleCustomerSystem new ] in: systems
]

{ #category : 'private' }
SampleCustomerModule >> rootSystem [

	^ rootSystem
]

{ #category : 'private' }
SampleCustomerModule >> systemInterfacesToInstall [

	^ #(#CustomerManagementSystem)
]
