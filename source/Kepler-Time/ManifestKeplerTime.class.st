"
I store metadata for this package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestKeplerTime,
	#superclass : #PackageManifest,
	#category : #'Kepler-Time-Manifest'
}

{ #category : #'class initialization' }
ManifestKeplerTime class >> initialize [

	<ignoreForCoverage>
	Kepler registerInterfaceAt: #TimeSystemInterface named: 'Time System Interface' declaring: #(#dateTime #timeOfDay)
]
