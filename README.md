# AbstractBar

![WoW Version](https://img.shields.io/badge/WoW-12.0.7-blue.svg) ![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg)

**AbstractBar** is a lightweight, standalone Data Broker display bar addon for World of Warcraft.  
**Version:** 12.0.7.14 | **Author:** Vengeance

Built for **WoW 12.0+** (Midnight expansion)

## ✨ Features

A powerful, fully customizable bar system for displaying critical game information at a glance.

### Core Features

*   **Support for unlimited custom bars** with independent positioning and styling
*   **LibDataBroker-1.1 compatible** - works with any third-party data broker plugin
*   **Per-bar configuration** - position, size, scale, transparency, fonts, textures, and colors
*   **Three alignment sections** per bar: Left, Center, Right
*   **Click-through mode** option for bars
*   **Drag-and-drop positioning** for unlocked bars
*   **Theme system** with built-in themes: Abstract, Glass, Transparent
*   **Color palette system** for consistent UI appearance
*   **Font customization** via LibSharedMedia-3.0

### Built-in Data Brokers

**17 integrated broker modules** provide comprehensive game information:

| Broker | Description | Key Features |
|--------|-------------|--------------|
| **System** | FPS, Latency, Memory | Color-coded performance alerts (green/yellow/red), click for addon memory breakdown |
| **Volume** | Master sound control | Click to mute/unmute, mousewheel to adjust volume, visual mute indicator |
| **Gold** | Currency tracking | Total gold across all characters, click for per-character breakdown, realm totals |
| **Clock** | Time & reset timers | 12/24hr format toggle, daily/weekly reset countdowns, server/local time display |
| **Bags** | Inventory space | Free/total slots displayed, bag type indicators, color-coded capacity warnings |
| **Durability** | Equipment condition | Percentage display, low durability alerts, click to open repair window |
| **Friends** | Social management | Online friend count, expandable roster with class colors and zone information |
| **Guild** | Guild roster | Online member count, expandable roster with ranks, notes, and class colors |
| **Location** | Zone information | Current zone name with coordinates (X, Y), subzone display, level info |
| **Difficulty** | Instance settings | Current difficulty mode display, click to change dungeon/raid difficulty |
| **Token** | WoW Token prices | Current auction house token price with trend indicators |
| **Item Level** | Character stats | Average equipped item level display |
| **Crests** | Seasonal currency | Dawncrest tracking (Adventurer/Veteran/Champion/Hero/Myth) with color-coded display |
| **Catalyst** | Upgrade charges | Dawnlight Manaflux charge tracking for Midnight Season 1 catalyst upgrades |
| **Delves** | Companion XP | Valeera Sanguinar level and XP tracking, hourly XP gain statistics |
| **M+ Teleports** | Dungeon access | Quick teleport menu for Midnight Season 1 Mythic+ dungeons (8 dungeons) |
| **Quick Actions** | Utility buttons | Four-button widget: **R** (Reload UI), **E** (Edit Mode), **L** (Logout), **A** (Addon List) |

### Interactive Features

*   **Expandable rosters** - detailed friend and guild lists with status information
*   **Class coloring** - character names displayed in class colors
*   **Zone coordinates** - precise X, Y location tracking
*   **Memory breakdown** - per-addon memory usage statistics
*   **Reset timers** - countdown displays for daily and weekly resets
*   **Mythic+ teleports** - instant access to Season 1 dungeon entrances
*   **Volume control** - mousewheel adjustments from any broker module
*   **Tooltip styling** - consistent themed tooltips across all brokers

---

## 📦 Dependencies

AbstractBar includes the following libraries in the `libs/` folder:

*   **LibStub** - Library management
*   **CallbackHandler-1.0** - Event handling system
*   **LibDataBroker-1.1** - Data broker integration framework
*   **LibSharedMedia-3.0** - Font, texture, and statusbar library
*   **Ace3 Framework:**
    *   AceAddon-3.0 - Addon framework
    *   AceConsole-3.0 - Slash command handling
    *   AceEvent-3.0 - Event registration
    *   AceDB-3.0 - Saved variables database
    *   AceGUI-3.0 - GUI widget library
    *   AceConfig-3.0 - Configuration system

All dependencies are included - **no additional downloads required**.

---

## 🚀 Installation

### Via CurseForge or WoWUp

1.  Search for "**AbstractBar**" in your addon manager
2.  Click "Install"
3.  Launch World of Warcraft

### Manual Installation

1.  Download the latest release
2.  Extract the **AbstractBar** folder from the `.zip` archive
3.  Copy the **AbstractBar** folder to:  
    `World of Warcraft\_retail_\Interface\AddOns\`
4.  Launch World of Warcraft
5.  Type `/abar` to open the configuration panel

**Note:** On Linux, use a Windows-compatible extraction tool to preserve file structure.

---

## ⚙️ Configuration

Access the full configuration panel via:

*   **Slash commands:** `/abar` or `/abstractbar`
*   **Blizzard AddOns menu:** ESC → Interface → AddOns → Abstract Bar

### Configuration Tabs

**Settings Tab:**
*   Global font selection
*   Font size adjustment (6-32)
*   Broker spacing (0-50 pixels)
*   Use class color toggle
*   Custom font color picker
*   24-hour time format option
*   Lock/unlock bars

**Bars Tab:**
*   Create unlimited custom bars
*   Enable/disable individual bars
*   Full width toggle
*   Width and height sliders
*   Scale adjustment (50%-200%)
*   Bar skin/texture selection
*   Background color customization
*   Precise position settings

**Brokers Tab:**
*   Enable/disable individual brokers
*   Reorder brokers (move left/right)
*   Assign brokers to specific bars
*   Set alignment (Left, Center, Right)
*   Toggle icon, text, and label visibility
*   Broker-specific settings:
    *   Coordinate display format
    *   Volume adjustment steps
    *   Time format preferences
    *   Display thresholds

---

## 💻 Commands

*   `/abar` - Open configuration panel
*   `/abar config` - Open configuration panel
*   `/abstractbar` - Open configuration panel

---

## 🎮 WoW 12.0+ API Compatibility

AbstractBar is built for the **Midnight expansion (12.0+)** and uses the latest WoW APIs:

*   **C_DelvesUI** - Companion tracking system
*   **C_CurrencyInfo** - Currency and crest data
*   **C_GossipInfo** - Friendship reputation tracking
*   **Settings API** - Modern Blizzard settings integration
*   Updated **Interface version: 120007, 120005**

Fully compatible with Midnight Season 1 content including Mythic+ dungeons, Dawncrest upgrades, and Dawnlight Manaflux catalyst charges.

---

## 🤝 Contributing

Contributions are welcome! To contribute:

*   **Report a bug** - Open an issue with reproduction steps
*   **Suggest a feature** - Describe your proposed enhancement
*   **Submit code** - Fork the repository and create a pull request

Please ensure code follows the existing style and includes appropriate comments.

---

## 📝 License

This project is licensed under the **GNU General Public License v3.0**.  
See the [LICENSE.txt](LICENSE.txt) file for complete details.

---

## 🙏 Credits

*   **Author:** Vengeance
*   **Libraries:** Ace3, LibSharedMedia-3.0, LibDataBroker-1.1, CallbackHandler-1.0, LibStub
*   **Community:** Special thanks to all users providing feedback, bug reports, and feature suggestions

---

## 📞 Support

For support, questions, or feature requests:

*   Type `/abar` in-game to access configuration
*   Review broker tooltips for detailed feature descriptions
*   Check module-specific settings in the Brokers tab
*   Submit issues on the project repository

---

*AbstractBar - A cleaner, modern interface for World of Warcraft: Midnight and beyond.*
