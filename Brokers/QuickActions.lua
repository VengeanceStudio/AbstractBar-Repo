-- AbstractBar QuickActions Broker
-- Provides quick access to common UI actions via different click combinations
-- Replicates functionality from AbstractUIButtons addon

local LDB = LibStub("LibDataBroker-1.1")
local quickActionsObj

-- Register the broker
quickActionsObj = LDB:NewDataObject("AbstractQuickActions", { 
    type = "data source", 
    text = "Quick", 
    icon = "Interface\\Icons\\INV_Misc_Wrench_01",
    
    OnClick = function(self, button)
        if button == "LeftButton" then
            if IsShiftKeyDown() then
                -- Shift + Left Click: Edit Mode
                if EditModeManagerFrame then
                    EditModeManagerFrame:Show()
                else
                    -- Fallback for older clients
                    SlashCmdList["EDITMODE"]("")
                end
            elseif IsAltKeyDown() then
                -- Alt + Left Click: Logout
                Logout()
            else
                -- Left Click: Reload UI
                ReloadUI()
            end
        elseif button == "RightButton" then
            -- Right Click: Toggle Addon List
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
        end
    end,
    
    OnTooltipShow = function(tip)
        local r, g, b = GetColor()
        tip:AddLine("Quick Actions", r, g, b)
        tip:AddLine(" ")
        
        -- Show available actions
        tip:AddDoubleLine("Left Click:", "Reload UI", 1, 1, 1, 0.8, 0.8, 0.8)
        tip:AddDoubleLine("Shift + Left Click:", "Edit Mode", 1, 1, 1, 0.8, 0.8, 0.8)
        tip:AddDoubleLine("Alt + Left Click:", "Logout", 1, 1, 1, 0.8, 0.8, 0.8)
        tip:AddDoubleLine("Right Click:", "Addon List", 1, 1, 1, 0.8, 0.8, 0.8)
        
        ApplyTooltipStyle(tip)
    end
})

-- Update function (called by BrokerBar when updates are needed)
local function Update()
    -- This broker doesn't need periodic updates, but the function is here for consistency
    -- Could be extended in the future to show status indicators
end

-- Register update event
local f = CreateFrame("Frame")
f:RegisterEvent("PLAYER_LOGIN")
f:SetScript("OnEvent", function(self, event)
    if event == "PLAYER_LOGIN" then
        Update()
    end
end)

-- Make update accessible globally for BrokerBar
_G["AbstractQuickActionsUpdate"] = Update
