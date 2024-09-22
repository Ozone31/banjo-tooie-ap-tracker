ScriptHost:LoadScript("scripts/autotracking/item_mapping.lua")
ScriptHost:LoadScript("scripts/autotracking/location_mapping.lua")
ScriptHost:LoadScript("scripts/autotracking/hints_mapping.lua")
ScriptHost:LoadScript("scripts/autotracking/map_mapping.lua")

CUR_INDEX = -1
--SLOT_DATA = nil

FLAG_CODES = {
    HAG1
}

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

    if slot_data['moves'] then
        local obj = Tracker:FindObjectForCode("randomizemoves")
        local stage = slot_data['moves']
        if stage == "true" then
            obj.CurrentStage = 0
        elseif stage == "false" then
            obj.CurrentStage = 1
        end
    end

    if slot_data['jinjo'] then
        local obj = Tracker:FindObjectForCode("randomizejinjos")
        local stage = slot_data['jinjo']
        if stage == "true" then
            obj.CurrentStage = 0
        elseif stage == "false" then
            obj.CurrentStage = 1
        end
    end

    if slot_data['doubloons'] then
        local obj = Tracker:FindObjectForCode("randomizedoubloons")
        local stage = slot_data['doubloons']
        if stage == "true" then
            obj.CurrentStage = 1
        elseif stage == "false" then
            obj.CurrentStage = 0
        end
    end

    if slot_data['pages'] then
        local obj = Tracker:FindObjectForCode("randomizecheato")
        local stage = slot_data['pages']
        if stage == "true" then
            obj.CurrentStage = 0
        elseif stage == "false" then
            obj.CurrentStage = 1
        end
    end

    if slot_data['honeycomb'] then
        local obj = Tracker:FindObjectForCode("randomizehoneycomb")
        local stage = slot_data['honeycomb']
        if stage == "true" then
            obj.CurrentStage = 0
        elseif stage == "false" then
            obj.CurrentStage = 1
        end
    end

    if slot_data['trebleclef'] then
        local obj = Tracker:FindObjectForCode("randomizetrebleclef")
        local stage = slot_data['trebleclef']
        if stage == "true" then
            obj.CurrentStage = 0
        elseif stage == "false" then
            obj.CurrentStage = 1
        end
    end

    if slot_data['magic'] then
        local obj = Tracker:FindObjectForCode("randomizeglowbos")
        local stage = slot_data['magic']
        if stage == "true" then
            obj.CurrentStage = 0
        elseif stage == "false" then
            obj.CurrentStage = 1
        end
    end

    if slot_data['stations'] then
        local obj = Tracker:FindObjectForCode("randomizestations")
        local stage = slot_data['stations']
        if stage == "true" then
            obj.CurrentStage = 1
        elseif stage == "false" then
            obj.CurrentStage = 0
        end
    end

    if slot_data['chuffy'] then
        local obj = Tracker:FindObjectForCode("randomizechuffy")
        local stage = slot_data['chuffy']
        if stage == "true" then
            obj.CurrentStage = 1
        elseif stage == "false" then
            obj.CurrentStage = 0
        end
    end

    if slot_data['notes'] then
        local obj = Tracker:FindObjectForCode("randomizenotes")
        local stage = slot_data['notes']
        if stage == "true" then
            obj.CurrentStage = 1
        elseif stage == "false" then
            obj.CurrentStage = 0
        end
    end

    if slot_data['mystery'] then
        local obj = Tracker:FindObjectForCode("randomizestopnswop")
        local stage = slot_data['mystery']
        if stage == "true" then
            obj.CurrentStage = 1
        elseif stage == "false" then
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

    if slot_data['minigames'] then
        local obj = Tracker:FindObjectForCode("speedupmini")
        local stage = slot_data['minigames']
        if stage == "true" then
            obj.CurrentStage = 0
        elseif stage == "false" then
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

    if slot_data['goal_type'] then
        local obj = Tracker:FindObjectForCode("goal")
        local stage = slot_data['goal_type']
        if stage then
            obj.CurrentStage = stage
        end
    end

    if slot_data['bk_moves'] then
        local obj = Tracker:FindObjectForCode("randomizebkmoves")
        local stage = slot_data['bk_moves']
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
        if stage == "true" then
            obj.CurrentStage = 0
        elseif stage == "false" then
            obj.CurrentStage = 1
        end
    end

    if slot_data['honeyb_rewards'] then
        local obj = Tracker:FindObjectForCode("honeybrewards")
        local stage = slot_data['honeyb_rewards']
        if stage == "true" then
            obj.CurrentStage = 0
        elseif stage == "false" then
            obj.CurrentStage = 1
        end
    end

    if slot_data['bk_moves'] ~= 0 and slot_data['worlds'] == "true" then
        local j = 100
        for k,v in pairs(slot_data.world_order) do
            if v < 4 and v < j then
                j = v
                first_level = k
            end
        end
    end

    --print(dump_table(slot_data))

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
