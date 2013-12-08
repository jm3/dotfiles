tell application "AirParrot"
	(*
	display 1: "Display 1 - (2560x1440)" of application "AirParrot"
	display 2: "Display 2 - (1920x1200)" of application "AirParrot"
	display 3: "Extend Desktop (1920x1080)" of application "AirParrot"
	
	device 1: "Apple TV"
	*)
	
	tell application "AirParrot" to activate
	
	repeat until device "Apple TV" exists
		count device #This holds AirParrot from connecting until the AppleTV exists.
	end repeat
	
	(*set selectedDisplay to display named "Extend Desktop (1920x1080)"*)
	
	set connectedDevice to device named "Apple TV"
	delay 1
	
	set underscan to 0
	
	if audio is disabled then
		set audio to enabled #Enables audio if it is not already enabled in AirParrot's menu.
	end if
	
	
end tell