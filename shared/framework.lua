--[[
    ██╗     ██╗  ██╗██████╗       ████████╗ █████╗ ██████╗  ██████╗ ████████╗
    ██║     ╚██╗██╔╝██╔══██╗      ╚══██╔══╝██╔══██╗██╔══██╗██╔═══██╗╚══██╔══╝
    ██║      ╚███╔╝ ██████╔╝█████╗   ██║   ███████║██████╔╝██║   ██║   ██║   
    ██║      ██╔██╗ ██╔══██╗╚════╝   ██║   ██╔══██║██╔══██╗██║   ██║   ██║   
    ███████╗██╔╝ ██╗██║  ██║         ██║   ██║  ██║██║  ██║╚██████╔╝   ██║   
    ╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝         ╚═╝   ╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝    ╚═╝   
                                                                               
    🐺 LXR Tarot - Framework Adapter / Bridge
    
    This file provides a unified API layer that abstracts framework-specific calls.
    All gameplay logic should use these unified functions instead of calling
    framework-specific exports/events directly.
    
    ═══════════════════════════════════════════════════════════════════════════════
    SERVER INFORMATION
    ═══════════════════════════════════════════════════════════════════════════════
    
    Server:      The Land of Wolves 🐺
    Tagline:     Georgian RP 🇬🇪 | მგლების მიწა - რჩეულთა ადგილი!
    Description: ისტორია ცოცხლდება აქ! (History Lives Here!)
    Type:        Serious Hardcore Roleplay
    Access:      Discord & Whitelisted
    
    Developer:   iBoss21 / The Lux Empire
    Website:     https://www.wolves.land
    Discord:     https://discord.gg/CrKcWdfd3A
    GitHub:      https://github.com/iBoss21
    Store:       https://theluxempire.tebex.io
    Server:      https://servers.redm.net/servers/detail/8gj7eb
    
    ═══════════════════════════════════════════════════════════════════════════════
    
    Version: 1.0.0
    Performance Target: Zero overhead framework abstraction
    
    Tags: RedM, Georgian, SeriousRP, Whitelist, Tarot, Cards, Framework, Bridge
    
    Framework Support:
    - LXR Core (Primary)
    - RSG Core (Primary)
    - VORP Core (Supported)
    
    ═══════════════════════════════════════════════════════════════════════════════
    CREDITS
    ═══════════════════════════════════════════════════════════════════════════════
    
    Script Author: iBoss21 / The Lux Empire for The Land of Wolves
    Original Script: Sadicius (rsg-tarot)
    Inspired by: jim-pokemon (DafkeDD)
    
    © 2026 iBoss21 / The Lux Empire | wolves.land | All Rights Reserved
]]

-- ═══════════════════════════════════════════════════════════════════════════════
-- 🐺 FRAMEWORK DETECTION & INITIALIZATION
-- ═══════════════════════════════════════════════════════════════════════════════

Framework = {}
Framework.ActiveFramework = nil
Framework.FrameworkObject = nil
Framework.IsReady = false

-- Auto-detect framework based on running resources
local function DetectFramework()
    if Config.Framework ~= 'auto' then
        return Config.Framework
    end
    
    -- Priority order: LXR-Core > RSG-Core > VORP Core
    if GetResourceState('lxr-core') == 'started' or GetResourceState('lxr-core') == 'starting' then
        return 'lxr-core'
    elseif GetResourceState('rsg-core') == 'started' or GetResourceState('rsg-core') == 'starting' then
        return 'rsg-core'
    elseif GetResourceState('vorp_core') == 'started' or GetResourceState('vorp_core') == 'starting' then
        return 'vorp_core'
    end
    
    return 'standalone'
end

-- Initialize framework
local function InitializeFramework()
    Framework.ActiveFramework = DetectFramework()
    
    if Framework.ActiveFramework == 'lxr-core' then
        Framework.FrameworkObject = exports['lxr-core']:GetCoreObject()
    elseif Framework.ActiveFramework == 'rsg-core' then
        Framework.FrameworkObject = exports['rsg-core']:GetCoreObject()
    elseif Framework.ActiveFramework == 'vorp_core' then
        Framework.FrameworkObject = exports.vorp_core:GetCore()
    end
    
    Framework.IsReady = true
    
    if Config.Debug then
        print(string.format('[LXR-Tarot] Framework initialized: %s', Framework.ActiveFramework))
    end
end

-- Initialize on resource start
CreateThread(function()
    InitializeFramework()
end)

-- ████████████████████████████████████████████████████████████████████████████████
-- ████████████████████████ UNIFIED CLIENT API ████████████████████████████████████
-- ████████████████████████████████████████████████████████████████████████████████

