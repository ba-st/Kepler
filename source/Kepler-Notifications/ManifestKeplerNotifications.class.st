"
I store metadata for this package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : 'ManifestKeplerNotifications',
	#superclass : 'PackageManifest',
	#category : 'Kepler-Notifications-Manifest',
	#package : 'Kepler-Notifications',
	#tag : 'Manifest'
}

{ #category : 'class initialization' }
ManifestKeplerNotifications class >> initialize [

	<ignoreForCoverage>
	KeplerNamespace
		registerInterfaceAt: #EventNotificationSystemInterface
		named: 'Event Notification System Interface'
		declaring: #(#subscribe:to:toBeNotifiedSending: #revokeSubscriptionTo:of: #notifySubscribersTo:)
]
