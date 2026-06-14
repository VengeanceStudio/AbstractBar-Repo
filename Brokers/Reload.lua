-- AbstractBar Reload Broker
-- Single-click to reload the UI

local LDB = LibStub("LibDataBroker-1.1")

-- Register the broker
LDB:NewDataObject("AbstractReload", { 
    type = "data source", 
    text = "R", 
    icon = "Interface\\Icons\\INV_Misc_Gear_08",
    OnClick = function() ReloadUI() end,
    OnTooltipShow = function(tip)
        local r, g, b = GetColor()
        tip:AddLine("Reload UI", r, g, b)
        tip:AddLine("Click to reload the interface", 1, 1, 1)
        ApplyTooltipStyle(tip)
    end
})
