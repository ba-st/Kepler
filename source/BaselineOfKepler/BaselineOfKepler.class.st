Class {
	#name : #BaselineOfKepler,
	#superclass : #BaselineOf,
	#category : #BaselineOfKepler
}

{ #category : #baselines }
BaselineOfKepler >> baseline: spec [

	<baseline>
	spec
		for: #common
		do: [ self setUpDependencies: spec.
			spec
				package: 'Kepler-Identifier';
				package: 'Kepler-System'
					with: [ spec requires: #('Buoy').
					spec postLoadDoIt: #registerSystemInterfaces ];
				package: 'Kepler-Time' with: [ spec requires: #('Kepler-System' 'Chalten') ];
				package: 'Kepler-Notifications' with: [ spec requires: #('Kepler-System') ].
			spec
				package: 'Kepler-Identifier-Tests' with: [ spec requires: #('Kepler-Identifier') ];
				package: 'Kepler-SystemBasedTests' with: [ spec requires: #('Kepler-System' 'Kepler-Identifier' 'Kepler-Time') ];
				package: 'Kepler-System-Tests'
					with: [ spec
						requires: #('Kepler-SystemBasedTests');
						postLoadDoIt: #registerTestInterface ];
				package: 'Kepler-Time-Tests' with: [ spec requires: #('Kepler-Time') ];
				package: 'Kepler-Notifications-Tests' with: [ spec requires: #('Kepler-Notifications' 'Kepler-SystemBasedTests') ].
			spec
				group: 'Deployment' with: #('Kepler-Identifier' 'Kepler-System' 'Kepler-Time' 'Kepler-Notifications');
				group: 'Tests' with: #('Kepler-Identifier-Tests' 'Kepler-System-Tests' 'Kepler-Time-Tests' 'Kepler-Notifications-Tests');
				group: 'SystemBasedTests' with: #('Kepler-SystemBasedTests');
				group: 'Development' with: #('Deployment' 'Tests' 'SystemBasedTests');
				group: 'default' with: #('Deployment').
			spec preLoadDoIt: #preload:package: ]
]

{ #category : #actions }
BaselineOfKepler >> preload: aLoader package: aPackageSpec [

	Smalltalk at: #Interfaces put: nil.
	Smalltalk at: #SystemInterfaceRegistry put: nil.

]

{ #category : #actions }
BaselineOfKepler >> registerEventNotificationSystemInterface [

	self
		registerInterfaceAs: #EventNotificationSystemInterface
		named: 'Event Notification System Interface'
		offering:
			#(#subscribe:to:toBeNotifiedSending: #revokeSubscriptionTo:of: #notifySubscribersTo:)
]

{ #category : #actions }
BaselineOfKepler >> registerInterfaceAs: aKey named: aName offering: messagesSet [

	Interfaces registerNamed: aName offering: messagesSet as: aKey 
]

{ #category : #actions }
BaselineOfKepler >> registerSystemInterfaces [

	Interfaces := SystemInterfaceRegistry empty.
	
	self
		registerTimeSystemInterface;
		registerEventNotificationSystemInterface
]

{ #category : #actions }
BaselineOfKepler >> registerTestInterface [

	self
		registerInterfaceAs: #TestInterface
		named: 'Test Interface'
		offering: #(#currentDateTime)
]

{ #category : #actions }
BaselineOfKepler >> registerTimeSystemInterface [

	self
		registerInterfaceAs: #TimeSystemInterface
		named: 'Time System Interface'
		offering: #(#dateTime #timeOfDay)
]

{ #category : #baselines }
BaselineOfKepler >> setUpDependencies: spec [

	spec
		baseline: 'Buoy'
		with: [ spec
				repository: 'github://ba-st/Buoy:v4.1.0/source';
				loads: #('Deployment') ].
	spec
		baseline: 'Chalten'
		with: [ spec
				repository: 'github://ba-st/chalten:v6.0.0/repository';
				loads: #('Core') ]
]
