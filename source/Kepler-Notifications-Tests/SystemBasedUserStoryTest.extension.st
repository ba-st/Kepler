Extension { #name : #SystemBasedUserStoryTest }

{ #category : #'*Kepler-Notifications-Tests' }
SystemBasedUserStoryTest >> eventNotificationSystem [

	^ rootSystem systemImplementing: #EventNotificationSystemInterface 
]

{ #category : #'*Kepler-Notifications-Tests' }
SystemBasedUserStoryTest >> requireEventNotificationSystem [

	systemBuilder add: EventNotificationSystem new
]
