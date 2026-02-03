--[[
    ██╗     ██╗  ██╗██████╗       ████████╗ █████╗ ██████╗  ██████╗ ████████╗
    ██║     ╚██╗██╔╝██╔══██╗      ╚══██╔══╝██╔══██╗██╔══██╗██╔═══██╗╚══██╔══╝
    ██║      ╚███╔╝ ██████╔╝█████╗   ██║   ███████║██████╔╝██║   ██║   ██║   
    ██║      ██╔██╗ ██╔══██╗╚════╝   ██║   ██╔══██║██╔══██╗██║   ██║   ██║   
    ███████╗██╔╝ ██╗██║  ██║         ██║   ██║  ██║██║  ██║╚██████╔╝   ██║   
    ╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝         ╚═╝   ╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝    ╚═╝   
                                                                               
    🐺 LXR Tarot - Card Collection System Configuration
    
    This configuration file controls the LXR Tarot card collection and trading system.
    Players can collect rare Pokemon-themed tarot cards, trade them with NPCs, and
    earn special badges by completing card sets. Features include booster packs,
    card rarity tiers, NPC vendors, and a card storage system.
    
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
    Performance Target: Optimized for minimal NUI overhead and efficient ped spawning
    
    Tags: RedM, Georgian, SeriousRP, Whitelist, Tarot, Cards, Collection, Trading
    
    Framework Support:
    - LXR Core (Primary)
    - RSG Core (Primary)
    - VORP Core (Supported)
    
    ═══════════════════════════════════════════════════════════════════════════════
    CREDITS
    ═══════════════════════════════════════════════════════════════════════════════
    
    Script Author: iBoss21 / The Lux Empire for The Land of Wolves
    Original Script: Sadicius (rsg-tarot)
    Original Concept: DafkeDD (jim-pokemon for FiveM)
    Dependencies: MenuV, interact-sound
    
    © 2026 iBoss21 / The Lux Empire | wolves.land | All Rights Reserved
]]

-- ═══════════════════════════════════════════════════════════════════════════════
-- 🐺 RESOURCE NAME PROTECTION - RUNTIME CHECK
-- ═══════════════════════════════════════════════════════════════════════════════

local REQUIRED_RESOURCE_NAME = "lxr-tarot"
local currentResourceName = GetCurrentResourceName()

if currentResourceName ~= REQUIRED_RESOURCE_NAME then
    error(string.format([[
        
        ═══════════════════════════════════════════════════════════════════════════════
        ❌ CRITICAL ERROR: RESOURCE NAME MISMATCH ❌
        ═══════════════════════════════════════════════════════════════════════════════
        
        Expected: %s
        Got: %s
        
        This resource is branded and must maintain the correct name.
        Rename the folder to "%s" to continue.
        
        🐺 wolves.land - The Land of Wolves
        
        ═══════════════════════════════════════════════════════════════════════════════
        
    ]], REQUIRED_RESOURCE_NAME, currentResourceName, REQUIRED_RESOURCE_NAME))
end

Config = {}

-- ████████████████████████████████████████████████████████████████████████████████
-- ████████████████████████ SERVER BRANDING & INFO ████████████████████████████████
-- ████████████████████████████████████████████████████████████████████████████████

Config.ServerInfo = {
    name = 'The Land of Wolves 🐺',
    tagline = 'Georgian RP 🇬🇪 | მგლების მიწა - რჩეულთა ადგილი!',
    description = 'ისტორია ცოცხლდება აქ!', -- History Lives Here!
    type = 'Serious Hardcore Roleplay',
    access = 'Discord & Whitelisted',
    
    -- Contact & Links
    website = 'https://www.wolves.land',
    discord = 'https://discord.gg/CrKcWdfd3A',
    github = 'https://github.com/iBoss21',
    store = 'https://theluxempire.tebex.io',
    serverListing = 'https://servers.redm.net/servers/detail/8gj7eb',
    
    -- Developer Info
    developer = 'iBoss21 / The Lux Empire',
    
    -- Tags
    tags = {'RedM', 'Georgian', 'SeriousRP', 'Whitelist', 'Tarot', 'Cards', 'Collection', 'Economy'}
}

