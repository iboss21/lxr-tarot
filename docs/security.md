```
    🐺 LXR Tarot - Security Guide
    wolves.land - The Land of Wolves
```

# 🔒 Security & Anti-Exploit Guide

## Security Philosophy

**Server Authority**: All critical operations are validated server-side. Never trust client input.

## Security Features

### 1. Distance Validation
```lua
Config.Security.validateDistance = true
Config.Security.maxInteractionDistance = 5.0
```

**Prevents:**
- Remote interaction exploits
- Teleport-to-NPC exploits
- Long-distance badge exchanges

**Implementation:**
```lua
local playerCoords = GetEntityCoords(GetPlayerPed(src))
local distance = #(playerCoords - badgeLocation)
if distance > Config.Security.maxInteractionDistance then
    return  -- Blocked
end
```

### 2. Price Verification
```lua
Config.Security.preventDuplication = true
```

**Prevents:**
- Price manipulation
- Item value exploits
- Money duplication

**Implementation:**
```lua
local expectedPrice = math.ceil(Config.CardshopItems[itemName] * amount)
if price ~= expectedPrice then
    price = expectedPrice  -- Use server-calculated price
end
```

### 3. Item Validation
```lua
Config.Security.requireAllCards = true
```

**Prevents:**
- Badge exchange without required cards
- Invalid item trading
- Inventory exploits

**Implementation:**
```lua
for k, v in pairs(badgeConfig.cards) do 
    local item = Framework.GetItemByName(src, k)
    if not item or item.amount < v then 
        return  -- Blocked
    end
end
```

### 4. Transaction Logging
```lua
Config.Security.logBadgeExchanges = true
Config.Security.logBoxOpening = true
```

**Logs:**
- All badge exchanges
- Booster box openings
- Card sales
- Suspicious activity

**Example Log:**
```
[LXR-Tarot] Player John_Doe opened booster box
[LXR-Tarot] Player Jane_Doe exchanged cards for Boulder Badge
[LXR-Tarot] Player Bob_Smith sold 10x card_pikachu for $500
```

### 5. Exploit Detection
```lua
Config.Security.cooldownBypass = false
```

**Detects:**
- Rapid transactions
- Distance violations
- Price manipulation
- Invalid items

## Anti-Exploit Measures

### Item Duplication Prevention
- Server-side item removal before addition
- Transaction atomicity
- Callback validation
- State verification

### Money Exploits
- Server calculates all prices
- No client-side price data
- Transaction logging
- Math verification

### Badge Exploits
- Required cards checked server-side
- Distance validation
- One-time exchange enforcement
- Item consumption before reward

### Speed Exploits
- Cooldown systems
- Action delays
- Progress bar enforcement
- Rate limiting

## Security Configuration

### Production Settings (Recommended)
```lua
Config.Security = {
    enabled = true,                      -- ALWAYS TRUE in production
    validateDistance = true,             -- ALWAYS TRUE
    maxInteractionDistance = 5.0,        -- Lower = more secure
    requireAllCards = true,              -- ALWAYS TRUE
    logBadgeExchanges = true,            -- Enable for monitoring
    logBoxOpening = true,                -- Enable for monitoring
    preventDuplication = true,           -- ALWAYS TRUE
    cooldownBypass = false               -- FALSE in production
}
```

### Development Settings
```lua
Config.Security = {
    enabled = true,                      -- Keep enabled for testing
    validateDistance = false,            -- Can disable for easier testing
    maxInteractionDistance = 10.0,       -- Increase for convenience
    requireAllCards = true,              -- Keep enabled
    logBadgeExchanges = true,            -- Helpful for debugging
    logBoxOpening = true,                -- Helpful for debugging
    preventDuplication = true,           -- Keep enabled
    cooldownBypass = true                -- Allow for faster testing
}
```

## Monitoring & Response

### What to Monitor
1. **Frequent badge exchanges** - Same player repeatedly
2. **High-value card sales** - Large quantities sold quickly
3. **Distance violations** - Logged suspicious activity
4. **Price mismatches** - Attempted price manipulation

### Log Analysis
Enable logging and monitor server console:
```bash
grep "LXR-Tarot" server.log | grep -E "distance|suspicious|mismatch"
```

### Discord Webhooks (Optional)
Integrate with logging system:
```lua
-- In server.lua, add webhook notifications for suspicious activity
if Config.Security.logSuspiciousActivity then
    TriggerEvent('discord:webhook', 'lxr-tarot', {
        title = 'Suspicious Activity Detected',
        description = 'Player attempted badge exchange from ' .. distance .. 'm away'
    })
end
```

## Best Practices

### For Server Owners
1. ✅ Keep `Config.Security.enabled = true` always
2. ✅ Enable all logging in production
3. ✅ Review logs weekly for patterns
4. ✅ Set appropriate `maxInteractionDistance`
5. ✅ Never disable `preventDuplication`
6. ✅ Keep framework and dependencies updated

### For Developers
1. ✅ Never trust client input
2. ✅ Validate everything server-side
3. ✅ Use Framework.GetPlayer() for all player operations
4. ✅ Check item existence before operations
5. ✅ Calculate prices server-side only
6. ✅ Log security-relevant events

### For Players
- Report any exploits to server administration
- Don't attempt to bypass security measures
- Use the system as intended for fair gameplay

## Vulnerability Reporting

Found a security issue? Please report responsibly:

1. **DO NOT** post publicly
2. Contact via Discord: https://discord.gg/CrKcWdfd3A
3. Provide detailed reproduction steps
4. Wait for confirmation before disclosure

---

**© 2026 iBoss21 / The Lux Empire | wolves.land**
