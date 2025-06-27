--------------- Witchyworld

----- Basic & Access functions

function access_WW_canOpenSaucerDoor(skip)
    local logic = 99
    --[[        saucer_door_open
    if self.world.options.logic_type == LogicType.option_intended:
        return self.longJumpToGripGrab(state) and self.flap_flip(state) and self.climb(state)\
              and (self.has_explosives(state) or self.beak_barge(state)) or\
              self.backdoors_enabled(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        return (self.longJumpToGripGrab(state) and self.flap_flip(state) and self.climb(state) and (self.has_explosives(state) or self.beak_barge(state)))\
            or (self.egg_aim(state) and self.grenade_eggs(state) and self.amaze_o_gaze(state) and self.climb(state))\
            or (self.has_explosives(state) and self.leg_spring(state) and self.glide(state))\
            or self.backdoors_enabled(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        return (self.longJumpToGripGrab(state) and self.flap_flip(state) and self.climb(state) and (self.has_explosives(state) or self.beak_barge(state)))\
            or (self.egg_aim(state) and self.grenade_eggs(state) and self.amaze_o_gaze(state))\
            or (self.has_explosives(state) and self.leg_spring(state) and self.glide(state))\
            or self.backdoors_enabled(state)\
            or self.clockwork_shot(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        return (self.longJumpToGripGrab(state) and self.flap_flip(state) and self.climb(state) and (self.has_explosives(state) or self.beak_barge(state)))\
            or (self.egg_aim(state) and self.grenade_eggs(state) and self.amaze_o_gaze(state))\
            or (self.has_explosives(state) and self.leg_spring(state) and self.glide(state))\
            or self.backdoors_enabled(state)\
            or self.clockwork_shot(state)\
            or (state.can_reach_region(regionName.GM, self.player) and self.humbaGGM(state) and self.small_elevation(state) and self.clockwork_eggs(state)) # You can shoot a clockwork through the door from GGM.
    --]]
    
    -- Normal Logic
    if (has("backdoorsopen_on") ) then
        logic = 0
    else
        local explosives = can_shootExplosiveEggs(true)
    
        if ( can_longJumpToGripGrab() and has("fflip") and has("climb") and (has("bbarge") or explosives <= logictype.CurrentStage) ) then
            logic = 0
        elseif ( has("eggaim") and has("geggs") and has("amazeogaze") and has("climb") or has_legSpring() and has_glide() and explosives <= logictype.CurrentStage ) then
            logic = 1
        elseif ( can_longJumpToGripGrab() and has("fflip") and has("climb") and explosives < 2 ) then
            logic = explosives -- Sequence Breaking
        elseif ( can_clockworkShot() ) then
            logic = 2
        else
            local ggmAccessibility = Tracker:FindObjectForCode("@Region: Glitter Gulch Mine - Main Area").AccessibilityLevel
            local humba = access_GGM_humba(true)
            
            if ( (ggmAccessibility == AccessibilityLevel.Normal or ggmAccessibility == AccessibilityLevel.Cleared) and humba <= logictype.CurrentStage and can_reachSmallElevation() and can_shootEggs("ceggs") ) then
                logic = 3
                
            -- Sequence Breaking
            else
                local withExplosives = 99
                if ( can_longJumpToGripGrab() and has("fflip") and has("climb") or has_legSpring() and has_glide() ) then
                    withExplosives = explosives
                end
                
                local withHumba = 99
                if ( (ggmAccessibility == AccessibilityLevel.Normal or ggmAccessibility == AccessibilityLevel.Cleared) and can_reachSmallElevation() and can_shootEggs("ceggs") ) then
                    withHumba = humba
                elseif ( ggmAccessibility > AccessibilityLevel.None and can_reachSmallElevation() and can_shootEggs("ceggs") ) then
                    withHumba = math.max(humba, logictype.CurrentStage + 1)
                end
                
                logic = math.max(3, math.min(withExplosives, withHumba))
            end
        end
    end
    
    return convertLogic(logic, skip)
end

function access_WW_warpToHumba(skip)
    local logic = 99
    --[[        warp_to_ww_wumba
    return state.has(itemName.WARPWW4, self.player) and (
            state.has(itemName.WARPWW1, self.player)\
            or state.has(itemName.WARPWW2, self.player)\
            or state.has(itemName.WARPWW3, self.player)\
            or state.has(itemName.WARPWW5, self.player) and state.can_reach_region(regionName.WWI, self.player)\
        )
    --]]

    local wwiAccessibility = Tracker:FindObjectForCode("@Region: Witchyworld - The Inferno").AccessibilityLevel
    
    if ( has("warpww4") ) then  
        -- Normal Logic
        if ( has("warpww1") or has("warpww2") or has("warpww3") or (wwiAccessibility == AccessibilityLevel.Normal or wwiAccessibility == AccessibilityLevel.Cleared) and has("warpww5") ) then
            logic = 0
    
        -- Sequence Breaking
        elseif ( wwiAccessibility > AccessibilityLevel.None and has("warpww5") ) then
            logic = logictype.CurrentStage + 1 -- was already converted once by the json
        end
    end

    return convertLogic(logic, skip)
end

function access_WW_warpToInferno(skip)
    local logic = 99
    --[[        warp_to_inferno
    return state.has(itemName.WARPWW5, self.player) and (
            state.has(itemName.WARPWW1, self.player)\
            or state.has(itemName.WARPWW2, self.player)\
            or state.has(itemName.WARPWW3, self.player)\
            or state.has(itemName.WARPWW4, self.player) and state.can_reach_location(locationName.WARPWW4, self.player)\
        )
    --]]
    
    local humbaWarp = warp_WW_humba(true)
    
    if ( has("warpww5") ) then
        -- Normal Logic
        if ( has("warpww1") or has("warpww2") or has("warpww3") or has("warpww4") and humbaWarp <= logictype.CurrentStage ) then
            logic = 0
            
        -- Sequence Breaking
        elseif ( has("warpww4") ) then
            logic = humbaWarp
        end
    end

    return convertLogic(logic, skip)
end

function access_WW_glitchIntoInferno(skip)
    local logic = 99
    --[[        glitchedInfernoAccess
    self.humbaWW(state) or self.clockwork_eggs(state) and self.tall_jump(state)
    --]]

    local wwHumba = access_WW_humba(true)
    
    -- Normal Logic
    if ( can_shootEggs("ceggs") and has("tjump") or wwHumba <= logictype.CurrentStage ) then
        logic = 0
        
    -- Sequence Breaking
    else
        logic = wwHumba
    end

    return convertLogic(logic, skip)
end

function access_WW_humba(skip)
    local logic = 99
    --[[        humbaWW
    if self.world.options.logic_type == LogicType.option_intended:
        logic = state.has(itemName.HUMBAWW, self.player) and (
                    self.flap_flip(state) and self.grip_grab(state)\
                    or self.warp_to_ww_wumba(state)
                )
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = state.has(itemName.HUMBAWW, self.player) and (
                    self.flap_flip(state) and self.grip_grab(state) \
                    or self.climb(state) and self.veryLongJump(state) and self.flap_flip(state)\
                    or self.warp_to_ww_wumba(state)
                )
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = state.has(itemName.HUMBAWW, self.player) and (
                    self.flap_flip(state) and self.grip_grab(state) \
                    or self.climb(state) and self.veryLongJump(state) and self.flap_flip(state)\
                    or self.warp_to_ww_wumba(state)
                )
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = state.has(itemName.HUMBAWW, self.player) and (
                    self.flap_flip(state) and self.grip_grab(state) \
                    or self.climb(state) and self.veryLongJump(state) and self.flap_flip(state)\
                    or self.warp_to_ww_wumba(state)
                )
    --]]
    
    if ( has("humbaww") ) then
        local warpToHumba = access_WW_warpToHumba(true)
    
        -- Normal Logic
        if ( has("fflip") and has("ggrab") or warpToHumba <= logictype.CurrentStage) then
            logic = 0
        elseif ( has("climb") and can_veryLongJump() and has("fflip")) then
            logic = 1
    
        -- Sequence Breaking
        else
            logic = warpToHumba
        end
    end
    
    return convertLogic(logic, skip)
end

function access_WW_mumbo(skip)
    local logic = 99
    --[[        mumboWW
    if self.world.options.logic_type == LogicType.option_intended:
        logic = state.can_reach_region(regionName.WWI, self.player) and state.has(itemName.MUMBOWW, self.player)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = state.can_reach_region(regionName.WWI, self.player) and state.has(itemName.MUMBOWW, self.player)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = state.can_reach_region(regionName.WWI, self.player) and state.has(itemName.MUMBOWW, self.player)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = state.can_reach_region(regionName.WWI, self.player) and state.has(itemName.MUMBOWW, self.player)\
                and self.escape_inferno_as_mumbo(state)                             -- this extra requirement is here because you can glitch into inferno. this isn't really great for readability and messes with my logic, so I'll adjust for it below
                
    return self.humbaWW(state)\
        or state.has(itemName.WARPWW5, self.player) and (
            state.has(itemName.WARPWW1, self.player)\
            or state.has(itemName.WARPWW2, self.player)\
            or state.has(itemName.WARPWW3, self.player)\
            or state.has(itemName.WARPWW4, self.player)
        )
     --]]
    
    local humba = access_WW_humba(true)
    local infernoAccess = connector_WW_to_WWInferno(true)
    
    -- Normal Logic
    if ( has("mumboww") and infernoAccess <= logictype.CurrentStage and (humba <= logictype.CurrentStage or has("warpww5") and (has("warpww1") or has("warpww2") or has("warpww3") or has("warpww4"))) ) then
        logic = 0
    
    -- Sequence Breaking
    elseif ( has("mumboww") ) then
        local warps = 99
        if ( has("warpww5") and (has("warpww1") or has("warpww2") or has("warpww3") or has("warpww4")) ) then
            warps = 0
        end
        
        logic = math.max(infernoAccess, math.min(warps, humba))
    end
    
    return convertLogic(logic, skip)
end

----- Silos

function silo_WW_airborneEggAiming(skip)
    local logic = 99
    --[[
    self.check_notes(state, locationName.AIREAIM)
    --]]
    
    if ( aireaim_count() ) then
        logic = 0
    end
    
    return convertLogic(logic, skip)
end

function silo_WW_splitUp(skip)
    local logic = 99
    --[[
    self.check_notes(state, locationName.SPLITUP)
    --]]
    
    if ( splitup_count() ) then
        logic = 0
    end
    
    return convertLogic(logic, skip)
end

function silo_WW_packWhack(skip)
    local logic = 99
    --[[
    self.split_up(state) and self.check_notes(state, locationName.PACKWH)
    --]]
    
    if ( has("splitup") and packwh_count() ) then
        logic = 0
    end
    
    return convertLogic(logic, skip)
end

----- Warp Pads

function warp_WW_humba(skip)
    local logic = 99
    --[[        warp_pad_ww_wumba
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.flap_flip(state) and self.grip_grab(state)\
                or self.warp_to_ww_wumba(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.flap_flip(state)\
                    and ((self.flap_flip(state) and self.grip_grab(state)) \
                        or (self.climb(state) and self.veryLongJump(state)))\
                or self.warp_to_ww_wumba(state)\
                or self.leg_spring(state)\
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.flap_flip(state) and self.grip_grab(state) \
                or self.climb(state) and self.veryLongJump(state) and self.flap_flip(state)\
                or self.clockwork_shot(state) and self.climb(state)\
                or self.leg_spring(state)\
                or self.warp_to_ww_wumba(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.flap_flip(state) and self.grip_grab(state) \
                or self.climb(state) and self.veryLongJump(state) and self.flap_flip(state)\
                or self.clockwork_shot(state) and self.climb(state)\
                or self.leg_spring(state)\
                or self.warp_to_ww_wumba(state)
    --]]
    
    local warpToHumba = access_WW_warpToHumba(true)
    
    -- Normal Logic
    if ( has("fflip") and has("ggrab") or warpToHumba <= logictype.CurrentStage) then
        logic = 0
    elseif ( has("fflip") and has("climb") and can_veryLongJump() or warpToHumba < 2 or has_legSpring()) then
        logic = 1
    elseif ( has("climb") and can_clockworkShot() or warpToHumba < 3) then
        logic = 2

    -- Sequence Breaking
    else
        logic = warpToHumba
    end

    return convertLogic(logic, skip)
end

----- Jiggies

function jiggy_WW_hoopHurry(skip)
    local logic = 99
    --[[        jiggy_hoop_hurry
     if self.world.options.logic_type == LogicType.option_intended:
        logic = self.split_up(state) and self.has_explosives(state) and self.turbo_trainers(state)\
            and self.spring_pad(state) and (self.flap_flip(state) or self.leg_spring(state))
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.split_up(state) and self.has_explosives(state)\
            and (self.leg_spring(state) or self.tall_jump(state))\
            and (self.spring_pad(state) or self.flap_flip(state) or self.leg_spring(state))
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.split_up(state) and self.has_explosives(state)\
            and (self.leg_spring(state) or self.tall_jump(state))\
            and (self.spring_pad(state) or self.flap_flip(state) or self.leg_spring(state))
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.split_up(state) and self.has_explosives(state)\
            and (self.leg_spring(state) or self.tall_jump(state))\
            and (self.spring_pad(state) or self.flap_flip(state) or self.leg_spring(state))
    --]]
    
    local explosives = can_shootExplosiveEggs(true)
    
    -- Normal Logic
    if ( has("splitup") and explosives <= logictype.CurrentStage and has("ttrain") and has("tjump") and (has("fflip") or has_legSpring()) ) then
        logic = 0
    elseif ( has("splitup") and explosives <= logictype.CurrentStage and (has("tjump") or has_legSpring()) ) then
        logic = 1
    
    -- Sequence Breaking
    elseif ( has("splitup") and (has("tjump") or has_legSpring()) ) then
        logic = math.max(1, explosives)
    end
    
    return convertLogic(logic, skip)
end

function jiggy_WW_dodgem(skip)
    local logic = 99
    --[[        jiggy_dodgem
     if self.world.options.logic_type == LogicType.option_intended:
        logic = self.mumboWW(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.mumboWW(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.mumboWW(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.mumboWW(state) and self.escape_inferno_as_mumbo(state)         -- should be irrelevant? mumboWW already checks for escaping
     --]]
    
    logic = access_WW_mumbo(true)
    
    return convertLogic(logic, skip)
end

function jiggy_WW_mrPatch(skip)
    local logic = 99
    --[[        jiggy_patches
     if self.world.options.logic_type == LogicType.option_intended:
        logic = self.airborne_egg_aiming(state) and self.egg_aim(state) and \
                self.grenade_eggs(state) and self.flight_pad(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.airborne_egg_aiming(state) and self.egg_aim(state) and \
                self.grenade_eggs(state) and self.flight_pad(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.airborne_egg_aiming(state) and self.egg_aim(state) and \
                self.grenade_eggs(state) and self.flight_pad(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.airborne_egg_aiming(state) and self.egg_aim(state) and \
                self.grenade_eggs(state) and self.flight_pad(state)
    --]]
    
    if ( has("aireaim") and has("eggaim") and has("geggs") and has("fpad") ) then
        logic = 0
    end
    
    return convertLogic(logic, skip)
end

function jiggy_WW_saucerOfPeril(skip)
    local logic = 99
    --[[        jiggy_peril
     if self.world.options.logic_type == LogicType.option_intended:
        logic = self.humbaGGM(state) and \
                self.mumboWW(state) and \
                self.saucer_door_open(state) and \  
                self.can_reach_saucer(state) and\                   -- (self.longJumpToGripGrab(state) and self.flap_flip(state) and self.climb(state)) or (state.can_reach_region(regionName.GM, self.player) and self.small_elevation(state))
                state.can_reach_region(regionName.GM, self.player) and self.has_explosives(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.humbaGGM(state) and \
                self.mumboWW(state) and \
                self.saucer_door_open(state) and state.can_reach_region(regionName.GM, self.player) and \
                self.can_reach_saucer(state) and\
                self.has_explosives(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.humbaGGM(state) and \
                self.mumboWW(state) and \
                self.saucer_door_open(state) and state.can_reach_region(regionName.GM, self.player) and \
                self.can_reach_saucer(state) and\
                self.has_explosives(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.humbaGGM(state) and \
                self.mumboWW(state) and \
                self.saucer_door_open(state) and state.can_reach_region(regionName.GM, self.player) and \
                self.can_reach_saucer(state) and\
                self.has_explosives(state)
    --]]
    
    local ggmAccessibility = Tracker:FindObjectForCode("@Region: Glitter Gulch Mine - Main Area").AccessibilityLevel
    local humbaGGM = access_GGM_humba(true)
    local mumboWW = access_WW_mumbo(true)
    local saucerDoor = access_WW_canOpenSaucerDoor(true)
    local explosives = can_shootExplosiveEggs(true)
    
    -- Normal Logic
    if ( (ggmAccessibility == AccessibilityLevel.Normal or ggmAccessibility == AccessibilityLevel.Cleared) and humbaGGM <= logictype.CurrentStage and mumboWW <= logictype.CurrentStage and saucerDoor <= logictype.CurrentStage and explosives <= logictype.CurrentStage and can_reachSmallElevation() ) then -- only small elevation is needed from the can_reach_saucer function, because you're guaranteed to have GGM access for the rest of this and the other side of the if statement requires fflip anyway
        logic = 0
    
    -- Sequence Breaking
    elseif ( (ggmAccessibility == AccessibilityLevel.Normal or ggmAccessibility == AccessibilityLevel.Cleared) and can_reachSmallElevation() ) then
        logic = math.max(humbaGGM, mumboWW, saucerDoor, explosives)
    elseif ( ggmAccessibility > AccessibilityLevel.None and can_reachSmallElevation() ) then
        logic = math.max(humbaGGM, mumboWW, saucerDoor, explosives, logictype.CurrentStage + 1)
    end
    
    return convertLogic(logic, skip)
end

function jiggy_WW_balloonBurst(skip)
    local logic = 99
    --[[        jiggy_balloon_burst
     if self.world.options.logic_type == LogicType.option_intended:
        logic = self.split_up(state) and self.has_explosives(state) and self.airborne_egg_aiming(state)\
            and self.spring_pad(state) and (self.flap_flip(state) or self.leg_spring(state))
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.split_up(state) and self.has_explosives(state) and self.airborne_egg_aiming(state)\
            and (self.leg_spring(state) or self.tall_jump(state))\
            and (self.spring_pad(state) or self.flap_flip(state) or self.leg_spring(state))
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.split_up(state) and self.has_explosives(state) and self.airborne_egg_aiming(state)\
            and (self.leg_spring(state) or self.tall_jump(state))\
            and (self.spring_pad(state) or self.flap_flip(state) or self.leg_spring(state))
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.split_up(state) and self.has_explosives(state) and self.airborne_egg_aiming(state)\
            and (self.leg_spring(state) or self.tall_jump(state))\
            and (self.spring_pad(state) or self.flap_flip(state) or self.leg_spring(state))
    --]]
    
    local explosives = can_shootExplosiveEggs(true)
    
    -- Normal Logic
    if ( has("splitup") and explosives <= logictype.CurrentStage and has("aireaim") and has("tjump") and (has("fflip") or has_legSpring()) ) then
        logic = 0
    elseif ( has("splitup") and explosives <= logictype.CurrentStage and has("aireaim") and (has("tjump") or has_legSpring()) ) then
        logic = 1
    
    -- Sequence Breaking
    elseif ( has("splitup") and has("aireaim") and (has("tjump") or has_legSpring()) ) then
        logic = math.max(1, explosives)
    end
    
    return convertLogic(logic, skip)
end

function jiggy_WW_diveOfDeath(skip)
    local logic = 99
    --[[        jiggy_dive_of_death
     if self.world.options.logic_type == LogicType.option_intended:
        logic = self.grip_grab(state) and self.climb(state) and self.flap_flip(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.climb(state) and (self.flap_flip(state) or self.talon_trot(state) or (\
            self.tall_jump(state) and (self.beak_buster(state) or self.air_rat_a_tat_rap(state))))
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.climb(state) and (self.flap_flip(state) or self.talon_trot(state) or self.clockwork_shot(state) or (\
            self.tall_jump(state) and (self.beak_buster(state) or self.air_rat_a_tat_rap(state))))
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.climb(state) and (self.flap_flip(state) or self.talon_trot(state) or self.clockwork_shot(state) or (\
            self.tall_jump(state) and (self.beak_buster(state) or self.air_rat_a_tat_rap(state))))
    --]]
    
    if ( has("ggrab") and has("climb") and has("fflip") ) then
        logic = 0
    elseif ( has("climb") and (has("fflip") or has("ttrot") or has("tjump") and (has("bbust") or has("arat"))) ) then
        logic = 1
    elseif ( logictype.CurrentStage > 1 and has("climb") and can_clockworkShot() ) then
        logic = 2
    end
    
    return convertLogic(logic, skip)
end

function jiggy_WW_mrsBoggy(skip)
    local logic = 99
    --[[        jiggy_mrs_boggy
     if self.world.options.logic_type == LogicType.option_intended:
        logic = self.moggy(state) and self.soggy(state) and self.groggy(state)

    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.moggy(state) and self.soggy(state) and self.groggy(state)

    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.moggy(state) and self.soggy(state) and self.groggy(state)

    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.moggy(state) and self.soggy(state) and self.groggy(state)
    --]]
    
    local moggy = other_WW_moggy(true)
    local soggy = other_WW_soggy(true)
    local groggy = other_WW_groggy(true)
    
    -- Normal Logic
    if ( moggy <= logictype.CurrentStage and soggy <= logictype.CurrentStage and groggy <= logictype.CurrentStage ) then
        logic = 0
    
    -- Sequence Breaking
    else
        logic = math.max(moggy, soggy, groggy)
    end
    
    return convertLogic(logic, skip)
end

function jiggy_WW_starSpinner(skip)
    local logic = 99
    --[[        jiggy_star_spinner
     if self.world.options.logic_type == LogicType.option_intended:
        logic = self.mumboWW(state) and self.talon_trot(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.mumboWW(state) and (
                    self.talon_trot(state)\
                    or self.leg_spring(state)\
                    or self.turbo_trainers(state)
                )
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.mumboWW(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.mumboWW(state)
     --]]
    
    local mumbo = access_WW_mumbo(true)
    
    -- Normal Logic
    if ( has("ttrot") and mumbo <= logictype.CurrentStage ) then
        logic = 0
    elseif ( (has_legSpring() or has("ttrain")) and mumbo <= logictype.CurrentStage ) then
        logic = 1
    elseif ( mumbo <= logictype.CurrentStage ) then
        logic = 2
    
    -- Sequence Breaking
    else
        logic = math.max(2, mumbo)
    end
    
    return convertLogic(logic, skip)
end

function jiggy_WW_topOfInferno(skip)
    local logic = 99
    --[[        jiggy_inferno
     if self.world.options.logic_type == LogicType.option_intended:
        logic = self.split_up(state) and self.tall_jump(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.split_up(state) and (self.tall_jump(state) or self.leg_spring(state))\
                or self.flap_flip(state) and (self.talon_trot(state) or self.turbo_trainers(state))
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.split_up(state) and (self.tall_jump(state) or self.leg_spring(state))\
                or self.flap_flip(state) and (self.talon_trot(state) or self.turbo_trainers(state))
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.split_up(state) and (self.tall_jump(state) or self.leg_spring(state))\
                or self.flap_flip(state) and (self.talon_trot(state) or self.turbo_trainers(state))
     --]]
    
    if ( has("splitup") and has("tjump") ) then
        logic = 0
    elseif ( has_legSpring() or has("fflip") and (has("ttrot") or has("ttrain")) ) then
        logic = 1
    elseif ( has("splitup") ) then
        logic = 7
    end
    
    return convertLogic(logic, skip)
end

function jiggy_WW_cactusOfStrength(skip)
    local logic = 99
    --[[        jiggy_cactus
     if self.world.options.logic_type == LogicType.option_intended:
        logic = self.bill_drill(state) and self.grenade_eggs(state)\
              and self.beak_buster(state) and self.climb(state)         -- beak buster is required for bill drill
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.bill_drill(state) and self.grenade_eggs(state)\
              and self.beak_buster(state) and\
                (self.climb(state) or self.leg_spring(state) and self.glide(state))
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.bill_drill(state) and self.grenade_eggs(state)\
              and self.beak_buster(state) and\
                (self.clockwork_shot(state) or self.climb(state) or self.leg_spring(state) and self.glide(state))
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.bill_drill(state) and self.grenade_eggs(state)\
              and self.beak_buster(state) and\
                (self.clockwork_shot(state) or self.climb(state) or self.leg_spring(state) and self.glide(state))
    --]]
    
    if ( has_billDrill() and can_shootEggs("geggs") and has("climb") ) then
        logic = 0
    elseif ( has_billDrill() and can_shootEggs("geggs") and has_legSpring() and has_glide() ) then
        logic = 1
    elseif ( has_billDrill() and can_shootEggs("geggs") and can_clockworkShot() ) then
        logic = 2
    end
    
    return convertLogic(logic, skip)
end

----- Notes

function treble_WW(skip)
    local logic = 99
    --[[        treble_ww
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.humbaWW(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.humbaWW(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.humbaWW(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.humbaWW(state) or self.clockwork_eggs(state)
    --]]
    
    local humba = access_WW_humba(true)
    
    if ( humba <= logictype.CurrentStage ) then
        logic = 0 -- Normal Logic
    elseif ( humba < 3 ) then
        logic = humba -- Sequence Breaking
    elseif ( can_shootEggs("ceggs") ) then
        logic = 3 -- Normal Logic
    
    -- Sequence Breaking
    else
        logic = humba
    end
    
    return convertLogic(logic, skip)
end

function notes_WW_area51OnFencePostLeft(skip)
    local logic = 99
    --[[        notes_ww_area51_left
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.has_explosives(state) and self.spring_pad(state) and self.long_jump(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.has_explosives(state) and self.spring_pad(state) and self.long_jump(state)\
                or self.leg_spring(state)\
                or self.glide(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.has_explosives(state) and self.spring_pad(state) and self.long_jump(state)\
                or self.split_up(state) and self.spring_pad(state)\
                or self.leg_spring(state)\
                or self.clockwork_shot(state)\
                or self.glide(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.has_explosives(state) and self.spring_pad(state) and self.long_jump(state)\
                or self.split_up(state) and self.spring_pad(state)\
                or self.leg_spring(state)\
                or self.clockwork_shot(state)\
                or self.glide(state)
    --]]
    
    local explosives = can_shootExplosiveEggs(true)
    
    -- Normal Logic
    if ( explosives <= logictype.CurrentStage and has("tjump") and can_longJump() ) then
        logic = 0
    elseif ( can_legSpring() or can_glide() ) then
        logic = 1
    elseif ( has("tjump") and can_longJump() and explosives < 2 ) then
        logic = 1 -- Sequence Breaking
    elseif ( has("splitup") and has("tjump") or can_clockworkShot() ) then
        logic = 2
    
    -- Sequence Breaking
    elseif ( has("tjump") and can_longJump() ) then
        logic = explosives
    end
    
    return convertLogic(logic, skip)
end

function notes_WW_area51OnFencePostRight(skip)
    local logic = 99
    --[[        notes_ww_area51_right
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.has_explosives(state) and self.spring_pad(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.has_explosives(state) and self.spring_pad(state)\
                or self.leg_spring(state)\
                or self.glide(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = ((self.has_explosives(state) or self.split_up(state)) and self.spring_pad(state))\
                or self.leg_spring(state)\
                or self.clockwork_shot(state)\
                or self.glide(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = ((self.has_explosives(state) or self.split_up(state)) and self.spring_pad(state))\
                or self.leg_spring(state)\
                or self.clockwork_shot(state)\
                or self.glide(state)
    --]]
    
    local explosives = can_shootExplosiveEggs(true)
    
    -- Normal Logic
    if ( explosives <= logictype.CurrentStage and has("tjump") ) then
        logic = 0
    elseif ( can_legSpring() or can_glide() ) then
        logic = 1
    elseif ( has("tjump") and explosives < 2 ) then
        logic = 1 -- Sequence Breaking
    elseif ( has("splitup") and has("tjump") or can_clockworkShot() ) then
        logic = 2
    
    -- Sequence Breaking
    elseif ( has("tjump") ) then
        logic = explosives
    end
    
    return convertLogic(logic, skip)
end

function notes_WW_diveOfDeath(skip)
    local logic = 99
    --[[        notes_dive_of_death
    if self.world.options.logic_type == LogicType.option_intended:
        logic = ((self.grip_grab(state) and self.flap_flip(state)) or self.climb(state)) and self.dive(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = ((self.grip_grab(state) or self.beak_buster(state)) and self.flap_flip(state) or self.climb(state))\
                    and (self.tall_jump(state) or self.dive(state))\
                or (self.leg_spring(state) or self.glide(state)) and self.tall_jump(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = (self.grip_grab(state) or self.beak_buster(state)) and self.flap_flip(state)\
                or self.climb(state)\
                or self.leg_spring(state)\
                or self.glide(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = (self.grip_grab(state) or self.beak_buster(state)) and self.flap_flip(state)\
                or self.climb(state)\
                or self.ground_rat_a_tat_rap(state)\
                or self.beak_barge(state)\
                or self.leg_spring(state)\
                or self.glide(state)\
                or self.pack_whack(state)\
                or self.taxi_pack(state)
    --]]
    
    if ( (has("ggrab") and has("fflip") or has("climb")) and has("dive") ) then
        logic = 0
    elseif ( ((has("ggrab") or has("bbust")) and has("fflip") or has("climb")) and (has("dive") or has("tjump")) or (has_legSpring() or can_glide()) and has("tjump") ) then
        logic = 1
    elseif ( (has("ggrab") or has("bbust")) and has("fflip") or has("climb") or has_legSpring() or has_glide() ) then
        logic = 2
    elseif ( has("grat") or has("bbarge") or has_packWhack() or has_taxiPack() ) then
        logic = 3
    end
    
    return convertLogic(logic, skip)
end

----- Nests

function nests_WW_pumpRoom(skip)
    local logic = 99
    --[[        nest_pump_room
    if self.world.options.logic_type == LogicType.option_intended:
        logic = (self.flap_flip(state)\
                    or self.leg_spring(state)\
                    or self.split_up(state) and self.grip_grab(state)
                ) and self.has_explosives(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = (self.flap_flip(state)\
                    or self.leg_spring(state)\
                    or self.split_up(state) and self.grip_grab(state)\
                    or self.pack_whack(state) and self.tall_jump(state)\
                ) and self.has_explosives(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = (self.flap_flip(state)\
                or self.leg_spring(state)\
                or self.split_up(state) and self.grip_grab(state)\
                or self.pack_whack(state) and self.tall_jump(state)\
                or self.clockwork_shot(state) and self.small_elevation(state)
                ) and self.has_explosives(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = (self.flap_flip(state)\
                or self.leg_spring(state)\
                or self.split_up(state) and self.grip_grab(state)\
                or self.pack_whack(state) and self.tall_jump(state)\
                or self.clockwork_shot(state) and self.small_elevation(state)
                ) and self.has_explosives(state)
    --]]
    
    local explosives = can_shootExplosiveEggs(true)
    
    -- Normal Logic
    if ( explosives <= logictype.CurrentStage and (has("fflip") or has_legSpring() or has("splitup") and has("ggrab")) ) then
        logic = 0
    elseif ( explosives <= logictype.CurrentStage and has_packWhack() and has("tjump") ) then
        logic = 1
    elseif ( explosives <= logictype.CurrentStage and can_clockworkShot() and can_reachSmallElevation() ) then
        logic = 2
    
    -- Sequence Breaking
    elseif ( has("fflip") or has_legSpring() or has("splitup") and has("ggrab") or has_packWhack() and has("tjump") or can_clockworkShot() and can_reachSmallElevation() ) then
        logic = math.max(2, explosives)
    elseif ( can_clockworkShot() and (has("bbust") or has("ggrab")) ) then
        logic = 7 -- FIXIT you can reach the pump room without tall jump if you hug the barrel
    end
    
    return convertLogic(logic, skip)
end

function nests_WW_bigTop(skip)
    local logic = 99
    --[[        nest_big_top
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.grenade_eggs_item(state) and self.airborne_egg_aiming(state) and self.can_kill_fruity(state)       -- self.has_explosives(state) or self.humbaWW(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.grenade_eggs_item(state) and self.airborne_egg_aiming(state) and self.can_kill_fruity(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.grenade_eggs_item(state) and self.airborne_egg_aiming(state) and self.can_kill_fruity(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.grenade_eggs_item(state) and self.airborne_egg_aiming(state) and self.can_kill_fruity(state)
    --]]
    
    local explosives = can_shootExplosiveEggs(true)
    local humba = access_WW_humba(true)
    
    -- Normal Logic
    if ( has("geggs") and has("aireaim") and (explosives <= logictype.CurrentStage or humba <= logictype.CurrentStage) ) then -- notably doesn't require the ability to shoot said eggs
        logic = 0
    
    -- Sequence Breaking
    elseif ( has("geggs") and has("aireaim") ) then
        logic = math.min(explosives, humba)
    end
    
    return convertLogic(logic, skip)
end

----- Signs

function signpost_WW_pumpRoom(skip)
    local logic = 99
    --[[        signpost_pump_master
    if self.world.options.logic_type == LogicType.option_intended:
        logic = (self.flap_flip(state)\
                    or self.leg_spring(state)\
                    or self.split_up(state) and self.grip_grab(state)
                ) and self.has_explosives(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = (self.flap_flip(state)\
                    or self.leg_spring(state)\
                    or self.split_up(state) and self.grip_grab(state)\
                    or self.pack_whack(state) and self.tall_jump(state)\
                ) and self.has_explosives(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = (self.flap_flip(state)\
                    or self.leg_spring(state)\
                    or self.split_up(state) and self.grip_grab(state)\
                    or self.pack_whack(state) and self.tall_jump(state)
                ) and self.has_explosives(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = (self.flap_flip(state)\
                    or self.leg_spring(state)\
                    or self.split_up(state) and self.grip_grab(state)\
                    or self.pack_whack(state) and self.tall_jump(state)
                ) and self.has_explosives(state)
    --]]
    
    local explosives = can_shootExplosiveEggs(true)
    
    -- Normal Logic
    if ( explosives <= logictype.CurrentStage and (has("fflip") or has_legSpring() or has("splitup") and has("ggrab")) ) then
        logic = 0
    elseif ( explosives <= logictype.CurrentStage and has_packWhack() and has("tjump") ) then
        logic = 1
    
    -- Sequence Breaking
    elseif ( has("fflip") or has_legSpring() or has("splitup") and has("ggrab") or has_packWhack() and has("tjump") ) then
        logic = math.max(1, explosives)
    end
    
    return convertLogic(logic, skip)
end

function signpost_WW_inGobisCell(skip)
    local logic = 99
    --[[        signpost_gobi
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.grenade_eggs(state) and self.egg_aim(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.grenade_eggs(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.grenade_eggs(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.grenade_eggs(state)
    --]]
    
    if ( can_shootEggs("geggs") and has("eggaim") ) then
        logic = 0
    elseif ( can_shootEggs("geggs") ) then
        logic = 1
    end
    
    return convertLogic(logic, skip)
end

----- Other - Jinjos

function jinjo_WW_onBigTop(skip)
    local logic = 99
    --[[        jinjo_tent
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.talon_trot(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.talon_trot(state)\
                or self.humbaWW(state)\
                or self.split_up(state)\
                or state.can_reach_region(regionName.WWI, self.player) and self.turbo_trainers(state)       -- either humba or warping, so I'll just use the warping function since humba completes an earlier conditional
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.talon_trot(state)\
                or self.humbaWW(state)\
                or self.clockwork_shot(state)\
                or self.split_up(state)\
                or state.can_reach_region(regionName.WWI, self.player) and self.turbo_trainers(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.talon_trot(state)\
                or self.humbaWW(state)\
                or self.clockwork_shot(state)\
                or self.split_up(state)\
                or (self.warp_to_inferno(state) or self.humbaWW(state)) and self.turbo_trainers(state)      -- checking for humba here is redundant since having it would already complete an earlier conditional
     --]]
    
    local humba = access_WW_humba(true)
    local warpToInferno = access_WW_warpToInferno(true)
    
    -- Normal Logic
    if ( has("ttrot") ) then
        logic = 0
    elseif ( has("splitup") or humba <= logictype.CurrentStage or has("ttrain") and warpToInferno <= logictype.CurrentStage ) then
        logic = 1
    elseif ( can_clockworkShot() ) then
        logic = 2
    elseif ( humba < 3 or has("ttrain") and warpToInferno < 3 ) then
        logic = 2 -- Sequence Breaking
    elseif ( has("ttrain") and warpToInferno <= logictype.CurrentStage ) then
        logic = 3
    
    -- Sequence Breaking
    else
        local notVan = 99
        if ( has("ttrain") ) then
            notVan = warpToInferno
        end
        
        logic = math.max(1, math.min(notVan, humba))
    end
    
    return convertLogic(logic, skip)
end

function jinjo_WW_caveOfHorrors(skip)
    local logic = 99
    --[[        jinjo_cave_of_horrors
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.grenade_eggs(state) and self.egg_aim(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.grenade_eggs(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.grenade_eggs(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.grenade_eggs(state)
    --]]
    
    if ( can_shootEggs("geggs") and has("eggaim") ) then
        logic = 0
    elseif ( can_shootEggs("geggs") ) then
        logic = 1
    end
    
    return convertLogic(logic, skip)
end

function jinjo_WW_nearCactusOfStrength(skip)
    local logic = 99
    --[[        jinjo_cactus
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.grip_grab(state) and self.flap_flip(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = (self.grip_grab(state) and self.flap_flip(state))\
                or (self.climb(state) and self.talon_trot(state) and (self.flutter(state) or self.air_rat_a_tat_rap(state)))\
                or self.leg_spring(state)\
             or self.pack_whack(state) and self.tall_jump(state) and self.grip_grab(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = (self.grip_grab(state) and self.flap_flip(state))\
                or (self.climb(state) and self.talon_trot(state) and (self.flutter(state) or self.air_rat_a_tat_rap(state)))\
                or self.leg_spring(state)\
                or self.clockwork_shot(state)\
             or self.pack_whack(state) and self.tall_jump(state) and self.grip_grab(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = (self.grip_grab(state) and self.flap_flip(state))\
                or (self.climb(state) and self.talon_trot(state) and (self.flutter(state) or self.air_rat_a_tat_rap(state)))\
                or self.leg_spring(state)\
                or self.clockwork_shot(state)\
             or self.pack_whack(state) and self.tall_jump(state) and self.grip_grab(state)
    --]]
    
    if ( has("ggrab") and has("fflip") ) then
        logic = 0
    elseif ( has("climb") and has("ttrot") and (has("flutter") or has("arat")) or has_legSpring() or has_packWhack() and has("tjump") and has("ggrab") ) then
        logic = 1
    elseif ( can_clockworkShot() ) then
        logic = 2
    end
    
    return convertLogic(logic, skip)
end

function jinjo_WW_area51VanDoor(skip)
    local logic = 99
    --[[        jinjo_van_door
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.has_explosives(state) and \
                self.humbaWW(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.has_explosives(state) and \
                self.humbaWW(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.has_explosives(state) and \
                self.humbaWW(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = (self.has_explosives(state) and self.humbaWW(state)) or self.clockwork_eggs(state)
    --]]
    
    local explosives = can_shootExplosiveEggs(true)
    local humba = access_WW_humba(true)
    
    if ( explosives <= logictype.CurrentStage and humba <= logictype.CurrentStage ) then
        logic = 0 -- Normal Logic
    elseif ( explosives < 3 and humba < 3 ) then
        logic = math.max(explosives, humba)
    elseif ( can_shootEggs("ceggs") ) then
        logic = 3
    
    -- Sequence Breaking
    else
        logic = math.max(3, explosives, humba)
    end
    
    return convertLogic(logic, skip)
end

function jinjo_WW_onDodgemDome(skip)
    local logic = 99
    --[[        jinjo_dodgem
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.talon_trot(state) and self.climb(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.talon_trot(state) and self.climb(state)\
                or self.leg_spring(state) and self.glide(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = (self.talon_trot(state) or self.clockwork_shot(state)) and self.climb(state)\
                or self.leg_spring(state) and self.glide(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = (self.talon_trot(state) or self.clockwork_shot(state)) and self.climb(state)\
                or self.leg_spring(state) and self.glide(state)
    --]]
    
    if ( has("ttrot") and has("climb") ) then
        logic = 0
    elseif ( has_legSpring() and has_glide() ) then
        logic = 1
    elseif ( can_clockworkShot() and has("climb") ) then
        logic = 2
    end
    
    return convertLogic(logic, skip)
end

----- Other - Glowbos

function glowbo_WW_humbasWigwam(skip)
    local logic = 99
    --[[        glowbo_wigwam
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.flap_flip(state) and self.grip_grab(state)\
                or self.warp_to_ww_wumba(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = (self.flap_flip(state) and self.grip_grab(state)) \
                or (self.climb(state) and self.veryLongJump(state) and self.flap_flip(state))\
                or self.leg_spring(state)\
                or self.warp_to_ww_wumba(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = (self.flap_flip(state) and self.grip_grab(state)) \
                or (self.climb(state) and self.veryLongJump(state) and self.flap_flip(state))\
                or (self.clockwork_shot(state) and self.climb(state))\
                or self.leg_spring(state)\
                or self.warp_to_ww_wumba(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = (self.flap_flip(state) and self.grip_grab(state)) \
                or (self.climb(state) and self.veryLongJump(state) and self.flap_flip(state))\
                or (self.clockwork_shot(state) and self.climb(state)\
                or self.leg_spring(state))\
                or self.warp_to_ww_wumba(state)
    --]]
    
    local warpToHumba = access_WW_warpToHumba(true)
    
    -- Normal Logic
    if ( has("fflip") and has("ggrab") or warpToHumba <= logictype.CurrentStage ) then
        logic = 0
    elseif ( has("climb") and can_veryLongJump() and has("fflip") or has_legSpring() ) then
        logic = 1
    elseif ( has("climb") and can_clockworkShot() ) then
        logic = 2

    -- Sequence Breaking
    else
        logic = warpToHumba
    end
    
    return convertLogic(logic, skip)
end

----- Other - Honeycombs

function honeycomb_WW_topOfSpaceZone(skip)
    local logic = 99
    --[[        honeycomb_space_zone
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.grip_grab(state) and self.climb(state) and self.flap_flip(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.grip_grab(state) and self.climb(state) and self.flap_flip(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = (self.grip_grab(state) or self.beak_buster(state)) and self.climb(state) and self.flap_flip(state)\
                or self.leg_spring(state) and self.glide(state)\
                or self.clockwork_shot(state) and (self.talon_trot(state) or self.split_up(state))
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = (self.grip_grab(state) or self.beak_buster(state)) and self.climb(state) and self.flap_flip(state)\
                or self.clockwork_shot(state) and state.can_reach_region(regionName.GMFD, self.player) and self.ggm_to_ww(state)\
                or self.leg_spring(state) and self.glide(state)\
                or self.clockwork_shot(state) and (self.talon_trot(state) or self.split_up(state))
    --]]
    
    local ggmfdAccessibility = Tracker:FindObjectForCode("@Region: Glitter Gulch Mine - Fuel Depot Behind the Rocks").AccessibilityLevel
    local ggmToWW = connector_GGM_to_WW(true)
    
    -- Normal Logic
    if ( has("ggrab") and has("climb") and has("fflip") ) then
        logic = 0
    elseif ( (has("ggrab") or has("bbust")) and has("climb") and has("fflip") or has_legSpring() and has_glide() or can_clockworkShot() and (has("ttrot") or has("splitup")) ) then
        logic = 2
    elseif ( can_clockworkShot() and (ggmfdAccessibility == AccessibilityLevel.Normal or ggmfdAccessibility == AccessibilityLevel.Cleared) and ggmToWW <= logictype.CurrentStage ) then
        logic = 3
    
    -- Sequence Breaking
    elseif ( can_clockworkShot() and (ggmfdAccessibility == AccessibilityLevel.Normal or ggmfdAccessibility == AccessibilityLevel.Cleared) ) then 
        logic = math.max(3, ggmToWW)
    elseif ( can_clockworkShot() and ggmfdAccessibility > AccessibilityLevel.None ) then 
        logic = math.max(3, ggmToWW, logictype.CurrentStage + 1)
    end
    
    return convertLogic(logic, skip)
end

function honeycomb_WW_pumpRoomEntrance(skip)
    local logic = 99
    --[[        honeycomb_crazy_castle
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.has_explosives(state) and (self.small_elevation(state) or self.split_up(state))
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.has_explosives(state) and (self.small_elevation(state) or self.split_up(state))
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = (self.has_explosives(state) and (self.small_elevation(state) or self.split_up(state))) or self.clockwork_shot(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = (self.has_explosives(state) and (self.small_elevation(state) or self.split_up(state)))\
                or self.clockwork_shot(state)\
                or self.pack_whack(state)
    --]]
    
    local explosives = can_shootExplosiveEggs(true)
    
    if ( explosives <= logictype.CurrentStage and (can_reachSmallElevation() or has("splitup")) ) then
        logic = 0 -- Normal Logic
    elseif ( explosives < 2 and (can_reachSmallElevation() or has("splitup")) ) then
        logic = explosives -- Sequence Breaking
    elseif ( can_clockworkShot() ) then
        logic = 2 -- Normal Logic
    elseif ( has_packWhack() ) then
        logic = 3
    
    -- Sequence Breaking
    elseif ( can_reachSmallElevation() or has("splitup") ) then
        logic = explosives
    elseif ( explosives <= 7 and (has("bbust") or has("ggrab")) ) then
        logic = 7 -- FIXIT you don't need small elevation; you can jump up the barrel and then into the room without tall jump
    end
    
    return convertLogic(logic, skip)
end

----- Other - Cheato Pages

function cheato_WW_hauntedCavern(skip)
    local logic = 99
    --[[        cheato_haunted_cavern
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.slightly_elevated_ledge(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.grip_grab(state) or (self.leg_spring(state) and \
                (self.wing_whack(state) or self.glide(state)))
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.grip_grab(state) or (self.leg_spring(state) and \
                (self.wing_whack(state) or self.glide(state)))\
                or self.clockwork_shot(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.grip_grab(state) or (self.leg_spring(state) and \
                (self.wing_whack(state) or self.glide(state)))\
                or self.clockwork_shot(state)
    --]]
    
    if ( can_reachSlightlyElevatedLedge() ) then
        logic = 0
    elseif ( has("ggrab") or has_legSpring() and (has_wingWhack() or has_glide()) ) then
        logic = 1
    elseif ( can_clockworkShot() ) then
        logic = 2
    end
    
    return convertLogic(logic, skip)
end

function cheato_WW_inferno(skip)
    local logic = 99
    --[[        cheato_inferno
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.humbaWW(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.humbaWW(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.humbaWW(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.humbaWW(state) or self.clockwork_eggs(state)
     --]]
    
    local humba = access_WW_humba(true)
    
    if ( humba <= logictype.CurrentStage ) then
        logic = 0 -- Normal Logic
    elseif ( humba < 3 ) then
        logic = humba -- Sequence Breaking
    elseif ( can_shootEggs("ceggs") ) then
        logic = 3 -- Normal Logic
        
    -- Sequence Breaking
    else
        logic = humba
    end
    
    return convertLogic(logic, skip)
end

----- Other

function trainSwitch_WW(skip)
    local logic = 99
    --[[        tswitch_ww
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.grip_grab(state) and self.flap_flip(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.grip_grab(state) and self.flap_flip(state)\
            or self.leg_spring(state)\
            or self.grip_grab(state) and self.pack_whack(state) and self.tall_jump(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.grip_grab(state) and self.flap_flip(state)\
            or self.leg_spring(state)\
            or self.grip_grab(state) and self.pack_whack(state) and self.tall_jump(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.grip_grab(state) and self.flap_flip(state)\
            or self.leg_spring(state)\
            or self.grip_grab(state) and self.pack_whack(state) and self.tall_jump(state)
    --]]
    
    if ( has("ggrab") and has("fflip") ) then
        logic = 0
    elseif ( has_legSpring() or has("tjump") and has("ggrab") and has_packWhack() ) then
        logic = 1
    end
    
    return convertLogic(logic, skip)
end

function other_WW_moggy(skip)
    local logic = 99
    --[[        moggy
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.mumboWW(state) and \
            self.has_explosives(state)\

    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.mumboWW(state) and \
            self.has_explosives(state)\

    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.mumboWW(state) and \
            ((self.split_up(state) and self.spring_pad(state)) or self.leg_spring(state) or self.glide(state) or self.has_explosives(state))

    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.mumboWW(state) and \
            ((self.split_up(state) and self.spring_pad(state)) or self.leg_spring(state) or self.glide(state) or self.has_explosives(state))
    --]]
    
    local mumbo = access_WW_mumbo(true)
    local explosives = can_shootExplosiveEggs(true)
    
    if ( mumbo <= logictype.CurrentStage and explosives <= logictype.CurrentStage ) then
        logic = 0 -- Normal Logic
    elseif ( mumbo < 2 and explosives < 2 ) then
        logic = 1 -- Sequence Breaking
    elseif ( mumbo <= logictype.CurrentStage and (has("splitup") and has("tjump") or has_legSpring() or has_glide()) ) then
        logic = 2 -- Normal Logic
    
    -- Sequence Breaking
    else
        local withoutExplosives = 99
        if ( has("splitup") and has("tjump") or has_legSpring() or has_glide() ) then
            withoutExplosives = 2
        end
        
        logic = math.max(mumbo, math.min(explosives, withoutExplosives))
    end
    
    return convertLogic(logic, skip)
end

function other_WW_soggy(skip)
    local logic = 99
    --[[        soggy
    if self.world.options.logic_type == LogicType.option_intended:
        logic = state.can_reach_region(regionName.WWI, self.player)

    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = state.can_reach_region(regionName.WWI, self.player)

    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = state.can_reach_region(regionName.WWI, self.player)

    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = state.can_reach_region(regionName.WWI, self.player)
    --]]
    
    local wwiAccessibility = Tracker:FindObjectForCode("@Region: Witchyworld - The Inferno").AccessibilityLevel
    
    -- Normal Logic
    if ( wwiAccessibility == AccessibilityLevel.Normal or wwiAccessibility == AccessibilityLevel.Cleared ) then
        logic = 0
    
    -- Sequence Breaking
    elseif ( wwiAccessibility > AccessibilityLevel.None ) then
        logic = logictype.CurrentStage + 1
    end
    
    return convertLogic(logic, skip)
end

function other_WW_groggy(skip)
    local logic = 99
    --[[        groggy
    if self.world.options.logic_type == LogicType.option_intended:
        logic = state.can_reach_region(regionName.WWI, self.player) and \
            self.taxi_pack(state) and \
            self.spring_pad(state)

    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = state.can_reach_region(regionName.WWI, self.player) and \
            self.taxi_pack(state) and \
            (self.spring_pad(state) or self.leg_spring(state) or self.glide(state))

    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = state.can_reach_region(regionName.WWI, self.player) and \
            self.taxi_pack(state)\
            and (self.spring_pad(state) or self.leg_spring(state) or self.glide(state))

    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = state.can_reach_region(regionName.WWI, self.player) and \
                self.taxi_pack(state)\
                and (self.spring_pad(state) or self.leg_spring(state) or self.glide(state))
    --]]
    
    local wwiAccessibility = Tracker:FindObjectForCode("@Region: Witchyworld - The Inferno").AccessibilityLevel
    
    -- Normal Logic
    if ( (wwiAccessibility == AccessibilityLevel.Normal or wwiAccessibility == AccessibilityLevel.Cleared) and has_taxiPack() and has("tjump") ) then
        logic = 0
    elseif ( (wwiAccessibility == AccessibilityLevel.Normal or wwiAccessibility == AccessibilityLevel.Cleared) and has_taxiPack() and (has_legSpring() or has_glide()) ) then
        logic = 1
    
    -- Sequence Breaking
    elseif ( wwiAccessibility > AccessibilityLevel.None and has_taxiPack() and (has("tjump") or has_legSpring() or has_glide()) ) then
        logic = logictype.CurrentStage + 1
    end
    
    return convertLogic(logic, skip)
end

function other_WW_tickets(skip)
    local logic = 99
    --[[        can_kill_fruity
     return state.can_reach_region(regionName.WW, self.player) and (
                self.has_explosives(state)\
                or self.humbaWW(state)\
                or self.ice_eggs(state) and ( # Freezing these enemies severely weakens them.
                    self.blue_eggs(state)\
                    or self.fire_eggs(state)\
                    or self.grenade_eggs(state)\            -- no need to check this, because if you can shoot ice eggs and have grenade eggs, you have explosives (on all difficulties)
                    or self.clockwork_eggs(state)\
                    or self.beak_barge(state)\
                    or self.roll(state)\
                    or self.air_rat_a_tat_rap(state)\
                    or self.ground_rat_a_tat_rap(state)\
                    or self.beak_buster(state)\
                    or self.breegull_bash(state)\
                    or self.wonderwing(state)
                )
           )
     --]]
    
    local wwAccessible = 99
    if ( load_boss_ww_ww() ) then
        wwAccessible = 0
    else
        local wwAccessibility = Tracker:FindObjectForCode("@Region: Witchyworld - Main Area").AccessibilityLevel
        if ( wwAccessibility == AccessibilityLevel.Normal or wwAccessibility == AccessibilityLevel.Cleared ) then
            wwAccessible = 0
        elseif ( wwAccessibility > AccessibilityLevel.None ) then
            wwAccessible = logictype.CurrentStage + 1
        end
    end
    local explosives = can_shootExplosiveEggs(true)
    local humba = access_WW_humba(true)
    
    -- Normal Logic
    if ( wwAccessible <= logictype.CurrentStage and (explosives <= logictype.CurrentStage or humba <= logictype.CurrentStage or can_shootEggs("ieggs") and (has("begg") or has("feggs") or has("ceggs") or has("bbarge") or has("roll") or has("arat") or has("grat") or has("bbust") or has("wwing"))) ) then
        logic = 0
    
    -- Sequence Breaking
    else
        logic = math.max(wwAccessible, math.min(explosives, humba))
    end
    
    return convertLogic(logic, skip)
end