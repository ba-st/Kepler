"
An EventNotificationModuleTest is a test class for testing the behavior of EventNotificationModule
"
Class {
	#name : #EventNotificationModuleTest,
	#superclass : #SystemBasedUserStoryTest,
	#category : #'Kepler-Notifications-Tests'
}

{ #category : #'private - accessing' }
EventNotificationModuleTest >> installedModuleRegistrationSystem [

	^ rootSystem >> #InstalledModuleRegistrationSystem
]

{ #category : #'private - configuring' }
EventNotificationModuleTest >> requireEventNotificationModule [

	self requireInstallationOf: EventNotificationModule
]

{ #category : #'private - running' }
EventNotificationModuleTest >> setUpRequirements [

	self requireEventNotificationModule
]

{ #category : #tests }
EventNotificationModuleTest >> testAccessing [

	| eventNotificationModule |

	eventNotificationModule := self installedModuleRegistrationSystem
		installedModuleRegisteringSystemImplementing: #EventNotificationSystemInterface.

	self
		assert: eventNotificationModule name equals: 'Event notification';
		assert: eventNotificationModule systemInterfacesToInstall
			equals: #(#EventNotificationSystemInterface)
]
