Class {
	#name : #SystemImplementation,
	#superclass : #Object,
	#category : 'Kepler-System'
}

{ #category : #testing }
SystemImplementation >> implements: aSystemInterface [

	^ self class implementedInterface = aSystemInterface 
]

{ #category : #'starting-stopping' }
SystemImplementation >> shutDown [
	
	self subclassResponsibility 
]

{ #category : #'starting-stopping' }
SystemImplementation >> startUp [
	
	self subclassResponsibility 
]
