"
I represent the ""Stopped"" state of a system. A system in this state cannot be used, but can be started up
"
Class {
	#name : 'SystemStopped',
	#superclass : 'SystemState',
	#category : 'Kepler-System',
	#package : 'Kepler-System'
}

{ #category : 'testing' }
SystemStopped >> isStopped [

	^ true
]

{ #category : 'controlling' }
SystemStopped >> shutDown [

  SystemControlError signal: ( '{1} is already stopped.' localizedWithAll: { system name } )
]

{ #category : 'controlling' }
SystemStopped >> startUp [

	^ system startUpWhenStopped
]
