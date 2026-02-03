--[[
    ██╗     ██╗  ██╗██████╗       ████████╗ █████╗ ██████╗  ██████╗ ████████╗
    ██║     ╚██╗██╔╝██╔══██╗      ╚══██╔══╝██╔══██╗██╔══██╗██╔═══██╗╚══██╔══╝
    ██║      ╚███╔╝ ██████╔╝█████╗   ██║   ███████║██████╔╝██║   ██║   ██║   
    ██║      ██╔██╗ ██╔══██╗╚════╝   ██║   ██╔══██║██╔══██╗██║   ██║   ██║   
    ███████╗██╔╝ ██╗██║  ██║         ██║   ██║  ██║██║  ██║╚██████╔╝   ██║   
    ╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝         ╚═╝   ╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝    ╚═╝   
                                                                               
    🐺 LXR Tarot - Server Script
    
    This server script handles all server-side logic for the tarot card collection
    system including card rarity calculations, item distribution, badge exchanges,
    and card selling transactions. Implements server-side security and validation.
    
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
    Performance Target: Optimized server-side validation and transaction processing
    
    Tags: RedM, Georgian, SeriousRP, Whitelist, Tarot, Cards, Server
    
    © 2026 iBoss21 / The Lux Empire | wolves.land | All Rights Reserved
]]

-- ═══════════════════════════════════════════════════════════════════════════════
-- 🐺 INITIALIZATION & FRAMEWORK BRIDGE
-- ═══════════════════════════════════════════════════════════════════════════════

-- Wait for framework to be ready
while not Framework or not Framework.IsReady do
    Wait(100)
end

-- ████████████████████████████████████████████████████████████████████████████████
-- ████████████████████████ CARD RARITY TIERS █████████████████████████████████████
-- ████████████████████████████████████████████████████████████████████████████████

--[[
    Card Rarity System:
    - Basic Cards: 60.1% drop chance (601-1000 roll)
    - Rare Cards: 29.9% drop chance (101-399 roll)
    - Ultra Cards: 5% drop chance (51-100 roll)
    - V Cards: 3% drop chance (20-50 roll)
    - VMAX Cards: 1.4% drop chance (6-19 roll)
    - Rainbow Cards: 0.5% drop chance (1-5 roll)
]]

local basicCards = {
    "card_bulbasaur", "card_ivysaur", "card_charmander", "card_charmeleon", "card_squirtle", 
    "card_wartortle", "card_caterpie", "card_metapod", "card_butterfree", "card_weedle",
    "card_kakuna", "card_eedrill", "card_pidgey","card_pidgeotto", "card_pidgeot", 
    "card_rattata", "card_raticate", "card_spearow", "card_fearow", "card_ekans", 
    "card_arbok", "card_pikachu", "card_sandshrew", "card_sandslash", "card_nidoran", 
    "card_nidorina", "card_nidoqueen", "card_nidorino", "card_clefairy","card_clefable", 
    "card_vulpix",  "card_ninetails", "card_zubat", "card_golbat", "card_oddish", 
    "card_gloom", "card_vileplume", "card_paras", "card_parasect",  "card_venonat", 
    "card_venomoth", "card_diglett", "card_dugtrio", "card_meowth", "card_persian", 
    "card_psyduck","card_golduck",  "card_mankey", "card_primeape", "card_growlithe", 
    "card_arcanine", "card_poliwag", "card_poliwhirl", "card_poliwrath",   "card_abra",
    "card_machop", "card_machoke", "card_bellsprout", "card_weepinbell", "card_victreebel", 
    "card_tentacool",  "card_tentacruel", "card_geodude", "card_graveler", "card_golem", 
    "card_ponyta", "card_rapidash", "card_slowpoke",   "card_slowbro", "card_magnemite",
    "card_magneton", "card_farfetchd", "card_doduo", "card_dodrio", "card_seel",
    "card_dewgong", "card_grimer", "card_muk", "card_shellder", "card_cloyster",
    "card_gastly", "card_haunter", "card_gengar",    "card_drowzee", "card_hypno", 
    "card_krabby", "card_kingler", "card_voltorb", "card_electrode", "card_exeggcute",
    "card_exeggutor", "card_cubone", "card_marowak", "card_lickitung", "card_koffing",
    "card_weezing", "card_rhyhorn",      "card_rhydon", "card_chansey", "card_tangela", 
    "card_horsea", "card_seadra", "card_goldeen", "card_seaking",       "card_staryu", 
    "card_mrmime",  "card_electabuzz", "card_magmar", "card_pinsir", "card_tauros", 
    "card_magikarp"
}

