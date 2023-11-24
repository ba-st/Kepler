"
I'm a system responsible for keeping the record of the installed modules for a system.
"
Class {
	#name : 'InstalledModuleRegistrationSystem',
	#superclass : 'SubsystemImplementation',
	#instVars : [
		'installedModules'
	],
	#category : 'Kepler-System',
	#package : 'Kepler-System'
}

{ #category : 'registering' }
InstalledModuleRegistrationSystem class >> registerInterfaces [
<ignoreForCoverage>
	self
		registerInterfaceAt: #InstalledModuleRegistrationSystem
		named: 'Installed Module Registration'
		declaring:
			#( #registerAsInstalled: #installedModules #ifNotRegisteredAsInstalled:do:
			   #installedModuleRegisteringSystemImplementing: )
]

{ #category : 'installing' }
InstalledModuleRegistrationSystem >> dependencies [

	^ #()
]

{ #category : 'API' }
InstalledModuleRegistrationSystem >> ifNotRegisteredAsInstalled: aSystemModule do: aBlock [

	installedModules detect: [ :module | module isEquivalentTo: aSystemModule ] ifNone: aBlock
]

{ #category : 'installing' }
InstalledModuleRegistrationSystem >> implementedInterfaces [

	^ #(#InstalledModuleRegistrationSystem)
]

{ #category : 'initialization' }
InstalledModuleRegistrationSystem >> initialize [

	super initialize.
	installedModules := OrderedCollection new
]

{ #category : 'API' }
InstalledModuleRegistrationSystem >> installedModuleRegisteringSystemImplementing: anInterfaceKey [

	^installedModules 
		detect: [:aModule | aModule systemInterfacesToInstall includes: anInterfaceKey]
		ifNone: [ ObjectNotFound signal: ('No module found installing "<1s>"' expandMacrosWith: anInterfaceKey ) ]
]

{ #category : 'API' }
InstalledModuleRegistrationSystem >> installedModules [

	^installedModules copy
]

{ #category : 'accessing' }
InstalledModuleRegistrationSystem >> name [

	^ 'Installed Module Registration'
]

{ #category : 'API' }
InstalledModuleRegistrationSystem >> registerAsInstalled: aSystemModule [

	installedModules detect: [ :module | module isEquivalentTo: aSystemModule ] ifFound: [ :module | installedModules remove: module ].
	installedModules add: aSystemModule
]
