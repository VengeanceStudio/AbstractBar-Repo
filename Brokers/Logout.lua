-- AbstractBar Logout Broker
-- Single-click to logout

local LDB = LibStub("LibDataBroker-1.1")

-- Register the broker
LDB:NewDataObject("AbstractLogout", { 
    type = "data source", 
    text = "L", 
    icon = "Interface\\Icons\\Spell_Shadow_SacrificialShield",
    OnClick = function() Logout() end,
    OnTooltipShow = function(tip)
        local r, g, b = GetColor()
        tip:AddLine("Logout", r, g, b)
        tip:AddLine("Click to logout", 1, 1, 1)
        ApplyTooltipStyle(tip)
    end
})
