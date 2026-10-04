Config = {}

-- Towing service settings
Config.TowPrice = 500 -- Price per tow
Config.TowCooldown = 300 -- Cooldown in seconds
Config.TowBlipSprite = 64 -- Blip sprite for towing vehicles
Config.TowBlipColor = 5 -- Blip color for towing vehicles

-- Towing vehicle settings
Config.TowVehicles = {
    'flatbed',
    'towtruck',
    'towtruck2'
}

-- Towing locations
Config.TowLocations = {
    {x = 409.1, y = -1625.0, z = 29.3},
    {x = -160.0, y = -1162.0, z = 23.2}
}