"
I'm an abstract system implementation. 
I provide the common code al systems must implement: startUp and shutDown primitives.
"
Class {
	#name : 'SystemImplementation',
	#superclass : 'Object',
	#instVars : [
		'state'
	],
	#category : 'Kepler-System',
	#package : 'Kepler-System'
}

{ #category : 'registering' }
SystemImplementation class >> registerInterfaceAt: aKey named: aName declaring: selectors [

	<ignoreForCoverage>
	SystemInterfaces bind: aKey to: (Interface named: aName declaring: selectors)
]

{ #category : 'initialization' }
SystemImplementation >> initialize [

	super initialize.
	state := SystemStopped for: self
]

{ #category : 'testing' }
SystemImplementation >> isStarted [

	^ state isStarted
]

{ #category : 'testing' }
SystemImplementation >> isStopped [

	^ state isStopped
]

{ #category : 'accessing' }
SystemImplementation >> name [

	^ self subclassResponsibility
]

{ #category : 'printing' }
SystemImplementation >> printOn: aStream [

	aStream nextPutAll: self name
]

{ #category : 'controlling' }
SystemImplementation >> shutDown [
	
	state shutDown.
	state := SystemStopped for: self
]

{ #category : 'private - controlling' }
SystemImplementation >> shutDownWhenStarted [

	"I'm a template method. I will be invoked when the system is shutting down.
	Systems requiring some specific actions on shutDown must reimplement me. "
]

{ #category : 'controlling' }
SystemImplementation >> startUp [
	
	state startUp.
	state := SystemStarted for: self
]

{ #category : 'private - controlling' }
SystemImplementation >> startUpWhenStopped [

	"I'm a template method. I will be invoked when the system is starting up.
	Systems requiring some specific actions on start up must reimplement me. "
]
