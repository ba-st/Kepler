"
I am a System used for tests, to test dependency resolution
"
Class {
	#name : #SampleProjectSystem,
	#superclass : #SubsystemImplementation,
	#instVars : [
		'projectsByCustomer'
	],
	#category : #'Kepler-System-Tests'
}

{ #category : #'class initialization' }
SampleProjectSystem class >> initialize [

	SystemInterface bind: #ProjectManagementSystem to: (Interface named: 'Project Management System' declaring: #(addProjectNamed:for: projectsFor:))
]

{ #category : #API }
SampleProjectSystem >> addProjectNamed: aName for: aCustomer [

	| projects |

	self assertCustomerExists: aCustomer.
	projects := projectsByCustomer at: aCustomer ifAbsentPut: [ OrderedCollection new ].
	projects add: aName
]

{ #category : #private }
SampleProjectSystem >> assertCustomerExists: aCustomer [

	AssertionChecker enforce: [ self cms customers includes: aCustomer ] because: 'Invalid customer'
]

{ #category : #private }
SampleProjectSystem >> cms [

	^ self >> #CustomerManagementSystem
]

{ #category : #installing }
SampleProjectSystem >> dependencies [

	^ #(#CustomerManagementSystem)
]

{ #category : #installing }
SampleProjectSystem >> implementedInterfacesDo: aBlock [

	aBlock value: SystemInterface >> #ProjectManagementSystem
]

{ #category : #'initialize-release' }
SampleProjectSystem >> initialize [

	super initialize.
	projectsByCustomer := Dictionary new.
]

{ #category : #accessing }
SampleProjectSystem >> name [

	^ 'Project Management'
]

{ #category : #API }
SampleProjectSystem >> projectsFor: aCustomer [

	^ projectsByCustomer at: aCustomer ifAbsent: [ #() ]
]
