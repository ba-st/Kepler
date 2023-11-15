Class {
	#name : 'BaselineOfKepler',
	#superclass : 'BaselineOf',
	#category : 'BaselineOfKepler',
	#package : 'BaselineOfKepler'
}

{ #category : 'baselines' }
BaselineOfKepler >> baseline: spec [

	<baseline>
	spec
		for: #pharo
		do: [ self
				setUpDependencies: spec;
				setUpPackages: spec.
			spec
				group: 'Deployment' with: #('Core' 'Extended');
				group: 'CI' with: 'Tests';
				group: 'Tools' with: 'Buoy-Tools';
				group: 'Development' with: #('Tests' 'Tools').
			spec postLoadDoIt: #postLoadInitialization
			].
	spec for: #'pharo10.x' do: [ self setUpPharo10Packages: spec ]
]

{ #category : 'post load' }
BaselineOfKepler >> postLoadInitialization [

	Smalltalk at: #SystemInterfaces put: Namespace new.
	self registerInstalledModuleRegistrationSystemInterface.
	self registerEventNotificationSystemInterface.
	self registerTimeSystemInterface.
	self registerKeplerSystemTestsInterfaces
]

{ #category : 'accessing' }
BaselineOfKepler >> projectClass [

	^ MetacelloCypressBaselineProject
]

{ #category : 'post load' }
BaselineOfKepler >> registerEventNotificationSystemInterface [

	self
		registerInterfaceAt: #EventNotificationSystemInterface
		named: 'Event Notification System Interface'
		declaring: #( #subscribe:to:toBeNotifiedSending:
			   #revokeSubscriptionTo:of: #notifySubscribersTo: )
]

{ #category : 'post load' }
BaselineOfKepler >> registerInstalledModuleRegistrationSystemInterface [

	self
		registerInterfaceAt: #InstalledModuleRegistrationSystem
		named: 'Installed Module Registration'
		declaring:
			#( #registerAsInstalled: #installedModules #ifNotRegisteredAsInstalled:do:
			   #installedModuleRegisteringSystemImplementing: )
]

{ #category : 'post load' }
BaselineOfKepler >> registerInterfaceAt: aKey named: aName declaring: selectors [

	Smalltalk
		at: aKey
		ifPresent: [ :systemClass |
			SystemImplementation
				registerInterfaceAt: aKey
				named: aName
				declaring: selectors ]
		ifAbsent: [ "do nothing because package must not be loaded" ]
]

{ #category : 'post load' }
BaselineOfKepler >> registerKeplerSystemTestsInterfaces [

	self
		registerInterfaceAt: #CustomerQueryingSystem
		named: 'Customer Querying'
		declaring: #( #customers );
		registerInterfaceAt: #CustomerManagementSystem
		named: 'Customer Management'
		declaring: #( #addCustomer: );
		registerInterfaceAt: #ProjectManagementSystem
		named: 'Project Management'
		declaring: #( #addProjectNamed:for: #projectsFor: )
]

{ #category : 'post load' }
BaselineOfKepler >> registerTimeSystemInterface [

	self
		registerInterfaceAt: #TimeSystemInterface
		named: 'Time System Interface'
		declaring: #( #dateTime #timeOfDay )
]

{ #category : 'baselines' }
BaselineOfKepler >> setUpDependencies: spec [

	spec
		baseline: 'Buoy' with: [ spec repository: 'github://ba-st/Buoy:v6' ];
		project: 'Buoy-Deployment' copyFrom: 'Buoy' with: [ spec loads: 'Deployment' ];
		project: 'Buoy-SUnit' copyFrom: 'Buoy' with: [ spec loads: 'Dependent-SUnit-Extensions' ];
		project: 'Buoy-Tools' copyFrom: 'Buoy' with: [ spec loads: 'Tools' ].

	spec
		baseline: 'Chalten' with: [ spec repository: 'github://ba-st/Chalten:v8' ];
		project: 'Chalten-Gregorian' copyFrom: 'Chalten' with: [ spec loads: 'Chalten-Gregorian-Calendar' ]
]

{ #category : 'baselines' }
BaselineOfKepler >> setUpPackages: spec [

	spec
		package: 'Kepler-System' with: [ spec requires: 'Buoy-Deployment' ];
		group: 'Core' with: 'Kepler-System';
		package: 'Kepler-Time' with: [ spec requires: #('Core' 'Chalten-Gregorian') ];
		group: 'Extended' with: 'Kepler-Time';
		package: 'Kepler-Notifications' with: [ spec requires: 'Core' ];
		group: 'Extended' with: 'Kepler-Notifications';
		package: 'Kepler-SUnit-Model' with: [ spec requires: #('Core' 'Buoy-SUnit') ];
		group: 'Dependent-SUnit-Extensions' with: 'Kepler-SUnit-Model'.

	spec
		package: 'Kepler-System-Tests' with: [ spec requires: #('Core' 'Buoy-SUnit') ];
		group: 'Tests' with: 'Kepler-System-Tests';
		package: 'Kepler-Time-Tests' with: [ spec requires: 'Kepler-Time' ];
		group: 'Tests' with: 'Kepler-Time-Tests';
		package: 'Kepler-Notifications-Tests'
			with: [ spec requires: #('Kepler-Notifications' 'Kepler-SUnit-Model') ];
		group: 'Tests' with: 'Kepler-Notifications-Tests'
]

{ #category : 'initialization' }
BaselineOfKepler >> setUpPharo10Packages: spec [

	spec
		package: 'Kepler-Development-Tools' with: [ spec requires: 'Kepler-System' ];
		group: 'Tools' with: 'Kepler-Development-Tools'
]
