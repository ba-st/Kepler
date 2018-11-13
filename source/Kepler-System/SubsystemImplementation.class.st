"
I'm an abstract class for sub-system implementations. 
My subclasses implement one or more system interfaces, and can have dependencies to another subsystems. 
I'm a part of a whole system controlled by a CompositeSystem instance.

"
Class {
	#name : #SubsystemImplementation,
	#superclass : #SystemImplementation,
	#instVars : [
		'parentBinding',
		'dependencies'
	],
	#category : #'Kepler-System'
}

{ #category : #'subsystem lookup' }
SubsystemImplementation >> >> anInterfaceKey [

	^ dependencies at: anInterfaceKey ifAbsent: [ SystemControlError signal: ('Unresolved <1p>' expandMacrosWith: SystemInterface >> anInterfaceKey) ]
]

{ #category : #'private - asserting' }
SubsystemImplementation >> assertIsOrphan [

	AssertionChecker refuse: [ parentBinding isDefined ] because: 'Cannot register a subsystem already managed by other composite.' raising: SystemControlError
]

{ #category : #initialization }
SubsystemImplementation >> beChildOf: aCompositeSystem [

	self assertIsOrphan.
	parentBinding := Binding to: aCompositeSystem
]

{ #category : #initialization }
SubsystemImplementation >> beOrphan [

	parentBinding := Binding undefinedExplainedBy: 'This subsystem is not registered in any composite system' raising: SystemControlError
]

{ #category : #installing }
SubsystemImplementation >> dependencies [

	"Return a collection of the system interface keys wich this system depends upon"
	self subclassResponsibility
]

{ #category : #installing }
SubsystemImplementation >> implementedInterfacesDo: aMonadycBlock [

	"Evaluate the block for each system interface implemented by me.
	A subsystem is free implement several interfaces."

	self subclassResponsibility
]

{ #category : #installing }
SubsystemImplementation >> implements: aSystemInterface [

	self
		implementedInterfacesDo: [ :implementedInterface | 
			aSystemInterface = implementedInterface
				ifTrue: [ ^ true ] ].
	^ false
]

{ #category : #initialization }
SubsystemImplementation >> initialize [

	super initialize.
	self beOrphan.
	dependencies := Namespace new
]

{ #category : #'private - accessing' }
SubsystemImplementation >> parent [

	^ parentBinding content
]

{ #category : #installing }
SubsystemImplementation >> resolveDependencies [

	self dependencies do: [ :interfaceKey | dependencies bind: interfaceKey to: self parent >> interfaceKey ]
]

{ #category : #'private - controlling' }
SubsystemImplementation >> startUpWhenStopped [

	self resolveDependencies.
	super startUpWhenStopped
]