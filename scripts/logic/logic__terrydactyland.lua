--------------- Terrydactyland

----- Basic & Access functions

function access_TDL_terryFight(skip)
    local logic = 99
    --[[        can_beat_terry
     if self.world.options.logic_type == LogicType.option_intended:
        return self.egg_aim(state) and self.can_shoot_linear_egg(state)\
                and state.can_reach_region(regionName.TLBOSS, self.player)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        return self.egg_aim(state)  and self.can_shoot_linear_egg(state)\
                and state.can_reach_region(regionName.TLBOSS, self.player)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        return self.can_shoot_linear_egg(state) and (self.flap_flip(state) or self.egg_aim(state))\
                and state.can_reach_region(regionName.TLBOSS, self.player)
    elif self.world.options.logic_type == LogicType.option_glitches:
        return self.can_shoot_linear_egg(state) and (self.flap_flip(state) or self.egg_aim(state))\
                and state.can_reach_region(regionName.TLBOSS, self.player)
     --]]
    
    local batAccessibility = Tracker:FindObjectForCode("@Region: Boss Arena - Terry").AccessibilityLevel
    
    -- Normal Logic
    if ( has("eggaim") and can_shootLinearEggs() and (batAccessibility == AccessibilityLevel.Normal or batAccessibility == AccessibilityLevel.Cleared) ) then
        logic = 0
    elseif ( has("eggaim") and can_shootLinearEggs() and logictype.CurrentStage == 0 and batAccessibility > AccessibilityLevel.None ) then
        logic = 1 -- Sequence Breaking
    elseif ( has("fflip") and can_shootLinearEggs() and (batAccessibility == AccessibilityLevel.Normal or batAccessibility == AccessibilityLevel.Cleared) ) then
        logic = 2
    
    -- Sequence Breaking
    elseif ( can_shootEggs() and (has("fflip") or has("eggaim")) and batAccessibility > AccessibilityLevel.None ) then
        logic = math.max(2, logictype.CurrentStage + 1)
    end
    
    return convertLogic(logic, skip)
end

