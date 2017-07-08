baselines
baseline: spec

	<baseline>
	spec
		for: #common
		do: [ self setUpDependencies: spec.
			spec
				package: 'Kepler-Identifier';
				package: 'Kepler-System' with: [ spec requires: #('Buoy') ];
				package: 'Kepler-Time' with: [ spec requires: #('Kepler-System') ];
				package: 'Kepler-Notifications' with: [ spec requires: #('Kepler-System') ].
			spec
				package: 'Kepler-Identifier-Tests' with: [ spec requires: #('Kepler-Identifier') ];
				package: 'Kepler-System-Tests' with: [ spec requires: #('Kepler-System' 'Kepler-Identifier') ];
				package: 'Kepler-Time-Tests' with: [ spec requires: #('Kepler-Time') ];
				package: 'Kepler-SystemBasedTests' with: [ spec requires: #('Kepler-System' 'Kepler-Identifier' 'Kepler-Time') ];
				package: 'Kepler-Notifications-Tests' with: [ spec requires: #('Kepler-Notifications' 'Kepler-SystemBasedTests') ].
			spec
				group: 'Deployment' with: #('Kepler-Identifier' 'Kepler-System' 'Kepler-Time' 'Kepler-Notifications');
				group: 'Tests' with: #('Kepler-Identifier-Tests' 'Kepler-System-Tests' 'Kepler-Time-Tests' 'Kepler-Notifications-Tests');
				group: 'SystemBasedTests' with: #('Kepler-SystemBasedTests');
				group: 'Development' with: #('Deployment' 'Tests' 'SystemBasedTests');
				group: 'default' with: #('Deployment').
			spec postLoadDoIt: #postload:package:.
			spec preLoadDoIt: #preload:package: ]