-- ████████████████████████████████████████████████████████████████████████████████
-- ████████████████████████ FRAMEWORK CONFIGURATION ███████████████████████████████
-- ████████████████████████████████████████████████████████████████████████████████

--[[
    Framework Priority (in order):
    1. LXR-Core (Primary)
    2. RSG-Core (Primary)
    3. VORP Core (Supported)
    
    Optional frameworks:
    - RedEM:RP, QBR, QR, Standalone (Only if explicitly requested)
]]

Config.Framework = 'auto' -- 'auto' or manual: 'lxr-core', 'rsg-core', 'vorp_core', 'standalone'

-- Framework-specific settings
Config.FrameworkSettings = {
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
    },
    ['rsg-core'] = {
        resource = 'rsg-core',
        notifications = 'ox_lib',
        inventory = 'rsg-inventory',
        target = 'ox_target',
        events = {
            server = 'RSGCore:Server:%s',
            client = 'RSGCore:Client:%s',
            callback = 'RSGCore:Callback:%s'
        }
    },
    ['vorp_core'] = {
        resource = 'vorp_core',
        notifications = 'vorp',
        inventory = 'vorp_inventory',
        target = 'vorp_core',
        events = {
            server = 'vorp:server:%s',
            client = 'vorp:client:%s'
        }
    },
    ['standalone'] = {
        notifications = 'print',
        inventory = 'none',
        target = 'none'
    }
}

-- ████████████████████████████████████████████████████████████████████████████████
-- ████████████████████████ LANGUAGE CONFIGURATION ████████████████████████████████
-- ████████████████████████████████████████████████████████████████████████████████

Config.Lang = 'en' -- Language for notifications (en, ge, etc.)

Config.Locale = {
    en = {
        opening_box = 'Opening box...',
        opening_pack = 'Opening pack...',
        box_opened = 'Box has been opened successfully',
        got_cards = 'You got 4 cards!',
        got_packs = 'You got 4 booster packs!',
        got_card = 'You got %s',
        card_buyer = 'Card Buyer [J]',
        exchange_for = 'Exchange for %s [E]',
        come_back = 'Come back when you have all the items for the %s',
        got_badge = 'You got a %s!',
        sold_cards = 'You sold %s %s for $%s',
        no_pack = 'You dont have a boosterpack!',
        card_problem = 'There is a problem in cards!'
    },
    ge = {
        opening_box = 'ყუთის გახსნა...',
        opening_pack = 'პაკეტის გახსნა...',
        box_opened = 'ყუთი წარმატებით გაიხსნა',
        got_cards = 'მიიღე 4 ბარათი!',
        got_packs = 'მიიღე 4 ბუსტერ პაკეტი!',
        got_card = 'მიიღე %s',
        card_buyer = 'ბარათების მყიდველი [J]',
        exchange_for = 'გაცვლა %s-ზე [E]',
        come_back = 'დაბრუნდი როცა ყველა ნივთი გექნება %s-სთვის',
        got_badge = 'მიიღე %s!',
        sold_cards = 'გაყიდე %s %s $%s-ად',
        no_pack = 'არ გაქვს ბუსტერ პაკეტი!',
        card_problem = 'პრობლემა ბარათებთან!'
    }
}

-- ████████████████████████████████████████████████████████████████████████████████
-- ████████████████████████ GENERAL SETTINGS ██████████████████████████████████████
-- ████████████████████████████████████████████████████████████████████████████████

Config.General = {
    enableSkillXP = true,           -- Enable skill XP rewards (requires possible-skills)
    enableSounds = true,            -- Enable interact-sound effects
    enableLogs = true,              -- Enable logging system
    enableInventoryStash = true,    -- Enable card storage box inventory stash
    stashMaxWeight = 0.1,           -- Max weight for card storage (kg)
    stashMaxSlots = 160             -- Max slots for card storage
}

-- ████████████████████████████████████████████████████████████████████████████████
-- ████████████████████████ KEYS CONFIGURATION ████████████████████████████████████
-- ████████████████████████████████████████████████████████████████████████████████

Config.Keys = {
    J = 0x9DB8A0BA,  -- J key - Buy/Sell cards
    E = 0xDFF812F9   -- E key - Exchange cards for badges
}

