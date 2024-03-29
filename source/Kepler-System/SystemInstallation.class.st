"
I' an abstract class representing a system installation. 
- For simple cases just create a new composite system and register some subsystems.
- For complex scenarios it's better to subclass me and use the module system.

I will install a module management system, used for reinstall and reapplying configuration.
Subclasses will need to provide a set of modules to install.

"
Class {
	#name : 'SystemInstallation',
	#superclass : 'Object',
	#category : 'Kepler-System',
	#package : 'Kepler-System'
}

{ #category : 'installing' }
SystemInstallation >> beAwareOfShutDownOf: aCompositeSystem [ 

	self subclassResponsibility
]

{ #category : 'installing' }
SystemInstallation >> install: aVersionName [

	| rootSystem |
	
	rootSystem := CompositeSystem installedBy: self.
	self registerModuleRegistrationSystemOn: rootSystem.
	self modulesToInstall do: [ :module | (module toInstallOn: rootSystem) install ].
	^ rootSystem
]

{ #category : 'accessing' }
SystemInstallation >> modulesToInstall [

	"Subclasses need to provide a set of module factories to be installed, they will be instantiated against the rootSystem"

	self subclassResponsibility
]

{ #category : 'accessing' }
SystemInstallation >> name [

	self subclassResponsibility
]

{ #category : 'private' }
SystemInstallation >> registerModuleRegistrationSystemOn: aRootSystem [

	aRootSystem register: InstalledModuleRegistrationSystem new
]

{ #category : 'installing' }
SystemInstallation >> reinstallOn: aCompositeSystem [

	(aCompositeSystem >> #InstalledModuleRegistrationSystem) installedModules do: [ :module | module reinstall ]
]
