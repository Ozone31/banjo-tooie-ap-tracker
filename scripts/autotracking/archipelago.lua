ScriptHost:LoadScript("scripts/autotracking/item_mapping.lua")
ScriptHost:LoadScript("scripts/autotracking/location_mapping.lua")
ScriptHost:LoadScript("scripts/autotracking/hints_mapping.lua")
ScriptHost:LoadScript("scripts/autotracking/map_mapping.lua")

CUR_INDEX = -1
--SLOT_DATA = nil

FLAG_CODES = {
    HAG1
}

load_mt = "Mayahem Temple"
load_ggm = "Glitter Gulch Mine"
load_ww = "Witchyworld"
load_jrl = "Jolly Roger's Lagoon - Town Center"
load_tdl = "Terrydactyland"
load_gi = "Outside Grunty Industries"
load_hfp = "Hailfire Peaks"
load_ccl = "Cloud Cuckooland"
load_ck = "Cauldron Keep"

silo_eggaim = 25
silo_bblaster = 30
silo_ggrab = 35
silo_feggs = 45
silo_bdrill = 85
silo_bbayonet = 95
silo_geggs = 110
silo_packwh = 120
silo_splitup = 160
silo_aireaim = 180
silo_ieggs = 200
silo_wwhack = 265
silo_auqaim = 275
silo_ttorp = 290
silo_ceggs = 315
silo_springb = 390
silo_taxpack = 405
silo_hatch = 420
silo_snpack = 525
silo_lspring = 545
silo_clawbts = 590
silo_shpack = 640
silo_glide = 660
silo_sapack = 765

bosshuntlength = 8

function has_value (t, val)
    for i, v in ipairs(t) do
        if v == val then return 1 end
    end
    return 0
end

function dump_table(o, depth)
    if depth == nil then
        depth = 0
    end
    if type(o) == 'table' then
        local tabs = ('\t'):rep(depth)
        local tabs2 = ('\t'):rep(depth + 1)
        local s = '{\n'
        for k, v in pairs(o) do
            if type(k) ~= 'number' then
                k = '"' .. k .. '"'
            end
            s = s .. tabs2 .. '[' .. k .. '] = ' .. dump_table(v, depth + 1) .. ',\n'
        end
        return s .. tabs .. '}'
    else
        return tostring(o)
    end
end


