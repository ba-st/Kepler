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
		register: (Interface named: 'Customer Querying' declaring: #(customers)) as: #CustomerQueryingSystem;
		register: (Interface named: 'Customer Management' declaring: #(addCustomer:)) as: #CustomerManagementSystem;
		register: (Interface named: 'Project Management' declaring: #(#addProjectNamed:for: projectsFor:))
			as: #ProjectManagementSystem
]