if IsDuplicityVersion() == 0 then -- Client side only
    
    -- ═══════════════════════════════════════════════════════════════════════════
    -- NOTIFICATION SYSTEM
    -- ═══════════════════════════════════════════════════════════════════════════
    
    function Framework.Notify(message, type, duration)
        type = type or 'info'
        duration = duration or 5000
        
        if Framework.ActiveFramework == 'lxr-core' or Framework.ActiveFramework == 'rsg-core' then
            if Framework.FrameworkObject and Framework.FrameworkObject.Functions then
                Framework.FrameworkObject.Functions.Notify(message, type, duration)
            end
        elseif Framework.ActiveFramework == 'vorp_core' then
            if Framework.FrameworkObject then
                Framework.FrameworkObject.NotifyTip(message, duration)
            end
        else
            print(string.format('[Notify] %s: %s', type, message))
        end
    end
    
    -- ═══════════════════════════════════════════════════════════════════════════
    -- PLAYER DATA ACCESS
    -- ═══════════════════════════════════════════════════════════════════════════
    
    function Framework.GetPlayerData()
        if Framework.ActiveFramework == 'lxr-core' or Framework.ActiveFramework == 'rsg-core' then
            if Framework.FrameworkObject and Framework.FrameworkObject.Functions then
                return Framework.FrameworkObject.Functions.GetPlayerData()
            end
        elseif Framework.ActiveFramework == 'vorp_core' then
            -- VORP uses different pattern - callback based
            return {} -- Placeholder
        end
        return {}
    end
    
    -- ═══════════════════════════════════════════════════════════════════════════
    -- PROGRESS BAR
    -- ═══════════════════════════════════════════════════════════════════════════
    
    function Framework.Progressbar(name, label, duration, useWhileDead, canCancel, disableControls, animation, prop, propTwo, onFinish, onCancel)
        if Framework.ActiveFramework == 'lxr-core' or Framework.ActiveFramework == 'rsg-core' then
            if Framework.FrameworkObject and Framework.FrameworkObject.Functions then
                Framework.FrameworkObject.Functions.Progressbar(name, label, duration, useWhileDead, canCancel, disableControls, animation, prop, propTwo, onFinish, onCancel)
            end
        elseif Framework.ActiveFramework == 'vorp_core' then
            -- VORP uses different progress system
            if onFinish then onFinish() end
        else
            Wait(duration)
            if onFinish then onFinish() end
        end
    end
    
    -- ═══════════════════════════════════════════════════════════════════════════
    -- KEYBINDS
    -- ═══════════════════════════════════════════════════════════════════════════
    
    function Framework.GetKeybind(key)
        if Framework.ActiveFramework == 'lxr-core' then
            if Framework.FrameworkObject and Framework.FrameworkObject.Shared and Framework.FrameworkObject.Shared.Keybinds then
                return Framework.FrameworkObject.Shared.Keybinds[key]
            end
        elseif Framework.ActiveFramework == 'rsg-core' then
            if Framework.FrameworkObject and Framework.FrameworkObject.Shared and Framework.FrameworkObject.Shared.Keybinds then
                return Framework.FrameworkObject.Shared.Keybinds[key]
            end
        end
        -- Fallback to config
        return Config.Keys[key]
    end
    
    -- ═══════════════════════════════════════════════════════════════════════════
    -- TRIGGER CALLBACK
    -- ═══════════════════════════════════════════════════════════════════════════
    
    function Framework.TriggerCallback(name, callback, ...)
        if Framework.ActiveFramework == 'lxr-core' or Framework.ActiveFramework == 'rsg-core' then
            if Framework.FrameworkObject and Framework.FrameworkObject.Functions then
                Framework.FrameworkObject.Functions.TriggerCallback(name, callback, ...)
            end
        elseif Framework.ActiveFramework == 'vorp_core' then
            -- VORP callback system
            TriggerServerEvent('vorp:TipRight', name)
        end
    end
    
end

-- ████████████████████████████████████████████████████████████████████████████████
-- ████████████████████████ UNIFIED SERVER API ████████████████████████████████████
-- ████████████████████████████████████████████████████████████████████████████████