function onClear(slot_data)
    Tracker.BulkUpdate = true
    SLOT_DATA = slot_data
    CUR_INDEX = -1
    -- reset locations
    for _, v in pairs(LOCATION_MAPPING) do
        if v[1] then
            local obj = Tracker:FindObjectForCode(v[1])
            if obj then
                if v[1]:sub(1, 1) == "@" then
                    obj.AvailableChestCount = obj.ChestCount
                else
                    obj.Active = false
                end
            end
        end
    end
    -- reset items
    for _, v in pairs(ITEM_MAPPING) do
        if v[1] and v[2] then
            if AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
                print(string.format("onClear: clearing item %s of type %s", v[1], v[2]))
            end
            local obj = Tracker:FindObjectForCode(v[1])
            if obj then
                if v[2] == "toggle" then
                    obj.Active = false
                elseif v[2] == "progressive" then
                    obj.CurrentStage = 0
                    obj.Active = false
                elseif v[2] == "consumable" then
                    obj.AcquiredCount = 0
                elseif AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
                    print(string.format("onClear: unknown item type %s for code %s", v[2], v[1]))
                end
            elseif AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
                print(string.format("onClear: could not find object for code %s", v[1]))
            end
        end
    end

    if slot_data == nil  then
        print("welp")
        return
    end

    PLAYER_ID = Archipelago.PlayerNumber or -1
    TEAM_NUMBER = Archipelago.TeamNumber or 0

    if slot_data['randomize_moves'] then
        local obj = Tracker:FindObjectForCode("randomizemoves")
        local stage = slot_data['randomize_moves']
        if stage == 1 then
            obj.CurrentStage = 0
        elseif stage == 0 then
            obj.CurrentStage = 1
        end
    end

    if slot_data['randomize_jinjos'] then
        local obj = Tracker:FindObjectForCode("randomizejinjos")
        local stage = slot_data['randomize_jinjos']
        if stage == 1 then
            obj.CurrentStage = 0
        elseif stage == 0 then
            obj.CurrentStage = 1
        end
    end

    if slot_data['randomize_doubloons'] then
        local obj = Tracker:FindObjectForCode("randomizedoubloons")
        local stage = slot_data['randomize_doubloons']
        if stage == 1 then
            obj.CurrentStage = 1
        elseif stage == 0 then
            obj.CurrentStage = 0
        end
    end

    if slot_data['randomize_cheato'] then
        local obj = Tracker:FindObjectForCode("randomizecheato")
        local stage = slot_data['randomize_cheato']
        if stage == 1 then
            obj.CurrentStage = 0
        elseif stage == 0 then
            obj.CurrentStage = 1
        end
    end

    if slot_data['randomize_honeycombs'] then
        local obj = Tracker:FindObjectForCode("randomizehoneycomb")
        local stage = slot_data['randomize_honeycombs']
        if stage == 1 then
            obj.CurrentStage = 0
        elseif stage == 0 then
            obj.CurrentStage = 1
        end
    end

    if slot_data['randomize_treble'] then
        local obj = Tracker:FindObjectForCode("randomizetrebleclef")
        local stage = slot_data['randomize_treble']
        if stage == 1 then
            obj.CurrentStage = 0
        elseif stage == 0 then
            obj.CurrentStage = 1
        end
    end

    if slot_data['randomize_glowbos'] then
        local obj = Tracker:FindObjectForCode("randomizeglowbos")
        local stage = slot_data['randomize_glowbos']
        if stage == 1 then
            obj.CurrentStage = 0
        elseif stage == 0 then
            obj.CurrentStage = 1
        end
    end

    if slot_data['randomize_stations'] then
        local obj = Tracker:FindObjectForCode("randomizestations")
        local stage = slot_data['randomize_stations']
        if stage == 1 then
            obj.CurrentStage = 1
        elseif stage == 0 then
            obj.CurrentStage = 0
        end
    end

    if slot_data['randomize_chuffy'] then
        local obj = Tracker:FindObjectForCode("randomizechuffy")
        local stage = slot_data['randomize_chuffy']
        if stage == 1 then
            obj.CurrentStage = 1
        elseif stage == 0 then
            obj.CurrentStage = 0
        end
    end

    if slot_data['randomize_notes'] then
        local obj = Tracker:FindObjectForCode("randomizenotes")
        local stage = slot_data['randomize_notes']
        if stage == 1 then
            obj.CurrentStage = 1
        elseif stage == 0 then
            obj.CurrentStage = 0
        end
    end

    if slot_data['randomize_stop_n_swap'] then
        local obj = Tracker:FindObjectForCode("randomizestopnswop")
        local stage = slot_data['randomize_stop_n_swap']
        if stage == 1 then
            obj.CurrentStage = 1
        elseif stage == 0 then
            obj.CurrentStage = 0
        end
    end

    if slot_data['worlds'] then
        local obj = Tracker:FindObjectForCode("randomizeworlds")
        local stage = slot_data['worlds']
        if stage == "true" then
            obj.CurrentStage = 1
        elseif stage == "false" then
            obj.CurrentStage = 0
        end
    end

    if slot_data['speed_up_minigames'] then
        local obj = Tracker:FindObjectForCode("speedupmini")
        local stage = slot_data['speed_up_minigames']
        if stage == 1 then
            obj.CurrentStage = 0
        elseif stage == 0 then
            obj.CurrentStage = 1
        end
    end

    if slot_data['open_hag1'] then
        local obj = Tracker:FindObjectForCode("openhag1")
        local stage = slot_data['open_hag1']
        if stage == 1 then
            obj.CurrentStage = 0
        elseif stage == 0 then
            obj.CurrentStage = 1
        end
    end

    if slot_data['logic_type'] then
        local obj = Tracker:FindObjectForCode("logictype")
        local stage = slot_data['logic_type']
        if obj then
            obj.CurrentStage = stage
        end
    end

    if slot_data['victory_condition'] then
        local obj = Tracker:FindObjectForCode("goal")
        local stage = slot_data['victory_condition']
        if stage then
            obj.CurrentStage = stage
        end
    end

    if slot_data['randomize_bk_moves'] then
        local obj = Tracker:FindObjectForCode("randomizebkmoves")
        local stage = slot_data['randomize_bk_moves']
        if stage then
            if obj.CurrentStage == stage then
                -- we need to manually call toggleBKMoves
                -- because onClear will reset the bk moves to off via item mappings
                -- and "randomizebkmoves" change does not change
                toggleBKMoves()
            else
                obj.CurrentStage = stage
            end
        end
    end

    if slot_data['cheato_rewards'] then
        local obj = Tracker:FindObjectForCode("cheatorewards")
        local stage = slot_data['cheato_rewards']
        if stage == 1 then
            obj.CurrentStage = 0
        elseif stage == 0 then
            obj.CurrentStage = 1
        end
    end

    if slot_data['honeyb_rewards'] then
        local obj = Tracker:FindObjectForCode("honeybrewards")
        local stage = slot_data['honeyb_rewards']
        if stage == 1 then
            obj.CurrentStage = 0
        elseif stage == 0 then
            obj.CurrentStage = 1
        end
    end

    if slot_data['randomize_bk_moves'] ~= 0 and slot_data['worlds'] == "true" then
        local j = 100
        for k,v in pairs(slot_data.world_order) do
            if v < 4 and v < j then
                j = v
                first_level = k
            end
        end
    end

    if slot_data['first_silo'] then
        first_silo = slot_data['first_silo']
    end

    if slot_data['loading_zones'] then
        for k,v in pairs(slot_data.loading_zones) do
            if k == "Mayahem Temple" then
                load_mt = v
            elseif k == "Glitter Gulch Mine" then
                load_ggm = v
            elseif k == "Witchyworld" then
                load_ww = v
            elseif k == "Jolly Roger's Lagoon - Town Center" then
                load_jrl = v
            elseif k == "Terrydactyland" then
                load_tdl = v
            elseif k == "Outside Grunty Industries" then
                load_gi = v
            elseif k == "Hailfire Peaks" then
                load_hfp = v
            elseif k == "Cloud Cuckooland" then
                load_ccl = v
            elseif k == "Cauldron Keep" then
                load_ck = v
            end
        end
    end

    if slot_data['jamjars_siloname_costs'] then
        for k,v in pairs(slot_data.jamjars_siloname_costs) do
            if k == "IoH: Ice Eggs Silo" then
                silo_ieggs = v
            elseif k == "GI Floor 1: Snooze Pack Silo" then
                silo_snpack = v
            elseif k == "HFP: Shack Pack Silo" then
                silo_shpack = v
            elseif k == "IoH: Clockwork Kazooie Eggs Silo" then
                silo_ceggs = v
            elseif k == "MT: Egg Aim Silo" then
                silo_eggaim = v
            elseif k == "JRL: Sub-Aqua Egg Aiming Silo" then
                silo_auqaim = v
            elseif k == "JRL: Talon Torpedo Silo" then
                silo_ttrop = v
            elseif k == "TDL: Hatch Silo" then
                silo_hatch = v
            elseif k == "GGM: Bill Drill Silo" then
                silo_bdrill = v
            elseif k == "IoH: Fire Eggs Silo" then
                silo_feggs = v
            elseif k == "CCL: Sack Pack Silo" then
                silo_sapack = v
            elseif k == "WW: Pack Whack Silo" then
                silo_packwh = v
            elseif k == "GI Floor 1: Claw Clamber Boots Silo" then
                silo_clawbts = v
            elseif k == "WW: Airborne Egg Aiming Silo" then
                silo_aireaim = v
            elseif k == "TDL: Taxi Pack Silo" then
                silo_taxpack = v
            elseif k == "TDL: Springy Step Shoes Silo" then
                silo_springb = v
            elseif k == "MT: Grip Grab Silo" then
                silo_ggrab = v
            elseif k == "HFP: Glide Silo" then
                silo_glide = v
            elseif k == "WW: Split Up Silo" then
                silo_splitup = v
            elseif k == "JRL: Wing Whack Silo" then
                silo_wwhack = v
            elseif k == "IoH: Grenade Eggs Silo" then
                silo_geggs = v
            elseif k == "GI Floor 2: Leg Spring Silo" then
                silo_lspring = v
            elseif k == "GGM: Beak Bayonet Silo" then
                silo_bbayonet = v
            elseif k == "MT: Breegull Blaster Silo" then
                silo_bblaster = v
            end
        end
    end

    if slot_data['backdoors'] then
        local obj = Tracker:FindObjectForCode("backdoorsopen")
        local stage = slot_data['backdoors']
        if stage == 1 then
            obj.CurrentStage = 1
        else
            obj.CurrentStage = 0
        end
    end

    if slot_data['nestsanity'] then
        local obj = Tracker:FindObjectForCode("nestsanity")
        local stage = slot_data['nestsanity']
        if stage == 1 then
            obj.CurrentStage = 1
        else
            obj.CurrentStage = 0
        end
    end

    if slot_data['randomize_signposts'] then
        local obj = Tracker:FindObjectForCode("signposts")
        local stage = slot_data['randomize_signposts']
        if stage == 1 then
            obj.CurrentStage = 1
        else
            obj.CurrentStage = 0
        end
    end

    if slot_data['boss_hunt_length'] then
        local count = slot_data['boss_hunt_length']
        bosshuntlength = count
    end

    --print("MT: "..load_mt)
    --print("GGM: "..load_ggm)
    --print("WW: "..load_ww)
    --print("JRL: "..load_jrl)
    --print("TDL: "..load_tdl)
    --print("GI: "..load_gi)
    --print("HFP: "..load_hfp)
    --print("CCL: "..load_ccl)
    --print("CK: "..load_ck)
    --print("Grip Grab Silo: "..silo_ggrab)
    print(dump_table(slot_data))

    if PLAYER_ID > -1 then
    
        HINTS_ID = "_read_hints_"..TEAM_NUMBER.."_"..PLAYER_ID
        Archipelago:SetNotify({HINTS_ID})

        map_key = "Banjo_Tooie_"..TEAM_NUMBER.."_"..PLAYER_ID.."_map"
        Archipelago:SetNotify({map_key})
        Archipelago:Get({map_key})
    end

    --banjo_map = 
    --print(banjo_map)
