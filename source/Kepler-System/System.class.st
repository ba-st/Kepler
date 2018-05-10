Class {
	#name : #System,
	#superclass : #SystemImplementation,
	#instVars : [
		'parentHolder'
	],
	#category : 'Kepler-System'
}

{ #category : #'system specification' }
System class >> implementedInterface [

	self subclassResponsibility 
]

{ #category : #'initialize-release' }
System >> initialize [

	super initialize.
	parentHolder := Binding
		undefinedExplainedBy: 'El subsistema no se encuentra registrado en ningún sistema raíz.'
]

{ #category : #accessing }
System >> parent [

	^ parentHolder content
]

{ #category : #accessing }
System >> parent: aCompositeSystem [

	parentHolder := Binding to: aCompositeSystem
]

{ #category : #'dependency resolution' }
System >> resolveDependecies [

	self subclassResponsibility 
]

{ #category : #'dependency resolution' }
System >> resolveSystemDependencyTo: aSystemInterface [

	^ self parent systemImplementing: aSystemInterface
]

{ #category : #'starting-stopping' }
System >> startUp [
	
	self resolveDependecies.
]

{ #category : #'dependency resolution' }
System >> unresolvedSystemDependencyTo: aSystemInterface [

	^ UnresolvedSystemDependency to: Interfaces >> aSystemInterface
]
