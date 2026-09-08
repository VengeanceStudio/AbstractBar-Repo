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
    
    local LibAbstractUI = LibStub("LibAbstractUI-1.0", true)
    if not LibAbstractUI then
        print("|cffff0000AbstractBar Error:|r LibAbstractUI-1.0 not found!")
        return
    end
    LibAbstractUI:Embed(self)
    
    self.db = AceDB:New("AbstractBarDB", defaults, true)
    
    -- Register slash commands
    self:RegisterChatCommand("abar", "SlashCommand")
    self:RegisterChatCommand("abstractbar", "SlashCommand")
    
    self:RegisterBlizzardOptionsCategory()
end

-- Adds an "Abstract Bar" entry under Options > AddOns that opens our standalone options window
function AbstractBar:RegisterBlizzardOptionsCategory()
    if not Settings or not Settings.RegisterCanvasLayoutCategory then
        return
    end

    local panel = CreateFrame("Frame")
    panel.name = "Abstract Bar"

    local title = panel:CreateFontString(nil, "ARTWORK", "GameFontNormalLarge")
    title:SetPoint("TOPLEFT", 16, -16)
    title:SetText("Abstract Bar")

    local desc = panel:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall")
    desc:SetPoint("TOPLEFT", title, "BOTTOMLEFT", 0, -8)
    desc:SetPoint("RIGHT", panel, "RIGHT", -16, 0)
    desc:SetJustifyH("LEFT")
    desc:SetText("Abstract Bar uses its own configuration window. Click the button below to open it.")

    local openButton = CreateFrame("Button", nil, panel, "UIPanelButtonTemplate")
    openButton:SetSize(200, 24)
    openButton:SetPoint("TOPLEFT", desc, "BOTTOMLEFT", 0, -16)
    openButton:SetText("Open Abstract Bar Options")
    openButton:SetScript("OnClick", function()
        self:OpenConfig()
    end)

    local category = Settings.RegisterCanvasLayoutCategory(panel, panel.name)
    category.ID = panel.name
    Settings.RegisterAddOnCategory(category)
    self.settingsCategory = category
end

function AbstractBar:OnEnable()
    -- Send initialization message to modules
    C_Timer.After(0.1, function()
        self:SendMessage("AbstractBar_DB_READY")
    end)
end

function AbstractBar:OpenConfig()
    local BrokerBar = self:GetModule("BrokerBar", true)
    if not BrokerBar then
        print("|cffff0000AbstractBar:|r BrokerBar module not found")
        return
    end
    
    self.OptionsPanel:Toggle(BrokerBar)
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