end

function onItem(index, item_id, item_name, player_number)
    if index <= CUR_INDEX then
        return
    end
    local is_local = player_number == Archipelago.PlayerNumber
    CUR_INDEX = index;
    local v = ITEM_MAPPING[item_id]
    if not v or not v[1] then
        --print(string.format("onItem: could not find item mapping for id %s", item_id))
        return
    end
    local obj = Tracker:FindObjectForCode(v[1])
    if obj then
        if v[2] == "toggle" then
            obj.Active = true
        elseif v[2] == "progressive" then
            if obj.Active then
                obj.CurrentStage = obj.CurrentStage + 1
            else
                obj.Active = true
            end
        elseif v[2] == "consumable" then
            obj.AcquiredCount = obj.AcquiredCount + obj.Increment
        elseif AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
            print(string.format("onItem: unknown item type %s for code %s", v[2], v[1]))
        end
    else
        print(string.format("onItem: could not find object for code %s", v[1]))
    end
end

--called when a location gets cleared
function onLocation(location_id, location_name)
    local v = LOCATION_MAPPING[location_id]
    if not v or not v[1] then
        print(string.format("onLocation: could not find location mapping for id %s", location_id))
        return
    end
    for _, location in pairs(v) do
        local obj = Tracker:FindObjectForCode(location)
        -- print(location, obj)
        if obj then
            if location:sub(1, 1) == "@" then
                obj.AvailableChestCount = obj.AvailableChestCount - 1
            else
                obj.Active = true
            end
        else
            print(string.format("onLocation: could not find object for code %s", location))
        end
    end