-- ████████████████████████████████████████████████████████████████████████████████
-- ████████████████████████ TIMING & COOLDOWNS ████████████████████████████████████
-- ████████████████████████████████████████████████████████████████████████████████

Config.Cooldowns = {
    openBoxTime = 5000,         -- Time to open booster box (ms)
    openPackTime = 3000,        -- Time to open booster pack (ms)
    interactionDelay = 1000,    -- Delay between badge exchanges (ms)
    menuCooldown = 2500         -- Menu check interval (ms)
}

-- ████████████████████████████████████████████████████████████████████████████████
-- ████████████████████████ PED & NPC CONFIGURATION ███████████████████████████████
-- ████████████████████████████████████████████████████████████████████████████████

Config.DistanceSpawn = 20.0 -- Distance before spawning/despawning the ped (GTA Units)
Config.FadeIn = true         -- Enable fade in/out effect for peds

Config.PedList = {
    -- TAROT CARD VENDOR NPCS (Fire Breather Model)
    { model = `CS_Fire_Breather`, coords2 = vector4(-3484.76, -3467.02, 0.12, 141.4) },    -- Guarma
    { model = `CS_Fire_Breather`, coords2 = vector4(2340.23, 995.64, 74.13, 293.07) },      -- Annesburg
    { model = `CS_Fire_Breather`, coords2 = vector4(1182.39, 2035.27, 323.91, 141.4) },     -- Strawberry
    { model = `CS_Fire_Breather`, coords2 = vector4(631.92, -1251.45, 41.55, 293.07) },     -- Emerald Ranch
    { model = `CS_Fire_Breather`, coords2 = vector4(-156.34, 1488.86, 116.11, 141.4) },     -- Valentine
    { model = `CS_Fire_Breather`, coords2 = vector4(-1403.78, -2330.28, 43.04, 293.07) },   -- Rhodes
    { model = `CS_Fire_Breather`, coords2 = vector4(-2812.96, -4395.96, -17.18, 141.4) },   -- Blackwater
    { model = `CS_Fire_Breather`, coords2 = vector4(353.83, -17.12, 107.1, 293.07) },       -- Saint Denis
    { model = `CS_Fire_Breather`, coords2 = vector4(1203.24, -7108.66, 43.58, 293.07) },    -- Tumbleweed
    { model = `CS_Fire_Breather`, coords2 = vector4(-1845.48, -1731.2, 85.57, 101.57) }     -- Armadillo
}

-- ████████████████████████████████████████████████████████████████████████████████
-- ████████████████████████ CARD SHOP LOCATIONS ███████████████████████████████████
-- ████████████████████████████████████████████████████████████████████████████████

Config.CardshopLocation = {
    ['Cardshop'] = {
        location = vector3(-1845.4, -1731.23, 85.57),
        label = 'Sell Cards Tarot'
    },
    ['Cardshop2'] = {
        location = vector3(749.48, 1822.52, 239.18),
        label = 'Sell Cards Tarot'
    },
    ['Cardshop3'] = {
        location = vector3(2402.27, -1358.3, 45.59),
        label = 'Sell Cards Tarot'
    },
    ['Cardshop4'] = {
        location = vector3(1309.64, -6858.61, 45.1),
        label = 'Sell Cards Tarot'
    }
}

-- ████████████████████████████████████████████████████████████████████████████████
-- ████████████████████████ BLIP CONFIGURATION ████████████████████████████████████
-- ████████████████████████████████████████████████████████████████████████████████

Config.Blip = {
    blipName = 'Tarot',
    blipSprite = 'blip_mission_area_rc',
    blipScale = 0.2
}

Config.CardshopBlipText = "CardsTarot"
Config.CardshopBlipColor = 5
Config.CardshopBlipSprite = 272

-- ████████████████████████████████████████████████████████████████████████████████
-- ████████████████████████ BADGE EXCHANGE SYSTEM █████████████████████████████████
-- ████████████████████████████████████████████████████████████████████████████████

--[[
    Badge System:
    Players can collect specific cards and exchange them with NPCs for special badges.
    Each badge requires a complete set of themed cards.
]]

