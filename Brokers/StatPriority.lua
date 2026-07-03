-- AbstractBar Stat Priority Broker
-- Displays stat priority recommendations from Icy Veins based on current specialization

local LDB = LibStub("LibDataBroker-1.1")
local statPriorityObj

-- Import stat priority data from IcyVeinsStatPriority addon
local data = {
    -- 250 - Death Knight: Blood
    [250] = {
        {"Item Level > Critical Strike = Versatility = Mastery > Haste", "Deathbringer"},
        {"Item Level > Haste > Critical Strike = Versatility = Mastery", "San'layn"},
    },
    -- 251 - Death Knight: Frost
    [251] = {
        {"Mastery > Critical Strike > Haste > Versatility"},
    },
    -- 252 - Death Knight: Unholy
    [252] = {
        {"Mastery > Critical Strike > Haste > Versatility"},
    },

    -- 1480 - Demon Hunter: Devourer
    [1480] = {
        {"Intellect > Haste > Mastery > Critical Strike > Versatility", "Annihilator"},
        {"Intellect > Mastery > Haste > Critical Strike > Versatility", "Void-Scarred"},
    },
    -- 577 - Demon Hunter: Havoc
    [577] = {
        {"Agility > Critical Strike > Mastery > Haste > Versatility"},
    },
    -- 581 - Demon Hunter: Vengeance
    [581] = {
        {"Agility > Haste > Critical Strike = Versatility > Mastery"},
    },

    -- 102 - Druid: Balance
    [102] = {
        {"Intellect > Mastery > Haste > Versatility > Critical Strike"},
    },
    -- 103 - Druid: Feral
    [103] = {
        {"Agility > Mastery > Critical Strike = Haste > Versatility", "Druid of the Claw"},
        {"Agility > Mastery > Haste > Critical Strike > Versatility", "Wildstalker"},
    },
    -- 104 - Druid: Guardian
    [104] = {
        {"Agility > Haste > Versatility > Mastery > Critical Strike"},
    },
    -- 105 - Druid: Restoration
    [105] = {
        {"Intellect > Haste = Mastery > Versatility > Critical Strike", "Raiding"},
        {"Intellect > Haste > Versatility > Critical Strike > Mastery", "Mythic+"},
    },

    -- 1467 - Evoker: Devastation
    [1467] = {
        {"Intellect > Haste > Critical Strike > Mastery > Versatility"},
    },
    -- 1468 - Evoker: Preservation
    [1468] = {
        {"Intellect > Mastery > Haste > Critical Strike > Versatility"},
    },
    -- 1473 - Evoker: Augmentation
    [1473] = {
        {"Intellect > Critical Strike > Haste > Mastery = Versatility", "Chronowarden"},
        {"Intellect > Haste > Critical Strike > Mastery = Versatility", "Scalecommander"},
    },

    -- 253 - Hunter: Beast Mastery
    [253] = {
        {"Agility > Mastery > Critical Strike > Haste > Versatility"},
    },
    -- 254 - Hunter: Marksmanship
    [254] = {
        {"Agility > Critical Strike > Mastery > Haste > Versatility"},
    },
    -- 255 - Hunter: Survival
    [255] = {
        {"Agility > Mastery > Critical Strike > Haste > Versatility"},
    },

    -- 62 - Mage: Arcane
    [62] = {
        {"Intellect > Mastery > Versatility > Critical Strike > Haste"},
    },
    -- 63 - Mage: Fire
    [63] = {
        {"Intellect > Haste > Mastery > Versatility > Critical Strike"},
    },
    -- 64 - Mage: Frost
    [64] = {
        {"Intellect > Mastery > Critical Strike > Haste > Versatility"},
    },

    -- 268 - Monk: Brewmaster
    [268] = {
        {"Agility > Versatility = Mastery = Critical Strike > Haste", "Defensive"},
        {"Agility > Critical Strike > Mastery > Versatility > Haste", "Offensive"},
    },
    -- 269 - Monk: Windwalker
    [269] = {
        {"Agility > Critical Strike > Haste > Mastery > Versatility"},
    },
    -- 270 - Monk: Mistweaver
    [270] = {
        {"Intellect > Haste > Critical Strike > Versatility > Mastery", "Raiding"},
        {"Intellect > Haste > Critical Strike >= Versatility > Mastery", "Mythic+"},
    },

    -- 65 - Paladin: Holy
    [65] = {
        {"Intellect > Mastery > Haste > Critical Strike > Versatility", "Raiding = Hearld of the Sum"},
        {"Intellect > Mastery > Critical Strike > Haste > Versatility", "Raiding - Lightsmith"},
        {"Intellect > Haste > Critical Strike > Versatility > Mastery", "Mythic+"},
    },
    -- 66 - Paladin: Protection
    [66] = {
        {"Strength > Haste > Mastery > Versatility = Critical Strike", "Templar"},
        {"Strength > Haste > Critical Strike > Mastery = Versatility", "Lightsmith"},
    },
    -- 70 - Paladin: Retribution
    [70] = {
        {"Strength > Mastery = Haste > Critical Strike > Versatility"},
    },

    -- 256 - Priest: Discipline
    [256] = {
        {"Intellect > Haste > Critical Strike > Mastery > Versatility"},
    },
    -- 257 - Priest: Holy
    [257] = {
        {"Intellect > Critical Strike > Mastery = Versatility > Haste", "Raiding"},
        {"Intellect > Critical Strike > Haste = Versatility > Mastery", "Mythic+"},
    },
    -- 258 - Priest: Shadow
    [258] = {
        {"Intellect > Haste > Mastery > Critical Strike > Versatility"},
    },

    -- 259 - Rogue: Assassination
    [259] = {
        {"Agility > Critical Strike = Haste > Mastery > Versatility"},
    },
    -- 260 - Rogue: Outlaw
    [260] = {
        {"Agility > Critical Strike > Haste > Versatility > Mastery"},
    },
    -- 261 - Rogue: Subtlety
    [261] = {
        {"Agility > Haste (up to 700) > Mastery > Critical Strike > Haste (over 700) > Versatility"},
    },

    -- 262 - Shaman: Elemental
    [262] = {
        {"Intellect > Mastery > Haste > Critical Strike > Versatility"},
    },
    -- 263 - Shaman: Enhancement
    [263] = {
        {"Agility > Haste > Mastery = Critical Strike > Versatility", "Stormbringer"},
        {"Agility > Mastery > Haste > Critical Strike > Versatility", "Totemic"},
    },
    -- 264 - Shaman: Restoration
    [264] = {
        {"Intellect > Critical Strike = Versatility > Haste = Mastery"},
    },

    -- 265 - Warlock: Affliction
    [265] = {
        {"Intellect > Haste = Critical Strike > Mastery > Versatility"},
    },
    -- 266 - Warlock: Demonology
    [266] = {
        {"Intellect > Haste = Critical Strike > Mastery > Versatility"},
    },
    -- 267 - Warlock: Destruction
    [267] = {
        {"Haste = Critical Strike > Intellect > Mastery > Versatility"},
    },

    -- 71 - Warrior: Arms
    [71] = {
        {"Strength > Critical Strike > Haste > Mastery > Versatility"},
    },
    -- 72 - Warrior: Fury
    [72] = {
        {"Strength > Mastery > Haste > Versatility > Critical Strike"},
    },
    -- 73 - Warrior: Protection
    [73] = {
        {"Strength > Haste > Critical Strike = Versatility > Mastery"},
    },
}

