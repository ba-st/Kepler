running
buildAndStartUpSystem

	systemBuilder := CompositeSystemBuilder new.
	self setUpRequirements.
	rootSystem := systemBuilder build.

	rootSystem startUp