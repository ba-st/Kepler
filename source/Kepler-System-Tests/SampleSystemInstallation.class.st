"
I'm a sample installation used for testing purposes
"
Class {
	#name : 'SampleSystemInstallation',
	#superclass : 'SystemInstallation',
	#instVars : [
		'modules'
	],
	#category : 'Kepler-System-Tests',
	#package : 'Kepler-System-Tests'
}

{ #category : 'instance creation' }
SampleSystemInstallation class >> installing: aModuleCollection [

	^self new initializeInstalling: aModuleCollection
]

{ #category : 'installing' }
SampleSystemInstallation >> beAwareOfShutDownOf: aCompositeSystem [
]

{ #category : 'initialization' }
SampleSystemInstallation >> initializeInstalling: aModuleCollection [

	modules := aModuleCollection 
]

{ #category : 'accessing' }
SampleSystemInstallation >> modulesToInstall [

	^ modules
]

{ #category : 'accessing' }
SampleSystemInstallation >> name [

	^ 'Sample'
]
