"
A TimeModuleTest is a test class for testing the behavior of TimeModule
"
Class {
	#name : #TimeModuleTest,
	#superclass : #SystemBasedUserStoryTest,
	#category : #'Kepler-Time-Tests'
}

{ #category : #'private - accessing' }
TimeModuleTest >> installedModuleRegistrationSystem [

	^ rootSystem >> #InstalledModuleRegistrationSystem
]

{ #category : #'private - configuring' }
TimeModuleTest >> requireTimeModule [
	
	self requireInstallationOf: TimeModule 
]

{ #category : #'private - running' }
TimeModuleTest >> setUpRequirements [

	self requireTimeModule
]

{ #category : #tests }
TimeModuleTest >> testAccessing [

	| eventNotificationModule |

	eventNotificationModule := self installedModuleRegistrationSystem
		installedModuleRegisteringSystemImplementing: #TimeSystemInterface.

	self
		assert: eventNotificationModule name equals: 'Time';
		assert: eventNotificationModule systemInterfacesToInstall
			equals: #(#TimeSystemInterface)
]
