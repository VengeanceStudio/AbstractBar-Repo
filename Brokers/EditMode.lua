-- AbstractBar EditMode Broker
-- Single-click to open Edit Mode

local LDB = LibStub("LibDataBroker-1.1")

-- Register the broker
LDB:NewDataObject("AbstractEditMode", { 
    type = "data source", 
    text = "E", 
    icon = "Interface\\Icons\\INV_Misc_Wrench_01",
    OnClick = function()
        if EditModeManagerFrame then
            EditModeManagerFrame:Show()
        else
            -- Fallback for older clients or manual slash command
            SlashCmdList["EDITMODE"]("")
        end
    end,
    OnTooltipShow = function(tip)
        local r, g, b = GetColor()
        tip:AddLine("Edit Mode", r, g, b)
        tip:AddLine("Click to open UI Edit Mode", 1, 1, 1)
        ApplyTooltipStyle(tip)
    end
})
