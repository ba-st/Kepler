Extension { #name : 'CompositeSystem' }

{ #category : '*Kepler-Development-Tools' }
CompositeSystem >> subsystemsInspectorTab [

	<inspectorPresentationOrder: 0 title: 'Subsystems'>
	^ SpTablePresenter new
		  items: subsystems;
		  addColumn: ( SpStringTableColumn title: 'Name' evaluated: [ :subsystem | subsystem name ] );
		  addColumn: ( SpStringTableColumn
				    title: 'Implemented interfaces'
				    evaluated: [ :subsystem | subsystem implementedInterfaces ] );
		  addColumn:
			  ( SpStringTableColumn title: 'Dependencies' evaluated: [ :subsystem | subsystem dependencies ] );
		  addColumn: ( ( SpStringTableColumn
				      title: 'Status'
				      evaluated: [ :subsystem | subsystem isStarted then: [ 'Started' ] otherwise: 'Stopped' ] )
				    width: 80;
				    yourself );
		  yourself
]