if IsDuplicityVersion() == 1 then -- Server side only
    
    -- ═══════════════════════════════════════════════════════════════════════════
    -- GET PLAYER OBJECT
    -- ═══════════════════════════════════════════════════════════════════════════
    
    function Framework.GetPlayer(source)
        if Framework.ActiveFramework == 'lxr-core' or Framework.ActiveFramework == 'rsg-core' then
            if Framework.FrameworkObject and Framework.FrameworkObject.Functions then
                return Framework.FrameworkObject.Functions.GetPlayer(source)
            end
        elseif Framework.ActiveFramework == 'vorp_core' then
            if Framework.FrameworkObject then
                return Framework.FrameworkObject.getUser(source)
            end
        end
        return nil
    end
    
    -- ═══════════════════════════════════════════════════════════════════════════
    -- ADD ITEM
    -- ═══════════════════════════════════════════════════════════════════════════
    
    function Framework.AddItem(source, item, amount, slot, info)
        local Player = Framework.GetPlayer(source)
        if not Player then return false end
        
        if Framework.ActiveFramework == 'lxr-core' or Framework.ActiveFramework == 'rsg-core' then
            return Player.Functions.AddItem(item, amount, slot, info)
        elseif Framework.ActiveFramework == 'vorp_core' then
            if Player.addItem then
                Player.addItem(item, amount)
                return true
            end
        end
        return false
    end
    
    -- ═══════════════════════════════════════════════════════════════════════════
    -- REMOVE ITEM
    -- ═══════════════════════════════════════════════════════════════════════════
    
    function Framework.RemoveItem(source, item, amount, slot, info)
        local Player = Framework.GetPlayer(source)
        if not Player then return false end
        
        if Framework.ActiveFramework == 'lxr-core' or Framework.ActiveFramework == 'rsg-core' then
            return Player.Functions.RemoveItem(item, amount, slot, info)
        elseif Framework.ActiveFramework == 'vorp_core' then
            if Player.removeItem then
                Player.removeItem(item, amount)
                return true
            end
        end
        return false
    end
    
    -- ═══════════════════════════════════════════════════════════════════════════
    -- GET ITEM BY NAME
    -- ═══════════════════════════════════════════════════════════════════════════
    
    function Framework.GetItemByName(source, item)
        local Player = Framework.GetPlayer(source)
        if not Player then return nil end
        
        if Framework.ActiveFramework == 'lxr-core' or Framework.ActiveFramework == 'rsg-core' then
            return Player.Functions.GetItemByName(item)
        elseif Framework.ActiveFramework == 'vorp_core' then
            if Player.getItem then
                return Player.getItem(item)
            end
        end
        return nil
    end
    
    -- ═══════════════════════════════════════════════════════════════════════════
    -- ADD MONEY
    -- ═══════════════════════════════════════════════════════════════════════════
    
    function Framework.AddMoney(source, account, amount, reason)
        local Player = Framework.GetPlayer(source)
        if not Player then return false end
        
        if Framework.ActiveFramework == 'lxr-core' or Framework.ActiveFramework == 'rsg-core' then
            return Player.Functions.AddMoney(account, amount, reason)
        elseif Framework.ActiveFramework == 'vorp_core' then
            if Player.addCurrency then
                Player.addCurrency(0, amount) -- 0 = cash
                return true
            end
        end
        return false
    end
    
    -- ═══════════════════════════════════════════════════════════════════════════
    -- REMOVE MONEY
    -- ═══════════════════════════════════════════════════════════════════════════
    
    function Framework.RemoveMoney(source, account, amount, reason)
        local Player = Framework.GetPlayer(source)
        if not Player then return false end
        
        if Framework.ActiveFramework == 'lxr-core' or Framework.ActiveFramework == 'rsg-core' then
            return Player.Functions.RemoveMoney(account, amount, reason)
        elseif Framework.ActiveFramework == 'vorp_core' then
            if Player.removeCurrency then
                Player.removeCurrency(0, amount) -- 0 = cash
                return true
            end
        end
        return false
    end
    
    -- ═══════════════════════════════════════════════════════════════════════════
    -- CREATE USEABLE ITEM
    -- ═══════════════════════════════════════════════════════════════════════════
    
    function Framework.CreateUseableItem(item, callback)
        if Framework.ActiveFramework == 'lxr-core' or Framework.ActiveFramework == 'rsg-core' then
            if Framework.FrameworkObject and Framework.FrameworkObject.Functions then
                Framework.FrameworkObject.Functions.CreateUseableItem(item, callback)
            end
        elseif Framework.ActiveFramework == 'vorp_core' then
            if Framework.FrameworkObject and Framework.FrameworkObject.Callback then
                Framework.FrameworkObject.Callback.Register('vorp:use_' .. item, callback)
            end
        end
    end
    
    -- ═══════════════════════════════════════════════════════════════════════════
    -- CREATE CALLBACK
    -- ═══════════════════════════════════════════════════════════════════════════
    
    function Framework.CreateCallback(name, callback)
        if Framework.ActiveFramework == 'lxr-core' or Framework.ActiveFramework == 'rsg-core' then
            if Framework.FrameworkObject and Framework.FrameworkObject.Functions then
                Framework.FrameworkObject.Functions.CreateCallback(name, callback)
            end
        elseif Framework.ActiveFramework == 'vorp_core' then
            if Framework.FrameworkObject and Framework.FrameworkObject.Callback then
                Framework.FrameworkObject.Callback.Register(name, callback)
            end
        end
    end
    
    -- ═══════════════════════════════════════════════════════════════════════════
    -- GET SHARED ITEMS
    -- ═══════════════════════════════════════════════════════════════════════════
    
    function Framework.GetSharedItems()
        if Framework.ActiveFramework == 'lxr-core' or Framework.ActiveFramework == 'rsg-core' then
            if Framework.FrameworkObject and Framework.FrameworkObject.Shared then
                return Framework.FrameworkObject.Shared.Items
            end
        elseif Framework.ActiveFramework == 'vorp_core' then
            -- VORP items handled differently
            return {}
        end
        return {}
    end
    
end

-- ████████████████████████████████████████████████████████████████████████████████
-- ████████████████████████ END OF FRAMEWORK BRIDGE ███████████████████████████████
-- ████████████████████████████████████████████████████████████████████████████████
