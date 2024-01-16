"
An InstalledSystemsManagerTest is a test class for testing the behavior of InstalledSystemsManager
"
Class {
	#name : 'InstalledSystemsManagerTest',
	#superclass : 'TestCase',
	#instVars : [
		'manager'
	],
	#category : 'Kepler-System-Tests',
	#package : 'Kepler-System-Tests'
}

{ #category : 'running' }
InstalledSystemsManagerTest >> setUp [

	super setUp.
	manager := InstalledSystemsManager new
]

{ #category : 'tests' }
InstalledSystemsManagerTest >> testAddSeveralSystems [

	manager
		addSystem: CompositeSystem new as: #OneSystem;
		addSystem: CompositeSystem new as: #TwoSystem.

	self assert: manager managedSystems size equals: 2
]

{ #category : 'tests' }
InstalledSystemsManagerTest >> testAddSystemAs [

	| composite |

	self assert: manager managedSystems isEmpty.

	composite := CompositeSystem new.
	manager addSystem: composite as: #EmptyRootSystem.

	self
		withTheOnlyOneIn: manager managedSystems
		do: [ :system | self assert: system identicalTo: composite ].

	self assert: ( manager systemAt: #EmptyRootSystem ) identicalTo: composite
]

{ #category : 'tests' }
InstalledSystemsManagerTest >> testCantAddSystemWithSameName [

	manager addSystem: CompositeSystem new as: #EmptyRootSystem.

	self
		should: [ manager addSystem: CompositeSystem new as: #EmptyRootSystem ]
		raise: ConflictingObjectFound
]

{ #category : 'tests' }
InstalledSystemsManagerTest >> testCantFindSystem [

	self should: [ manager systemAt: #RootSystem ] raise: ObjectNotFound
]

{ #category : 'tests' }
InstalledSystemsManagerTest >> testCantRemoveNotFoundSystem [

	self should: [ manager removeSystemAt: #RootSystem ] raise: ObjectNotFound
]

{ #category : 'tests' }
InstalledSystemsManagerTest >> testCurrentIsEmptyOnLoad [

	self assert: InstalledSystemsManager current managedSystems isEmpty
]

{ #category : 'tests' }
InstalledSystemsManagerTest >> testRemoveSystemAt [

	manager addSystem: CompositeSystem new as: #RootSystem.

	self assert: manager managedSystems notEmpty.

	manager removeSystemAt: #RootSystem.

	self assert: manager managedSystems isEmpty
]
