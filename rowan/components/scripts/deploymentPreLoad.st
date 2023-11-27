| symbolDictionary |
symbolDictionary := Rowan image 
	symbolDictNamed: 'Kepler'
	ifAbsent: [
			Rowan image symbolList createDictionaryNamed: 'Kepler' at: Rowan image symbolList size + 1.
			Rowan image symbolDictNamed: 'Kepler'
	].

"Preliminar definition of global variables for source code to compile.
 These will be properly replaced later in the post load script."
symbolDictionary at: #SystemInterfaces put: nil.
