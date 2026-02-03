--[[
    ██╗     ██╗  ██╗██████╗       ████████╗ █████╗ ██████╗  ██████╗ ████████╗
    ██║     ╚██╗██╔╝██╔══██╗      ╚══██╔══╝██╔══██╗██╔══██╗██╔═══██╗╚══██╔══╝
    ██║      ╚███╔╝ ██████╔╝█████╗   ██║   ███████║██████╔╝██║   ██║   ██║   
    ██║      ██╔██╗ ██╔══██╗╚════╝   ██║   ██╔══██║██╔══██╗██║   ██║   ██║   
    ███████╗██╔╝ ██╗██║  ██║         ██║   ██║  ██║██║  ██║╚██████╔╝   ██║   
    ╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝         ╚═╝   ╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝    ╚═╝   
                                                                               
    🐺 LXR Tarot - Client Script
    
    This client script handles all player-side interactions for the tarot card
    collection system including NPC spawning, card shop interactions, card opening
    animations, and UI management.
    
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
    Performance Target: Optimized ped spawning and UI interactions
    
    Tags: RedM, Georgian, SeriousRP, Whitelist, Tarot, Cards, Client
    
    © 2026 iBoss21 / The Lux Empire | wolves.land | All Rights Reserved
]]

-- ═══════════════════════════════════════════════════════════════════════════════
-- 🐺 INITIALIZATION & FRAMEWORK BRIDGE
-- ═══════════════════════════════════════════════════════════════════════════════

local assert = assert
local MenuV = assert(MenuV)

-- Wait for framework to be ready
while not Framework or not Framework.IsReady do
    Wait(100)
end

-- ████████████████████████████████████████████████████████████████████████████████
-- ████████████████████████ LOCAL VARIABLES ███████████████████████████████████████
-- ████████████████████████████████████████████████████████████████████████████████

local spawnedPeds = {}
local inshop = false

-- ████████████████████████████████████████████████████████████████████████████████
-- ████████████████████████ BLIP SYSTEM ███████████████████████████████████████████
-- ████████████████████████████████████████████████████████████████████████████████

local function AddBlip()
    -- Add blips for badge exchange locations
    for k, v in pairs(Config.Badge) do           
        local blip = Citizen.InvokeNative(0x554D9D53F696D002, 1664425300, v.location)
        SetBlipSprite(blip, GetHashKey(Config.Blip.blipSprite), true)
        SetBlipScale(blip, Config.Blip.blipScale)
        Citizen.InvokeNative(0x9CB1A1623062F402, blip, Config.Blip.blipName)
    end
    
    -- Add blips for card shop locations
    for k, v in pairs(Config.CardshopLocation) do
        local blip = Citizen.InvokeNative(0x554D9D53F696D002, 1664425300, v.location)
        SetBlipSprite(blip, GetHashKey(Config.Blip.blipSprite), true)
        SetBlipScale(blip, Config.Blip.blipScale)
        Citizen.InvokeNative(0x9CB1A1623062F402, blip, Config.Blip.blipName)
    end
end

Citizen.CreateThread(function()
    AddBlip()
end)

-- ████████████████████████████████████████████████████████████████████████████████
-- ████████████████████████ 3D TEXT DRAW SYSTEM ███████████████████████████████████
-- ████████████████████████████████████████████████████████████████████████████████

function DrawText3Ds(x, y, z, text)
    local onScreen,_x,_y=GetScreenCoordFromWorldCoord(x, y, z)
    SetTextScale(0.35, 0.35)
    SetTextFontForCurrentCommand(9)
    SetTextColor(255, 255, 255, 215)
    local str = CreateVarString(10, "LITERAL_STRING", text, Citizen.ResultAsLong())
    SetTextCentre(1)
    DisplayText(str,_x,_y)
end

-- ████████████████████████████████████████████████████████████████████████████████
-- ████████████████████████ LOCATION INTERACTION SYSTEM ███████████████████████████
-- ████████████████████████████████████████████████████████████████████████████████

Citizen.CreateThread(function()
    while true do
        Wait(1)
        local sleep = true
        local playerCoords = GetEntityCoords(PlayerPedId())
        
        -- Get localized text
        local buyText = Config.Locale[Config.Lang].card_buyer
        local exchangeText = Config.Locale[Config.Lang].exchange_for
        
        -- Check card shop locations
        for k, v in pairs(Config.CardshopLocation) do
            local loc = v.location
            local distance = #(playerCoords - loc)
            if distance < 2.5 then
                sleep = false
                DrawText3Ds(loc.x, loc.y, loc.z + 1.0, buyText)
                local keyJ = Framework.GetKeybind('J') or Config.Keys.J
                if IsControlJustPressed(1, keyJ) then
                    TriggerEvent('Cards2:client:openMenu')
                end
            end 
        end
        
        -- Check badge exchange locations
        for k, v in pairs(Config.Badge) do
            local loc = v.location
            local distance = #(playerCoords - loc)
            if distance < 2.5 then
                sleep = false
                local text = string.format(exchangeText, v.label)
                DrawText3Ds(loc.x, loc.y, loc.z + 1.0, text .. ' [E]')
                local keyE = Framework.GetKeybind('E') or Config.Keys.E
                if IsControlJustPressed(1, keyE) then
                    TriggerServerEvent('Cards2:server:badges', k)
                end 
            end
        end
        
        if sleep then
            Wait(Config.Performance.locationCheckFallback or 1000)
        end
    end
end)

