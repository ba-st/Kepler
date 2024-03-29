Class {
	#name : 'BaselineOfKepler',
	#superclass : 'BaselineOf',
	#category : 'BaselineOfKepler',
	#package : 'BaselineOfKepler'
}

{ #category : 'baselines' }
BaselineOfKepler >> baseline: spec [

	<baseline>
	spec for: #pharo do: [
		self
			setUpDependencies: spec;
			setUpPackages: spec.
		spec
			group: 'Deployment' with: #( 'Core' 'Extended' );
			group: 'CI' with: 'Tests';
			group: 'Tools' with: #( 'Buoy-Tools' 'Deployment' );
			group: 'Development' with: #( 'Tests' 'Tools' );
			group: 'default' with: 'Development'.
		spec postLoadDoIt: #postLoadInitialization
		].
	spec for: #( 'pharo10.x' 'pharo11.x' 'pharo12.x' ) do: [ self setUpPharo10Packages: spec ]
]

{ #category : 'post load' }
BaselineOfKepler >> postLoadInitialization [

	Smalltalk at: #SystemInterfaces put: Namespace new.
	SubsystemImplementation allSubclassesDo: [ :each | each registerInterfaces ]
]

{ #category : 'accessing' }
BaselineOfKepler >> projectClass [

	^ MetacelloCypressBaselineProject
]

{ #category : 'baselines' }
BaselineOfKepler >> setUpDependencies: spec [

	spec
		baseline: 'Buoy' with: [ spec repository: 'github://ba-st/Buoy:v7' ];
		project: 'Buoy-Deployment' copyFrom: 'Buoy' with: [ spec loads: 'Deployment' ];
		project: 'Buoy-SUnit' copyFrom: 'Buoy' with: [ spec loads: 'Dependent-SUnit-Extensions' ];
		project: 'Buoy-Tools' copyFrom: 'Buoy' with: [ spec loads: 'Tools' ].

	spec
		baseline: 'Chalten' with: [ spec repository: 'github://ba-st/Chalten:v9' ];
		project: 'Chalten-Deployment-Gregorian' copyFrom: 'Chalten' with: [ spec loads: 'Deployment-Gregorian' ].
]

{ #category : 'baselines' }
BaselineOfKepler >> setUpPackages: spec [

	spec
		package: 'Kepler-System' with: [ spec requires: 'Buoy-Deployment' ];
		group: 'Core' with: 'Kepler-System';
		package: 'Kepler-Time' with: [ spec requires: #('Core' 'Chalten-Deployment-Gregorian') ];
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
