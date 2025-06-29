--------------- Hailfire Peaks

----- Basic & Access functions

function access_HFP_canCoolHotWater(skip)
    local logic = 99
    --[[        HFP_hot_water_cooled
    if self.world.options.backdoors:
        return state.can_reach_region(regionName.HP, self.player) and\
           self.split_up(state) and\
           (self.dive(state) or self.shack_pack(state))
    else:
        return state.can_reach_region(regionName.HP, self.player) and\
           state.can_reach_region(regionName.CC, self.player) and \
           self.split_up(state) and\
           self.ground_attack(state) and\
           (self.dive(state) or self.shack_pack(state))
    --]]
    
    if ( has("splitup") and (has("dive") or has_shackPack()) ) then
        local hfpAccessibility = Tracker:FindObjectForCode("@Region: Hailfire Peaks - Lava Side").AccessibilityLevel
        
        if ( has("backdoorsopen_on") ) then
            -- Normal Logic
            if ( hfpAccessibility == AccessibilityLevel.Normal or hfpAccessibility == AccessibilityLevel.Cleared ) then
                logic = 0
                
            -- Sequence Breaking
            elseif ( hfpAccessibility > AccessibilityLevel.None ) then
                logic = logictype.CurrentStage + 1 -- was already converted once by the json
            end
        else
            local ccAccessibility = Tracker:FindObjectForCode("@Region: Cloud Cuckooland").AccessibilityLevel
            
            -- Normal Logic
            if ( (hfpAccessibility == AccessibilityLevel.Normal or hfpAccessibility == AccessibilityLevel.Cleared) and (ccAccessibility == AccessibilityLevel.Normal or ccAccessibility == AccessibilityLevel.Cleared) ) then
                logic = 0
                
            -- Sequence Breaking
            elseif ( hfpAccessibility > AccessibilityLevel.None and ccAccessibility > AccessibilityLevel.None ) then
                logic = logictype.CurrentStage + 1 -- was already converted once by the json
            end
        end
    end
    
    return convertLogic(logic, skip)
end

