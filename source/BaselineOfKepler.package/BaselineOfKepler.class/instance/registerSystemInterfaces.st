actions
registerSystemInterfaces

	Interfaces := SystemInterfaceRegistry empty.
	
	self
		registerTimeSystemInterface;
		registerEventNotificationSystemInterface