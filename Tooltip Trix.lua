local RAID_CLASS_COLORS = {
    ["HUNTER"] = { r = 0.67, g = 0.83, b = 0.45, colorStr = "ffabd473" },
    ["WARLOCK"] = { r = 0.58, g = 0.51, b = 0.79, colorStr = "ff9482c9" },
    ["PRIEST"] = { r = 1.0, g = 1.0, b = 1.0, colorStr = "ffffffff" },
    ["PALADIN"] = { r = 0.96, g = 0.55, b = 0.73, colorStr = "fff58cba" },
    ["MAGE"] = { r = 0.41, g = 0.8, b = 0.94, colorStr = "ff69ccf0" },
    ["ROGUE"] = { r = 1.0, g = 0.96, b = 0.41, colorStr = "fffff569" },
    ["DRUID"] = { r = 1.0, g = 0.49, b = 0.04, colorStr = "ffff7d0a" },
    ["SHAMAN"] = { r = 0.0, g = 0.44, b = 0.87, colorStr = "ff0070de" },
    ["WARRIOR"] = { r = 0.78, g = 0.61, b = 0.43, colorStr = "ffc79c6e" },
    ["DEATHKNIGHT"] = { r = 0.77, g = 0.12 , b = 0.23, colorStr = "ffc41f3b" },
    ["MONK"] = { r = 0.0, g = 1.00 , b = 0.59, colorStr = "ff00ff96" },
  };

local function TooltipAdd()
    if not IsInGroup() then
        -- GameTooltip:AddLine( '(not in party)' , 1 , 1 , 1 )
        return
    end

    -- GameTooltip:AddLine( 'Targeted by:' , 0.8 , 0.8 , 0.8 )
    local count = 0
    local party_unit = ""
    local class_color = {}
    for i=1,4 do
        party_unit = "party" .. i
        if UnitIsUnit( "mouseover" , party_unit .. "target" ) then
            local arg1, cls, arg3 = UnitClass( party_unit )
            class_color = RAID_CLASS_COLORS[cls]
            -- r, g, b, argbHex = GetClassColor( cls )
            if count == 0 then
                GameTooltip:AddLine( 'Targeted by:' , 0.8 , 0.8 , 0.8 )
            end
            GameTooltip:AddLine( "   " .. UnitName( party_unit ) , class_color["r"] , class_color["g"] , class_color["b"] )
            count = count + 1
        end
    end
end


GameTooltip:HookScript("OnTooltipSetUnit", function(self, ...)	
	TooltipAdd()
end)
