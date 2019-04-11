"
I'm system module installing the event notification system
"
Class {
	#name : #EventNotificationModule,
	#superclass : #SystemModule,
	#instVars : [
		'rootSystem'
	],
	#category : #'Kepler-Notifications'
}

{ #category : #'instance creation' }
EventNotificationModule class >> toInstallOn: aCompositeSystem [

	^ self new initializeToInstallOn: aCompositeSystem
]

{ #category : #initialization }
EventNotificationModule >> initializeToInstallOn: aCompositeSystem [

	rootSystem := aCompositeSystem
]

{ #category : #private }
EventNotificationModule >> name [

	^ 'Event notification'
]

{ #category : #private }
EventNotificationModule >> registerEventNotificationSystemForInstallationIn: systems [

	^ self register: [ EventNotificationSystem new ] in: systems
]

{ #category : #private }
EventNotificationModule >> rootSystem [

	^ rootSystem 
]

{ #category : #private }
EventNotificationModule >> systemInterfacesToInstall [

	^ #(#EventNotificationSystemInterface)
]
