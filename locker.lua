hotkey = hs.hotkey.bind({"command", "control", "shift"}, "l", "Locked!", function()
  hs.caffeinate.lockScreen() 
end)

-- Lock the screen when the laptop is unplugged from power.
-- Only fires on the AC -> battery transition, not on every battery event
-- (the watcher also fires on charge-percentage changes).
local lastPowerSource = hs.battery.powerSource()

powerWatcher = hs.battery.watcher.new(function()
  local source = hs.battery.powerSource()
  if source ~= lastPowerSource then
    if lastPowerSource == "AC Power" and source == "Battery Power" then
      hs.caffeinate.lockScreen()
    end
    lastPowerSource = source
  end
end):start()
