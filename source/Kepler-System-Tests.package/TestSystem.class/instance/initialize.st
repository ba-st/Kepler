initialize-release
initialize

	super initialize.
	timeSystem := self unresolvedSystemDependencyTo: Interfaces >> #TimeSystemInterface.
	started := false