"
I'm a Shared Pool providing access to the Kepler namespace
"
Class {
	#name : #Kepler,
	#superclass : #SharedPool,
	#classVars : [
		'SystemInterfaces'
	],
	#category : #'Kepler-System'
}

{ #category : #'class initialization' }
Kepler class >> initialize [

	<ignoreForCoverage>
	SystemInterfaces := Namespace new.
	self
		register: (Interface named: 'Installed Module Registration' declaring: #(#registerAsInstalled: #installedModules #ifNotRegisteredAsInstalled:do: #installedModuleRegisteringSystemImplementing:))
		as: #InstalledModuleRegistrationSystem
]

{ #category : #configuring }
Kepler class >> register: anInterface as: anInterfaceKey [

	<ignoreForCoverage>
	SystemInterfaces bind: anInterfaceKey to: anInterface
]
