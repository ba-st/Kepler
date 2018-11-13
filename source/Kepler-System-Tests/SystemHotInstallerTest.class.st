"
I'm a Test Case for SystemHotInstaller
"
Class {
	#name : #SystemHotInstallerTest,
	#superclass : #TestCase,
	#category : #'Kepler-System-Tests'
}

{ #category : #tests }
SystemHotInstallerTest >> testInstalling [

	| composite cms |

	composite := CompositeSystem new.
	composite startUp.
	self should: [ composite systemImplementing: #CustomerManagementSystem ] raise: SystemControlError.

	cms := SampleCustomerSystem new.
	(SystemHotInstaller installing: cms) applyTo: composite.

	self shouldnt: [ composite systemImplementing: #CustomerManagementSystem ] raise: SystemControlError.

	self assert: (composite systemImplementing: #CustomerManagementSystem) equals: cms.
	self assert: cms isStarted
]
