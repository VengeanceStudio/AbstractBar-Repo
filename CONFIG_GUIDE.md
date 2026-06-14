# AbstractBar Configuration Guide

## Accessing the Configuration Panel

You can open the configuration panel in several ways:

1. **Slash Commands:**
   - `/abar`
   - `/abar config`
   - `/abstractbar`

2. **Blizzard Interface:**
   - Press `ESC`
   - Click `AddOns`
   - Select `Abstract Bar`

## Configuration Tabs

### 1. Settings Tab

General settings that apply to all bars and brokers.

#### Global Font
- Select from any font registered with LibSharedMedia-3.0
- Default: "Friz Quadrata TT"
- Applies to all broker text

#### Font Size
- Range: 6 to 32
- Default: 12
- Controls the size of broker text

#### Spacing
- Range: 0 to 50 pixels
- Default: 15
- Distance between brokers on the bar

#### Use Class Color
- Toggle: On/Off
- When enabled, broker text uses your class color
- When disabled, uses custom font color

#### Custom Font Color
- Color picker
- Only active when "Use Class Color" is disabled
- Default: White (1, 1, 1)

#### Use 24-Hour Time
- Toggle: On/Off
- Default: On
- Affects the Clock broker display format
- On: 14:30
- Off: 2:30 PM

#### Lock
- Toggle: Locked/Unlocked
- When unlocked, you can drag bars to reposition them
- When locked, bars cannot be moved

---

### 2. Bars Tab

Manage individual bars and their appearance.

#### Create New Bar
- Enter a name for the new bar
- Creates a new data broker bar
- Each bar can be positioned independently

#### Bar Settings (Per Bar):

**Enable**
- Toggle: On/Off
- Show or hide the bar

**Full Width**
- Toggle: On/Off
- When enabled, bar stretches across the entire screen width
- When disabled, uses custom width setting

**Width**
- Range: 50 to screen width (pixels)
- Only active when Full Width is disabled
- Sets the bar width

**Height**
- Range: 10 to 100 (pixels)
- Controls bar height

**Scale**
- Range: 0.5 to 3.0
- Default: 1.0
- Scales the entire bar (1.0 = 100%)

**Skin**
- Options: Global, Abstract, Blizzard, Glass, Flat, Transparent, Outline, Tooltip
- Default: Abstract
- Changes the bar's visual appearance

**Use Theme Color**
- Toggle: On/Off
- When enabled, uses the active theme's panel background color
- When disabled, uses custom color

**Custom Color**
- Color picker with alpha
- Only active when "Use Theme Color" is disabled
- Sets bar background color

**Alpha**
- Range: 0.0 to 1.0
- Default: 0.6
- Controls bar transparency (0.0 = invisible, 1.0 = solid)

---

### 3. Brokers Tab

Configure individual broker modules (16 available).

#### Universal Broker Settings:

**Enable**
- Toggle: On/Off
- Show or hide this broker
- When disabled, broker won't appear on any bar

**Move Left / Move Right**
- Buttons to reorder brokers
- Changes display order within the same alignment group
- Note: RIGHT-aligned brokers display right-to-left

**Bar**
- Dropdown: None, MainBar, [Custom Bars]
- Choose which bar displays this broker
- "None" = broker is hidden

**Align**
- Options: Left, Center, Right
- Position within the bar
- Left: Starts from left edge
- Center: Grouped in middle
- Right: Starts from right edge

**Show Icon**
- Toggle: On/Off
- Display the broker's icon

**Show Value**
- Toggle: On/Off
- Display the broker's text/value

**Show Label**
- Toggle: On/Off
- Display the broker's descriptive label

**Use Short Label**
- Toggle: On/Off
- Only active when "Show Label" is enabled
- Uses abbreviated labels (e.g., "Diff" instead of "Difficulty")

---

## Broker-Specific Settings

### Clock Broker
- No additional settings
- Displays local or realm time
- Tooltip shows daily/weekly resets

### Gold Broker
**Sort By**
- Options: Name (A-Z), Amount (High to Low)
- Controls character list order in tooltip

**Delete Character Data**
- Dropdown: Select character to delete
- Button: Permanently removes gold data for that character
- Useful for cleaning up deleted characters

### Guild Broker
- No additional settings
- Shows online guild member count
- Click to view guild roster popup

### Friends Broker
- No additional settings
- Shows online WoW friends count
- Click to view friends list popup

### Bags Broker
- No additional settings
- Shows used/total bag slots

### System Broker
- No additional settings
- Shows FPS and latency
- Color-coded for performance

### Token Broker
- No additional settings
- Shows current WoW Token price
- Tooltip shows price history

### Volume Broker
**Step Size**
- Options: 1%, 5%
- Controls how much volume changes per scroll wheel tick
- Scroll up/down on broker to adjust volume

### Durability Broker
- No additional settings
- Shows lowest equipment durability percentage

### Location Broker
**Show Coords**
- Toggle: On/Off
- Displays coordinates after zone name

**Decimal Places**
- Options: None (60, 45), One (60.5, 45.3), Two (60.52, 45.37)
- Only active when "Show Coords" is enabled
- Controls coordinate precision

**Show SubZone**
- Toggle: On/Off
- Displays local area name (e.g., "Silvermoon City: Thalassian University")

### Difficulty Broker
- No additional settings
- Shows current instance difficulty

### Item Level Broker
- No additional settings
- Shows character's equipped item level

### Crests Broker
- No additional settings
- Shows Dragonflight/TWW crest currency

### Catalyst Broker
- No additional settings
- Shows catalyst charges

### Delves Broker
- No additional settings
- Shows available delve keys

### M+ Teleports Broker
- No additional settings
- Shows mythic+ keystone teleport availability

---

## Tips & Tricks

### Positioning Bars
1. Unlock bars via Settings > Lock toggle
2. Click and drag bars to new positions
3. Lock bars when satisfied with placement

### Creating Multiple Bars
1. Go to Bars tab
2. Click "Create New Bar"
3. Enter unique name
4. Configure the new bar's settings
5. Assign brokers to it via Brokers tab

### Organizing Brokers
- Use alignment to group related brokers
- LEFT: System info, Gold
- CENTER: Clock, Time-based info
- RIGHT: Location, Difficulty, Volume
- Use Move Left/Right to fine-tune order

### Performance Optimization
- Disable unused brokers (set Bar to "None")
- Use shorter labels for cleaner appearance
- Hide icons if you prefer text-only display

### Theme Coordination
- Use "Use Theme Color" for bars to match ColorPalette themes
- Use "Use Class Color" for brokers to match your character
- Or customize colors for a unique look

---

## Troubleshooting

**Configuration panel won't open:**
- Check that the addon is enabled
- Try `/reload` to restart the UI
- Verify all libraries loaded (check for Lua errors)

**Brokers not appearing:**
- Check that broker is enabled (Brokers tab)
- Verify broker is assigned to a bar (not "None")
- Ensure the assigned bar is enabled (Bars tab)
- Make sure bar is not hidden off-screen

**Can't drag bars:**
- Unlock bars via Settings > Lock toggle
- Ensure you're clicking on the bar background, not a broker

**Settings not saving:**
- Settings save automatically
- Changes take effect immediately
- Use `/reload` if issues persist
- Check SavedVariables folder for AbstractBarDB.lua

---

## Default Configuration

When you first install AbstractBar, the default MainBar includes:

**LEFT Alignment:**
- System (FPS/MS)
- Gold

**CENTER Alignment:**
- Clock

**RIGHT Alignment:**
- Difficulty
- Location
- Volume

All other brokers are available but disabled by default.