function access_HFP_lavaSideTop(skip)
    local logic = 99
    --[[        hfp_top
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.small_elevation(state)\
            or self.flight_pad(state)\
            or (state.can_reach_region(regionName.CHUFFY, self.player) and state.has(itemName.TRAINSWHP1, self.player))\
            or self.has_explosives(state)\
            or self.warp_to_hfp_top(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.small_elevation(state)\
            or self.flight_pad(state)\
            or state.can_reach_region(regionName.CHUFFY, self.player) and state.has(itemName.TRAINSWHP1, self.player)\
            or self.has_explosives(state)\
            or state.has(itemName.MUMBOHP, self.player)\
            or self.dragon_kazooie(state)\
            or self.warp_to_hfp_top(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.small_elevation(state)\
            or self.flight_pad(state)\
            or self.split_up(state)\
            or state.can_reach_region(regionName.CHUFFY, self.player) and state.has(itemName.TRAINSWHP1, self.player)\
            or self.has_explosives(state)\
            or state.has(itemName.MUMBOHP, self.player)\
            or self.dragon_kazooie(state)\
            or self.warp_to_hfp_top(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.small_elevation(state)\
            or self.flight_pad(state)\
            or self.split_up(state)\
            or state.can_reach_region(regionName.CHUFFY, self.player) and state.has(itemName.TRAINSWHP1, self.player)\
            or self.has_explosives(state)\
            or state.has(itemName.MUMBOHP, self.player)\
            or self.dragon_kazooie(state)\
            or self.warp_to_hfp_top(state)
            
    state.has(itemName.WARPHP1, self.player) and (
            state.has(itemName.WARPHP2, self.player)\
            or state.has(itemName.WARPHP3, self.player)\
            or state.has(itemName.WARPHP4, self.player)\
            or state.has(itemName.WARPHP5, self.player)\
        )
    --]]
    
    local chuffyAccessibility = Tracker:FindObjectForCode("@Region: Inside Chuffy").AccessibilityLevel
    local explosives = can_shootExplosiveEggs(true)
    local dragonKazooie = can_getDragonKazooie(true)
    
    -- Normal Logic
    if ( can_reachSmallElevation() or has("fpad") or (chuffyAccessibility == AccessibilityLevel.Normal or chuffyAccessibility == AccessibilityLevel.Cleared) and has("trainswhp1") or explosives <= logictype.CurrentStage or has("warphp1") and (has("warphp2") or has("warphp3") or has("warphp4") or has("warphp5")) ) then
        logic = 0
    elseif ( has("mumbohp") or dragonKazooie <= logictype.CurrentStage ) then
        logic = 1
    elseif ( logictype.CurrentStage == 0 and chuffyAccessibility > AccessibilityLevel.None and has("trainswhp1") or explosives < 2 ) then
        logic = 1 -- Sequence Breaking
    elseif ( has("splitup") ) then
        logic = 2
    
    -- Sequence Breaking
    else
        local chuffy = 99
        if ( chuffyAccessibility > AccessibilityLevel.None ) then
            chuffy = logictype.CurrentStage + 1
        end
        
        logic = math.max(1, math.min(chuffy, explosives, dragonKazooie))
    end
    
    return convertLogic(logic, skip)
end

function access_HFP_humba(skip)
    local logic = 99
    --[[
    self.hfp_top(state) and state.has(itemName.HUMBAHP, self.player)
    --]]
    
    local top = access_HFP_lavaSideTop(true)
    
    -- Normal Logic
    if ( has("humbahp") and top <= logictype.CurrentStage ) then
        logic = 0
    
    -- Sequence Breaking
    elseif ( has("humbahp") ) then
        logic = top
    end
    
    return convertLogic(logic, skip)
end

function access_HFP_canBreakIceCubesAsSoloKazooie(skip)
    local logic = 99
    --[[
    self.split_up(state) and (self.has_explosives(state) or self.fire_eggs(state) or self.blue_eggs(state) or self.wing_whack(state))
    --]]
    
    local explosives = can_shootExplosiveEggs(true)
    
    -- Normal Logic
    if ( has("splitup") and (explosives <= logictype.CurrentStage or can_shootEggs("feggs") or can_shootEggs("begg") or has_wingWhack()) ) then
        logic = 0
    
    -- Sequence Breaking
    elseif ( has("splitup") ) then
        logic = explosives
    end
    
    return convertLogic(logic, skip)
end

function access_HFP_canBreakIceCubesAsPair(skip)
    local logic = 99
    --[[
    self.blue_eggs(state) or self.fire_eggs(state) or self.has_explosives(state) or self.beak_barge(state) or self.roll(state)\
            or self.air_rat_a_tat_rap(state) or self.ground_rat_a_tat_rap(state) or self.beak_buster(state) or self.breegull_bash(state) or self.wonderwing(state)          -- checking for breegull bash is redundant
    --]]
    
    local explosives = can_shootExplosiveEggs(true)
    
    -- Normal Logic
    if ( can_shootEggs("begg") or can_shootEggs("feggs") or explosives <= logictype.CurrentStage or has("bbarge") or has("roll") or has("arat") or has("grat") or has("bbust") or has("wwing") ) then
        logic = 0
    
    -- Sequence Breaking
    else
        logic = explosives
    end
    
    return convertLogic(logic, skip)
end

function access_HFP_icySideTrainStation(skip)
    local logic = 99
    --[[        access_ice_train_station
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.can_beat_king_coal(state) and self.grenade_eggs(state) and \
                state.has(itemName.TRAINSWHP1, self.player) and state.has(itemName.TRAINSWHP2, self.player) and \
                self.egg_aim(state) and state.can_reach_region(regionName.WW, self.player)\
                and self.beak_buster(state)\
                and (self.claw_clamber_boots(state) or self.flight_pad(state))
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.can_beat_king_coal(state) and self.grenade_eggs(state) and \
                state.has(itemName.TRAINSWHP1, self.player) and state.has(itemName.TRAINSWHP2, self.player) and \
                state.can_reach_region(regionName.WW, self.player) and self.beak_buster(state)\
                and (self.claw_clamber_boots(state) or self.flight_pad(state))
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.can_beat_king_coal(state) and self.grenade_eggs(state) and \
                state.has(itemName.TRAINSWHP1, self.player) and state.has(itemName.TRAINSWHP2, self.player) and \
                state.can_reach_region(regionName.WW, self.player) and self.beak_buster(state)\
                and (self.claw_clamber_boots(state) or self.flight_pad(state))
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.can_beat_king_coal(state) and self.grenade_eggs(state) and \
                state.has(itemName.TRAINSWHP1, self.player) and state.has(itemName.TRAINSWHP2, self.player) and \
                state.can_reach_region(regionName.WW, self.player) and self.beak_buster(state)\
                and (self.claw_clamber_boots(state) or self.flight_pad(state))
     --]]
    
    local wwAccessibility = Tracker:FindObjectForCode("@Region: Witchyworld - Main Area").AccessibilityLevel
    local canBeatKingCoal = chuffy_canBeatKingCoal(true)
    
    -- Normal Logic
    if ( canBeatKingCoal <= logictype.CurrentStage and can_shootEggs("geggs") and has("trainswhp1") and has("trainswhp2") and has("eggaim") and (wwAccessibility == AccessibilityLevel.Normal or wwAccessibility == AccessibilityLevel.Cleared) and has("bbust") and (has("clawbts") or has("fpad")) ) then
        logic = 0
    elseif ( canBeatKingCoal <= logictype.CurrentStage and can_shootEggs("geggs") and has("trainswhp1") and has("trainswhp2") and (wwAccessibility == AccessibilityLevel.Normal or wwAccessibility == AccessibilityLevel.Cleared) and has("bbust") and (has("clawbts") or has("fpad")) ) then
        logic = 1
    
    -- Sequence Breaking
    elseif ( can_shootEggs("geggs") and has("trainswhp1") and has("trainswhp2") and (wwAccessibility == AccessibilityLevel.Normal or wwAccessibility == AccessibilityLevel.Cleared) and has("bbust") and (has("clawbts") or has("fpad")) ) then
        logic = math.max(1, canBeatKingCoal)
    elseif ( can_shootEggs("geggs") and has("trainswhp1") and has("trainswhp2") and wwAccessibility > AccessibilityLevel.None and has("bbust") and (has("clawbts") or has("fpad")) ) then
        logic = math.max(logictype.CurrentStage + 1, canBeatKingCoal)
    end
    
    return convertLogic(logic, skip)
end

function access_HFP_warpToIcicleGrotto(skip)
    local logic = 99
    --[[        warp_to_icicle_grotto
     return state.has(itemName.WARPHP5, self.player) and (
            state.has(itemName.WARPHP1, self.player)\
            or state.has(itemName.WARPHP2, self.player) and self.hfp_top(state)\
            or state.has(itemName.WARPHP3, self.player) and self.hfp_top(state)\
            or state.has(itemName.WARPHP4, self.player) and self.hfp_top(state)\
        )
     --]]
    
    if ( has("warphp5") and has("warphp1") ) then
        logic = 0
    elseif ( has("warphp5") and (has("warphp2") or has("warphp3") or has("warphp4")) ) then
        logic = access_HFP_lavaSideTop(true)
    end
    
    return convertLogic(logic, skip)
end

----- Silos

function silo_HFP_shackPack(skip)
    local logic = 99
    --[[
    self.split_up(state) and self.check_notes(state, locationName.SHPACK)
    --]]
    
    if ( shpack_count() and has("splitup") ) then
        logic = 0
    end
    
    return convertLogic(logic, skip)
end

function silo_HFP_glide(skip)
    local logic = 99
    --[[
    self.can_access_glide_silo(state) and self.check_notes(state, locationName.GLIDE)
    
    if self.world.options.logic_type == LogicType.option_intended:
        # Through icicle grotto
        logic = self.hfp_top(state) and self.split_up(state) and self.grenade_eggs(state) and self.egg_aim(state) and self.spring_pad(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.split_up(state) and (self.tall_jump(state) or self.wing_whack(state) or self.glide(state) or self.leg_spring(state))
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.split_up(state) and (self.tall_jump(state) or self.wing_whack(state) or self.glide(state) or self.leg_spring(state))
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.split_up(state) and (self.tall_jump(state) or self.wing_whack(state) or self.glide(state) or self.leg_spring(state))
    --]]
    
    local top = access_HFP_lavaSideTop(true)
    
    if ( glide_count() and has("splitup") ) then
        -- Normal Logic
        if ( top <= logictype.CurrentStage and has("geggs") and has("eggaim") and has("tjump") ) then
            logic = 0
        elseif ( has("tjump") or has_wingWhack() or has_glide() or has_legSpring() ) then
            logic = 1
        
        -- Sequence Breaking
        elseif ( has("geggs") and has("eggaim") and has("tjump") ) then
            logic = top
        end
    end
    
    return convertLogic(logic, skip)
end

----- Warp Pads

function warp_HFP_icicleGrotto(skip)
    local logic = 99
    --[[        warp_pad_icicle_grotto
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.hfp_top(state) and self.spring_pad(state) and self.talon_trot(state)\
                or self.hfp_top(state) and self.spring_pad(state) and self.split_up(state)\
                or self.warp_to_icicle_grotto(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.split_up(state) and (self.tall_jump(state) or self.wing_whack(state) or self.glide(state) or self.leg_spring(state))\
                or self.hfp_top(state) and self.spring_pad(state) and self.talon_trot(state)\
                or self.warp_to_icicle_grotto(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.split_up(state) and (self.tall_jump(state) or self.wing_whack(state) or self.glide(state) or self.leg_spring(state))\
                or self.hfp_top(state) and (self.talon_trot(state) or self.claw_clamber_boots(state))\
                or (self.extremelyLongJump(state) and self.clockwork_shot(state))\
                or self.warp_to_icicle_grotto(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.split_up(state) and (self.tall_jump(state) or self.wing_whack(state) or self.glide(state) or self.leg_spring(state))\
                or self.hfp_top(state) and (self.talon_trot(state) or self.claw_clamber_boots(state))\
                or (self.extremelyLongJump(state) and self.clockwork_shot(state))\
                or self.warp_to_icicle_grotto(state)
    --]]
    
    local top = access_HFP_lavaSideTop(true)
    local extremelyLongJump = can_extremelyLongJump(true)
    local warpToGrotto = access_HFP_warpToIcicleGrotto(true)
    
    -- Normal Logic
    if ( top <= logictype.CurrentStage and has("tjump") and (has("ttrot") or has("splitup")) or warpToGrotto <= logictype.CurrentStage ) then
        logic = 0
    elseif ( has("splitup") and has("tjump") or has_wingWhack() or has_glide() or has_legSpring() ) then
        logic = 1
    elseif ( top < 2 and has("tjump") and (has("ttrot") or has("splitup")) or warpToGrotto < 2 ) then
        logic = 1 -- Sequence Breaking
    elseif ( extremelyLongJump <= logictype.CurrentStage and can_clockworkShot() or top <= logictype.CurrentStage and (has("ttrot") or has("clawbts")) ) then
        logic = 2
    
    -- Sequence Breaking
    else
        local fromTop = 99
        if ( has("ttrot") or has("clawbts") ) then
            fromTop = math.max(2, top)
        end
        
        local clockwork = 99
        if ( can_clockworkShot() ) then
            clockwork = math.max(2, extremelyLongJump)
        end
        
        logic = math.min(fromTop, clockwork)
    end
    
    return convertLogic(logic, skip)
end

----- Jiggies

function jiggy_HFP_dragonBrothers(skip)
    local logic = 99
    --[[        jiggy_dragons_bros
     if self.world.options.logic_type == LogicType.option_intended:
        logic = self.fire_eggs(state) and self.ice_eggs(state) and \
                self.third_person_egg_shooting(state) and state.can_reach_region(regionName.HPIBOSS, self.player)\
                and (self.tall_jump(state) or self.talon_trot(state))\
                and self.climb(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.fire_eggs(state) and self.ice_eggs(state) and \
                state.can_reach_region(regionName.HPIBOSS, self.player) and self.third_person_egg_shooting(state)\
                and (self.tall_jump(state) or self.talon_trot(state))\
                and (self.climb(state)\
                    or self.flap_flip(state)\
                    or self.tall_jump(state) and self.grip_grab(state)\
                    or self.talon_trot(state) and self.grip_grab(state))
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        # In case people go for the damage boost for Chilly Willy then die before getting the jiggy, we also require Pack Whack to prevent softlocks.
        if self.world.options.randomize_boss_loading_zone:
            logic = self.fire_eggs(state) and self.ice_eggs(state) and state.can_reach_region(regionName.HPIBOSS, self.player) and \
                    self.third_person_egg_shooting(state)\
                    and (self.tall_jump(state) or self.talon_trot(state))\
                    and (self.climb(state)\
                        or self.flap_flip(state)\
                        or self.tall_jump(state) and self.grip_grab(state)\
                        or self.talon_trot(state) and self.grip_grab(state)
                    )
        else:
            logic = self.fire_eggs(state) and self.ice_eggs(state) and self.flight_pad(state) and self.third_person_egg_shooting(state)\            -- redundant because it's a requirement to get to the lava side boss room, which is where the jiggy is now
                    and self.pack_whack(state)\
                    and (self.claw_clamber_boots(state)\
                        or ((self.tall_jump(state) and self.roll(state) or self.talon_trot(state))\
                            and (self.flutter(state) or self.air_rat_a_tat_rap(state))\
                            and self.grip_grab(state)
                        )
                    )\
                    and (self.tall_jump(state) or self.talon_trot(state))\
                    and (self.climb(state)\
                        or self.flap_flip(state)\
                        or self.tall_jump(state) and self.grip_grab(state)\
                        or self.talon_trot(state) and self.grip_grab(state)
                    )
    elif self.world.options.logic_type == LogicType.option_glitches:
        # In case people go for the damage boost for Chilly Willy then die before getting the jiggy, we also require Pack Whack to prevent softlocks.
        if self.world.options.randomize_boss_loading_zone:
            logic = self.fire_eggs(state) and self.ice_eggs(state) and state.can_reach_region(regionName.HPIBOSS, self.player) and \
                    self.third_person_egg_shooting(state)\
                    and (self.tall_jump(state) or self.talon_trot(state))\
                    and (self.climb(state)\
                        or self.flap_flip(state)\
                        or self.tall_jump(state) and self.grip_grab(state)\
                        or self.talon_trot(state) and self.grip_grab(state)
                    )
        else:
            logic = self.fire_eggs(state) and self.ice_eggs(state) and self.flight_pad(state) and self.third_person_egg_shooting(state)\
                    and self.pack_whack(state)\
                    and (self.claw_clamber_boots(state)\
                        or ((self.tall_jump(state) and self.roll(state) or self.talon_trot(state))\
                            and (self.flutter(state) or self.air_rat_a_tat_rap(state))\
                            and self.grip_grab(state)
                        )
                    )\
                    and (self.tall_jump(state) or self.talon_trot(state))\
                    and (self.climb(state)\
                        or self.flap_flip(state)\
                        or self.tall_jump(state) and self.grip_grab(state)\
                        or self.talon_trot(state) and self.grip_grab(state)
                    )
     --]]
    
    local hfpiAccessibility = Tracker:FindObjectForCode("@Region: Hailfire Peaks - Icy Side").AccessibilityLevel
    
    if ( has("feggs") and has("ieggs") and has("eggshoot") and has("climb") and (has("tjump") or has("ttrot")) and (hfpiAccessibility == AccessibilityLevel.Normal or hfpiAccessibility == AccessibilityLevel.Cleared) ) then
        logic = 0
    elseif ( has("feggs") and has("ieggs") and has("eggshoot") and (has("fflip") or has("ggrab")) and (has("tjump") or has("ttrot")) and (hfpiAccessibility == AccessibilityLevel.Normal or hfpiAccessibility == AccessibilityLevel.Cleared) ) then
        logic = 1
    elseif ( has("randomizebossentrances_off") and has("feggs") and has("ieggs") and has("fpad") and has("eggshoot") and has_packWhack() and (has("tjump") or has("ttrot")) and (has("climb") or has("fflip") or has("ggrab")) and (has("clawbts") or (has("tjump") and has("roll") or has("ttrot")) and (has("flutter") or has("arat")) and has("ggrab")) ) then
        logic = 2
    end
    
    return convertLogic(logic, skip)
end

function jiggy_HFP_volcano(skip)
    local logic = 99
    --[[        jiggy_volcano
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.long_jump(state) and self.hfp_top(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.long_jump(state) and self.hfp_top(state) or self.split_up(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.long_jump(state) and self.hfp_top(state) or self.split_up(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.long_jump(state) and self.hfp_top(state) or self.split_up(state)
    --]]
    
    local top = access_HFP_lavaSideTop(true)
    
    -- Normal Logic
    if ( can_longJump() and top <= logictype.CurrentStage ) then
        logic = 0
    elseif ( has("splitup") ) then
        logic = 1
    
    -- Sequence Breaking
    elseif ( can_longJump() ) then
        logic = top
    end
    
    return convertLogic(logic, skip)
end

function jiggy_HFP_sabreman(skip)
    local logic = 99
    --[[        jiggy_sabreman
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.check_mumbo_magic(state, itemName.MUMBOHP) and self.fire_eggs(state) and \
                self.taxi_pack(state) and self.tall_jump(state) and self.hfp_top(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.check_mumbo_magic(state, itemName.MUMBOHP) and self.has_fire(state) and \
                self.taxi_pack(state) and self.tall_jump(state) and self.hfp_top(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.check_mumbo_magic(state, itemName.MUMBOHP) and self.has_fire(state) and \
                self.taxi_pack(state) and self.tall_jump(state) and self.hfp_top(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.check_mumbo_magic(state, itemName.MUMBOHP) and self.has_fire(state) and \
                self.taxi_pack(state) and self.tall_jump(state) and self.hfp_top(state)
    --]]
    
    local top = access_HFP_lavaSideTop(true)
    local hasFire = can_useFire(true)
    
    -- Normal Logic
    if ( has("mumbohp") and can_shootEggs("feggs") and has_taxiPack() and has("tjump") and top <= logictype.CurrentStage ) then
        logic = 0
    elseif ( has("mumbohp") and hasFire <= logictype.CurrentStage and has_taxiPack() and has("tjump") and top <= logictype.CurrentStage ) then
        logic = 1
    
    -- Sequence Breaking
    elseif ( has("mumbohp") and has_taxiPack() and has("tjump") ) then
        logic = math.max(1, hasFire, top)
    end
    
    return convertLogic(logic, skip)
end

function jiggy_HFP_boggy(skip)
    local logic = 99
    --[[        jiggy_boggy
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.hfp_top(state) and self.shack_pack(state) and self.small_elevation(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.hfp_top(state) and self.shack_pack(state) and self.small_elevation(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.hfp_top(state) and self.shack_pack(state) and self.small_elevation(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.hfp_top(state) and \
                (self.shack_pack(state)\
                 or (self.clockwork_eggs(state) and self.third_person_egg_shooting(state) and (self.talon_trot(state) or self.flap_flip(state) or self.dive(state) and self.tall_jump(state)))\
                 or self.leg_spring(state))
    --]]
    
    local top = access_HFP_lavaSideTop(true)
    
    if ( top <= logictype.CurrentStage and has_shackPack() and can_reachSmallElevation() ) then
        logic = 0 -- Normal Logic
    elseif ( top < 3 and has_shackPack() and can_reachSmallElevation() ) then
        logic = top -- Sequence Breaking
    elseif ( top <= logictype.CurrentStage and (has_shackPack() or has_legSpring() or can_shootEggs("ceggs") and has("eggshoot") and (has("ttrot") or has("fflip") or has("dive") and has("tjump"))) ) then
        logic = 3 -- Normal Logic
    
    -- Sequence Breaking
    elseif ( has_shackPack() or has_legSpring() or can_shootEggs("ceggs") and has("eggshoot") and (has("ttrot") or has("fflip") or has("dive") and has("tjump")) ) then
        logic = math.max(3, top)
    end
    
    return convertLogic(logic, skip)
end

function jiggy_HFP_iceSideTrainStation(skip)
    local logic = 99
    --[[        jiggy_ice_station
     if self.world.options.logic_type == LogicType.option_intended:
        logic = self.access_ice_train_station(state) and self.climb(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.access_ice_train_station(state) and self.climb(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.access_ice_train_station(state) and self.climb(state)\
                    and (self.climb(state) or self.clockwork_shot(state))           -- Checking for climb here is redundant. is that an error? -- FIXIT
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.access_ice_train_station(state) and self.climb(state)\
                    and (self.climb(state) or self.clockwork_shot(state))\
                or (self.clockwork_shot(state) and self.small_elevation(state))
     --]]
    
    local canReachIcyTrainStation = access_HFP_icySideTrainStation(true)
    
    if ( canReachIcyTrainStation <= logictype.CurrentStage and has("climb") ) then
        logic = 0 -- Normal Logic
    elseif ( canReachIcyTrainStation < 3 and has("climb") ) then
        logic = canReachIcyTrainStation -- Sequence Breaking
    elseif ( can_clockworkShot() and can_reachSmallElevation() ) then
        logic = 3 -- Normal Logic
    
    -- Sequence Breaking
    elseif ( has("climb") ) then
        logic = canReachIcyTrainStation
    end
    
    return convertLogic(logic, skip)
end

function jiggy_HFP_oilDrill(skip)
    local logic = 99
    --[[        jiggy_oil_drill
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.humbaHFP(state) and \
                self.shack_pack(state) and self.grip_grab(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.humbaHFP(state) and self.shack_pack(state) and \
                (self.pack_whack(state) and self.tall_jump(state) or self.grip_grab(state))
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.humbaHFP(state) and self.shack_pack(state) and \
                (self.pack_whack(state) and self.tall_jump(state) or self.grip_grab(state))
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.humbaHFP(state) and self.shack_pack(state) and \
                (self.pack_whack(state) or self.grip_grab(state))
    --]]
    
    local humba = access_HFP_humba(true)
    
    -- Normal Logic
    if ( humba <= logictype.CurrentStage and has_shackPack() and has("ggrab") ) then
        logic = 0
    elseif ( humba <= logictype.CurrentStage and has_shackPack() and has_packWhack() and has("tjump") ) then
        logic = 1
    elseif ( humba < 3 and has_shackPack() and (has("ggrab") or has_packWhack() and has("tjump")) ) then
        logic = math.max(1, humba) -- Sequence Breaking
    elseif ( humba <= logictype.CurrentStage and has_shackPack() and has_packWhack() ) then
        logic = 3
    
    -- Sequence Breaking
    elseif ( has_shackPack() and (has_packWhack() or has("ggrab")) ) then
        logic = math.max(3, humba)
    end
    
    return convertLogic(logic, skip)
end

function jiggy_HFP_fromStompingPlains(skip)
    local logic = 99
    --[[        jiggy_hfp_stomping
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.snooze_pack(state) and self.tall_jump(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.snooze_pack(state) and self.tall_jump(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.tall_jump(state) and self.split_up(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.tall_jump(state) and self.split_up(state)\
                or (state.can_reach_region(regionName.HP, self.player) and self.clockwork_shot(state)\
                    and (self.talon_trot(state)\
                        or self.split_up(state)\
                        or self.leg_spring(state)\          -- redundant since it requires split up
                        or self.flap_flip(state)))
    --]]
    
    local hfpAccessibility = Tracker:FindObjectForCode("@Region: Hailfire Peaks - Lava Side").AccessibilityLevel
    
    -- Normal Logic
    if ( has_snoozePack() and has("tjump") ) then
        logic = 0
    elseif ( has("splitup") and has("tjump") ) then
        logic = 2
    elseif ( (hfpAccessibility == AccessibilityLevel.Normal or hfpAccessibility == AccessibilityLevel.Cleared) and can_clockworkShot() and (has("ttrot") or has("splitup") or has("fflip")) ) then
        logic = 3
    elseif ( has("splitup") and has_packWhack() ) then
        logic = 7 -- pack whack replaces tall jump
    
    -- Sequence Breaking
    elseif ( hfpAccessibility > AccessibilityLevel.None and can_clockworkShot() and (has("ttrot") or has("splitup") or has("fflip")) ) then
        logic = math.max(3, logictype.CurrentStage + 1)
    end
    
    return convertLogic(logic, skip)
end

function jiggy_HFP_kickball(skip)
    local logic = 99
    --[[        jiggy_hfp_kickball
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.humbaMT(state) and self.has_explosives(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.humbaMT(state) and \
                (self.has_explosives(state) or \
                self.check_mumbo_magic(state, itemName.MUMBOHP))
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.humbaMT(state) and \
                (self.has_explosives(state) or self.check_mumbo_magic(state, itemName.MUMBOHP))
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.humbaMT(state) and \
                (self.has_explosives(state) or self.check_mumbo_magic(state, itemName.MUMBOHP))
    --]]
    
    local humbaMT = access_MT_humba(true)
    local explosives = can_shootExplosiveEggs(true)
    
    -- Normal Logic
    if ( humbaMT <= logictype.CurrentStage and explosives <= logictype.CurrentStage ) then
        logic = 0
    elseif ( humbaMT <= logictype.CurrentStage and has("mumbohp") ) then
        logic = 1
        
    -- Sequence Breaking
    else
        local mumbo = 99
        if ( has("mumbohp") ) then
            mumbo = 1
        end
        
        logic = math.max(humba, math.min(mumbo, explosives))
    end
    
    return convertLogic(logic, skip)
end

function jiggy_HFP_aliens(skip)
    local logic = 99
    --[[        jiggy_aliens
     if self.world.options.logic_type == LogicType.option_intended:
          logic = self.alphette(state) and self.betette(state) and self.gamette(state)
     elif self.world.options.logic_type == LogicType.option_easy_tricks:
         logic = self.alphette(state) and self.betette(state) and self.gamette(state)
     elif self.world.options.logic_type == LogicType.option_hard_tricks:
         logic = self.alphette(state) and self.betette(state) and self.gamette(state)
     elif self.world.options.logic_type == LogicType.option_glitches:
         logic = self.alphette(state) and self.betette(state) and self.gamette(state)
     --]]
    
    local alphette = other_HFP_alphette(true)
    local betette = other_HFP_betette(true)
    local gamette = other_HFP_gamette(true)
    
    -- Normal Logic
    if ( alphette <= logictype.CurrentStage and betette <= logictype.CurrentStage and gamette <= logictype.CurrentStage ) then
        logic = 0
    
    -- Sequence Breaking
    else
        logic = math.max(alphette, betette, gamette)
    end
    
    return convertLogic(logic, skip)
end

function jiggy_HFP_colosseumSplitUp(skip)
    local logic = 99
    --[[        jiggy_colosseum_split
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.split_up(state) and self.grip_grab(state) and self.climb(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.split_up(state) and self.grip_grab(state)\
            and (self.climb(state) or (self.pack_whack(state) and self.tall_jump(state)))
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.split_up(state) and self.grip_grab(state)\
            and (self.climb(state) or (self.pack_whack(state) and self.tall_jump(state)))
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = (self.split_up(state) and self.grip_grab(state)\
            and (self.climb(state) or (self.pack_whack(state) and self.tall_jump(state))))\
                or (self.clockwork_eggs(state) and (self.split_up(state) and self.third_person_egg_shooting(state)))
    --]]
    
    if ( has("splitup") and has("ggrab") and has("climb") ) then
        logic = 0
    elseif ( has("splitup") and has("ggrab") and has_packWhack() and has("tjump") ) then
        logic = 1
    elseif ( can_shootEggs("ceggs") and has("splitup") and has("eggshoot") ) then
        logic = 3
    end
    
    return convertLogic(logic, skip)
end

----- Notes

function treble_HFP(skip)
    local logic = 99
    --[[        treble_hfp
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.hfp_top(state) and self.grenade_eggs(state) and self.egg_aim(state) and self.spring_pad(state) and (self.talon_trot(state) or self.split_up(state))
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = (self.split_up(state) and self.ice_cube_kazooie(state) and (self.tall_jump(state) or self.wing_whack(state) or self.glide(state) or self.leg_spring(state)))\           -- checking for split up is redundant when ice_cube_kazooie requires it
                or (self.hfp_top(state) and self.grenade_eggs(state) and self.egg_aim(state) and self.spring_pad(state) and (self.talon_trot(state) or self.split_up(state)))\
                or self.claw_clamber_boots(state) and self.grenade_eggs(state) and self.egg_aim(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = (self.split_up(state) and self.ice_cube_kazooie(state) and (self.tall_jump(state) or self.wing_whack(state) or self.glide(state) or self.leg_spring(state)))\
                or (self.hfp_top(state) and (self.grenade_eggs(state) or self.clockwork_shot(state))\
                    and self.egg_aim(state) and self.spring_pad(state) and (self.talon_trot(state) or self.split_up(state)))\
                or (self.extremelyLongJump(state) and self.clockwork_shot(state))\
                or self.claw_clamber_boots(state) and self.grenade_eggs(state) and self.egg_aim(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = (self.split_up(state) and self.ice_cube_kazooie(state) and (self.tall_jump(state) or self.wing_whack(state) or self.glide(state) or self.leg_spring(state)))\
                or (self.hfp_top(state) and (self.grenade_eggs(state) or self.clockwork_shot(state))\
                    and self.egg_aim(state) and self.spring_pad(state) and (self.talon_trot(state) or self.split_up(state)))\
                or (self.extremelyLongJump(state) and self.clockwork_shot(state))\
                or self.claw_clamber_boots(state) and self.grenade_eggs(state) and self.egg_aim(state)
     --]]
    
    local top = access_HFP_lavaSideTop(true)
    local soloKazooieCube = access_HFP_canBreakIceCubesAsSoloKazooie(true)
    local extremelyLongJump = can_extremelyLongJump(true)
    
    -- Normal Logic
    if ( top <= logictype.CurrentStage and can_shootEggs("geggs") and has("eggaim") and has("tjump") and (has("ttrot") or has("splitup")) ) then
        logic = 0
    elseif ( soloKazooieCube <= logictype.CurrentStage and (has("tjump") or has_wingWhack() or has_glide() or has_legSpring()) or has("clawbts") and can_shootEggs("geggs") and has("eggaim") ) then
        logic = 1
    elseif ( top < 2 and can_shootEggs("geggs") and has("eggaim") and has("tjump") and (has("ttrot") or has("splitup")) ) then
        logic = 1 -- Sequence Breaking
    elseif ( top <= logictype.CurrentStage and can_clockworkShot() and has("tjump") and (has("ttrot") or has("splitup")) or extremelyLongJump <= logictype.CurrentStage and can_clockworkShot() ) then
        logic = 2
    
    -- Sequence Breaking
    else
        local fromTop = 99
        if ( (can_shootEggs("geggs") and has("eggaim") or can_clockworkShot()) and has("tjump") and (has("ttrot") or has("splitup")) ) then
            fromTop = math.max(2, top)
        end
        
        local clockworkJump = 99
        if ( can_clockworkShot() ) then
            clockworkJump = math.max(2, extremelyLongJump)
        end
        
        local soloKazooie = 99
        if ( has("tjump") or has_wingWhack() or has_glide() or has_legSpring() ) then
            soloKazooie = math.max(1, soloKazooieCube)
        end
        
        local newTrick = 99
        if ( can_clockworkShot() and has("clawbts") ) then
            newTrick = 7 -- FIXIT you can use the claw clamber boots strategy and then just clockwork shot the treble
        end
        
        logic = math.min(fromTop, clockworkJump, soloKazooie, newTrick)
    end
    
    return convertLogic(logic, skip)
end

function notes_HFP_lavaSideLadder(skip)
    local logic = 99
    --[[        notes_ladder
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.hfp_top(state) or self.split_up(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.hfp_top(state) or self.split_up(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.hfp_top(state)                                 -- in a vacuum, this looks more restrictive at higher difficulties. split up completes hfp_top on hard tricks and higher, however, so I'll ignore this
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.hfp_top(state)
    --]]
    
    local top = access_HFP_lavaSideTop(true)
    
    -- Normal Logic
    if ( top <= logictype.CurrentStage or has("splitup") ) then
        logic = 0
    
    -- Sequence Breaking
    else
        logic = top
    end
    
    return convertLogic(logic, skip)
end

function notes_HFP_icySideOilDrill(skip)
    local logic = 99
    --[[        notes_oil_drill
    if self.world.options.logic_type == LogicType.option_intended:
        logic =  self.hfp_top(state) and (self.flap_flip(state) or self.talon_trot(state)) and self.ice_cube_BK(state)\
                or self.hfp_top(state) and self.split_up(state) and self.grip_grab(state) and self.pack_whack(state)\           -- checking for split up here is redundant
                or self.hfp_top(state) and self.split_up(state) and self.ice_cube_kazooie(state)                            -- checking for split up here is redundant
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.hfp_top(state) and (self.flap_flip(state) or self.talon_trot(state) or self.flight_pad(state)) and self.ice_cube_BK(state)\
                or self.hfp_top(state) and self.split_up(state) and (self.grip_grab(state) or self.tall_jump(state)) and self.pack_whack(state)\
                or self.hfp_top(state) and self.split_up(state) and self.ice_cube_kazooie(state)\
                or self.humbaHFP(state)\
                or self.hfp_top(state) and self.claw_clamber_boots(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.hfp_top(state) and (self.flap_flip(state) or self.talon_trot(state) or self.flight_pad(state)) and self.ice_cube_BK(state)\
                or self.hfp_top(state) and self.split_up(state) and (self.grip_grab(state) or self.tall_jump(state)) and self.pack_whack(state)\
                or self.hfp_top(state) and self.split_up(state) and self.ice_cube_kazooie(state)\
                or self.humbaHFP(state)\
                or self.hfp_top(state) and self.clockwork_shot(state)\
                or self.hfp_top(state) and self.claw_clamber_boots(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.hfp_top(state) and (self.flap_flip(state) or self.talon_trot(state) or self.flight_pad(state)) and self.ice_cube_BK(state)\
                or self.hfp_top(state) and self.split_up(state) and (self.grip_grab(state) or self.tall_jump(state)) and self.pack_whack(state)\
                or self.hfp_top(state) and self.split_up(state) and self.ice_cube_kazooie(state)\
                or self.humbaHFP(state)\
                or self.hfp_top(state) and self.clockwork_shot(state)\
                or self.hfp_top(state) and self.claw_clamber_boots(state)
    --]]
    
    local top = access_HFP_lavaSideTop(true)
    local pairCube = access_HFP_canBreakIceCubesAsPair(true)
    local soloKazooieCube = access_HFP_canBreakIceCubesAsSoloKazooie(true)
    local humba = access_HFP_humba(true)
    
    -- Normal Logic
    if ( top <= logictype.CurrentStage and ((has("fflip") or has("ttrot")) and pairCube <= logictype.CurrentStage or has("ggrab") and has_packWhack() or soloKazooieCube <= logictype.CurrentStage) ) then
        logic = 0
    elseif ( top <= logictype.CurrentStage and (has("fpad") and pairCube <= logictype.CurrentStage or has("tjump") and has_packWhack() or has("clawbts")) or humba <= logictype.CurrentStage ) then
        logic = 1
    elseif ( top < 2 and ((has("fflip") or has("ttrot") or has("fpad")) and pairCube < 2 or soloKazooieCube < 2) ) then
        logic = 1 -- Sequence Breaking
    elseif ( top <= logictype.CurrentStage and can_clockworkShot() ) then
        logic = 2
    
    -- Sequence Breaking
    else
        local topPair = 99
        if ( has("fflip") or has("ttrot") or has("fpad") ) then
            topPair = math.max(1, top, pairCube)
        end
        
        local justBanjo = 99
        if ( (has("ggrab") or has("tjump")) and has_packWhack() ) then
            justBanjo = math.max(1, top)
        end
        
        local justTop = 99
        if ( has("clawbts") or can_clockworkShot() ) then
            justTop = 2
        end
        
        logic = math.min(topPair, justBanjo, math.max(top, soloKazooieCube), math.max(1, humba), justTop)
    end
    
    return convertLogic(logic, skip)
end

function notes_HFP_icySide(skip)
    local logic = 99
    --[[        notes_upper_icy_side
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.ice_cube_BK(state) and self.hfp_top(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.hfp_top(state)\
                and (self.ice_cube_BK(state)\
                     or self.split_up(state) and self.ice_cube_kazooie(state)\
                     or state.has(itemName.MUMBOHP, self.player)\
                     or self.pack_whack(state)\
                     or self.humbaHFP(state)
                     )
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.hfp_top(state)\
                and (self.ice_cube_BK(state)\
                     or self.split_up(state) and self.ice_cube_kazooie(state)\
                     or state.has(itemName.MUMBOHP, self.player)\
                     or self.pack_whack(state)\
                     or self.humbaHFP(state)
                     )
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.hfp_top(state)\
                and (self.ice_cube_BK(state)\
                     or self.split_up(state) and self.ice_cube_kazooie(state)\
                     or state.has(itemName.MUMBOHP, self.player)\
                     or self.pack_whack(state)\
                     or self.humbaHFP(state)
                     )
    --]]
    
    local pairCube = access_HFP_canBreakIceCubesAsPair(true)
    local top = access_HFP_lavaSideTop(true)
    local soloKazooieCube = access_HFP_canBreakIceCubesAsSoloKazooie(true)
    local humba = access_HFP_humba(true)
    
    -- Normal Logic
    if ( pairCube <= logictype.CurrentStage and top <= logictype.CurrentStage ) then
        logic = 0
    elseif ( top <= logictype.CurrentStage and (soloKazooieCube <= logictype.CurrentStage or has("mumbohp") or has_packWhack() or humba <= logictype.CurrentStage) ) then
        logic = 1
    
    -- Sequence Breaking
    else
        local banjoOrMumbo = 99
        if ( has("mumbohp") or has_packWhack() ) then
            banjoOrMumbo = 1
        end
        
        logic = math.max(1, top, math.min(banjoOrMumbo, soloKazooieCube, humba))
    end
    
    return convertLogic(logic, skip)
end

function notes_HFP_icySideBoggy(skip)
    local logic = 99
    --[[        notes_boggy
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.ice_cube_BK(state) and self.hfp_top(state) and self.small_elevation(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.hfp_top(state)\
                and (self.ice_cube_BK(state) and (self.small_elevation(state) or self.beak_buster(state))\
                     or self.split_up(state) and (self.leg_spring(state) or self.tall_jump(state)) and self.ice_cube_kazooie(state)\
                     or self.tall_jump(state) and state.has(itemName.MUMBOHP, self.player)\
                     or self.pack_whack(state)\
                     or self.humbaHFP(state)
                     )
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.hfp_top(state)\
                and (self.ice_cube_BK(state) and (self.small_elevation(state) or self.beak_buster(state))\
                     or self.split_up(state) and (self.leg_spring(state) or self.tall_jump(state)) and self.ice_cube_kazooie(state)\
                     or self.tall_jump(state) and state.has(itemName.MUMBOHP, self.player)\
                     or self.pack_whack(state)\
                     or self.clockwork_shot(state)\
                     or self.humbaHFP(state)
                     )
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.hfp_top(state)\
                and (self.ice_cube_BK(state) and (self.small_elevation(state) or self.beak_buster(state))\
                     or self.split_up(state) and (self.leg_spring(state) or self.tall_jump(state)) and self.ice_cube_kazooie(state)\
                     or self.tall_jump(state) and state.has(itemName.MUMBOHP, self.player)\
                     or self.pack_whack(state)\
                     or self.clockwork_shot(state)\
                     or self.humbaHFP(state)
                     )
    --]]
    
    local pairCube = access_HFP_canBreakIceCubesAsPair(true)
    local top = access_HFP_lavaSideTop(true)
    local soloKazooieCube = access_HFP_canBreakIceCubesAsSoloKazooie(true)
    local humba = access_HFP_humba(true)
    
    -- Normal Logic
    if ( pairCube <= logictype.CurrentStage and top <= logictype.CurrentStage and can_reachSmallElevation() ) then
        logic = 0
    elseif ( top <= logictype.CurrentStage and (pairCube <= logictype.CurrentStage and has("bbust") or soloKazooieCube <= logictype.CurrentStage and (has_legSpring() or has("tjump")) or has("mumbohp") and has("tjump") or has_packWhack() or humba <= logictype.CurrentStage) ) then
        logic = 1
    elseif ( has("wwing") ) then
        logic = 7
    
    -- Sequence Breaking
    else
        local pair = 99
        if ( can_reachSmallElevation() or has("bbust") ) then
            pair = 1
        end
        
        local kazooie = 99
        if ( has_legSpring() or has("tjump") ) then
            kazooie = soloKazooieCube
        end
    
        local banjoOrMumbo = 99
        if ( has("mumbohp") and has("tjump") or has_packWhack() ) then
            banjoOrMumbo = 1
        end
        
        logic = math.max(1, top, math.min(pair, kazooie, banjoOrMumbo, humba))
    end
    
    return convertLogic(logic, skip)
end

function notes_HFP_icicleGrottoTop(skip)
    local logic = 99
    --[[        nest_icicle_grotto_top
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.hfp_top(state) and self.grenade_eggs(state) and self.egg_aim(state) and self.spring_pad(state) and (self.talon_trot(state) or self.split_up(state))
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = (self.split_up(state) and self.ice_cube_kazooie(state) and (self.tall_jump(state) or self.wing_whack(state) or self.glide(state) or self.leg_spring(state)))\           -- checking for split up is redundant when ice_cube_kazooie requires it
                or (self.hfp_top(state) and self.grenade_eggs(state) and self.egg_aim(state) and self.spring_pad(state) and (self.talon_trot(state) or self.split_up(state)))\
                or self.claw_clamber_boots(state) and self.grenade_eggs(state) and self.egg_aim(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = (self.split_up(state) and self.ice_cube_kazooie(state) and (self.tall_jump(state) or self.wing_whack(state) or self.glide(state) or self.leg_spring(state)))\
                or (self.hfp_top(state) and (self.grenade_eggs(state) or self.clockwork_shot(state))\
                    and self.egg_aim(state) and self.spring_pad(state) and (self.talon_trot(state) or self.split_up(state)))\
                or (self.extremelyLongJump(state) and self.clockwork_shot(state))\
                or self.claw_clamber_boots(state) and self.ice_cube_BK(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = (self.split_up(state) and self.ice_cube_kazooie(state) and (self.tall_jump(state) or self.wing_whack(state) or self.glide(state) or self.leg_spring(state)))\
                or (self.hfp_top(state) and (self.grenade_eggs(state) or self.clockwork_shot(state))\
                    and self.egg_aim(state) and self.spring_pad(state) and (self.talon_trot(state) or self.split_up(state)))\
                or (self.extremelyLongJump(state) and self.clockwork_shot(state))\
                or self.claw_clamber_boots(state) and self.ice_cube_BK(state)
     --]]
    
    local top = access_HFP_lavaSideTop(true)
    local soloKazooieCube = access_HFP_canBreakIceCubesAsSoloKazooie(true)
    local extremelyLongJump = can_extremelyLongJump(true)
    local pairCube = access_HFP_canBreakIceCubesAsPair(true)
    
    -- Normal Logic
    if ( top <= logictype.CurrentStage and can_shootEggs("geggs") and has("eggaim") and has("tjump") and (has("ttrot") or has("splitup")) ) then
        logic = 0
    elseif ( soloKazooieCube <= logictype.CurrentStage and (has("tjump") or has_wingWhack() or has_glide() or has_legSpring()) or has("clawbts") and can_shootEggs("geggs") and has("eggaim") ) then
        logic = 1
    elseif ( top < 2 and can_shootEggs("geggs") and has("eggaim") and has("tjump") and (has("ttrot") or has("splitup")) ) then
        logic = 1 -- Sequence Breaking
    elseif ( top <= logictype.CurrentStage and can_clockworkShot() and has("tjump") and (has("ttrot") or has("splitup")) or extremelyLongJump <= logictype.CurrentStage and can_clockworkShot() or has("clawbts") and pairCube <= logictype.CurrentStage ) then
        logic = 2
    
    -- Sequence Breaking
    else
        local fromTop = 99
        if ( (can_shootEggs("geggs") and has("eggaim") or can_clockworkShot()) and has("tjump") and (has("ttrot") or has("splitup")) ) then
            fromTop = math.max(2, top)
        end
        
        local clockworkJump = 99
        if ( can_clockworkShot() ) then
            clockworkJump = math.max(2, extremelyLongJump)
        end
        
        local soloKazooie = 99
        if ( has("tjump") or has_wingWhack() or has_glide() or has_legSpring() ) then
            soloKazooie = math.max(1, soloKazooieCube)
        end
        
        local clawbts = 99
        if ( has("clawbts") ) then
            clawbts = math.max(2, pairCube)
        end
        
        logic = math.min(fromTop, clockworkJump, soloKazooie, clawbts)
    end
    
    return convertLogic(logic, skip)
end

----- Nests

function nests_HFP_lavaSideOnShelterAtEntrance(skip)
    local logic = 99
    --[[        nest_hfp_entrance_shelter
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.flight_pad(state) or self.leg_spring(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.flight_pad(state)\
                or self.leg_spring(state)\
                or self.glide(state)\
                or self.tall_jump(state) and self.wing_whack(state)\
                or self.flap_flip(state) and (self.grip_grab(state) or self.beak_buster(state))
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.flight_pad(state)\
                or self.leg_spring(state)\
                or self.glide(state)\
                or self.clockwork_shot(state)\
                or self.tall_jump(state) and self.wing_whack(state)\
                or self.flap_flip(state) and (self.grip_grab(state) or self.beak_buster(state))
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.flight_pad(state)\
                or self.leg_spring(state)\
                or self.glide(state)\
                or self.clockwork_shot(state)\
                or self.tall_jump(state) and self.wing_whack(state)\
                or self.flap_flip(state) and (self.grip_grab(state) or self.beak_buster(state))
    --]]
    
    if ( has("fpad") or has_legSpring() ) then
        logic = 0
    elseif ( has_glide() or has("tjump") and has_wingWhack() or has("fflip") and (has("ggrab") or has("bbust")) ) then
        logic = 1
    elseif ( can_clockworkShot() ) then
        logic = 2
    end
    
    return convertLogic(logic, skip)
end

function nests_HFP_icySideTrainStationHard(skip)
    local logic = 99
    --[[        nest_icy_side_train_station_hard
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.access_ice_train_station(state) and self.dive(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.access_ice_train_station(state) and (self.beak_buster(state) or self.dive(state))
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.access_ice_train_station(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.access_ice_train_station(state)
     --]]
    
    local accessIcyTrainStation = access_HFP_icySideTrainStation(true)
    
    -- Normal Logic
    if ( accessIcyTrainStation <= logictype.CurrentStage and has("dive") ) then
        logic = 0
    elseif ( accessIcyTrainStation <= logictype.CurrentStage and has("bbust") ) then
        logic = 1
    elseif ( accessIcyTrainStation < 2 and (has("dive") or has("bbust")) ) then
        logic = 1 -- Sequence Breaking
    elseif ( accessIcyTrainStation <= logictype.CurrentStage ) then
        logic = 2
    
    -- Sequence Breaking
    else
        logic = accessIcyTrainStation
    end
    
    return convertLogic(logic, skip)
end

function nests_HFP_lavaSideChillyBilli(skip)
    local logic = 99
    --[[
    self.flight_pad(state) and self.ice_eggs_item(state)
    --]]
    
    if ( has("fpad") and has("ieggs") ) then
        logic = 0
    end
    
    return convertLogic(logic, skip)
end

function nests_HFP_icySideChillyWilly(skip)
    local logic = 99
    --[[
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.fire_eggs(state) and self.claw_clamber_boots(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.fire_eggs(state) and self.claw_clamber_boots(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        # In case people go for the damage boost for Chilly Willy then die before getting the jiggy, we also require Pack Whack to prevent softlocks.
        logic = self.claw_clamber_boots(state)\
                 or (self.pack_whack(state) and self.tall_jump(state) and self.flutter(state) and \
                     (self.talon_trot(state) or self.flap_flip(state)))
    elif self.world.options.logic_type == LogicType.option_glitches:
        # In case people go for the damage boost for Chilly Willy then die before getting the jiggy, we also require Pack Whack to prevent softlocks.
        logic = self.claw_clamber_boots(state)\
                 or (self.pack_whack(state) and self.tall_jump(state) and self.flutter(state) and \
                     (self.talon_trot(state) or self.flap_flip(state)))
    --]]
    
    -- Normal Logic
    if ( can_shootEggs("feggs") and has("clawbts") ) then
        logic = 0
    elseif ( has("clawbts") or has_packWhack() and has("tjump") and has("flutter") and (has("ttrot") or has("fflip")) ) then
        logic = 2
        
    -- Sequence Breaking
        
    end
    
    return convertLogic(logic, skip)
end

function nests_HFP_lavaSideKickballEggNests(skip)
    local logic = 99
    --[[        nest_hfp_kickball_egg
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.long_jump(state) and self.small_elevation(state) and self.has_explosives(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.long_jump(state) and self.small_elevation(state) and self.has_explosives(state)\
                or state.has(itemName.MUMBOHP, self.player) and self.tall_jump(state)\
                or self.long_jump(state) and self.dragon_kazooie(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.has_explosives(state) or state.has(itemName.MUMBOHP, self.player)\
                or self.dragon_kazooie(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.has_explosives(state) or state.has(itemName.MUMBOHP, self.player)\
                or self.dragon_kazooie(state)
    --]]
    
    local explosives = can_shootExplosiveEggs(true)
    local dragonKazooie = can_getDragonKazooie(true)
    
    -- Normal Logic
    if ( can_longJump() and can_reachSmallElevation() and explosives <= logictype.CurrentStage ) then
        logic = 0
    elseif ( has("mumbohp") and has("tjump") or can_longJump() and dragonKazooie <= logictype.CurrentStage ) then
        logic = 1
    elseif ( can_longJump() and can_reachSmallElevation() and explosives < 2 ) then
        logic = 1 -- Sequence Breaking
    elseif ( explosives <= logictype.CurrentStage or has("mumbohp") or dragonKazooie <= logictype.CurrentStage ) then
        logic = 2
    
    -- Sequence Breaking
    else
        logic = math.max(2, math.min(explosives, dragonKazooie))
    end
    
    return convertLogic(logic, skip)
end

function nests_HFP_lavaSideKickballFeatherNests(skip)
    local logic = 99
    --[[        nest_hfp_kickball_feather
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.long_jump(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.long_jump(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = True
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = True
    --]]
    
    if ( can_longJump() ) then
        logic = 0
    else
        logic = 2
    end
    
    return convertLogic(logic, skip)
end

function nests_HFP_icicleGrottoSpringPad(skip)
    local logic = 99
    --[[        nest_hfp_spring_pad
     if self.world.options.logic_type == LogicType.option_intended:
        logic = self.hfp_top(state) and self.spring_pad(state) and self.talon_trot(state) and self.ice_cube_BK(state)\
                or self.hfp_top(state) and self.spring_pad(state) and self.split_up(state) and self.ice_cube_kazooie(state)\
                or self.warp_to_icicle_grotto(state) and (
                    self.ice_cube_BK(state)\
                    or self.split_up(state) and self.ice_cube_kazooie(state)
                )
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = (self.split_up(state) and self.ice_cube_kazooie(state) and (self.tall_jump(state) or self.wing_whack(state) or self.glide(state) or self.leg_spring(state)))\
                or (self.hfp_top(state) and self.spring_pad(state) and self.talon_trot(state) and self.ice_cube_BK(state))\
                or self.warp_to_icicle_grotto(state) and (
                    self.ice_cube_BK(state)\
                    or self.split_up(state) and self.ice_cube_kazooie(state)
                )
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = (self.split_up(state) and self.ice_cube_kazooie(state) and (self.tall_jump(state) or self.wing_whack(state) or self.glide(state) or self.leg_spring(state)))\
                or (self.hfp_top(state) and (self.ice_cube_BK(state) or self.clockwork_shot(state)) and (self.talon_trot(state) or self.claw_clamber_boots(state)))\            -- redundant to check for clockwork shot here because ice_cube_BK accounts for it already
                or (self.extremelyLongJump(state) and self.clockwork_shot(state))\
                or self.warp_to_icicle_grotto(state) and (
                    self.ice_cube_BK(state)\
                    or self.split_up(state) and self.ice_cube_kazooie(state)
                )
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = (self.split_up(state) and self.ice_cube_kazooie(state) and (self.tall_jump(state) or self.wing_whack(state) or self.glide(state) or self.leg_spring(state)))\
                or (self.hfp_top(state) and (self.ice_cube_BK(state) or self.clockwork_shot(state)) and (self.talon_trot(state) or self.claw_clamber_boots(state)))\
                or (self.extremelyLongJump(state) and self.clockwork_shot(state))\
                or self.warp_to_icicle_grotto(state) and (
                    self.ice_cube_BK(state)\
                    or self.split_up(state) and self.ice_cube_kazooie(state)
                )
     --]]
    
    local top = access_HFP_lavaSideTop(true)
    local pairCube = access_HFP_canBreakIceCubesAsPair(true)
    local kazooieCube = access_HFP_canBreakIceCubesAsSoloKazooie(true)
    local extremelyLongJump = can_extremelyLongJump(true)
    local warpToGrotto = access_HFP_warpToIcicleGrotto(true)
    
    -- Normal Logic
    if ( top <= logictype.CurrentStage and has("tjump") and (has("ttrot") and pairCube <= logictype.CurrentStage or kazooieCube <= logictype.CurrentStage) or warpToGrotto <= logictype.CurrentStage and (pairCube <= logictype.CurrentStage or kazooieCube <= logictype.CurrentStage) ) then
        logic = 0
    elseif ( kazooieCube <= logictype.CurrentStage and (has("tjump") or has_wingWhack() or has_glide() or has_legSpring()) ) then
        logic = 1
    elseif ( top < 2 and has("tjump") and (has("ttrot") and pairCube < 2 or kazooieCube < 2) or warpToGrotto < 2 and (pairCube < 2 or kazooieCube < 2) ) then
        logic = 1 -- Sequence Breaking
    elseif ( top <= logictype.CurrentStage and pairCube <= logictype.CurrentStage and (has("ttrot") or has("clawbts")) or can_clockworkShot() and extremelyLongJump <= logictype.CurrentStage ) then
        logic = 2
    
    -- Sequence Breaking
    else
        local topKazooie = 99
        if ( has("tjump") ) then
            topKazooie = math.max(top, kazooieCube)
        end
    
        local soloKazooie = 99
        if ( has("tjump") or has_wingWhack() or has_glide() or has_legSpring() ) then
            soloKazooie = math.max(1, kazooieCube)
        end
        
        local pair = 99
        if ( has("ttrot") or has("clawbts") ) then
            pair = math.max(2, top, pairCube)
        end
        
        local clockworkJump = 99
        if ( can_clockworkShot() ) then
            clockworkJump = math.max(2, extremelyLongJump)
        end
        
        logic = math.max(2, math.min(topKazooie, soloKazooie, pair, clockworkJump, math.max(warpToGrotto, pairCube), math.max(warpToGrotto, kazooieCube)))
    end
    
    return convertLogic(logic, skip)
end

----- Signs

----- Other - Jinjos

function jinjo_HFP_colosseumHotWaterfall(skip)
    local logic = 99
    --[[        jinjo_hot_waterfall
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.wonderwing(state) and self.flap_flip(state) and self.long_jump(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.wonderwing(state) and self.flap_flip(state) and self.long_jump(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = True
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = True
    --]]
    
    if ( has("wwing") and has("fflip") and can_longJump() ) then
        logic = 0
    else
        logic = 2
    end
    
    return convertLogic(logic, skip)
end

function jinjo_HFP_hotPool(skip)
    local logic = 99
    --[[        jinjo_hot_pool
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.shack_pack(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.shack_pack(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.shack_pack(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.shack_pack(state) or self.dive(state) and self.tall_jump(state) and self.clockwork_eggs(state) and self.third_person_egg_shooting(state)
    --]]
    
    if ( has_shackPack() ) then
        logic = 0
    elseif ( has("dive") and has("tjump") and can_shootEggs("ceggs") and has("eggshoot") ) then
        logic = 3
    end
    
    return convertLogic(logic, skip)
end

function jinjo_HFP_windTunnel(skip)
    local logic = 99
    --[[        jinjo_wind_tunnel
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.humbaHFP(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.humbaHFP(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.humbaHFP(state) or self.clockwork_shot(state) and self.hfp_top(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.humbaHFP(state) or self.clockwork_shot(state) and self.hfp_top(state)
    --]]
    
    local humba = access_HFP_humba(true)
    local top = access_HFP_lavaSideTop(true)
    
    -- Normal Logic
    if ( humba < 2 ) then
        logic = humba
    elseif ( top <= logictype.CurrentStage and can_clockworkShot() ) then
        logic = 2
        
    -- Sequence Breaking
    else
        local clockworkTop = 99
        if ( can_clockworkShot() ) then
            clockworkTop = math.max(2, top)
        end
        
        logic = math.min(humba, clockworkTop)
    end
    
    return convertLogic(logic, skip)
end

function jinjo_HFP_icicleGrotto(skip)
    local logic = 99
    --[[        jinjo_icicle_grotto
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.glide(state) and self.grenade_eggs(state) and \
                self.egg_aim(state) and self.tall_jump(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.glide(state) or (self.leg_spring(state) and
                self.wing_whack(state))
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.glide(state) or self.leg_spring(state)\
                or self.clockwork_shot(state) and (self.tall_jump(state) and (self.split_up(state) or self.talon_trot(state)))
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.glide(state) or self.leg_spring(state)\
                or self.clockwork_shot(state) and (self.tall_jump(state) and (self.split_up(state) or self.talon_trot(state)))
    --]]
    
    if ( has_glide() and can_shootEggs("geggs") and has("eggaim") and has("tjump") ) then
        logic = 0
    elseif ( has_glide() or has_legSpring() and has_wingWhack() ) then
        logic = 1
    elseif ( has_legSpring() or can_clockworkShot() and has("tjump") and (has("splitup") or has("ttrot")) ) then
        logic = 2
    end
    
    return convertLogic(logic, skip)
end

function jinjo_HFP_inMildred(skip)
    local logic = 99
    --[[        jinjo_mildred
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.hfp_top(state) and self.small_elevation(state) and (self.fire_eggs(state) or self.has_explosives(state) or \
                self.bill_drill(state) or self.dragon_kazooie(state))
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.hfp_top(state) and (
            (self.small_elevation(state) or self.beak_buster(state)) and (self.fire_eggs(state) or self.has_explosives(state) or self.bill_drill(state) or self.dragon_kazooie(state))\
            or (self.check_mumbo_magic(state, itemName.MUMBOHP) and self.tall_jump(state))\
            or self.split_up(state) and (self.tall_jump(state) and  self.leg_spring(state)) and (self.fire_eggs(state) or self.has_explosives(state)))          -- redundant because it requires tjump and either fire eggs or explosives, which alone passes the earlier condition
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.hfp_top(state) and (
            (self.small_elevation(state) or self.beak_buster(state)) and (self.fire_eggs(state) or self.has_explosives(state) or self.bill_drill(state) or self.dragon_kazooie(state))\
            or (self.check_mumbo_magic(state, itemName.MUMBOHP) and self.tall_jump(state))\
            or self.split_up(state) and (self.tall_jump(state) and self.leg_spring(state)) and (self.fire_eggs(state) or self.has_explosives(state))\
            or self.clockwork_shot(state))
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.hfp_top(state) and (
            (self.small_elevation(state) or self.beak_buster(state)) and (self.fire_eggs(state) or self.has_explosives(state) or self.bill_drill(state) or self.dragon_kazooie(state))\
            or (self.check_mumbo_magic(state, itemName.MUMBOHP) and self.tall_jump(state))\
            or self.split_up(state) and (self.tall_jump(state) and self.leg_spring(state)) and (self.fire_eggs(state) or self.has_explosives(state))\
            or self.clockwork_shot(state))
    --]]
    
    local top = access_HFP_lavaSideTop(true)
    local explosives = can_shootExplosiveEggs(true)
    local dragonKazooie = can_getDragonKazooie(true)
    
    -- Normal Logic
    if ( top <= logictype.CurrentStage and can_reachSmallElevation() and (can_shootEggs("feggs") or explosives <= logictype.CurrentStage or has_billDrill() or dragonKazooie <= logictype.CurrentStage) ) then
        logic = 0
    elseif ( top <= logictype.CurrentStage and ((can_reachSmallElevation() or has("bbust")) and (can_shootEggs("feggs") or explosives <= logictype.CurrentStage or has_billDrill() or dragonKazooie <= logictype.CurrentStage) or has("mumbohp") and has("tjump")) ) then
        logic = 1
    elseif ( top < 2 and (can_shootEggs("feggs") or explosives < 2 or has_billDrill() or dragonKazooie < 2) ) then
        logic = 1 -- Sequence Breaking
    elseif ( top <= logictype.CurrentStage and can_clockworkShot() ) then
        logic = 2
        
    -- Sequence Breaking
    else
        local simple = 99
        if ( (can_reachSmallElevation() or has("bbust")) and (can_shootEggs("feggs") or has_billDrill()) or has("mumbohp") and has("tjump") ) then
            simple = 1
        end
        
        local withExplosives = 99
        if ( can_reachSmallElevation() or has("bbust") ) then
            withExplosives = math.max(1, explosives)
        end
        
        local withDragon = 99
        if ( can_reachSmallElevation() or has("bbust") ) then
            withDragon = math.max(1, dragonKazooie)
        end
        
        local withClockworks = 99
        if ( can_clockworkShot() ) then
            withClockworks = 2
        end
        
        logic = math.max(top, math.min(simple, withExplosives, withDragon, withClockworks))
    end
    
    return convertLogic(logic, skip)
end

----- Other - Glowbos

function glowbo_HFP_icySide(skip)
    local logic = 99
    --[[        glowbo_icy_side
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.hfp_top(state)\
                and (self.long_jump(state)\
                or self.flap_flip(state) and self.grip_grab(state))
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.hfp_top(state)\
                and (self.long_jump(state)\
                or self.flap_flip(state) and self.grip_grab(state))
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.hfp_top(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.hfp_top(state)
     --]]
     
    local hfpTop = access_HFP_lavaSideTop(true)
    
    -- Normal Logic
    if ( hfpTop <= logictype.CurrentStage and (can_longJump() or has("fflip") and has("ggrab")) ) then
        logic = 0
    elseif ( hfpTop <= logictype.CurrentStage ) then
        logic = 2
    elseif ( has("wwing") ) then
        logic = 7
        
    -- Sequence Breaking
    else
        logic = math.max(2, hfpTop)
    end
    
    return convertLogic(logic, skip)
end

function glowbo_HFP_megaGlowbo(skip)
    local logic = 99
    --[[        mega_glowbo
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.talon_torpedo(state) and state.has(itemName.IKEY, self.player)\
                and self.dive(state) and self.tall_jump(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.talon_torpedo(state) and state.has(itemName.IKEY, self.player)\
                and self.dive(state) and\
                (self.tall_jump(state) or self.beak_buster(state) or self.flutter(state) or self.air_rat_a_tat_rap(state))
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.talon_torpedo(state) and state.has(itemName.IKEY, self.player)\
                and self.dive(state) and\
                (self.tall_jump(state) or self.beak_buster(state) or self.clockwork_shot(state) or self.flutter(state) or self.air_rat_a_tat_rap(state))
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.talon_torpedo(state) and state.has(itemName.IKEY, self.player)\
                    and self.dive(state) and\
                    (self.tall_jump(state) or self.beak_buster(state) or self.clockwork_shot(state) or self.flutter(state) or self.air_rat_a_tat_rap(state))
    --]]
    
    if ( has("ttorp") and has("ikey") and has("dive") and has("tjump") ) then
        logic = 0
    elseif ( has("ttorp") and has("ikey") and has("dive") and (has("bbust") or has("flutter") or has("arat")) ) then
        logic = 1
    elseif ( has("ttorp") and has("ikey") and has("dive") and can_clockworkShot() ) then
        logic = 2
    end
    
    return convertLogic(logic, skip)
end

----- Other - Honeycombs

function honeycomb_HFP_volcano(skip)
    local logic = 99
    --[[        honeycomb_volcano
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.hfp_top(state) and self.grenade_eggs(state) and self.egg_aim(state) and self.spring_pad(state) and (self.talon_trot(state) or self.split_up(state))
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.split_up(state) and (self.tall_jump(state) or self.wing_whack(state) or self.glide(state) or self.leg_spring(state))\
                or self.hfp_top(state) and self.grenade_eggs(state) and self.egg_aim(state) and self.spring_pad(state) and self.talon_trot(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.split_up(state) and (self.tall_jump(state) or self.wing_whack(state) or self.glide(state) or self.leg_spring(state))\
                or self.hfp_top(state) and self.grenade_eggs(state) and self.egg_aim(state) and self.spring_pad(state) and self.talon_trot(state)\
                or self.extremelyLongJump(state)\
                or self.hfp_top(state) and self.clockwork_shot(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.split_up(state) and (self.tall_jump(state) or self.wing_whack(state) or self.glide(state) or self.leg_spring(state))\
                or self.hfp_top(state) and self.grenade_eggs(state) and self.egg_aim(state) and self.spring_pad(state) and self.talon_trot(state)\
                or self.extremelyLongJump(state) \
                or self.hfp_top(state) and self.clockwork_shot(state)
    --]]
    
    local top = access_HFP_lavaSideTop(true)
    local extremelyLongJump = can_extremelyLongJump(true)
    
    -- Normal Logic
    if ( top <= logictype.CurrentStage and can_shootEggs("geggs") and has("eggaim") and has("tjump") and (has("ttrot") or has("splitup")) ) then
        logic = 0
    elseif ( has("splitup") and (has("tjump") or has_wingWhack() or has_glide() or has_legSpring()) or top <= logictype.CurrentStage and can_shootEggs("geggs") and has("eggaim") and has("springpad") and has("ttrot") ) then
        logic = 1
    elseif ( top < 2 and can_shootEggs("geggs") and has("eggaim") and has("tjump") and (has("ttrot") or has("splitup")) ) then
        logic = 1 -- Sequence Breaking
    elseif ( top <= logictype.CurrentStage and can_clockworkShot() or extremelyLongJump <= logictype.CurrentStage ) then
        logic = 2
        
    -- Sequence Breaking
    else
        local simple = 99
        if ( can_shootEggs("geggs") and has("eggaim") and has("springpad") and has("ttrot") ) then
            simple = top
        end
        
        local clockworks = 99
        if ( can_clockworkShot() ) then
            clockworks = 2
        end
        
        logic = math.min(simple, clockworks, math.max(2, extremelyLongJump))
    end
    
    return convertLogic(logic, skip)
end

function honeycomb_HFP_lavaSideStation(skip)
    local logic = 99
    --[[        honeycomb_hfp_station
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.grip_grab(state) and\
              (self.talon_trot(state) or self.tall_jump(state)) and\
              (self.flutter(state) or self.air_rat_a_tat_rap(state))
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = (self.grip_grab(state) and\
              (self.talon_trot(state) or self.tall_jump(state)) and\
              (self.flutter(state) or self.air_rat_a_tat_rap(state)))\
                or self.leg_spring(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = (self.grip_grab(state) and\
              (self.talon_trot(state) or self.tall_jump(state)) and\
              (self.flutter(state) or self.air_rat_a_tat_rap(state)))\
                or self.leg_spring(state)\
                 or self.clockwork_shot(state) and self.hfp_top(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = (self.grip_grab(state) and\
              (self.talon_trot(state) or self.tall_jump(state)) and\
              (self.flutter(state) or self.air_rat_a_tat_rap(state)))\
                or self.leg_spring(state)\
                 or self.clockwork_shot(state) and self.hfp_top(state)
    --]]
    
    local top = access_HFP_lavaSideTop(true)
    
    -- Normal Logic
    if ( has("ggrab") and (has("ttrot") or has("tjump")) and (has("flutter") or has("arat")) ) then
        logic = 0
    elseif ( has_legSpring() ) then
        logic = 1
    elseif ( top <= logictype.CurrentStage and can_clockworkShot() ) then
        logic = 2
        
    -- Sequence Breaking
    elseif ( can_clockworkShot() ) then
        logic = math.max(2, top)
    end
    
    return convertLogic(logic, skip)
end

function honeycomb_HFP_lavaSideAboveHotPool(skip)
    local logic = 99
    --[[        honeycomb_lava_side
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.grip_grab(state) and self.flap_flip(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.grip_grab(state) and self.flap_flip(state) or self.flight_pad(state)\
                or self.leg_spring(state) and (self.wing_whack(state) or self.glide(state))
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.grip_grab(state) and self.flap_flip(state)\
                or self.flight_pad(state)\
                or self.leg_spring(state) and (self.wing_whack(state) or self.glide(state))\
                or self.hfp_top(state) and self.clockwork_shot(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.grip_grab(state) and self.flap_flip(state) or self.flight_pad(state)\
                or self.leg_spring(state) and (self.wing_whack(state) or self.glide(state))\
                or self.hfp_top(state) and self.clockwork_shot(state)
    --]]
    
    local top = access_HFP_lavaSideTop(true)
    
    -- Normal Logic
    if ( has("ggrab") and has("fflip") ) then
        logic = 0
    elseif ( has("fpad") or has_legSpring() and (has_wingWhack() or has_glide()) ) then
        logic = 1
    elseif ( top <= logictype.CurrentStage and can_clockworkShot() ) then
        logic = 2
        
    -- Sequence Breaking
    elseif ( can_clockworkShot() ) then
        logic = math.max(2, top)
    end
    
    return convertLogic(logic, skip)
end

----- Other - Cheato Pages

function cheato_HFP_lavaSideAboveHotPool(skip)
    local logic = 99
    --[[        cheato_colosseum
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.long_jump(state) and self.claw_clamber_boots(state) and (self.has_explosives(state) or self.dragon_kazooie(state))
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.long_jump(state) and  self.claw_clamber_boots(state) and (
                    self.has_explosives(state)\
                    or self.check_mumbo_magic(state, itemName.MUMBOHP)\
                    or self.dragon_kazooie(state)
                )
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.claw_clamber_boots(state) and \
                (self.has_explosives(state) or
                self.check_mumbo_magic(state, itemName.MUMBOHP)\
                or self.dragon_kazooie(state))
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = (self.claw_clamber_boots(state) and \
                    (self.has_explosives(state) or
                    self.check_mumbo_magic(state, itemName.MUMBOHP)\
                    or self.dragon_kazooie(state)))\
                or self.hfp_top(state) and self.third_person_egg_shooting(state)
    --]]
    
    local explosives = can_shootExplosiveEggs(true)
    local dragonKazooie = can_getDragonKazooie(true)
    local top = access_HFP_lavaSideTop(true)
    
    -- Normal Logic
    if ( can_longJump() and has("clawbts") and (explosives <= logictype.CurrentStage or dragonKazooie <= logictype.CurrentStage) ) then
        logic = 0
    elseif ( can_longJump() and has("clawbts") and has("mumbohp") ) then
        logic = 1
    elseif ( can_longJump() and has("clawbts") and (explosives < 2 or dragonKazooie < 2) ) then
        logic = 1 -- Sequence Breaking
    elseif ( has("clawbts") and (explosives <= logictype.CurrentStage or dragonKazooie <= logictype.CurrentStage or has("mumbohp")) ) then
        logic = 2
    elseif ( has("clawbts") and (explosives < 3 or dragonKazooie < 3) ) then
        logic = 2 -- Sequence Breaking
    elseif ( top <= logictype.CurrentStage and has("eggshoot") ) then
        logic = 3
        
    -- Sequence Breaking
    else
        local glitch = 99
        if ( has("eggshoot") ) then
            glitch = math.max(3, top)
        end
        
        local clawbts = 99
        if ( has("clawbts") ) then
            clawbts = math.max(2, math.min(explosives, dragonKazooie))
        end
        
        logic = math.min(glitch, clawbts)
    end
    
    return convertLogic(logic, skip)
end

function cheato_HFP_icicleGrotto(skip)
    local logic = 99
    --[[        cheato_icicle_grotto
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.climb(state) and (self.clockwork_eggs(state) or self.shack_pack(state))
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.climb(state) and self.shack_pack(state)\
                or ((self.leg_spring(state) or self.climb(state)) and self.clockwork_eggs(state))
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.hfp_top(state) and\
                (self.climb(state) and self.shack_pack(state)\
                or ((self.leg_spring(state) or self.climb(state)) and self.clockwork_eggs(state)))
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.hfp_top(state) and\
                (self.climb(state) and self.shack_pack(state)\
                or ((self.leg_spring(state) or self.climb(state)) and self.clockwork_eggs(state)))\
                or ((self.talon_trot(state) or self.split_up(state)) and self.clockwork_shot(state))
    --]]
    
    -- this function is weird about hfp_top only being a requirement for hard tricks and above due to the way the function works. going to make it a requirement for all, and if that ever causes errors then that's indicative of a logic problem
    
    local top = access_HFP_lavaSideTop(true)
    
    -- Normal Logic
    if ( top <= logictype.CurrentStage and (has("climb") and (can_shootEggs("ceggs") or has_shackPack())) ) then
        logic = 0
    elseif ( top <= logictype.CurrentStage and (has_legSpring() and can_shootEggs("ceggs")) ) then
        logic = 1
        
    -- Sequence Breaking
    elseif ( has("climb") and (can_shootEggs("ceggs") or has_shackPack()) or has_legSpring() and can_shootEggs("ceggs") ) then
        logic = math.max(1, top)
    end
    
    return convertLogic(logic, skip)
end

function cheato_HFP_icySideOnPillar(skip)
    local logic = 99
    --[[        cheato_icy_pillar
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.hfp_top(state) and self.grenade_eggs(state) and self.egg_aim(state) and self.spring_pad(state) and self.split_up(state) and self.glide(state)\
                or self.leg_spring(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.split_up(state) and (self.tall_jump(state) or self.wing_whack(state) or self.glide(state))\
                or self.leg_spring(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = ((self.split_up(state) and (self.tall_jump(state) or self.wing_whack(state) or self.glide(state))))\
                or self.leg_spring(state)\
                or (self.grenade_eggs(state) and self.clockwork_shot(state) and self.small_elevation(state) and self.spring_pad(state) and self.talon_trot(state))      -- small elevation is redundant because we're making sure we have tall jump
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = ((self.split_up(state) and (self.tall_jump(state) or self.wing_whack(state) or self.glide(state))))\
                or self.leg_spring(state)\
                or (self.grenade_eggs(state) and self.clockwork_shot(state) and self.small_elevation(state) and self.spring_pad(state) and self.talon_trot(state))
    --]]
    
    local top = access_HFP_lavaSideTop(true)
    
    -- Normal Logic
    if ( top <= logictype.CurrentStage and can_shootEggs("geggs") and has("eggaim") and has("tjump") and has_glide() or has_legSpring() ) then
        logic = 0
    elseif ( has("splitup") and (has("tjump") or has_wingWhack() or has_glide()) ) then
        logic = 1
    elseif ( top < 2 and can_shootEggs("geggs") and has("eggaim") and has("tjump") and has_glide() ) then
        logic = 1 -- Sequence Breaking
    elseif ( can_shootEggs("geggs") and can_clockworkShot() and has("tjump") and has("ttrot") ) then
        logic = 2
        
    -- Sequence Breaking
    elseif ( can_shootEggs("geggs") and has("eggaim") and has("tjump") and has_glide() ) then
        logic = top
    end
    
    return convertLogic(logic, skip)
end

----- Other

function trainSwitch_HFP_lava(skip)
    local logic = 99
    --[[        tswitch_lavaside
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.grip_grab(state)\
                and (self.tall_jump(state) or self.talon_trot(state))\
                and (self.flutter(state) or self.air_rat_a_tat_rap(state))
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.grip_grab(state)\
                    and (self.tall_jump(state) or self.talon_trot(state))\
                    and (self.flutter(state) or self.air_rat_a_tat_rap(state))\
                or self.flight_pad(state)\
                or self.leg_spring(state)\
                or self.split_up(state) and self.tall_jump(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.grip_grab(state)\
                    and (self.tall_jump(state) or self.talon_trot(state))\
                    and (self.flutter(state) or self.air_rat_a_tat_rap(state))\
                or self.flight_pad(state)\
                or self.leg_spring(state)\
                or self.split_up(state) and self.tall_jump(state)\
             or self.talon_trot(state) and self.flutter(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.grip_grab(state)\
                    and (self.tall_jump(state) or self.talon_trot(state))\
                    and (self.flutter(state) or self.air_rat_a_tat_rap(state))\
                or self.flight_pad(state)\
                or self.leg_spring(state)\
                or self.split_up(state) and self.tall_jump(state)\
             or self.talon_trot(state) and self.flutter(state)
    --]]
    
    if ( has("ggrab") and (has("tjump") or has("ttrot")) and (has("flutter") or has("arat")) ) then
        logic = 0
    elseif ( has("fpad") or has_legSpring() or has("splitup") and has("tjump") ) then
        logic = 1
    elseif ( has("ttrot") and has("flutter") ) then
        logic = 2
    end
    
    return convertLogic(logic, skip)
end

function other_HFP_alphette(skip)
    local logic = 99
    --[[        alphette
     if self.world.options.logic_type == LogicType.option_intended:
        logic = state.can_reach_location(locationName.JIGGYJR10, self.player) and self.bill_drill(state) and state.has(itemName.MUMBOHP, self.player)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = state.can_reach_location(locationName.JIGGYJR10, self.player) and self.bill_drill(state) and state.has(itemName.MUMBOHP, self.player)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = state.can_reach_location(locationName.JIGGYJR10, self.player) and self.bill_drill(state) and state.has(itemName.MUMBOHP, self.player)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = state.can_reach_location(locationName.JIGGYJR10, self.player) and self.bill_drill(state) and state.has(itemName.MUMBOHP, self.player)
     --]]
    
    local jrlUFO = jiggy_JRL_ufo(true)
    local jrluAccessibility = Tracker:FindObjectForCode("@Region: Jolly Roger's Lagoon - Underwater").AccessibilityLevel
    
    -- Normal Logic
    if ( jrlUFO <= logictype.CurrentStage and has_billDrill() and has("mumbohp") and (jrluAccessibility == AccessibilityLevel.Normal or jrluAccessibility == AccessibilityLevel.Cleared) ) then
        logic = 0
        
    -- Sequence Breaking
    elseif ( has_billDrill() and has("mumbohp") and (jrluAccessibility == AccessibilityLevel.Normal or jrluAccessibility == AccessibilityLevel.Cleared) ) then
        logic = jrlUFO
    elseif ( has_billDrill() and has("mumbohp") and jrluAccessibility > AccessibilityLevel.None ) then
        logic = math.max(logictype.CurrentStage + 1, jrlUFO)
    end
    
    return convertLogic(logic, skip)
end

function other_HFP_betette(skip)
    local logic = 99
    --[[        betette
     if self.world.options.logic_type == LogicType.option_intended:
        logic = state.can_reach_location(locationName.JIGGYJR10, self.player) and self.bill_drill(state) and state.has(itemName.MUMBOHP, self.player)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = state.can_reach_location(locationName.JIGGYJR10, self.player) and self.bill_drill(state) and state.has(itemName.MUMBOHP, self.player)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = state.can_reach_location(locationName.JIGGYJR10, self.player) and self.bill_drill(state) and state.has(itemName.MUMBOHP, self.player)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = state.can_reach_location(locationName.JIGGYJR10, self.player) and self.bill_drill(state) and state.has(itemName.MUMBOHP, self.player)
     --]]
    
    local jrlUFO = jiggy_JRL_ufo(true)
    local jrluAccessibility = Tracker:FindObjectForCode("@Region: Jolly Roger's Lagoon - Underwater").AccessibilityLevel
    
    -- Normal Logic
    if ( jrlUFO <= logictype.CurrentStage and has_billDrill() and has("mumbohp") and (jrluAccessibility == AccessibilityLevel.Normal or jrluAccessibility == AccessibilityLevel.Cleared) ) then
        logic = 0
        
    -- Sequence Breaking
    elseif ( has_billDrill() and has("mumbohp") and (jrluAccessibility == AccessibilityLevel.Normal or jrluAccessibility == AccessibilityLevel.Cleared) ) then
        logic = jrlUFO
    elseif ( has_billDrill() and has("mumbohp") and jrluAccessibility > AccessibilityLevel.None ) then
        logic = math.max(logictype.CurrentStage + 1, jrlUFO)
    end
    
    return convertLogic(logic, skip)
end

function other_HFP_gamette(skip)
    local logic = 99
    --[[        gamette
     if self.world.options.logic_type == LogicType.option_intended:
        logic = state.can_reach_location(locationName.JIGGYJR10, self.player) and self.hatch(state) and self.glide(state) and state.has(itemName.MUMBOHP, self.player)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = state.can_reach_location(locationName.JIGGYJR10, self.player) and state.has(itemName.MUMBOHP, self.player) and \
                self.hatch(state) and ((self.wing_whack(state) and self.tall_jump(state)) or self.glide(state))
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = state.can_reach_location(locationName.JIGGYJR10, self.player) and state.has(itemName.MUMBOHP, self.player) and \
                 self.hatch(state) and (self.wing_whack(state) or self.tall_jump(state) or self.glide(state))
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = state.can_reach_location(locationName.JIGGYJR10, self.player) and state.has(itemName.MUMBOHP, self.player) and \
                self.hatch(state) and (self.wing_whack(state) or self.tall_jump(state) or self.glide(state))
     --]]
    
    local jrlUFO = jiggy_JRL_ufo(true)
    local jrluAccessibility = Tracker:FindObjectForCode("@Region: Jolly Roger's Lagoon - Underwater").AccessibilityLevel
    
    -- Normal Logic
    if ( jrlUFO <= logictype.CurrentStage and has_hatch() and has_glide() and has("mumbohp") and (jrluAccessibility == AccessibilityLevel.Normal or jrluAccessibility == AccessibilityLevel.Cleared) ) then
        logic = 0
    elseif ( jrlUFO <= logictype.CurrentStage and has_hatch() and has_wingWhack() and has("tjump") and has("mumbohp") and (jrluAccessibility == AccessibilityLevel.Normal or jrluAccessibility == AccessibilityLevel.Cleared) ) then
        logic = 1
        
    -- Sequence Breaking
    elseif ( has_hatch() and (has_glide() or has_wingWhack() and has("tjump")) and has("mumbohp") and (jrluAccessibility == AccessibilityLevel.Normal or jrluAccessibility == AccessibilityLevel.Cleared) ) then
        logic = math.max(1, jrlUFO)
    elseif ( has_hatch() and (has_glide() or has_wingWhack() and has("tjump")) and has("mumbohp") and jrluAccessibility > AccessibilityLevel.None ) then
        logic = math.max(logictype.CurrentStage + 1, jrlUFO)
    end
    
    return convertLogic(logic, skip)
end