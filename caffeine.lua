local inactive_image = hs.image.imageFromPath("./icons/coffee-cup.tiff")
local active_image = hs.image.imageFromPath("./icons/coffee-cup-full.tiff")
local active = true

menubar = hs.menubar.new()

function toggle(active_state)
  hs.caffeinate.set("displayIdle",active_state)
  setupBar(active_state)
end

function setupBar(active_state)
  active = active
  local img = active_state and active_image or inactive_image
  local title_text = active_state and "Disable" or "Enable"
  local menu = {
    title = title_text,
      fn = function() toggle(not active_state) end
  }
  menubar:setIcon(img):setMenu({menuTable = menu})
end

toggle(true)

