# Installation

## Basic Installation

You can load **Kepler** evaluating:
```smalltalk
Metacello new
  	baseline: 'Kepler';
  	repository: 'github://ba-st/Kepler:master/source';
	load.
```
>  Change `master` to some released version if you want a pinned version

## Using as dependency

In order to include **Kepler** as part of your project, you should reference the package in your product baseline:

```smalltalk
setUpDependencies: spec

	spec
		baseline: 'Kepler'
			with: [ spec
				repository: 'github://ba-st/Kepler:v{XX}/source';
				loads: #('Deployment') ];
		import: 'Kepler'.
```
> Replace `{XX}` with the version you want to depend on

```smalltalk
baseline: spec

	<baseline>
	spec
		for: #common
		do: [ self setUpDependencies: spec.
			spec package: 'My-Package' with: [ spec requires: #('Kepler') ] ]
```
