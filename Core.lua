local AbstractBar = LibStub("AceAddon-3.0"):NewAddon("AbstractBar", "AceConsole-3.0", "AceEvent-3.0")
local LSM = LibStub("LibSharedMedia-3.0")

AbstractBar.version = "1.0.0"

-- ============================================================================
-- DATABASE DEFAULTS
-- ============================================================================
local defaults = {
    profile = {
        theme = {
            active = "Abstract",
            font = "Friz Quadrata TT",
            fontSize = 12,
        },
        modules = {
            bar = true,
        }
    }
}

-- ============================================================================
-- INITIALIZATION
-- ============================================================================
function AbstractBar:OnInitialize()
    -- Debug: Check if LibStub and libraries are available
    if not LibStub then
        print("|cffff0000AbstractBar Error:|r LibStub not found!")
        return
    end
    
    local AceDB = LibStub("AceDB-3.0", true) -- true = silent
    if not AceDB then
        print("|cffff0000AbstractBar Error:|r AceDB-3.0 not found!")
        print("Available libraries:")
        for k, v in pairs(LibStub.libs or {}) do
            print("  - " .. tostring(k))
        end
        return
    end
    
    self.db = AceDB:New("AbstractBarDB", defaults, true)
    
    -- Register slash commands
    self:RegisterChatCommand("abar", "SlashCommand")
    self:RegisterChatCommand("abstractbar", "SlashCommand")
end

function AbstractBar:OnEnable()
    -- Send initialization message to modules
    C_Timer.After(0.1, function()
        self:SendMessage("AbstractBar_DB_READY")
    end)
    
    -- Register options panel after modules load
    C_Timer.After(0.3, function()
        self:RegisterOptionsPanel()
    end)
end

function AbstractBar:RegisterOptionsPanel()
    local AceConfig = LibStub("AceConfig-3.0")
    local AceConfigDialog = LibStub("AceConfigDialog-3.0")
    
    if not AceConfig or not AceConfigDialog then
        print("|cffff0000AbstractBar:|r Could not load configuration libraries")
        return
    end
    
    -- Get BrokerBar module
    local BrokerBar = self:GetModule("BrokerBar", true)
    if not BrokerBar then
        print("|cffff0000AbstractBar:|r BrokerBar module not found")
        return
    end
    
    -- Register options table
    AceConfig:RegisterOptionsTable("AbstractBar", function() return BrokerBar:GetOptions() end)
    
    -- Add to Blizzard Interface Options
    self.optionsFrame = AceConfigDialog:AddToBlizOptions("AbstractBar", "Abstract Bar")
    
    print("|cff00ff00AbstractBar:|r Configuration panel registered")
end

function AbstractBar:OpenConfig()
    local AceConfigDialog = LibStub("AceConfigDialog-3.0", true)
    if AceConfigDialog then
        AceConfigDialog:Open("AbstractBar")
    else
        -- Fallback: Try to open Blizzard settings
        Settings.OpenToCategory(self.optionsFrame)
    end
end

function AbstractBar:SlashCommand(input)
    if not input or input:trim() == "" then
        self:OpenConfig()
    elseif input:lower() == "config" then
        self:OpenConfig()
    else
        print("|cff00ff00AbstractBar|r v" .. self.version)
        print("Use |cff00ffff/abar|r or |cff00ffff/abar config|r to open configuration")
    end
end
