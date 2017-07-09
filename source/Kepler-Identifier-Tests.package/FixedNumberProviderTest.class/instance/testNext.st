tests-providing
testNext

	| provider |

	provider := FixedNumberProvider providing: 3.
	self assert: provider next equals: 3.
	self assert: provider next equals: 3.
	provider setNextTo: 7.
	self assert: provider next equals: 7