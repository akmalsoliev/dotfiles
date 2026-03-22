shiftEscapeTap = hs.eventtap.new({ hs.eventtap.event.types.keyDown }, function(event)
  local keyCode = event:getKeyCode()
  local flags = event:getFlags()

  -- Escape key = keyCode 53
  if keyCode == 53 and flags.shift then
    hs.hid.capslock.toggle()
    return true -- consume the event so Escape doesn't fire
  end

  return false
end)

shiftEscapeTap:start()
