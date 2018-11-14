"
I'm an Unit Test for System modules
"
Class {
	#name : #SystemModuleTest,
	#superclass : #TestCase,
	#category : #'Kepler-System-Tests'
}

{ #category : #tests }
SystemModuleTest >> testPrintString [

	self assert: (SampleCustomerModule toInstallOn: CompositeSystem new) printString equals: 'Customer'
]
