```
    🐺 LXR Tarot - Screenshot Requirements
    wolves.land - The Land of Wolves
```

# 📸 Screenshot Documentation

## Required Screenshots

All screenshots should be stored in `/docs/assets/screenshots/`

### 1. Startup Console (`01_startup_console.png`)
**What to capture:**
- Server console showing LXR Tarot startup banner
- Framework detection message
- Card/badge count summary
- Version information

**Requirements:**
- Full terminal window
- Clear text (no compression artifacts)
- Shows successful initialization

### 2. Config Sections (`02_config_sections.png`)
**What to capture:**
- config.lua open in editor
- Show bannered sections (████ headers)
- Highlight branded header with ASCII art
- Display key configuration areas

**Requirements:**
- Syntax highlighting enabled
- Multiple sections visible
- Clear ASCII art formatting

### 3. UI Interaction (`03_ui_interaction.png`)
**What to capture:**
- Player opening card pack
- NUI card reveal interface
- Card animation in progress
- Card name/image visible

**Requirements:**
- In-game screenshot
- Clear UI elements
- No obstructions
- Good lighting

### 4. Framework Detection (`04_framework_detection.png`)
**What to capture:**
- Console log showing framework detection
- "Framework initialized: [framework-name]"
- Related initialization messages

**Requirements:**
- Console/terminal capture
- Clear text
- Framework name visible

### 5. NPC Vendor (`05_npc_vendor.png`)
**What to capture:**
- Player near Fire Breather NPC
- 3D text prompt visible
- Location/environment context
- Character interaction range

**Requirements:**
- In-game screenshot
- NPC clearly visible
- Prompt text readable
- Good camera angle

### 6. Badge Exchange (`06_badge_exchange.png`)
**What to capture:**
- Player at badge exchange location
- Exchange prompt visible
- Badge reward notification (if possible)
- Location identifiable

**Requirements:**
- In-game screenshot
- Clear prompt text
- Good lighting
- Context visible

### 7. Card Shop Menu (`07_card_shop_menu.png`)
**What to capture:**
- MenuV interface open
- Card list with prices
- Player items visible
- Shop interaction

**Requirements:**
- Clear menu text
- Prices visible
- Full menu shown
- No UI obstruction

### 8. TxAdmin Performance (`08_txadmin_performance.png`)
**What to capture:**
- TxAdmin performance monitor
- lxr-tarot resource metrics
- CPU/Memory usage
- Thread count

**Requirements:**
- TxAdmin interface
- Clear metrics
- lxr-tarot highlighted
- Performance data visible

### 9. Card Storage Box (`09_card_storage.png`)
**What to capture:**
- Card storage inventory open
- Multiple cards visible
- Stash interface
- Storage capacity shown

**Requirements:**
- Clear inventory UI
- Cards displayed
- Capacity indicator visible

### 10. Notification System (`10_notifications.png`)
**What to capture:**
- Various in-game notifications
- Card obtained message
- Badge received message
- Sale confirmation

**Requirements:**
- Clear notification text
- On-screen display
- Multiple examples if possible

## Screenshot Guidelines

### Format
- **File Format**: PNG (preferred) or JPEG
- **Resolution**: Minimum 1920x1080
- **Quality**: High quality, no compression artifacts
- **Size**: Under 5MB per image

### Naming Convention
```
[number]_[descriptor].png
```
Examples:
- `01_startup_console.png`
- `02_config_sections.png`
- `03_ui_interaction.png`

### File Location
```
/docs/assets/screenshots/
├── 01_startup_console.png
├── 02_config_sections.png
├── 03_ui_interaction.png
├── 04_framework_detection.png
├── 05_npc_vendor.png
├── 06_badge_exchange.png
├── 07_card_shop_menu.png
├── 08_txadmin_performance.png
├── 09_card_storage.png
└── 10_notifications.png
```

## Capture Tools

### For In-Game Screenshots
- **Windows**: Win + PrtScn or F8 (in-game)
- **Linux**: gnome-screenshot or scrot
- **FiveM**: F8 screenshot command

### For Console/Terminal
- **Windows**: Snipping Tool / Snip & Sketch
- **Linux**: gnome-screenshot
- **macOS**: Cmd + Shift + 4

### For TxAdmin
- Browser screenshot tools
- Full-page capture extensions

## Quality Checklist

- [ ] All text is readable
- [ ] No watermarks or overlays (except game UI)
- [ ] Appropriate resolution (1920x1080+)
- [ ] Clear focus and lighting
- [ ] Relevant content in frame
- [ ] File size optimized
- [ ] Proper naming convention
- [ ] Correct file location

## Optional Screenshots

### Additional Documentation
- Card rarity distribution chart
- Badge quest map locations
- Price comparison table
- Framework compatibility matrix

### Marketing Materials
- Gameplay highlights
- Collection showcase
- Server integration examples
- Community reactions

## Using Screenshots

### In Documentation
Reference screenshots in markdown:
```markdown
![Startup Console](assets/screenshots/01_startup_console.png)
```

### In README
```markdown
## Screenshots

### Startup Banner
![Startup](docs/assets/screenshots/01_startup_console.png)

### Card Opening UI
![UI](docs/assets/screenshots/03_ui_interaction.png)
```

### In Store Listings
- Use high-quality, representative screenshots
- Show key features clearly
- Highlight unique selling points

---

**© 2026 iBoss21 / The Lux Empire | wolves.land**
