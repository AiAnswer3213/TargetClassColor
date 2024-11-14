local function SetUnitClassColor(unit, frame)
  local _, classToken = UnitClass(unit)
  local color = RAID_CLASS_COLORS[classToken] or NORMAL_FONT_COLOR
  frame.nameBackground:SetVertexColor(color.r, color.g, color.b)
end

-- The focus frame is defined as instance? of TargetFrame in TargetFrame.lua
-- FocusFrame.lua is a waste of time
hooksecurefunc("TargetFrame_CheckFaction", function(self)
  if (self.unit == "target" or self.unit == "focus") and UnitIsPlayer(self.unit) then
    SetUnitClassColor(self.unit, self)
  end
end)