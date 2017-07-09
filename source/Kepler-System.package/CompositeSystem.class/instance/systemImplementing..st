system lookup
systemImplementing: aSystemInterface

	^ self
		systemImplementing: aSystemInterface
		ifNone: [ SystemImplementationNotFound signal: aSystemInterface ]