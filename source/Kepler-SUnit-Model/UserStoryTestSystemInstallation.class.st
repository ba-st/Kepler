"
I'm a sample installation used for testing purposes
"
Class {
	#name : #UserStoryTestSystemInstallation,
	#superclass : #SystemInstallation,
	#instVars : [
		'modules'
	],
	#category : #'Kepler-SUnit-Model'
}

{ #category : #'instance creation' }
UserStoryTestSystemInstallation class >> installing: aModuleCollection [

	^self new initializeInstalling: aModuleCollection
]

{ #category : #installing }
UserStoryTestSystemInstallation >> beAwareOfShutDownOf: aCompositeSystem [
]

{ #category : #initialization }
UserStoryTestSystemInstallation >> initializeInstalling: aModuleCollection [

	modules := aModuleCollection 
]

{ #category : #accessing }
UserStoryTestSystemInstallation >> modulesToInstall [

	^ modules
]

{ #category : #accessing }
UserStoryTestSystemInstallation >> name [

	^ 'User story'
]
