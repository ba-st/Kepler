"
I'm an Error to be raised when a Repository detects un unexpected error.
Usually I will be raised as a consequence of handling an specific backend
error in the repository implementation.

I will keep a reference to the original error to aid in debugging or logging purposes.
"
Class {
	#name : #PersistenceCommandFailed,
	#superclass : #SystemCommandExecutionError,
	#instVars : [
		'originatingErrorMessageText'
	],
	#category : #'Kepler-Persistence'
}

{ #category : #signalling }
PersistenceCommandFailed class >> signal: aMessageText dueTo: anOriginatingError because: anOriginatingErrorMessageText [

	self new
		tag: anOriginatingError;
		originatingErrorMessageText: anOriginatingErrorMessageText;
		signal: aMessageText
]

{ #category : #printing }
PersistenceCommandFailed >> fullDescription [

	^ '<1s> [<2s>]' expandMacrosWith: self messageText with: originatingErrorMessageText
]

{ #category : #accessing }
PersistenceCommandFailed >> originatingError [

	^ self tag
]

{ #category : #accessing }
PersistenceCommandFailed >> originatingErrorMessageText: aMessageText [

	originatingErrorMessageText := aMessageText
]
