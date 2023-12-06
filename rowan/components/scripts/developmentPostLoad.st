| symbolDictionary |

symbolDictionary := Rowan image 
	symbolDictNamed: 'Kepler'
	ifAbsent: [Error signal: 'Kepler symbol dictionary missing' ].

"Register Kepler's built-in system interfaces"
(OrderedCollection new
	add: #InstalledModuleRegistrationSystem;
	add: #EventNotificationSystem;
	add: #TimeSystem;
	add: #FixedCustomerManagementSystem;
	add: #FixedCustomerSystem;
	add: #SampleCustomerSystem;
	add: #SampleProjectSystem;
	yourself)
		do: [:each | (symbolDictionary at: each) registerInterfaces].
