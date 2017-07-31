initialize-release
initialize

	super initialize.
	timeSystem := self unresolvedSystemDependencyTo: #TimeSystemInterface.
	started := false