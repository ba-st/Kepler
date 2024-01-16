"
I'm a global registry of composite systems installed in an image.
I can be optionally used as a persistent root for composite systems.
"
Class {
	#name : 'InstalledSystemsManager',
	#superclass : 'Object',
	#instVars : [
		'managed'
	],
	#classInstVars : [
		'current'
	],
	#category : 'Kepler-System',
	#package : 'Kepler-System'
}

{ #category : 'accessing' }
InstalledSystemsManager class >> current [

	current ifNil: [ current := self new ].
	^ current
]

{ #category : 'adding' }
InstalledSystemsManager >> addSystem: aCompositeSystem as: aName [

	managed bind: aName to: aCompositeSystem
]

{ #category : 'initialization' }
InstalledSystemsManager >> initialize [

	super initialize.
	managed := Namespace new
]

{ #category : 'accessing' }
InstalledSystemsManager >> managedSystems [

	^ managed names collect: [ :name | managed at: name ]
]

{ #category : 'accessing' }
InstalledSystemsManager >> removeSystemAt: aName [

	managed removeBindingFor: aName
]

{ #category : 'accessing' }
InstalledSystemsManager >> systemAt: aName [

	^ managed >> aName
]
