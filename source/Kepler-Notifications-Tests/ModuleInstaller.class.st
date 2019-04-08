Class {
	#name : #ModuleInstaller,
	#superclass : #Object,
	#instVars : [
		'modulesToInstall'
	],
	#category : #'Kepler-Notifications-Tests'
}

{ #category : #initialization }
ModuleInstaller class >> installing: aModule in: aCompositeSystem [ 
	
	^ self installingAll: (Array with: aModule) in: aCompositeSystem
	
]

{ #category : #'instance creation' }
ModuleInstaller class >> installingAll: aModuleCollection in: aCompositeSystem [ 

	^ self new initializeInstallingAll: aModuleCollection in: aCompositeSystem
]

{ #category : #initialization }
ModuleInstaller >> initializeInstallingAll: aModuleCollection in: aCompositeSystem [

	aCompositeSystem register: InstalledModuleRegistrationSystem new.
	modulesToInstall := aModuleCollection
		collect: [ :module | module toInstallOn: aCompositeSystem ]
]

{ #category : #'as yet unclassified' }
ModuleInstaller >> install [
	
	modulesToInstall do: [ :moduleInstance | moduleInstance install ]
]
