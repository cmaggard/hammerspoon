local ad = hs.audiodevice

displayMessage = function(msg)
	hs.alert.show(msg, {}, hs.screen.primaryScreen())
end

muter_hotkey = hs.hotkey.bind({ "command", "shift" }, "a", function()
	-- Hack for systems where I have Loopback installed
	local mic = ad.findDeviceByName("Microphone Hack")
	local mic = mic or ad.defaultInputDevice()

	local muted_status = mic:inputMuted()
	local alert_msg

	if mic:setInputMuted(not muted_status) then
		alert_msg = muted_status and "Unmuted" or "Muted"
	else
		alert_msg = "Could not toggle mute!"
	end

	displayMessage(alert_msg)
end)

audio_switch_hotkey = hs.hotkey.bind({ "command", "shift" }, "l", function()
	local headphones = ad.findDeviceByName("External Headphones")
	local speakers = ad.findDeviceByName("MacBook Pro Speakers")
	local alert_msg

	if ad.defaultOutputDevice():name() == "External Headphones" then
		speakers:setDefaultOutputDevice()
		alert_msg = "Internal Speakers"
	else
		headphones:setDefaultOutputDevice()
		alert_msg = "External Headphones"
	end

	displayMessage("Switched to " .. alert_msg)
end)

