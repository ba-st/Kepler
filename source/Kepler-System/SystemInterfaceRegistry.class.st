Class {
	#name : #SystemInterfaceRegistry,
	#superclass : #Object,
	#instVars : [
		'interfaces'
	],
	#category : 'Kepler-System'
}

{ #category : #requirements }
SystemInterfaceRegistry class >> empty [

	^ super new initializeEmpty
]

{ #category : #lookup }
SystemInterfaceRegistry >> >> aKey [

	^ interfaces
		at: aKey
		ifAbsent: [ Error signal: ('System interface not found under #<1s>' expandMacrosWith: aKey) ]
]

{ #category : #'initialize-release' }
SystemInterfaceRegistry >> initializeEmpty [

	interfaces := Dictionary new
]

{ #category : #registration }
SystemInterfaceRegistry >> registerNamed: aName offering: messagesSet as: aKey [

	interfaces
		at: aKey
		put: (SystemInterface named: aName offering: messagesSet)
]
