| symbolDictionary |

symbolDictionary := Rowan image 
	symbolDictNamed: 'Kepler'
	ifAbsent: [Error signal: 'Kepler symbol dictionary missing' ].

"Global variables definition"
symbolDictionary
	at: #SystemInterfaces
	ifPresent: [:namespace | namespace ifNil: [symbolDictionary at: #SystemInterfaces put: Namespace new]]
	ifAbsentPut: [Namespace new "anyway, should never happen because preload script defines it"].

"Register Kepler's built-in system interfaces"
(OrderedCollection new
	add: #InstalledModuleRegistrationSystem;
	add: #EventNotificationSystem;
	add: #TimeSystem;
	yourself)
		do: [:each | (symbolDictionary at: each) registerInterfaces].
