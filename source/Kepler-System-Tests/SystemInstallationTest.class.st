"
Unit test for SystemInstallation
"
Class {
	#name : #SystemInstallationTest,
	#superclass : #TestCase,
	#category : #'Kepler-System-Tests'
}

{ #category : #tests }
SystemInstallationTest >> testCreatedSystem [

	| rootSystem |

	rootSystem := (SampleSystemInstallation installing:{SampleProjectModule. SampleCustomerModule}) value: '1.0'.
	rootSystem startUp.

	self
		assert: (rootSystem >> #InstalledModuleRegistrationSystem) installedModules size equals: 2;
		assert: (rootSystem >> #CustomerManagementSystem) customers isEmpty;
		assert: ((rootSystem >> #InstalledModuleRegistrationSystem installedModuleRegisteringSystemImplementing: #CustomerManagementSystem) isA: SampleCustomerModule)
]

{ #category : #tests }
SystemInstallationTest >> testInstallRepeatedModules [

	| rootSystem |

	rootSystem := (SampleSystemInstallation installing: {SampleCustomerModule. SampleCustomerModule}) value: '1.0'. 
	rootSystem startUp.
 
]

{ #category : #tests }
SystemInstallationTest >> testReinstall [

	| rootSystem |

	rootSystem := (SampleSystemInstallation installing:{SampleProjectModule. SampleCustomerModule}) value: '1.0'. 
	rootSystem startUp.

	self shouldnt: [ rootSystem reinstall ] raise: SystemControlError
]