function access_TDL_scrit(skip)
    local logic = 99
    --[[
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.mumboTDL(state) and self.bill_drill(state) and self.tall_jump(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.mumboTDL(state) and self.bill_drill(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.mumboTDL(state) and self.bill_drill(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.mumboTDL(state) and self.bill_drill(state)
    --]]
    
    local mumbo = access_TDL_mumbo(true)
    
    -- Normal Logic
    if ( mumbo <= logictype.CurrentStage and has_billDrill() and has("tjump") ) then
        logic = 0
    elseif ( mumbo <= logictype.CurrentStage and has_billDrill() ) then
        logic = 1
    
    -- Sequence Breaking
    elseif ( has_billDrill() ) then
        logic = math.max(1, mumbo)
    end
    
    return convertLogic(logic, skip)
end

function access_TDL_scrat(skip)
    local logic = 99
    --[[
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.can_beat_king_coal(state) and state.has(itemName.TRAINSWIH, self.player) and state.has(itemName.TRAINSWTD, self.player) and self.taxi_pack(state) and self.check_mumbo_magic(state, itemName.MUMBOIH) and (self.tall_jump(state) or self.talon_trot(state))
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.can_beat_king_coal(state) and state.has(itemName.TRAINSWIH, self.player) and state.has(itemName.TRAINSWTD, self.player) and self.taxi_pack(state) and self.check_mumbo_magic(state, itemName.MUMBOIH)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.can_beat_king_coal(state) and state.has(itemName.TRAINSWIH, self.player) and state.has(itemName.TRAINSWTD, self.player) and self.taxi_pack(state) and self.check_mumbo_magic(state, itemName.MUMBOIH)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.can_beat_king_coal(state) and state.has(itemName.TRAINSWIH, self.player) and state.has(itemName.TRAINSWTD, self.player) and self.taxi_pack(state) and self.check_mumbo_magic(state, itemName.MUMBOIH)
    --]]
    
    local canBeatKingCoal = chuffy_canBeatKingCoal(true)
    
    -- Normal Logic
    if ( canBeatKingCoal <= logictype.CurrentStage and has("trainswih") and has("trainswtd") and has_taxiPack() and has("mumboih") and (has("tjump") or has("ttrot")) ) then
        logic = 0
    elseif ( canBeatKingCoal <= logictype.CurrentStage and has("trainswih") and has("trainswtd") and has_taxiPack() and has("mumboih") ) then
        logic = 1
    
    -- Sequence Breaking
    elseif ( has("trainswih") and has("trainswtd") and has_taxiPack() and has("mumboih") ) then
        logic = math.max(1, canBeatKingCoal)
    end
    
    return convertLogic(logic, skip)
end

function access_TDL_scrut(skip)
    local logic = 99
    --[[
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.can_beat_king_coal(state) and state.has(itemName.TRAINSWTD, self.player) and state.has(itemName.TRAINSWWW, self.player) and self.grenade_eggs(state) and self.egg_aim(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.can_beat_king_coal(state) and state.has(itemName.TRAINSWTD, self.player) and state.has(itemName.TRAINSWWW, self.player) and self.grenade_eggs(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.can_beat_king_coal(state) and state.has(itemName.TRAINSWTD, self.player) and state.has(itemName.TRAINSWWW, self.player) and self.grenade_eggs(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.can_beat_king_coal(state) and state.has(itemName.TRAINSWTD, self.player) and state.has(itemName.TRAINSWWW, self.player) and self.grenade_eggs(state)
    --]]
    
    local canBeatKingCoal = chuffy_canBeatKingCoal(true)
    
    -- Normal Logic
    if ( canBeatKingCoal <= logictype.CurrentStage and has("trainswtd") and has("trainswww") and can_shootEggs("geggs") and has("eggaim") ) then
        logic = 0
    elseif ( canBeatKingCoal <= logictype.CurrentStage and has("trainswtd") and has("trainswww") and can_shootEggs("geggs") ) then
        logic = 1
    
    -- Sequence Breaking
    elseif ( has("trainswtd") and has("trainswww") and can_shootEggs("geggs") ) then
        logic = math.max(1, canBeatKingCoal)
    end
    
    return convertLogic(logic, skip)
end

function access_TDL_oogleBooglesOpen(skip)
    local logic = 99
    --[[        oogle_boogles_open
    self.humbaTDL(state) and self.mumboTDL(state)
    --]]
    
    local humba = access_TDL_humba(true)
    local mumbo = access_TDL_mumbo(true)
    
    -- Normal Logic
    if ( humba <= logictype.CurrentStage and mumbo <= logictype.CurrentStage ) then
        logic = 0
    
    -- Sequence Breaking
    else
        logic = math.max(humba, mumbo)
    end
    
    return convertLogic(logic, skip)
end

function access_TDL_oogleBoogle(skip)
    local logic = 99
    --[[        access_oogle_boogle
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.oogle_boogles_open(state) or state.can_reach_region(regionName.WW, self.player) and self.ww_tdl_backdoor(state)        -- connector_WW_to_TDL
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.oogle_boogles_open(state) or state.can_reach_region(regionName.WW, self.player) and self.ww_tdl_backdoor(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.oogle_boogles_open(state) or state.can_reach_region(regionName.WW, self.player) and self.ww_tdl_backdoor(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.oogle_boogles_open(state)\
                or state.can_reach_region(regionName.WW, self.player) and self.ww_tdl_backdoor(state)\
                or self.clockwork_warp(state)
    --]]
    
    local wwAccessibility = Tracker:FindObjectForCode("@Region: Witchyworld - Main Area").AccessibilityLevel
    local oogleBooglesOpen = access_TDL_oogleBooglesOpen(true)
    local WW_to_TDL = connector_WW_to_TDL(true)
    
    if ( oogleBooglesOpen <= logictype.CurrentStage or (wwAccessibility == AccessibilityLevel.Normal or wwAccessibility == AccessibilityLevel.Cleared) and WW_to_TDL <= logictype.CurrentStage ) then
        logic = 0 -- Normal Logic
    elseif ( oogleBooglesOpen < 2 or (wwAccessibility == AccessibilityLevel.Normal or wwAccessibility == AccessibilityLevel.Cleared) and WW_to_TDL < 2 ) then
        logic = 1 -- Sequence Breaking
    elseif ( can_clockworkWarp() ) then
        logic = 2 -- Normal Logic
    elseif ( wwAccessibility == AccessibilityLevel.Normal or wwAccessibility == AccessibilityLevel.Cleared ) then
        logic = math.min(oogleBooglesOpen, WW_to_TDL) -- Sequence Breaking
    elseif ( wwAccessibility > AccessibilityLevel.None ) then
        logic = math.min(oogleBooglesOpen, math.max(logictype.CurrentStage + 1, WW_to_TDL)) -- Sequence Breaking, middle part was already converted once by the json
    end
    
    return convertLogic(logic, skip)
end

function access_TDL_flightPad(skip)
    local logic = 99
    --[[        TDL_flight_pad
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.can_beat_terry(state) and self.springy_step_shoes(state) and self.flight_pad(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.can_beat_terry(state) and self.flight_pad(state)\
                and (self.springy_step_shoes(state) or (self.talon_trot(state) and self.flutter(state)))
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.can_beat_terry(state) and self.flight_pad(state)\
                and (self.springy_step_shoes(state) or (self.talon_trot(state) and self.flutter(state)))
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.can_beat_terry(state) and self.flight_pad(state)\
                and (self.springy_step_shoes(state) or (self.talon_trot(state) and self.flutter(state)))
    --]]
    
    local canBeatTerry = access_TDL_terryFight(true)
    
    -- Normal Logic
    if ( canBeatTerry <= logictype.CurrentStage and has("springb") and has("fpad") ) then
        logic = 0
    elseif ( canBeatTerry <= logictype.CurrentStage and has("fpad") and has("ttrot") and has("flutter") ) then
        logic = 1
    
    -- Sequence Breaking
    elseif ( has("fpad") and (has("springb") or has("ttrot") and has("flutter")) ) then
        logic = canBeatTerry
    end
    
    return convertLogic(logic, skip)
end

function access_TDL_humba(skip)
    local logic = 99
    --[[        humbaTDL
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.small_elevation(state) and state.has(itemName.HUMBATD, self.player)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = state.has(itemName.HUMBATD, self.player)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = state.has(itemName.HUMBATD, self.player)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = state.has(itemName.HUMBATD, self.player)
    --]]
    
    if ( has("humbatd") and can_reachSmallElevation() ) then
        logic = 0
    elseif ( has("humbatd") ) then
        logic = 1
    end
    
    return convertLogic(logic, skip)
end

function access_TDL_mumbo(skip)
    local logic = 99
    --[[        mumboTDL
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.stilt_stride(state) and state.has(itemName.MUMBOTD, self.player)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = state.has(itemName.MUMBOTD, self.player)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = state.has(itemName.MUMBOTD, self.player)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = state.has(itemName.MUMBOTD, self.player)
    --]]
    
    if ( has("mumbotd") and has("sstride") ) then
        logic = 0
    elseif ( has("mumbotd") ) then
        logic = 1
    end
    
    return convertLogic(logic, skip)
end

function access_TDL_warpToMumbo(skip, infiniteLoopStopper)
    local logic = 99
    --[[        warp_to_tdl_mumbo
    state.has(itemName.WARPTL3, self.player) and (
        state.has(itemName.WARPTL1, self.player)\
        or state.has(itemName.WARPTL2, self.player) and state.can_reach_region(regionName.TLSP, self.player)\
        or state.has(itemName.WARPTL4, self.player) and state.can_reach_location(locationName.WARPTL4, self.player)\
        or state.has(itemName.WARPTL5, self.player) and state.can_reach_region(regionName.TLTOP, self.player)\
    )
    --]]
    
    if ( has("warptl3") ) then
        local tdlSPAccessibility = Tracker:FindObjectForCode("@Region: Terrydactyland - Stomping Plains").AccessibilityLevel
        local mumboWarp = 99
        if ( infiniteLoopStopper ) then
            mumboWarp = 99
        else
            mumboWarp = warp_TDL_mumbo(true, true)
        end
        local tdlTAccessibility = Tracker:FindObjectForCode("@Region: Terrydactyland - Top").AccessibilityLevel
        
        -- Normal Logic
        if ( has("warptl1") or has("warptl2") and (tdlSPAccessibility == AccessibilityLevel.Normal or tdlSPAccessibility == AccessibilityLevel.Cleared) or has("warptl4") and mumboWarp <= logictype.CurrentStage or has("warptl5") and (tdlTAccessibility == AccessibilityLevel.Normal or tdlTAccessibility == AccessibilityLevel.Cleared) ) then
            logic = 0
            
        -- Sequence Breaking
        else
            stomping = 99
            if ( has("warptl2") and tdlSPAccessibility > AccessibilityLevel.None ) then
                stomping = logictype.CurrentStage + 1 -- was already converted once by the json
            end
            
            mumbo = 99
            if ( has("warptl4") ) then
                mumbo = mumboWarp
            end
            
            top = 99
            if ( has("warptl5") and tdlTAccessibility > AccessibilityLevel.None ) then
                top = logictype.CurrentStage + 1 -- was already converted once by the json
            end
            
            logic = math.min(stomping, mumbo, top)
        end
    end

    return convertLogic(logic, skip)
end

function access_TDL_warpToHumba(skip, infiniteLoopStopper)
    local logic = 99
    --[[        warp_to_tdl_wumba
    state.has(itemName.WARPTL4, self.player) and (
        state.has(itemName.WARPTL1, self.player)\
        or state.has(itemName.WARPTL2, self.player) and state.can_reach_region(regionName.TLSP, self.player)\
        or state.has(itemName.WARPTL3, self.player) and state.can_reach_location(locationName.WARPTL3, self.player)\
        or state.has(itemName.WARPTL5, self.player) and state.can_reach_region(regionName.TLTOP, self.player)\
    )
    --]]
    
    if ( has("warptl4") ) then
        local tdlSPAccessibility = Tracker:FindObjectForCode("@Region: Terrydactyland - Stomping Plains").AccessibilityLevel
        local humbaWarp = 99
        if ( infiniteLoopStopper ) then
            humbaWarp = 99
        else
            humbaWarp = warp_TDL_humba(true, true)
        end
        local tdlTAccessibility = Tracker:FindObjectForCode("@Region: Terrydactyland - Top").AccessibilityLevel
        
        -- Normal Logic
        if ( has("warptl1") or has("warptl2") and (tdlSPAccessibility == AccessibilityLevel.Normal or tdlSPAccessibility == AccessibilityLevel.Cleared) or has("warptl3") and humbaWarp <= logictype.CurrentStage or has("warptl5") and (tdlTAccessibility == AccessibilityLevel.Normal or tdlTAccessibility == AccessibilityLevel.Cleared) ) then
            logic = 0
            
        -- Sequence Breaking
        else
            stomping = 99
            if ( has("warptl2") and tdlSPAccessibility > AccessibilityLevel.None ) then
                stomping = logictype.CurrentStage + 1 -- was already converted once by the json
            end
            
            humba = 99
            if ( has("warptl3") ) then
                humba = humbaWarp
            end
            
            top = 99
            if ( has("warptl5") and tdlTAccessibility > AccessibilityLevel.None ) then
                top = logictype.CurrentStage + 1 -- was already converted once by the json
            end
            
            logic = math.min(stomping, humba, top)
        end
    end

    return convertLogic(logic, skip)
end

function access_TDL_soloBanjoToTerry(skip)
    local logic = 99
    --[[        solo_banjo_to_terry
     return self.split_up(state) and state.has(itemName.WARPTL5, self.player) and (
            state.has(itemName.WARPTL1, self.player) and state.can_reach_region(regionName.TL, self.player)\
            or state.has(itemName.WARPTL2, self.player) and state.can_reach_region(regionName.TLSP, self.player)\
            or state.has(itemName.WARPTL3, self.player) and self.world.options.logic_type != LogicType.option_intended\
                and state.can_reach_region(regionName.TL, self.player)\
            or state.has(itemName.WARPTL4, self.player) and state.can_reach_region(regionName.TL, self.player)\
        )
     --]]
    
    if ( has("splitup") ) then
        if ( has("randomizewarppads_on") and has("warptl5") ) then
            local tdlAccessibility = Tracker:FindObjectForCode("@Region: Terrydactyland - Main Area").AccessibilityLevel
            local tdlSPAccessibility = Tracker:FindObjectForCode("@Region: Terrydactyland - Stomping Plains").AccessibilityLevel
            
            if ( (tdlAccessibility == AccessibilityLevel.Normal or tdlAccessibility == AccessibilityLevel.Cleared) and (has("warptl1") or has("warptl4")) or (tdlSPAccessibility == AccessibilityLevel.Normal or tdlSPAccessibility == AccessibilityLevel.Cleared) and has("warptl2") ) then
                logic = 0
            elseif ( (tdlAccessibility == AccessibilityLevel.Normal or tdlAccessibility == AccessibilityLevel.Cleared) and has("warptl3") ) then
                logic = 1
            elseif ( tdlAccessibility > AccessibilityLevel.None and (has("warptl1") or has("warptl4") or has("warptl3")) or tdlSPAccessibility > AccessibilityLevel.None and has("warptl2") ) then
                logic = logictype.CurrentStage + 1
            end
                
        elseif ( has("randomizewarppads_off") ) then
            logic = 0 -- we can assume you'll have both the entrance warp pad and the top warp pad
        end
    end
    
    return convertLogic(logic, skip)
end

----- Silos

function silo_TDL_springyStepShoes(skip)
    local logic = 99
    --[[
    self.check_notes(state, locationName.SPRINGB) and self.silo_spring(state)
    
    if self.world.options.logic_type == LogicType.option_intended:
        return self.flap_flip(state) and self.grip_grab(state)\
                or self.TDL_flight_pad(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        return self.flap_flip(state) and (self.grip_grab(state) or self.beak_buster(state))\
                or self.TDL_flight_pad(state)\
                or self.veryLongJump(state)\
                or self.turbo_trainers(state)\
                or self.springy_step_shoes(state)

    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        return self.flap_flip(state) and (self.grip_grab(state) or self.beak_buster(state))\
                or self.TDL_flight_pad(state)\
                or self.veryLongJump(state)\
                or self.turbo_trainers(state)\
                or self.springy_step_shoes(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        return self.flap_flip(state) and (self.grip_grab(state) or self.beak_buster(state))\
                or self.TDL_flight_pad(state)\
                or self.veryLongJump(state)\
                or self.turbo_trainers(state)\
                or self.springy_step_shoes(state)
    --]]
    
    if ( springb_count() ) then
        local flightPad = access_TDL_flightPad(true)
        
        -- Normal Logic
        if ( has("fflip") and has("ggrab") or flightPad <= logictype.CurrentStage ) then
            logic = 0
        elseif ( has("fflip") and has("bbust") or can_veryLongJump() or has("ttrain") or has("springb") ) then
            logic = 1
        
        -- Sequence Breaking
        else
            logic = flightPad
        end
    end
    
    return convertLogic(logic, skip)
end

function silo_TDL_taxiPack(skip)
    local logic = 99
    --[[
    self.can_access_taxi_pack_silo(state) and self.check_notes(state, locationName.TAXPACK)
    
    if self.world.options.logic_type == LogicType.option_intended:
        return self.split_up(state) and (self.tall_jump(state) and (self.grip_grab(state) or self.sack_pack(state)))
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        return self.split_up(state) and\
                    (self.tall_jump(state) and (self.grip_grab(state) or
                    self.pack_whack(state) and self.tall_jump(state)\                       -- checking for tall jump here is redundant because it's also outside of the brackets
                    or self.pack_whack(state) and self.grip_grab(state)\
                    or self.sack_pack(state)))
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        return self.split_up(state) and\
                    (self.tall_jump(state) and (self.grip_grab(state)\
                    or self.pack_whack(state) and self.tall_jump(state)\
                    or self.pack_whack(state) and self.grip_grab(state)\
                    or self.sack_pack(state)))
    elif self.world.options.logic_type == LogicType.option_glitches:
        return self.split_up(state) and\
                    (self.tall_jump(state) and (self.grip_grab(state) or
                    self.pack_whack(state) and self.tall_jump(state)\
                    or self.pack_whack(state) and self.grip_grab(state)\
                    or self.sack_pack(state)))
    --]]
    
    -- FIXIT - needs testing - you probably do not need tall jump with pack whack if you have grip grab
    
    if ( taxpack_count() and has("splitup") ) then
        if ( has("tjump") and (has("ggrab") or has_sackPack()) ) then
            logic = 0
        elseif ( has("tjump") and has_packWhack() ) then
            logic = 1
        end
    end
    
    return convertLogic(logic, skip)
end

function silo_TDL_hatch(skip)
    local logic = 99
    --[[
    self.split_up(state) and self.check_notes(state, locationName.HATCH)
    --]]
    
    if ( hatch_count() and has("splitup") ) then
        logic = 0
    end
    
    return convertLogic(logic, skip)
end

----- Warp Pads

function warp_TDL_mumbo(skip, infiniteLoopStopper)
    local logic = 99
    --[[        warp_pad_tdl_mumbo
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.stilt_stride(state)\
                or self.warp_to_tdl_mumbo(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = True
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = True
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = True
    --]]
    
    local mumboWarp = 99
    if ( infiniteLoopStopper ) then
        mumboWarp = 99
    else
        mumboWarp = access_TDL_warpToMumbo(true, true)
    end
    
    if ( has("sstride") or mumboWarp <= logictype.CurrentStage ) then
        logic = 0
    else
        logic = 1
    end

    return convertLogic(logic, skip)
end

function warp_TDL_humba(skip, infiniteLoopStopper)
    local logic = 99
    --[[        warp_pad_tdl_wumba
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.small_elevation(state) or self.warp_to_tdl_wumba(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = True
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = True
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = True
    --]]
    
    local humbaWarp = 99
    if ( infiniteLoopStopper ) then
        humbaWarp = 99
    else
        humbaWarp = access_TDL_warpToHumba(true, true)
    end
    
    if ( can_reachSmallElevation() or humbaWarp <= logictype.CurrentStage ) then
        logic = 0
    else
        logic = 1
    end

    return convertLogic(logic, skip)
end

----- Jiggies

function jiggy_TDL_terrysNest(skip)
    local logic = 99
    --[[        jiggy_terry_nest
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.can_beat_terry(state) and (self.has_explosives(state) or \
                self.bill_drill(state))
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = (self.has_explosives(state) or self.bill_drill(state)) and self.can_beat_terry(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = (self.has_explosives(state) or self.bill_drill(state)) and self.can_beat_terry(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = (self.has_explosives(state) or self.bill_drill(state)) and self.can_beat_terry(state)
    --]]
    
    local canBeatTerry = access_TDL_terryFight(true)
    local explosives = can_shootExplosiveEggs(true)
    
    -- Normal Logic
    if ( canBeatTerry <= logictype.CurrentStage and (has_billDrill() or explosives <= logictype.CurrentStage) ) then
        logic = 0
        
    -- Sequence Breaking
    else
        local withBillDrill = 99
        if ( has_billDrill() ) then
            withBillDrill = 0
        end
        
        logic = math.max(canBeatTerry, math.min(withBillDrill, explosives))
    end
    
    return convertLogic(logic, skip)
end

function jiggy_TDL_dippy(skip)
    local logic = 99
    --[[        jiggy_dippy
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.talon_torpedo(state) and state.can_reach_region(regionName.CC, self.player) and self.dive(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.talon_torpedo(state) and state.can_reach_region(regionName.CC, self.player) and (self.dive(state) or self.beak_buster(state))
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.talon_torpedo(state) and state.can_reach_region(regionName.CC, self.player)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.talon_torpedo(state) and state.can_reach_region(regionName.CC, self.player)
    --]]
    
    local cclAccessibility = Tracker:FindObjectForCode("@Region: Cloud Cuckooland").AccessibilityLevel
    
    -- Normal Logic
    if ( has("dive") and has("ttorp") and (cclAccessibility == AccessibilityLevel.Normal or cclAccessibility == AccessibilityLevel.Cleared) ) then
        logic = 0
    elseif ( has("bbust") and has("ttorp") and (cclAccessibility == AccessibilityLevel.Normal or cclAccessibility == AccessibilityLevel.Cleared) ) then
        logic = 1
    elseif ( has("ttorp") and (cclAccessibility == AccessibilityLevel.Normal or cclAccessibility == AccessibilityLevel.Cleared) ) then
        logic = 2
        
    -- Sequence Breaking
    elseif ( has("ttorp") and cclAccessibility > AccessibilityLevel.None ) then
        logic = math.max(2, logictype.CurrentStage + 1) -- was already converted once by the json
    end
    
    return convertLogic(logic, skip)
end

function jiggy_TDL_scrotty(skip)
    local logic = 99
    --[[        jiggy_scrotty
    self.scrit(state) and self.scrat(state) and self.scrut(state)
    --]]
    
    local scrit = access_TDL_scrit(true)
    local scrat = access_TDL_scrat(true)
    local scrut = access_TDL_scrut(true)
    
    -- Normal Logic
    if ( scrit <= logictype.CurrentStage and scrat <= logictype.CurrentStage and scrut <= logictype.CurrentStage ) then
        logic = 0
        
    -- Sequence Breaking
    else
        logic = math.max(scrit, scrat, scrut)
    end
    
    return convertLogic(logic, skip)
end

function jiggy_TDL_oogleBoogle(skip)
    local logic = 99
    --[[        jiggy_oogle_boogle
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.access_oogle_boogle(state) and self.fire_eggs(state) and \
                self.smuggle_food(state) and self.grip_grab(state) and \
                self.bill_drill(state) and self.spring_pad(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.access_oogle_boogle(state) and self.has_fire(state) and \
                self.smuggle_food(state) and self.grip_grab(state) and \
                self.bill_drill(state) and self.spring_pad(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.access_oogle_boogle(state) and self.has_fire(state) and \
                self.grip_grab(state) and self.bill_drill(state) and self.smuggle_food(state)\
                and self.spring_pad(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = (self.access_oogle_boogle(state) or self.clockwork_warp(state))\
                and self.has_fire(state) and self.grip_grab(state) and self.bill_drill(state) and self.smuggle_food(state) and self.spring_pad(state)
            
    
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.claw_clamber_boots(state) and self.talon_trot(state) and self.has_explosives(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.claw_clamber_boots(state) and self.has_explosives(state)\
                and (
                    self.talon_trot(state)\
                    or state.can_reach_region(regionName.WWI, self.player) and self.turbo_trainers(state)
                )
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.has_explosives(state) or self.spring_pad(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.has_explosives(state) or self.spring_pad(state)
    --]]
    
    local oogleBoogle = access_TDL_oogleBoogle(true)
    local explosives = can_shootExplosiveEggs(true)
    local hasFire = can_useFire(true)
    local wwHumba = access_WW_humba(true)
    local warpToInferno = access_WW_warpToInferno(true)
    
    -- Normal Logic
    if ( oogleBoogle <= logictype.CurrentStage and can_shootEggs("feggs") and has("ggrab") and has("tjump") and has_billDrill() and has("clawbts") and has("ttrot") and explosives <= logictype.CurrentStage ) then
        logic = 0
    elseif ( oogleBoogle <= logictype.CurrentStage and hasFire <= logictype.CurrentStage and has("ggrab") and has("tjump") and has_billDrill() and has("clawbts") and (has("ttrot") or has("ttrain") and (wwHumba <= logictype.CurrentStage or warpToInferno <= logictype.CurrentStage)) and explosives <= logictype.CurrentStage ) then
        logic = 1
    elseif ( oogleBoogle < 2 and can_shootEggs("feggs") and has("ggrab") and has("tjump") and has_billDrill() and has("clawbts") and (has("ttrot") or has("ttrain") and (wwHumba < 2 or warpToInferno < 2)) and explosives < 2 ) then
        logic = 1 -- Sequence Breaking
    elseif ( oogleBoogle <= logictype.CurrentStage and hasFire <= logictype.CurrentStage and has("ggrab") and has("tjump") and has_billDrill() ) then
        logic = 2
    elseif ( oogleBoogle < 3 and hasFire < 3 and has("ggrab") and has("tjump") and has_billDrill() ) then
        logic = 2 -- Sequence Breaking
    elseif ( can_clockworkWarp() and hasFire <= logictype.CurrentStage and has("ggrab") and has("tjump") and has_billDrill() ) then
        logic = 3
        
    -- Sequence Breaking
    elseif ( has("ggrab") and has("tjump") and has_billDrill() ) then
        local withWarp = 99
        if ( can_clockworkWarp() ) then
            withWarp = 3
        end
        
        logic = math.max(2, hasFire, math.min(withWarp, oogleBoogle))
    end
    
    return convertLogic(logic, skip)
end

function jiggy_TDL_chompa(skip)
    local logic = 99
    --[[        jiggy_chompa
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.breegull_blaster(state) and (
            ((self.tall_jump(state) or self.grip_grab(state)) and self.flight_pad(state)
             or (self.egg_aim(state) and self.has_explosives(state) and self.springy_step_shoes(state)))
        )
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.breegull_blaster(state) and (
            ((self.tall_jump(state) or self.grip_grab(state) or self.beak_buster(state)) and self.flight_pad(state)
             or (self.egg_aim(state) and self.has_explosives(state) and self.springy_step_shoes(state))
             or (self.springy_step_shoes(state) and self.veryLongJump(state)))
        )
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.breegull_blaster(state) and (
            ((self.tall_jump(state) or self.grip_grab(state) or self.beak_buster(state)) and self.flight_pad(state)
             or (self.egg_aim(state) and self.has_explosives(state) and self.springy_step_shoes(state))
             or (self.springy_step_shoes(state) and self.veryLongJump(state)))
        )
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.breegull_blaster(state) and (
            ((self.tall_jump(state) or self.grip_grab(state) or self.beak_buster(state)) and self.flight_pad(state)
             or (self.egg_aim(state) and self.has_explosives(state) and self.springy_step_shoes(state))
             or (self.springy_step_shoes(state) and self.veryLongJump(state)))
        )
    --]]
    
    local explosives = can_shootExplosiveEggs(true)
    
    if ( has("bblaster") ) then
        -- Normal Logic
        if ( (has("tjump") or has("ggrab")) and has("fpad") or has("springb") and has("eggaim") and explosives <= logictype.CurrentStage ) then
            logic = 0
        elseif ( has("springb") and can_veryLongJump() or has("bbust") and has("fpad") ) then
            logic = 1
        elseif ( has("springb") and has("eggaim") and explosives < 2 ) then
            logic = 1 -- Sequence Breaking
        elseif ( has("bbust") and has("fpad") ) then
            logic = 2
            
        -- Sequence Breaking
        elseif ( has("springb") and has("eggaim") ) then
            logic = explosives
        end
    end
    
    return convertLogic(logic, skip)
end

function jiggy_TDL_terrysKids(skip)
    local logic = 99
    --[[        jiggy_terry_kids
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.can_beat_terry(state) and self.hatch(state) and \
                self.taxi_pack(state) and self.access_oogle_boogle(state)\
                and self.flight_pad(state) and self.climb(state) and self.spring_pad(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.can_beat_terry(state) and self.hatch(state) and \
                self.taxi_pack(state) and self.access_oogle_boogle(state)\
                and self.flight_pad(state) and self.climb(state) and self.spring_pad(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.can_beat_terry(state) and self.hatch(state) and \
                self.taxi_pack(state) and self.access_oogle_boogle(state)\
                and self.flight_pad(state) and self.climb(state) and self.spring_pad(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.can_beat_terry(state) and self.hatch(state) and \
                self.taxi_pack(state) and self.access_oogle_boogle(state)\
                and self.flight_pad(state) and self.climb(state) and self.spring_pad(state)
    --]]
    
    local canBeatTerry = access_TDL_terryFight(true)
    local oogleBoogle = access_TDL_oogleBoogle(true)
    
    -- Normal Logic
    if ( canBeatTerry <= logictype.CurrentStage and has_hatch() and has_taxiPack() and oogleBoogle <= logictype.CurrentStage and has("fpad") and has("climb") and has("tjump") ) then
        logic = 0
        
    -- Sequence Breaking
    elseif ( has_hatch() and has_taxiPack() and has("fpad") and has("climb") and has("tjump") ) then
        logic = math.max(canBeatTerry, oogleBoogle)
    end
    
    return convertLogic(logic, skip)
end

function jiggy_TDL_stompingPlainsAsDuo(skip)
    local logic = 99
    --[[        jiggy_stomping_plains
     if self.world.options.logic_type == LogicType.option_intended:
        logic = self.talon_trot(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.talon_trot(state)\
                or self.split_up(state) and self.snooze_pack(state) and self.tall_jump(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.tall_jump(state) or self.talon_trot(state)\
                or self.split_up(state) and self.snooze_pack(state) and self.tall_jump(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.tall_jump(state) or self.talon_trot(state)\
                or self.split_up(state) and self.snooze_pack(state) and self.tall_jump(state)
     --]]
    
    if ( has("ttrot") ) then
        logic = 0
    elseif ( has("tjump") and has_snoozePack() ) then
        logic = 1
    elseif ( has("tjump") ) then
        logic = 2
    elseif ( has("wwing") or (has("randomizewarppads_off") or has("warptl2") and (has("warptl1") or has("warptl3") or has("warptl4"))) and (has("springb") or has("ttrain")) ) then
        logic = 7 -- wonderwing, or smuggling talon trot
    end
    
    return convertLogic(logic, skip)
end

function jiggy_TDL_rocknutTribe(skip)
    local logic = 99
    --[[        jiggy_rocknuts
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.egg_aim(state) and self.clockwork_eggs(state) and self.long_jump(state) and self.tall_jump(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.egg_aim(state) and self.clockwork_eggs(state) and self.long_jump(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.clockwork_eggs(state) and ((self.egg_aim(state) and self.long_jump(state)) or self.veryLongJump(state))
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.clockwork_eggs(state) and ((self.egg_aim(state) and self.long_jump(state)) or self.veryLongJump(state))
    --]]
    
    if ( can_clockworkShot() and can_longJump() and has("tjump") ) then
        logic = 0
    elseif ( can_clockworkShot() and can_longJump() ) then
        logic = 1
    elseif ( can_shootEggs("ceggs") and can_veryLongJump() ) then
        logic = 2
    end
    
    return convertLogic(logic, skip)
end

function jiggy_TDL_roarCage(skip)
    local logic = 99
    --[[        jiggy_roar_cage
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.humbaTDL(state) and self.roar(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.humbaTDL(state) and self.roar(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.humbaTDL(state) and self.roar(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.humbaTDL(state) and self.roar(state)\
                or self.clockwork_shot(state) and (self.springy_step_shoes(state) or self.long_jump(state) or self.split_up(state))
    --]]
    
    local humba = access_TDL_humba(true)
    
    if ( humba <= logictype.CurrentStage and has("roar") ) then
        logic = 0 -- Normal Logic
    elseif ( humba < 3 and has("roar") ) then
        logic = humba -- Sequence Breaking
    elseif ( can_clockworkShot() and (has("springb") or can_longJump() or has("splitup")) ) then
        logic = 3 -- Normal Logic
    
    -- Sequence Breaking
    elseif ( has("roar") ) then
        logic = humba
    end
    
    return convertLogic(logic, skip)
end

----- Notes

function treble_TDL(skip)
    local logic = 99
    --[[        treble_tdl
    if self.world.options.logic_type == LogicType.option_intended:
        logic = ((self.flap_flip(state) and self.grip_grab(state)) or self.TDL_flight_pad(state)) and self.bill_drill(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = ((self.flap_flip(state) and (self.grip_grab(state) or self.beak_buster(state)))\
                 or self.TDL_flight_pad(state)) and self.bill_drill(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = ((self.flap_flip(state) and (self.grip_grab(state) or self.beak_buster(state)))\
                 or self.TDL_flight_pad(state)) and self.bill_drill(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = ((self.flap_flip(state) and (self.grip_grab(state) or self.beak_buster(state))) or self.TDL_flight_pad(state))\
                    and (self.bill_drill(state) or self.egg_barge(state) or self.ground_rat_a_tat_rap(state))\
                or self.humbaTDL(state) and self.mumboTDL(state)
    --]]
    
    local flightPad = access_TDL_flightPad(true)
    local humba = access_TDL_humba(true)
    local mumbo = access_TDL_mumbo(true)
    
    -- Normal Logic
    if ( has_billDrill() and (has("fflip") and has("ggrab") or flightPad <= logictype.CurrentStage) ) then
        logic = 0
    elseif ( has_billDrill() and has("fflip") and has("bbust") ) then
        logic = 1
    elseif ( has_billDrill() and flightPad < 3 ) then
        logic = flightPad -- Sequence Breaking
    elseif ( (can_eggBarge() or has("grat")) and (has("fflip") and (has("bbust") or has("ggrab")) or flightPad <= logictype.CurrentStage) or humba <= logictype.CurrentStage and mumbo <= logictype.CurrentStage ) then
        logic = 3
    
    -- Sequence Breaking
    else
        local withFlight = 99
        if ( can_eggBarge() or has("grat") or has_billDrill() ) then
            withFlight = flightPad
        end
        
        logic = math.max(3, math.min(withFlight, math.max(humba, mumbo)))
    end
    
    return convertLogic(logic, skip)
end

function notes_TDL_nearTrainStationRight(skip)
    local logic = 99
    --[[        notes_tdl_station_right
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.small_elevation(state)\
                or self.humbaTDL(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.small_elevation(state)\
                or self.humbaTDL(state)\
                or self.split_up(state)\
                or self.springy_step_shoes(state)\
                or self.turbo_trainers(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.small_elevation(state)\
                or self.humbaTDL(state)\
                or self.split_up(state)\
                or self.springy_step_shoes(state)\
                or self.turbo_trainers(state)\
                or self.clockwork_shot(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.small_elevation(state)\
                or self.humbaTDL(state)\
                or self.split_up(state)\
                or self.springy_step_shoes(state)\
                or self.turbo_trainers(state)\
                or self.clockwork_shot(state)
    --]]
    
    local humba = access_TDL_humba(true)
    
    -- Normal Logic
    if ( can_reachSmallElevation() or humba <= logictype.CurrentStage ) then
        logic = 0
    elseif ( has("splitup") or has("springb") or has("ttrain") ) then
        logic = 1
    elseif ( humba < 2 ) then
        logic = 1 -- Sequence Breaking
    elseif ( can_clockworkShot() ) then
        logic = 2
    elseif ( has("wwing") ) then
        logic = 7
    
    -- Sequence Breaking
    else
        logic = humba
    end
    
    return convertLogic(logic, skip)
end

function notes_TDL_nearRoarCage(skip)
    local logic = 99
    --[[        notes_roar_cage
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.long_jump(state)\
                or self.springy_step_shoes(state)\
                or self.TDL_flight_pad(state)\
                or self.humbaTDL(state) and self.roar(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.long_jump(state)\
                or self.springy_step_shoes(state)\
                or self.TDL_flight_pad(state)\
                or self.humbaTDL(state) and self.roar(state)\
                or self.split_up(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.long_jump(state)\
                or self.springy_step_shoes(state)\
                or self.TDL_flight_pad(state)\
                or self.humbaTDL(state) and self.roar(state)\
                or self.split_up(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.long_jump(state)\
                or self.springy_step_shoes(state)\
                or self.TDL_flight_pad(state)\
                or self.humbaTDL(state) and self.roar(state)\
                or self.split_up(state)
    --]]
    
    local flightPad = access_TDL_flightPad(true)
    local humba = access_TDL_humba(true)
    
    -- Normal Logic
    if ( can_longJump() or has("springb") or flightPad <= logictype.CurrentStage or humba <= logictype.CurrentStage and has("roar") ) then
        logic = 0
    elseif ( has("splitup") ) then
        logic = 1
    
    -- Sequence Breaking
    else
        local dino = 99
        if ( has("roar") ) then
            dino = humba
        end
        
        logic = math.min(flightPad, dino)
    end
    
    return convertLogic(logic, skip)
end

function notes_TDL_riverPassage(skip)
    local logic = 99
    --[[        notes_river_passage
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.dive(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.dive(state) or self.humbaTDL(state) or self.shack_pack(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.dive(state) or self.humbaTDL(state) or self.shack_pack(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.dive(state) or self.humbaTDL(state) or self.shack_pack(state)
    --]]
    
    local humba = access_TDL_humba(true)
    
    -- Normal Logic
    if ( has("dive") ) then
        logic = 0
    elseif ( humba <= logictype.CurrentStage or has_shackPack() ) then
        logic = 1
    
    -- Sequence Breaking
    else
        logic = math.max(1, humba)
    end
    
    return convertLogic(logic, skip)
end

----- Nests

function nests_TDL_wallWithHoles(skip)
    local logic = 99
    --[[        nest_tdl_wall_with_holes
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.talon_trot(state) or self.tall_jump(state) and self.grip_grab(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.talon_trot(state)\
                or self.tall_jump(state) and self.grip_grab(state)\
                or self.humbaTDL(state)\
                or self.leg_spring(state)\
                or self.glide(state)\
                or self.pack_whack(state)\
                or self.springy_step_shoes(state)\
                or self.turbo_trainers(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.talon_trot(state)\
                or self.tall_jump(state) and self.grip_grab(state)\
                or self.humbaTDL(state)\
                or self.leg_spring(state)\
                or self.glide(state)\
                or self.pack_whack(state)\
                or self.sack_pack(state)\
                or self.springy_step_shoes(state)\
                or self.turbo_trainers(state)\
                or self.clockwork_shot(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.talon_trot(state)\
                or self.tall_jump(state) and self.grip_grab(state)\
                or self.humbaTDL(state)\
                or self.leg_spring(state)\
                or self.glide(state)\
                or self.pack_whack(state)\
                or self.sack_pack(state)\
                or self.springy_step_shoes(state)\
                or self.turbo_trainers(state)\
                or self.clockwork_shot(state)
    --]]
    
    local humba = access_TDL_humba(true)
    
    -- Normal Logic
    if ( has("ttrot") or has("tjump") and has("ggrab") ) then
        logic = 0
    elseif ( humba <= logictype.CurrentStage or has_legSpring() or has_glide() or has_packWhack() or has("springb") or has("ttrain") ) then
        logic = 1
    elseif ( can_clockworkShot() or has_sackPack() ) then
        logic = 2
    
    -- Sequence Breaking
    else
        logic = math.max(1, humba)
    end
    
    return convertLogic(logic, skip)
end

function nests_TDL_waterfallAlcove(skip)
    local logic = 99
    --[[        nest_tdl_waterfall_alcove
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.flap_flip(state) and self.grip_grab(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.flap_flip(state) and self.grip_grab(state)\
                or self.flutter(state)\
                or self.air_rat_a_tat_rap(state)\
                or self.split_up(state)\
                or self.humbaTDL(state) and self.roar(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.flap_flip(state) and self.grip_grab(state)\
                or self.flutter(state)\
                or self.air_rat_a_tat_rap(state)\
                or self.split_up(state)\
                or self.humbaTDL(state) and self.roar(state)\
                or self.clockwork_shot(state)\
                or self.talon_trot(state)\
                or self.turbo_trainers(state)\
                or state.can_reach_region(regionName.TLTOP, self.player)\
                or self.springy_step_shoes(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.flap_flip(state) and self.grip_grab(state)\
                or self.flutter(state)\
                or self.air_rat_a_tat_rap(state)\
                or self.split_up(state)\
                or self.humbaTDL(state) and self.roar(state)\
                or self.clockwork_shot(state)\
                or self.talon_trot(state)\
                or self.turbo_trainers(state)\
                or self.springy_step_shoes(state)\
                or state.can_reach_region(regionName.TLTOP, self.player)\
                or self.humbaTDL(state) and self.mumboTDL(state)
    --]]
    
    -- FIXIT this should probably be in logic on easy tricks with the flight pad
    
    local humba = access_TDL_humba(true)
    local tdltAccessibility = Tracker:FindObjectForCode("@Region: Terrydactyland - Top").AccessibilityLevel
    local mumbo = access_TDL_mumbo(true)
    
    -- Normal Logic
    if ( has("fflip") and has("ggrab") ) then
        logic = 0
    elseif ( has("flutter") or has("arat") or has("splitup") or humba <= logictype.CurrentStage and has("roar") ) then
        logic = 1
    elseif ( can_clockworkShot() or has("ttrot") or has("ttrain") or has("springb") or tdltAccessibility == AccessibilityLevel.Normal or tdltAccessibility == AccessibilityLevel.Cleared ) then
        logic = 2
    elseif ( humba < 3 and has("roar") ) then
        logic = 2 -- Sequence Breaking
    elseif ( humba <= logictype.CurrentStage and mumbo <= logictype.CurrentStage ) then
        logic = 3
    
    -- Sequence Breaking
    else
        local withRoar = 99
        if ( has("roar") ) then
            withRoar = 1
        end
        
        logic = math.max(3, humba, math.min(withRoar, mumbo))
    end
    
    return convertLogic(logic, skip)
end

function nests_TDL_nearRiverPassage(skip)
    local logic = 99
    --[[        nest_river_passage_entrance
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.tall_jump(state) or self.grip_grab(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.tall_jump(state)\
                or self.grip_grab(state)\
                or self.pack_whack(state)\
                or self.wing_whack(state)\
                or self.glide(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.tall_jump(state)\
                or self.grip_grab(state)\
                or self.pack_whack(state)\
                or self.wing_whack(state)\
                or self.glide(state)\
                or self.clockwork_shot(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.tall_jump(state)\
                or self.grip_grab(state)\
                or self.pack_whack(state)\
                or self.wing_whack(state)\
                or self.glide(state)\
                or self.clockwork_shot(state)
    --]]
    
    if ( has("tjump") and has("ggrab") ) then
        logic = 0
    elseif ( has("tjump") or has("ggrab") or has_packWhack() or has_wingWhack() or has_glide() ) then
        logic = 1
    elseif ( can_clockworkShot() ) then
        logic = 2
    end
    
    return convertLogic(logic, skip)
end

function nests_TDL_trainStation(skip)
    local logic = 99
    --[[        enter_tdl_train_station
     if self.world.options.logic_type == LogicType.option_intended:
        logic = self.small_elevation(state)\
                or state.can_reach_region(regionName.CHUFFY, self.player) and state.has(itemName.TRAINSWTD, self.player) and self.can_beat_king_coal(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.small_elevation(state)\
                or self.turbo_trainers(state)\
                or self.springy_step_shoes(state)\
                or self.beak_buster(state)\
                or state.can_reach_region(regionName.CHUFFY, self.player) and state.has(itemName.TRAINSWTD, self.player) and self.can_beat_king_coal(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = True
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = True
     --]]
    
    local chuffyAccessibility = Tracker:FindObjectForCode("@Region: Inside Chuffy").AccessibilityLevel
    local canBeatKingCoal = chuffy_canBeatKingCoal(true)
    
    -- Normal Logic
    if ( can_reachSmallElevation() or has("trainswtd") and (chuffyAccessibility == AccessibilityLevel.Normal or chuffyAccessibility == AccessibilityLevel.Cleared) and canBeatKingCoal <= logictype.CurrentStage ) then
        logic = 0
    elseif ( has("ttrain") or has("springb") or has("bbust") ) then
        logic = 1
    elseif ( has("trainswtd") and logictype.CurrentStage == 0 and chuffyAccessibility > AccessibilityLevel.None and canBeatKingCoal < 2 ) then
        logic = 1 -- Sequence Breaking
    else
        logic = 2
    end
    
    return convertLogic(logic, skip)
end

function nests_TDL_insideMountainByFlightPad(skip)
    local logic = 99
    --[[        nest_mountain_flight_pad
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.tall_jump(state) or self.grip_grab(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.tall_jump(state)\
                or self.grip_grab(state)\
                or self.beak_buster(state)\
                or self.leg_spring(state) and self.glide(state)\
                or state.can_reach_region(regionName.TLTOP, self.player) and self.split_up(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.tall_jump(state)\
                or self.grip_grab(state)\
                or self.beak_buster(state)\
                or self.leg_spring(state) and self.glide(state)\
                or state.can_reach_region(regionName.TLTOP, self.player) and self.split_up(state)\
                or self.clockwork_shot(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.tall_jump(state)\
                or self.grip_grab(state)\
                or self.beak_buster(state)\
                or self.leg_spring(state) and self.glide(state)\
                or state.can_reach_region(regionName.TLTOP, self.player) and self.split_up(state)\
                or self.clockwork_shot(state)
    --]]
    
    local tdltAccessibility = Tracker:FindObjectForCode("@Region: Terrydactyland - Top").AccessibilityLevel
    
    -- Normal Logic
    if ( has("tjump") or has("ggrab") ) then
        logic = 0
    elseif ( has("bbust") or has_legSpring() and has_glide() or has("splitup") and (tdltAccessibility == AccessibilityLevel.Normal or tdltAccessibility == AccessibilityLevel.Cleared) ) then
        logic = 1
    elseif ( can_clockworkShot() ) then
        logic = 2
    
    -- Sequence Breaking
    elseif ( has("splitup") and tdltAccessibility > AccessibilityLevel.None ) then
        logic = logictype.CurrentStage + 1
    end
    
    return convertLogic(logic, skip)
end

function nests_TDL_insideMountainUnderwater(skip)
    local logic = 99
    --[[        nest_mountain_underwater
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.dive(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.dive(state) or self.humbaTDL(state) or self.shack_pack(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.dive(state) or self.humbaTDL(state) or self.shack_pack(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.dive(state) or self.humbaTDL(state) or self.shack_pack(state)
    --]]
    
    local humba = access_TDL_humba(true)
    
    -- Normal Logic
    if ( has("dive") ) then
        logic = 0
    elseif ( has_shackPack() or humba <= logictype.CurrentStage ) then
        logic = 1
    
    -- Sequence Breaking
    else
        logic = humba
    end
    
    return convertLogic(logic, skip)
end

function nests_TDL_riverPassageNearSilo(skip)
    local logic = 99
    --[[        nest_river_passage
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.tall_jump(state) and self.grip_grab(state) and (self.flap_flip(state) or self.split_up(state))
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.tall_jump(state) and self.grip_grab(state) and (self.flap_flip(state) or self.split_up(state))\
                or self.leg_spring(state) and self.glide(state)\
                or self.pack_whack(state) and self.tall_jump(state)\
                or self.pack_whack(state) and self.grip_grab(state)\
                or self.sack_pack(state)\
             or self.split_up(state) and self.tall_jump(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.tall_jump(state) and self.grip_grab(state) and (self.flap_flip(state) or self.split_up(state))\
                or self.leg_spring(state) and self.glide(state)\
                or self.pack_whack(state) and self.tall_jump(state)\
                or self.pack_whack(state) and self.grip_grab(state)\
                or self.sack_pack(state)\
                or self.clockwork_shot(state)\
             or self.split_up(state) and self.tall_jump(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.tall_jump(state) and self.grip_grab(state) and (self.flap_flip(state) or self.split_up(state))\
                or self.leg_spring(state) and self.glide(state)\
                or self.pack_whack(state) and self.tall_jump(state)\
                or self.pack_whack(state) and self.grip_grab(state)\
                or self.sack_pack(state)\
                or self.clockwork_shot(state)\
             or self.split_up(state) and self.tall_jump(state)
    --]]
    
    if ( has("tjump") and has("ggrab") and (has("fflip") or has("splitup")) ) then
        logic = 0
    elseif ( has_legSpring() and has_glide() or has_packWhack() and (has("ggrab") or has("tjump")) or has_sackPack() or has("splitup") and has("tjump") ) then
        logic = 1
    elseif ( can_clockworkShot() ) then
        logic = 2
    elseif ( has("tjump") ) then
        logic = 7 -- FIXIT you can tall jump and then beak buster or even damage boost off the wall enemy to get up, did it myself
    end
    
    return convertLogic(logic, skip)
end

function nests_TDL_ungaBungasCaveTop(skip)
    local logic = 99
    --[[
    state.can_reach_region(regionName.MT, self.player) and self.jiggy_treasure_chamber(state) or self.small_elevation(state)
    --]]
    
    local mtAccessibility = Tracker:FindObjectForCode("@Region: Mayahem Temple - Main Area").AccessibilityLevel
    local jiggyTreasureChamber = jiggy_MT_treasureChamber(true)
    
    -- Normal Logic
    if ( can_reachSmallElevation() or (mtAccessibility == AccessibilityLevel.Normal or mtAccessibility == AccessibilityLevel.Cleared) and jiggyTreasureChamber <= logictype.CurrentStage ) then
        logic = 0
    
    -- Sequence Breaking
    elseif ( mtAccessibility == AccessibilityLevel.Normal or mtAccessibility == AccessibilityLevel.Cleared ) then
        logic = jiggyTreasureChamber
    elseif ( mtAccessibility > AccessibilityLevel.None ) then
        logic = math.max(jiggyTreasureChamber, logictype.CurrentStage + 1)
    end
    
    return convertLogic(logic, skip)
end

function nests_TDL_stompingPlainsFootprint(skip)
    local logic = 99
    --[[        nest_stomping_plains_footprint
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.tall_jump(state) and self.split_up(state)\
                or self.snooze_pack(state)\
                or self.talon_trot(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.tall_jump(state) and self.split_up(state)\
                or self.snooze_pack(state)\
                or self.talon_trot(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.tall_jump(state) and self.split_up(state)\
                or self.snooze_pack(state)\
                or self.talon_trot(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.tall_jump(state) and self.split_up(state)\
                or self.snooze_pack(state)\
                or self.talon_trot(state)
    --]]
    
    if ( has("tjump") and has("splitup") or has_snoozePack() or has("ttrot") ) then
        logic = 0
    elseif ( has("wwing") ) then
        logic = 7
    end
    
    return convertLogic(logic, skip)
end

----- Signs

function signpost_TDL_insideMountainWithTRex(skip)
    local logic = 99
    --[[        signpost_trex
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.humbaTDL(state) and self.roar(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.humbaTDL(state) and self.roar(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.humbaTDL(state) and self.roar(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.humbaTDL(state) and self.roar(state) or self.clockwork_warp(state)
    --]]
    
    local humba = access_TDL_humba(true)
    
    if ( humba <= logictype.CurrentStage and has("roar") ) then
        logic = 0 -- Normal Logic
    elseif ( humba < 3 and has("roar") ) then
        logic = humba -- Sequence Breaking
    elseif ( can_clockworkWarp() ) then
        logic = 3 -- Normal Logic
    
    -- Sequence Breaking
    elseif ( has("roar") ) then
        logic = humba
    end
    
    return convertLogic(logic, skip)
end

function signpost_TDL_insideTopOfMountain(skip)
    local logic = 99
    --[[        signpost_mountain_top
    if self.world.options.logic_type == LogicType.option_intended:
        logic = (self.tall_jump(state) or self.grip_grab(state)) and self.flight_pad(state)\
                or state.can_reach_region(regionName.TLTOP, self.player)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.flight_pad(state) and (
                    self.tall_jump(state)\
                    or self.grip_grab(state)\
                    or self.beak_buster(state)\
                    or self.leg_spring(state) and self.glide(state)\
                    or state.can_reach_region(regionName.TLTOP, self.player) and self.split_up(state)           -- redundant, if you can reach top you don't need the fpad
                )\
                or state.can_reach_region(regionName.TLTOP, self.player)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.flight_pad(state) and (
                    self.tall_jump(state)\
                    or self.grip_grab(state)\
                    or self.beak_buster(state)\
                    or self.leg_spring(state) and self.glide(state)\
                    or state.can_reach_region(regionName.TLTOP, self.player) and self.split_up(state)
                )\
                or state.can_reach_region(regionName.TLTOP, self.player)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.flight_pad(state) and (
                    self.tall_jump(state)\
                    or self.grip_grab(state)\
                    or self.beak_buster(state)\
                    or self.leg_spring(state) and self.glide(state)\
                    or state.can_reach_region(regionName.TLTOP, self.player) and self.split_up(state)
                )\
                or state.can_reach_region(regionName.TLTOP, self.player)
    --]]
    
    local tdlTAccessibility = Tracker:FindObjectForCode("@Region: Terrydactyland - Top").AccessibilityLevel
    
    -- Normal Logic
    if ( (has("tjump") or has("ggrab")) and has("fpad") or tdlTAccessibility == AccessibilityLevel.Normal or tdlTAccessibility == AccessibilityLevel.Cleared ) then
        logic = 0
    elseif ( has("fpad") and (has("bbust") or has_legSpring() and has_glide()) ) then
        logic = 1
    
    -- Sequence Breaking
    elseif ( tdlTAccessibility > AccessibilityLevel.None ) then
        logic = logictype.CurrentStage + 1
    end
    
    return convertLogic(logic, skip)
end

function signpost_TDL_riverPassage(skip)
    local logic = 99
    --[[        signpost_river_passage
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.tall_jump(state) and self.grip_grab(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.tall_jump(state) and self.grip_grab(state)\
                or self.leg_spring(state) and self.glide(state)\
                or self.pack_whack(state) and self.grip_grab(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.tall_jump(state) and self.grip_grab(state)\
                or self.leg_spring(state) and self.glide(state)\
                or self.pack_whack(state) and self.grip_grab(state)\
                or self.sack_pack(state) and self.tall_jump(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.tall_jump(state) and self.grip_grab(state)\
                or self.leg_spring(state) and self.glide(state)\
                or self.pack_whack(state) and self.grip_grab(state)\
                or self.sack_pack(state) and self.tall_jump(state)
    --]]
    
    if ( has("tjump") and has("ggrab") ) then
        logic = 0
    elseif ( has_legSpring() and has_glide() or has_packWhack() and has("ggrab") ) then
        logic = 1
    elseif ( has_sackPack() and has("tjump") ) then
        logic = 2
    end
    
    return convertLogic(logic, skip)
end

----- Other - Jinjos

function jinjo_TDL_entrance(skip)
    local logic = 99
    --[[        jinjo_tdl_entrance
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.TDL_flight_pad(state) and (self.beak_bomb(state) or self.grenade_eggs(state) and self.egg_aim(state))
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.TDL_flight_pad(state) and (self.beak_bomb(state) or self.grenade_eggs(state))
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = (self.TDL_flight_pad(state) and self.beak_bomb(state)) or (self.grenade_eggs(state)\
                and (self.egg_aim(state) or self.long_jump(state) or self.TDL_flight_pad(state) or self.turbo_trainers(state) or self.split_up(state)))
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = (self.TDL_flight_pad(state) and self.beak_bomb(state)) or (self.grenade_eggs(state)\
                and (self.egg_aim(state) or self.long_jump(state) or self.TDL_flight_pad(state) or self.turbo_trainers(state) or self.split_up(state)))
    --]]
    
    local flightPad = access_TDL_flightPad(true)
    
    -- Normal Logic
    if ( flightPad <= logictype.CurrentStage and (has("bbomb") or can_shootEggs("geggs") and has("eggaim")) ) then
        logic = 0
    elseif ( flightPad <= logictype.CurrentStage and can_shootEggs("geggs") ) then
        logic = 1
    elseif ( flightPad < 2 and (has("bbomb") or can_shootEggs("geggs")) ) then
        logic = 1 -- Sequence Breaking
    elseif ( can_shootEggs("geggs") and (has("eggaim") or can_longJump() or has("ttrain") or has("splitup")) ) then
        logic = 2
    
    -- Sequence Breaking
    elseif ( has("bbomb") or can_shootEggs("geggs") ) then
        logic = flightPad
    end
    
    return convertLogic(logic, skip)
end

function jinjo_TDL_underwaterCage(skip)
    local logic = 99
    --[[
    self.talon_torpedo(state) and self.dive(state)
    --]]
    
    if ( has("dive") and has("ttorp") ) then
        logic = 0
    end
    
    return convertLogic(logic, skip)
end

function jinjo_TDL_wallWithHoles(skip)
    local logic = 99
    --[[
    self.clockwork_eggs(state)
    --]]
    
    -- Normal Logic
    if ( can_shootEggs("ceggs") ) then
        logic = 0
    end
    
    return convertLogic(logic, skip)
end

function jinjo_TDL_bigTRexSwitch(skip)
    local logic = 99
    --[[        jinjo_big_t_rex
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.mumboTDL(state) and self.humbaTDL(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.mumboTDL(state) and self.humbaTDL(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.mumboTDL(state) and self.humbaTDL(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = (self.mumboTDL(state) and self.humbaTDL(state)) or \
                self.clockwork_eggs(state)
    --]]
    
    local mumbo = access_TDL_mumbo(true)
    local humba = access_TDL_humba(true)
    
    -- Normal Logic
    if ( mumbo <= logictype.CurrentStage and humba <= logictype.CurrentStage ) then
        logic = 0
    elseif ( mumbo < 3 and humba < 3 ) then
        logic = math.max(mumbo, humba) -- Sequence Breaking
    elseif ( can_shootEggs("ceggs") ) then
        logic = 3
    
    -- Sequence Breaking
    else
        logic = math.max(mumbo, humba)
    end
    
    return convertLogic(logic, skip)
end

function jinjo_TDL_stompingPlains(skip)
    local logic = 99
    --[[        jinjo_stomping_plains
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.split_up(state) and self.tall_jump(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.split_up(state) and self.tall_jump(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.split_up(state) and self.tall_jump(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = (self.split_up(state) and self.tall_jump(state)\
                or self.egg_barge(state) and (self.tall_jump(state) or self.talon_trot(state) or self.springy_step_shoes(state) or self.turbo_trainers(state)))
    --]]
    
    if ( has("splitup") and has("tjump") ) then
        logic = 0
    elseif ( can_eggBarge() and (has("tjump") or has("ttrot") or has("springb") or has("ttrain")) ) then
        logic = 3
    end
    
    return convertLogic(logic, skip)
end

----- Other - Glowbos

function glowbo_TDL_openLedge(skip)
    local logic = 99
    --[[        glowbo_tdl
    if self.world.options.logic_type == LogicType.option_intended:
        logic = (self.small_elevation(state) or self.TDL_flight_pad(state))
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.small_elevation(state)\
                or self.TDL_flight_pad(state)\
                or self.humbaTDL(state)\
                or self.springy_step_shoes(state)\
                or self.turbo_trainers(state)\
                or self.beak_buster(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.small_elevation(state)\
                or self.TDL_flight_pad(state)\
                or self.humbaTDL(state)\
                or self.springy_step_shoes(state)\
                or self.turbo_trainers(state)\
                or self.clockwork_shot(state)\
                or self.beak_buster(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.small_elevation(state)\
                or self.TDL_flight_pad(state)\
                or self.humbaTDL(state)\
                or self.springy_step_shoes(state)\
                or self.turbo_trainers(state)\
                or self.clockwork_shot(state)\
                or self.beak_buster(state)
    --]]
    
    local flightPad = access_TDL_flightPad(true)
    local humba = access_TDL_humba(true)
    
    -- Normal Logic
    if ( can_reachSmallElevation() or flightPad <= logictype.CurrentStage ) then
        logic = 0
    elseif ( humba <= logictype.CurrentStage or has("springb") or has("ttrain") or has("bbust") ) then
        logic = 1
    elseif ( flightPad < 2 ) then
        logic = 1 -- Sequence Breaking
    elseif ( can_clockworkShot() ) then
        logic = 2
    elseif ( has("wwing") ) then
        logic = 7
    
    -- Sequence Breaking
    else
        logic = math.max(1, math.min(flightPad, humba))
    end
    
    return convertLogic(logic, skip)
end

function glowbo_TDL_mumbo(skip)
    local logic = 99
    --[[        glowbo_tdl_mumbo
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.stilt_stride(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = True
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = True
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = True
    --]]
    
    if ( has("sstride") ) then
        logic = 0
    else
        logic = 1
    end
    
    return convertLogic(logic, skip)
end

----- Other - Honeycombs

function honeycomb_TDL_lakeside(skip)
    local logic = 99
    --[[        honeycomb_lakeside
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.turbo_trainers(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.turbo_trainers(state) or self.TDL_flight_pad(state)\
            or (self.tall_jump(state) and self.veryLongJump(state) and self.grip_grab(state))\
            or self.split_up(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.turbo_trainers(state) or self.TDL_flight_pad(state) or self.clockwork_shot(state)\
            or (self.tall_jump(state) and self.veryLongJump(state) and self.grip_grab(state))\
            or self.split_up(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.turbo_trainers(state) or self.TDL_flight_pad(state) or self.clockwork_shot(state)\
            or (self.tall_jump(state) and self.veryLongJump(state) and self.grip_grab(state))\
            or self.split_up(state)
    --]]
    
    local flightPad = access_TDL_flightPad(true)
    
    -- Normal Logic
    if ( has("ttrain") ) then
        logic = 0
    elseif ( flightPad <= logictype.CurrentStage or has("splitup") or has("tjump") and has("ggrab") and can_veryLongJump() ) then
        logic = 1
    elseif ( can_clockworkShot() ) then
        logic = 2
    
    -- Sequence Breaking
    else
        logic = math.max(1, flightPad)
    end
    
    return convertLogic(logic, skip)
end

function honeycomb_TDL_styracosaurusCaveAlcove(skip)
    local logic = 99
    --[[        honeycomb_styracosaurus
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.bill_drill(state) and self.split_up(state) and self.spring_pad(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.bill_drill(state) and self.split_up(state) and self.spring_pad(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = (self.bill_drill(state) and self.split_up(state) and self.spring_pad(state)) or \
                (self.leg_spring(state) and self.wing_whack(state) and self.glide(state))\
                or self.clockwork_shot(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = (self.bill_drill(state) and self.split_up(state) and self.spring_pad(state)) or \
                (self.leg_spring(state) and self.wing_whack(state) and self.glide(state))\
                or self.clockwork_shot(state)
    --]]
    
    if ( has_billDrill() and has("splitup") and has("tjump") ) then
        logic = 0
    elseif ( can_clockworkShot() or has_legSpring() and has_wingWhack() and has_glide() ) then
        logic = 2
    end
    
    return convertLogic(logic, skip)
end

function honeycomb_TDL_riverPassage(skip)
    local logic = 99
    --[[        honeycomb_river
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.talon_trot(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.talon_trot(state) or self.split_up(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.talon_trot(state) or self.clockwork_shot(state) or self.humbaTDL(state) or self.split_up(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.talon_trot(state) or self.clockwork_shot(state) or self.humbaTDL(state) or self.split_up(state)
    --]]
    
    local humba = access_TDL_humba(true)
    
    -- Normal Logic
    if ( has("ttrot") ) then
        logic = 0
    elseif ( has("splitup") ) then
        logic = 1
    elseif ( can_clockworkShot() or humba <= logictype.CurrentStage ) then
        logic = 2
    
    -- Sequence Breaking
    else
        logic = humba
    end
    
    return convertLogic(logic, skip)
end

----- Other - Cheato Pages

function cheato_TDL_dippyPool(skip)
    local logic = 99
    --[[
    if self.world.options.logic_type == LogicType.option_intended:
        logic = state.can_reach_region(regionName.CC, self.player) and self.jiggy_dippy(state) and self.dive(state)\
            and ((self.small_elevation(state) and self.springy_step_shoes(state)) or self.TDL_flight_pad(state))
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = state.can_reach_region(regionName.CC, self.player) and self.jiggy_dippy(state) and self.dive(state)\
            and ((self.small_elevation(state) and self.springy_step_shoes(state)) or self.TDL_flight_pad(state))
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = state.can_reach_region(regionName.CC, self.player) and self.jiggy_dippy(state) and self.dive(state)\
            and ((self.small_elevation(state) and self.springy_step_shoes(state)) or self.TDL_flight_pad(state))
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = state.can_reach_region(regionName.CC, self.player) and self.jiggy_dippy(state) and self.dive(state)\
            and ((self.small_elevation(state) and self.springy_step_shoes(state)) or self.TDL_flight_pad(state))
    --]]
    
    local ccAccessibility = Tracker:FindObjectForCode("@Region: Cloud Cuckooland").AccessibilityLevel
    local dippyJiggy = jiggy_TDL_dippy(true)
    local flightPad = access_TDL_flightPad(true)
    
    -- Normal Logic
    if ( (ccAccessibility == AccessibilityLevel.Normal or ccAccessibility == AccessibilityLevel.Cleared) and dippyJiggy <= logictype.CurrentStage and has("dive") and (can_reachSmallElevation() and has("springb") or flightPad <= logictype.CurrentStage) ) then
        logic = 0
    
    -- Sequence Breaking
    elseif ( has("dive") ) then
        local byJumping = 99
        if ( can_reachSmallElevation() and has("springb") ) then
            byJumping = 0
        end
        
        if ( ccAccessibility == AccessibilityLevel.Normal or ccAccessibility == AccessibilityLevel.Cleared ) then
            logic = math.max(dippyJiggy, math.min(byJumping, flightPad))
        elseif ( ccAccessibility > AccessibilityLevel.None ) then
            logic = math.max(logictype.CurrentStage + 1, dippyJiggy, math.min(byJumping, flightPad))
        end
    end
    
    return convertLogic(logic, skip)
end

function cheato_TDL_insideMountainWithTRex(skip)
    local logic = 99
    --[[        cheato_trex
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.humbaTDL(state) and self.roar(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.humbaTDL(state) and self.roar(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.humbaTDL(state) and self.roar(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.humbaTDL(state) and self.roar(state) or self.clockwork_eggs(state)
    --]]
    
    local humba = access_TDL_humba(true)
    
    if ( humba <= logictype.CurrentStage and has("roar") ) then
        logic = 0 -- Normal Logic
    elseif ( humba < 3 and has("roar") ) then
        logic = humba -- Sequence Breaking
    elseif ( logictype.CurrentStage > 2 and can_shootEggs("ceggs") ) then
        logic = 3 -- Normal Logic
    
    -- Sequence Breaking
    elseif ( has("roar") ) then
        logic = humba
    end
    
    return convertLogic(logic, skip)
end

function cheato_TDL_boulderByMumbo(skip)
    local logic = 99
    --[[
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.bill_drill(state) and self.flap_flip(state) and self.grip_grab(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.bill_drill(state)\
                    and (self.TDL_flight_pad(state)\
                         or self.grip_grab(state) and (self.flap_flip(state) or (self.talon_trot(state) and self.flutter(state))))
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.bill_drill(state)\
                    and (self.TDL_flight_pad(state)\
                         or self.grip_grab(state) and (self.flap_flip(state) or (self.talon_trot(state) and self.flutter(state)))\
                         or state.can_reach_region(regionName.TLTOP, self.player) and self.talon_trot(state) and (self.flutter(state) or self.air_rat_a_tat_rap(state))
                    )
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = (self.bill_drill(state) or self.egg_barge(state))\
                    and (self.TDL_flight_pad(state)\
                         or self.grip_grab(state) and (self.flap_flip(state) or (self.talon_trot(state) and self.flutter(state)))\
                         or state.can_reach_region(regionName.TLTOP, self.player) and self.talon_trot(state) and (self.flutter(state) or self.air_rat_a_tat_rap(state))
                    )
    --]]
    
    local flightPad = access_TDL_flightPad(true)
    local tdltAccessibility = Tracker:FindObjectForCode("@Region: Terrydactyland - Top").AccessibilityLevel
    
    -- Normal Logic
    if ( has_billDrill() and has("fflip") and has("ggrab") ) then
        logic = 0
    elseif ( has_billDrill() and (flightPad <= logictype.CurrentStage or has("ggrab") and has("ttrot") and has("flutter")) ) then
        logic = 1
    elseif ( has_billDrill() and (tdltAccessibility == AccessibilityLevel.Normal or tdltAccessibility == AccessibilityLevel.Cleared) and has("ttrot") and (has("flutter") or has("arat")) ) then
        logic = 2
    elseif ( has_billDrill() and flightPad < 3 ) then
        logic = 2 -- Sequence Breaking
    elseif ( can_eggBarge() and (flightPad <= logictype.CurrentStage or has("ggrab") and (has("fflip") or has("ttrot") and has("flutter")) or (tdltAccessibility == AccessibilityLevel.Normal or tdltAccessibility == AccessibilityLevel.Cleared) and has("ttrot") and (has("flutter") or has("arat"))) ) then
        logic = 3
    
    -- Sequence Breaking
    elseif ( has_billDrill() or can_eggBarge() ) then
        local fromTop = 99
        if ( (tdltAccessibility == AccessibilityLevel.Normal or tdltAccessibility == AccessibilityLevel.Cleared) and has("ttrot") and (has("flutter") or has("arat")) ) then
            fromTop = 2
        elseif ( tdltAccessibility > AccessibilityLevel.None and has("ttrot") and (has("flutter") or has("arat")) ) then
            fromTop = logictype.CurrentStage + 1
        end
        
        logic = math.max(3, math.min(fromTop, flightPad))
    end
    
    return convertLogic(logic, skip)
end

----- Other

function trainSwitch_TDL(skip)
    local logic = 99
    --[[        tswitch_tdl
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.flap_flip(state)\
                or self.veryLongJump(state)\
                or self.TDL_flight_pad(state)\
                or self.tall_jump(state) and self.grip_grab(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.flap_flip(state)\
                or self.veryLongJump(state)\
                or self.TDL_flight_pad(state)\
                or self.split_up(state)\
                or self.springy_step_shoes(state)\
                or self.tall_jump(state) and self.air_rat_a_tat_rap(state)\
                or self.tall_jump(state) and self.grip_grab(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.flap_flip(state)\
                or self.veryLongJump(state)\
                or self.TDL_flight_pad(state)\
                or self.split_up(state)\
                or self.springy_step_shoes(state)\
                or self.tall_jump(state) and self.air_rat_a_tat_rap(state)\
                or self.tall_jump(state) and self.grip_grab(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.flap_flip(state)\
                or self.veryLongJump(state)\
                or self.TDL_flight_pad(state)\
                or self.split_up(state)\
                or self.springy_step_shoes(state)\
                or self.tall_jump(state) and self.air_rat_a_tat_rap(state)\
                or self.tall_jump(state) and self.grip_grab(state)
    --]]
    
    local flightPad = access_TDL_flightPad(true)
    
    -- Normal Logic
    if ( has("fflip") or can_veryLongJump() or has("tjump") and has("ggrab") or flightPad <= logictype.CurrentStage ) then
        logic = 0
    elseif ( has("splitup") or has("springb") or has("tjump") and has("arat") ) then
        logic = 1
    
    -- Sequence Breaking
    else
        logic = flightPad
    end
    
    return convertLogic(logic, skip)
end