-- Localize stat names
local function LocalizeSP(text)
    if type(text) ~= "string" then return "" end

    text = text:gsub("Haste", STAT_HASTE)
    text = text:gsub("Critical Strike", STAT_CRITICAL_STRIKE)
    text = text:gsub("Mastery", STAT_MASTERY)
    text = text:gsub("Versatility", STAT_VERSATILITY)
    text = text:gsub("Armor", STAT_ARMOR)
    text = text:gsub("Stamina", ITEM_MOD_STAMINA_SHORT)
    text = text:gsub("Strength", SPEC_FRAME_PRIMARY_STAT_STRENGTH)
    text = text:gsub("Agility", SPEC_FRAME_PRIMARY_STAT_AGILITY)
    text = text:gsub("Intellect", SPEC_FRAME_PRIMARY_STAT_INTELLECT)
    text = text:gsub("Weapon Damage", DAMAGE_TOOLTIP)
    text = text:gsub("Item Level", STAT_AVERAGE_ITEM_LEVEL)
    return text
end

-- Get stat priority text for display
local function GetStatPriorityText(specID)
    if not specID or not data[specID] then
        return "No Spec"
    end

    -- Use first entry by default (could be made configurable later)
    local priority = data[specID][1]
    if priority then
        return LocalizeSP(priority[1])
    end
    
    return "Unknown"
