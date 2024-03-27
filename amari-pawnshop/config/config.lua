
Config = {}

Config.Notifications = "qb"  -- Options: "ps", "qb"
Config.Job = "pawn" -- Job
Config.Target = "qb-target" -- supports ox_target / qb-target / qtarget
Config.InvLink = "ps-inventory/html/images/"
Config.InventorySystem = "ps-inventory"  -- Options: "qb-inventory" or "ps-inventory"


Config.Blip = {
	Enable = true,
	Location = vector3(173.54, -1319.55, 29.35),
	Sprite = 267,
	Display = 2,
	Scale = 0.8,
	Colour = 58,
	Name = "Pawnshop",
}


Config.Stashes = {
    ["stash1"] = {
        stashName = "Crate1",
        coords = vector3(168.47, -1314.42, 29.34),
        --jobrequired = false, -- REMOVED DUE TO ERROR ON CLIENT SIDE
        stashSize = 1000000,
        stashSlots = 30,
        heading = 301.19,
        length = 2.0,
        width = 2.0,
        minZ = 28.22,
        maxZ = 30.22,
    },
    ["stash2"] = {
        stashName = "Crate2",
        coords = vector3(169.08, -1313.84, 29.34),
        --jobrequired = false, -- REMOVED DUE TO ERROR ON CLIENT SIDE
        stashSize = 1250000,
        stashSlots = 125,
        heading = 39.16,
        length = 2.5,
        width = 2.5,
        minZ = 28.22,
        maxZ = 30.22,
    },
    ["stash3"] = {
        stashName = "Counter1",
        coords = vector3(176.27, -1316.45, 29.35),
        --jobrequired = false, -- REMOVED DUE TO ERROR ON CLIENT SIDE
        stashSize = 1250000,
        stashSlots = 8,
        heading = 151.74,
        length = 2.5,
        width = 2.5,
        minZ = 28.22,
        maxZ = 30.22,
    },
    ["stash4"] = {
        stashName = "Counter2",
        coords = vector3(173.22, -1323.47, 29.35),
        --jobrequired = false, -- REMOVED DUE TO ERROR ON CLIENT SIDE
        stashSize = 1250000,
        stashSlots = 8,
        heading = 314.87,
        length = 2.5,
        width = 2.5,
        minZ = 28.22,
        maxZ = 30.22,
    },
    -- Add more stashes here with same format
}

Config.Lockers = {
    MaxWeight = 100000,  
    Slots = 30          
}

Config.CraftingZone = {
    name = "Crafting",
    coords = vector3(164.53, -1322.97, 25.81),
    length = 1,
    width = 4,
    heading = 164.97,
    minZ = 23.30,
    maxZ = 27.30,
    options = {
        {
            action = function() CraftMenu() end,
            icon = "fa-solid fa-hammer",
            label = "Craft",
            job = Config.Job
        }
    },
    distance = 2.0
}

Config.BillingZone = {
    name = "Billing",
    coords = vector3(173.61, -1317.65, 30.51),
    length = 0.7,
    width = 0.7,
    heading = 241.85,
    minZ = 27.22,  
    maxZ = 32.22, 
    options = {
        {
            event = "amari-pawnshop:Client:Invoicing",
            icon = "fa-solid fa-money-bill",
            label = "Bill",
            job = Config.Job
        }
    },
    distance = 2.0
}

Config.DutyZone = {
    name = "Duty",
    coords = vector3(164.12, -1318.23, 29.34),
    size = { x = 1.0, y = 3.0 },
    heading = 46.92,
    debugPoly = false,
    minZ = 28.22,  
    maxZ = 31.22,  
    options = {
        {
            action = function() Duty() end,
            icon = "fa-solid fa-clipboard-list",
            label = "Duty",
            job = Config.Job
        }
    },
    distance = 2.0
}

Config.BossMenuZone = {
    name = "BossMenu",
    coords = vector3(165.87, -1318.36, 29.34),
    size = { x = 1, y = 2.5 },
    heading = 5.45,
    debugPoly = false,
    minZ = 27.22,  
    maxZ = 31.22,  
    options = {
        {
            event = "qb-bossmenu:client:OpenMenu",
            icon = "fa-solid fa-clipboard-list",
            label = "Boss Menu",
            job = Config.Job
        }
    },
    distance = 2.0
}

Config.MoneyWashZone = {
    coords = vector3(168.6, -1313.78, 25.81),  
    length = 1.4,
    width = 2.5,
    heading = 273.56,
    minZ = 23.22,  
    maxZ = 27.22,   
    label = "Wash Money",
    icon = "fas fa-money-bill-wave",
    distance = 2.0
}


Config.JimPayments = false -- if using [jim-payments](https://github.com/jimathy/jim-payments) set to true , otherwise set it to false

Config.BreakerZone = {
    coords = vector3(167.46, -1322.41, 25.81),  
    length = 0.8,
    width = 3.0,  
    heading = 253.78,
    minZ = 24.22,  
    maxZ = 26.22,  
    label = "Disemble Items",
    icon = "fas fa-hammer",
    distance = 1.0
}

Config.BreakerZone2 = { ---------------------------------------- MELTING ZONE (Some Reason the client and server side dont read MeltingZone etc.)
    coords = vector3(166.5, -1324.41, 27.37),  
    length = 0.8,
    width = 3.0,  
    heading = 156.26, 
    minZ = 24.22,  
    maxZ = 28.22,  
    label = "Melt Items",
    icon = "fas fa-fire",
    distance = 1.0
}

Config.BreakerItems = {
    ["goldingot"] = {
        { material = "goldnugget", amount = 5 }
        -- Add more materials if needed
    },
    -- Add more items here
}

Config.BreakerItems2 = {
    ["goldnugget"] = {
        { material = "goldliquid", amount = 1 }
        -- Add more materials if needed
    },
    -- Add more items here
}

Config.CraftingZone = {
    name = "Crafting",
    coords = vector3(164.53, -1322.97, 25.81),
    length = 1,
    width = 4,
    heading = 164.97,
    minZ = 23.30,
    maxZ = 27.30,
    options = {
        {
            action = function() CraftMenu() end,
            icon = "fa-solid fa-hammer",
            label = "Craft",
            --job = Config.Job                                          ---- Please dont use (it will break until fix has been found for job only Crafting)
        }
    },
    distance = 2.0
}

Config.CraftingSettings = {
    UseMinigame = true,                                                 ---- Set to false to disable minigames for crafting
    MinigameType = 'Circle',                                            ---- Options: 'Circle', 'Maze', 'VarHack', 'Thermite'
}

Config.Crafting = {
    ["goldnugget"] = {                                                  ----- used for testing purpose (change to your own item)
        hash = "goldnugget",                                            ----- used for testing purpose (change to your own item)
        label = "Gold Nugget",
        materials = {
            [1] = { item = "iron",       amount = 25 },                 ----- used for testing purpose (change to your own item)
            [2] = { item = "steel",        amount = 50 },               ----- used for testing purpose (change to your own item)
        }
    },
}

