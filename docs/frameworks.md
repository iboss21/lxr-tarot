```
    🐺 LXR Tarot - Framework Guide
    wolves.land - The Land of Wolves
```

# 🔧 Framework Guide

## Multi-Framework Architecture

LXR Tarot uses a **unified framework adapter** to support multiple frameworks without code duplication.

## Supported Frameworks

### ✅ Primary Support (Tier 1)
- **LXR-Core** - Full native integration
- **RSG-Core** - Full native integration

### ✅ Compatible (Tier 2)
- **VORP Core** - Full compatibility layer

### 🔄 Auto-Detection
The resource automatically detects which framework is running and adapts accordingly.

## How It Works

### Framework Bridge (`shared/framework.lua`)
The bridge provides a unified API that abstracts framework-specific calls:

```lua
-- Instead of this:
local RSGCore = exports['rsg-core']:GetCoreObject()
RSGCore.Functions.Notify(msg, type)

-- You use this (works on ALL frameworks):
Framework.Notify(msg, type)
```

### Unified Functions

#### Client-Side
- `Framework.Notify(message, type, duration)` - Show notification
- `Framework.GetPlayerData()` - Get player data
- `Framework.Progressbar(...)` - Show progress bar
- `Framework.GetKeybind(key)` - Get key binding
- `Framework.TriggerCallback(name, cb, ...)` - Trigger server callback

#### Server-Side
- `Framework.GetPlayer(source)` - Get player object
- `Framework.AddItem(source, item, amount, slot, info)` - Add item
- `Framework.RemoveItem(source, item, amount, slot, info)` - Remove item
- `Framework.GetItemByName(source, item)` - Get item data
- `Framework.AddMoney(source, account, amount, reason)` - Add money
- `Framework.RemoveMoney(source, account, amount, reason)` - Remove money
- `Framework.CreateUseableItem(item, callback)` - Register useable item
- `Framework.CreateCallback(name, callback)` - Register callback
- `Framework.GetSharedItems()` - Get item definitions

## Framework Detection Logic

Priority order:
1. **LXR-Core** (if `lxr-core` resource is running)
2. **RSG-Core** (if `rsg-core` resource is running)
3. **VORP Core** (if `vorp_core` resource is running)
4. **Standalone** (fallback - limited functionality)

## Framework-Specific Settings

Located in `Config.FrameworkSettings`:

```lua
['lxr-core'] = {
    resource = 'lxr-core',
    notifications = 'ox_lib',
    inventory = 'lxr-inventory',
    target = 'ox_target',
    events = {
        server = 'lxr-core:server:%s',
        client = 'lxr-core:client:%s',
        callback = 'lxr-core:callback:%s'
    }
}
```

## Manual Override

If auto-detection fails, you can manually set the framework:

```lua
Config.Framework = 'rsg-core'  -- Force RSG-Core
```

## Adding New Framework Support

To add support for another framework:

1. **Add framework settings** to `Config.FrameworkSettings`
2. **Implement adapter functions** in `shared/framework.lua`
3. **Test all functionality** thoroughly

## Framework-Specific Notes

### LXR-Core
- Uses `exports['lxr-core']:GetCoreObject()`
- Notification system: ox_lib
- Full feature support

### RSG-Core
- Uses `exports['rsg-core']:GetCoreObject()`
- Notification system: ox_lib
- Full feature support
- Keybinds via `RSGCore.Shared.Keybinds`

### VORP Core
- Uses `exports.vorp_core:GetCore()`
- Notification system: VORP native
- Callback system differs from QB-based frameworks
- Money: Uses currency system (0 = cash)

## Troubleshooting

### Framework Not Detected
**Check console output on startup:**
```
[LXR-Tarot] Framework initialized: rsg-core
```

**If you see:** `standalone`
- Your framework isn't started
- Resource name doesn't match config
- Framework export failed

### Functions Not Working
- Verify framework is properly initialized
- Check `Framework.IsReady` is true
- Enable `Config.Debug = true` for detailed logs

### Migration Between Frameworks
The unified API means you can switch frameworks by:
1. Stopping old framework
2. Starting new framework
3. Restarting lxr-tarot
4. No code changes needed!

## Development Tips

### Adding Framework-Specific Logic
```lua
if Framework.ActiveFramework == 'lxr-core' then
    -- LXR-specific code
elseif Framework.ActiveFramework == 'rsg-core' then
    -- RSG-specific code
elseif Framework.ActiveFramework == 'vorp_core' then
    -- VORP-specific code
end
```

### Checking Framework Ready
```lua
while not Framework or not Framework.IsReady do
    Wait(100)
end
-- Framework is now ready to use
```

---

**© 2026 iBoss21 / The Lux Empire | wolves.land**
