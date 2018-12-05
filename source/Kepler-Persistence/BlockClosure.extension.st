Extension { #name : #BlockClosure }

{ #category : #'*Kepler-Persistence' }
BlockClosure >> asMatchingCriteriaIn: aRepository [

	^ [ :object | self cull: object cull: aRepository matchingCriteriaBuilder ]
]
