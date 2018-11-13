"
I'm an abstract class for sub-system implementations. 
My subclasses implement one or more system interfaces, and can have dependencies to another subsystems. 
I'm a part of a whole system controlled by a CompositeSystem instance.

"
Class {
	#name : #SubsystemImplementation,
	#superclass : #SystemImplementation,
	#instVars : [
		'parentBinding'
	],
	#category : #'Kepler-System'
}

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

	"Return a collection of the system interfaces wich this system depends upon"
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
	self beOrphan
]

{ #category : #'private - accessing' }
SubsystemImplementation >> parent [

	^ parentBinding content
]

{ #category : #installing }
SubsystemImplementation >> resolveDependencies [

	"This method will be called at the proper time, so a subsystem can resolve it's dependencies against other system implementations"

	self subclassResponsibility
]

{ #category : #'private - controlling' }
SubsystemImplementation >> startUpWhenStopped [

	self resolveDependencies.
	super startUpWhenStopped
]
