-- AbstractBar v1.0.0 - Changelog

--[[
==============================================
INITIAL RELEASE - v1.0.0
==============================================

CREATED: Standalone AbstractBar addon extracted from AbstractUI

FEATURES:
✓ 16 built-in Data Broker modules
✓ Customizable bar positioning
✓ Theme support (Abstract, Glass, Transparent)
✓ Independent saved variables (AbstractBarDB)
✓ Simple drag-and-drop bar positioning
✓ Compatible with any LibDataBroker-1.1 plugin

BROKER MODULES:
- Clock (Time with reset timers)
- Gold (Account-wide tracking)
- Guild (Online members)
- Friends (WoW friends online)
- Bags (Inventory space)
- System (FPS/Latency)
- Token (WoW Token prices)
- Volume (Master volume)
- Durability (Equipment durability)
- Location (Zone/coordinates)
- Difficulty (Instance difficulty)
- ItemLevel (Character iLvl)
- Crests (Currency tracking)
- Catalyst (Catalyst charges)
- Delves (Delve keys)
- MPlusTeleports (M+ teleports)

==============================================
BUG FIXES (June 14, 2026)
==============================================

FIXED: Broker modules referencing AbstractUI addon
- Removed all GetAddon("AbstractUI") calls from broker files
- Updated all broker headers from "AbstractUI" to "AbstractBar"
- Changed AbstractUI_FontKit references to AbstractBar_FontKit
- Removed AbstractUI:ApplyThemedBackdrop dependencies
- Fixed hardcoded font path in Gold.lua broker

FIXED: Core initialization
- Added FontKit reference to AbstractBar.FontKit
- Ensured proper namespace usage throughout

FIXED: Missing AceConsole-3.0 library
- Added AceConsole-3.0 for slash command support
- Updated addon initialization to include AceConsole-3.0

ADDED: Full Configuration Panel (v1.0.0)
- Added AceConfig-3.0, AceGUI-3.0, AceConfigDialog-3.0 libraries
- Created RegisterOptionsPanel() function
- Integrated with Blizzard's AddOns interface
- Added OpenConfig() function for slash commands
- Configuration accessible via /abar, /abar config, or AddOns menu

CONFIGURATION FEATURES:
✓ Settings Tab
  - Global font selection with SharedMedia support
  - Font size slider (6-32)
  - Broker spacing adjustment (0-50)
  - Class color toggle
  - Custom font color picker
  - 24-hour time format toggle
  - Lock/unlock bars

✓ Bars Tab
  - Create new bars dynamically
  - Enable/disable bars
  - Full width mode
  - Width/height/scale sliders
  - Bar skin selection (Abstract, Glass, Transparent, etc.)
  - Theme color integration
  - Custom color picker
  - Position management

✓ Brokers Tab (16 modules)
  - Enable/disable individual brokers
  - Move left/right buttons
  - Bar assignment dropdown
  - Alignment selection (Left, Center, Right)
  - Show/hide icon, text, label toggles
  - Short label option
  - Broker-specific settings:
    * Location: coordinates, decimal places, subzone
    * Volume: step size (1% or 5%)
    * Gold: sort order, character deletion
    * Token: price history
    * And more per broker

DEPENDENCIES REMOVED:
✗ Masque (button skinning library) - removed completely
✗ AbstractUI addon - now fully standalone
✗ AbstractUI Movable module - replaced with simple drag
✗ AbstractUI FrameFactory - not needed for standalone

==============================================
TECHNICAL CHANGES
==============================================

FILE STRUCTURE:
AbstractBar/
├── AbstractBar.toc (v1.0.0)
├── Core.lua (Main addon, 65 lines)
├── BrokerBar.lua (Bar management, ~1850 lines)
├── ColorPalette.lua (Theme colors, 110 lines)
├── FontKit.lua (Font management, 130 lines)
├── README.md
├── INSTALL.lua
├── CHANGELOG.lua
├── Brokers/ (16 modules, ~2500 lines total)
└── libs/ (7 library folders)

NAMESPACE CHANGES:
- ColorPalette: AbstractUI_ColorPalette → AbstractBar_ColorPalette
- FontKit: AbstractUI_FontKit → AbstractBar_FontKit
- SavedVariables: AbstractUIDB → AbstractBarDB
- Addon name: AbstractUI → AbstractBar
- Message: AbstractUI_DB_READY → AbstractBar_DB_READY

SIMPLIFIED COMPONENTS:
- ColorPalette: 3 themes (Abstract, Glass, Transparent)
- FontKit: Basic font management only
- No FrameFactory dependency
- Simple drag-and-drop (no Movable module)

==============================================
KNOWN LIMITATIONS
==============================================

- Cannot create additional bars yet via GUI (MainBar exists by default)
- Broker reordering limited to Move Left/Right buttons
- Limited to built-in themes (Abstract, Glass, Transparent)

==============================================
COMPATIBILITY
==============================================

✓ World of Warcraft: The War Within (11.0.7+)
✓ Compatible with all LibDataBroker-1.1 plugins
✓ Works independently of AbstractUI
✓ Per-character profile support

==============================================
FUTURE ROADMAP
==============================================

v1.1.0 (Planned):
- GUI configuration panel
- Multiple bar support
- Enhanced customization options
- Profile import/export

v1.2.0 (Planned):
- Additional broker modules
- Custom theme creator
- Bar templates
- Advanced positioning

==============================================
]]
