local variant = Tracker.ActiveVariantUID
IS_UNLABELLED = variant:find("maps-u")

Tracker:AddItems("items/items.json")
Tracker:AddItems("items/hints.json")

-- Logic
ScriptHost:LoadScript("scripts/logic/logic_overhead.lua")
ScriptHost:LoadScript("scripts/logic/logic_autotracking.lua")
ScriptHost:LoadScript("scripts/logic/logic_chuffy.lua")
ScriptHost:LoadScript("scripts/logic/logic_regionconnectors.lua")
ScriptHost:LoadScript("scripts/logic/logic__isle_and_cauldronkeep.lua")
ScriptHost:LoadScript("scripts/logic/logic__mayahem.lua")
ScriptHost:LoadScript("scripts/logic/logic__glittergulch.lua")
ScriptHost:LoadScript("scripts/logic/logic__witchyworld.lua")
ScriptHost:LoadScript("scripts/logic/logic__jollyrogers.lua")
ScriptHost:LoadScript("scripts/logic/logic__terrydactyland.lua")
ScriptHost:LoadScript("scripts/logic/logic__gruntyindustries.lua")
ScriptHost:LoadScript("scripts/logic/logic__hailfire.lua")
ScriptHost:LoadScript("scripts/logic/logic__cloudcuckooland.lua")

-- Maps
Tracker:AddMaps("maps/maps.json")

-- Locations
Tracker:AddLocations("locations/locations_regions.json")
Tracker:AddLocations("locations/locations_isle.json")
Tracker:AddLocations("locations/locations_mayahem.json")
Tracker:AddLocations("locations/locations_glittergulch.json")
Tracker:AddLocations("locations/locations_witchyworld.json")
Tracker:AddLocations("locations/locations_jollyrogers.json")
Tracker:AddLocations("locations/locations_terrydactyland.json")
Tracker:AddLocations("locations/locations_gruntyindustries.json")
Tracker:AddLocations("locations/locations_hailfire.json")
Tracker:AddLocations("locations/locations_cloudcuckooland.json")
Tracker:AddLocations("locations/locations_cauldronkeep.json")

Tracker:AddLocations("locations/locations_hints.json")

-- Layout
Tracker:AddLayouts("layouts/world_maps.json")
Tracker:AddLayouts("layouts/moves.json")
Tracker:AddLayouts("layouts/accessmagic.json")
Tracker:AddLayouts("layouts/items.json")
Tracker:AddLayouts("layouts/settings.json")
Tracker:AddLayouts("layouts/tabs.json")
Tracker:AddLayouts("layouts/tracker.json")
Tracker:AddLayouts("layouts/broadcast.json")
Tracker:AddLayouts("layouts/silos.json")
Tracker:AddLayouts("layouts/warps.json")

-- AutoTracking for Poptracker
if PopVersion and PopVersion >= "0.18.0" then
    ScriptHost:LoadScript("scripts/autotracking.lua")
end
