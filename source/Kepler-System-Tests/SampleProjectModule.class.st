"
I'm a sample system module installing a project management system
"
Class {
	#name : #SampleProjectModule,
	#superclass : #SystemModule,
	#instVars : [
		'rootSystem'
	],
	#category : #'Kepler-System-Tests'
}

{ #category : #'instance creation' }
SampleProjectModule class >> toInstallOn: aCompositeSystem [ 

	^self new initializeToInstallOn: aCompositeSystem 
]

{ #category : #initialization }
SampleProjectModule >> initializeToInstallOn: aCompositeSystem [ 
	
	rootSystem := aCompositeSystem 
]

{ #category : #private }
SampleProjectModule >> registerProjectManagementSystemForInstallationIn: systems [

	^ self register: [ SampleProjectSystem new ] in: systems
]

{ #category : #private }
SampleProjectModule >> rootSystem [

	^ rootSystem
]

{ #category : #private }
SampleProjectModule >> systemInterfacesToInstall [

	^ #(#ProjectManagementSystem)
]