local rareCards = {
    "card_lapras", "card_eevee", "card_togepi", "card_vaporeon", "card_jolteon", "card_flareon", 
    "card_jigglypuff","card_wigglytuff", "card_kadabra","card_raichu", "card_nidoking",  
    "card_jynx", "card_kangaskhan", "card_gyarados", "card_ditto", "card_vstarmie", "card_onix", 
    "card_machamp", "card_vscyther", "card_hitmonlee", "card_hitmonchan", "card_venusaur"
}

local ultraCards = {
    "card_charizard", "card_blastoise","card_porygon", "card_omanyte", "card_omastar", 
    "card_dragonite", "card_mewtwo", "card_mew", "card_snorlax", "card_articuno", "card_zapdos", 
    "card_kabuto", "card_kabutops", "card_aerodactyl", "card_moltres", "card_dratini", "card_dragonair"
}

local vCards = {
    "card_blastoisev", "card_charizardv", "card_mewv", "card_pikachuv", "card_snorlaxv", "card_venusaurv"
}

local vmaxCards = {
    "card_blastoisevmax", "card_mewtwogx", "card_snorlaxvmax", "card_venusaurvmax", 
    "card_vmaxcharizard", "card_vmaxpikachu"
}

local rainbowCards = {
    "card_rainbowmewtwogx", "card_rainbowvmaxcharizard", "card_rainbowvmaxpikachu", "card_snorlaxvmaxrainbow"
}

-- ████████████████████████████████████████████████████████████████████████████████
-- ████████████████████████ USEABLE ITEMS █████████████████████████████████████████
-- ████████████████████████████████████████████████████████████████████████████████

-- Booster Box (Contains 4 packs)
Framework.CreateUseableItem("card_boosterbox", function(source, item)
    local Player = Framework.GetPlayer(source)
    if not Player then return end
    
    if Framework.RemoveItem(source, item.name, 1, item.slot, item.info) then
        TriggerClientEvent("Cards2:Client:OpenCards", source, item.name)
        Citizen.Wait(4000)
        Framework.AddItem(source, 'card_boosterpack', 4)
        Citizen.Wait(1000)
        TriggerClientEvent('RSGCore:Notify', source, Config.Locale[Config.Lang].got_packs)
        
        if Config.Security.logBoxOpening then
            print(string.format('[LXR-Tarot] Player %s opened booster box', GetPlayerName(source)))
        end
    end
end)

-- Booster Pack (Contains 4 cards)
Framework.CreateUseableItem("card_boosterpack", function(source, item)
    local Player = Framework.GetPlayer(source)
    if not Player then return end
    
    TriggerClientEvent("Cards2:Client:OpenPack", source)  
    Citizen.Wait(4000)
    TriggerClientEvent('RSGCore:Notify', source, Config.Locale[Config.Lang].got_cards)
end)

-- Card Storage Box
Framework.CreateUseableItem("card_pokebox", function(source, item)
    local Player = Framework.GetPlayer(source)
    if not Player then return end
    
    TriggerClientEvent("Cards2:client:UseBox", source)
    
    if Config.Security.logBoxOpening then
        local Player = Framework.GetPlayer(source)
        TriggerEvent("rsg-log:server:CreateLog", "card_pokebox", "Tarot Box", "white", 
            "Player Opened The Box **"..GetPlayerName(source).."** Citizen ID : **"..Player.PlayerData.citizenid.. "**", false)
    end
end)

-- ████████████████████████████████████████████████████████████████████████████████
-- ████████████████████████ CARD RARITY SYSTEM ████████████████████████████████████
-- ████████████████████████████████████████████████████████████████████████████████

CreateThread(function()
    math.randomseed(os.time())
end)

