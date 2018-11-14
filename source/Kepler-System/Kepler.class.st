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
		registerInterfaceAt: #InstalledModuleRegistrationSystem
		named: 'Installed Module Registration'
		declaring: #(#registerAsInstalled: #installedModules #ifNotRegisteredAsInstalled:do: #installedModuleRegisteringSystemImplementing:)
]

{ #category : #configuring }
Kepler class >> registerInterfaceAt: aKey named: aName declaring: selectors [

	<ignoreForCoverage>
	SystemInterfaces bind: aKey to: (Interface named: aName declaring: selectors)
]