Config.Badge = {
    ["card_boulderbadge"] = {
        Amount = 1,
        label = "Boulder Badge",
        reward = "card_boulderbadge",
        location = vector3(-3484.76, -3467.02, 0.12),
        cards = {
            ["card_graveler"] = 1,
            ["card_rhyhorn"] = 1,
            ["card_omastar"] = 1,
            ["card_kabutops"] = 1,
            ["card_onix"] = 1,
            ["card_geodude"] = 1
        }
    },
    ["card_cascadebadge"] = {
        Amount = 1,
        label = "Cascade Badge",
        reward = "card_cascadebadge",
        location = vector3(2340.23, 995.64, 74.13),
        cards = {
            ["card_blastoise"] = 1,
            ["card_lapras"] = 1,
            ["card_starmie"] = 1,
            ["card_psyduck"] = 1,
            ["card_togepi"] = 1
        }
    },
    ["card_thunderbadge"] = {
        Amount = 1,
        label = "Thunder Badge",
        reward = "card_thunderbadge",
        location = vector3(1182.39, 2035.27, 323.91),
        cards = {
            ["card_zapdos"] = 1,
            ["card_pikachu"] = 1,
            ["card_jolteon"] = 1,
            ["card_electabuzz"] = 1,
            ["card_electrode"] = 1,
            ["card_magneton"] = 1
        }
    },
    ["card_rainbowbadge"] = {
        Amount = 1,
        label = "Rainbow Badge",
        reward = "card_rainbowbadge",
        location = vector3(631.92, -1251.45, 41.55),
        cards = {
            ["card_victreebel"] = 1,
            ["card_tangela"] = 1,
            ["card_vileplume"] = 1,
            ["card_scyther"] = 1,
            ["card_bellsprout"] = 1,
            ["card_venusaur"] = 1
        }
    },
    ["card_soulbadge"] = {
        Amount = 1,
        label = "Soul Badge",
        reward = "card_soulbadge",
        location = vector3(-156.34, 1488.86, 116.11),
        cards = {
            ["card_koffing"] = 1,
            ["card_weezing"] = 1,
            ["card_snorlax"] = 1,
            ["card_venonat"] = 1,
            ["card_venomoth"] = 1,
            ["card_golbat"] = 1
        }
    },
    ["card_marshbadge"] = {
        Amount = 1,
        label = "Marsh Badge",
        reward = "card_marshbadge",
        location = vector3(-1403.78, -2330.28, 43.04),
        cards = {
            ["card_alakazam"] = 1,
            ["card_mr_mime"] = 1,
            ["card_abra"] = 1,
            ["card_kadabra"] = 1,
            ["card_hypno"] = 1,
            ["card_jynx"] = 1
        }
    },
    ["card_volcanobadge"] = {
        Amount = 1,
        label = "Volcano Badge",
        reward = "card_volcanobadge",
        location = vector3(-2812.96, -4395.96, -17.18),
        cards = {
            ["card_arcanine"] = 1,
            ["card_rapidash"] = 1,
            ["card_ninetails"] = 1,
            ["card_magmar"] = 1,
            ["card_charizard"] = 1,
            ["card_moltres"] = 1
        }
    },
    ["card_earthbadge"] = {
        Amount = 1,
        label = "Earth Badge",
        reward = "card_earthbadge",
        location = vector3(353.83, -17.12, 107.1),
        cards = {
            ["card_rhydon"] = 1,
            ["card_nidoking"] = 1,
            ["card_nidoqueen"] = 1,
            ["card_mewtwo"] = 1,
            ["card_dugtrio"] = 1,
            ["card_persian"] = 1
        }
    },
    ["card_trophybadge"] = {
        Amount = 1,
        label = "League Trophy",
        reward = "trophybadge",
        location = vector3(1203.24, -7108.66, 43.58),
        cards = {
            ["card_boulderbadge"] = 1,
            ["card_cascadebadge"] = 1,
            ["card_thunderbadge"] = 1,
            ["card_rainbowbadge"] = 1,
            ["card_soulbadge"] = 1,
            ["card_marshbadge"] = 1,
            ["card_volcanohbadge"] = 1,
            ["card_earthbadge"] = 1
        }
    }
}

-- ████████████████████████████████████████████████████████████████████████████████
-- ████████████████████████ CARD SHOP PRICING █████████████████████████████████████
-- ████████████████████████████████████████████████████████████████████████████████

