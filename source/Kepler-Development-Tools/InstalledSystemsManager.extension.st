Extension { #name : 'InstalledSystemsManager' }

{ #category : '*Kepler-Development-Tools' }
InstalledSystemsManager >> inspectionItems: builder [

	<inspectorPresentationOrder: 0 title: 'Managed Systems'>
	^ managed inspectionItems: builder
]
