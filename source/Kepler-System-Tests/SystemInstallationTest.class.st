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

	rootSystem := (SampleSystemInstallation installing: {SampleProjectModule. SampleCustomerModule}) install: '1.0'.
	rootSystem startUp.

	self
		assert: (rootSystem >> #InstalledModuleRegistrationSystem) installedModules size equals: 2;
		assert: (rootSystem >> #CustomerManagementSystem) customers isEmpty;
		assert: ((rootSystem >> #InstalledModuleRegistrationSystem installedModuleRegisteringSystemImplementing: #CustomerManagementSystem) isA: SampleCustomerModule);
		assert: (rootSystem >> #InstalledModuleRegistrationSystem) name equals: 'Installed Module Registration';
		assert: rootSystem name equals: 'Sample'
]

{ #category : #tests }
SystemInstallationTest >> testInstallRepeatedModules [

	| rootSystem |

	rootSystem := (SampleSystemInstallation installing: {SampleCustomerModule. SampleCustomerModule}) install: '1.0'.
	rootSystem startUp.

	self assert: (rootSystem systemsImplementing: #CustomerManagementSystem) size equals: 1
]

{ #category : #tests }
SystemInstallationTest >> testReinstall [

	| rootSystem |

	rootSystem := (SampleSystemInstallation installing: {SampleProjectModule. SampleCustomerModule}) install: '1.0'. 
	rootSystem startUp.

	self shouldnt: [ rootSystem reinstall ] raise: SystemControlError
]

{ #category : #tests }
SystemInstallationTest >> testRestart [

	| rootSystem |

	rootSystem := (SampleSystemInstallation installing:{SampleProjectModule. SampleCustomerModule}) install: '1.0'. 
	rootSystem startUp.

	self shouldnt: [ rootSystem restart ] raise: SystemControlError
]
