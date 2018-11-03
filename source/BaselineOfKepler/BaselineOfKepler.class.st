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
				package: 'Kepler-System'
					with: [ spec requires: #('Buoy').
					spec postLoadDoIt: #registerSystemInterfaces ];
				package: 'Kepler-Time' with: [ spec requires: #('Kepler-System' 'Chalten') ];
				package: 'Kepler-Notifications' with: [ spec requires: #('Kepler-System') ].
			
			spec
				package: 'Kepler-SystemBasedTests' with: [ spec requires: #('Kepler-System' 'Kepler-Time') ];
				package: 'Kepler-System-Tests'
					with: [ spec
						requires: #('Kepler-SystemBasedTests');
						postLoadDoIt: #registerTestInterface ];
				package: 'Kepler-Time-Tests' with: [ spec requires: #('Kepler-Time') ];
				package: 'Kepler-Notifications-Tests' with: [ spec requires: #('Kepler-Notifications' 'Kepler-SystemBasedTests') ].
			spec
				group: 'Deployment' with: #('Kepler-System' 'Kepler-Time' 'Kepler-Notifications');
				group: 'Tests' with: #('Kepler-System-Tests' 'Kepler-Time-Tests' 'Kepler-Notifications-Tests');
				group: 'SystemBasedTests' with: #('Kepler-SystemBasedTests');
				group: 'Development' with: #('Deployment' 'Tests' 'SystemBasedTests');
				group: 'default' with: #('Deployment').
			spec preLoadDoIt: #preload:package: ]
]

{ #category : #actions }
BaselineOfKepler >> initializeSysteInterfaceNamespace [

	SystemInterface ifNil: [ SystemInterface := Namespace new ]
]

{ #category : #actions }
BaselineOfKepler >> preload: aLoader package: aPackageSpec [

	Smalltalk at: #SystemInterface ifAbsentPut: nil.


]

{ #category : #actions }
BaselineOfKepler >> registerEventNotificationSystemInterface [

	self
		registerInterfaceAs: #EventNotificationSystemInterface
		named: 'Event Notification System Interface'
		declaring:
			#(#subscribe:to:toBeNotifiedSending: #revokeSubscriptionTo:of: #notifySubscribersTo:)
]

{ #category : #actions }
BaselineOfKepler >> registerInterfaceAs: aKey named: aName declaring: aSelectorSet [

	SystemInterface
		bind: aKey
		to: (Interface named: aName declaring: aSelectorSet)
]

{ #category : #actions }
BaselineOfKepler >> registerSystemInterfaces [

	self
		initializeSysteInterfaceNamespace;
		registerTimeSystemInterface;
		registerEventNotificationSystemInterface
]

{ #category : #actions }
BaselineOfKepler >> registerTestInterface [

	self
		registerInterfaceAs: #TestInterface
		named: 'Test Interface'
		declaring: #(#currentDateTime)
]

{ #category : #actions }
BaselineOfKepler >> registerTimeSystemInterface [

	self
		registerInterfaceAs: #TimeSystemInterface
		named: 'Time System Interface'
		declaring: #(#dateTime #timeOfDay)
]

{ #category : #baselines }
BaselineOfKepler >> setUpDependencies: spec [

	spec
		baseline: 'Buoy'
		with: [ spec
				repository: 'github://ba-st/Buoy:v4/source';
				loads: #('Deployment') ].
	spec
		baseline: 'Chalten'
		with: [ spec
				repository: 'github://ba-st/chalten:development/repository';
				loads: #('Deployment') ]
]
