hotkey = hs.hotkey.bind({"command", "shift"}, "a", function()
  -- Hack for systems where I have Loopback installed
  local mic = hs.audiodevice.findDeviceByName("Microphone Hack")
  local mic = mic or hs.audiodevice.defaultInputDevice()

  local muted_status = mic:inputMuted()
  local alert_msg

  if mic:setInputMuted(not muted_status) then
    alert_msg = muted_status and "Unmuted" or "Muted"
  else
    alert_msg = "Could not toggle mute!"
  end

  hs.alert.show(alert_msg)
end)
