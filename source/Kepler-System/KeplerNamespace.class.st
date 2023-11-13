"
I'm a Shared Pool providing access to the Kepler namespace
"
Class {
	#name : 'KeplerNamespace',
	#superclass : 'SharedPool',
	#classVars : [
		'SystemInterfaces'
	],
	#category : 'Kepler-System',
	#package : 'Kepler-System'
}

{ #category : 'class initialization' }
KeplerNamespace class >> initialize [

	<ignoreForCoverage>
	SystemInterfaces := Namespace new.
	self
		registerInterfaceAt: #InstalledModuleRegistrationSystem
		named: 'Installed Module Registration'
		declaring: #(#registerAsInstalled: #installedModules #ifNotRegisteredAsInstalled:do: #installedModuleRegisteringSystemImplementing:)
]

{ #category : 'configuring' }
KeplerNamespace class >> registerInterfaceAt: aKey named: aName declaring: selectors [

	<ignoreForCoverage>
	SystemInterfaces bind: aKey to: (Interface named: aName declaring: selectors)
]
