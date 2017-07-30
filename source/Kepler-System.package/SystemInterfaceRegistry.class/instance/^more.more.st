lookup
>> aKey

	^ interfaces
		at: aKey
		ifAbsent: [ SystemInterfaceNotFound signal: aKey ]