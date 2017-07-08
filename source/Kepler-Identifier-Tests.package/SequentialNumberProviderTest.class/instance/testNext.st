tests-providing
testNext

	| provider |

	provider := SequentialNumberProvider new.
	(1 to: 100) do: [ :each | self assert: provider next equals: each ]