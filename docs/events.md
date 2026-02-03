```
    🐺 LXR Tarot - Events & API Reference
    wolves.land - The Land of Wolves
```

# 📡 Events & API Reference

## Unified Framework API

All framework-specific calls are abstracted through the `Framework` bridge.

## Client-Side Events

### Cards2:Client:OpenCards
**Trigger:** Server (when player uses booster box)
```lua
TriggerClientEvent("Cards2:Client:OpenCards", source, itemName)
```
**Purpose:** Initiates booster box opening animation and UI
**Parameters:**
- `itemName` (string): The item name being opened

---

### Cards2:Client:OpenPack
**Trigger:** Server (when player uses booster pack)
```lua
TriggerClientEvent("Cards2:Client:OpenPack", source)
```
**Purpose:** Initiates booster pack opening animation and card reveal UI
**Parameters:** None

---

### Cards2:Client:CardChoosed
**Trigger:** Server (after card rarity calculation)
```lua
TriggerClientEvent('Cards2:Client:CardChoosed', src, card)
```
**Purpose:** Displays chosen card in NUI
**Parameters:**
- `card` (string): Card item name (e.g., "card_pikachu")

---

### Cards2:client:UseBox
**Trigger:** Server (when player uses card storage box)
```lua
TriggerClientEvent("Cards2:client:UseBox", source)
```
**Purpose:** Opens card storage inventory stash
**Parameters:** None

---

### Cards2:client:openMenu
**Trigger:** Client (when player presses J at shop)
```lua
TriggerEvent('Cards2:client:openMenu')
```
**Purpose:** Opens card selling menu (MenuV)
**Parameters:** None

---

### rsg-tarot:client:badgesound
**Trigger:** Server (when badge is earned)
```lua
TriggerClientEvent("rsg-tarot:client:badgesound", source)
```
**Purpose:** Plays badge sound effect
**Parameters:** None

---

## Server-Side Events

### Cards2:server:badges
**Trigger:** Client (when player presses E at badge location)
```lua
TriggerServerEvent('Cards2:server:badges', badgeType)
```
**Purpose:** Handles badge exchange validation and transaction
**Parameters:**
- `badgeType` (string): Badge configuration key (e.g., "card_boulderbadge")

---

### Cards2:Server:RemoveItem
**Trigger:** Client (after pack opening animation)
```lua
TriggerServerEvent('Cards2:Server:RemoveItem')
```
**Purpose:** Removes booster pack from player inventory
**Parameters:** None

---

### Cards2:Server:rewarditem
**Trigger:** Client NUI callback (when card is requested)
```lua
TriggerServerEvent('Cards2:Server:rewarditem')
```
**Purpose:** Calculates card rarity and selects random card
**Parameters:** None

---

### Cards2:Server:GetPokemon
**Trigger:** Client NUI callback (when card is chosen)
```lua
TriggerServerEvent('Cards2:Server:GetPokemon', pokemon)
```
**Purpose:** Adds chosen card to player inventory
**Parameters:**
- `pokemon` (string): Card item name

---

### Cards2:sellItem
**Trigger:** Client menu selection
```lua
TriggerServerEvent('Cards2:sellItem', itemName, amount, price)
```
**Purpose:** Handles card selling transaction
**Parameters:**
- `itemName` (string): Card being sold
- `amount` (number): Quantity to sell
- `price` (number): Total sale price

---

## NUI Callbacks

### Rewardpokemon
**Triggered By:** NUI card selection
```lua
RegisterNUICallback('Rewardpokemon', function(data)
    local pokemon = data.Pokemon
    -- Handle card selection
end)
```
**Purpose:** Player selects which card to keep
**Data:**
- `Pokemon` (string): Selected card name

---

### randomCard
**Triggered By:** NUI card request
```lua
RegisterNUICallback('randomCard', function()
    -- Request new random card
end)
```
**Purpose:** Requests next random card from pack
**Data:** None

---

### CloseNui
**Triggered By:** NUI close button
```lua
RegisterNUICallback('CloseNui', function()
    SetNuiFocus(false, false)
end)
```
**Purpose:** Closes card opening UI
**Data:** None

---

## Framework Bridge API

### Client Functions

#### Framework.Notify(message, type, duration)
**Purpose:** Display notification to player
```lua
Framework.Notify("You got a Charizard!", "success", 5000)
```
**Parameters:**
- `message` (string): Notification text
- `type` (string): "info", "success", "error", "warning"
- `duration` (number): Display time in milliseconds

