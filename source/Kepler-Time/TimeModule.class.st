Class {
	#name : #TimeModule,
	#superclass : #SystemModule,
	#instVars : [
		'rootSystem'
	],
	#category : #'Kepler-Time'
}

{ #category : #'instance creation' }
TimeModule class >> toInstallOn: aCompositeSystem [

	^ self new initializeToInstallOn: aCompositeSystem
]

{ #category : #initialization }
TimeModule >> initializeToInstallOn: aCompositeSystem [

	rootSystem := aCompositeSystem
]

{ #category : #private }
TimeModule >> name [

	^ 'Time'
]

{ #category : #private }
TimeModule >> registerTimeSystemForInstallationIn: systems [

	^ self register: [ TimeSystem using: SystemTimeSource new ] in: systems
]

{ #category : #private }
TimeModule >> rootSystem [

	^ rootSystem
]

{ #category : #private }
TimeModule >> systemInterfacesToInstall [

	^ #(#TimeSystemInterface)
]
