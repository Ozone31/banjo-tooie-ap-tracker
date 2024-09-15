local variant = Tracker.ActiveVariantUID
IS_UNLABELLED = variant:find("maps-u")

Tracker:AddItems("items/items.json")
Tracker:AddItems("items/hints.json")

-- Logic
ScriptHost:LoadScript("scripts/logic/logic.lua")
Tracker:AddMaps("maps/maps.json")

-- Maps

-- Locations
Tracker:AddLocations("locations/locations.json")
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

-- AutoTracking for Poptracker
if PopVersion and PopVersion >= "0.18.0" then
    ScriptHost:LoadScript("scripts/autotracking.lua")
end
