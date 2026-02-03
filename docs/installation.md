```
    🐺 LXR Tarot - Installation Guide
    wolves.land - The Land of Wolves
```

# 📦 Installation Guide

## Prerequisites

### Required Dependencies
1. **menuv** - Menu system
2. **interact-sound** - Sound effects

### Framework (ONE Required)
- **lxr-core** OR
- **rsg-core** OR
- **vorp_core**

## Installation Steps

### 1. Download Resource
```bash
git clone https://github.com/iBoss21/lxr-tarot.git
```

### 2. Rename Folder
**CRITICAL**: The folder MUST be named `lxr-tarot`
```bash
mv lxr-tarot-main lxr-tarot
```

### 3. Place in Resources
```
server-data/
└── resources/
    └── [lxr]/
        └── lxr-tarot/
```

### 4. Add Items to Framework

#### For RSG-Core / LXR-Core
Add to `shared/items.lua`:
```lua
-- Tarot Card Items
['card_boosterbox'] = {['name'] = 'card_boosterbox', ['label'] = 'Booster Box', ['weight'] = 100, ['type'] = 'item', ['image'] = 'card_boosterbox.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['combinable'] = nil, ['description'] = 'A box containing 4 booster packs'},
['card_boosterpack'] = {['name'] = 'card_boosterpack', ['label'] = 'Booster Pack', ['weight'] = 50, ['type'] = 'item', ['image'] = 'card_boosterpack.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['combinable'] = nil, ['description'] = 'A pack containing 4 random cards'},
['card_pokebox'] = {['name'] = 'card_pokebox', ['label'] = 'Card Storage Box', ['weight'] = 1000, ['type'] = 'item', ['image'] = 'card_pokebox.png', ['unique'] = true, ['useable'] = true, ['shouldClose'] = true, ['combinable'] = nil, ['description'] = 'A box to store your card collection'},

-- Add all 175+ card items (see rsg-tarot/html/inventory folder for images)
```

### 5. Add Images to Inventory
Copy card images from `rsg-tarot/html/inventory/` to your inventory's image folder.

### 6. Configure Server.cfg
```cfg
ensure menuv
ensure interact-sound
ensure lxr-tarot
```

### 7. Restart Server
```bash
restart lxr-tarot
```

## Configuration

Edit `config.lua` to customize:
- Card vendor locations
- Badge quest locations  
- Card prices
- Rarity drop rates
- Security settings
- Performance options

See [Configuration Guide](configuration.md) for details.

## Verification

Check console for:
```
═══════════════════════════════════════════════════════════════════════════════
🐺 TAROT CARD COLLECTION SYSTEM - SUCCESSFULLY LOADED
═══════════════════════════════════════════════════════════════════════════════
Version:        1.0.0
Framework:      Auto-detect (rsg-core/lxr-core/vorp_core)
Cards:          175 total cards available
Badges:         9 badge exchange quests
```

## Troubleshooting

### "Resource name mismatch" Error
- Folder MUST be named exactly `lxr-tarot`

### Cards not working
- Ensure items are added to shared/items.lua
- Verify images are in inventory folder
- Check framework is detected (see console)

### NPCs not spawning
- Check Config.PedList coordinates
- Verify Config.DistanceSpawn distance
- Ensure client.lua is running

### Framework not detected
- Check your framework is started before lxr-tarot
- Verify framework resource name matches config
- See [Framework Guide](frameworks.md)

---

**© 2026 iBoss21 / The Lux Empire | wolves.land**
