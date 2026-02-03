```
    ██╗     ██╗  ██╗██████╗       ████████╗ █████╗ ██████╗  ██████╗ ████████╗
    ██║     ╚██╗██╔╝██╔══██╗      ╚══██╔══╝██╔══██╗██╔══██╗██╔═══██╗╚══██╔══╝
    ██║      ╚███╔╝ ██████╔╝█████╗   ██║   ███████║██████╔╝██║   ██║   ██║   
    ██║      ██╔██╗ ██╔══██╗╚════╝   ██║   ██╔══██║██╔══██╗██║   ██║   ██║   
    ███████╗██╔╝ ██╗██║  ██║         ██║   ██║  ██║██║  ██║╚██████╔╝   ██║   
    ╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝         ╚═╝   ╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝    ╚═╝   
                                                                               
    🐺 LXR Tarot - System Overview
    wolves.land - The Land of Wolves | მგლების მიწა
```

# 📋 System Overview

## 🎴 What is LXR Tarot?

**LXR Tarot** is a comprehensive collectible card system for RedM, featuring **175+ unique Pokemon-themed tarot cards** with a multi-tiered rarity system, badge quest chains, and NPC trading mechanics. Designed for serious roleplay servers, it adds depth to player progression and provides a engaging collection meta-game.

## 🌟 Key Features

### 🃏 Card Collection System
- **175+ Unique Cards**: Pokemon-themed tarot cards spanning all generations
- **6 Rarity Tiers**: 
  - Basic (60.1% drop rate)
  - Rare (29.9% drop rate)
  - Ultra (5% drop rate)
  - V Cards (3% drop rate)
  - VMAX Cards (1.4% drop rate)
  - Rainbow Cards (0.5% drop rate - Legendary!)

### 🏆 Badge Quest System
- **8 Themed Badge Quests**: Complete card sets to earn special badges
- **Progressive Difficulty**: Each badge requires specific themed card collections
- **Ultimate Trophy**: Collect all 8 badges to earn the League Trophy

### 🏪 Trading & Economy
- **Multiple Vendor Locations**: 10 NPC vendors across the map
- **Dynamic Pricing**: Card values based on rarity (Basic: $50 to Rainbow: $2700)
- **Card Shops**: 4 dedicated locations to sell your collection

### 🎁 Opening Experience
- **Booster Boxes**: Contains 4 booster packs
- **Booster Packs**: Each pack contains 4 random cards
- **Animated UI**: Custom NUI interface for card reveals
- **Sound Effects**: Immersive audio feedback

### 💼 Card Storage
- **Dedicated Storage Box**: Store up to 160 cards (0.1kg max weight)
- **Inventory Integration**: Seamless stash system
- **Organized Collection**: Keep your cards separate from regular items

## 🔧 Framework Support

### Primary Frameworks (Full Support)
- ✅ **LXR-Core** - Native integration
- ✅ **RSG-Core** - Native integration
- ✅ **VORP Core** - Full compatibility

### Framework Features
- **Auto-Detection**: Automatically detects and uses your framework
- **Unified API**: Framework-agnostic gameplay logic
- **Easy Migration**: Switch frameworks without code changes

## 🎯 Gameplay Loop

1. **Obtain Booster Boxes/Packs**
   - Purchase from shops
   - Receive as rewards
   - Trade with players

2. **Open Packs & Collect Cards**
   - Experience animated card reveals
   - Build your collection
   - Chase rare cards

3. **Complete Badge Quests**
   - Visit themed NPC locations
   - Exchange complete card sets
   - Earn prestigious badges

4. **Trade & Profit**
   - Sell duplicate cards at shops
   - Trade with other players
   - Complete your collection

## 📊 Rarity Distribution

| Rarity | Drop Rate | Example Cards | Value Range |
|--------|-----------|---------------|-------------|
| Basic | 60.1% | Pikachu, Charmander, Bulbasaur | $50 |
| Rare | 29.9% | Gyarados, Machamp, Venusaur | $50-100 |
| Ultra | 5% | Mewtwo, Mew, Legendary Birds | $250 |
| V | 3% | Charizard V, Pikachu V | $400-600 |
| VMAX | 1.4% | Charizard VMAX | $900-1500 |
| Rainbow | 0.5% | Rainbow VMAX | $2000-2700 |

## 🏅 Badge Quest Locations

1. **Boulder Badge** - Guarma (Rock-type cards)
2. **Cascade Badge** - Annesburg (Water-type cards)
3. **Thunder Badge** - Strawberry (Electric-type cards)
4. **Rainbow Badge** - Emerald Ranch (Grass-type cards)
5. **Soul Badge** - Valentine (Poison-type cards)
6. **Marsh Badge** - Rhodes (Psychic-type cards)
7. **Volcano Badge** - Blackwater (Fire-type cards)
8. **Earth Badge** - Saint Denis (Ground-type cards)

**League Trophy** - Tumbleweed (Requires all 8 badges!)

## 🎮 Player Experience

### Immersive Elements
- **Ambient NPC Vendors**: Fire Breather NPCs spawn/despawn dynamically
- **3D Text Prompts**: Clear interaction indicators
- **Progress Bars**: Visual feedback for all actions
- **Localization**: English and Georgian language support

### Security Features
- **Server-Side Validation**: All transactions verified server-side
- **Distance Checks**: Prevent exploits via distance validation
- **Price Verification**: Server calculates all prices
- **Anti-Duplication**: Secure item handling

### Performance Optimization
- **Efficient Ped Spawning**: 20m spawn radius with fade effects
- **Cached Data**: Minimal server overhead
- **Optimized Loops**: Smart Wait() usage for FPS preservation

## 🔒 Security & Fair Play

- ✅ Server authority on all transactions
- ✅ Distance validation for NPC interactions
- ✅ Price calculation verification
- ✅ Item existence validation
- ✅ Badge requirement enforcement
- ✅ Exploit prevention logging

## 📈 Progression Tracking

Players can track their progress through:
- Total cards collected
- Badge quests completed
- Rare cards obtained
- Total value of collection

## 🌐 Server Integration

### Designed for wolves.land
This resource is production-ready for:
- **The Land of Wolves** - Georgian RP Server
- Serious hardcore roleplay environments
- Whitelisted communities
- Economy-focused servers

### Contact & Support
- 🌐 Website: https://www.wolves.land
- 💬 Discord: https://discord.gg/CrKcWdfd3A
- 🔧 GitHub: https://github.com/iBoss21
- 🛒 Store: https://theluxempire.tebex.io

---

**© 2026 iBoss21 / The Lux Empire | wolves.land | All Rights Reserved**
