# Abstract Bar

**Version:** 1.0.0  
**Author:** Vengeance

## Description

AbstractBar is a lightweight, standalone Data Broker display bar addon for World of Warcraft. Originally part of AbstractUI, it has been extracted to work independently while maintaining full compatibility with Data Broker plugins.

## Features

- **Customizable Bar Display**: Create multiple bars with adjustable size, position, and appearance
- **16 Built-in Broker Modules**:
  - Clock (Local/Realm time with reset timers)
  - Gold (Account-wide gold tracking)
  - Guild (Online guild members)
  - Friends (Online WoW friends)
  - Bags (Inventory space)
  - System (FPS/Latency with color coding)
  - Token (WoW Token price tracking)
  - Volume (Master volume control)
  - Durability (Equipment durability)
  - Location (Zone/coordinates)
  - Difficulty (Instance difficulty)
  - Item Level (Character iLvl)
  - Crests (Dragonflight/TWW currency)
  - Catalyst (Catalyst charges)
  - Delves (Delve keys)
  - M+ Teleports (Mythic+ keystone teleports)

- **Flexible Configuration**:
  - Show/hide individual brokers
  - Adjust alignment (Left, Center, Right)
  - Configure icon, text, and label display
  - Reorder brokers with simple controls
  - Multiple bar support

- **Theme Support**:
  - Built-in themes: Abstract, Glass, Transparent
  - Color palette system for consistent UI
  - Font customization via SharedMedia

- **Drag and Drop**: Simple click-and-drag positioning for unlocked bars
- **Data Broker Compatible**: Works with any LibDataBroker-1.1 plugin

## Installation

1. Extract the AbstractBar folder to your `World of Warcraft/_retail_/Interface/AddOns/` directory
2. Restart WoW or reload your UI
3. Configure via `/abar` or `/abstractbar` commands

## Commands

- `/abar` - Open configuration panel
- `/abar config` - Open configuration panel
- `/abstractbar` - Open configuration panel

## Dependencies

- **Required Libraries** (Included):
  - LibStub
  - LibDataBroker-1.1
  - LibSharedMedia-3.0
  - Ace3 (AceAddon-3.0, AceEvent-3.0, AceDB-3.0)

## Configuration

The addon includes a full configuration panel accessible via:
- Slash commands: `/abar` or `/abar config`
- Blizzard's AddOns menu: ESC > AddOns > Abstract Bar

### Configuration Options:

**Settings Tab:**
- Global Font selection
- Font Size (6-32)
- Broker Spacing (0-50)
- Use Class Color toggle
- Custom Font Color picker
- 24-Hour Time format toggle
- Lock/Unlock bars

**Bars Tab:**
- Create new bars
- Enable/disable bars
- Full width toggle
- Width and height sliders
- Scale adjustment
- Bar skin selection
- Color customization
- Position settings

**Brokers Tab:**
- Enable/disable individual brokers
- Move brokers left/right
- Choose which bar to display on
- Alignment (Left, Center, Right)
- Show/hide icon, text, label
- Broker-specific settings (coordinates, volume steps, etc.)

## Notes

- This addon is fully standalone and does not require AbstractUI
- All broker modules work independently
- Settings are saved in `AbstractBarDB` savedvariables

## Known Issues

- None reported yet!

## Credits

- Original development as part of AbstractUI
- Uses Ace3 library framework
- LibDataBroker standard for broker compatibility

## License

All Rights Reserved

## Support

For issues, suggestions, or contributions:
- GitHub: https://github.com/VengeanceStudio/AbstractBar
