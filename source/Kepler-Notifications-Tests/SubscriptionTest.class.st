Class {
	#name : 'SubscriptionTest',
	#superclass : 'TestCase',
	#instVars : [
		'notificationReceived'
	],
	#category : 'Kepler-Notifications-Tests-',
	#package : 'Kepler-Notifications-Tests',
	#tag : ''
}

{ #category : 'listening' }
SubscriptionTest >> hey [

	notificationReceived := true
]

{ #category : 'listening' }
SubscriptionTest >> hey: anEvent [

	notificationReceived := anEvent isA: TestEvent
]

{ #category : 'listening' }
SubscriptionTest >> setUp [

	notificationReceived := false
]

{ #category : 'tests' }
SubscriptionTest >> testNotifyAboutWithOneArgument [

	self deny: notificationReceived.

	(Subscription of: self to: TestEvent toBeNotifiedSending: #hey:)
		notifyAbout: TestEvent new.

	self assert: notificationReceived
]

{ #category : 'tests' }
SubscriptionTest >> testNotifyAboutWithoutArgument [

	self deny: notificationReceived.

	(Subscription of: self to: TestEvent toBeNotifiedSending: #hey)
		notifyAbout: TestEvent new.

	self assert: notificationReceived
]

{ #category : 'tests' }
SubscriptionTest >> testSubscriptionToBeNotifiedSendingMessageWithMoreThanOneArgumentIsNotAllowed [

	self
		should: [
		Subscription of: self to: TestEvent toBeNotifiedSending: #hey:hey: ]
		raise: AssertionFailed
		withMessageText: 'Selector should have zero or one argument at most'
]
