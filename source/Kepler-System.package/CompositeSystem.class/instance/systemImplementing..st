system lookup
systemImplementing: anInterfaceName

	^ self systemImplementing: anInterfaceName ifNone: [ Error signal: ('System implementing ''<1s>'' not found' expandMacrosWith: (Interfaces >> anInterfaceName) name) ]