end

-- Get short stat priority for bar display (truncated)
local function GetShortStatPriority(specID)
    local fullText = GetStatPriorityText(specID)
    -- Show first 3 stats for brevity
    local parts = {}
    for part in fullText:gmatch("[^>]+") do
        table.insert(parts, part:match("^%s*(.-)%s*$")) -- trim whitespace
        if #parts >= 3 then break end
    end
    return table.concat(parts, " > ")
end

-- Update function
local currentSpecID
local function UpdateStatPriority()
    local specID = GetSpecializationInfo(GetSpecialization())
    if specID ~= currentSpecID then
        currentSpecID = specID
    end
    
    local shortText = GetShortStatPriority(currentSpecID)
    statPriorityObj.text = shortText
end

-- Register the broker
statPriorityObj = LDB:NewDataObject("AbstractStatPriority", {
    type = "data source",
    text = "No Spec",
    icon = "Interface\\Icons\\INV_Inscription_Tarot_Regeneration",
    OnEnter = function(self)
        GameTooltip:SetOwner(self, "ANCHOR_NONE")
        SmartAnchor(GameTooltip, self)
        local r, g, b = GetColor()
        
        if not currentSpecID or not data[currentSpecID] then
            GameTooltip:AddLine("Stat Priority", r, g, b)
            GameTooltip:AddLine(" ")
            GameTooltip:AddLine("No specialization selected", 1, 1, 1)
        else
            local specName = select(2, GetSpecializationInfo(GetSpecialization()))
            local className = UnitClass("player")
            
            GameTooltip:AddLine("Stat Priority", r, g, b)
            GameTooltip:AddLine(" ")
            GameTooltip:AddLine(className .. " - " .. specName, 1, 0.82, 0)
            GameTooltip:AddLine(" ")
            
            -- Show all available priorities for this spec
            for i, priority in ipairs(data[currentSpecID]) do
                local priorityText = LocalizeSP(priority[1])
                local variant = priority[2]
                
                if variant then
                    GameTooltip:AddLine(variant .. ":", 0.5, 1, 0.5)
                    GameTooltip:AddLine("  " .. priorityText, 1, 1, 1)
                else
                    GameTooltip:AddLine(priorityText, 1, 1, 1)
                end
                
                if i < #data[currentSpecID] then
                    GameTooltip:AddLine(" ")
                end
            end
            
            GameTooltip:AddLine(" ")
            GameTooltip:AddLine("Data from Icy Veins", 0.5, 0.5, 0.5)
        end
        
        ApplyTooltipStyle(GameTooltip)
        GameTooltip:Show()
    end,
    OnLeave = function()
        GameTooltip:Hide()
    end
})

-- Event frame for spec changes
local eventFrame = CreateFrame("Frame")
eventFrame:RegisterEvent("PLAYER_ENTERING_WORLD")
eventFrame:RegisterEvent("PLAYER_SPECIALIZATION_CHANGED")
eventFrame:RegisterEvent("ACTIVE_TALENT_GROUP_CHANGED")
eventFrame:SetScript("OnEvent", function(self, event)
    UpdateStatPriority()
end)

-- Initial update
C_Timer.After(0.5, UpdateStatPriority)
