-- AbstractBar Installation & Testing Guide

--[[
INSTALLATION:
1. Copy the entire AbstractBar folder to:
   World of Warcraft\_retail_\Interface\AddOns\

2. Your folder structure should look like:
   AddOns\AbstractBar\AbstractBar.toc
   AddOns\AbstractBar\Core.lua
   AddOns\AbstractBar\BrokerBar.lua
   AddOns\AbstractBar\ColorPalette.lua
   AddOns\AbstractBar\FontKit.lua
   AddOns\AbstractBar\README.md
   AddOns\AbstractBar\Brokers\*.lua (16 files)
   AddOns\AbstractBar\libs\* (7 library folders)

3. Restart World of Warcraft or type /reload

COMMANDS:
- /abar - Open configuration panel
- /abstractbar - Open configuration panel
- /abar config - Open configuration panel

You can also access the configuration through:
ESC > AddOns > Abstract Bar

FEATURES:
✓ 16 Built-in broker modules
✓ Customizable bar positioning
✓ Theme support (Abstract, Glass, Transparent)
✓ Drag and drop positioning
✓ Per-character saved settings
✓ Compatible with any Data Broker plugin

BROKER MODULES INCLUDED:
1. Clock - Time display with resets
2. Gold - Account gold tracking
3. Guild - Guild members online
4. Friends - Friends online (WoW only)
5. Bags - Bag space remaining
6. System - FPS and latency
7. Token - WoW Token prices
8. Volume - Master volume control
9. Durability - Equipment durability
10. Location - Current zone/coordinates
11. Difficulty - Instance difficulty
12. ItemLevel - Character item level
13. Crests - Currency tracking
14. Catalyst - Catalyst charges
15. Delves - Delve keys
16. MPlusTeleports - M+ teleports

DIFFERENCES FROM ABSTRACTUI VERSION:
- Standalone - No AbstractUI required
- Masque support removed (cleaner, simpler)
- Independent saved variables (AbstractBarDB)
- Simplified framework (ColorPalette & FontKit)
- No dependency on AbstractUI's Movable module
- Simple drag-and-drop positioning

CONFIGURATION:
The addon creates a MainBar by default at the top of your screen with these brokers enabled:
- System (FPS/MS) - Left side
- Gold - Left side
- Clock - Center
- Difficulty - Right side
- Location - Right side
- Volume - Right side

To customize brokers, you'll need to edit the saved variables or wait for the GUI config panel.

SAVED VARIABLES:
Settings are stored in:
World of Warcraft\_retail_\WTF\Account\[ACCOUNT]\SavedVariables\AbstractBarDB.lua

TROUBLESHOOTING:
- If the bar doesn't appear, check that the addon is enabled in the AddOns list
- Type /abar to verify the addon is loaded
- Check for Lua errors with /console scriptErrors 1
- Make sure all files are in the correct folders
- Verify libraries are present in the libs\ folder

COMPATIBILITY:
- WoW Retail (The War Within 11.0.7+)
- Works with any LibDataBroker-1.1 plugin
- Does NOT require AbstractUI or Masque

KNOWN LIMITATIONS:
- No GUI configuration panel yet (use /abar commands)
- Cannot create additional bars yet (MainBar only for now)
- Broker reordering requires manual settings edit

FUTURE UPDATES:
- GUI configuration panel
- Multiple bar support
- More customization options
- Import/export profiles
- Additional broker modules
]]
