actions
registerTimeSystemInterface

	self
		registerInterfaceAs: #TimeSystemInterface
		named: 'Time System Interface'
		offering: #(#dateTime #timeOfDay)