"
I'm a dummy object used for the persistence tests
"
Class {
	#name : #'KP_Person',
	#superclass : #Object,
	#instVars : [
		'sequentialNumber',
		'firstName',
		'lastName'
	],
	#category : #'Kepler-Persistence-Tests'
}

{ #category : #accessing }
KP_Person class >> firstNamed: aFirstName lastNamed: aLastName [  

	^ self new initializeFirstNamed: aFirstName lastNamed: aLastName  
]

{ #category : #accessing }
KP_Person >> firstName [

	^ firstName
]

{ #category : #initialization }
KP_Person >> initializeFirstNamed: aFirstName lastNamed: aLastName [

	firstName := aFirstName.
	lastName := aLastName
]

{ #category : #accessing }
KP_Person >> lastName [

	^ lastName
]

{ #category : #accessing }
KP_Person >> sequentialNumber [

	^ sequentialNumber
]

{ #category : #updating }
KP_Person >> synchronizeWith: aKP_Person [

	firstName := aKP_Person firstName.
	lastName := aKP_Person lastName
]