--[[
    Card Pricing System:
    Prices are in dollars. Players can sell their cards to NPCs for these values.
    
    Card Rarity Tiers:
    - Basic Cards: $50 (Common drops)
    - Rare Cards: $50-100 (Uncommon drops)
    - Ultra Cards: $250 (Rare drops)
    - V Cards: $400-600 (Very Rare)
    - VMAX Cards: $900-1500 (Extremely Rare)
    - Rainbow Cards: $2000-2700 (Legendary)
    - Badges: $1000-15000 (Achievement rewards)
]]

Config.CardshopItems = {
    -- BADGES
    ['card_boulderbadge'] = 1000,
    ['card_cascadebadge'] = 1000,
    ['card_thunderbadge'] = 1000,
    ['card_rainbowbadge'] = 1000,
    ['card_soulbadge'] = 1000,
    ['card_marshbadge'] = 1000,
    ['card_volcanobadge'] = 1000,
    ['card_earthbadge'] = 1000,
    ['card_trophybadge'] = 15000,
    
    -- BASIC CARDS (Common)
    ['card_abra'] = 50,
    ['card_arbok'] = 50,
    ['card_arcanine'] = 50,
    ['card_beedrill'] = 50,
    ['card_bellsprout'] = 50,
    ['card_bulbasaur'] = 50,
    ['card_butterfree'] = 50,
    ['card_caterpie'] = 50,
    ['card_chansey'] = 50,
    ['card_charmander'] = 50,
    ['card_charmeleon'] = 50,
    ['card_clefable'] = 50,
    ['card_clefairy'] = 50,
    ['card_cloyster'] = 50,
    ['card_cubone'] = 50,
    ['card_dewgong'] = 50,
    ['card_diglett'] = 50,
    ['card_doduo'] = 50,
    ['card_drowzee'] = 50,
    ['card_dugtrio'] = 50,
    ['card_eevee'] = 50,
    ['card_ekans'] = 50,
    ['card_electabuzz'] = 50,
    ['card_electrode'] = 50,
    ['card_exeggcute'] = 50,
    ['card_exeggutor'] = 50,
    ['card_farfetchd'] = 50,
    ['card_fearow'] = 50,
    ['card_flareon'] = 50,
    ['card_gastly'] = 50,
    ['card_gengar'] = 50,
    ['card_geodude'] = 50,
    ['card_gloom'] = 50,
    ['card_golbat'] = 50,
    ['card_goldeen'] = 50,
    ['card_golduck'] = 50,
    ['card_golem'] = 50,
    ['card_graveler'] = 50,
    ['card_grimer'] = 50,
    ['card_growlithe'] = 50,
    ['card_haunter'] = 50,
    ['card_horsea'] = 50,
    ['card_hypno'] = 50,
    ['card_ivysaur'] = 50,
    ['card_jigglypuff'] = 50,
    ['card_jolteon'] = 50,
    ['card_kadabra'] = 50,
    ['card_kakuna'] = 50,
    ['card_kangaskhan'] = 50,
    ['card_kingler'] = 50,
    ['card_koffing'] = 50,
    ['card_krabby'] = 50,
    ['card_lapras'] = 50,
    ['card_lickitung'] = 50,
    ['card_machoke'] = 50,
    ['card_machop'] = 50,
    ['card_magikarp'] = 50,
    ['card_magmar'] = 50,
    ['card_magnemite'] = 50,
    ['card_magneton'] = 50,
    ['card_mankey'] = 50,
    ['card_marowak'] = 50,
    ['card_meowth'] = 50,
    ['card_metapod'] = 50,
    ['card_mr_mime'] = 50,
    ['card_muk'] = 50,
    ['card_nidoran'] = 50,
    ['card_nidorina'] = 50,
    ['card_nidorino'] = 50,
    ['card_ninetails'] = 50,
    ['card_oddish'] = 50,
    ['card_paras'] = 50,
    ['card_parasect'] = 50,
    ['card_persian'] = 50,
    ['card_pidgeotto'] = 50,
    ['card_pidgey'] = 50,
    ['card_pikachu'] = 50,
    ['card_pinsir'] = 50,
    ['card_poliwag'] = 50,
    ['card_poliwhirl'] = 50,
    ['card_poliwrath'] = 50,
    ['card_ponyta'] = 50,
    ['card_primeape'] = 50,
    ['card_psyduck'] = 50,
    ['card_rapidash'] = 50,
    ['card_raticate'] = 50,
    ['card_rattata'] = 50,
    ['card_rhydon'] = 50,
    ['card_rhyhorn'] = 50,
    ['card_sandshrew'] = 50,
    ['card_sandslash'] = 50,
    ['card_seadra'] = 50,
    ['card_seaking'] = 50,
    ['card_seel'] = 50,
    ['card_shellder'] = 50,
    ['card_slowbro'] = 50,
    ['card_slowpoke'] = 50,
    ['card_spearow'] = 50,
    ['card_squirtle'] = 50,
    ['card_staryu'] = 50,
    ['card_tangela'] = 50,
    ['card_tauros'] = 50,
    ['card_tentacool'] = 50,
    ['card_tentacruel'] = 50,
    ['card_togepi'] = 50,
    ['card_vaporeon'] = 50,
    ['card_venomoth'] = 50,
    ['card_venonat'] = 50,
    ['card_victreebel'] = 50,
    ['card_vileplume'] = 50,
    ['card_voltorb'] = 50,
    ['card_vulpix'] = 50,
    ['card_wartortle'] = 50,
    ['card_weedle'] = 50,
    ['card_weepinbell'] = 50,
    ['card_weezing'] = 50,
    ['card_wigglytuff'] = 50,
    ['card_zapdos'] = 50,
    ['card_zubat'] = 50,
    
    -- EVOLVED / RARE CARDS
    ['card_aerodactyl'] = 250,
    ['card_alakazam'] = 250,
    ['card_articuno'] = 250,
    ['card_blastoise'] = 100,
    ['card_charizard'] = 100,
    ['card_ditto'] = 100,
    ['card_dragonair'] = 250,
    ['card_dragonite'] = 250,
    ['card_dratini'] = 250,
    ['card_gyrarados'] = 100,
    ['card_hitmonchan'] = 100,
    ['card_hitmonlee'] = 100,
    ['card_jynx'] = 100,
    ['card_kabuto'] = 250,
    ['card_kabutops'] = 250,
    ['card_machamp'] = 100,
    ['card_mew'] = 250,
    ['card_mewtwo'] = 250,
    ['card_moltres'] = 250,
    ['card_nidoking'] = 100,
    ['card_nidoqueen'] = 100,
    ['card_omanyte'] = 250,
    ['card_omastar'] = 250,
    ['card_onix'] = 100,
    ['card_porygon'] = 250,
    ['card_raichu'] = 100,
    ['card_scyther'] = 100,
    ['card_snorlax'] = 250,
    ['card_starmie'] = 100,
    ['card_venusaur'] = 100,
    
    -- V CARDS (Very Rare)
    ['card_blastoisev'] = 500,
    ['card_charizardv'] = 700,
    ['card_mewv'] = 600,
    ['card_pikachuv'] = 400,
    ['card_snorlaxv'] = 500,
    ['card_venusaurv'] = 500,
    
    -- VMAX CARDS (Extremely Rare)
    ['card_blastoisevmax'] = 1200,
    ['card_mewtwogx'] = 1500,
    ['card_snorlaxvmax'] = 1000,
    ['card_venusaurvmax'] = 1200,
    ['card_vmaxcharizard'] = 1300,
    ['card_vmaxpikachu'] = 900,
    
    -- RAINBOW CARDS (Legendary)
    ['card_rainbowmewtwogx'] = 2400,
    ['card_rainbowvmaxcharizard'] = 2700,
    ['card_rainbowvmaxpikachu'] = 2000,
    ['card_snorlaxvmaxrainbow'] = 2000
}

