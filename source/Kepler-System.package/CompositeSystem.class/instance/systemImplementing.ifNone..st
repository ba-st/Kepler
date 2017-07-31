system lookup
systemImplementing: anInterfaceName ifNone: aNoneBlock

	^ systems detect: [ :subsystem | subsystem implements: Interfaces >> anInterfaceName ] ifNone: aNoneBlock