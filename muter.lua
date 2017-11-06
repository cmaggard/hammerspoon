hotkey = hs.hotkey.bind({"command", "shift"}, "a", function()
  local mic = hs.audiodevice.defaultInputDevice()
  local mutedStatus = mic:muted()
  local alert_msg
  if mic:setMuted(not mutedStatus) then 
    alert_msg = mutedStatus and "Unmuted" or "Muted"
  else
    alert_msg = "Could not toggle mute!"
  end
  hs.alert.show(alert_msg)
end)
