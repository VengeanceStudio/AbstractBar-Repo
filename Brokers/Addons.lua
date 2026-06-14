-- AbstractBar Addons Broker
-- Single-click to toggle Addon List

local LDB = LibStub("LibDataBroker-1.1")

-- Register the broker
LDB:NewDataObject("AbstractAddons", { 
    type = "data source", 
    text = "A", 
    icon = "Interface\\Icons\\INV_Misc_Book_09",
    OnClick = function()
        if AddonList and AddonList:IsVisible() then
            AddonList:Hide()
        else
            -- Open Addon List through Interface Options
            if Settings and Settings.OpenToCategory then
                -- Modern WoW (10.0+)
                for _, category in ipairs(Settings.GetCategoryList()) do
                    if category.name == ADDONS then
                        Settings.OpenToCategory(category:GetID())
                        return
                    end
                end
            elseif InterfaceOptionsFrame_OpenToCategory then
                -- Legacy WoW
                InterfaceOptionsFrame_OpenToCategory(ADDONS)
            end
        end
    end,
    OnTooltipShow = function(tip)
        local r, g, b = GetColor()
        tip:AddLine("Addon List", r, g, b)
        tip:AddLine("Click to toggle addon management", 1, 1, 1)
        ApplyTooltipStyle(tip)
    end
})
