"
I store metadata for this package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestKeplerSystemTests,
	#superclass : #PackageManifest,
	#category : #'Kepler-System-Tests'
}

{ #category : #'class initialization' }
ManifestKeplerSystemTests class >> initialize [

	<ignoreForCoverage>
	Kepler
		registerInterfaceAt: #CustomerQueryingSystem named: 'Customer Querying' declaring: #(#customers);
		registerInterfaceAt: #CustomerManagementSystem named: 'Customer Management' declaring: #(#addCustomer:);
		registerInterfaceAt: #ProjectManagementSystem named: 'Project Management' declaring: #(#addProjectNamed:for: #projectsFor:)
]
