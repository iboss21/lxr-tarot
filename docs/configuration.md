```
    🐺 LXR Tarot - Configuration Guide
    wolves.land - The Land of Wolves
```

# ⚙️ Configuration Guide

## Config.lua Structure

The configuration file is organized into bannered sections:

## 🔐 Resource Name Protection
```lua
local REQUIRED_RESOURCE_NAME = "lxr-tarot"
```
**DO NOT MODIFY** - Ensures resource integrity

## 🏢 Server Information
```lua
Config.ServerInfo = {
    name = 'The Land of Wolves 🐺',
    tagline = 'Georgian RP 🇬🇪 | მგლების მიწა',
    description = 'ისტორია ცოცხლდება აქ!',
    -- ... customize for your server
}
```

## 🎮 Framework Configuration
```lua
Config.Framework = 'auto'  -- Auto-detect framework
```
Options: `'auto'`, `'lxr-core'`, `'rsg-core'`, `'vorp_core'`, `'standalone'`

## 🌍 Language Settings
```lua
Config.Lang = 'en'  -- 'en' or 'ge' (Georgian)
```

## ⚙️ General Settings
```lua
Config.General = {
    enableSkillXP = true,        -- Requires possible-skills
    enableSounds = true,          -- interact-sound effects
    enableLogs = true,            -- Server logging
    enableInventoryStash = true,  -- Card storage box
    stashMaxWeight = 0.1,         -- Storage weight limit
    stashMaxSlots = 160           -- Storage slot limit
}
```

## 🎹 Key Bindings
```lua
Config.Keys = {
    J = 0x9DB8A0BA,  -- Buy/Sell cards
    E = 0xDFF812F9   -- Exchange badges
}
```

## ⏱️ Cooldowns & Timing
```lua
Config.Cooldowns = {
    openBoxTime = 5000,         -- Booster box open time (ms)
    openPackTime = 3000,        -- Booster pack open time (ms)
    interactionDelay = 1000,    -- Badge exchange delay (ms)
    menuCooldown = 2500         -- Menu check interval (ms)
}
```

## 👤 NPC Configuration
```lua
Config.DistanceSpawn = 20.0  -- Ped spawn distance
Config.FadeIn = true         -- Fade in/out effect

Config.PedList = {
    { model = `CS_Fire_Breather`, coords2 = vector4(-3484.76, -3467.02, 0.12, 141.4) },
    -- Add/remove NPC locations as needed
}
```

## 🏪 Card Shop Locations
```lua
Config.CardshopLocation = {
    ['Cardshop'] = {
        location = vector3(-1845.4, -1731.23, 85.57),
        label = 'Sell Cards Tarot'
    },
    -- Customize shop locations
}
```

## 🗺️ Blip Configuration
```lua
Config.Blip = {
    blipName = 'Tarot',
    blipSprite = 'blip_mission_area_rc',
    blipScale = 0.2
}
```

## 🏅 Badge Exchange System
```lua
Config.Badge = {
    ["card_boulderbadge"] = {
        Amount = 1,
        label = "Boulder Badge",
        reward = "card_boulderbadge",
        location = vector3(-3484.76, -3467.02, 0.12),
        cards = {
            ["card_graveler"] = 1,
            ["card_rhyhorn"] = 1,
            -- Required cards for exchange
        }
    },
    -- Configure badge requirements
}
```

## 💰 Card Pricing
```lua
Config.CardshopItems = {
    -- Badges
    ['card_boulderbadge'] = 1000,
    ['card_trophybadge'] = 15000,
    
    -- Basic Cards
    ['card_pikachu'] = 50,
    
    -- Rare Cards
    ['card_charizard'] = 100,
    
    -- Ultra Cards
    ['card_mewtwo'] = 250,
    
    -- V Cards
    ['card_charizardv'] = 700,
    
    -- VMAX Cards
    ['card_vmaxcharizard'] = 1300,
    
    -- Rainbow Cards
    ['card_rainbowvmaxcharizard'] = 2700
}
```

**Adjust prices to match your server's economy!**

## 🔒 Security Settings
```lua
Config.Security = {
    enabled = true,                      -- Enable security checks
    validateDistance = true,             -- Validate player distance
    maxInteractionDistance = 5.0,        -- Max interaction distance
    requireAllCards = true,              -- Require all cards for badges
    logBadgeExchanges = true,            -- Log badge exchanges
    logBoxOpening = true,                -- Log box openings
    preventDuplication = true,           -- Anti-duplication
    cooldownBypass = false               -- Admin cooldown bypass
}
```

## ⚡ Performance Settings
```lua
Config.Performance = {
    pedSpawnDistance = 20.0,             -- NPC spawn distance
    pedUpdateInterval = 500,             -- Update interval (ms)
    locationCheckInterval = 1,           -- Proximity check (ms)
    locationCheckFallback = 1000,        -- Far check interval (ms)
    enablePedFade = true,                -- Fade effects
    cachePlayerData = true,              -- Cache player data
    maxCachedPlayers = 50                -- Max cache entries
}
```

## 🐛 Debug Mode
```lua
Config.Debug = false  -- Enable for troubleshooting
```

## Best Practices

### Economy Balance
- Start with reference prices and adjust based on server economy
- Monitor card values vs player income
- Adjust rarity rates if needed (server.lua)

### Performance
- Reduce `pedSpawnDistance` on populated servers
- Increase `pedUpdateInterval` if experiencing lag
- Disable `enablePedFade` for max performance

### Security
- Keep `Config.Security.enabled = true` in production
- Enable logging for anti-cheat monitoring
- Set appropriate `maxInteractionDistance`

---

**© 2026 iBoss21 / The Lux Empire | wolves.land**