-- ████████████████████████████████████████████████████████████████████████████████
-- ████████████████████████ NPC PED SPAWNING SYSTEM ███████████████████████████████
-- ████████████████████████████████████████████████████████████████████████████████

function NearPed(model, coords2)
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(50)
    end
    
    local spawnedPed = CreatePed(model, coords2.x, coords2.y, coords2.z - 1.0, coords2.w, false, false, 0, 0)
    SetEntityAlpha(spawnedPed, 0, false)
    Citizen.InvokeNative(0x283978A15512B2FE, spawnedPed, true)
    SetEntityCanBeDamaged(spawnedPed, false)
    SetEntityInvincible(spawnedPed, true)
    FreezeEntityPosition(spawnedPed, true)
    SetBlockingOfNonTemporaryEvents(spawnedPed, true)
    
    -- Set relationship group between npc and player
    Citizen.InvokeNative(0xC80A74AC829DDD92, spawnedPed, GetPedRelationshipGroupHash(spawnedPed))
    Citizen.InvokeNative(0xBF25EB89375A37AD, 1, GetPedRelationshipGroupHash(spawnedPed), `PLAYER`)
    
    if Config.Debug then
        local relationship = Citizen.InvokeNative(0x9E6B70061662AE5C, GetPedRelationshipGroupHash(spawnedPed), `PLAYER`)
        print('[LXR-Tarot] Ped relationship:', relationship)
    end
    
    -- Fade in effect
    if Config.Performance.enablePedFade then
        for i = 0, 255, 51 do
            Wait(50)
            SetEntityAlpha(spawnedPed, i, false)
        end
    end
    
    return spawnedPed
end

Citizen.CreateThread(function()
    while true do
        Wait(Config.Performance.pedUpdateInterval or 500)
        for k,v in pairs(Config.PedList) do
            local playerCoords = GetEntityCoords(PlayerPedId())
            local distance = #(playerCoords - v.coords2.xyz)
            
            if distance < Config.Performance.pedSpawnDistance and not spawnedPeds[k] then
                local spawnedPed = NearPed(v.model, v.coords2)
                spawnedPeds[k] = { spawnedPed = spawnedPed }
            end
            
            if distance >= Config.Performance.pedSpawnDistance and spawnedPeds[k] then
                if Config.Performance.enablePedFade then
                    for i = 255, 0, -51 do
                        Wait(50)
                        SetEntityAlpha(spawnedPeds[k].spawnedPed, i, false)
                    end
                end
                DeletePed(spawnedPeds[k].spawnedPed)
                spawnedPeds[k] = nil
            end
        end
    end
end)

-- ████████████████████████████████████████████████████████████████████████████████
-- ████████████████████████ CARD BOX OPENING SYSTEM ███████████████████████████████
-- ████████████████████████████████████████████████████████████████████████████████

RegisterNetEvent("Cards2:Client:OpenCards")
AddEventHandler("Cards2:Client:OpenCards", function() 
    RequestAnimDict("mech_melee@unarmed@ai@_ambient@_healthy@_streamed")
    while (not HasAnimDictLoaded("mech_melee@unarmed@ai@_ambient@_healthy@_streamed")) do
        Wait(0)
    end
    TaskPlayAnim(PlayerPedId(), "mech_melee@unarmed@ai@_ambient@_healthy@_streamed", "mech_melee@unarmed@ai@_ambient@_healthy@_streamed amb_fight_dodge_attack_02_vic", 8.0, -8.0, -1, 1, 0, false, false, false)
    
    local PedCoords = GetEntityCoords(PlayerPedId())
    local propbox = CreateObject(GetHashKey('p_moneybag01x'),PedCoords.x, PedCoords.y,PedCoords.z, true, true, true)
    AttachEntityToEntity(propbox, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 0xDEAD), 0.1, 0.1, 0.0, 0.0, 10.0, 90.0, false, false, false, false, 2, true)
    Wait(5)
    
    if Config.General.enableSounds then
        TriggerServerEvent("InteractSound_SV:PlayOnSource", "boxopen", 0.8)
    end
    
    local openingText = Config.Locale[Config.Lang].opening_box
    Framework.Progressbar("drink_something", openingText, Config.Cooldowns.openBoxTime, false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
        disableInventory = true,
    }, {}, {}, {}, function()
        Wait(1)
        DeleteEntity(propbox)
        ClearPedTasks(PlayerPedId())
    end)
