Class {
	#name : 'KeplerTranslationUnitsExport',
	#superclass : 'Object',
	#category : 'Kepler-Development-Tools',
	#package : 'Kepler-Development-Tools'
}

{ #category : 'examples' }
KeplerTranslationUnitsExport class >> run [

  <example>
  <ignoreForCoverage>
  | scanner |
  scanner := NaturalLanguageTranslationScanner forProjectNamed: 'Kepler'.
  scanner export
]
