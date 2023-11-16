"
An EventNotificationModuleTest is a test class for testing the behavior of EventNotificationModule
"
Class {
	#name : 'EventNotificationModuleTest',
	#superclass : 'TestCase',
	#instVars : [
		'userStory'
	],
	#category : 'Kepler-Notifications-Tests',
	#package : 'Kepler-Notifications-Tests'
}

{ #category : 'private - accessing' }
EventNotificationModuleTest >> installedModuleRegistrationSystem [

	^ userStory rootSystem >> #InstalledModuleRegistrationSystem
]

{ #category : 'running' }
EventNotificationModuleTest >> setUp [

	super setUp.
	userStory := PluggableUserStoryTest
		requiring: [ :test | test requireInstallationOf: EventNotificationModule ].
	userStory setUp
]

{ #category : 'tests' }
EventNotificationModuleTest >> testAccessing [

	| eventNotificationModule |

	eventNotificationModule := self installedModuleRegistrationSystem
		installedModuleRegisteringSystemImplementing: #EventNotificationSystemInterface.

	self
		assert: eventNotificationModule name equals: 'Event notification';
		assert: eventNotificationModule systemInterfacesToInstall
			equals: #(#EventNotificationSystemInterface)
]