end) 

-- ████████████████████████████████████████████████████████████████████████████████
-- ████████████████████████ CARD PACK OPENING SYSTEM ██████████████████████████████
-- ████████████████████████████████████████████████████████████████████████████████

RegisterNetEvent("Cards2:Client:OpenPack")
AddEventHandler("Cards2:Client:OpenPack", function() 
    RequestAnimDict("mech_melee@unarmed@ai@_ambient@_healthy@_streamed")
    while (not HasAnimDictLoaded("mech_melee@unarmed@ai@_ambient@_healthy@_streamed")) do
        Wait(0)
    end
    TaskPlayAnim(PlayerPedId(), "mech_melee@unarmed@ai@_ambient@_healthy@_streamed", "mech_melee@unarmed@ai@_ambient@_healthy@_streamed amb_fight_dodge_attack_02_vic", 8.0, -8.0, -1, 1, 0, false, false, false)
    
    local PedCoords = GetEntityCoords(PlayerPedId())
    local propcards = CreateObject(GetHashKey('p_cards_cs01x'), PedCoords.x, PedCoords.y, PedCoords.z, true, true, true)
    AttachEntityToEntity(propcards, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 0xDEAD), 0.1, 0.1, 0.0, 70.0, 10.0, 90.0, false, false, false, false, 2, true)
    
    local openingText = Config.Locale[Config.Lang].opening_pack
    Framework.Progressbar("drink_something", openingText, Config.Cooldowns.openPackTime, false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
        disableInventory = true,
    }, {}, {}, {}, function()
        if Config.General.enableSounds then
            TriggerServerEvent("InteractSound_SV:PlayOnSource", "dealfour", 0.9)
        end
        Wait(500)
        SetNuiFocus(true, true)
        SendNUIMessage({
            open = true,
            class = 'open',
        })
        DeleteEntity(propcards)
        ClearPedTasks(PlayerPedId())
        TriggerServerEvent('Cards2:Server:RemoveItem')
    end)
end)

-- ████████████████████████████████████████████████████████████████████████████████
-- ████████████████████████ NUI CALLBACK SYSTEM ███████████████████████████████████
-- ████████████████████████████████████████████████████████████████████████████████

RegisterNUICallback('Rewardpokemon', function(data)
    local pokemon = data.Pokemon
    if Config.General.enableSounds then
        TriggerServerEvent("InteractSound_SV:PlayOnSource", "flip", 0.9)
    end
    TriggerServerEvent('Cards2:Server:GetPokemon', pokemon)
end)

RegisterNUICallback('randomCard', function()
    TriggerServerEvent('Cards2:Server:rewarditem')
end)

RegisterNUICallback('CloseNui', function()
    SetNuiFocus(false, false)
end)

RegisterNetEvent("Cards2:Client:CardChoosed")
AddEventHandler("Cards2:Client:CardChoosed", function(card)
    SendNUIMessage({
        open = true,
        class = 'choose',
        data = card,
    }) 
end)

-- ████████████████████████████████████████████████████████████████████████████████
-- ████████████████████████ CARD BOX STORAGE SYSTEM ███████████████████████████████
-- ████████████████████████████████████████████████████████████████████████████████

RegisterNetEvent("Cards2:client:UseBox")
AddEventHandler("Cards2:client:UseBox", function()
    TaskPlayAnim(PlayerPedId(), "clothingshirt", "try_shirt_positive_d", 8.0, 1.0, -1, 49, 0, 0, 0, 0)
    if Config.Debug then
        print('[LXR-Tarot] Box is Opening')
    end
    TaskPlayAnim(PlayerPedId(), "mech_melee@unarmed@ai@_ambient@_healthy@_streamed", "mech_melee@unarmed@ai@_ambient@_healthy@_streamed amb_fight_dodge_attack_02_vic", 8.0, -8.0, -1, 1, 0, false, false, false)
    
    local PedCoords = GetEntityCoords(PlayerPedId())
    local deckbox = CreateObject(GetHashKey('p_moneybag01x'),PedCoords.x, PedCoords.y,PedCoords.z, true, true, true)
    AttachEntityToEntity(deckbox, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 0xDEAD), 0.1, 0.1, 0.0, 0.0, 10.0, 90.0, false, false, false, false, 2, true)
    
    local openingText = Config.Locale[Config.Lang].opening_box
    Framework.Notify(openingText, "error")
    Framework.Progressbar("use_bag", openingText, 5000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function()
        local PlayerData = Framework.GetPlayerData()
        TriggerServerEvent("inventory:server:OpenInventory", "stash", "tarot_"..PlayerData.citizenid, {
            maxweight = Config.General.stashMaxWeight, 
            slots = Config.General.stashMaxSlots
        })
        TriggerEvent("inventory:client:SetCurrentStash", "tarot_"..PlayerData.citizenid)
        if Config.General.enableSounds then
            TriggerServerEvent("InteractSound_SV:PlayOnSource", "snap", 1.2)
        end
        TaskPlayAnim(PlayerPedId(), "clothingshirt", "exit", 8.0, 1.0, -1, 49, 0, 0, 0, 0)
        
        local successText = Config.Locale[Config.Lang].box_opened
        Framework.Notify(successText, "success")
        Wait(10000)
        DeleteEntity(deckbox)
        ClearPedTasks(PlayerPedId())
    end)
