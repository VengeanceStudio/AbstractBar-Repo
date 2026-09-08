-- LibAbstractUI-1.0
-- A lightweight, AceGUI-free UI toolkit and options-panel renderer, embeddable by any addon.
-- Provides: Atlas, ColorPalette, FontKit, LayoutHelper, FrameFactory, ScrollFrame, OptionsPanel.

local MAJOR, MINOR = "LibAbstractUI-1.0", 1
local addonName = ...

local Lib, oldminor = LibStub:NewLibrary(MAJOR, MINOR)

-- Sibling files loaded in this same pass check this flag to know whether the copy of the
-- library on disk right now is the one LibStub kept active (highest version wins), since
-- every addon that embeds this library ships its own copy of these files.
_G.LibAbstractUI10_ActivePass = (Lib ~= nil)

if not Lib then return end

-- Fail loudly here instead of letting FontKit.lua error cryptically on a missing global later.
if not LibStub("LibSharedMedia-3.0", true) then
    _G.LibAbstractUI10_ActivePass = false
    error(MAJOR .. " requires LibSharedMedia-3.0 to be loaded before it (check your .toc load order).", 0)
end

-- Every module resolves its own media (textures) relative to whichever addon is currently
-- loading this copy of the library, assuming the standard embed path <Addon>\libs\LibAbstractUI-1.0\.
Lib.mediaPath = ("Interface\\AddOns\\%s\\libs\\LibAbstractUI-1.0\\Media\\"):format(addonName)

-- Copies the library's modules onto a consumer addon table for convenient access,
-- e.g. MyAddon.FrameFactory, MyAddon.OptionsPanel. Call after all lib files have loaded
-- (safe to call from OnInitialize/OnEnable).
function Lib:Embed(target)
    target.Atlas = self.Atlas
    target.ColorPalette = self.ColorPalette
    target.FontKit = self.FontKit
    target.LayoutHelper = self.LayoutHelper
    target.FrameFactory = self.FrameFactory
    target.ScrollFrame = self.ScrollFrame
    target.OptionsPanel = self.OptionsPanel
    return target
end
