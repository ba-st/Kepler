Class {
	#name : 'SystemInterfacesInitialization',
	#superclass : 'Object',
	#category : 'Kepler-GS64-Extensions-',
	#package : 'Kepler-GS64-Extensions',
	#tag : ''
}

{ #category : 'class initialization' }
SystemInterfacesInitialization class >> initialize [

	LanguagePlatform current
		globalNamed: #Kepler
		ifPresent: [ :symbolDictionary |
			symbolDictionary
				at: #SystemInterfaces
				ifPresent: [ :namespace |
					namespace ifNil: [
						symbolDictionary at: #SystemInterfaces put: Namespace new ] ]
				ifAbsentPut: [
					Namespace new "anyway, should never happen because preload script defines it" ] ]
		ifAbsent: [
		AssertionFailed signal: 'Kepler symbol dictionary not found' ]
]
