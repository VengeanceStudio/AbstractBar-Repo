-- AbstractBar Actions Broker
-- Single broker that displays 4 action buttons: R, E, L, A
-- This broker uses a custom widget created in BrokerBar.lua

local LDB = LibStub("LibDataBroker-1.1")

-- Register the broker
LDB:NewDataObject("AbstractActions", { 
    type = "data source", 
    text = "R E L A", 
    icon = "Interface\\Icons\\INV_Misc_Gear_08",
    OnTooltipShow = function(tip)
        local r, g, b = GetColor()
        tip:AddLine("Quick Actions", r, g, b)
        tip:AddLine(" ")
        tip:AddDoubleLine("R:", "Reload UI", 1, 1, 1, 0.8, 0.8, 0.8)
        tip:AddDoubleLine("E:", "Edit Mode", 1, 1, 1, 0.8, 0.8, 0.8)
        tip:AddDoubleLine("L:", "Logout", 1, 1, 1, 0.8, 0.8, 0.8)
        tip:AddDoubleLine("A:", "Addon List", 1, 1, 1, 0.8, 0.8, 0.8)
        ApplyTooltipStyle(tip)
    end
})
