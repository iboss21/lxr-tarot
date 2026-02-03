```
    🐺 LXR Tarot - Performance Guide
    wolves.land - The Land of Wolves
```

# ⚡ Performance Optimization Guide

## Performance Philosophy

**Optimization First**: Every feature is designed with performance in mind.

## Performance Metrics

### Target Performance
- **Client FPS Impact**: < 1 FPS drop
- **Server CPU**: < 0.1ms per tick
- **Memory Usage**: < 5MB
- **Network Traffic**: Minimal (event-based)

### Actual Performance
- ✅ Optimized ped spawning system
- ✅ Smart Wait() usage eliminates unnecessary loops
- ✅ Distance-based updates
- ✅ Cached player data
- ✅ Event-driven architecture

## Performance Settings

### Config.Performance
```lua
Config.Performance = {
    pedSpawnDistance = 20.0,             -- NPC spawn radius
    pedUpdateInterval = 500,             -- Update check frequency (ms)
    locationCheckInterval = 1,           -- Proximity check (when near)
    locationCheckFallback = 1000,        -- Proximity check (when far)
    enablePedFade = true,                -- Fade in/out effects
    cachePlayerData = true,              -- Player data caching
    maxCachedPlayers = 50                -- Cache limit
}
```

## Optimization Techniques

### 1. Smart Ped Spawning
```lua
-- Peds only spawn when player is within range
if distance < Config.Performance.pedSpawnDistance and not spawnedPeds[k] then
    local spawnedPed = NearPed(v.model, v.coords2)
    spawnedPeds[k] = { spawnedPed = spawnedPed }
end
```

**Benefits:**
- No unnecessary ped entities
- Dynamic spawn/despawn
- Smooth fade effects
- Minimal entity count

### 2. Dynamic Wait Times
```lua
-- Fast checks when player is near
if distance < 2.5 then
    Wait(1)  -- Fast polling
else
    Wait(Config.Performance.locationCheckFallback)  -- Slow polling
end
```

**Benefits:**
- Responsive when needed
- CPU-friendly when idle
- Adaptive performance

### 3. Event-Driven Architecture
```lua
-- Instead of constant polling:
RegisterNetEvent('Cards2:Server:GetPokemon')

-- Not this:
while true do
    -- Check every frame
    Wait(0)
end
```

**Benefits:**
- Zero overhead when idle
- Instant response when triggered
- Scalable to many players

### 4. Server-Side Caching
```lua
-- Cache frequently accessed data
local cardCache = {}
if not cardCache[itemName] then
    cardCache[itemName] = Config.CardshopItems[itemName]
end
```

**Benefits:**
- Faster lookups
- Reduced table iterations
- Lower CPU usage

## Performance Tuning

### High Population Servers (50+ players)
```lua
Config.Performance = {
    pedSpawnDistance = 15.0,             -- Reduce spawn radius
    pedUpdateInterval = 1000,            -- Slower updates
    locationCheckInterval = 1,           
    locationCheckFallback = 2000,        -- Longer fallback
    enablePedFade = false,               -- Disable fades
    cachePlayerData = true,              
    maxCachedPlayers = 100               -- Increase cache
}
```

### Low Population Servers (< 20 players)
```lua
Config.Performance = {
    pedSpawnDistance = 30.0,             -- Larger spawn radius
    pedUpdateInterval = 250,             -- Faster updates
    locationCheckInterval = 1,           
    locationCheckFallback = 500,         -- Shorter fallback
    enablePedFade = true,                -- Enable fades
    cachePlayerData = true,              
    maxCachedPlayers = 30                -- Smaller cache
}
```

### Potato Servers (Limited Resources)
```lua
Config.Performance = {
    pedSpawnDistance = 10.0,             -- Minimal spawn radius
    pedUpdateInterval = 2000,            -- Very slow updates
    locationCheckInterval = 100,         -- Slower proximity checks
    locationCheckFallback = 5000,        -- Very long fallback
    enablePedFade = false,               -- Disable fades
    cachePlayerData = false,             -- Disable caching
    maxCachedPlayers = 20                -- Minimal cache
}
```

## Profiling & Monitoring

### TxAdmin Performance Monitor
Check resource usage in TxAdmin:
1. Open TxAdmin
2. Navigate to Live Console
3. Monitor `lxr-tarot` metrics

### Target Metrics
- CPU Time: < 0.1ms/tick
- Memory: < 5MB
- Threads: 3-5 active

### FiveM Profiler
```lua
-- Enable profiling
Config.Debug = true

-- Check logs for timing info
print(string.format('[LXR-Tarot] Operation took %.2fms', duration))
```

## Common Performance Issues

### Issue: FPS Drops Near NPCs
**Cause:** Too many peds spawning at once

**Solution:**
```lua
Config.Performance.pedSpawnDistance = 15.0  -- Reduce radius
```

### Issue: Server Lag
**Cause:** Too frequent updates

**Solution:**
```lua
Config.Performance.pedUpdateInterval = 1000  -- Slower updates
Config.Performance.locationCheckFallback = 2000  -- Longer fallback
```

### Issue: High Memory Usage
**Cause:** Cache not cleaning up

**Solution:**
```lua
Config.Performance.maxCachedPlayers = 30  -- Reduce cache size
```

### Issue: Slow Card Opening
**Cause:** Network latency

**Solution:**
- Check server network connection
- Optimize other resources
- Increase `Config.Cooldowns.openPackTime`

## Best Practices

### DO:
- ✅ Use event-driven logic
- ✅ Implement smart Wait() times
- ✅ Use distance checks before processing
- ✅ Cache frequently accessed data
- ✅ Clean up spawned entities
- ✅ Use server-side validation

### DON'T:
- ❌ Use Wait(0) in loops
- ❌ Spawn peds globally
- ❌ Poll player data every frame
- ❌ Create unnecessary threads
- ❌ Leave entities unmanaged
- ❌ Process on client when possible on server

## Optimization Checklist

- [ ] Reduce `pedSpawnDistance` on populated servers
- [ ] Increase `pedUpdateInterval` if lag persists
- [ ] Disable `enablePedFade` on low-end servers
- [ ] Monitor server console for errors
- [ ] Profile with TxAdmin performance monitor
- [ ] Test with maximum expected player count
- [ ] Optimize other resources on server

## Advanced Optimization

### Thread Consolidation
Consider consolidating similar loops:
```lua
-- Instead of multiple threads
CreateThread(function() -- Ped spawning end)
CreateThread(function() -- Location checks end)

-- Combine related operations
CreateThread(function()
    while true do
        Wait(Config.Performance.pedUpdateInterval)
        -- Do ped spawning
        -- Do location checks
    end
end)
```

### Entity Management
```lua
-- Always clean up entities
DeleteEntity(propbox)
ClearPedTasks(PlayerPedId())

-- Use proper entity lifecycle
CreateObject(...) -- Create
AttachEntityToEntity(...) -- Use
DeleteEntity(...) -- Destroy
```

---

**© 2026 iBoss21 / The Lux Empire | wolves.land**