RegisterServerEvent('Cards2:Server:RemoveItem')
AddEventHandler('Cards2:Server:RemoveItem', function()
    local src = source
    local Player = Framework.GetPlayer(source)
    if not Player then return end
    
    local pack = Framework.GetItemByName(src, "card_boosterpack")
    
    if not pack or pack.amount == nil then
        TriggerClientEvent('RSGCore:Notify', source, Config.Locale[Config.Lang].no_pack)
    else
        Framework.RemoveItem(src, 'card_boosterpack', 1)
    end
end)

RegisterServerEvent('Cards2:Server:rewarditem')
AddEventHandler('Cards2:Server:rewarditem', function()
    local src = source
    local Player = Framework.GetPlayer(source)
    if not Player then return end
    
    local card = ''
    local randomChance = math.random(1, 1000)
    
    -- Rarity calculation based on roll
    if randomChance <= 5 then 
        card = rainbowCards[math.random(1, #rainbowCards)]  -- 0.5% chance
    elseif randomChance >= 6 and randomChance <= 19 then
        card = vmaxCards[math.random(1, #vmaxCards)]  -- 1.4% chance
    elseif randomChance >= 20 and randomChance <= 50 then
        card = vCards[math.random(1, #vCards)]  -- 3% chance
    elseif randomChance >= 51 and randomChance <= 100 then
        card = ultraCards[math.random(1, #ultraCards)]  -- 5% chance
    elseif randomChance >= 101 and randomChance <= 399 then
        card = rareCards[math.random(1, #rareCards)]  -- 29.9% chance
    else 
        card = basicCards[math.random(1, #basicCards)]  -- 60.1% chance
    end
    
    Citizen.Wait(10)
    
    if Config.Debug then
        print(string.format('[LXR-Tarot] Rolled %d, Got card: %s', randomChance, card))
    end
    
    if card ~= '' then        
        TriggerClientEvent('Cards2:Client:CardChoosed', src, card)
    else
        TriggerClientEvent('RSGCore:Notify', source, Config.Locale[Config.Lang].card_problem)
    end 
end)

RegisterServerEvent('Cards2:Server:GetPokemon')
AddEventHandler('Cards2:Server:GetPokemon', function(pokemon)
    local src = source
    local Player = Framework.GetPlayer(src)
    if not Player then return end
    
    local SharedItems = Framework.GetSharedItems()
    local pokemonName = SharedItems[pokemon] and SharedItems[pokemon].label or pokemon
    
    if pokemon ~= nil then
        Framework.AddItem(src, pokemon, 1)
        TriggerClientEvent("inventory:client:ItemBox", SharedItems[pokemon], "add")
        
        local gotText = string.format(Config.Locale[Config.Lang].got_card, pokemonName)
        TriggerClientEvent('RSGCore:Notify', source, gotText)
    end  
end)

-- ████████████████████████████████████████████████████████████████████████████████
-- ████████████████████████ BADGE EXCHANGE SYSTEM █████████████████████████████████
-- ████████████████████████████████████████████████████████████████████████████████

RegisterServerEvent("Cards2:server:badges")
AddEventHandler("Cards2:server:badges", function(type)
    local src = source
    local Player = Framework.GetPlayer(source)
    if not Player then return end
    
    local canBadge = true
    local badgeConfig = Config.Badge[type]
    
    if not badgeConfig then return end
    
    -- Security: Validate distance if enabled
    if Config.Security.validateDistance then
        local playerCoords = GetEntityCoords(GetPlayerPed(src))
        local badgeLocation = badgeConfig.location
        local distance = #(playerCoords - badgeLocation)
        
        if distance > Config.Security.maxInteractionDistance then
            if Config.Debug then
                print(string.format('[LXR-Tarot] Player %s too far from badge location (%.2fm)', GetPlayerName(src), distance))
            end
            return
        end
    end
    
    -- Check if player has all required cards
    for k, v in pairs(badgeConfig.cards) do 
        local item = Framework.GetItemByName(src, k)
        if not item or item.amount < v then 
            canBadge = false
            local comeBackText = string.format(Config.Locale[Config.Lang].come_back, badgeConfig.label)
            TriggerClientEvent('RSGCore:Notify', source, comeBackText, 'error', 5000) 
            break
        end
    end
    
    if canBadge then 
        -- Remove all required cards
        for k, v in pairs(badgeConfig.cards) do
            Framework.RemoveItem(src, k, v)
        end 
        
        Citizen.Wait(2000)
        
        -- Give badge
        Framework.AddItem(src, type, 1)
        
        local gotText = string.format(Config.Locale[Config.Lang].got_badge, badgeConfig.label)
        TriggerClientEvent('RSGCore:Notify', source, gotText, 'success', 10000)
        
        -- Log badge exchange
        if Config.Security.logBadgeExchanges then
            print(string.format('[LXR-Tarot] Player %s exchanged cards for %s', GetPlayerName(src), badgeConfig.label))
        end
    end 
end)

-- ████████████████████████████████████████████████████████████████████████████████
-- ████████████████████████ CARD SELLING SYSTEM ███████████████████████████████████
-- ████████████████████████████████████████████████████████████████████████████████

RegisterServerEvent("Cards2:sellItem")
AddEventHandler("Cards2:sellItem", function(itemName, amount, price)
    local src = source
    local Player = Framework.GetPlayer(source)
    if not Player then return end
    
    -- Security: Validate item exists in config
    if not Config.CardshopItems[itemName] then
        if Config.Debug then
            print(string.format('[LXR-Tarot] Player %s tried to sell invalid item: %s', GetPlayerName(src), itemName))
        end
        return
    end
    
    -- Security: Validate price calculation
    local expectedPrice = math.ceil(Config.CardshopItems[itemName] * amount)
    if price ~= expectedPrice then
        if Config.Debug then
            print(string.format('[LXR-Tarot] Player %s price mismatch. Expected: %d, Got: %d', GetPlayerName(src), expectedPrice, price))
        end
        price = expectedPrice  -- Use server-calculated price
    end
    
    if Framework.RemoveItem(src, itemName, amount) then
        Framework.AddMoney(src, 'cash', price, 'Card-sell')
        
        local soldText = string.format(Config.Locale[Config.Lang].sold_cards, amount, itemName, price)
        TriggerClientEvent("RSGCore:Notify", source, soldText, "success", 5000)
        
        if Config.Debug then
            print(string.format('[LXR-Tarot] Player %s sold %dx %s for $%d', GetPlayerName(src), amount, itemName, price))
        end
    end
end)

-- ████████████████████████████████████████████████████████████████████████████████
-- ████████████████████████ CALLBACK SYSTEMS ██████████████████████████████████████
-- ████████████████████████████████████████████████████████████████████████████████

Framework.CreateCallback("Cards2:server:Menu",function(source,cb)
    local player = Framework.GetPlayer(source)
    local item = "...."
    if player ~= nil then
        local itemData = Framework.GetItemByName(source, item)
        if itemData then
            cb(item, itemData.amount)
        end
    end
end)

Framework.CreateCallback('Cards2:server:get:drugs:items', function(source, cb)
    local src = source
    local AvailableDrugs = {}
    local Player = Framework.GetPlayer(src)
    if not Player then 
        cb({})
        return 
    end
    
    for k, v in pairs(Config.CardshopItems) do
        local DrugsData = Framework.GetItemByName(src, k)
        if DrugsData ~= nil then
            table.insert(AvailableDrugs, {['Item'] = DrugsData.name, ['Amount'] = DrugsData.amount})
        end
    end
    cb(AvailableDrugs)
end)

-- ████████████████████████████████████████████████████████████████████████████████
-- ████████████████████████ UTILITY FUNCTIONS █████████████████████████████████████
-- ████████████████████████████████████████████████████████████████████████████████

-- Debug table print function
function tprint (t, s)
    for k, v in pairs(t) do
        local kfmt = '["' .. tostring(k) ..'"]'
        if type(k) ~= 'string' then
            kfmt = '[' .. k .. ']'
        end
        local vfmt = '"'.. tostring(v) ..'"'
        if type(v) == 'table' then
            tprint(v, (s or '')..kfmt)
        else
            if type(v) ~= 'string' then
                vfmt = tostring(v)
            end
            print(type(t)..(s or '')..kfmt..' = '..vfmt)
        end
    end
end 

-- ████████████████████████████████████████████████████████████████████████████████
-- ████████████████████████ END OF SERVER SCRIPT ██████████████████████████████████
-- ████████████████████████████████████████████████████████████████████████████████
