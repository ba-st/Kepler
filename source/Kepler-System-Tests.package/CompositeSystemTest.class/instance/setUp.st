tests
setUp

	super setUp.
	Smalltalk at: #TestInterface put: (SystemInterface named: 'Test Interface' offering: #(#currentDateTime))