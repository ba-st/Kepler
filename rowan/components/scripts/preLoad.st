| symbolDictionary |
symbolDictionary := Rowan image 
	symbolDictNamed: 'KeplerCore'
	ifAbsent: [
			Rowan image symbolList createDictionaryNamed: 'KeplerCore' at: Rowan image symbolList size + 1.
			Rowan image symbolDictNamed: 'KeplerCore'
	].

"Preliminar definition of global variables for source code to compile.
 These will be properly replaced later in the post load script."
symbolDictionary at: #SystemInterfaces put: nil.
