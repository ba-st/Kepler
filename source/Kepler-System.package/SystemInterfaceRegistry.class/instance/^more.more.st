lookup
>> aKey

	^ interfaces
		at: aKey
		ifAbsent: [ Error signal: ('System interface not found under #<1s>' expandMacrosWith: aKey) ]