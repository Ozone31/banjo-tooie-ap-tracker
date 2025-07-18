--------------- Grunty Industries

----- Basic & Access functions

function basic_GI_canUseBattery()
    --[[
    self.pack_whack(state) and self.taxi_pack(state)
    --]]
    
    return has_packWhack() and has_taxiPack()
end

function basic_GI_elevatorDoor()
    --[[
    return self.beak_barge(state)\
            or self.grenade_eggs(state)\
            or self.ground_rat_a_tat_rap(state)\
            or self.air_rat_a_tat_rap(state)
    --]]
    
    return ( has("bbarge") or can_shootEggs("geggs") or has("grat") or has("arat") )
end

function access_GI_flightPadSwitch(skip)
    local logic = 99
    --[[        gi_flight_pad_switch
    if self.world.options.logic_type == LogicType.option_intended:
        logic = state.can_reach_region(regionName.GI4, self.player)\
                or self.humbaGI(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = state.can_reach_region(regionName.GI4, self.player)\
                or self.humbaGI(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = state.can_reach_region(regionName.GI4, self.player)\
                or self.humbaGI(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = state.can_reach_region(regionName.GI4, self.player)\
                or self.humbaGI(state)
    --]]
    
    local gi4Accessibility = Tracker:FindObjectForCode("@Region: Grunty Industries 4th Floor").AccessibilityLevel
    local humba = access_GI_humba(true)
    
    -- Normal Logic
    if ( gi4Accessibility == AccessibilityLevel.Normal or gi4Accessibility == AccessibilityLevel.Cleared or humba <= logictype.CurrentStage ) then
        logic = 0
    
    -- Sequence Breaking
    else
        local floor4 = 99
        if ( gi4Accessibility > AccessibilityLevel.None ) then
            floor4 = logictype.CurrentStage + 1
        end
        
        logic = math.min(humba, floor4)
    end
    
    return convertLogic(logic, skip)
end

function access_GI_floor2SplitUp(skip)
    local logic = 99
    --[[        floor_2_split_up
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.split_up(state) and\
                (self.climb(state) or self.has_explosives(state))
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.split_up(state) and\
                (self.climb(state) or self.has_explosives(state))
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.split_up(state) and\
                (self.climb(state) or self.has_explosives(state) or self.claw_clamber_boots(state) and self.extremelyLongJump(state))
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.split_up(state) and\
                (self.climb(state) or self.has_explosives(state) or self.claw_clamber_boots(state) and self.extremelyLongJump(state))
    --]]
    
    local explosives = can_shootExplosiveEggs(true)
    local extremelyLongJump = can_extremelyLongJump(true)
    
    if ( has("splitup") and (has("climb") or explosives <= logictype.CurrentStage) ) then
        logic = 0 -- Normal Logic
    elseif ( has("splitup") and explosives < 2 ) then
        logic = 1 -- Sequence Breaking
    elseif ( has("splitup") and has("clawbts") and extremelyLongJump <= logictype.CurrentStage ) then
        logic = 2 -- Normal Logic
    
    -- Sequence Breaking
    elseif ( has("splitup") ) then
        local clawbts = 99
        if ( has("splitup") ) then
            clawbts = extremelyLongJump
        end
        
        logic = math.min(explosives, clawbts)
    end
    
    return convertLogic(logic, skip)
end

function access_GI_floor3SplitUp(skip)
    local logic = 99
    --[[        floor_3_split_up
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.split_up(state) and self.small_elevation(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.split_up(state) and self.small_elevation(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.split_up(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.split_up(state)
     --]]
    
    if ( has("splitup") and can_reachSmallElevation() ) then
        logic = 0
    elseif ( has("splitup") ) then
        logic = 2
    end
    
    return convertLogic(logic, skip)
end

function access_GI_enterFloor3FromFireExit(skip)
    local logic = 99
    --[[        enter_floor_3_from_fire_exit
    return state.can_reach_region(regionName.GIOB, self.player) and self.outside_gi_back_to_floor_3(state)\
            or state.can_reach_region(regionName.GI4, self.player) and self.floor_4_to_floor_3(state)\
            or state.can_reach_region(regionName.GIR, self.player) and self.roof_to_upper_floors(state)
    --]]
    
    local giobAccessibility = Tracker:FindObjectForCode("@Region: Outside Grunty Industries - Behind the building").AccessibilityLevel
    local gi4Accessibility = Tracker:FindObjectForCode("@Region: Grunty Industries 4th Floor").AccessibilityLevel
    local girAccessibility = Tracker:FindObjectForCode("@Region: Grunty Industries Roof").AccessibilityLevel
    local giob = connector_GIOBack_to_GIF3(true)
    local gif4 = connector_GIF4_to_GIF3(true)
    local roof = connector_GIRoof_to_GIF3_or_GIF4(true)
    
    -- Normal Logic
    if ( (giobAccessibility == AccessibilityLevel.Normal or giobAccessibility == AccessibilityLevel.Cleared) and giob <= logictype.CurrentStage or (gi4Accessibility == AccessibilityLevel.Normal or gi4Accessibility == AccessibilityLevel.Cleared) and gif4 <= logictype.CurrentStage or (girAccessibility == AccessibilityLevel.Normal or girAccessibility == AccessibilityLevel.Cleared) and roof <= logictype.CurrentStage ) then
        logic = 0
    
    -- Sequence Breaking
    else
        local fromOB = 99
        if ( giobAccessibility == AccessibilityLevel.Normal or giobAccessibility == AccessibilityLevel.Cleared ) then
            fromOB = giob
        elseif ( giobAccessibility > AccessibilityLevel.None ) then
            fromOB = math.max(giob, logictype.CurrentStage + 1)
        end
        
        local fromF4 = 99
        if ( gi4Accessibility == AccessibilityLevel.Normal or gi4Accessibility == AccessibilityLevel.Cleared ) then
            fromF4 = gif4
        elseif ( gi4Accessibility > AccessibilityLevel.None ) then
            fromF4 = math.max(gif4, logictype.CurrentStage + 1)
        end
        
        local fromRoof = 99
        if ( girAccessibility == AccessibilityLevel.Normal or girAccessibility == AccessibilityLevel.Cleared ) then
            fromRoof = roof
        elseif ( girAccessibility > AccessibilityLevel.None ) then
            fromRoof = math.max(roof, logictype.CurrentStage + 1)
        end
        
        logic = math.min(fromOB, fromF4, fromRoof)
    end
    
    return convertLogic(logic, skip)
end

function access_GI_dropDownFromHigherFloorsOutside(skip)
    local logic = 99
    --[[        drop_down_from_higher_floors_outside
    if self.world.options.logic_type == LogicType.option_intended:
        logic = False
    elif self.world.options.logic_type == LogicType.option_easy_tricks : # normal
        logic = self.beak_buster(state) or self.flutter(state) or self.air_rat_a_tat_rap(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = True
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = True
    --]]
    
    if ( has("bbust") or has("flutter") or has("arat") ) then
        logic = 1
    else
        logic = 2
    end
    
    return convertLogic(logic, skip)
end

function access_GI_escapeFloor4(skip)
    local logic = 99
    --[[        escape_floor_4_bk
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.springy_step_shoes(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks : # normal
        logic = self.springy_step_shoes(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.springy_step_shoes(state) or self.flap_flip(state) and self.grip_grab(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.springy_step_shoes(state) or self.flap_flip(state) and self.grip_grab(state)
    --]]
    
    if ( has("springb") ) then
        logic = 0
    elseif ( has("fflip") and has("ggrab") ) then
        logic = 2
    end
    
    return convertLogic(logic, skip)
end

function access_GI_soloBanjoWasteDisposal(skip)
    local logic = 99
    --[[        solo_banjo_waste_disposal
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.grip_grab(state) and self.can_use_battery(state) and self.climb(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.can_use_battery(state) and (self.grip_grab(state) and self.climb(state) or self.tall_jump(state))
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.can_use_battery(state) and (self.grip_grab(state) and self.climb(state) or self.tall_jump(state))
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.can_use_battery(state) and (self.grip_grab(state) and self.climb(state) or self.tall_jump(state))
    --]]
    
    if ( has("ggrab") and has("climb") and basic_GI_canUseBattery() ) then
        logic = 0
    elseif ( basic_GI_canUseBattery() and has("tjump") ) then
        logic = 1
    end
    
    return convertLogic(logic, skip)
end

function access_GI_mumbo(skip)
    local logic = 99
    --[[        mumboGI
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.small_elevation(state) and state.has(itemName.MUMBOGI, self.player) and state.can_reach_region(regionName.GI3, self.player)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.small_elevation(state) and state.has(itemName.MUMBOGI, self.player) and state.can_reach_region(regionName.GI3, self.player)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = state.has(itemName.MUMBOGI, self.player) and state.can_reach_region(regionName.GI3, self.player) and \
                self.small_elevation(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = state.has(itemName.MUMBOGI, self.player) and state.can_reach_region(regionName.GI3, self.player) and \
                self.small_elevation(state)
    --]]
    
    if ( has("mumbogi") and can_reachSmallElevation() ) then
        local gi3Accessibility = Tracker:FindObjectForCode("@Region: Grunty Industries 3rd Floor").AccessibilityLevel
        
        -- Normal Logic
        if ( gi3Accessibility == AccessibilityLevel.Normal or gi3Accessibility == AccessibilityLevel.Cleared ) then
            logic = 0
        
        -- Sequence Breaking
        elseif ( gi3Accessibility > AccessibilityLevel.None ) then
            logic = logictype.CurrentStage + 1 -- was already converted once by the json
        end
    end
    
    return convertLogic(logic, skip)
end

function access_GI_humba(skip)
    local logic = 99
    --[[        humbaGI
    state.has(itemName.HUMBAGI, self.player) and state.can_reach_region(regionName.GI2, self.player)
    --]]
    
    if ( has("humbagi") ) then
        local gi2Accessibility = Tracker:FindObjectForCode("@Region: Grunty Industries 2nd Floor").AccessibilityLevel
        
        -- Normal Logic
        if ( gi2Accessibility == AccessibilityLevel.Normal or gi2Accessibility == AccessibilityLevel.Cleared ) then
            logic = 0
        
        -- Sequence Breaking
        elseif ( gi2Accessibility > AccessibilityLevel.None ) then
            logic = logictype.CurrentStage + 1
        end
    end
    
    return convertLogic(logic, skip)
end

function access_GI_canBeatWeldar(skip)
    local logic = 99
    --[[        can_beat_weldar
     if self.world.options.logic_type == LogicType.option_intended:
        logic = self.grenade_eggs(state) and \
                (self.tall_jump(state) and (self.flutter(state) or self.air_rat_a_tat_rap(state)))\
                and state.can_reach_region(regionName.GIBOSS, self.player)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.grenade_eggs(state) and \
                (self.tall_jump(state) and (self.flutter(state) or self.air_rat_a_tat_rap(state)))\
                and state.can_reach_region(regionName.GIBOSS, self.player)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.grenade_eggs(state) and \
                (self.tall_jump(state) and (self.flutter(state) or self.air_rat_a_tat_rap(state)))\
                and state.can_reach_region(regionName.GIBOSS, self.player)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.grenade_eggs(state) and \
                (self.tall_jump(state) and (self.flutter(state) or self.air_rat_a_tat_rap(state)))\
                and state.can_reach_region(regionName.GIBOSS, self.player)
     --]]
    
    local bawAccessibility = Tracker:FindObjectForCode("@Region: Boss Arena - Weldar").AccessibilityLevel
    
    -- Normal Logic
    if ( can_shootEggs("geggs") and has("tjump") and (has("flutter") or has("arat")) and (bawAccessibility == AccessibilityLevel.Normal or bawAccessibility == AccessibilityLevel.Cleared) ) then
        logic = 0
    
    -- Sequence Breaking
    elseif ( can_shootEggs("geggs") and has("tjump") and (has("flutter") or has("arat")) and bawAccessibility > AccessibilityLevel.None ) then
        logic = logictype.CurrentStage + 1
    end
    
    return convertLogic(logic, skip)
end

function access_GI_floor2SkivvySwitch(skip)
    local logic = 99
    --[[        floor_2_skivvy_switch
    if self.world.options.logic_type == LogicType.option_intended:
        logic = state.can_reach_region(regionName.GI2, self.player) and self.claw_clamber_boots(state) and self.flap_flip(state) and self.grip_grab(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = state.can_reach_region(regionName.GI2, self.player) and self.claw_clamber_boots(state)\
                    and ((self.flap_flip(state) and self.grip_grab(state))\
                         or self.talon_trot(state) and (self.flutter(state) or self.air_rat_a_tat_rap(state)))\
                or state.can_reach_region(regionName.GI2, self.player) and self.floor_2_split_up(state)\
                    and (self.leg_spring(state) or self.claw_clamber_boots(state) and (self.can_shoot_any_egg(state) or self.wing_whack(state)))\
                or state.can_reach_region(regionName.GI3, self.player) and\
                    (self.climb(state) and (self.veryLongJump(state) or (self.flap_flip(state) or self.tall_jump(state)) and self.grip_grab(state))\
                        or self.small_elevation(state) and self.split_up(state) and self.leg_spring(state))                                         -- leg spring requires split up, so checking for split up is redundant
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = state.can_reach_region(regionName.GI2, self.player) and self.claw_clamber_boots(state)\
                    and ((self.flap_flip(state) and self.grip_grab(state))\
                         or self.talon_trot(state) and (self.flutter(state) or self.air_rat_a_tat_rap(state)))\
                or state.can_reach_region(regionName.GI2, self.player) and self.floor_2_split_up(state)\
                    and (self.leg_spring(state) or self.claw_clamber_boots(state) and (self.can_shoot_any_egg(state) or self.wing_whack(state)))\
                or state.can_reach_region(regionName.GI3, self.player) and\
                    (self.climb(state) and (self.veryLongJump(state) or (self.flap_flip(state) or self.tall_jump(state)) and self.grip_grab(state))\
                        or self.small_elevation(state) and self.split_up(state) and self.leg_spring(state))
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = state.can_reach_region(regionName.GI2, self.player) and self.claw_clamber_boots(state)\
                    and ((self.flap_flip(state) and self.grip_grab(state))\
                         or self.talon_trot(state) and (self.flutter(state) or self.air_rat_a_tat_rap(state)))\
                or state.can_reach_region(regionName.GI2, self.player) and self.floor_2_split_up(state)\
                    and (self.leg_spring(state) or self.claw_clamber_boots(state) and (self.can_shoot_any_egg(state) or self.wing_whack(state)))\
                or state.can_reach_region(regionName.GI3, self.player) and\
                    (self.climb(state) and (self.veryLongJump(state) or (self.flap_flip(state) or self.tall_jump(state)) and self.grip_grab(state))\
                        or self.small_elevation(state) and self.split_up(state) and self.leg_spring(state))
     --]]
   
    local gi2Accessibility = Tracker:FindObjectForCode("@Region: Grunty Industries 2nd Floor").AccessibilityLevel
    local gi3Accessibility = Tracker:FindObjectForCode("@Region: Grunty Industries 3rd Floor").AccessibilityLevel
    local gi2Accessible = (gi2Accessibility == AccessibilityLevel.Normal or gi2Accessibility == AccessibilityLevel.Cleared)
    local gi3Accessible = (gi3Accessibility == AccessibilityLevel.Normal or gi3Accessibility == AccessibilityLevel.Cleared)
    local floor2SplitUp = access_GI_floor2SplitUp(true)
    
    -- Normal Logic
    if ( gi2Accessible and has("clawbts") and has("fflip") and has("ggrab") ) then
        logic = 0
    elseif ( gi2Accessible and has("clawbts") and has("ttrot") and (has("flutter") or has("arat")) or gi2Accessible and floor2SplitUp <= logictype.CurrentStage and (has_legSpring() or has("clawbts") and (can_shootEggs() or has_wingWhack())) or gi3Accessible and (has("climb") and (can_veryLongJump() or has("ggrab") and (has("fflip") or has("tjump"))) or can_reachSmallElevation() and has_legSpring()) ) then
        logic = 1
    
    -- Sequence Breaking
    elseif ( gi2Accessible and (has_legSpring() or has("clawbts") and (can_shootEggs() or has_wingWhack())) ) then
        logic = math.max(1, floor2SplitUp)
    else
        local f2 = 99
        if ( gi2Accessibility > AccessibilityLevel.None and (has_legSpring() or has("clawbts") and (can_shootEggs() or has_wingWhack())) ) then
            f2 = math.max(floor2SplitUp, logictype.CurrentStage + 1)
        end
        
        local f3 = 99
        if ( gi3Accessibility > AccessibilityLevel.None and (has("climb") and (can_veryLongJump() or has("ggrab") and (has("fflip") or has("tjump"))) or can_reachSmallElevation() and has_legSpring()) ) then
            f3 = logictype.CurrentStage + 1
        end
        
        logic = math.min(f2, f3)
    end
    
    return convertLogic(logic, skip)
end

function access_GI_warpPadF4(skip)
    local logic = 99
    --[[        warp_pad_floor_4
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.small_elevation(state)\
                or state.can_reach_region(regionName.GIWARP, self.player) and state.has(itemName.WARPGI4, self.player)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.small_elevation(state)\
                or state.can_reach_region(regionName.GIWARP, self.player) and state.has(itemName.WARPGI4, self.player)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = True
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = True
    --]]
    
    local giWAccessibility = Tracker:FindObjectForCode("@Grunty Industries Warps").AccessibilityLevel
    
    
    if ( can_reachSmallElevation() or has("warpgi4") and (giWAccessibility == AccessibilityLevel.Normal or giWAccessibility == AccessibilityLevel.Cleared) ) then
        logic = 0 -- Normal Logic
    elseif ( logictype.CurrentStage < 1 and has("warpgi4") and giWAccessibility > AccessibilityLevel.None ) then
        logic = 1 -- Sequence Breaking
    else
        logic = 2
    end
    
    return convertLogic(logic, skip)
end

----- Silos

function silo_GI_snoozePack(skip)
    local logic = 99
    --[[        silo_snooze
    self.check_notes(state, locationName.SNPACK) and self.solo_banjo_waste_disposal(state)
    --]]
    
    local soloBanjoWasteDisposal = access_GI_soloBanjoWasteDisposal(true)
    
    -- Normal Logic
    if ( snpack_count() and soloBanjoWasteDisposal <= logictype.CurrentStage ) then
        logic = 0
    
    -- Sequence Breaking
    elseif ( snpack_count() ) then
        logic = soloBanjoWasteDisposal
    end
    
    return convertLogic(logic, skip)
end

function silo_GI_legSpring(skip)
    local logic = 99
    --[[
    self.check_notes(state, locationName.LSPRING) and self.split_up(state)
    --]]
    
    if ( lspring_count() and has("splitup") ) then
        logic = 0
    end
    
    return convertLogic(logic, skip)
end

function silo_GI_clawClamberBoots(skip)
    local logic = 99
    --[[
    self.check_notes(state, locationName.CLAWBTS)
    --]]
    
    if ( clawbts_count() ) then
        logic = 0
    end
    
    return convertLogic(logic, skip)
end

----- Warp Pads

function warp_GI_floor1(skip)
    local logic = 99
    --[[        warp_pad_floor_1
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.split_up(state)\
                or state.can_reach_region(regionName.GIWARP, self.player) and state.has(itemName.WARPGI1, self.player)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.split_up(state)\
                or state.can_reach_region(regionName.GIWARP, self.player) and state.has(itemName.WARPGI1, self.player)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.split_up(state)\
                or state.can_reach_region(regionName.GIWARP, self.player) and state.has(itemName.WARPGI1, self.player)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.split_up(state)\
                or state.can_reach_region(regionName.GIWARP, self.player) and state.has(itemName.WARPGI1, self.player)\
                or state.can_reach_region(regionName.GIO, self.player) and self.clockwork_shot(state)
    --]]
    
    local giwAccessibility = Tracker:FindObjectForCode("@Grunty Industries Warps").AccessibilityLevel
    local gioAccessibility = Tracker:FindObjectForCode("@Region: Outside Grunty Industries").AccessibilityLevel
    
    if ( has("splitup") or has("warpgi1") and (giwAccessibility == AccessibilityLevel.Normal or giwAccessibility == AccessibilityLevel.Cleared) ) then
        logic = 0 -- Normal Logic
    elseif ( logictype.CurrentStage < 2 and has("warpgi1") and giwAccessibility > AccessibilityLevel.None ) then
        logic = logictype.CurrentStage + 1 -- Sequence Breaking
    elseif ( can_clockworkShot() and (gioAccessibility == AccessibilityLevel.Normal or gioAccessibility == AccessibilityLevel.Cleared) ) then
        logic = 3 -- Normal Logic
    
    -- Sequence Breaking
    elseif ( has("warpgi1") and giwAccessibility > AccessibilityLevel.None or can_clockworkShot() and gioAccessibility > AccessibilityLevel.None ) then
        logic = logictype.CurrentStage + 1
    end
    
    return convertLogic(logic, skip)
end

function warp_GI_floor4(skip)
    local logic = 99
    --[[        warp_pad_floor_4
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.small_elevation(state)\
                or state.can_reach_region(regionName.GIWARP, self.player) and state.has(itemName.WARPGI4, self.player)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.small_elevation(state)\
                or state.can_reach_region(regionName.GIWARP, self.player) and state.has(itemName.WARPGI4, self.player)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = True
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = True
    --]]
    
    local giwAccessibility = Tracker:FindObjectForCode("@Grunty Industries Warps").AccessibilityLevel
    
    if ( can_reachSmallElevation() or has("warpgi4") and (giwAccessibility == AccessibilityLevel.Normal or giwAccessibility == AccessibilityLevel.Cleared) ) then
        logic = 0 -- Normal Logic
    elseif ( logictype.CurrentStage == 0 and has("warpgi4") and giwAccessibility > AccessibilityLevel.None ) then
        logic = 1 -- Sequence Breaking
    else
        logic = 2 -- Normal Logic
    end
    
    return convertLogic(logic, skip)
end

----- Jiggies

function jiggy_GI_underwaterWasteDisposal(skip)
    local logic = 99
    --[[        jiggy_underwater_waste_disposal
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.can_beat_weldar(state) and self.shack_pack(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.can_beat_weldar(state) and self.shack_pack(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.can_beat_weldar(state) and self.shack_pack(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        # Getting the jiggy from waste disposal through the wall.
        logic = (self.can_beat_weldar(state) and (self.shack_pack(state) or self.leg_spring(state)))\
                or self.can_use_battery(state) and (
                    (self.climb(state) and self.flap_flip(state) and self.talon_torpedo(state)\
                     and self.dive(state) and self.wonderwing(state))
                     or (self.shack_pack(state) and self.climb(state) and self.grip_grab(state)))
    --]]
    
    local canBeatWeldar = access_GI_canBeatWeldar(true)
    
    if ( canBeatWeldar <= logictype.CurrentStage and has_shackPack() ) then
        logic = 0 -- Normal Logic
    elseif ( canBeatWeldar < 3 and has_shackPack() ) then
        logic = canBeatWeldar -- Sequence Breaking
    elseif ( canBeatWeldar <= logictype.CurrentStage and has_legSpring() or basic_GI_canUseBattery() and (has("climb") and has("fflip") and has("ttorp") and has("dive") and has("wwing") or has_shackPack() and has("climb") and has("ggrab")) ) then
        logic = 3
    
    -- Sequence Breaking
    elseif ( has_shackPack() or has_legSpring() ) then
        logic = math.max(3, canBeatWeldar)
    end
    
    return convertLogic(logic, skip)
end

function jiggy_GI_clinkers(skip)
    local logic = 99
    --[[        jiggy_clinkers
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.claw_clamber_boots(state) and self.breegull_blaster(state) and self.climb(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.claw_clamber_boots(state) and self.breegull_blaster(state) and self.climb(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.claw_clamber_boots(state) and self.breegull_blaster(state) and self.climb(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.claw_clamber_boots(state) and self.breegull_blaster(state)\
                and (self.precise_clockwork_warp(state) and (self.spring_pad(state) or self.flap_flip(state))\
                    or state.can_reach_region(regionName.GIES, self.player) and self.elevator_shaft_to_floor_4(state)\
                    or self.climb(state))
    --]]
    
    local giesAccessibility = Tracker:FindObjectForCode("@Region: Grunty Industries Elevator Shaft").AccessibilityLevel
    local elevatorShaftToF4 = connector_GIElevatorShaft_to_GIF4Back(true)
    
    -- Normal Logic
    if ( has("clawbts") and has("bblaster") and has("climb") ) then
        logic = 0
    elseif ( has("clawbts") and has("bblaster") and (can_preciseClockworkWarp() and (has("tjump") or has("fflip")) or (giesAccessibility == AccessibilityLevel.Normal or giesAccessibility == AccessibilityLevel.Cleared) and elevatorShaftToF4 <= logictype.CurrentStage) ) then
        logic = 3
        
    -- Sequence Breaking
    elseif ( has("clawbts") and has("bblaster") and (giesAccessibility == AccessibilityLevel.Normal or giesAccessibility == AccessibilityLevel.Cleared) ) then
        logic = math.max(3, elevatorShaftToF4)
    elseif ( has("clawbts") and has("bblaster") and giesAccessibility > AccessibilityLevel.None ) then
        logic = math.max(3, elevatorShaftToF4, logictype.CurrentStage + 1)
    end
    
    return convertLogic(logic, skip)
end

function jiggy_GI_skivvy(skip)
    local logic = 99
    --[[        jiggy_skivvy
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.skivvy_worker_quarters(state) and self.skivvy_worker_quarters(state) \
                    and self.skivvy_floor_1(state) and self.skivvy_floor_2(state) \
                    and self.skivvy_floor_3(state) and self.skivvy_floor_5(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.skivvy_worker_quarters(state) and self.skivvy_worker_quarters(state) \
                    and self.skivvy_floor_1(state) and self.skivvy_floor_2(state) \
                    and self.skivvy_floor_3(state) and self.skivvy_floor_5(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.skivvy_worker_quarters(state) and self.skivvy_worker_quarters(state) \
                    and self.skivvy_floor_1(state) and self.skivvy_floor_2(state) \
                    and self.skivvy_floor_3(state) and self.skivvy_floor_5(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.skivvy_worker_quarters(state) and self.skivvy_worker_quarters(state) \
                    and self.skivvy_floor_1(state) and self.skivvy_floor_2(state) \
                    and self.skivvy_floor_3(state) and self.skivvy_floor_5(state)
    --]]
    
    local skivvyWQ = other_GI_skivvyWorkersQuarters(true)
    local skivvyF1 = other_GI_skivvyFloor1(true)
    local skivvyF2 = other_GI_skivvyFloor2(true)
    local skivvyF3 = other_GI_skivvyFloor3(true)
    local skivvyF5 = other_GI_skivvyFloor5(true)
    local skivvyOU = other_GI_skivvyOutsideBack(true)
    
    -- Normal Logic
    if ( skivvyWQ <= logictype.CurrentStage and skivvyF1 <= logictype.CurrentStage and skivvyF2 <= logictype.CurrentStage and skivvyF3 <= logictype.CurrentStage and skivvyF5 <= logictype.CurrentStage and skivvyOU <= logictype.CurrentStage ) then
        logic = 0
    
    -- Sequence Breaking
    else
        logic = math.max(skivvyWQ, skivvyF1, skivvyF2, skivvyF3, skivvyF5, skivvyOU)
    end
    
    return convertLogic(logic, skip)
end

function jiggy_GI_floor5(skip)
    local logic = 99
    --[[        jiggy_floor5
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.split_up(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.split_up(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.split_up(state) or self.clockwork_shot(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.split_up(state) or self.clockwork_shot(state)
    --]]
    
    if ( has("splitup") ) then
        logic = 0
    elseif ( can_clockworkShot() ) then
        logic = 2
    end
    
    return convertLogic(logic, skip)
end

function jiggy_GI_qualityControl(skip)
    local logic = 99
    --[[        jiggy_quality_control
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.grenade_eggs(state) and \
                self.egg_aim(state) and \
                self.can_use_battery(state) and self.humbaGI(state)\
                and self.climb(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.grenade_eggs(state) and \
                ((self.egg_aim(state) and self.humbaGI(state) or \
                self.leg_spring(state))) and self.can_use_battery(state) and self.climb(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.grenade_eggs(state) and self.can_use_battery(state) and self.climb(state) and\
                (self.tall_jump(state)\
                    or self.leg_spring(state)\
                    or self.humbaGI(state) and self.egg_aim(state)\
                    or self.clockwork_shot(state))
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.grenade_eggs(state) and self.can_use_battery(state) and self.climb(state) and\
                (self.tall_jump(state)\
                    or self.leg_spring(state)\
                    or self.humbaGI(state) and self.egg_aim(state)\
                    or self.clockwork_shot(state)\
                    )\
                or self.precise_clockwork_warp(state)
    --]]
    
    local humba = access_GI_humba(true)
    
    -- Normal Logic
    if ( can_shootEggs("geggs") and has("eggaim") and basic_GI_canUseBattery() and humba <= logictype.CurrentStage and has("climb") ) then
        logic = 0
    elseif ( can_shootEggs("geggs") and has_legSpring() and basic_GI_canUseBattery() and has("climb") ) then
        logic = 1
    elseif ( can_shootEggs("geggs") and has("eggaim") and basic_GI_canUseBattery() and humba < 2 and has("climb") ) then
        logic = 1 -- Sequence Breaking
    elseif ( can_shootEggs("geggs") and basic_GI_canUseBattery() and has("climb") and (has("tjump") or can_clockworkShot()) ) then
        logic = 2
    elseif ( can_shootEggs("geggs") and has("eggaim") and basic_GI_canUseBattery() and humba < 3 and has("climb") ) then
        logic = 2 -- Sequence Breaking
    elseif ( can_preciseClockworkWarp() ) then
        logic = 3
    
    -- Sequence Breaking
    elseif ( can_shootEggs("geggs") and has("eggaim") and basic_GI_canUseBattery() and has("climb") ) then
        logic = humba
    end
    
    return convertLogic(logic, skip)
end

function jiggy_GI_guarded(skip)
    local logic = 99
    --[[        jiggy_guarded
     if self.world.options.logic_type == LogicType.option_intended:
        logic = self.split_up(state) and self.claw_clamber_boots(state) and self.egg_aim(state) and\
                (self.blue_eggs(state) or self.fire_eggs(state) or self.grenade_eggs(state))\
                and (self.spring_pad(state) or self.wing_whack(state) or self.glide(state))\
                and (self.tall_jump(state) or self.leg_spring(state))
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.split_up(state) and (self.tall_jump(state) or self.leg_spring(state)) and\
                ((self.claw_clamber_boots(state) or state.can_reach_region(regionName.GI2, self.player)) and self.spring_pad(state)\
                    or self.claw_clamber_boots(state) and (self.wing_whack(state) or self.glide(state)) and (self.egg_aim(state) or self.wing_whack(state))\
                    or self.leg_spring(state) and self.glide(state) and (self.egg_aim(state) or self.wing_whack(state)))\
                and (self.blue_eggs(state) or self.fire_eggs(state) or self.grenade_eggs(state))
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.split_up(state) and (self.tall_jump(state) or self.leg_spring(state)) and\
                ((self.claw_clamber_boots(state) or state.can_reach_region(regionName.GI2, self.player)) and self.spring_pad(state)\
                    or self.claw_clamber_boots(state) and (self.wing_whack(state) or self.glide(state)) and (self.egg_aim(state) or self.wing_whack(state))\
                    or self.leg_spring(state) and self.glide(state) and (self.egg_aim(state) or self.wing_whack(state)))\
                and (self.blue_eggs(state) or self.fire_eggs(state) or self.grenade_eggs(state))\
                or (self.claw_clamber_boots(state) or state.can_reach_region(regionName.GI2, self.player)) and (self.spring_pad(state) or self.leg_spring(state)) and self.clockwork_shot(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.split_up(state) and (self.tall_jump(state) or self.leg_spring(state)) and\
                ((self.claw_clamber_boots(state) or state.can_reach_region(regionName.GI2, self.player)) and self.spring_pad(state)\
                    or self.claw_clamber_boots(state) and (self.wing_whack(state) or self.glide(state)) and (self.egg_aim(state) or self.wing_whack(state))\
                    or self.leg_spring(state) and self.glide(state) and (self.egg_aim(state) or self.wing_whack(state)))\
                and (self.blue_eggs(state) or self.fire_eggs(state) or self.grenade_eggs(state))\
                or (self.claw_clamber_boots(state) or state.can_reach_region(regionName.GI2, self.player)) and (self.spring_pad(state) or self.leg_spring(state)) and self.clockwork_shot(state)
     --]]
    
    local gi2Accessibility = Tracker:FindObjectForCode("@Region: Grunty Industries 2nd Floor").AccessibilityLevel
    
    -- Normal Logic
    if ( has("splitup") and has("clawbts") and has("eggaim") and (can_shootEggs("begg") or can_shootEggs("feggs") or can_shootEggs("geggs")) and (has("tjump") or has_legSpring() and (has_wingWhack() or has_glide())) ) then
        logic = 0
    elseif ( has("splitup") and (has("tjump") and (has("clawbts") or (gi2Accessibility == AccessibilityLevel.Normal or gi2Accessibility == AccessibilityLevel.Cleared)) or has("clawbts") and (has_wingWhack() or has_glide()) and (has("eggaim") or has_wingWhack())) and (can_shootEggs("begg") or can_shootEggs("feggs") or can_shootEggs("geggs")) ) then
        logic = 1
    elseif ( (has("clawbts") or (gi2Accessibility == AccessibilityLevel.Normal or gi2Accessibility == AccessibilityLevel.Cleared)) and (has("tjump") or has_legSpring()) and can_clockworkShot() ) then
        logic = 2
    
    -- Sequence Breaking
    elseif ( gi2Accessibility > AccessibilityLevel.None and (has("splitup") and (can_shootEggs("begg") or can_shootEggs("feggs") or can_shootEggs("geggs")) and has("tjump") or (has("tjump") or has_legSpring()) and can_clockworkShot()) ) then
        logic = math.max(2, logictype.CurrentStage + 1)
    end
    
    return convertLogic(logic, skip)
end

function jiggy_GI_trashCompactor(skip)
    local logic = 99
    --[[        jiggy_trash_compactor
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.snooze_pack(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.snooze_pack(state) or self.pack_whack(state) and self.tall_jump(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.snooze_pack(state) or self.pack_whack(state) and self.tall_jump(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.snooze_pack(state)\
                or self.pack_whack(state) and self.tall_jump(state)\
                or (self.egg_aim(state) and self.clockwork_eggs(state) and self.breegull_bash(state) and self.talon_trot(state))
    --]]
    
    if ( has_snoozePack() ) then
        logic = 0
    elseif ( has_packWhack() and has("tjump") ) then
        logic = 1
    elseif ( can_clockworkShot() and has_breegullBash() and has("ttrot") ) then
        logic = 3
    end
    
    return convertLogic(logic, skip)
end

function jiggy_GI_twinkly(skip)
    local logic = 99
    --[[        jiggy_twinkly
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.can_use_battery(state) and self.grip_grab(state) and self.turbo_trainers(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        #Banjo to Boiler Plant
        #Solo Kazooie to boiler plant, otherwise turbo trainers to do the minigame as BK
        logic = self.can_use_battery(state) and (self.tall_jump(state) or self.grip_grab(state))\
                and (self.leg_spring(state)\
                    or (self.glide(state) or self.wing_whack(state)) and self.tall_jump(state)
                    or state.can_reach_region(regionName.GIF, self.player) and self.flight_to_boiler_plant(state)
                    or self.turbo_trainers(state))
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.can_use_battery(state) and (self.tall_jump(state) or self.grip_grab(state))\
                and (self.leg_spring(state)\
                    or (self.glide(state) or self.wing_whack(state)) and self.tall_jump(state)
                    or state.can_reach_region(regionName.GIF, self.player) and self.flight_to_boiler_plant(state)
                    or self.turbo_trainers(state))
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.can_use_battery(state) and (self.tall_jump(state) or self.grip_grab(state))\
                and (self.leg_spring(state)\
                    or (self.glide(state) or self.wing_whack(state)) and self.tall_jump(state)
                    or state.can_reach_region(regionName.GIF, self.player) and self.flight_to_boiler_plant(state)
                    or self.turbo_trainers(state))
    --]]
    
    local gifAccessibility = Tracker:FindObjectForCode("@Region: Grunty Industries Flight").AccessibilityLevel
    local flightToBoilerPlant = connector_GIFlight_to_GIF3BoilerPlant(true)
    
    -- Normal Logic
    if ( basic_GI_canUseBattery() and has("ggrab") and has("ttrain") ) then
        logic = 0
    elseif ( basic_GI_canUseBattery() and (has("tjump") or has("ggrab")) and (has_legSpring() or has("tjump") and (has_glide() or has_wingWhack()) or has("ttrain") or (gi5Accessibility == AccessibilityLevel.Normal or gi5Accessibility == AccessibilityLevel.Cleared) and flightToBoilerPlant <= logictype.CurrentStage) ) then
        logic = 1
    
    -- Sequence Breaking
    elseif ( basic_GI_canUseBattery() and (has("tjump") or has("ggrab")) and (gi5Accessibility == AccessibilityLevel.Normal or gi5Accessibility == AccessibilityLevel.Cleared) ) then
        logic = math.max(1, flightToBoilerPlant)
    elseif ( basic_GI_canUseBattery() and (has("tjump") or has("ggrab")) and gi5Accessibility > AccessibilityLevel.None ) then
        logic = math.max(logictype.CurrentStage + 1, flightToBoilerPlant)
    end
    
    return convertLogic(logic, skip)
end

function jiggy_GI_wasteDisposalBox(skip)
    local logic = 99
    --[[        jiggy_waste_disposal_box
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.sack_pack(state) and self.solo_banjo_waste_disposal(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.solo_banjo_waste_disposal(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.solo_banjo_waste_disposal(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.solo_banjo_waste_disposal(state)
    --]]
    
    local soloBanjoWasteDisposal = access_GI_soloBanjoWasteDisposal(true)
    
    -- Normal Logic
    if ( has_sackPack() and soloBanjoWasteDisposal <= logictype.CurrentStage ) then
        logic = 0
    elseif ( soloBanjoWasteDisposal <= logictype.CurrentStage ) then
        logic = 1
    
    -- Sequence Breaking
    else
        logic = math.max(1, soloBanjoWasteDisposal)
    end
    
    return convertLogic(logic, skip)
end

----- Notes

function treble_GI(skip)
    local logic = 99
    --[[        treble_gi
    if self.world.options.logic_type == LogicType.option_intended:
        logic = state.can_reach_region(regionName.GI1, self.player) and self.split_up(state) and self.claw_clamber_boots(state)\
                or state.can_reach_region(regionName.GIF, self.player)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = state.can_reach_region(regionName.GI1, self.player) and (self.split_up(state) and self.claw_clamber_boots(state)\
                or self.leg_spring(state) and self.glide(state) and\
                    (self.wing_whack(state) or self.egg_aim(state)))\
                or state.can_reach_region(regionName.GIF, self.player)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = state.can_reach_region(regionName.GI1, self.player) and (self.split_up(state) and self.claw_clamber_boots(state)\
                    or self.leg_spring(state) and self.glide(state) and (self.wing_whack(state) or self.egg_aim(state)))\
                or state.can_reach_region(regionName.GIF, self.player)\
                or self.clockwork_shot(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = state.can_reach_region(regionName.GI1, self.player) and (self.split_up(state) and self.claw_clamber_boots(state)\
                    or self.leg_spring(state) and self.glide(state) and (self.wing_whack(state) or self.egg_aim(state)))\
                or state.can_reach_region(regionName.GIF, self.player)\
                or self.clockwork_shot(state)
    --]]
    
    local gi1Accessibility = Tracker:FindObjectForCode("@Region: Grunty Industries 1st Floor").AccessibilityLevel
    local gifAccessibility = Tracker:FindObjectForCode("@Region: Grunty Industries Flight").AccessibilityLevel
    
    -- Normal Logic
    if ( (gi1Accessibility == AccessibilityLevel.Normal or gi1Accessibility == AccessibilityLevel.Cleared) and has("splitup") and has("clawbts") or (gifAccessibility == AccessibilityLevel.Normal or gifAccessibility == AccessibilityLevel.Cleared) ) then
        logic = 0
    elseif ( (gi1Accessibility == AccessibilityLevel.Normal or gi1Accessibility == AccessibilityLevel.Cleared) and has_legSpring() and has_glide() and (has_wingWhack() or has("eggaim")) ) then
        logic = 1
    elseif ( logictype.CurrentStage == 0 and (gi1Accessibility > AccessibilityLevel.None and has("splitup") and has("clawbts") or gifAccessibility > AccessibilityLevel.None) ) then
        logic = 1 -- Sequence Breaking
    elseif ( can_clockworkShot() ) then
        logic = 2
    
    -- Sequence Breaking
    elseif ( gi1Accessibility > AccessibilityLevel.None and has("splitup") and has("clawbts") or gifAccessibility > AccessibilityLevel.None ) then
        logic = logictype.CurrentStage + 1
    end
    
    return convertLogic(logic, skip)
end

function notes_GI_trainStationHard(skip)
    local logic = 99
    --[[        notes_gi_train_station_hard
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.small_elevation(state) or self.leg_spring(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.small_elevation(state) or self.leg_spring(state) or self.beak_buster(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = True
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = True
    --]]
    
    if ( can_reachSmallElevation() or has_legSpring() ) then
        logic = 0
    elseif ( has("bbust") ) then
        logic = 1
    else
        logic = 2
    end
    
    return convertLogic(logic, skip)
end

function notes_GI_trainStationEasy(skip)
    local logic = 99
    --[[        notes_gi_train_station_easy
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.small_elevation(state) or self.leg_spring(state) or self.grip_grab(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.small_elevation(state) or self.leg_spring(state) or self.beak_buster(state) or self.grip_grab(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = True
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = True
    --]]
    
    if ( can_reachSmallElevation() or has_legSpring() or has("ggrab") ) then
        logic = 0
    elseif ( has("bbust") ) then
        logic = 1
    else
        logic = 2
    end
    
    return convertLogic(logic, skip)
end

function notes_GI_F1(skip)
    local logic = 99
    --[[        notes_gi_floor1
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.grip_grab(state) and self.climb(state) and self.flap_flip(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.F1_to_F2(state)\
            or (self.grip_grab(state) and self.climb(state) and self.flap_flip(state))
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.claw_clamber_boots(state)\
                or (self.grip_grab(state) and self.climb(state) and self.flap_flip(state))\
                or self.pack_whack(state) and self.tall_jump(state) and self.climb(state)\
                or self.leg_spring(state)\
                or self.clockwork_shot(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.claw_clamber_boots(state)\
                or (self.grip_grab(state) and self.climb(state) and self.flap_flip(state))\
                or self.pack_whack(state) and self.tall_jump(state) and self.climb(state)\
                or self.leg_spring(state)\
                or self.clockwork_shot(state)
    --]]
    
    local f1ToF2 = connector_GIF1_to_GIF2(true)
    
    -- Normal Logic
    if ( has("ggrab") and has("climb") and has("fflip") ) then
        logic = 0
    elseif ( f1ToF2 <= logictype.CurrentStage ) then
        logic = 1
    elseif ( has("clawbts") or has_packWhack() and has("tjump") and has("climb") or has_legSpring() or can_clockworkShot() ) then
        logic = 0
    
    -- Sequence Breaking
    else
        logic = math.max(1, f1ToF2)
    end
    
    return convertLogic(logic, skip)
end

function notes_GI_legSpringRoom(skip)
    local logic = 99
    --[[
    if self.world.options.logic_type == LogicType.option_intended:
        logic = (self.climb(state) or (self.has_explosives(state) and self.small_elevation(state)))
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = (self.climb(state) or (self.has_explosives(state) and self.small_elevation(state)))
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = (self.climb(state) or (self.has_explosives(state) and self.small_elevation(state)))\
                or self.clockwork_shot(state)\
                or self.claw_clamber_boots(state) and self.extremelyLongJump(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = (self.climb(state) or (self.has_explosives(state) and self.small_elevation(state)))\
                or self.clockwork_shot(state)\
                or self.claw_clamber_boots(state) and self.extremelyLongJump(state)
    --]]
    
    local explosives = can_shootExplosiveEggs(true)
    local extremelyLongJump = can_extremelyLongJump(true)
    
    if ( has("climb") or can_reachSmallElevation() and explosives <= logictype.CurrentStage ) then
        logic = 0 -- Normal Logic
    elseif ( can_reachSmallElevation() and explosives < 2 ) then
        logic = 1 -- Sequence Breaking
    elseif ( can_clockworkShot() or has("clawbts") and extremelyLongJump <= logictype.CurrentStage ) then
        logic = 2
    
    -- Sequence Breaking
    else
        local withExplosives = 99
        if ( can_reachSmallElevation() ) then
            withExplosives = math.max(1, explosives)
        end
        
        local withLongJump = 99
        if ( has("clawbts") ) then
            withLongJump = math.max(2, extremelyLongJump)
        end
        
        logic = math.min(withExplosives, withLongJump)
    end
    
    return convertLogic(logic, skip)
end

function notes_GI_boxRoomTallerStack(skip)
    local logic = 99
    --[[        notes_short_stack
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.small_elevation(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.small_elevation(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = True
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = True
    --]]
    
    if ( can_reachSmallElevation() ) then
        logic = 0
    else
        logic = 2
    end
    
    return convertLogic(logic, skip)
end

function notes_GI_wasteDisposal(skip)
    local logic = 99
    --[[        notes_waste_disposal
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.can_use_battery(state) and (self.grip_grab(state) and self.climb(state))
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.can_use_battery(state) and (self.grip_grab(state) and self.climb(state) or self.tall_jump(state))
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.can_use_battery(state) and (self.grip_grab(state) and self.climb(state) or self.tall_jump(state))
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = (self.can_use_battery(state) and (self.grip_grab(state) and self.climb(state) or self.tall_jump(state)))\
                or self.clockwork_shot(state) and self.flap_flip(state)
    --]]
    
    if ( basic_GI_canUseBattery() and has("ggrab") and has("climb") ) then
        logic = 0
    elseif ( basic_GI_canUseBattery() and has("tjump") ) then
        logic = 1
    elseif ( can_clockworkShot() and has("fflip") ) then
        logic = 3
    end
    
    return convertLogic(logic, skip)
end

function notes_GI_airConditioningPlantHard(skip)
    local logic = 99
    --[[        notes_aircon_hard
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.tall_jump(state) or self.split_up(state) or self.talon_trot(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = True
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = True
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = True
    --]]
    
    if ( has("tjump") or has("splitup") or has("ttrot") ) then
        logic = 0
    else
        logic = 1
    end
    
    return convertLogic(logic, skip)
end

function notes_GI_F3(skip)
    local logic = 99
    --[[        notes_floor_3
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.climb(state) and self.talon_trot(state) and self.flutter(state) and self.grip_grab(state)\
                or self.floor_3_split_up(state) and self.leg_spring(state)\
                or (self.grip_grab(state) and self.flap_flip(state) or self.split_up(state)) and self.spring_pad(state) and self.climb(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = ((self.grip_grab(state) and self.flap_flip(state) or self.split_up(state)) and self.spring_pad(state) and self.climb(state))\
                or (self.climb(state) or self.enter_floor_3_from_fire_exit(state)) and self.talon_trot(state) and self.flutter(state) and self.grip_grab(state)\
                or self.floor_3_split_up(state) and self.leg_spring(state)\

    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = ((self.grip_grab(state) and self.flap_flip(state) or self.split_up(state)) and self.spring_pad(state) and self.climb(state))\
                or (self.climb(state) or self.enter_floor_3_from_fire_exit(state))\
                    and self.talon_trot(state) and (
                        self.flutter(state) and self.grip_grab(state)\
                        or self.flutter(state) and self.beak_buster(state)\
                        or self.air_rat_a_tat_rap(state)
                    )\
                or self.clockwork_shot(state)\
                or self.small_elevation(state) and self.leg_spring(state)\                              -- small elevation is added here because floor 3 split up stops requireing it on hard tricks. this messes up the way I write the logic so I have to adjust for it
                or self.floor_3_split_up(state) and self.tall_jump(state) and (self.wing_whack(state) or self.glide(state))\
                or self.sack_pack(state) and self.floor_3_split_up(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = ((self.grip_grab(state) and self.flap_flip(state) or self.split_up(state)) and self.spring_pad(state) and self.climb(state))\
                or (self.climb(state) or self.enter_floor_3_from_fire_exit(state))\
                    and self.talon_trot(state) and (
                        self.flutter(state) and self.grip_grab(state)\
                        or self.flutter(state) and self.beak_buster(state)\
                        or self.air_rat_a_tat_rap(state)
                    )\
                or self.clockwork_shot(state)\
                or self.small_elevation(state) and self.leg_spring(state)\
                or self.floor_3_split_up(state) and self.tall_jump(state) and (self.wing_whack(state) or self.glide(state))\
                or self.sack_pack(state) and self.floor_3_split_up(state)
     --]]
     
    local floor3SplitUp = access_GI_floor3SplitUp(true)
    local f3FromFireExit = access_GI_enterFloor3FromFireExit(true)
    
    -- Normal Logic
    if ( has("climb") and has("ttrot") and has("flutter") and has("ggrab") or floor3SplitUp <= logictype.CurrentStage and can_reachSmallElevation() and has_legSpring() or has("climb") and has("tjump") and (has("ggrab") and has("fflip") or has("splitup")) ) then
        logic = 0
    elseif ( f3FromFireExit <= logictype.CurrentStage and has("ttrot") and has("flutter") and has("ggrab") ) then
        logic = 1
    elseif ( f3FromFireExit < 2 and has("ttrot") and has("flutter") and has("ggrab") or floor3SplitUp < 2 and can_reachSmallElevation() and has_legSpring() ) then
        logic = 1 -- Sequence Breaking
    elseif ( can_clockworkShot() or (has("climb") or f3FromFireExit <= logictype.CurrentStage) and has("ttrot") and (has("arat") or has("flutter") and has("bbust")) or can_reachSmallElevation() and has_legSpring() or floor3SplitUp <= logictype.CurrentStage and (has("tjump") and (has_wingWhack() or has_glide()) or has_sackPack()) ) then
        logic = 2
        
    -- Sequence Breaking
    else
        local fireExit = 99
        if ( has("ttrot") and (has("arat") or has("flutter") and (has("ggrab") or has("bbust"))) ) then
            fireExit = math.max(2, f3FromFireExit)
        end
        
        local f3SU = 99
        if ( has("tjump") and (has_wingWhack() or has_glide()) or has_sackPack() ) then
            f3SU = math.max(2, floor3SplitUp)
        end
        
        logic = math.min(fireExit, f3SU)
    end
    
    return convertLogic(logic, skip)
end

----- Nests

function nests_GI_outsideRight(skip)
    local logic = 99
    --[[        nest_gi_outside_right
    if self.world.options.logic_type == LogicType.option_intended:
        logic = state.can_reach_region(regionName.GIO, self.player) and self.outside_gi_to_outside_back(state)\
                or state.can_reach_region(regionName.GIOB, self.player) and self.climb(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = state.can_reach_region(regionName.GIO, self.player) and self.outside_gi_to_outside_back(state)\
                or state.can_reach_region(regionName.GIOB, self.player) and self.climb(state)\
                or state.can_reach_region(regionName.GI1, self.player) and (self.split_up(state) and self.tall_jump(state) or self.leg_spring(state))\
                or state.can_reach_region(regionName.GI2, self.player) and (self.floor_2_split_up(state) and (self.tall_jump(state) or self.leg_spring(state)))\
                or state.can_reach_region(regionName.GIF, self.player)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = state.can_reach_region(regionName.GIO, self.player) and self.outside_gi_to_outside_back(state)\
                or state.can_reach_region(regionName.GIOB, self.player) and self.climb(state)\
                or state.can_reach_region(regionName.GI1, self.player) and (self.split_up(state) and self.tall_jump(state) or self.leg_spring(state))\
                or state.can_reach_region(regionName.GI2, self.player) and (self.floor_2_split_up(state) and (self.tall_jump(state) or self.leg_spring(state)))\
                or state.can_reach_region(regionName.GIF, self.player)\
                or self.clockwork_shot(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = state.can_reach_region(regionName.GIO, self.player) and self.outside_gi_to_outside_back(state)\
                or state.can_reach_region(regionName.GIOB, self.player) and self.climb(state)\
                or state.can_reach_region(regionName.GI1, self.player) and (self.split_up(state) and self.tall_jump(state) or self.leg_spring(state))\
                or state.can_reach_region(regionName.GI2, self.player) and (self.floor_2_split_up(state) and (self.tall_jump(state) or self.leg_spring(state)))\
                or state.can_reach_region(regionName.GIF, self.player)\
                or self.clockwork_shot(state)
    --]]
    
    local gioAccessibility = Tracker:FindObjectForCode("@Region: Outside Grunty Industries").AccessibilityLevel
    local giobAccessibility = Tracker:FindObjectForCode("@Region: Outside Grunty Industries - Behind the building").AccessibilityLevel
    local gi1Accessibility = Tracker:FindObjectForCode("@Region: Grunty Industries 1st Floor").AccessibilityLevel
    local gi2Accessibility = Tracker:FindObjectForCode("@Region: Grunty Industries 2nd Floor").AccessibilityLevel
    local gifAccessibility = Tracker:FindObjectForCode("@Region: Grunty Industries Flight").AccessibilityLevel
    local outsideToBack = connector_GIO_to_GIOBack(true)
    local floor2SplitUp = access_GI_floor2SplitUp(true)
    
    -- Normal Logic
    if ( (gioAccessibility == AccessibilityLevel.Normal or gioAccessibility == AccessibilityLevel.Cleared) and outsideToBack <= logictype.CurrentStage or (giobAccessibility == AccessibilityLevel.Normal or giobAccessibility == AccessibilityLevel.Cleared) and has("climb") ) then
        logic = 0
    elseif ( (gi1Accessibility == AccessibilityLevel.Normal or gi1Accessibility == AccessibilityLevel.Cleared) and (has("splitup") and has("tjump") or has_legSpring()) or (gi2Accessibility == AccessibilityLevel.Normal or gi2Accessibility == AccessibilityLevel.Cleared) and floor2SplitUp <= logictype.CurrentStage and (has("tjump") or has_legSpring()) or (gifAccessibility == AccessibilityLevel.Normal or gifAccessibility == AccessibilityLevel.Cleared) ) then
        logic = 1
    elseif ( (gioAccessibility == AccessibilityLevel.Normal or gioAccessibility == AccessibilityLevel.Cleared) and outsideToBack < 2 or logictype.CurrentStage == 0 and gioAccessibility > AccessibilityLevel.None and outsideToBack <= logictype.CurrentStage or logictype.CurrentStage == 0 and giobAccessibility > AccessibilityLevel.None and has("climb") ) then
        logic = 1 -- Sequence Breaking
    elseif ( can_clockworkShot() ) then
        logic = 2
    
    -- Sequence Breaking
    else
        local outside = 99
        if ( gioAccessibility == AccessibilityLevel.Normal or gioAccessibility == AccessibilityLevel.Cleared ) then
            outside = outsideToBack
        elseif ( gioAccessibility > AccessibilityLevel.None ) then
            outside = math.max(outsideToBack, logictype.CurrentStage + 1)
        end
        
        local outsideBack = 99
        if ( giobAccessibility > AccessibilityLevel.None and has("climb") ) then
            outsideBack = logictype.CurrentStage + 1
        end
        
        local f1 = 99
        if ( gi1Accessibility > AccessibilityLevel.None and (has("splitup") and has("tjump") or has_legSpring()) ) then
            f1 = logictype.CurrentStage + 1
        end
        
        local f2 = 99
        if ( (gi2Accessibility == AccessibilityLevel.Normal or gi2Accessibility == AccessibilityLevel.Cleared) and (has("tjump") or has_legSpring()) ) then
            f2 = floor2SplitUp
        elseif ( gi2Accessibility > AccessibilityLevel.None and (has("tjump") or has_legSpring()) ) then
            f2 = math.max(floor2SplitUp, logictype.CurrentStage + 1)
        end
        
        local flight = 99
        if ( gifAccessibility > AccessibilityLevel.None ) then
            flight = logictype.CurrentStage + 1
        end
        
        logic = math.max(1, math.min(outside, outsideBack, f1, f2, flight))
    end
    
    return convertLogic(logic, skip)
end

function nests_GI_outsideLeft(skip)
    local logic = 99
    --[[        nest_gi_outside_left
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.climb(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.climb(state)\
                or state.can_reach_region(regionName.GI1, self.player) and self.leg_spring(state)\
                or state.can_reach_region(regionName.GI2, self.player) and self.floor_2_split_up(state) and self.leg_spring(state)\
                or state.can_reach_region(regionName.GIF, self.player)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.climb(state)\
                or state.can_reach_region(regionName.GIOB, self.player) and self.claw_clamber_boots(state)\
                or state.can_reach_region(regionName.GI1, self.player) and self.leg_spring(state)\
                or state.can_reach_region(regionName.GI2, self.player) and self.floor_2_split_up(state) and self.leg_spring(state)\
                or state.can_reach_region(regionName.GIF, self.player)\
                or self.clockwork_shot(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.climb(state)\
                or state.can_reach_region(regionName.GIOB, self.player) and self.claw_clamber_boots(state)\
                or state.can_reach_region(regionName.GI1, self.player) and self.leg_spring(state)\
                or state.can_reach_region(regionName.GI2, self.player) and self.floor_2_split_up(state) and self.leg_spring(state)\
                or state.can_reach_region(regionName.GIF, self.player)\
                or self.clockwork_shot(state)
    --]]
    
    local giobAccessibility = Tracker:FindObjectForCode("@Region: Outside Grunty Industries - Behind the building").AccessibilityLevel
    local gi1Accessibility = Tracker:FindObjectForCode("@Region: Grunty Industries 1st Floor").AccessibilityLevel
    local gi2Accessibility = Tracker:FindObjectForCode("@Region: Grunty Industries 2nd Floor").AccessibilityLevel
    local gifAccessibility = Tracker:FindObjectForCode("@Region: Grunty Industries Flight").AccessibilityLevel
    local outsideToBack = connector_GIO_to_GIOBack(true)
    local floor2SplitUp = access_GI_floor2SplitUp(true)
    
    -- Normal Logic
    if ( has("climb") ) then
        logic = 0
    elseif ( (gi1Accessibility == AccessibilityLevel.Normal or gi1Accessibility == AccessibilityLevel.Cleared) and has_legSpring() or (gi2Accessibility == AccessibilityLevel.Normal or gi2Accessibility == AccessibilityLevel.Cleared) and has_legSpring() and floor2SplitUp <= logictype.CurrentStage or (gifAccessibility == AccessibilityLevel.Normal or gifAccessibility == AccessibilityLevel.Cleared) ) then
        logic = 1
    elseif ( (giobAccessibility == AccessibilityLevel.Normal or giobAccessibility == AccessibilityLevel.Cleared) and has("clawbts") or can_clockworkShot() ) then
        logic = 2
    
    -- Sequence Breaking
    else
        local f1 = 99
        if ( gi1Accessibility > AccessibilityLevel.None and has_legSpring() ) then
            f1 = logictype.CurrentStage + 1
        end
        
        local f2 = 99
        if ( (gi2Accessibility == AccessibilityLevel.Normal or gi2Accessibility == AccessibilityLevel.Cleared) and has_legSpring() ) then
            f2 = floor2SplitUp
        elseif ( gi2Accessibility > AccessibilityLevel.None and has_legSpring() ) then
            f2 = math.max(floor2SplitUp, logictype.CurrentStage + 1)
        end
        
        local flight = 99
        if ( gifAccessibility > AccessibilityLevel.None ) then
            flight = logictype.CurrentStage + 1
        end
        
        local outsideBack = 99
        if ( giobAccessibility > AccessibilityLevel.None and has("clawbts") ) then
            outsideBack = logictype.CurrentStage + 1
        end
        
        logic = math.max(2, math.min(f1, f2, flight, outsideBack))
    end
    
    return convertLogic(logic, skip)
end

function nests_GI_floor1TopPipe(skip)
    local logic = 99
    --[[        nest_gi_floor1_top_pipe
     if self.world.options.logic_type == LogicType.option_intended:
        logic = self.split_up(state) and self.claw_clamber_boots(state) and (self.spring_pad(state) or self.wing_whack(state) or (self.egg_aim(state) and self.glide(state)))
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.split_up(state) and\
                ((self.claw_clamber_boots(state) or state.can_reach_region(regionName.GI2, self.player)) and self.spring_pad(state)\
                    or self.claw_clamber_boots(state) and (self.wing_whack(state) or self.glide(state)) and (self.egg_aim(state) or self.wing_whack(state)))
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.split_up(state) and\
                (self.claw_clamber_boots(state) or state.can_reach_region(regionName.GI2, self.player) and self.floor_2_split_up(state))
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.split_up(state) and\
                (self.claw_clamber_boots(state) or state.can_reach_region(regionName.GI2, self.player) and self.floor_2_split_up(state))
     --]]
    
    local gi2Accessibility = Tracker:FindObjectForCode("@Region: Grunty Industries 2nd Floor").AccessibilityLevel
    local floor2SplitUp = access_GI_floor2SplitUp(true)
    
    -- Normal Logic
    if ( has("splitup") and has("clawbts") and (has("tjump") or has_wingWhack() or has("eggaim") and has_glide()) ) then
        logic = 0
    elseif ( has("splitup") and has("tjump") and (gi2Accessibility == AccessibilityLevel.Normal or gi2Accessibility == AccessibilityLevel.Cleared) ) then
        logic = 1
    elseif ( has("splitup") and (has("clawbts") or (gi2Accessibility == AccessibilityLevel.Normal or gi2Accessibility == AccessibilityLevel.Cleared) and floor2SplitUp <= logictype.CurrentStage) ) then
        logic = 2
    
    -- Sequence Breaking
    elseif ( has("splitup") and (gi2Accessibility == AccessibilityLevel.Normal or gi2Accessibility == AccessibilityLevel.Cleared) ) then
        logic = math.max(2, floor2SplitUp)
    elseif ( has("splitup") and gi2Accessibility > AccessibilityLevel.None ) then
        logic = math.max(2, floor2SplitUp, logictype.CurrentStage + 1)
    end
    
    return convertLogic(logic, skip)
end

function nests_GI_floor1HighPipe(skip)
    local logic = 99
    --[[        nest_gi_floor1_high_pipe
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.claw_clamber_boots(state) and (self.leg_spring(state) or self.spring_pad(state))
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.claw_clamber_boots(state) and (self.leg_spring(state) or self.spring_pad(state))\
                or state.can_reach_region(regionName.GI2, self.player) and (self.floor_2_split_up(state) and self.leg_spring(state) or self.F2_to_F1(state) and self.spring_pad(state))\
                or self.claw_clamber_boots(state) and (self.wing_whack(state) or self.glide(state)) and (self.egg_aim(state) or self.wing_whack(state))
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.claw_clamber_boots(state)\
                or state.can_reach_region(regionName.GI2, self.player) and (self.floor_2_split_up(state) and self.leg_spring(state) or self.F2_to_F1(state) and (self.spring_pad(state) or self.clockwork_shot(state)))\
                or self.claw_clamber_boots(state) and (self.wing_whack(state) or self.glide(state)) and (self.egg_aim(state) or self.wing_whack(state))
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.claw_clamber_boots(state)\
                or state.can_reach_region(regionName.GI2, self.player) and (self.floor_2_split_up(state) and self.leg_spring(state) or self.F2_to_F1(state) and (self.spring_pad(state) or self.clockwork_shot(state)))\
                or self.claw_clamber_boots(state) and (self.wing_whack(state) or self.glide(state)) and (self.egg_aim(state) or self.wing_whack(state))
    --]]
    
    local gi2Accessibility = Tracker:FindObjectForCode("@Region: Grunty Industries 2nd Floor").AccessibilityLevel
    local f2tof1 = connector_GIF2_to_GIF1(true)
    local floor2SplitUp = access_GI_floor2SplitUp(true)
    
    -- Normal Logic
    if ( has("clawbts") and (has("tjump") or has_legSpring()) ) then
        logic = 0
    elseif ( (gi2Accessibility == AccessibilityLevel.Normal or gi2Accessibility == AccessibilityLevel.Cleared) and (floor2SplitUp <= logictype.CurrentStage and has_legSpring() or f2tof1 <= logictype.CurrentStage and has("tjump")) or has("clawbts") and (has_wingWhack() or has_glide() and has("eggaim")) ) then
        logic = 1
    elseif ( has("clawbts") ) then
        logic = 2
    
    -- Sequence Breaking
    elseif ( gi2Accessibility == AccessibilityLevel.Normal or gi2Accessibility == AccessibilityLevel.Cleared ) then
        local legSpring = 99
        if ( has_legSpring() ) then
            legSpring = floor2SplitUp
        end
        
        local springPad = 99
        if ( has("tjump") ) then
            springPad = f2tof1
        end
        
        logic = math.max(1, math.min(legSpring, springPad))
    elseif ( gi2Accessibility > AccessibilityLevel.None ) then
        local legSpring = 99
        if ( has_legSpring() ) then
            legSpring = floor2SplitUp
        end
        
        local springPad = 99
        if ( has("tjump") ) then
            springPad = f2tof1
        end
        
        logic = math.max(logictype.CurrentStage + 1, math.min(legSpring, springPad))
    end
    
    return convertLogic(logic, skip)
end

function nests_GI_outsideWasteDisposal(skip)
    local logic = 99
    --[[        nest_gi_outside_waste_disposal
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.slightly_elevated_ledge(state) or self.split_up(state) or self.flap_flip(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.slightly_elevated_ledge(state) or self.split_up(state) or self.flap_flip(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.slightly_elevated_ledge(state) or self.split_up(state) or self.clockwork_shot(state) or self.flap_flip(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.slightly_elevated_ledge(state) or self.split_up(state) or self.clockwork_shot(state) or self.flap_flip(state)
    --]]
    
    if ( can_reachSlightlyElevatedLedge() or has("splitup") or has("fflip") ) then
        logic = 0
    elseif ( can_clockworkShot() ) then
        logic = 1
    end
    
    return convertLogic(logic, skip)
end

function nests_GI_outsideTrashCompactor(skip)
    local logic = 99
    --[[        nest_outside_trash_compactor
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.snooze_pack(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = True # You have to get crushed anyway in the intended strat. Is it fair that doing it without snooze pack is in easy tricks?
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = True
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = True
    --]]
    
    if ( has_snoozePack() ) then
        logic = 0
    else
        logic = 1
    end
    
    return convertLogic(logic, skip)
end

function nests_GI_trainStationSmallBox(skip)
    local logic = 99
    --[[        nest_gi_train_station_small_box
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.small_elevation(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = True
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = True
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = True
    --]]
    
    if ( can_reachSmallElevation() ) then
        logic = 0
    else
        logic = 1
    end
    
    return convertLogic(logic, skip)
end

function nests_GI_trainStationMediumBox(skip)
    local logic = 99
    --[[        nest_gi_train_station_medium_box
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.slightly_elevated_ledge(state)\
                or self.flap_flip(state)\
                or self.leg_spring(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.slightly_elevated_ledge(state)\
                or self.flap_flip(state)\
                or self.split_up(state)\
                or self.flutter(state)\
                or self.air_rat_a_tat_rap(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.slightly_elevated_ledge(state)\
                or self.flap_flip(state)\
                or self.split_up(state)\
                or self.flutter(state)\
                or self.air_rat_a_tat_rap(state)\
                or self.clockwork_shot(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.slightly_elevated_ledge(state)\
                or self.flap_flip(state)\
                or self.split_up(state)\
                or self.flutter(state)\
                or self.air_rat_a_tat_rap(state)\
                or self.clockwork_shot(state)
    --]]
    
    if ( can_reachSlightlyElevatedLedge() or has("fflip") or has_legSpring() ) then
        logic = 0
    elseif ( has("splitup") or has("flutter") or has("arat") ) then
        logic = 1
    elseif ( can_clockworkShot() ) then
        logic = 2
    end
    
    return convertLogic(logic, skip)
end

function nests_GI_trashCompactor(skip)
    local logic = 99
    --[[        nest_trash_compactor
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.snooze_pack(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.snooze_pack(state)\
                or self.split_up(state) and self.tall_jump(state)\
                or self.wing_whack(state)\
                or self.glide(state)\
                or self.leg_spring(state)\
                or self.flap_flip(state)\
                or self.clockwork_eggs(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.snooze_pack(state)\
                or self.split_up(state) and self.tall_jump(state)\
                or self.wing_whack(state)\
                or self.glide(state)\
                or self.leg_spring(state)\
                or self.clockwork_eggs(state)\
                or self.flap_flip(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.snooze_pack(state)\
                or self.split_up(state) and self.tall_jump(state)\
                or self.wing_whack(state)\
                or self.glide(state)\
                or self.leg_spring(state)\
                or self.clockwork_eggs(state)\
                or self.flap_flip(state)
    --]]
    
    if ( has_snoozePack() ) then
        logic = 0
    elseif ( has("splitup") and has("tjump") or has_wingWhack() or has_glide() or has_legSpring() or has("fflip") or can_shootEggs("ceggs") ) then
        logic = 1
    end
    
    return convertLogic(logic, skip)
end

function nests_GI_elevatorShaftF2(skip)
    local logic = 99
    --[[        nest_elevator_shaft_floor2
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.climb(state)\
                or state.can_reach_region(regionName.GI2EM, self.player) and self.floor_2_em_room_to_elevator_shaft(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.climb(state)\
                or state.can_reach_region(regionName.GI2EM, self.player) and self.floor_2_em_room_to_elevator_shaft(state)\
                or state.can_reach_region(regionName.GI3B, self.player) and self.boiler_plant_to_elevator_shaft(state) and self.beak_buster(state)\
                or state.can_reach_region(regionName.GI4B, self.player) and self.floor_4_back_to_elevator_shaft(state) and self.beak_buster(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.climb(state)\
                or state.can_reach_region(regionName.GI2EM, self.player) and self.floor_2_em_room_to_elevator_shaft(state)\
                or state.can_reach_region(regionName.GI3B, self.player) and self.boiler_plant_to_elevator_shaft(state)\
                or state.can_reach_region(regionName.GI4B, self.player) and (self.health_upgrades(state, 2) or self.beak_buster(state)) and self.floor_4_back_to_elevator_shaft(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.climb(state)\
                or state.can_reach_region(regionName.GI2EM, self.player) and self.floor_2_em_room_to_elevator_shaft(state)\
                or state.can_reach_region(regionName.GI3B, self.player) and self.boiler_plant_to_elevator_shaft(state)\
                or state.can_reach_region(regionName.GI4B, self.player) and (self.health_upgrades(state, 2) or self.beak_buster(state)) and self.floor_4_back_to_elevator_shaft(state)
     --]]
    
    local gi2emAccessibility = Tracker:FindObjectForCode("@Region: Grunty Industries 2nd Floor - Electromagnetic Chamber").AccessibilityLevel
    local gi3bpAccessibility = Tracker:FindObjectForCode("@Region: Grunty Industries 3rd Floor - Boiler Plant").AccessibilityLevel
    local gi4bAccessibility = Tracker:FindObjectForCode("@Region: Grunty Industries 4th Floor - Past the Crushers").AccessibilityLevel
    local f2emToES = connector_GIF2ElectromagneticChamber_to_GIElevatorShaft(true)
    local f3bpToES = connector_GIF3BoilerPlant_to_GIElevatorShaft(true)
    local f4bToES = connector_GIF4Back_to_GIElevatorShaft(true)
    local hp7 = health_canGet7(true)
    
    -- Normal Logic
    if ( has("climb") or (gi2emAccessibility == AccessibilityLevel.Normal or gi2emAccessibility == AccessibilityLevel.Cleared) and f2emToES <= logictype.CurrentStage ) then
        logic = 0
    elseif ( (gi3bpAccessibility == AccessibilityLevel.Normal or gi3bpAccessibility == AccessibilityLevel.Cleared) and has("bbust") and f3bpToES <= logictype.CurrentStage or (gi4bAccessibility == AccessibilityLevel.Normal or gi4bAccessibility == AccessibilityLevel.Cleared) and has("bbust") and f4bToES <= logictype.CurrentStage ) then
        logic = 1
    elseif ( (gi2emAccessibility == AccessibilityLevel.Normal or gi2emAccessibility == AccessibilityLevel.Cleared) and f2emToES < 2 or logictype.CurrentStage == 0 and gi2emAccessibility > AccessibilityLevel.None and f2emToES < 2 ) then
        logic = 1 -- Sequence Breaking
    elseif ( (gi3bpAccessibility == AccessibilityLevel.Normal or gi3bpAccessibility == AccessibilityLevel.Cleared) and f3bpToES <= logictype.CurrentStage or (gi4bAccessibility == AccessibilityLevel.Normal or gi4bAccessibility == AccessibilityLevel.Cleared) and hp7 <= logictype.CurrentStage and f4bToES <= logictype.CurrentStage ) then
        logic = 2
    
    -- Sequence Breaking
    else
        local f2 = 99
        if ( gi2emAccessibility == AccessibilityLevel.Normal or gi2emAccessibility == AccessibilityLevel.Cleared ) then
            f2 = f2emToES
        elseif ( gi2emAccessibility > AccessibilityLevel.None ) then
            f2 = math.max(logictype.CurrentStage + 1, f2emToES)
        end
        
        local f3 = 99
        if ( gi3bpAccessibility == AccessibilityLevel.Normal or gi3bpAccessibility == AccessibilityLevel.Cleared ) then
            f3 = math.max(2, f3bpToES)
        elseif ( gi3bpAccessibility > AccessibilityLevel.None ) then
            f3 = math.max(2, logictype.CurrentStage + 1, f3bpToES)
        end
        
        local f4bbust = 99
        if ( gi4bAccessibility == AccessibilityLevel.Normal or gi4bAccessibility == AccessibilityLevel.Cleared and has("bbust") ) then
            f4bbust = math.max(2, f4bToES)
        elseif ( gi4bAccessibility > AccessibilityLevel.None and has("bbust") ) then
            f4bbust = math.max(2, logictype.CurrentStage + 1, f4bToES)
        end
        
        local f4hp = 99
        if ( gi4bAccessibility == AccessibilityLevel.Normal or gi4bAccessibility == AccessibilityLevel.Cleared ) then
            f4hp = math.max(2, f4bToES, hp7)
        elseif ( gi4bAccessibility > AccessibilityLevel.None ) then
            f4hp = math.max(2, logictype.CurrentStage + 1, f4bToES, hp7)
        end
        
        logic = math.min(f2, f3, f4bbust, f4hp)
    end
    
    return convertLogic(logic, skip)
end

function nests_GI_elevatorShaftF3(skip)
    local logic = 99
    --[[        nest_elevator_shaft_floor3
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.climb(state)\
                or state.can_reach_region(regionName.GI3B, self.player) and self.boiler_plant_to_elevator_shaft(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.climb(state)\
                or state.can_reach_region(regionName.GI3B, self.player) and self.boiler_plant_to_elevator_shaft(state)\
                or state.can_reach_region(regionName.GI4B, self.player) and self.floor_4_back_to_elevator_shaft(state) and self.beak_buster(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.climb(state)\
                or state.can_reach_region(regionName.GI3B, self.player) and self.boiler_plant_to_elevator_shaft(state)\
                or state.can_reach_region(regionName.GI4B, self.player) and self.floor_4_back_to_elevator_shaft(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.climb(state)\
                or state.can_reach_region(regionName.GI3B, self.player) and self.boiler_plant_to_elevator_shaft(state)\
                or state.can_reach_region(regionName.GI4B, self.player) and self.floor_4_back_to_elevator_shaft(state)
    --]]
    
    local gi3bpAccessibility = Tracker:FindObjectForCode("@Region: Grunty Industries 3rd Floor - Boiler Plant").AccessibilityLevel
    local gi4bAccessibility = Tracker:FindObjectForCode("@Region: Grunty Industries 4th Floor - Past the Crushers").AccessibilityLevel
    local f3bpToES = connector_GIF3BoilerPlant_to_GIElevatorShaft(true)
    local f4bToES = connector_GIF4Back_to_GIElevatorShaft(true)
    
    -- Normal Logic
    if ( has("climb") or (gi3bpAccessibility == AccessibilityLevel.Normal or gi3bpAccessibility == AccessibilityLevel.Cleared) and f3bpToES <= logictype.CurrentStage ) then
        logic = 0
    elseif ( (gi4bAccessibility == AccessibilityLevel.Normal or gi4bAccessibility == AccessibilityLevel.Cleared) and has("bbust") and f4bToES <= logictype.CurrentStage ) then
        logic = 1
    elseif ( (gi3bpAccessibility == AccessibilityLevel.Normal or gi3bpAccessibility == AccessibilityLevel.Cleared) and f3bpToES < 2 or logictype.CurrentStage == 0 and gi3bpAccessibility > AccessibilityLevel.None and f3bpToES < 2 ) then
        logic = 1 -- Sequence Breaking
    elseif ( (gi4bAccessibility == AccessibilityLevel.Normal or gi4bAccessibility == AccessibilityLevel.Cleared) and f4bToES <= logictype.CurrentStage ) then
        logic = 2
    
    -- Sequence Breaking
    else        
        local f3 = 99
        if ( gi3bpAccessibility == AccessibilityLevel.Normal or gi3bpAccessibility == AccessibilityLevel.Cleared ) then
            f3 = f3bpToES
        elseif ( gi3bpAccessibility > AccessibilityLevel.None ) then
            f3 = math.max(logictype.CurrentStage + 1, f3bpToES)
        end
        
        local f4 = 99
        if ( gi4bAccessibility == AccessibilityLevel.Normal or gi4bAccessibility == AccessibilityLevel.Cleared ) then
            f4 = math.max(2, f4bToES)
        elseif ( gi4bAccessibility > AccessibilityLevel.None ) then
            f4 = math.max(2, logictype.CurrentStage + 1, f4bToES)
        end
        
        logic = math.min(f3, f4)
    end
    
    return convertLogic(logic, skip)
end

function nests_GI_elevatorShaftF4(skip)
    local logic = 99
    --[[        nest_elevator_shaft_floor4
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.climb(state)\
                or state.can_reach_region(regionName.GI4B, self.player) and self.floor_4_back_to_elevator_shaft(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.climb(state)\
                or state.can_reach_region(regionName.GI4B, self.player) and self.floor_4_back_to_elevator_shaft(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.climb(state)\
                or state.can_reach_region(regionName.GI4B, self.player) and self.floor_4_back_to_elevator_shaft(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.climb(state)\
                or state.can_reach_region(regionName.GI4B, self.player) and self.floor_4_back_to_elevator_shaft(state)
    --]]
    
    local gi4bAccessibility = Tracker:FindObjectForCode("@Region: Grunty Industries 4th Floor - Past the Crushers").AccessibilityLevel
    local f4bToES = connector_GIF4Back_to_GIElevatorShaft(true)
    
    -- Normal Logic
    if ( has("climb") or (gi4bAccessibility == AccessibilityLevel.Normal or gi4bAccessibility == AccessibilityLevel.Cleared) and f4bToES <= logictype.CurrentStage ) then
        logic = 0
    
    -- Sequence Breaking
    elseif ( gi4bAccessibility == AccessibilityLevel.Normal or gi4bAccessibility == AccessibilityLevel.Cleared ) then
        logic = f4bToES
    elseif ( gi4bAccessibility > AccessibilityLevel.None ) then
        logic = math.max(logictype.CurrentStage + 1, f4bToES)
    end
    
    return convertLogic(logic, skip)
end

function nests_GI_floor2OnScaffolding(skip)
    local logic = 99
    --[[        nest_funny_platform
    if self.world.options.logic_type == LogicType.option_intended:
        logic = state.can_reach_region(regionName.GI2, self.player) and self.claw_clamber_boots(state) and self.flap_flip(state) and self.grip_grab(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = state.can_reach_region(regionName.GI2, self.player) and self.claw_clamber_boots(state) and (self.flap_flip(state) and self.grip_grab(state))\
                or state.can_reach_region(regionName.GI2, self.player) and self.floor_2_split_up(state)\
                    and (self.leg_spring(state) or self.claw_clamber_boots(state) and (self.can_shoot_any_egg(state) or self.wing_whack(state)))\
                    and self.glide(state)\
                or state.can_reach_region(regionName.GI3, self.player) and\
                    self.climb(state) and (self.veryLongJump(state) or self.flap_flip(state) or self.tall_jump(state)) and self.grip_grab(state)\
                or state.can_reach_region(regionName.GI3, self.player) and self.small_elevation(state)\
                    and self.split_up(state) and self.leg_spring(state) and self.glide(state)                                               -- checking for split up is redundant
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = state.can_reach_region(regionName.GI2, self.player) and self.claw_clamber_boots(state)\
                    and ((self.flap_flip(state) and self.grip_grab(state))\
                         or self.talon_trot(state) and (self.flutter(state) or self.air_rat_a_tat_rap(state)))\
                or state.can_reach_region(regionName.GI2, self.player) and self.floor_2_split_up(state)\
                    and (self.leg_spring(state) or self.claw_clamber_boots(state) and (self.can_shoot_any_egg(state) or self.wing_whack(state)))\
                    and self.glide(state)\
                or state.can_reach_region(regionName.GI3, self.player) and\
                    self.climb(state) and (self.veryLongJump(state) or self.flap_flip(state) or self.tall_jump(state)) and self.grip_grab(state)\
                or state.can_reach_region(regionName.GI3, self.player) and self.small_elevation(state)\
                    and self.split_up(state) and self.leg_spring(state) and self.glide(state)\
                or self.clockwork_shot(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = state.can_reach_region(regionName.GI2, self.player) and self.claw_clamber_boots(state)\
                    and ((self.flap_flip(state) and self.grip_grab(state))\
                         or self.talon_trot(state) and (self.flutter(state) or self.air_rat_a_tat_rap(state)))\
                or state.can_reach_region(regionName.GI2, self.player) and self.floor_2_split_up(state)\
                    and (self.leg_spring(state) or self.claw_clamber_boots(state) and (self.can_shoot_any_egg(state) or self.wing_whack(state)))\
                    and self.glide(state)\
                or state.can_reach_region(regionName.GI3, self.player) and\
                    self.climb(state) and (self.veryLongJump(state) or self.flap_flip(state) or self.tall_jump(state)) and self.grip_grab(state)\
                or state.can_reach_region(regionName.GI3, self.player) and self.small_elevation(state)\
                    and self.split_up(state) and self.leg_spring(state) and self.glide(state)\
                or self.clockwork_shot(state)
    --]]
    
    local gi2Accessibility = Tracker:FindObjectForCode("@Region: Grunty Industries 2nd Floor").AccessibilityLevel
    local gi3Accessibility = Tracker:FindObjectForCode("@Region: Grunty Industries 3rd Floor").AccessibilityLevel
    local floor2SplitUp = access_GI_floor2SplitUp(true)
    
    -- Normal Logic
    if ( (gi2Accessibility == AccessibilityLevel.Normal or gi2Accessibility == AccessibilityLevel.Cleared) and has("clawbts") and has("fflip") and has("ggrab") ) then
        logic = 0
    elseif ( (gi2Accessibility == AccessibilityLevel.Normal or gi2Accessibility == AccessibilityLevel.Cleared) and floor2SplitUp <= logictype.CurrentStage and has_glide() and (has_legSpring() or has("clawbts") and (can_shootEggs() or has_wingWhack())) or (gi3Accessibility == AccessibilityLevel.Normal or gi3Accessibility == AccessibilityLevel.Cleared) and (has("climb") and has("ggrab") and (can_veryLongJump() or has("fflip") or has("tjump")) or can_reachSmallElevation() and has_legSpring() and has_glide()) ) then
        logic = 1
    elseif ( logictype.CurrentStage == 0 and gi2Accessibility > AccessibilityLevel.None and has("clawbts") and has("fflip") and has("ggrab") ) then
        logic = 1 -- Sequence Breaking
    elseif ( (gi2Accessibility == AccessibilityLevel.Normal or gi2Accessibility == AccessibilityLevel.Cleared) and has("clawbts") and has("ttrot") and (has("flutter") or has("arat")) or can_clockworkShot() ) then
        logic = 2
    
    -- Sequence Breaking
    else
        local f2AsPair = 99
        local f2AsKazooie = 99
        if ( (gi2Accessibility == AccessibilityLevel.Normal or gi2Accessibility == AccessibilityLevel.Cleared) and has_glide() and (has_legSpring() or has("clawbts") and (can_shootEggs() or has_wingWhack())) ) then
            f2AsKazooie = math.max(2, floor2SplitUp)
        elseif ( gi2Accessibility > AccessibilityLevel.None ) then
            if ( has("clawbts") and (has("fflip") and has("ggrab") or has("ttrot") and (has("flutter") or has("arat"))) ) then
                f2AsPair = logictype.CurrentStage + 1
            end
            
            if ( has_glide() and (has_legSpring() or has("clawbts") and (can_shootEggs() or has_wingWhack())) ) then
                f2AsKazooie = math.max(2, logictype.CurrentStage + 1, floor2SplitUp)
            end
        end
        
        local f3 = 99
        if ( gi3Accessibility > AccessibilityLevel.None and (has("climb") and (can_veryLongJump() or has("fflip") or has("tjump")and has("ggrab")) or can_reachSmallElevation() and has_legSpring() and has_glide()) ) then
            f3 = logictype.CurrentStage + 1
        end
        
        logic = math.min(f2AsPair, f2AsKazooie, f3)
    end
    
    return convertLogic(logic, skip)
end

function nests_GI_floor2ButFromFlight(skip)
    local logic = 99
    --[[
    self.egg_aim(state) or self.airborne_egg_aiming(state) or self.beak_bomb(state)
    --]]
    
    if ( has("eggaim") or has("aireaim") or has("bbomb") ) then
        logic = 0
    end
    
    return convertLogic(logic, skip)
end

function nests_GI_floor2emChamber(skip)
    local logic = 99
    --[[        nest_magnet
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.tall_jump(state)\
                or self.talon_trot(state)\
                or self.flutter(state)\
                or self.air_rat_a_tat_rap(state)\
                or state.can_reach_region(regionName.GI2, self.player) and self.floor_2_to_em_room(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.tall_jump(state)\
                or self.talon_trot(state)\
                or self.flutter(state)\
                or self.air_rat_a_tat_rap(state)\
                or state.can_reach_region(regionName.GI2, self.player) and self.floor_2_to_em_room(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.tall_jump(state)\
                or self.talon_trot(state)\
                or self.flutter(state)\
                or self.air_rat_a_tat_rap(state)\
                or state.can_reach_region(regionName.GI2, self.player) and self.floor_2_to_em_room(state)\
                or self.clockwork_shot(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.tall_jump(state)\
                or self.talon_trot(state)\
                or self.flutter(state)\
                or self.air_rat_a_tat_rap(state)\
                or state.can_reach_region(regionName.GI2, self.player) and self.floor_2_to_em_room(state)\
                or self.clockwork_shot(state)
    --]]
    
    local gi2Accessibility = Tracker:FindObjectForCode("@Region: Grunty Industries 2nd Floor").AccessibilityLevel
    local f2ToEM = connector_GIF2_to_GIF2ElectromagneticChamber(true)
    
    -- Normal Logic
    if ( has("tjump") or has("ttrot") or has("flutter") or has("arat") or (gi2Accessibility == AccessibilityLevel.Normal or gi2Accessibility == AccessibilityLevel.Cleared) and f2ToEM <= logictype.CurrentStage ) then
        logic = 0
    elseif ( (gi2Accessibility == AccessibilityLevel.Normal or gi2Accessibility == AccessibilityLevel.Cleared) and f2ToEM < 2 ) then
        logic = 1 -- Sequence Breaking
    elseif ( logictype.CurrentStage == 0 and gi2Accessibility > AccessibilityLevel.None and f2ToEM < 2 ) then
        logic = 1 -- Sequence Breaking
    elseif ( can_clockworkShot() ) then
        logic = 2
    
    -- Sequence Breaking
    elseif ( (gi2Accessibility == AccessibilityLevel.Normal or gi2Accessibility == AccessibilityLevel.Cleared) ) then
        logic = f2ToEM
    elseif ( gi2Accessibility > AccessibilityLevel.None ) then
        logic = math.max(logictype.CurrentStage + 1, f2ToEM)
    end
    
    return convertLogic(logic, skip)
end

function nests_GI_floor3HighBox(skip)
    local logic = 99
    --[[        nest_floor3_high_box
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.flap_flip(state) and self.grip_grab(state)\
                or self.climb(state) and (
                    self.tall_jump(state) and self.grip_grab(state)\
                    or self.talon_trot(state) and self.flutter(state) and self.grip_grab(state)
                )\
                or self.floor_3_split_up(state) and self.leg_spring(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.flap_flip(state) and (self.grip_grab(state) or self.beak_buster(state))\
                or self.climb(state) and (
                    self.tall_jump(state) and self.grip_grab(state)\
                    or self.talon_trot(state) and self.flutter(state) and self.grip_grab(state)
                )\
                or self.pack_whack(state) and self.floor_3_split_up(state) and self.tall_jump(state)\
                or self.floor_3_split_up(state) and self.leg_spring(state)

    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.flap_flip(state) and (self.grip_grab(state) or self.beak_buster(state))\
                or self.climb(state) and (
                    self.tall_jump(state) and self.grip_grab(state)\
                    or self.talon_trot(state) and self.flutter(state) and self.grip_grab(state)
                )\
                or self.pack_whack(state) and self.floor_3_split_up(state) and self.tall_jump(state)\
                or self.floor_3_split_up(state) and self.leg_spring(state)\
                or self.floor_3_split_up(state) and self.tall_jump(state) and (self.wing_whack(state) or self.glide(state))\
                or self.clockwork_shot(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.flap_flip(state) and (self.grip_grab(state) or self.beak_buster(state))\
                or self.climb(state) and (
                    self.tall_jump(state) and self.grip_grab(state)\
                    or self.talon_trot(state) and self.flutter(state) and self.grip_grab(state)
                )\
                or self.pack_whack(state) and self.floor_3_split_up(state) and self.tall_jump(state)\
                or self.floor_3_split_up(state) and self.leg_spring(state)\
                or self.floor_3_split_up(state) and self.tall_jump(state) and (self.wing_whack(state) or self.glide(state))\
                or self.clockwork_shot(state)
     --]]
    
    local floor3SplitUp = access_GI_floor3SplitUp(true)
    
    -- Normal Logic
    if ( has("ggrab") and (has("fflip") or has("climb") and (has("tjump") or has("ttrot") and has("flutter"))) or floor3SplitUp <= logictype.CurrentStage and has_legSpring() ) then
        logic = 0
    elseif ( has("fflip") and has("bbust") or floor3SplitUp <= logictype.CurrentStage and has_packWhack() and has("tjump") ) then
        logic = 1
    elseif ( floor3SplitUp < 2 and (has_legSpring() or has_packWhack() and has("tjump")) ) then
        logic = 1 -- Sequence Breaking
    elseif ( can_clockworkShot() or floor3SplitUp <= logictype.CurrentStage and (has_wingWhack() or has_glide()) and has("tjump") ) then
        logic = 2
    
    -- Sequence Breaking
    elseif ( has_legSpring() or has("tjump") and (has_packWhack() or has_wingWhack() or has_glide()) ) then
        logic = math.max(2, floor3SplitUp)
    end
    
    return convertLogic(logic, skip)
end

function nests_GI_floor3BoxUnderNotes(skip)
    local logic = 99
    --[[        nest_floor3_under_notes_boxes
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.climb(state)\
                or self.floor_3_split_up(state) and self.leg_spring(state)\
                or self.flap_flip(state)\
                or self.slightly_elevated_ledge(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.climb(state)\
                or self.enter_floor_3_from_fire_exit(state)\
                or self.flap_flip(state)\
                or self.slightly_elevated_ledge(state)\
                or self.floor_3_split_up(state) and self.leg_spring(state)\
                or self.floor_3_split_up(state) and self.pack_whack(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.climb(state)\
                or self.enter_floor_3_from_fire_exit(state)\
                or self.flap_flip(state)\
                or self.slightly_elevated_ledge(state)\
                or self.floor_3_split_up(state) and self.leg_spring(state)\
                or self.floor_3_split_up(state) and self.pack_whack(state)\
                or self.floor_3_split_up(state) and self.sack_pack(state)\
                or self.floor_3_split_up(state) and self.tall_jump(state) and (self.wing_whack(state) or self.glide(state))\
                or self.clockwork_shot(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.climb(state)\
                or self.enter_floor_3_from_fire_exit(state)\
                or self.flap_flip(state)\
                or self.slightly_elevated_ledge(state)\
                or self.floor_3_split_up(state) and self.leg_spring(state)\
                or self.floor_3_split_up(state) and self.pack_whack(state)\
                or self.floor_3_split_up(state) and self.sack_pack(state)\
                or self.floor_3_split_up(state) and self.tall_jump(state) and (self.wing_whack(state) or self.glide(state))\
                or self.clockwork_shot(state)
     --]]
    
    local floor3SplitUp = access_GI_floor3SplitUp(true)
    local f3FromFireExit = access_GI_enterFloor3FromFireExit(true)
    
    -- Normal Logic
    if ( has("climb") or floor3SplitUp <= logictype.CurrentStage and has_legSpring() or has("fflip") or can_reachSlightlyElevatedLedge() ) then
        logic = 0
    elseif ( f3FromFireExit <= logictype.CurrentStage or floor3SplitUp <= logictype.CurrentStage and has_packWhack() ) then
        logic = 1
    elseif ( floor3SplitUp < 2 and (has_legSpring() or has_packWhack()) or f3FromFireExit < 2 ) then
        logic = 1 -- Sequence Breaking
    elseif ( can_clockworkShot() or floor3SplitUp <= logictype.CurrentStage and (has_sackPack() or has("tjump") and (has_wingWhack() or has_glide())) ) then
        logic = 2 -- Normal Logic
    
    -- Sequence Breaking
    else
        local f3SU = 99
        if ( has_legSpring() or has_packWhack() or has_sackPack() or has("tjump") and (has_wingWhack() or has_glide()) ) then
            f3SU = math.max(2, floor3SplitUp)
        end
    
        logic = math.max(1, math.min(f3SU, f3FromFireExit))
    end
    
    return convertLogic(logic, skip)
end

function nests_GI_floor3cornerBox(skip) -- nests_GI_floor3featherNests
    local logic = 99
    --[[        nests_GI_floor3cornerBox
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.floor_3_split_up(state)\
                or self.small_elevation(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.floor_3_split_up(state)\
                or self.small_elevation(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.floor_3_split_up(state)\
                or self.small_elevation(state)\
                or self.clockwork_shot(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.floor_3_split_up(state)\
                or self.small_elevation(state)\
                or self.clockwork_shot(state)
     --]]
    
    local floor3SplitUp = access_GI_floor3SplitUp(true)
    
    if ( floor3SplitUp <= logictype.CurrentStage or can_reachSmallElevation() ) then
        logic = 0 -- Normal Logic
    elseif ( floor3SplitUp < 2 ) then
        logic = 1 -- Sequence Breaking
    elseif ( can_clockworkShot() ) then
        logic = 2 -- Normal Logic
    
    -- Sequence Breaking
    else
        logic = floor3SplitUp
    end
    
    return convertLogic(logic, skip)
end

function nests_GI_floor3featherNests(skip)
    local logic = 99
    --[[        nests_GI_floor3cornerBox
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.floor_3_split_up(state)\
                or self.small_elevation(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.floor_3_split_up(state)\
                or self.small_elevation(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.floor_3_split_up(state)\
                or self.small_elevation(state)\
                or self.clockwork_shot(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.floor_3_split_up(state)\
                or self.small_elevation(state)\
                or self.clockwork_shot(state)
     --]]
    
    local floor3SplitUp = access_GI_floor3SplitUp(true)
    
    if ( floor3SplitUp <= logictype.CurrentStage or can_reachSmallElevation() ) then
        logic = 0 -- Normal Logic
    elseif ( floor3SplitUp < 2 ) then
        logic = 1 -- Sequence Breaking
    elseif ( can_clockworkShot() ) then
        logic = 2 -- Normal Logic
    
    -- Sequence Breaking
    else
        logic = floor3SplitUp
    end
    
    return convertLogic(logic, skip)
end

function nests_GI_floor3nearMumbo(skip)
    local logic = 99
    --[[        nest_floor3_shortcut
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.floor_3_split_up(state)\
                or self.small_elevation(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.floor_3_split_up(state)\
                or self.small_elevation(state)\
                or self.beak_buster(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.floor_3_split_up(state)\
                or self.small_elevation(state)\
                or self.beak_buster(state)\
                or self.clockwork_shot(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.floor_3_split_up(state)\
                or self.small_elevation(state)\
                or self.beak_buster(state)\
                or self.clockwork_shot(state)
     --]]
     
    local floor3SplitUp = access_GI_floor3SplitUp(true)
    
    -- Normal Logic
    if ( can_reachSmallElevation() or floor3SplitUp <= logictype.CurrentStage ) then
        logic = 0
    elseif ( has("bbust") ) then
        logic = 1
    elseif ( floor3SplitUp < 2 ) then
        logic = 1 -- Sequence Breaking
    elseif ( can_clockworkShot() ) then
        logic = 2
    
    -- Sequence Breaking
    else
        logic = floor3SplitUp
    end
    
    return convertLogic(logic, skip)
end

function nests_GI_floor4nearFireEscape(skip)
    local logic = 99
    --[[        nest_floor4_front
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.small_elevation(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.small_elevation(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.small_elevation(state) or self.clockwork_shot(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.small_elevation(state) or self.clockwork_shot(state)
    --]]
    
    if ( can_reachSmallElevation() ) then
        logic = 0
    elseif ( can_clockworkShot() ) then
        logic = 2
    elseif ( has("arat") ) then
        logic = 7 -- FIXIT you can get these without tall jump if you have arat
    end
    
    return convertLogic(logic, skip)
end

function nests_GI_floor4front(skip)
    local logic = 99
    --[[        nest_floor4_front
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.small_elevation(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.small_elevation(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.small_elevation(state) or self.clockwork_shot(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.small_elevation(state) or self.clockwork_shot(state)
    --]]
    
    if ( can_reachSmallElevation() ) then
        logic = 0
    elseif ( can_clockworkShot() ) then
        logic = 2
    end
    
    return convertLogic(logic, skip)
end

function nests_GI_floor4outsideQC(skip)
    local logic = 99
    --[[        nest_outside_QC
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.climb(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.climb(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.climb(state)\
                or self.pack_whack(state) and self.tall_jump(state)\
                or self.split_up(state) and (self.leg_spring(state) or self.spring_pad(state))
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.climb(state)\
                or self.pack_whack(state) and self.tall_jump(state)\
                or self.split_up(state) and (self.leg_spring(state) or self.spring_pad(state))\
                or self.precise_clockwork_warp(state) and (self.spring_pad(state) or self.flap_flip(state))\
                or state.can_reach_region(regionName.GIES, self.player) and self.elevator_shaft_to_floor_4(state)
    --]]
    
    local giesAccessibility = Tracker:FindObjectForCode("@Region: Grunty Industries Elevator Shaft").AccessibilityLevel
    local esToF4B = connector_GIElevatorShaft_to_GIF4Back(true)
    
    -- Normal Logic
    if ( has("climb") ) then
        logic = 0
    elseif ( has_packWhack() and has("tjump") or has("splitup") and (has_legSpring() or has("tjump")) ) then
        logic = 2
    elseif ( can_preciseClockworkWarp() and (has("tjump") or has("fflip")) or (giesAccessibility == AccessibilityLevel.Normal or giesAccessibility == AccessibilityLevel.Cleared) and esToF4B <= logictype.CurrentStage ) then
        logic = 3
    
    -- Sequence Breaking
    elseif ( giesAccessibility == AccessibilityLevel.Normal or giesAccessibility == AccessibilityLevel.Cleared ) then
        logic = math.max(3, esToF4B)
    elseif ( giesAccessibility > AccessibilityLevel.None ) then
        logic = math.max(3, logictype.CurrentStage + 1, esToF4B)
    end
    
    return convertLogic(logic, skip)
end

function nests_GI_qualityControl(skip)
    local logic = 99
    --[[        nest_quality_control
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.can_use_battery(state) and self.climb(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.can_use_battery(state) and self.climb(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.can_use_battery(state) and self.climb(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.can_use_battery(state) and self.climb(state)\
                or self.precise_clockwork_warp(state) and (self.spring_pad(state) or self.flap_flip(state))
    --]]
    
    if ( basic_GI_canUseBattery() and has("climb") ) then
        logic = 0
    elseif ( can_preciseClockworkWarp() and (has("tjump") or has("fflip")) ) then
        logic = 3
    end
    
    return convertLogic(logic, skip)
end

function nests_GI_floor5smallStack(skip)
    local logic = 99
    --[[        nest_floor5_small_stack
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.small_elevation(state)\
                or self.split_up(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.small_elevation(state)\
                or self.split_up(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.small_elevation(state)\
                or self.split_up(state)\
                or self.clockwork_shot(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.small_elevation(state)\
                or self.split_up(state)\
                or self.clockwork_shot(state)
    --]]
    
    if ( can_reachSmallElevation() and has("splitup") ) then
        logic = 0
    elseif ( can_clockworkShot() ) then
        logic = 2
    end
    
    return convertLogic(logic, skip)
end

function nests_GI_outsideRepairDepot(skip)
    local logic = 99
    --[[        nest_outside_repair_depot
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.flap_flip(state) and self.climb(state) and self.grip_grab(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.flap_flip(state) and self.climb(state) and (self.grip_grab(state)\
                    or (self.tall_jump(state) and (self.flutter(state) or self.air_rat_a_tat_rap(state))))
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.flap_flip(state) and self.climb(state) and (self.grip_grab(state)\
                    or (self.tall_jump(state) and (self.flutter(state) or self.air_rat_a_tat_rap(state))))\
                or self.leg_spring(state) and (self.glide(state) or self.wing_whack(state))\
                or self.clockwork_shot(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.flap_flip(state) and self.climb(state) and (self.grip_grab(state)\
                    or (self.tall_jump(state) and (self.flutter(state) or self.air_rat_a_tat_rap(state))))\
                or self.leg_spring(state) and (self.glide(state) or self.wing_whack(state))\
                or self.clockwork_shot(state)
    --]]
    
    if ( has("fflip") and has("climb") and has("ggrab") ) then
        logic = 0
    elseif ( has("fflip") and has("climb") and has("tjump") and (has("flutter") or has("arat")) ) then
        logic = 1
    elseif ( can_clockworkShot() or has_legSpring() and (has_glide() or has_wingWhack()) ) then
        logic = 2
    end
    
    return convertLogic(logic, skip)
end

function nests_GI_fanEasy(skip)
    local logic = 99
    --[[        nest_egg_fan_easy
    if self.world.options.logic_type == LogicType.option_intended:
        logic = (self.tall_jump(state) or self.flutter(state) or self.air_rat_a_tat_rap(state)) and self.climb(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.climb(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.climb(state)\
                or self.leg_spring(state) and (self.wing_whack(state) or self.glide(state))
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.climb(state)\
                or self.leg_spring(state) and (self.wing_whack(state) or self.glide(state))
    --]]
    
    if ( has("climb") and (has("tjump") or has("flutter") or has("arat")) ) then
        logic = 0
    elseif ( has("climb") ) then
        logic = 1
    elseif ( has_legSpring() and (has_glide() or has_wingWhack()) ) then
        logic = 2
    end
    
    return convertLogic(logic, skip)
end

function nests_GI_fanHard(skip)
    local logic = 99
    --[[        nest_egg_fan_hard
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.can_beat_weldar(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.can_beat_weldar(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.can_beat_weldar(state)\
                or (self.climb(state) or self.leg_spring(state) and (self.wing_whack(state) or self.glide(state))) and self.clockwork_shot(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.can_beat_weldar(state)\
                or (self.climb(state) or self.leg_spring(state) and (self.wing_whack(state) or self.glide(state))) and self.clockwork_shot(state)
    --]]
    
    local canBeatWeldar = access_GI_canBeatWeldar(true)
    
    if ( canBeatWeldar <= logictype.CurrentStage ) then
        logic = 0 -- Normal Logic
    elseif ( canBeatWeldar < 2 ) then
        logic = 1 -- Sequence Breaking
    elseif ( has("climb") or has_legSpring() and (has_wingWhack() or has_glide()) and can_clockworkShot() ) then
        logic = 2 -- Normal Logic
    
    -- Sequence Breaking
    else
        logic = canBeatWeldar
    end
    
    return convertLogic(logic, skip)
end

function nests_GI_wasteDisposalWaterPump(skip)
    local logic = 99
    --[[        nest_waste_disposal_water_pump
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.jrl_waste_disposal(state) and self.flap_flip(state) and self.climb(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.jrl_waste_disposal(state) and self.flap_flip(state) and self.climb(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        #If someone finds a setup for a clockwork shot for these nests, I'll add it to the logic.
        logic = self.jrl_waste_disposal(state) and self.climb(state)\
                 and (self.flap_flip(state)\
                    or self.tall_jump(state) and self.flutter(state)\
                    or self.extremelyLongJump(state)\
                    or self.tall_jump(state) and self.beak_buster(state)\
                    or self.talon_trot(state) and self.flutter(state) and self.beak_buster(state)\
                )
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.jrl_waste_disposal(state) and self.climb(state)\
                 and (self.flap_flip(state)\
                    or self.tall_jump(state) and self.flutter(state)\
                    or self.extremelyLongJump(state)\
                    or self.tall_jump(state) and self.beak_buster(state)\
                    or self.talon_trot(state) and self.flutter(state) and self.beak_buster(state)\
                )
    --]]
    
    local jrlWasteDisposal = access_JRL_canEnterGIWasteDisposal(true)
    local extremelyLongJump = can_extremelyLongJump(true)
    
    if ( jrlWasteDisposal <= logictype.CurrentStage and has("fflip") and has("climb") ) then
        logic = 0 -- Normal Logic
    elseif ( jrlWasteDisposal < 2 and has("fflip") and has("climb") ) then
        logic = 1 -- Sequence Breaking
    elseif ( jrlWasteDisposal <= logictype.CurrentStage and has("climb") and (has("tjump") and has("flutter") or extremelyLongJump() <= logictype.CurrentStage or has("tjump") and has("bbust") or has("ttrot") and has("flutter") and has("bbust")) ) then
        logic = 2 -- Normal Logic
    
    -- Sequence Breaking
    elseif ( has("climb") ) then
        local normalJump = 99
        if ( has("fflip") or has("tjump") and has("flutter") or has("tjump") and has("bbust") or has("ttrot") and has("flutter") and has("bbust") ) then
            normalJump = 2
        end
        
        logic = math.max(2, jrlWasteDisposal, math.min(normalJump, extremelyLongJump))
    end
    
    return convertLogic(logic, skip)
end

function nests_GI_sewerEntrance(skip)
    local logic = 99
    --[[        nest_clinkers_lobby
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.claw_clamber_boots(state) and self.climb(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.claw_clamber_boots(state) and self.climb(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.claw_clamber_boots(state) and self.climb(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.claw_clamber_boots(state)\
            and (self.clockwork_warp(state) and (self.spring_pad(state) or self.flap_flip(state))\
                or state.can_reach_region(regionName.GIES, self.player) and self.elevator_shaft_to_floor_4(state)\
                or self.climb(state))
    --]]
    
    local giesAccessibility = Tracker:FindObjectForCode("@Region: Grunty Industries Elevator Shaft").AccessibilityLevel
    local esToF4B = connector_GIElevatorShaft_to_GIF4Back(true)
    
    -- Normal Logic
    if ( has("clawbts") and has("climb") ) then
        logic = 0
    elseif ( has("clawbts") and (can_clockworkWarp() and (has("tjump") or has("fflip")) or (giesAccessibility == AccessibilityLevel.Normal or giesAccessibility == AccessibilityLevel.Cleared) and esToF4B <= logictype.CurrentStage) ) then
        logic = 3
    
    -- Sequence Breaking
    elseif ( giesAccessibility == AccessibilityLevel.Normal or giesAccessibility == AccessibilityLevel.Cleared ) then
        logic = math.max(3, esToF4B)
    elseif ( giesAccessibility > AccessibilityLevel.None ) then
        logic = math.max(3, logictype.CurrentStage + 1, esToF4B)
    end
    
    return convertLogic(logic, skip)
end

----- Signs

function signs_GI_outside(skip)
    local logic = 99
    --[[        signpost_gi_outside
    if self.world.options.logic_type == LogicType.option_intended:
        logic = state.can_reach_region(regionName.GIO, self.player) and self.outside_gi_to_outside_back(state)\
                or state.can_reach_region(regionName.GIOB, self.player) and self.climb(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = state.can_reach_region(regionName.GIO, self.player) and self.outside_gi_to_outside_back(state)\
                or state.can_reach_region(regionName.GIOB, self.player) and self.climb(state)\
                or state.can_reach_region(regionName.GI1, self.player) and (self.split_up(state) and self.tall_jump(state) or self.leg_spring(state))\
                or state.can_reach_region(regionName.GI2, self.player) and (self.floor_2_split_up(state) and (self.tall_jump(state) or self.leg_spring(state)))\
                or state.can_reach_region(regionName.GIF, self.player)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = state.can_reach_region(regionName.GIO, self.player) and self.outside_gi_to_outside_back(state)\
                or state.can_reach_region(regionName.GIOB, self.player) and self.climb(state)\
                or state.can_reach_region(regionName.GI1, self.player) and (self.split_up(state) and self.tall_jump(state) or self.leg_spring(state))\
                or state.can_reach_region(regionName.GI2, self.player) and (self.floor_2_split_up(state) and (self.tall_jump(state) or self.leg_spring(state)))\
                or state.can_reach_region(regionName.GIF, self.player)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = state.can_reach_region(regionName.GIO, self.player) and self.outside_gi_to_outside_back(state)\
                or state.can_reach_region(regionName.GIOB, self.player) and self.climb(state)\
                or state.can_reach_region(regionName.GI1, self.player) and (self.split_up(state) and self.tall_jump(state) or self.leg_spring(state))\
                or state.can_reach_region(regionName.GI2, self.player) and (self.floor_2_split_up(state) and (self.tall_jump(state) or self.leg_spring(state)))\
                or state.can_reach_region(regionName.GIF, self.player)
    --]]
    
    local gioAccessibility = Tracker:FindObjectForCode("@Region: Outside Grunty Industries").AccessibilityLevel
    local giobAccessibility = Tracker:FindObjectForCode("@Region: Outside Grunty Industries - Behind the building").AccessibilityLevel
    local gi1Accessibility = Tracker:FindObjectForCode("@Region: Grunty Industries 1st Floor").AccessibilityLevel
    local gi2Accessibility = Tracker:FindObjectForCode("@Region: Grunty Industries 2nd Floor").AccessibilityLevel
    local gifAccessibility = Tracker:FindObjectForCode("@Region: Grunty Industries Flight").AccessibilityLevel
    local outsideToBack = connector_GIO_to_GIOBack(true)
    local floor2SplitUp = access_GI_floor2SplitUp(true)
    
    -- Normal Logic
    if ( (gioAccessibility == AccessibilityLevel.Normal or gioAccessibility == AccessibilityLevel.Cleared) and outsideToBack <= logictype.CurrentStage or (giobAccessibility == AccessibilityLevel.Normal or giobAccessibility == AccessibilityLevel.Cleared) and has("climb") ) then
        logic = 0
    elseif ( (gi1Accessibility == AccessibilityLevel.Normal or gi1Accessibility == AccessibilityLevel.Cleared) and (has("splitup") and has("tjump") or has_legSpring()) or (gi2Accessibility == AccessibilityLevel.Normal or gi2Accessibility == AccessibilityLevel.Cleared) and floor2SplitUp <= logictype.CurrentStage and (has("tjump") or has_legSpring()) or (gifAccessibility == AccessibilityLevel.Normal or gifAccessibility == AccessibilityLevel.Cleared) ) then
        logic = 1
    
    -- Sequence Breaking
    else
        local outside = 99
        if ( gioAccessibility == AccessibilityLevel.Normal or gioAccessibility == AccessibilityLevel.Cleared ) then
            outside = outsideToBack
        elseif ( gioAccessibility > AccessibilityLevel.None ) then
            outside = math.max(outsideToBack, logictype.CurrentStage + 1)
        end
        
        local outsideBack = 99
        if ( giobAccessibility > AccessibilityLevel.None and has("climb") ) then
            outsideBack = logictype.CurrentStage + 1
        end
        
        local f1 = 99
        if ( gi1Accessibility > AccessibilityLevel.None and (has("splitup") and has("tjump") or has_legSpring()) ) then
            f1 = logictype.CurrentStage + 1
        end
        
        local f2 = 99
        if ( (gi2Accessibility == AccessibilityLevel.Normal or gi2Accessibility == AccessibilityLevel.Cleared) and (has("tjump") or has_legSpring()) ) then
            f2 = floor2SplitUp
        elseif ( gi2Accessibility > AccessibilityLevel.None and (has("tjump") or has_legSpring()) ) then
            f2 = math.max(floor2SplitUp, logictype.CurrentStage + 1)
        end
        
        local flight = 99
        if ( gifAccessibility > AccessibilityLevel.None ) then
            flight = logictype.CurrentStage + 1
        end
        
        logic = math.max(1, math.min(outside, outsideBack, f1, f2, flight))
    end
    
    return convertLogic(logic, skip)
end

function signs_GI_elevatorShaft(skip)
    local logic = 99
    --[[        signpost_elevator_shaft
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.climb(state) and self.tall_jump(state) and (self.flutter(state) or self.air_rat_a_tat_rap(state))
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.climb(state) and (
                    self.flutter(state)\
                    or self.air_rat_a_tat_rap(state)\
                    or self.tall_jump(state) and self.beak_buster(state)
                )
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.climb(state) and (
                    self.flutter(state)\
                    or self.air_rat_a_tat_rap(state)\
                    or self.tall_jump(state) and self.beak_buster(state)
                )
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.climb(state) and (
                    self.flutter(state)\
                    or self.air_rat_a_tat_rap(state)\
                    or self.tall_jump(state) and self.beak_buster(state)
                )
    --]]
    
    if ( has("climb") and has("tjump") and (has("flutter") or has("arat")) ) then
        logic = 0
    elseif ( has("climb") and (has("flutter") or has("arat") or has("tjump") and has("bbust")) ) then
        logic = 1
    end
    
    return convertLogic(logic, skip)
end

----- Other - Jinjos

function jinjo_GI_legSpring(skip)
    local logic = 99
    --[[        jinjo_legspring
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.leg_spring(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.leg_spring(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.leg_spring(state) or self.clockwork_shot(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.leg_spring(state) or self.clockwork_shot(state)
    --]]
    
    if ( has_legSpring() ) then
        logic = 0
    elseif ( can_clockworkShot() ) then
        logic = 2
    end
    
    return convertLogic(logic, skip)
end

function jinjo_GI_wasteDisposalPlant(skip)
    local logic = 99
    --[[        jinjo_waste_disposal
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.talon_torpedo(state) and self.ice_eggs_item(state)\
                and self.check_mumbo_magic(state, itemName.MUMBOJR) and self.sub_aqua_egg_aiming(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.talon_torpedo(state) and self.ice_eggs_item(state)\
                and (self.check_mumbo_magic(state, itemName.MUMBOJR) or self.doubleAir(state)) and self.sub_aqua_egg_aiming(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.ice_eggs_item(state) and self.sub_aqua_egg_aiming(state) and \
                self.talon_torpedo(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.ice_eggs_item(state) and self.sub_aqua_egg_aiming(state) and \
                self.talon_torpedo(state)
    --]]
    
    if ( has("ttorp") and has("ieggs") and has("mumbojr") and has("auqaim") ) then
        logic = 0
    elseif ( has("ttorp") and has("ieggs") and has("dair") and has("auqaim") ) then
        logic = 1
    elseif ( has("ttorp") and has("ieggs") and has("auqaim") ) then
        logic = 2
    end
    
    return convertLogic(logic, skip)
end

function jinjo_GI_boiler(skip)
    local logic = 99
    --[[        jinjo_boiler
    if self.world.options.logic_type == LogicType.option_intended:
        logic = state.can_reach_region(regionName.GIF, self.player) and self.flight_to_boiler_plant(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = state.can_reach_region(regionName.GIF, self.player) and self.flight_to_boiler_plant(state)\
                or state.can_reach_region(regionName.GI3, self.player) and self.small_elevation(state) and self.leg_spring(state) and self.glide(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = state.can_reach_region(regionName.GIF, self.player) and self.flight_to_boiler_plant(state)\
                or state.can_reach_region(regionName.GI3, self.player) and self.small_elevation(state) and self.leg_spring(state) and self.glide(state)\
                or self.clockwork_shot(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = state.can_reach_region(regionName.GIF, self.player) and self.flight_to_boiler_plant(state)\
                or state.can_reach_region(regionName.GI3, self.player) and self.small_elevation(state) and self.leg_spring(state) and self.glide(state)\
                or self.clockwork_shot(state)
    --]]
    
    local gifAccessibility = Tracker:FindObjectForCode("@Region: Grunty Industries Flight").AccessibilityLevel
    local flightToBoilerPlant = connector_GIFlight_to_GIF3BoilerPlant(true)
    
    -- Normal Logic
    if ( (gifAccessibility == AccessibilityLevel.Normal or gifAccessibility == AccessibilityLevel.Cleared) and flightToBoilerPlant <= logictype.CurrentStage ) then
        logic = 0
    elseif ( can_reachSmallElevation() and has_legSpring() and has_glide() ) then
        logic = 1
    elseif ( (gifAccessibility == AccessibilityLevel.Normal or gifAccessibility == AccessibilityLevel.Cleared or logictype.CurrentStage == 0 and gifAccessibility > AccessibilityLevel.None) and flightToBoilerPlant < 2 ) then
        logic = 1 -- Sequence Breaking
    elseif ( can_clockworkShot() ) then
        logic = 2
    
    -- Sequence Breaking
    else
        local flight = 99
        if ( gifAccessibility == AccessibilityLevel.Normal or gifAccessibility == AccessibilityLevel.Cleared ) then
            flight = flightToBoilerPlant
        elseif ( gifAccessibility > AccessibilityLevel.None ) then
            flight = math.max(flightToBoilerPlant, logictype.CurrentStage + 1)
        end
        
        logic = math.max(1, flight)
    end
    
    return convertLogic(logic, skip)
end

function jinjo_GI_outside(skip)
    local logic = 99
    --[[        jinjo_gi_outside
    if self.world.options.logic_type == LogicType.option_intended:
        logic = state.can_reach_region(regionName.GI2, self.player) and self.floor_2_split_up(state)\
                and self.pack_whack(state) and (self.wing_whack(state) or self.can_shoot_any_egg(state)) and self.claw_clamber_boots(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = state.can_reach_region(regionName.GI2, self.player) and self.floor_2_split_up(state)\
                    and self.pack_whack(state) and (self.wing_whack(state) or self.can_shoot_any_egg(state)) and self.claw_clamber_boots(state)\
                or state.can_reach_region(regionName.GIR, self.player) and self.split_up(state) and (self.wing_whack(state) or self.can_shoot_any_egg(state)) # Both characters drop from the roof, Banjo gets the jinjo.
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = state.can_reach_region(regionName.GI2, self.player) and self.floor_2_split_up(state)\
                    and self.pack_whack(state) and (self.wing_whack(state) or self.can_shoot_any_egg(state)) and self.claw_clamber_boots(state)\
                or state.can_reach_region(regionName.GIR, self.player) and self.split_up(state) and (self.wing_whack(state) or self.can_shoot_any_egg(state))
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = state.can_reach_region(regionName.GI2, self.player) and self.floor_2_split_up(state)\
                    and self.pack_whack(state) and (self.wing_whack(state) or self.can_shoot_any_egg(state)) and self.claw_clamber_boots(state)\
                or state.can_reach_region(regionName.GIR, self.player) and self.split_up(state) and (self.wing_whack(state) or self.can_shoot_any_egg(state))\
                or state.can_reach_region(regionName.GIR, self.player) and self.taxi_pack(state)\
                or (state.can_reach_region(regionName.GIOB, self.player) and self.claw_clamber_boots(state) or state.can_reach_region(regionName.GIR, self.player)) and self.egg_barge(state)
     --]]
    
    local gi2Accessibility = Tracker:FindObjectForCode("@Region: Grunty Industries 2nd Floor").AccessibilityLevel
    local girAccessibility = Tracker:FindObjectForCode("@Region: Grunty Industries Roof").AccessibilityLevel
    local giobAccessibility = Tracker:FindObjectForCode("@Region: Outside Grunty Industries - Behind the building").AccessibilityLevel
    local floor2SplitUp = access_GI_floor2SplitUp(true)
    
    -- Normal Logic
    if ( (gi2Accessibility == AccessibilityLevel.Normal or gi2Accessibility == AccessibilityLevel.Cleared) and floor2SplitUp <= logictype.CurrentStage and has_packWhack() and has("clawbts") and (has_wingWhack() or can_shootEggs()) ) then
        logic = 0
    elseif ( (girAccessibility == AccessibilityLevel.Normal or girAccessibility == AccessibilityLevel.Cleared) and has("splitup") and (has_wingWhack() or can_shootEggs()) ) then
        logic = 1
    elseif ( (gi2Accessibility == AccessibilityLevel.Normal or gi2Accessibility == AccessibilityLevel.Cleared or logictype.CurrentStage == 0 and gi2Accessibility > AccessibilityLevel.None) and floor2SplitUp < 2 and has_packWhack() and has("clawbts") and (has_wingWhack() or can_shootEggs()) ) then
        logic = 1 -- Sequence Breaking
    elseif ( (gi2Accessibility == AccessibilityLevel.Normal or gi2Accessibility == AccessibilityLevel.Cleared or logictype.CurrentStage == 1 and gi2Accessibility > AccessibilityLevel.None) and floor2SplitUp < 3 and has_packWhack() and has("clawbts") and (has_wingWhack() or can_shootEggs()) ) then
        logic = 2 -- Sequence Breaking
    elseif ( (girAccessibility == AccessibilityLevel.Normal or girAccessibility == AccessibilityLevel.Cleared) and (has_taxiPack() or can_eggBarge()) or (giobAccessibility == AccessibilityLevel.Normal or giobAccessibility == AccessibilityLevel.Cleared) and has("clawbts") ) then
        logic = 3
    
    -- Sequence Breaking
    else
        local f2 = 99
        if ( (gi2Accessibility == AccessibilityLevel.Normal or gi2Accessibility == AccessibilityLevel.Cleared) and has_packWhack() and has("clawbts") and (has_wingWhack() or can_shootEggs()) ) then
            f2 = floor2SplitUp
        elseif ( gi2Accessibility > AccessibilityLevel.None and has_packWhack() and has("clawbts") and (has_wingWhack() or can_shootEggs()) ) then
            f2 = math.max(floor2SplitUp, logictype.CurrentStage + 1)
        end
        
        local roofSolo = 99
        if ( girAccessibility > AccessibilityLevel.None and has("splitup") and (has_wingWhack() or can_shootEggs()) ) then
            roofSolo = logictype.CurrentStage + 1
        end
        
        local roofOther = 99
        if ( girAccessibility > AccessibilityLevel.None and (has_taxiPack() or can_eggBarge()) ) then
            roofOther = math.max(3, logictype.CurrentStage + 1)
        end
        
        local outsideBack = 99
        if ( giobAccessibility > AccessibilityLevel.None and has("clawbts") ) then
            outsideBack = math.max(3, logictype.CurrentStage + 1)
        end
        
        logic = math.min(f2, roofSolo, roofOther, outsideBack)
    end
    
    return convertLogic(logic, skip)
end

----- Other - Glowbos

function glowbo_GI_floor3(skip)
    local logic = 99
    --[[        glowbo_floor_3
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.flap_flip(state) and self.grip_grab(state)\
                or self.climb(state) and (
                    self.tall_jump(state) and self.grip_grab(state)\
                    or self.talon_trot(state) and self.flutter(state) and self.grip_grab(state)
                )\
                or self.floor_3_split_up(state) and self.leg_spring(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.flap_flip(state) and (self.grip_grab(state) or self.beak_buster(state))\
                or self.climb(state) and (
                    self.tall_jump(state) and self.grip_grab(state)\
                    or self.talon_trot(state) and self.flutter(state) and self.grip_grab(state)
                )\
                or self.floor_3_split_up(state) and self.leg_spring(state)\
                or self.pack_whack(state) and self.floor_3_split_up(state) and self.tall_jump(state)\
                or state.can_reach_region(regionName.GI3B, self.player)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.flap_flip(state) and (self.grip_grab(state) or self.beak_buster(state))\
                or self.climb(state) and (
                    self.tall_jump(state) and self.grip_grab(state)\
                    or self.talon_trot(state) and self.flutter(state) and self.grip_grab(state)
                )\
                or self.floor_3_split_up(state) and self.leg_spring(state)\
                or self.pack_whack(state) and self.floor_3_split_up(state) and self.tall_jump(state)\
                or state.can_reach_region(regionName.GI3B, self.player)\
                or self.clockwork_shot(state)\
                or self.sack_pack(state)\
                or self.tall_jump(state) and (self.wing_whack(state) or self.glide(state))
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.flap_flip(state) and (self.grip_grab(state) or self.beak_buster(state))\
                or self.climb(state) and (
                    self.tall_jump(state) and self.grip_grab(state)\
                    or self.talon_trot(state) and self.flutter(state) and self.grip_grab(state)
                )\
                or self.floor_3_split_up(state) and self.leg_spring(state)\
                or self.pack_whack(state) and self.floor_3_split_up(state) and self.tall_jump(state)\
                or state.can_reach_region(regionName.GI3B, self.player)\
                or self.clockwork_shot(state)\
                or self.sack_pack(state)\
                or self.tall_jump(state) and (self.wing_whack(state) or self.glide(state))
     --]]
     
    local gi3bpAccessibility = Tracker:FindObjectForCode("@Region: Grunty Industries 3rd Floor - Boiler Plant").AccessibilityLevel
    local floor3SplitUp = access_GI_floor3SplitUp(true)
    
    -- Normal Logic
    if ( has("fflip") and has("ggrab") or has("climb") and has("ggrab") and (has("tjump") or has("ttrot") and has("flutter")) or floor3SplitUp <= logictype.CurrentStage and has_legSpring() ) then
        logic = 0
    elseif ( has("fflip") and has("bbust") or floor3SplitUp <= logictype.CurrentStage and has_packWhack() and has("tjump") or (gi3bpAccessibility == AccessibilityLevel.Normal or gi3bpAccessibility == AccessibilityLevel.Cleared) ) then
        logic = 1
    elseif ( floor3SplitUp < 2 and has_legSpring() ) then
        logic = 1 -- Sequence Breaking
    elseif ( can_clockworkShot() or has_sackPack() or has("tjump") and (has_wingWhack() or has_glide()) ) then
        logic = 2
    
    -- Sequence Breaking
    else
        local f3SU = 99
        if ( has_legSpring() or has_packWhack() and has("tjump") ) then
            f3SU = math.max(1, floor3SplitUp)
        end
        
        local gi3bp = 99
        if ( gi3bpAccessibility > AccessibilityLevel.None ) then
            gi3bp = logictype.CurrentStage + 1
        end
        
        logic = math.min(f3SU, gi3bp)
    end
    
    return convertLogic(logic, skip)
end

----- Other - Honeycombs

function honeycomb_GI_floor3(skip)
    local logic = 99
    --[[        honeycomb_floor3
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.flap_flip(state) and self.grip_grab(state) and self.spring_pad(state)\
                or self.climb(state) and self.spring_pad(state) and (
                    self.tall_jump(state) and self.grip_grab(state)\
                    or self.talon_trot(state) and self.flutter(state) and self.grip_grab(state)                     -- this is redundant; both sides need grip grab and tall jump is already a requirement for spring pad
                )\
                or self.floor_3_split_up(state) and self.leg_spring(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.flap_flip(state) and (self.grip_grab(state) or self.beak_buster(state)) and self.spring_pad(state)\
                or self.climb(state) and self.spring_pad(state) and (
                    self.tall_jump(state) and self.grip_grab(state)\
                    or self.talon_trot(state) and self.flutter(state) and self.grip_grab(state)
                )\
                or self.pack_whack(state) and self.floor_3_split_up(state) and self.tall_jump(state)\
                or self.floor_3_split_up(state) and self.leg_spring(state)

    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.flap_flip(state) and (self.grip_grab(state) or self.beak_buster(state)) and self.spring_pad(state)\
                or self.climb(state) and self.spring_pad(state) and (
                    self.tall_jump(state) and self.grip_grab(state)\
                    or self.talon_trot(state) and self.flutter(state) and self.grip_grab(state)
                )\
                or self.pack_whack(state) and self.floor_3_split_up(state) and self.tall_jump(state)\
                or self.floor_3_split_up(state) and self.leg_spring(state)\
                or self.floor_3_split_up(state) and self.tall_jump(state) and (self.wing_whack(state) or self.glide(state))\
                or self.clockwork_shot(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.flap_flip(state) and (self.grip_grab(state) or self.beak_buster(state)) and self.spring_pad(state)\
                or self.climb(state) and self.spring_pad(state) and (
                    self.tall_jump(state) and self.grip_grab(state)\
                    or self.talon_trot(state) and self.flutter(state) and self.grip_grab(state)
                )\
                or self.pack_whack(state) and self.floor_3_split_up(state) and self.tall_jump(state)\
                or self.floor_3_split_up(state) and self.leg_spring(state)\
                or self.floor_3_split_up(state) and self.tall_jump(state) and (self.wing_whack(state) or self.glide(state))\
                or self.clockwork_shot(state)
     --]]
     
    local floor3SplitUp = access_GI_floor3SplitUp(true)
    
    -- Normal Logic
    if ( has("tjump") and has("ggrab") and (has("fflip") or has("climb")) or floor3SplitUp <= logictype.CurrentStage and has_legSpring() ) then
        logic = 0
    elseif ( has("tjump") and has("bbust") and has("fflip") or floor3SplitUp <= logictype.CurrentStage and has_packWhack() and has("tjump") ) then
        logic = 1
    elseif ( floor3SplitUp < 2 and (has_legSpring() or has_packWhack() and has("tjump")) ) then
        logic = 1 -- Sequence Breaking
    elseif ( can_clockworkShot() or floor3SplitUp <= logictype.CurrentStage and (has_wingWhack() or has_glide()) and has("tjump") ) then
        logic = 2
        
    -- Sequence Breaking
    elseif ( has_legSpring() or has("tjump") and (has_packWhack() or has_wingWhack() or has_glide()) ) then
        logic = math.max(2, floor3SplitUp)
    end
    
    return convertLogic(logic, skip)
end

function honeycomb_GI_trainStation(skip)
    local logic = 99
    --[[        honeycomb_gi_station
     if self.intended_logic(state):
        logic = self.grip_grab(state) and self.ground_attack(state) and self.spring_pad(state)
    elif self.easy_tricks_logic(state):
        logic = self.ground_attack(state) and self.spring_pad(state) and self.grip_grab(state)
    elif self.hard_tricks_logic(state):
        logic = (self.ground_attack(state) and self.spring_pad(state)) or self.clockwork_shot(state) or self.leg_spring(state)
    elif self.glitches_logic(state):
        logic = (self.ground_attack(state) and self.spring_pad(state)) or self.clockwork_shot(state) or self.leg_spring(state)
     --]]
    
    if ( has("ggrab") and can_groundAttack() and has("tjump") ) then
        logic = 0
    elseif ( can_clockworkShot() or has_legSpring() ) then
        logic = 2
    end
    
    return convertLogic(logic, skip)
end

----- Other - Cheato Pages

function cheato_GI_loggo(skip)
    local logic = 99
    --[[        cheato_loggo
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.has_explosives(state) and self.bill_drill(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.has_explosives(state) and\
                (self.grenade_eggs(state)\
                 or self.bill_drill(state)\
                 or self.breegull_bash(state)\
                 or self.beak_barge(state)\
                 or self.pack_whack(state))
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.has_explosives(state) and\
                (self.grenade_eggs(state)\
                 or self.bill_drill(state)\
                 or self.breegull_bash(state)\
                 or self.beak_barge(state)\
                 or self.pack_whack(state))
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.has_explosives(state) and\
                (self.grenade_eggs(state)\
                 or self.bill_drill(state)\
                 or self.breegull_bash(state)\
                 or self.beak_barge(state)\
                 or self.pack_whack(state))
    --]]
    
    local explosives = can_shootExplosiveEggs(true)
    
    -- Normal Logic
    if ( explosives <= logictype.CurrentStage and has_billDrill() ) then
        logic = 0
    elseif ( explosives <= logictype.CurrentStage and (can_shootEggs("geggs") or has_breegullBash() or has("bbarge") or has_packWhack()) ) then
        logic = 1
        
    -- Sequence Breaking
    elseif ( has_billDrill() or has_breegullBash() or has("bbarge") or has_packWhack() ) then
        logic = math.max(1, explosives)
    end
    
    return convertLogic(logic, skip)
end

function cheato_GI_window(skip)
    local logic = 99
    --[[        cheato_window
    if self.world.options.logic_type == LogicType.option_intended:
        logic = state.can_reach_region(regionName.GIF, self.player) and (self.egg_aim(state) or self.airborne_egg_aiming(state) or self.beak_bomb(state))
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = state.can_reach_region(regionName.GIF, self.player) and (self.egg_aim(state) or self.airborne_egg_aiming(state) or self.beak_bomb(state))\
                or state.can_reach_region(regionName.GI1, self.player) and self.leg_spring(state) and self.claw_clamber_boots(state) and self.wing_whack(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = state.can_reach_region(regionName.GIF, self.player) and (self.egg_aim(state) or self.airborne_egg_aiming(state) or self.beak_bomb(state))\
                or state.can_reach_region(regionName.GI1, self.player) and self.leg_spring(state) and self.claw_clamber_boots(state) and self.wing_whack(state)\
                or self.clockwork_shot(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = state.can_reach_region(regionName.GIF, self.player) and (self.egg_aim(state) or self.airborne_egg_aiming(state) or self.beak_bomb(state))\
                or state.can_reach_region(regionName.GI1, self.player) and self.leg_spring(state) and self.claw_clamber_boots(state) and self.wing_whack(state)\
                or state.can_reach_region(regionName.GI2, self.player) and self.clockwork_shot(state) and self.floor_2_split_up(state)\                          -- this is redundant since a clockwork shot alone is enough
                or self.clockwork_shot(state)
    --]]
    
    local gifAccessibility = Tracker:FindObjectForCode("@Region: Grunty Industries Flight").AccessibilityLevel
    local gi1Accessibility = Tracker:FindObjectForCode("@Region: Grunty Industries 1st Floor").AccessibilityLevel
    
    -- Normal Logic
    if ( (gifAccessibility == AccessibilityLevel.Normal or gifAccessibility == AccessibilityLevel.Cleared) and (has("eggaim") or has("aireaim") or has("bbomb")) ) then
        logic = 0
    elseif ( (gi1Accessibility == AccessibilityLevel.Normal or gi1Accessibility == AccessibilityLevel.Cleared) and has_legSpring() and has("clawbts") and has_wingWhack() ) then
        logic = 1
    elseif ( logictype.CurrentStage == 0 and gifAccessibility > AccessibilityLevel.None and (has("eggaim") or has("aireaim") or has("bbomb")) ) then
        logic = 1 -- Sequence Breaking
    elseif ( can_clockworkShot() ) then
        logic = 2
    
    -- Sequence Breaking
    else
        local flight = 99
        if ( gifAccessibility > AccessibilityLevel.None and (has("eggaim") or has("aireaim") or has("bbomb")) ) then
            flight = logictype.CurrentStage + 1
        end
        
        local f1 = 99
        if ( gi1Accessibility > AccessibilityLevel.None and has_legSpring() and has("clawbts") and has_wingWhack() ) then
            f1 = math.max(2, logictype.CurrentStage + 1)
        end
        
        logic = math.min(f1, flight)
    end
    
    return convertLogic(logic, skip)
end

----- Other

function other_GI_skivvyWorkersQuarters(skip)
    local logic = 99
    --[[        skivvy_worker_quarters
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.humbaGI(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.humbaGI(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.humbaGI(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.humbaGI(state)
    --]]
    
    logic = access_GI_humba(true)
    
    return convertLogic(logic, skip)
end

function other_GI_skivvyFloor1(skip)
    local logic = 99
    --[[        skivvy_floor_1
     if self.world.options.logic_type == LogicType.option_intended:
        logic = self.humbaGI(state) and self.bill_drill(state)\
                and state.can_reach_region(regionName.GIF, self.player) and (self.airborne_egg_aiming(state) or self.beak_bomb(state))
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.humbaGI(state) and self.bill_drill(state)\
                and state.can_reach_region(regionName.GIF, self.player) and (self.airborne_egg_aiming(state) or self.beak_bomb(state) \
                    or self.egg_aim(state))
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.humbaGI(state) and self.bill_drill(state)\
                and state.can_reach_region(regionName.GIF, self.player) and (self.airborne_egg_aiming(state) or self.beak_bomb(state) \
                    or self.egg_aim(state))
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.humbaGI(state) and self.bill_drill(state)\
                and state.can_reach_region(regionName.GIF, self.player) and (self.airborne_egg_aiming(state) or self.beak_bomb(state) \
                    or self.egg_aim(state))
    --]]
    
    local gifAccessibility = Tracker:FindObjectForCode("@Region: Grunty Industries Flight").AccessibilityLevel
    local humba = access_GI_humba(true)
    local skivvySwitch = access_GI_floor2SkivvySwitch(true)
    
    -- Normal Logic
    if ( humba <= logictype.CurrentStage and has_billDrill() and (gifAccessibility == AccessibilityLevel.Normal or gifAccessibility == AccessibilityLevel.Cleared) and (has("aireaim") or has("bbomb")) ) then
        logic = 0
    elseif ( humba <= logictype.CurrentStage and has_billDrill() and (gifAccessibility == AccessibilityLevel.Normal or gifAccessibility == AccessibilityLevel.Cleared) and has("eggaim") ) then
        logic = 1
    
    -- Sequence Breaking
    elseif ( has_billDrill() and (gifAccessibility == AccessibilityLevel.Normal or gifAccessibility == AccessibilityLevel.Cleared) and (has("aireaim") or has("bbomb") or has("eggaim")) ) then
        logic = math.max(1, humba)
    elseif ( has_billDrill() and gifAccessibility > AccessibilityLevel.None and (has("aireaim") or has("bbomb")) ) then
        logic = math.max(logictype.CurrentStage + 1, humba)
    end
    
    return convertLogic(logic, skip)
end

function other_GI_skivvyFloor2(skip)
    local logic = 99
    --[[        skivvy_floor_2
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.humbaGI(state) and self.floor_2_skivvy_switch(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.humbaGI(state) and self.floor_2_skivvy_switch(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.humbaGI(state) and self.floor_2_skivvy_switch(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.humbaGI(state) and self.floor_2_skivvy_switch(state)
    --]]
    
    local humba = access_GI_humba(true)
    local skivvySwitch = access_GI_floor2SkivvySwitch(true)
    
    -- Normal Logic
    if ( humba <= logictype.CurrentStage and skivvySwitch <= logictype.CurrentStage ) then
        logic = 0
    
    -- Sequence Breaking
    else
        logic = math.max(humba, skivvySwitch)
    end
    
    return convertLogic(logic, skip)
end

function other_GI_skivvyFloor3(skip)
    local logic = 99
    --[[        skivvy_floor_3
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.humbaGI(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.humbaGI(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.humbaGI(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.humbaGI(state)
    --]]
    
    logic = access_GI_humba(true)
    
    return convertLogic(logic, skip)
end

function other_GI_skivvyFloor5(skip)
    local logic = 99
    --[[        skivvy_floor_5
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.humbaGI(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.humbaGI(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.humbaGI(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.humbaGI(state)
    --]]
    
    logic = access_GI_humba(true)
    
    return convertLogic(logic, skip)
end

function other_GI_skivvyOutsideBack(skip)
    local logic = 99
    --[[        skivvy_outside
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.humbaGI(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.humbaGI(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.humbaGI(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.humbaGI(state)
    --]]
    
    logic = access_GI_humba(true)
    
    return convertLogic(logic, skip)
end