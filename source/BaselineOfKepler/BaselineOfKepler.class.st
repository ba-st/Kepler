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
				package: 'Kepler-System' with: [ spec requires: #('Buoy') ];
				group: 'Core' with: #('Kepler-System').

			spec
				package: 'Kepler-Time' with: [ spec requires: #('Core' 'Chalten') ];
				package: 'Kepler-Notifications' with: [ spec requires: #('Core') ];
				group: 'Extended' with: #('Kepler-Time' 'Kepler-Notifications').

			spec
				package: 'Kepler-SystemBasedTests' with: [ spec requires: #('Core') ];
				group: 'SUnit' with: #('Kepler-SystemBasedTests').

			spec
				package: 'Kepler-System-Tests' with: [ spec requires: #('Core') ];
				package: 'Kepler-Time-Tests' with: [ spec requires: #('Kepler-Time') ];
				package: 'Kepler-Notifications-Tests' with: [ spec requires: #('Kepler-Notifications' 'SUnit') ].

			spec
				group: 'Deployment' with: #('Core' 'Extended');
				group: 'Tests' with: #('Kepler-System-Tests' 'Kepler-Time-Tests' 'Kepler-Notifications-Tests');
				group: 'Development' with: #('Deployment' 'Tests');
				group: 'default' with: #('Deployment') ]
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