-- ████████████████████████████████████████████████████████████████████████████████
-- ████████████████████████ SECURITY & ANTI-ABUSE █████████████████████████████████
-- ████████████████████████████████████████████████████████████████████████████████

Config.Security = {
    enabled = true,                      -- Enable security checks
    validateDistance = true,             -- Validate player distance from NPC/location
    maxInteractionDistance = 5.0,        -- Max distance to interact (meters)
    requireAllCards = true,              -- Require all cards for badge exchange
    logBadgeExchanges = true,            -- Log badge exchanges
    logBoxOpening = true,                -- Log box opening events
    preventDuplication = true,           -- Prevent item duplication exploits
    cooldownBypass = false               -- Allow cooldown bypass (admin only)
}

-- ████████████████████████████████████████████████████████████████████████████████
-- ████████████████████████ PERFORMANCE OPTIMIZATION ██████████████████████████████
-- ████████████████████████████████████████████████████████████████████████████████

Config.Performance = {
    pedSpawnDistance = 20.0,             -- Distance to spawn/despawn peds
    pedUpdateInterval = 500,             -- Ped update check interval (ms)
    locationCheckInterval = 1,           -- Location proximity check (ms when near)
    locationCheckFallback = 1000,        -- Location check when far (ms)
    enablePedFade = true,                -- Enable ped fade in/out effect
    cachePlayerData = true,              -- Cache player data for performance
    maxCachedPlayers = 50                -- Max cached player entries
}

