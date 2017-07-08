baselines
setUpDependencies: spec

	spec
		baseline: 'Buoy'
		with: [ spec
				repository: 'github://ba-st/Buoy:v2.2.0/source';
				loads: #('Deployment') ].
	spec
		baseline: 'Chalten'
		with: [ spec
				repository: 'github://ba-st/chalten:v6.0.0/repository';
				loads: #('Core') ]