end)

-- ████████████████████████████████████████████████████████████████████████████████
-- ████████████████████████ SHOP CHECK SYSTEM █████████████████████████████████████
-- ████████████████████████████████████████████████████████████████████████████████

Citizen.CreateThread(function()
    while true do 
        Wait(Config.Cooldowns.menuCooldown or 2500)
        local PlayerData = Framework.GetPlayerData()
        local ShopCoords = Config.CardshopLocation['Cardshop'].location
        local ped = PlayerPedId()
        local pos = GetEntityCoords(ped)
        local dist = #(pos - ShopCoords)
        
        if dist < 2.5 and not PlayerData.metadata["isdead"] and not PlayerData.metadata["inlaststand"] and not PlayerData.metadata["ishandcuffed"] and not IsPauseMenuActive() then
            inshop = true
        else 
            inshop = false
        end
        
        if inshop == true then
            Wait(1000)
            Framework.TriggerCallback("Cards2:server:Menu",function(item,amount)
                if Config.Debug then
                    print('[LXR-Tarot] Menu callback:', item, amount)
                end
            end)
        end
    end 
end)

-- ████████████████████████████████████████████████████████████████████████████████
-- ████████████████████████ BADGE SOUND EVENT █████████████████████████████████████
-- ████████████████████████████████████████████████████████████████████████████████

RegisterNetEvent("rsg-tarot:client:badgesound")
AddEventHandler("rsg-tarot:client:badgesound", function()
    if Config.General.enableSounds then
        TriggerServerEvent("InteractSound_SV:PlayOnSource", "badge", 0.8)
    end
end)

-- ████████████████████████████████████████████████████████████████████████████████
-- ████████████████████████ MENUV SYSTEM ██████████████████████████████████████████
-- ████████████████████████████████████████████████████████████████████████████████

local menu = MenuV:CreateMenu(false, 'Player Items', 'topright', 155, 0, 0, 'size-125', 'none', 'menuv', 'test3')
local menu2 = menu:InheritMenu({title = false, subtitle = 'Card Shop', theme = 'default' })
local menu_button = menu:AddButton({ icon = '🔖', label = 'Sell Cards/Badges', value = menu2, description = 'View List Of Items' })

RegisterNetEvent('Cards2:client:openMenu')
AddEventHandler('Cards2:client:openMenu', function()
    MenuV:OpenMenu(menu)
end)

menu_button:On('select', function(item)
    menu2:ClearItems(true)
    Framework.TriggerCallback('Cards2:server:get:drugs:items', function(CardsResult)
        for k, v in pairs(CardsResult) do
            local itemName = v['Item']
            local itemCount = v['Amount']
            local price = Config.CardshopItems[itemName]
            price = math.ceil(price * itemCount)
            
            local menu_button2 = menu2:AddButton({
                label = itemName .. " | Amount : " ..itemCount.." | $" .. price,
                name = itemName,
                value = {name = itemName, count = itemCount, price = price},
                
                select = function(btn)
                    local select = btn.Value
                    TriggerServerEvent('Cards2:sellItem', select.name, select.count, select.price)
                    menu2:ClearItems(false)
                    if Config.General.enableSkillXP then
                        exports['possible-skills']:XP(1, 'comercio', 1)
                    end
                end
            })
        end
    end)
    
    if Config.General.enableSkillXP then
        exports['possible-skills']:XP(1, 'investigacion', 1)
        exports['possible-skills']:XP(1, 'buscatesoros', 1)
    end
end)

-- ████████████████████████████████████████████████████████████████████████████████
-- ████████████████████████ END OF CLIENT SCRIPT ██████████████████████████████████
-- ████████████████████████████████████████████████████████████████████████████████
