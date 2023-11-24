| symbolDictionary |

symbolDictionary := Rowan image 
	symbolDictNamed: 'Kepler'
	ifAbsent: [Error signal: 'Kepler symbol dictionary missing' ].

"Global variables definition"
symbolDictionary at: #SystemInterfaces put: Namespace new.

"Register Kepler's built-in system interfaces"
(OrderedCollection new
	add: #InstalledModuleRegistrationSystem;
	add: #EventNotificationSystem;
	add: #TimeSystem;
	yourself)
		do: [:each | (symbolDictionary at: each) registerInterfaces].