end

function onNotify(key, value, old_value)

    if value ~= old_value and key == HINTS_ID then
        for _, hint in ipairs(value) do
            if not hint.found and hint.finding_player == Archipelago.PlayerNumber then
                updateHints(hint.location)
            end
        end
    end
end

function onNotifyLaunch(key, value)
    Tracker.BulkUpdate = false
    if key == HINTS_ID then
        for _, hint in ipairs(value) do
            if not hint.found and hint.finding_player == Archipelago.PlayerNumber then
                updateHints(hint.location)
            end
        end
    end
end

function updateHints(locationID)
    local item_codes = HINTS_MAPPING[locationID]

    for _, item_code in ipairs(item_codes) do
        local obj = Tracker:FindObjectForCode(item_code)
        if obj then
            obj.Active = true
        else
            print(string.format("No object found for code: %s", item_code))
        end
    end
end

function onMapChange(key, value, old)
    --print("got  " .. key .. " = " .. tostring(value) .. " (was " .. tostring(old) .. ")")
    --print(dump_table(MAP_MAPPING[tostring(value)]))
    if has("automap_on") then
        tabs = MAP_MAPPING[tostring(value)]
        for i, tab in ipairs(tabs) do
            Tracker:UiHint("ActivateTab", tab)
        end
    end
end

Archipelago:AddClearHandler("clear handler", onClear)
Archipelago:AddItemHandler("item handler", onItem)
Archipelago:AddLocationHandler("location handler", onLocation)
Archipelago:AddSetReplyHandler("notify handler", onNotify)
Archipelago:AddRetrievedHandler("notify launch handler", onNotifyLaunch)
Archipelago:AddSetReplyHandler("map_key", onMapChange)
Archipelago:AddRetrievedHandler("map_key", onMapChange)
