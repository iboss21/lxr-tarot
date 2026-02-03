```
    ██╗     ██╗  ██╗██████╗       ████████╗ █████╗ ██████╗  ██████╗ ████████╗
    ██║     ╚██╗██╔╝██╔══██╗      ╚══██╔══╝██╔══██╗██╔══██╗██╔═══██╗╚══██╔══╝
    ██║      ╚███╔╝ ██████╔╝█████╗   ██║   ███████║██████╔╝██║   ██║   ██║   
    ██║      ██╔██╗ ██╔══██╗╚════╝   ██║   ██╔══██║██╔══██╗██║   ██║   ██║   
    ███████╗██╔╝ ██╗██║  ██║         ██║   ██║  ██║██║  ██║╚██████╔╝   ██║   
    ╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝         ╚═╝   ╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝    ╚═╝   
                                                                               
    🐺 LXR Tarot - Card Collection System
    wolves.land - The Land of Wolves | მგლების მიწა
```

<div align="center">

![Version](https://img.shields.io/badge/version-1.0.0-blue.svg)
![RedM](https://img.shields.io/badge/RedM-Compatible-red.svg)
![License](https://img.shields.io/badge/license-Custom-orange.svg)
![Framework](https://img.shields.io/badge/framework-Multi--Framework-green.svg)

**[🌐 wolves.land](https://www.wolves.land)** | **[💬 Discord](https://discord.gg/CrKcWdfd3A)** | **[🛒 Store](https://theluxempire.tebex.io)** | **[📖 Documentation](docs/overview.md)**

</div>

---

## 🎴 Overview

**LXR Tarot** is a production-grade collectible card system for RedM featuring **175+ unique Pokemon-themed tarot cards**, a multi-tiered rarity system, badge quest chains, and dynamic NPC trading. Built for serious roleplay servers with multi-framework support and enterprise-level security.

### ✨ Key Features

- 🃏 **175+ Unique Cards** - Complete Pokemon collection system
- 🎲 **6 Rarity Tiers** - From Basic (60%) to Rainbow (0.5%)
- 🏆 **8 Badge Quests** - Complete themed card sets for prestigious badges
- 🏪 **10 NPC Vendors** - Dynamic spawning Fire Breather NPCs across the map
- 💼 **Card Storage** - Dedicated 160-slot storage box for your collection
- 💰 **Trading Economy** - Sell cards at 4 shop locations with dynamic pricing
- 🎨 **Animated UI** - Custom NUI card reveal interface
- 🔊 **Sound Effects** - Immersive audio feedback via interact-sound
- 🌍 **Multi-Language** - English & Georgian (ქართული) support
- 🔧 **Multi-Framework** - LXR-Core, RSG-Core, VORP Core auto-detection

---

## 🚀 Quick Start

### Installation

```bash
# 1. Clone repository
git clone https://github.com/iBoss21/lxr-tarot.git

# 2. Rename folder (REQUIRED)
mv lxr-tarot-main lxr-tarot

# 3. Move to resources
mv lxr-tarot server-data/resources/[lxr]/

# 4. Add to server.cfg
ensure menuv
ensure interact-sound
ensure lxr-tarot

# 5. Restart server
restart lxr-tarot
```

**Full installation guide:** [📦 Installation](docs/installation.md)

---

## 🎮 Gameplay

### Card Collection
1. **Obtain booster boxes/packs** from shops or rewards
2. **Open packs** to reveal 4 random cards with rarity-based drops
3. **Build your collection** - Chase rare V, VMAX, and Rainbow cards

### Badge Quests
1. **Collect themed card sets** (Rock, Water, Fire, etc.)
2. **Visit NPC locations** across the map
3. **Exchange complete sets** for prestigious badges
4. **Earn the Trophy** by collecting all 8 badges!

### Economy
- **Sell cards** at 4 shop locations
- **Dynamic pricing** based on rarity ($50 - $2,700)
- **Trade with players** to complete your collection

---

## 🎯 Rarity System

| Rarity | Drop Rate | Value Range | Examples |
|--------|-----------|-------------|----------|
| 🟢 **Basic** | 60.1% | $50 | Pikachu, Charmander |
| 🔵 **Rare** | 29.9% | $50-100 | Gyarados, Machamp |
| 🟣 **Ultra** | 5% | $250 | Mewtwo, Legendary Birds |
| 🟡 **V Cards** | 3% | $400-600 | Charizard V, Pikachu V |
| 🔴 **VMAX** | 1.4% | $900-1,500 | Charizard VMAX |
| 🌈 **Rainbow** | 0.5% | $2,000-2,700 | Rainbow VMAX (Legendary!) |

---

## 🏅 Badge Locations

| Badge | Location | Type | Cards Required |
|-------|----------|------|----------------|
| 🪨 **Boulder** | Guarma | Rock | 6 Rock-type cards |
| 💧 **Cascade** | Annesburg | Water | 5 Water-type cards |
| ⚡ **Thunder** | Strawberry | Electric | 6 Electric-type cards |
| 🌿 **Rainbow** | Emerald Ranch | Grass | 6 Grass-type cards |
| ☠️ **Soul** | Valentine | Poison | 6 Poison-type cards |
| 🧠 **Marsh** | Rhodes | Psychic | 6 Psychic-type cards |
| 🔥 **Volcano** | Blackwater | Fire | 6 Fire-type cards |
| 🌍 **Earth** | Saint Denis | Ground | 6 Ground-type cards |
| 🏆 **Trophy** | Tumbleweed | League | All 8 Badges |

---

## 🔧 Framework Support

### Auto-Detection System
LXR Tarot automatically detects your framework - no configuration needed!

### Supported Frameworks
- ✅ **LXR-Core** - Full native integration (Primary)
- ✅ **RSG-Core** - Full native integration (Primary)
- ✅ **VORP Core** - Full compatibility layer (Supported)

### Unified API
All framework-specific calls are abstracted through a unified adapter:
```lua
-- Works on ALL frameworks!
Framework.Notify("Card obtained!", "success")
Framework.AddItem(source, 'card_pikachu', 1)
Framework.AddMoney(source, 'cash', 500, 'card-sale')
```

**Learn more:** [🔧 Framework Guide](docs/frameworks.md)

---

## 📚 Documentation

### 📖 Complete Documentation

- **[Overview](docs/overview.md)** - System features and capabilities
- **[Installation](docs/installation.md)** - Step-by-step setup guide
- **[Configuration](docs/configuration.md)** - All config options explained
- **[Frameworks](docs/frameworks.md)** - Multi-framework architecture
- **[Events & API](docs/events.md)** - Complete API reference
- **[Security](docs/security.md)** - Anti-exploit measures
- **[Performance](docs/performance.md)** - Optimization guide
- **[Screenshots](docs/screenshots.md)** - Documentation requirements

---

## 🔒 Security Features

✅ **Server Authority** - All transactions validated server-side  
✅ **Distance Validation** - Prevents remote interaction exploits  
✅ **Price Verification** - Server-calculated pricing only  
✅ **Item Validation** - Existence and quantity checks  
✅ **Anti-Duplication** - Secure transaction handling  
✅ **Activity Logging** - Track suspicious behavior  

**Full security details:** [🔒 Security Guide](docs/security.md)

---

## ⚡ Performance

### Optimized for Production
- **< 1 FPS** impact on clients
- **< 0.1ms** server CPU per tick
- **< 5MB** memory footprint
- **Event-driven** architecture for zero idle overhead

### Smart Features
- Dynamic ped spawning (20m radius)
- Adaptive Wait() times based on player proximity
- Efficient caching system
- Minimal network traffic

**Performance tuning:** [⚡ Performance Guide](docs/performance.md)

---

## 🎨 Media

### Screenshots

| Startup Console | Card Opening UI | Badge Exchange |
|----------------|-----------------|----------------|
| ![Console](docs/assets/screenshots/placeholder_console.png) | ![UI](docs/assets/screenshots/placeholder_ui.png) | ![Badge](docs/assets/screenshots/placeholder_badge.png) |

**See:** [📸 Screenshot Guide](docs/screenshots.md) for requirements

---

## 🛠️ Configuration

### Quick Config
```lua
-- config.lua

Config.Framework = 'auto'  -- Auto-detect framework
Config.Lang = 'en'          -- Language (en/ge)
Config.Debug = false        -- Debug mode

Config.DistanceSpawn = 20.0 -- NPC spawn distance
Config.FadeIn = true        -- Enable fade effects

-- Customize card prices
Config.CardshopItems = {
    ['card_pikachu'] = 50,
    ['card_charizardv'] = 700,
    ['card_rainbowvmaxcharizard'] = 2700
}
```

**Full configuration guide:** [⚙️ Configuration](docs/configuration.md)

---

## 🏢 Server Information

### Designed for wolves.land

**Server:** The Land of Wolves 🐺  
**Tagline:** Georgian RP 🇬🇪 | მგლების მიწა - რჩეულთა ადგილი!  
**Description:** ისტორია ცოცხლდება აქ! (History Lives Here!)  
**Type:** Serious Hardcore Roleplay  
**Access:** Discord & Whitelisted  

**🌐 Website:** https://www.wolves.land  
**💬 Discord:** https://discord.gg/CrKcWdfd3A  
**🔧 GitHub:** https://github.com/iBoss21  
**🛒 Store:** https://theluxempire.tebex.io  
**🎮 Server:** https://servers.redm.net/servers/detail/8gj7eb  

---

## 📋 Dependencies

### Required
- **menuv** - Menu system for card shop
- **interact-sound** - Sound effects system

### Framework (ONE Required)
- **lxr-core** OR
- **rsg-core** OR
- **vorp_core**

### Optional
- **possible-skills** - XP system integration
- **rsg-log** - Enhanced logging

---

## 🤝 Credits

**Script Author:** iBoss21 / The Lux Empire for The Land of Wolves  
**Original Script:** Sadicius (rsg-tarot)  
**Original Concept:** DafkeDD (jim-pokemon for FiveM)  
**Pokemon Assets:** The Pokemon Company  
**Server:** wolves.land - The Land of Wolves  

---

## 📜 License

**© 2026 iBoss21 / The Lux Empire | wolves.land | All Rights Reserved**

This resource is branded for **The Land of Wolves** (wolves.land). 

### Terms
- ✅ Use on your RedM server
- ✅ Customize for your server needs
- ❌ Re-sell or redistribute
- ❌ Claim as your own work
- ❌ Remove branding/credits

**Custom licensing available:** Contact via [Discord](https://discord.gg/CrKcWdfd3A)

---

## 🐛 Issues & Support

### Reporting Issues
Found a bug? [Open an issue](https://github.com/iBoss21/lxr-tarot/issues) with:
- Detailed description
- Steps to reproduce
- Server console logs
- Framework being used

### Getting Help
- 📖 Check [Documentation](docs/overview.md)
- 💬 Join our [Discord](https://discord.gg/CrKcWdfd3A)
- 🔍 Search existing issues
- 🎫 Create a support ticket

---

## 🗺️ Roadmap

### Upcoming Features
- [ ] Web-based card collection tracker
- [ ] Player trading system
- [ ] Card auction house
- [ ] Additional themed badge quests
- [ ] Seasonal limited edition cards
- [ ] Achievement system integration

---

## 🌟 Show Your Support

If you enjoy this resource:
- ⭐ Star this repository
- 🔀 Share with other server owners
- 💬 Join our Discord community
- 🛒 Check out our other resources

---

<div align="center">

**Built with ❤️ by iBoss21 for The Land of Wolves 🐺**

**🇬🇪 მგლების მიწა - რჩეულთა ადგილი! 🇬🇪**

![wolves.land](https://img.shields.io/badge/wolves.land-Production--Ready-success)
![Framework](https://img.shields.io/badge/LXR--Core%20%7C%20RSG--Core%20%7C%20VORP-Multi--Framework-blue)
![Security](https://img.shields.io/badge/Security-Enterprise--Grade-red)

**[Website](https://www.wolves.land) • [Discord](https://discord.gg/CrKcWdfd3A) • [Store](https://theluxempire.tebex.io) • [Documentation](docs/overview.md)**

</div>
