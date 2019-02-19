Class {
	#name : #BaselineOfKepler,
	#superclass : #BaselineOf,
	#category : #BaselineOfKepler
}

{ #category : #baselines }
BaselineOfKepler >> baseline: spec [

	<baseline>
	spec
		for: #pharo
		do: [ self
				setUpDependencies: spec;
				baselineKepler: spec.
			spec
				group: 'Deployment' with: #('Core' 'Extended');
				group: 'CI' with: 'Tests';
				group: 'Tools' with: 'Buoy-Tools';
				group: 'Development' with: #('Tests' 'Tools')
			]
]

{ #category : #baselines }
BaselineOfKepler >> baselineKepler: spec [

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
		package: 'Kepler-System-Tests' with: [ spec requires: 'Core' ];
		group: 'Tests' with: 'Kepler-System-Tests';
		package: 'Kepler-Time-Tests' with: [ spec requires: 'Kepler-Time' ];
		group: 'Tests' with: 'Kepler-Time-Tests';
		package: 'Kepler-Notifications-Tests'
			with: [ spec requires: #('Kepler-Notifications' 'Kepler-SUnit-Model') ];
		group: 'Tests' with: 'Kepler-Notifications-Tests'
]

{ #category : #accessing }
BaselineOfKepler >> projectClass [

	^ MetacelloCypressBaselineProject
]

{ #category : #baselines }
BaselineOfKepler >> setUpDependencies: spec [

	spec
		baseline: 'Buoy' with: [ spec repository: 'github://ba-st/Buoy:v5/source' ];
		project: 'Buoy-Deployment' copyFrom: 'Buoy' with: [ spec loads: 'Deployment' ];
		project: 'Buoy-SUnit' copyFrom: 'Buoy' with: [ spec loads: 'Dependent-SUnit-Extensions' ];
		project: 'Buoy-Tools' copyFrom: 'Buoy' with: [ spec loads: 'Tools' ].

	spec
		baseline: 'Chalten' with: [ spec repository: 'github://ba-st/Chalten:v8/repository' ];
		project: 'Chalten-Gregorian' copyFrom: 'Chalten' with: [ spec loads: 'Chalten-Gregorian-Calendar' ]
]
