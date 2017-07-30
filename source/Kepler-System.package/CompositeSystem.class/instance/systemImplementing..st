system lookup
systemImplementing: aSystemInterface

	^ self
		systemImplementing: Interfaces >> aSystemInterface
		ifNone: [ SystemImplementationNotFound signal: aSystemInterface ]