---

#### Framework.GetPlayerData()
**Purpose:** Get current player data
```lua
local PlayerData = Framework.GetPlayerData()
local citizenid = PlayerData.citizenid
```
**Returns:** Player data object

---

#### Framework.Progressbar(name, label, duration, useWhileDead, canCancel, disableControls, animation, prop, propTwo, onFinish, onCancel)
**Purpose:** Show progress bar
```lua
Framework.Progressbar("open_pack", "Opening pack...", 3000, false, true, {
    disableMovement = false,
    disableCombat = true
}, {}, {}, {}, function()
    -- On complete
end)
```

---

#### Framework.GetKeybind(key)
**Purpose:** Get framework keybind
```lua
local keyJ = Framework.GetKeybind('J')
```
**Returns:** Key hash

---

#### Framework.TriggerCallback(name, callback, ...)
**Purpose:** Trigger server callback
```lua
Framework.TriggerCallback('Cards2:server:Menu', function(item, amount)
    -- Handle response
end)
```

---

### Server Functions

#### Framework.GetPlayer(source)
**Purpose:** Get player object
```lua
local Player = Framework.GetPlayer(source)
```
**Returns:** Player object or nil

---

#### Framework.AddItem(source, item, amount, slot, info)
**Purpose:** Add item to player inventory
```lua
Framework.AddItem(source, 'card_pikachu', 1)
```
**Returns:** boolean (success)

---

#### Framework.RemoveItem(source, item, amount, slot, info)
**Purpose:** Remove item from player inventory
```lua
Framework.RemoveItem(source, 'card_boosterpack', 1)
```
**Returns:** boolean (success)

---

#### Framework.GetItemByName(source, item)
**Purpose:** Get player's item data
```lua
local item = Framework.GetItemByName(source, 'card_pikachu')
if item and item.amount > 0 then
    -- Player has card
end
```
**Returns:** Item object or nil

---

#### Framework.AddMoney(source, account, amount, reason)
**Purpose:** Add money to player
```lua
Framework.AddMoney(source, 'cash', 500, 'card-sale')
```
**Returns:** boolean (success)

---

#### Framework.RemoveMoney(source, account, amount, reason)
**Purpose:** Remove money from player
```lua
Framework.RemoveMoney(source, 'cash', 100, 'card-purchase')
```
**Returns:** boolean (success)

---

#### Framework.CreateUseableItem(item, callback)
**Purpose:** Register useable item
```lua
Framework.CreateUseableItem("card_boosterpack", function(source, item)
    -- Handle item use
end)
```

---

#### Framework.CreateCallback(name, callback)
**Purpose:** Register server callback
```lua
Framework.CreateCallback('Cards2:server:Menu', function(source, cb)
    -- Handle callback
    cb(result)
end)
```

---

#### Framework.GetSharedItems()
**Purpose:** Get framework item definitions
```lua
local items = Framework.GetSharedItems()
local cardLabel = items['card_pikachu'].label
```
**Returns:** Items table

---

## Event Flow Examples

### Opening a Booster Pack

```mermaid
Client -> Server: Use card_boosterpack item
Server -> Client: Cards2:Client:OpenPack
Client: Show animation, open NUI
Client -> Server: Cards2:Server:RemoveItem (remove pack)
Client -> Server: Cards2:Server:rewarditem (request card)
Server: Calculate rarity, select card
Server -> Client: Cards2:Client:CardChoosed
Client: Display card in NUI
User: Select card
Client -> Server: Cards2:Server:GetPokemon
Server: Add card to inventory
Server -> Client: Notify "You got X!"
```

### Exchanging for Badge

```mermaid
Client: Player presses E near NPC
Client -> Server: Cards2:server:badges (badgeType)
Server: Validate distance
Server: Check required cards
Server: Remove cards from inventory
Server: Add badge to inventory
Server -> Client: Notify "You got Badge!"
Server -> Client: rsg-tarot:client:badgesound
Client: Play sound effect
```

### Selling Cards

```mermaid
Client: Player presses J at shop
Client: Open MenuV menu
Client: Framework.TriggerCallback to get inventory
Server: Return available cards
Client: Display cards with prices
User: Select card to sell
Client -> Server: Cards2:sellItem (item, amount, price)
Server: Validate price
Server: Remove item
Server: Add money
Server -> Client: Notify "Sold X for $Y"
```

---

**© 2026 iBoss21 / The Lux Empire | wolves.land**
