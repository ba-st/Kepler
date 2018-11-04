Class {
	#name : #CompositeSystem,
	#superclass : #SystemImplementation,
	#instVars : [
		'systems'
	],
	#category : 'Kepler-System'
}

{ #category : #'instance creation' }
CompositeSystem class >> of: aSystemsCollection [

	^self new initializeOf: aSystemsCollection
]

{ #category : #initialization }
CompositeSystem >> initializeOf: aSystemsCollection [

	self initialize.
	systems := aSystemsCollection.
	
	self registerAsSystemsParent
]

{ #category : #initialization }
CompositeSystem >> registerAsSystemsParent [

	systems do: [ :system | system parent: self ]
]

{ #category : #'starting - stopping' }
CompositeSystem >> shutDown [

	systems do: [ :system | system shutDown ]
]

{ #category : #'starting - stopping' }
CompositeSystem >> startUp [

	systems do: [ :system | system startUp ]
]

{ #category : #'system lookup' }
CompositeSystem >> systemImplementing: anInterfaceName [

	^ self
		systemImplementing: anInterfaceName
		ifNone: [ Error
				signal:
					('System implementing ''<1p>'' not found'
						expandMacrosWith: SystemInterface >> anInterfaceName) ]
]

{ #category : #'system lookup' }
CompositeSystem >> systemImplementing: anInterfaceName ifNone: aNoneBlock [

	^ systems
		detect: [ :subsystem | subsystem implements: SystemInterface >> anInterfaceName ]
		ifNone: aNoneBlock
]
