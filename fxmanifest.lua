--[[
    ██╗     ██╗  ██╗██████╗       ████████╗ █████╗ ██████╗  ██████╗ ████████╗
    ██║     ╚██╗██╔╝██╔══██╗      ╚══██╔══╝██╔══██╗██╔══██╗██╔═══██╗╚══██╔══╝
    ██║      ╚███╔╝ ██████╔╝█████╗   ██║   ███████║██████╔╝██║   ██║   ██║   
    ██║      ██╔██╗ ██╔══██╗╚════╝   ██║   ██╔══██║██╔══██╗██║   ██║   ██║   
    ███████╗██╔╝ ██╗██║  ██║         ██║   ██║  ██║██║  ██║╚██████╔╝   ██║   
    ╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝         ╚═╝   ╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝    ╚═╝   
                                                                               
    🐺 LXR Tarot - FXManifest
    
    Tarot Card Collection System for RedM featuring Pokemon-themed collectible cards,
    badge quests, NPC vendors, and rarity-based loot system.
    
    ═══════════════════════════════════════════════════════════════════════════════
    
    Server:      The Land of Wolves ��
    Developer:   iBoss21 / The Lux Empire
    Website:     https://www.wolves.land
    Discord:     https://discord.gg/CrKcWdfd3A
    
    Version: 1.0.0
    
    © 2026 iBoss21 / The Lux Empire | wolves.land | All Rights Reserved
]]

-- ═══════════════════════════════════════════════════════════════════════════════
-- 🐺 RESOURCE METADATA
-- ═══════════════════════════════════════════════════════════════════════════════

fx_version 'cerulean'
game 'rdr3'
lua54 'yes'

rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources WILL become incompatible once RedM ships.'

-- ═══════════════════════════════════════════════════════════════════════════════
-- 🐺 RESOURCE INFORMATION
-- ═══════════════════════════════════════════════════════════════════════════════

name 'lxr-tarot'
author 'iBoss21 / The Lux Empire'
description 'LXR Tarot Card Collection System - Pokemon-themed collectible cards with badge quests and NPC vendors for wolves.land'
version '1.0.0'

-- ═══════════════════════════════════════════════════════════════════════════════
-- 🐺 RESOURCE SCOPE
-- ═══════════════════════════════════════════════════════════════════════════════

--[[
    This resource provides:
    - Multi-framework support (LXR-Core, RSG-Core, VORP Core)
    - Card collection and trading system
    - 175+ unique Pokemon-themed tarot cards
    - 5 rarity tiers (Basic, Rare, Ultra, V, VMAX, Rainbow)
    - 8 badge quest chains
    - Multiple NPC vendor locations
    - Card storage system
    - Card selling mechanics
    - Animated card opening UI
]]

-- ═══════════════════════════════════════════════════════════════════════════════
-- 🐺 SHARED SCRIPTS (Config & Framework Bridge)
-- ═══════════════════════════════════════════════════════════════════════════════

shared_scripts {
    'config.lua',
    'shared/framework.lua'
}

-- ═══════════════════════════════════════════════════════════════════════════════
-- 🐺 CLIENT SCRIPTS
-- ═══════════════════════════════════════════════════════════════════════════════

client_scripts {
    '@menuv/menuv.lua',
    'client.lua'
}

-- ═══════════════════════════════════════════════════════════════════════════════
-- 🐺 SERVER SCRIPTS
-- ═══════════════════════════════════════════════════════════════════════════════

server_scripts {
    'server.lua'
}

-- ═══════════════════════════════════════════════════════════════════════════════
-- 🐺 UI FILES
-- ═══════════════════════════════════════════════════════════════════════════════

ui_page 'html/index.html'

files {
    'html/index.html',
    'html/img/*',
    'html/script.js',
    'html/style.css'
}

-- ═══════════════════════════════════════════════════════════════════════════════
-- 🐺 DEPENDENCIES
-- ═══════════════════════════════════════════════════════════════════════════════

--[[
    Required Dependencies:
    - menuv: Menu system for card shop interface
    - interact-sound: Sound effects for card opening and interactions
    
    Framework Dependencies (ONE of the following):
    - lxr-core (Primary)
    - rsg-core (Primary)
    - vorp_core (Supported)
    
    Note: Framework is auto-detected. You don't need to have all frameworks installed.
]]

dependencies {
    'menuv'
}

-- ████████████████████████████████████████████████████████████████████████████████
-- ████████████████████████ END OF MANIFEST ███████████████████████████████████████
-- ████████████████████████████████████████████████████████████████████████████████