-- ████████████████████████████████████████████████████████████████████████████████
-- ████████████████████████ DEBUG SETTINGS ████████████████████████████████████████
-- ████████████████████████████████████████████████████████████████████████████████

Config.Debug = false -- Enable debug prints and extra logging

-- ████████████████████████████████████████████████████████████████████████████████
-- ████████████████████████ END OF CONFIGURATION ██████████████████████████████████
-- ████████████████████████████████████████████████████████████████████████████████

-- Startup banner
CreateThread(function()
    Wait(1000)
    
    -- Count cards and badges
    local totalCards = 0
    local totalBadges = 0
    for k, v in pairs(Config.CardshopItems) do
        if string.find(k, "badge") then
            totalBadges = totalBadges + 1
        else
            totalCards = totalCards + 1
        end
    end
    
    local badgeCount = 0
    for k, v in pairs(Config.Badge) do
        badgeCount = badgeCount + 1
    end
    
    print([[
        
        ═══════════════════════════════════════════════════════════════════════════════
        
            ██╗     ██╗  ██╗██████╗       ████████╗ █████╗ ██████╗  ██████╗ ████████╗
            ██║     ╚██╗██╔╝██╔══██╗      ╚══██╔══╝██╔══██╗██╔══██╗██╔═══██╗╚══██╔══╝
            ██║      ╚███╔╝ ██████╔╝█████╗   ██║   ███████║██████╔╝██║   ██║   ██║   
            ██║      ██╔██╗ ██╔══██╗╚════╝   ██║   ██╔══██║██╔══██╗██║   ██║   ██║   
            ███████╗██╔╝ ██╗██║  ██║         ██║   ██║  ██║██║  ██║╚██████╔╝   ██║   
            ╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝         ╚═╝   ╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝    ╚═╝   
        
        ═══════════════════════════════════════════════════════════════════════════════
        🐺 TAROT CARD COLLECTION SYSTEM - SUCCESSFULLY LOADED
        ═══════════════════════════════════════════════════════════════════════════════
        
        Version:        1.0.0
        Server:         ]] .. Config.ServerInfo.name .. [[
        
        Framework:      Auto-detect (]] .. (Config.Framework == 'auto' and 'Enabled' or Config.Framework) .. [[)
        Language:       ]] .. Config.Lang:upper() .. [[
        
        Cards:          ]] .. totalCards .. [[ total cards available
        Badges:         ]] .. badgeCount .. [[ badge exchange quests
        Card Shops:     ]] .. #Config.CardshopLocation .. [[ vendor locations
        NPCs:           ]] .. #Config.PedList .. [[ spawned vendor NPCs
        
        Security:       ]] .. (Config.Security.enabled and 'ENABLED ✓' or 'DISABLED ✗') .. [[
        Debug:          ]] .. (Config.Debug and 'ENABLED' or 'DISABLED') .. [[
        
        ═══════════════════════════════════════════════════════════════════════════════
        
        Developer:      iBoss21 / The Lux Empire
        Website:        https://www.wolves.land
        Discord:        https://discord.gg/CrKcWdfd3A
        
        ═══════════════════════════════════════════════════════════════════════════════
        
    ]])
end)
