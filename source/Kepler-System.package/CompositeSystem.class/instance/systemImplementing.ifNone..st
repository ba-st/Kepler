system lookup
systemImplementing: aSystemInterface ifNone: aNoneBlock

	^ systems
		detect: [ :subsystem | subsystem implements: aSystemInterface ]
		ifNone: aNoneBlock