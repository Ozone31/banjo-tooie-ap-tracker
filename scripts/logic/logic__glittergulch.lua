--------------- Glitter Gulch Mine

----- Basic & Access functions

function access_GGM_canLeave(skip)
    local logic = 99
    --[[
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.gm_jiggy(state) and self.climb(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.climb(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.climb(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.climb(state)
    --]]
    
    -- Normal Logic
    if ( has("climb") and has("gga") ) then
        logic = 0
        
    -- Sequence Breaking
    elseif ( has("climb") ) then
        logic = 1
    end
    
    return convertLogic(logic, skip)
end

function access_GGM_ttrot(skip)
    local logic = 99
    --[[
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.talon_trot(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.talon_trot(state) or self.turbo_trainers(state) or self.springy_step_shoes(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.talon_trot(state) or self.turbo_trainers(state) or self.springy_step_shoes(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.talon_trot(state) or self.turbo_trainers(state) or self.springy_step_shoes(state)
    --]]
    
    if ( has("ttrot") ) then
        logic = 0
    elseif ( has("ttrain") or has("springb") ) then
        logic = 1
    end
    
    return convertLogic(logic, skip)
end

function access_GGM_humba(skip)
    local logic = 99
    --[[        humbaGGM
    state.has(itemName.HUMBAGM, self.player) and state.can_reach_location(locationName.WARPGM3, self.player)
    --]]
    
    local warpToHumba = warp_GGM_humba(true)
    
    -- Normal Logic
    if ( has("humbagm") and warpToHumba <= logictype.CurrentStage ) then
        logic = 0
    
    -- Sequence Breaking
    elseif ( has("humbagm") ) then
        logic = warpToHumba
    end
    
    return convertLogic(logic, skip)
end

function access_GGM_canBreakBoulders(skip)
    local logic = 99
    --[[        GM_boulders
     return self.bill_drill(state) or self.humbaGGM(state)
     --]]
    -- FIXIT also every single if statement in glitter gulch mine that checks for small elevation should check for alternatives (eg. smuggling springy step shoes)
    
    local humba = access_GGM_humba(true)
    
    -- Normal Logic
    if ( has_billDrill() or humba <= logictype.CurrentStage ) then
        logic = 0
    
    -- Sequence Breaking
    else
        logic = humba
    end
    
    return convertLogic(logic, skip)
end

function access_GGM_mumbo(skip)
    local logic = 99
    --[[        mumboGGM
     return self.small_elevation(state) and state.has(itemName.MUMBOGM, self.player)\
            and state.can_reach_region(regionName.GM, self.player)
     --]]
    
    local ggmAccessibility = Tracker:FindObjectForCode("@Region: Glitter Gulch Mine - Main Area").AccessibilityLevel
    
    if ( can_reachSmallElevation() and has("mumbogm") and (ggmAccessibility == AccessibilityLevel.Normal or ggmAccessibility == AccessibilityLevel.Cleared) ) then
        logic = 0
    elseif ( can_reachSmallElevation() and has("mumbogm") and ggmAccessibility > AccessibilityLevel.None ) then
        logic = logictype.CurrentStage + 1
    elseif ( has("mumbogm") and access_GGM_ttrot(true) <= 7 and ggmAccessibility > AccessibilityLevel.None ) then
        logic = 7 -- FIXIT you can smuggle talon trot to get to him
    end
    
    return convertLogic(logic, skip)
end

function access_GGM_slopes(skip)
    local logic = 99
    --[[        GGM_slope
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.ggm_trot(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.ggm_trot(state) or (self.GM_boulders(state) and self.split_up(state))
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.ggm_trot(state) or (self.GM_boulders(state) and self.split_up(state))
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.ggm_trot(state) or (self.GM_boulders(state) and self.split_up(state))
    --]]
    
    local ggmTrot = access_GGM_ttrot(true)
    local canBreakBoulders = access_GGM_canBreakBoulders(true)
    
    -- Normal Logic
    if ( ggmTrot <= logictype.CurrentStage ) then
        logic = 0
    elseif ( canBreakBoulders <= logictype.CurrentStage and has("splitup") ) then
        logic = 1
    
    -- Sequence Breaking
    else
        local splitUp = 99
        if ( has("splitup") ) then
            splitUp = canBreakBoulders
        end
        
        logic = math.max(1, math.min(ggmTrot, splitUp))
    end
    
    return convertLogic(logic, skip)
end

function access_GGM_canReachWaterfallCavernGate(skip)
    local logic = 99
    --[[        reach_waterfall_cavern_gate
    if self.world.options.logic_type == LogicType.option_intended:
      logic = self.turbo_trainers(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
      logic = self.ggm_trot(state)\
            or self.GM_boulders(state) and self.split_up(state)\
            or state.has(itemName.WARPGM1, self.player) and state.has(itemName.WARPGM5, self.player)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.ggm_trot(state)\
            or self.GM_boulders(state) and self.split_up(state)\
            or state.has(itemName.WARPGM1, self.player) and state.has(itemName.WARPGM5, self.player)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.ggm_trot(state)\
            or self.GM_boulders(state) and self.split_up(state)\
            or state.has(itemName.WARPGM1, self.player) and state.has(itemName.WARPGM5, self.player)
    --]]
    
    local ggmTrot = access_GGM_ttrot(true)
    local canBreakBoulders = access_GGM_canBreakBoulders(true)
    
    -- Normal Logic
    if ( has("ttrain") ) then
        logic = 0
    elseif ( ggmTrot <= logictype.CurrentStage or canBreakBoulders <= logictype.CurrentStage and has("splitup") or has("warpgm1") and has("warpgm5") or has("randomizewarppads_off") ) then
        logic = 1
        
    -- Sequence Breaking
    else
        local boulders = 99
        if ( has("splitup") ) then
            boulders = canBreakBoulders
        end
        
        logic = math.max(1, math.min(ggmTrot, boulders))
    end
    
    return convertLogic(logic, skip)
end

----- Silos

function silo_GGM_billDrill(skip)
    local logic = 99
    --[[        silo_bill_drill
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.check_notes(state, locationName.BDRILL)\
                and (self.flap_flip(state)\
                     or (self.tall_jump(state) or self.talon_trot(state) and self.flutter(state)) and self.grip_grab(state))
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.check_notes(state, locationName.BDRILL)\
                and (self.flap_flip(state)\
                     or (self.tall_jump(state) or self.talon_trot(state) and self.flutter(state)) and self.grip_grab(state))
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.check_notes(state, locationName.BDRILL)\
                and (self.flap_flip(state)\
                    or (self.tall_jump(state) or self.talon_trot(state) and self.flutter(state)) and self.grip_grab(state)\
                    or self.turbo_trainers(state))
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.check_notes(state, locationName.BDRILL)\
                and (self.flap_flip(state)\
                    or (self.tall_jump(state) or self.talon_trot(state) and self.flutter(state)) and self.grip_grab(state)\
                    or self.turbo_trainers(state))
    --]]
    
    if ( bdrill_count() ) then
        if ( has("fflip") or has("ggrab") and (has("tjump") or has("ttrot") and has("flutter")) ) then
            logic = 0
        elseif ( has("ttrain") ) then
            logic = 2
        end
    end
    
    return convertLogic(logic, skip)
end

function silo_GGM_beakBayonet(skip)
    local logic = 99
    --[[
    self.GM_boulders(state) and self.check_notes(state, locationName.BBAYONET)
    --]]
    
    local canBreakBoulders = access_GGM_canBreakBoulders(true)
    
    -- Normal Logic
    if ( canBreakBoulders <= logictype.CurrentStage and bbayonet_count() ) then
        logic = 0
    
    -- Sequence Breaking
    elseif ( bbayonet_count() ) then
        logic = canBreakBoulders
    end
    
    return convertLogic(logic, skip)
end

----- Warp Pads

function warp_GGM_humba(skip)
    local logic = 99
    --[[        warp_pad_ggm_wumba
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.ggm_trot(state) or self.warp_to_ggm_wumba(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.ggm_trot(state) or self.warp_to_ggm_wumba(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.ggm_trot(state) or self.clockwork_shot(state) or self.warp_to_ggm_wumba(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.ggm_trot(state) or self.clockwork_shot(state) or self.warp_to_ggm_wumba(state)
        
    return state.has(itemName.WARPGM3, self.player) and (
            state.has(itemName.WARPGM1, self.player)\
            or state.has(itemName.WARPGM2, self.player) and (
                self.small_elevation(state)\
                    or self.grip_grab(state)\
                    or self.beak_buster(state)\
                    or self.ggm_trot(state)\                                    -- redundant for this specific function
                    or self.warp_to_ggm_mumbo(state)                            -- redundant for this specific function; if you have the other warps, problem already solved
                if self.world.options.logic_type != LogicType.option_intended
                else self.small_elevation(state)
            )\
            or state.has(itemName.WARPGM4, self.player)\
            or state.has(itemName.WARPGM5, self.player)\
        )
    
    return state.has(itemName.WARPGM2, self.player) and (
            state.has(itemName.WARPGM1, self.player)\
            or state.has(itemName.WARPGM4, self.player)\
            or state.has(itemName.WARPGM5, self.player)\
        )
     --]]
    
    local ggmTrot = access_GGM_ttrot(true)
    
    if ( ggmTrot <= logictype.CurrentStage or has("warpgm3") and (has("warpgm1") or has("warpgm4") or has("warpgm5") or has("warpgm2") and can_reachSmallElevation()) ) then
        logic = 0 -- Normal Logic
    elseif ( has("warpgm3") and has("warpgm2") and (has("ggrab") or has("bbust")) ) then
        logic = 1 -- Normal Logic
    elseif ( ggmTrot < 2 ) then
        logic = ggmTrot -- Sequence Breaking
    elseif ( can_clockworkShot() ) then
        logic = 2 -- Normal Logic
        
    -- Sequence Breaking
    else
        logic = ggmTrot
    end
    
    return convertLogic(logic, skip)
end

function warp_GGM_mumbo(skip)
    local logic = 99
    --[[        warp_pad_ggm_mumbo
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.small_elevation(state) or self.warp_to_ggm_mumbo(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.small_elevation(state)\
                or self.grip_grab(state)\
                or self.beak_buster(state)\
                or self.ggm_trot(state)\
                or self.warp_to_ggm_mumbo(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.small_elevation(state)\
                or self.grip_grab(state)\
                or self.beak_buster(state)\
                or self.ggm_trot(state)\
                or self.warp_to_ggm_mumbo(state)\
                or self.clockwork_shot(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.small_elevation(state)\
                or self.grip_grab(state)\
                or self.beak_buster(state)\
                or self.ggm_trot(state)\
                or self.warp_to_ggm_mumbo(state)\
                or self.clockwork_shot(state)
                
    return state.has(itemName.WARPGM2, self.player) and (
            state.has(itemName.WARPGM1, self.player)\
            or state.has(itemName.WARPGM4, self.player)\
            or state.has(itemName.WARPGM5, self.player)\
        )
    --]]
    
    local ggmTrot = access_GGM_ttrot(true)
    
    -- Normal Logic
    if ( can_reachSmallElevation() or has("warpgm2") and (has("warpgm1") or has("warpgm4") or has("warpgm5")) ) then
        logic = 0
    elseif ( has("ggrab") or has("bbust") or ggmTrot <= logictype.CurrentStage ) then
        logic = 1
    elseif ( can_clockworkShot() ) then
        logic = 2
    elseif ( has("wwing") ) then
        logic = 7
        
    -- Sequence Breaking
    else
        logic = math.max(1, ggmTrot)
    end
    
    return convertLogic(logic, skip)
end

----- Jiggies

function jiggy_GGM_canFreeCanaryMary(skip)
    local logic = 99
    --[[        canary_mary_free
    if self.world.options.logic_type == LogicType.option_intended:
        return self.humbaGGM(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        return self.humbaGGM(state) or self.clockwork_eggs(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        return self.humbaGGM(state) or self.clockwork_eggs(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        return self.humbaGGM(state) or self.clockwork_eggs(state)
    --]]
    
    local humba = access_GGM_humba(true)
    
    -- Normal Logic
    if ( humba <= logictype.CurrentStage ) then
        logic = 0
    elseif ( can_shootEggs("ceggs") ) then
        logic = 1
    
    -- Sequence Breaking
    else
        logic = humba
    end
    
    return convertLogic(logic, skip)
end

function jiggy_GGM_generatorCavern(skip)
    local logic = 99
    --[[        jiggy_generator_cavern
    if self.world.options.logic_type == LogicType.option_intended:
      logic = self.fire_eggs(state) and self.egg_aim(state)\
                 and self.long_jump(state) and (self.flap_flip(state) or self.talon_trot(state))
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
      logic = (self.long_jump(state) and (self.flap_flip(state) or self.talon_trot(state)) and (self.has_fire(state) or self.bill_drill(state)))\
            or self.flap_flip(state) and self.beak_buster(state) and self.climb(state)\
            or self.GM_boulders(state) and self.leg_spring(state) and self.fire_eggs(state)\
            or self.GM_boulders(state) and self.tall_jump(state) and self.pack_whack(state) and self.climb(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.long_jump(state) and (self.flap_flip(state) or self.talon_trot(state))\
            or self.flap_flip(state) and self.beak_buster(state)\
            or self.clockwork_shot(state)\
            or self.GM_boulders(state) and self.tall_jump(state) and self.pack_whack(state) and self.climb(state)\
            or self.GM_boulders(state) and self.leg_spring(state)\
            or self.beak_buster(state) and self.grip_grab(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = (self.long_jump(state) and (self.flap_flip(state) or self.talon_trot(state)))\
            or self.flap_flip(state) and self.beak_buster(state)\
            or self.clockwork_shot(state)\
            or self.GM_boulders(state) and self.tall_jump(state) and self.pack_whack(state) and self.climb(state)\
            or self.GM_boulders(state) and self.leg_spring(state)\
            or self.beak_buster(state) and self.grip_grab(state)
    --]]
    
    local hasFire = can_useFire(true)
    local canBreakBoulders = access_GGM_canBreakBoulders(true)
    
    -- Normal Logic
    if ( has("feggs") and has("eggaim") and can_longJump() and (has("fflip") or has("ttrot")) ) then
        logic = 0
    elseif ( can_longJump() and (has("fflip") or has("ttrot")) and (has_billDrill() or hasFire <= logictype.CurrentStage) or has("fflip") and has("bbust") and has("climb") or canBreakBoulders <= logictype.CurrentStage and (has_legSpring() and can_shootEggs("feggs") or has("tjump") and has_packWhack() and has("climb")) ) then
        logic = 1
    elseif ( can_longJump() and (has("fflip") or has("ttrot")) or has("fflip") and has("bbust") or can_clockworkShot() or canBreakBoulders <= logictype.CurrentStage and has_legSpring() or has("ggrab") and has("bbust") ) then
        logic = 2
    
    -- Sequence Breaking
    elseif ( has_legSpring() or has("tjump") and has_packWhack() and has("climb") ) then
        logic = math.max(1, canBreakBoulders)
    end
    
    return convertLogic(logic, skip)
end

function jiggy_GGM_waterfallCavern(skip)
    local logic = 99
    --[[        jiggy_waterfall_cavern
    if self.world.options.logic_type == LogicType.option_intended:
      logic = (self.grip_grab(state) or self.small_elevation(state)) and self.reach_waterfall_cavern_gate(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
      logic = self.reach_waterfall_cavern_gate(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.reach_waterfall_cavern_gate(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.reach_waterfall_cavern_gate(state)
    --]]
    
    local reachWaterfallCavernGate = access_GGM_canReachWaterfallCavernGate(true)
    
    -- Normal Logic
    if ( (has("ggrab") or can_reachSmallElevation()) and reachWaterfallCavernGate <= logictype.CurrentStage ) then
        logic = 0
    elseif ( reachWaterfallCavernGate <= logictype.CurrentStage ) then
        logic = 1
    
    -- Sequence Breaking
    else
        logic = math.max(1, reachWaterfallCavernGate)
    end
    
    return convertLogic(logic, skip)
end

function jiggy_GGM_ordnanceStorage(skip)
    local logic = 99
    --[[        jiggy_ordnance_storage
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.breegull_blaster(state) and self.beak_bayonet(state) and \
                self.GM_boulders(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.breegull_blaster(state) and self.beak_bayonet(state) and \
                self.GM_boulders(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.breegull_blaster(state) and self.beak_bayonet(state) and \
                self.GM_boulders(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.breegull_blaster(state) and self.beak_bayonet(state) and \
                self.GM_boulders(state)
    --]]
    
    local canBreakBoulders = access_GGM_canBreakBoulders(true)
    
    -- Normal Logic
    if ( has("bblaster") and has("bbayonet") and canBreakBoulders <= logictype.CurrentStage ) then
        logic = 0
    
    -- Sequence Breaking
    elseif ( has("bblaster") and has("bbayonet") ) then
        logic = canBreakBoulders
    end
    
    return convertLogic(logic, skip)
end

function jiggy_GGM_crushingShed(skip)
    local logic = 99
    --[[        jiggy_crushing_shed
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.mumboGGM(state) and self.beak_barge(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.mumboGGM(state) and self.beak_barge(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.mumboGGM(state) and self.beak_barge(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.mumboGGM(state) and self.beak_barge(state)
    --]]
    
    local mumbo = access_GGM_mumbo(true)
    
    -- Normal Logic
    if ( mumbo <= logictype.CurrentStage and has("bbarge") ) then
        logic = 0
    
    -- Sequence Breaking
    elseif ( has("bbarge") ) then
        logic = mumbo
    end
    
    return convertLogic(logic, skip)
end

function jiggy_GGM_waterfall(skip)
    local logic = 99
    --[[        jiggy_waterfall
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.springy_step_shoes(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.springy_step_shoes(state) or \
                (self.glide(state)\
                or self.wing_whack(state) and (self.tall_jump(state) or self.leg_spring(state))) and self.GM_boulders(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.springy_step_shoes(state) or \
                (self.glide(state)\
                or self.wing_whack(state) and (self.tall_jump(state) or self.leg_spring(state))) and self.GM_boulders(state)\
                or self.clockwork_shot(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.springy_step_shoes(state) or \
                (self.glide(state)\
                or self.wing_whack(state) and (self.tall_jump(state) or self.leg_spring(state))) and self.GM_boulders(state)\
                or self.clockwork_shot(state)
    --]]
    
    local canBreakBoulders = access_GGM_canBreakBoulders(true)
    
    -- Normal Logic
    if ( has("springb") ) then
        logic = 0
    elseif ( canBreakBoulders <= logictype.CurrentStage and (has_glide() or has_wingWhack() and (has("tjump") or has_legSpring())) ) then
        logic = 1
    elseif ( can_clockworkShot() ) then
        logic = 2
    
    -- Sequence Breaking
    elseif ( has_glide() or has_wingWhack() and (has("tjump") or has_legSpring()) ) then
        logic = math.max(1, canBreakBoulders)
    end
    
    return convertLogic(logic, skip)
end

function jiggy_GGM_powerHut(skip)
    local logic = 99
    --[[        jiggy_power_hut
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.GM_boulders(state) and self.split_up(state) and self.climb(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.GM_boulders(state) and\
                ((self.split_up(state) and self.climb(state)) or self.has_fire(state) or self.bill_drill(state))
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.GM_boulders(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.GM_boulders(state)
    --]]
    
    local canBreakBoulders = access_GGM_canBreakBoulders(true)
    local hasFire = can_useFire(true)
    
    -- Normal Logic
    if ( canBreakBoulders <= logictype.CurrentStage and has("splitup") and has("climb") ) then
        logic = 0
    elseif ( canBreakBoulders <= logictype.CurrentStage and (hasFire <= logictype.CurrentStage or has_billDrill()) ) then
        logic = 1
    elseif ( canBreakBoulders <= logictype.CurrentStage ) then
        logic = 2
    
    -- Sequence Breaking
    else
        logic = math.max(2, canBreakBoulders)
    end
    
    return convertLogic(logic, skip)
end

function jiggy_GGM_floodedCaves(skip)
    local logic = 99
    --[[        jiggy_flooded_caves
    if self.world.options.logic_type == LogicType.option_intended:
            logic = self.humbaGGM(state) and self.dive(state) and (self.tall_jump(state) or self.grip_grab(state))

    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.dive(state) and (self.tall_jump(state) or self.grip_grab(state) or self.beak_buster(state))\
                and (self.humbaGGM(state)\
                    or self.reach_waterfall_cavern_gate(state) and (
                        self.talon_trot(state) and (self.flutter(state) or self.air_rat_a_tat_rap(state))\
                        or self.roll(state) and self.tall_jump(state) and (self.flutter(state) or self.air_rat_a_tat_rap(state))
                    )
                )

    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.dive(state) and (self.tall_jump(state) or self.grip_grab(state) or self.beak_buster(state) or self.clockwork_shot(state))\
                and (self.humbaGGM(state)\
                    or self.reach_waterfall_cavern_gate(state) and (
                        self.talon_trot(state) and (self.flutter(state) or self.air_rat_a_tat_rap(state))\
                        or self.roll(state) and self.tall_jump(state) and (self.flutter(state) or self.air_rat_a_tat_rap(state))
                    )
                )

    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.dive(state) and (self.tall_jump(state) or self.grip_grab(state) or self.beak_buster(state) or self.clockwork_shot(state))\
                and (self.humbaGGM(state)\
                    or self.reach_waterfall_cavern_gate(state) and (
                        self.talon_trot(state) and (self.flutter(state) or self.air_rat_a_tat_rap(state))\
                        or self.roll(state) and self.tall_jump(state) and (self.flutter(state) or self.air_rat_a_tat_rap(state))
                    )
                )
    --]]
    
    local humba = access_GGM_humba(true)
    local canReachWaterfallCavern = access_GGM_canReachWaterfallCavernGate(true)
    
    -- Normal Logic
    if ( has("dive") and (has("tjump") or has("ggrab")) and humba <= logictype.CurrentStage ) then
        logic = 0
    elseif ( has("dive") and (has("tjump") or has("ggrab") or has("bbust")) and (humba <= logictype.CurrentStage or canReachWaterfallCavern <= logictype.CurrentStage and (has("ttrot") or has("roll") and has("tjump")) and (has("flutter") or has("arat"))) ) then
        logic = 1
    elseif ( has("dive") and can_clockworkShot() and (humba <= logictype.CurrentStage or canReachWaterfallCavern <= logictype.CurrentStage and (has("ttrot") or has("roll") and has("tjump")) and (has("flutter") or has("arat"))) ) then
        logic = 2
    
    -- Sequence Breaking
    elseif ( has("dive") and humba <= logictype.CurrentStage ) then
        logic = 7 -- instant transform
    elseif ( has("dive") and (has("tjump") or has("ggrab") or has("bbust") or can_clockworkShot()) ) then
        local waterfallCavern = 99
        if ( (has("ttrot") or has("roll") and has("tjump")) and (has("flutter") or has("arat")) ) then
            waterfallCavern = canReachWaterfallCavern
        end
        
        logic = math.max(2, math.min(humba, waterfallCavern))
    end
    
    return convertLogic(logic, skip)
end

----- Notes

function treble_GGM(skip)
    local logic = 99
    --[[        treble_gm
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.dive(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.dive(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.dive(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.dive(state) or (self.GM_boulders(state) and self.leg_spring(state))
    --]]
    
    local canBreakBoulders = access_GGM_canBreakBoulders(true)
    
    -- Normal Logic
    if ( has("dive") ) then
        logic = 0
    elseif ( has_legSpring() and canBreakBoulders <= logictype.CurrentStage ) then
        logic = 3
        
    -- Sequence Breaking
    elseif ( has_legSpring() ) then
        logic = math.max(3, canBreakBoulders)
    end
    
    return convertLogic(logic, skip)
end

function notes_GGM_greenPile(skip)
    local logic = 99
    --[[        notes_green_pile
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.GGM_slope(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.GGM_slope(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.GGM_slope(state) or self.clockwork_shot(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.GGM_slope(state) or self.clockwork_shot(state)
    --]]
    
    local slopes = access_GGM_slopes(true)
    
    if ( slopes <= logictype.CurrentStage ) then
        logic = 0 -- Normal Logic
    elseif ( slopes < 2 ) then
        logic = slopes -- Sequence Breaking
    elseif ( can_clockworkShot() ) then
        logic = 2 -- Normal Logic
    
    -- Sequence Breaking
    else
        logic = slopes
    end
    
    return convertLogic(logic, skip)
end

function notes_GGM_nearProspectorsHutEasy(skip)
    local logic = 99
    --[[        notes_prospector_easy
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.GGM_slope(state)\
                or self.flap_flip(state)\
                or (self.mt_jiggy(state) and self.dilberta_free(state))\
                or self.tall_jump(state) and self.grip_grab(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = True
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = True
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = True
    --]]
    
    local mtpcAccessibility = Tracker:FindObjectForCode("@Region: Mayahem Temple - Prison Compound").AccessibilityLevel
    local slopes = access_GGM_slopes(true)
    local freeDilberta = access_MT_canFreeDilberta(true)
    
    if ( slopes <= logictype.CurrentStage or has("fflip") or (mtpcAccessibility == AccessibilityLevel.Normal or mtpcAccessibility == AccessibilityLevel.Cleared) and freeDilberta <= logictype.CurrentStage or has("tjump") and has("ggrab") ) then
        logic = 0
    else
        logic = 1
    end
    
    return convertLogic(logic, skip)
end

function notes_GGM_nearProspectorsHutHard(skip) -- FIXIT I need to test to make sure I know which one of the five notes uses this; I just sorta guessed for now
    local logic = 99
    --[[        notes_prospector_hard
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.GGM_slope(state) or self.flap_flip(state) or (self.mt_jiggy(state) and self.dilberta_free(state))
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = True
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = True
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = True
    --]]
    
    local mtpcAccessibility = Tracker:FindObjectForCode("@Region: Mayahem Temple - Prison Compound").AccessibilityLevel
    local slopes = access_GGM_slopes(true)
    local freeDilberta = access_MT_canFreeDilberta(true)
    
    if ( slopes <= logictype.CurrentStage or has("fflip") or (mtpcAccessibility == AccessibilityLevel.Normal or mtpcAccessibility == AccessibilityLevel.Cleared) and freeDilberta <= logictype.CurrentStage ) then
        logic = 0
    else
        logic = 1
    end
    
    return convertLogic(logic, skip)
end

function notes_GGM_nearMumboEasy(skip)
    local logic = 99
    --[[        notes_gm_mumbo_easy
     if self.world.options.logic_type == LogicType.option_intended:
        logic = self.small_elevation(state) or self.warp_to_ggm_mumbo(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.small_elevation(state) or self.grip_grab(state) or self.beak_buster(state) or self.ggm_trot(state) or self.warp_to_ggm_mumbo(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.small_elevation(state) or self.grip_grab(state) or self.clockwork_shot(state) or self.beak_buster(state) or self.ggm_trot(state) or self.warp_to_ggm_mumbo(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.small_elevation(state) or self.grip_grab(state) or self.clockwork_shot(state) or self.beak_buster(state) or self.ggm_trot(state) or self.warp_to_ggm_mumbo(state)
                
    return state.has(itemName.WARPGM2, self.player) and (
            state.has(itemName.WARPGM1, self.player)\
            or state.has(itemName.WARPGM4, self.player)\
            or state.has(itemName.WARPGM5, self.player)\
        )
     --]]
    
    local ggmTrot = access_GGM_ttrot(true)
    
    -- Normal Logic
    if ( can_reachSmallElevation() or has("warpgm2") and (has("warpgm1") or has("warpgm4") or has("warpgm5")) ) then
        logic = 0
    elseif ( has("ggrab") or has("bbust") or ggmTrot <= logictype.CurrentStage ) then
        logic = 1
    elseif ( can_clockworkShot() ) then
        logic = 2
    elseif ( has("wwing") ) then
        logic = 7
    
    -- Sequence Breaking
    else
        logic = math.max(1, ggmTrot)
    end
    
    return convertLogic(logic, skip)
end

function notes_GGM_nearMumboHard(skip)
    local logic = 99
    --[[        notes_gm_mumbo_hard
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.small_elevation(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.small_elevation(state) or self.grip_grab(state) or self.beak_buster(state) or self.ggm_trot(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.small_elevation(state) or self.grip_grab(state) or self.clockwork_shot(state) or self.beak_buster(state) or self.ggm_trot(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.small_elevation(state) or self.grip_grab(state) or self.clockwork_shot(state) or self.beak_buster(state) or self.ggm_trot(state)
    --]]
    
    local ggmTrot = access_GGM_ttrot(true)
    
    -- Normal Logic
    if ( can_reachSmallElevation() ) then
        logic = 0
    elseif ( has("ggrab") or has("bbust") or ggmTrot <= logictype.CurrentStage ) then
        logic = 1
    elseif ( can_clockworkShot() ) then
        logic = 2
    elseif ( has("wwing") ) then
        logic = 7
    
    -- Sequence Breaking
    else
        logic = math.max(1, ggmTrot)
    end
    
    return convertLogic(logic, skip)
end

function notes_GGM_fuelDepotEasy(skip)
    local logic = 99
    --[[        notes_easy_fuel_depot
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

function notes_GGM_fuelDepotHard(skip)
    local logic = 99
    --[[        notes_hard_fuel_depot
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.small_elevation(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.small_elevation(state) or self.ggm_trot(state) or self.beak_buster(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.small_elevation(state) or self.ggm_trot(state) or self.clockwork_shot(state) or self.beak_buster(state) or self.air_rat_a_tat_rap(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.small_elevation(state) or self.ggm_trot(state) or self.clockwork_shot(state) or self.beak_buster(state) or self.air_rat_a_tat_rap(state)
    --]]
    
    local ggmTrot = access_GGM_ttrot(true)
    
    -- Normal Logic
    if ( can_reachSmallElevation() ) then
        logic = 0
    elseif ( has("bbust") or ggmTrot <= logictype.CurrentStage ) then
        logic = 1
    elseif ( can_clockworkShot() or has("arat") ) then
        logic = 2
    elseif ( has("wwing") ) then
        logic = 7
    
    -- Sequence Breaking
    else
        logic = math.max(1, ggmTrot)
    end
    
    return convertLogic(logic, skip)
end

----- Nests

function nests_GGM_nearBillDrillSilo(skip)
    local logic = 99
    --[[        nest_bill_drill
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.slightly_elevated_ledge(state) or self.flap_flip(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = ((self.talon_trot(state) or self.springy_step_shoes(state) or self.turbo_trainers(state)) and (self.flutter(state) or self.air_rat_a_tat_rap(state)) or self.tall_jump(state)) and self.grip_grab(state)\
                or self.flap_flip(state)\
                or self.GM_boulders(state) and self.split_up(state)\
                or self.humbaGGM(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = ((self.talon_trot(state) or self.springy_step_shoes(state)) and (self.flutter(state) or self.air_rat_a_tat_rap(state)) or self.tall_jump(state)) and self.grip_grab(state)\
                or self.flap_flip(state)\
                or self.turbo_trainers(state)\
                or self.clockwork_shot(state)\
                or self.GM_boulders(state) and self.split_up(state)\
                or self.humbaGGM(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = ((self.talon_trot(state) or self.springy_step_shoes(state)) and (self.flutter(state) or self.air_rat_a_tat_rap(state)) or self.tall_jump(state)) and self.grip_grab(state)\
                or self.flap_flip(state)\
                or self.turbo_trainers(state)\
                or self.clockwork_shot(state)\
                or self.GM_boulders(state) and self.split_up(state)\
                or self.humbaGGM(state)
    --]]
    
    local canBreakBoulders = access_GGM_canBreakBoulders(true)
    local humba = access_GGM_humba(true)
    
    -- Normal Logic
    if ( can_reachSlightlyElevatedLedge() or has("fflip") ) then
        logic = 0
    elseif ( has("ggrab") and ((has("ttrot") or has("springb") or has("ttrain")) and (has("flutter") or has("arat")) or has("tjump")) or canBreakBoulders <= logictype.CurrentStage and has("splitup") or humba <= logictype.CurrentStage ) then
        logic = 1
    elseif ( can_clockworkShot() or has("ttrain") ) then
        logic = 2
    
    -- Sequence Breaking
    else
        local splitUp = 99
        if ( has("splitup") ) then
            splitUp = canBreakBoulders
        end
        
        logic = math.max(1, math.min(humba, canBreakBoulders))
    end
    
    return convertLogic(logic, skip)
end

function nests_GGM_floodedCaves(skip)
    local logic = 99
    --[[        nest_flooded_caves
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.humbaGGM(state) and self.dive(state)

    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.dive(state)\
                and (self.humbaGGM(state)\
                    or self.talon_trot(state) and (self.flutter(state) or self.air_rat_a_tat_rap(state))\
                    or self.roll(state) and self.tall_jump(state)\
                        and (self.flutter(state) or self.air_rat_a_tat_rap(state)) and self.reach_waterfall_cavern_gate(state)
                )

    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.dive(state)\
                and (self.humbaGGM(state)\
                    or self.talon_trot(state) and (self.flutter(state) or self.air_rat_a_tat_rap(state))\
                    or self.roll(state) and self.tall_jump(state)\
                        and (self.flutter(state) or self.air_rat_a_tat_rap(state)) and self.reach_waterfall_cavern_gate(state)
                )

    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.dive(state)\
                and (self.humbaGGM(state)\
                    or self.talon_trot(state) and (self.flutter(state) or self.air_rat_a_tat_rap(state))\
                    or self.roll(state) and self.tall_jump(state)\
                        and (self.flutter(state) or self.air_rat_a_tat_rap(state)) and self.reach_waterfall_cavern_gate(state)
                )
     --]]
    
    local humba = access_GGM_humba(true)
    local canReachWaterfallCavern = access_GGM_canReachWaterfallCavernGate(true)
    
    -- Normal Logic
    if ( has("dive") and humba <= logictype.CurrentStage ) then
        logic = 0
    elseif ( has("dive") and (humba <= logictype.CurrentStage or has("ttrot") and (has("flutter") or has("arat")) or has("roll") and has("tjump") and (has("flutter") or has("arat")) and canReachWaterfallCavern <= logictype.CurrentStage) ) then
        logic = 1
    
    -- Sequence Breaking
    elseif ( has("dive") ) then
        local longJump = 99
        if ( has("roll") and has("tjump") and (has("flutter") or has("arat")) ) then
            longJump = math.max(1, canReachWaterfallCavern)
        end
        
        logic = math.min(humba, longJump)
    end
    
    return convertLogic(logic, skip)
end

function nests_GGM_outsidePowerHut(skip)
    local logic = 99
    --[[        nest_outside_power_hut
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.GM_boulders(state) and self.small_elevation(state)

    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.GM_boulders(state) and (\
                    self.small_elevation(state)\
                    or self.beak_buster(state)\
                    or self.turbo_trainers(state)\
                    or self.split_up(state))

    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.GM_boulders(state) and (\
                    self.small_elevation(state)\
                    or self.beak_buster(state)\
                    or self.turbo_trainers(state)\
                    or self.split_up(state)\
                    or self.clockwork_shot(state)
                )

    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.GM_boulders(state) and (\
                    self.small_elevation(state)\
                    or self.beak_buster(state)\
                    or self.turbo_trainers(state)\
                    or self.split_up(state)\
                    or self.clockwork_shot(state)
                )
    --]]
    
    local canBreakBoulders = access_GGM_canBreakBoulders(true)
    
    -- Normal Logic
    if ( canBreakBoulders <= logictype.CurrentStage and can_reachSmallElevation() ) then
        logic = 0
    elseif ( canBreakBoulders <= logictype.CurrentStage and (has("bbust") or has("ttrain") or has("splitup")) ) then
        logic = 1
    elseif ( canBreakBoulders <= logictype.CurrentStage and clockwork_shot() ) then
        logic = 2
    
    -- Sequence Breaking
    elseif ( has("bbust") or has("ttrain") or has("splitup") or clockwork_shot() ) then
        logic = math.max(2, canBreakBoulders)
    end
    
    return convertLogic(logic, skip)
end

function nests_GGM_mumbo(skip)
    local logic = 99
    --[[        nest_ggm_mumbo
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.small_elevation(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.small_elevation(state) or self.grip_grab(state) or self.beak_buster(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.small_elevation(state) or self.grip_grab(state) or self.clockwork_shot(state) or self.beak_buster(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.small_elevation(state) or self.grip_grab(state) or self.clockwork_shot(state) or self.beak_buster(state)
    --]]
    
    if ( can_reachSmallElevation() ) then
        logic = 0
    elseif ( has("ggrab") or has("bbust") ) then
        logic = 1
    elseif ( can_clockworkShot() ) then
        logic = 2
    end
    
    return convertLogic(logic, skip)
end

function nests_GGM_toxicGasCave(skip)
    local logic = 99
    --[[        nest_toxic_gas_cave
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.GM_boulders(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.GM_boulders(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.GM_boulders(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.GM_boulders(state) or self.ground_rat_a_tat_rap(state) or self.beak_barge(state) or self.egg_barge(state)      -- egg barge requires beak barge, so this is redundant
    --]]
    
    local canBreakBoulders = access_GGM_canBreakBoulders(true)
    
    if ( canBreakBoulders <= logictype.CurrentStage ) then
        logic = 0 -- Normal Logic
    elseif ( canBreakBoulders < 3 ) then
        logic = canBreakBoulders -- Sequence Breaking
    elseif ( has("grat") or has("bbarge") ) then
        logic = 3 -- Normal Logic
    
    -- Sequence Breaking
    else
        logic = canBreakBoulders
    end
    
    return convertLogic(logic, skip)
end

function nests_GGM_canaryCaveHigh(skip)
    local logic = 99
    --[[        nest_canary_high
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.humbaGGM(state) and (self.small_elevation(state) or self.grip_grab(state))
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.humbaGGM(state) and (self.small_elevation(state) or self.grip_grab(state))
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.humbaGGM(state) and (self.small_elevation(state) or self.grip_grab(state) or self.clockwork_shot(state))
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.humbaGGM(state) and (self.small_elevation(state) or self.grip_grab(state) or self.clockwork_shot(state))
    --]]
    
    local humba = access_GGM_humba(true)
    
    if ( humba <= logictype.CurrentStage and (can_reachSmallElevation() or has("ggrab")) ) then
        logic = 0 -- Normal Logic
    elseif ( humba < 2 and (can_reachSmallElevation() or has("ggrab")) ) then
        logic = humba -- Sequence Breaking
    elseif ( humba <= logictype.CurrentStage and can_clockworkShot() ) then
        logic = 2 -- Normal Logic
    
    -- Sequence Breaking
    elseif ( can_reachSmallElevation() or has("ggrab") or can_clockworkShot() ) then
        logic = math.max(2, humba)
    end
    
    return convertLogic(logic, skip)
end

function nests_GGM_canaryCaveLow(skip)
    local logic = 99
    --[[        nest_canary_low
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.humbaGGM(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.humbaGGM(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.humbaGGM(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.humbaGGM(state)
    --]]
    
    logic = access_GGM_humba(true)
    
    return convertLogic(logic, skip)
end

----- Signs

function signpost_GGM_gloomyCavern(skip)
    local logic = 99
    --[[        signpost_gloomy_cavern
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.GM_boulders(state) and (self.small_elevation(state) or self.split_up(state))
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.GM_boulders(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.GM_boulders(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.GM_boulders(state)
    --]]
    
    local canBreakBoulders = access_GGM_canBreakBoulders(true)
    
    -- Normal Logic
    if ( canBreakBoulders <= logictype.CurrentStage and (has("splitup") or can_reachSmallElevation()) ) then
        logic = 0
    elseif ( canBreakBoulders <= logictype.CurrentStage ) then
        logic = 1
    
    -- Sequence Breaking
    else
        logic = math.max(1, canBreakBoulders)
    end
    
    return convertLogic(logic, skip)
end

function signpost_GGM_chuffysWagon(skip)
    local logic = 99
    --[[        signpost_chuffy
    if self.world.options.logic_type == LogicType.option_intended:
        logic = state.can_reach_region(regionName.GM, self.player) and self.flap_flip(state)\
                or state.can_reach_region(regionName.WW, self.player) and state.has(itemName.TRAINSWWW, self.player) and state.has(itemName.CHUFFY, self.player)\
                or state.can_reach_region(regionName.TL, self.player) and state.has(itemName.TRAINSWTD, self.player) and state.has(itemName.CHUFFY, self.player)\
                or state.can_reach_region(regionName.GI1, self.player) and state.has(itemName.TRAINSWGI, self.player) and state.has(itemName.CHUFFY, self.player)\
                or state.can_reach_region(regionName.IOHCT, self.player) and state.has(itemName.TRAINSWIH, self.player) and state.has(itemName.CHUFFY, self.player)

    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = state.can_reach_region(regionName.GM, self.player) and (self.small_elevation(state) or self.beak_buster(state) or self.humbaGGM(state) or self.ggm_trot(state))\
                or state.can_reach_region(regionName.WW, self.player) and state.has(itemName.TRAINSWWW, self.player) and state.has(itemName.CHUFFY, self.player)\
                or state.can_reach_region(regionName.TL, self.player) and state.has(itemName.TRAINSWTD, self.player) and state.has(itemName.CHUFFY, self.player)\
                or state.can_reach_region(regionName.GI1, self.player) and state.has(itemName.TRAINSWGI, self.player) and state.has(itemName.CHUFFY, self.player)\
                or state.can_reach_region(regionName.IOHCT, self.player) and state.has(itemName.TRAINSWIH, self.player) and state.has(itemName.CHUFFY, self.player)\
                or state.can_reach_region(regionName.HP, self.player) and state.has(itemName.TRAINSWHP1, self.player) and self.hfp_top(state)\
                    and (self.leg_spring(state)\
                        or self.tall_jump(state) and self.pack_whack(state)\
                        or self.flap_flip(state)\
                        or self.claw_clamber_boots(state)\
                        or self.flight_pad(state))
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = state.can_reach_region(regionName.GM, self.player) and (self.small_elevation(state) or self.beak_buster(state) or self.humbaGGM(state) or self.ggm_trot(state))\
                or state.can_reach_region(regionName.WW, self.player) and state.has(itemName.TRAINSWWW, self.player) and state.has(itemName.CHUFFY, self.player)\
                or state.can_reach_region(regionName.TL, self.player) and state.has(itemName.TRAINSWTD, self.player) and state.has(itemName.CHUFFY, self.player)\
                or state.can_reach_region(regionName.GI1, self.player) and state.has(itemName.TRAINSWGI, self.player) and state.has(itemName.CHUFFY, self.player)\
                or state.can_reach_region(regionName.IOHCT, self.player) and state.has(itemName.TRAINSWIH, self.player) and state.has(itemName.CHUFFY, self.player)\
                or state.can_reach_region(regionName.HP, self.player) and state.has(itemName.TRAINSWHP1, self.player) and self.hfp_top(state)\
                    and (self.leg_spring(state)\
                        or self.tall_jump(state) and self.pack_whack(state)\
                        or self.flap_flip(state)\
                        or self.claw_clamber_boots(state)\
                        or self.flight_pad(state))
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = state.can_reach_region(regionName.GM, self.player) and (self.small_elevation(state) or self.beak_buster(state) or self.humbaGGM(state) or self.ggm_trot(state))\
                or state.can_reach_region(regionName.WW, self.player) and state.has(itemName.TRAINSWWW, self.player) and state.has(itemName.CHUFFY, self.player)\
                or state.can_reach_region(regionName.TL, self.player) and state.has(itemName.TRAINSWTD, self.player) and state.has(itemName.CHUFFY, self.player)\
                or state.can_reach_region(regionName.GI1, self.player) and state.has(itemName.TRAINSWGI, self.player) and state.has(itemName.CHUFFY, self.player)\
                or state.can_reach_region(regionName.IOHCT, self.player) and state.has(itemName.TRAINSWIH, self.player) and state.has(itemName.CHUFFY, self.player)\
                or state.can_reach_region(regionName.HP, self.player) and state.has(itemName.TRAINSWHP1, self.player) and self.hfp_top(state)\
                    and (self.leg_spring(state)\
                        or self.tall_jump(state) and self.pack_whack(state)\
                        or self.flap_flip(state)\
                        or self.claw_clamber_boots(state)\
                        or self.flight_pad(state))
    --]]
    
    local ggmAccessibility = Tracker:FindObjectForCode("@Region: Glitter Gulch Mine - Main Area").AccessibilityLevel
    local wwAccessibility = Tracker:FindObjectForCode("@Region: Witchyworld - Main Area").AccessibilityLevel
    local tdlAccessibility = Tracker:FindObjectForCode("@Region: Terrydactyland - Main Area").AccessibilityLevel
    local gif1Accessibility = Tracker:FindObjectForCode("@Region: Grunty Industries 1st Floor").AccessibilityLevel
    local ctAccessibility = Tracker:FindObjectForCode("@Region: Cliff Top").AccessibilityLevel
    local hfpAccessibility = Tracker:FindObjectForCode("@Region: Hailfire Peaks - Lava Side").AccessibilityLevel
    local ggmAccessTrue = (ggmAccessibility == AccessibilityLevel.Normal or ggmAccessibility == AccessibilityLevel.Cleared)
    local wwAccessTrue = (wwAccessibility == AccessibilityLevel.Normal or wwAccessibility == AccessibilityLevel.Cleared)
    local tdlAccessTrue = (tdlAccessibility == AccessibilityLevel.Normal or tdlAccessibility == AccessibilityLevel.Cleared)
    local gif1AccessTrue = (gif1Accessibility == AccessibilityLevel.Normal or gif1Accessibility == AccessibilityLevel.Cleared)
    local ctAccessTrue = (ctAccessibility == AccessibilityLevel.Normal or ctAccessibility == AccessibilityLevel.Cleared)
    local hfpAccessTrue = (hfpAccessibility == AccessibilityLevel.Normal or hfpAccessibility == AccessibilityLevel.Cleared)
    local ggmHumba = access_GGM_humba(true)
    local hfpTop = access_HFP_lavaSideTop(true)
    local ggmTrot = access_GGM_ttrot(true)
    
    -- Normal Logic
    if ( ggmAccessTrue and has("fflip") or has("chuffy") and (wwAccessTrue and has("trainswww") or tdlAccessTrue and has("trainswtd") or gif1AccessTrue and has("trainswgi") or ctAccessTrue and has("trainswih")) ) then
        logic = 0
    elseif ( ggmAccessTrue and (can_reachSmallElevation() or has("bbust") or ggmHumba <= logictype.CurrentStage or ggmTrot <= logictype.CurrentStage) or has("chuffy") and hfpAccessTrue and has("trainswhp1") and hfpTop <= logictype.CurrentStage and (has_legSpring() or has("tjump") and has_packWhack() or has("fflip") or has("clawbts") or has("fpad")) ) then
        logic = 1
    
    -- Sequence Breaking
    else
        local fromGGM = 99
        if ( ggmAccessTrue ) then
            fromGGM = math.min(ggmHumba, ggmTrot)
        elseif ( ggmAccessibility > AccessibilityLevel.None and (has("fflip") or can_reachSmallElevation() or has("bbust")) ) then
            fromGGM = logictype.CurrentStage + 1
        elseif ( ggmAccessibility > AccessibilityLevel.None ) then
            fromGGM = math.max(logictype.CurrentStage + 1, math.min(ggmHumba, ggmTrot))
        end
        
        local fromWW = 99
        if ( has("chuffy") and has("trainswww") and wwAccessibility > AccessibilityLevel.None ) then
            fromWW = logictype.CurrentStage + 1
        end
        
        local fromTDL = 99
        if ( has("chuffy") and has("trainswtd") and tdlAccessibility > AccessibilityLevel.None ) then
            fromTDL = logictype.CurrentStage + 1
        end
        
        local fromGI = 99
        if ( has("chuffy") and has("trainswgi") and gif1Accessibility > AccessibilityLevel.None ) then
            fromGI = logictype.CurrentStage + 1
        end
        
        local fromCT = 99
        if ( has("chuffy") and has("trainswih") and ctAccessibility > AccessibilityLevel.None ) then
            fromCT = logictype.CurrentStage + 1
        end
        
        local fromHFP = 99
        if ( hfpAccessTrue and has("chuffy") and has("trainswhp1") and (has_legSpring() or has("tjump") and has_packWhack() or has("fflip") or has("clawbts") or has("fpad")) ) then
            fromHFP = hfpTop
        elseif ( hfpAccessibility > AccessibilityLevel.None and has("chuffy") and has("trainswhp1") and (has_legSpring() or has("tjump") and has_packWhack() or has("fflip") or has("clawbts") or has("fpad")) ) then
            fromHFP = math.max(hfpTop, logictype.CurrentStage + 1)
        end
        
        logic = math.max(1, math.min(fromGGM, fromWW, fromTDL, fromGI, fromCT, fromHFP))
    end
    
    return convertLogic(logic, skip)
end

----- Other - Jinjos

function jinjo_GGM_jail(skip)
    local logic = 99
    --[[        jinjo_jail
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.humbaGGM(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.humbaGGM(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.humbaGGM(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.humbaGGM(state) or (self.bill_drill(state) and self.clockwork_shot(state))
    --]]
    
    local humba = access_GGM_humba(true)
    
    if ( humba <= logictype.CurrentStage ) then
        logic = 0 -- Normal Logic
    elseif ( humba < 3 ) then
        logic = humba -- Sequence Breaking
    elseif ( has_billDrill() and can_clockworkShot() ) then
        logic = 3 -- Normal Logic
    
    -- Sequence Breaking
    else
        logic = humba
    end
    
    return convertLogic(logic, skip)
end

function jinjo_GGM_boulderOnBlueHill(skip)
    local logic = 99
    --[[        jinjo_boulder
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.humbaGGM(state) or (self.ggm_trot(state) and self.bill_drill(state))
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.humbaGGM(state) or (self.ggm_trot(state) and self.bill_drill(state))
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.humbaGGM(state) or (self.ggm_trot(state) and self.bill_drill(state))
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.humbaGGM(state)\
                or (self.ggm_trot(state) and (self.bill_drill(state) or self.egg_barge(state)))
    --]]
    
    local humba = access_GGM_humba(true)
    local ggmTrot = access_GGM_ttrot(true)
    
    if ( humba <= logictype.CurrentStage or has_billDrill() and ggmTrot <= logictype.CurrentStage ) then
        logic = 0 -- Normal Logic
    elseif ( humba < 3 or has_billDrill() and ggmTrot < 3 ) then
         -- Sequence Breaking
        local trot = 99
        if ( has_billDrill() ) then
            trot = ggmTrot
        end
        
        logic = math.min(humba, trot)
    elseif ( humba <= logictype.CurrentStage and can_eggBarge() ) then
        logic = 3 -- Normal Logic
    
    -- Sequence Breaking
    else
        local trot = 99
        if ( has_billDrill() or can_eggBarge() ) then
            trot = ggmTrot
        end
        
        logic = math.max(3, math.min(humba, trot))
    end
    
    return convertLogic(logic, skip)
end

----- Other - Glowbos

function glowbo_GGM_entrance(skip)
    local logic = 99
    --[[        glowbo_entrance_ggm
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.GGM_slope(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.GGM_slope(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = True
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = True
    --]]
    
    local slopes = access_GGM_slopes(true)
    
    if ( slopes <= logictype.CurrentStage ) then
        logic = 0 -- Normal Logic
    elseif ( slopes < 2 ) then
        logic = slopes  -- Sequence Breaking
    else
        logic = 2 -- Normal Logic
    end
    
    return convertLogic(logic, skip)
end

----- Other - Honeycombs

function honeycomb_GGM_boulderNearProspectorsHut(skip)
    local logic = 99
    --[[        honeycomb_prospector
    if self.world.options.logic_type == LogicType.option_intended:
        logic = (self.flap_flip(state) or self.ggm_trot(state) or self.slightly_elevated_ledge(state)) and self.bill_drill(state)\
                 or self.humbaGGM(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.bill_drill(state) or self.humbaGGM(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.bill_drill(state) or self.humbaGGM(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.bill_drill(state) or self.humbaGGM(state) or self.ground_rat_a_tat_rap(state) or self.egg_barge(state)
    --]]
    
    local humba = access_GGM_humba(true)
    local ggmTrot = access_GGM_ttrot(true)
    
    if ( humba <= logictype.CurrentStage or has_billDrill() and (has("fflip") or can_reachSlightlyElevatedLedge() or ggmTrot <= logictype.CurrentStage) ) then
        logic = 0 -- Normal Logic
    elseif ( has_billDrill() ) then
        logic = 1 -- Normal Logic
    elseif ( humba < 3 ) then
        logic = humba -- Sequence Breaking
    elseif ( has("grat") or can_eggBarge() ) then
        logic = 3 -- Normal Logic
    
    -- Sequence Breaking
    else
        logic = humba
    end
    
    return convertLogic(logic, skip)
end

function honeycomb_GGM_trainStation(skip)
    local logic = 99
    --[[        honeycomb_gm_station
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.ground_attack(state) or self.humbaGGM(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.ground_attack(state) or self.humbaGGM(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.ground_attack(state) or self.humbaGGM(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.ground_attack(state) or self.humbaGGM(state)
    --]]
    
    local humba = access_GGM_humba(true)
    
    -- Normal Logic
    if ( can_groundAttack() or humba <= logictype.CurrentStage ) then
        logic = 0
    
    -- Sequence Breaking
    else
        logic = humba
    end
    
    return convertLogic(logic, skip)
end

----- Other - Cheato Pages

function cheato_GGM_entrance(skip)
    local logic = 99
    --[[
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.springy_step_shoes(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.springy_step_shoes(state) or \
                (self.climb(state) and (self.flutter(state) or (self.air_rat_a_tat_rap(state) and self.tall_jump(state))))\
                or (self.GM_boulders(state) and self.leg_spring(state))\
                or (self.GM_boulders(state) and self.glide(state) and self.tall_jump(state))
                # or state.can_reach_region(regionName.IOHPL, self.player) and self.PL_to_GGM(state) and self.flutter(state) and (self.grip_grab(state) or self.beak_buster(state)) # Flutter right as you enter the level.
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.springy_step_shoes(state) or \
                (self.climb(state) and (self.flutter(state) or self.air_rat_a_tat_rap(state)))\
                or (self.clockwork_shot(state))\
                or (self.GM_boulders(state) and self.leg_spring(state))\
                or (self.GM_boulders(state) and self.glide(state) and self.tall_jump(state))\
                or (self.GM_boulders(state) and self.tall_jump(state) and self.turbo_trainers(state) and (self.wing_whack(state) or self.glide(state)))
                # or state.can_reach_region(regionName.IOHPL, self.player) and self.PL_to_GGM(state) and self.flutter(state) and (self.grip_grab(state) or self.beak_buster(state))
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.springy_step_shoes(state) or \
                (self.climb(state) and (self.flutter(state) or self.air_rat_a_tat_rap(state)))\
                or (self.clockwork_shot(state))\
                or (self.GM_boulders(state) and self.leg_spring(state))\
                or (self.GM_boulders(state) and self.glide(state) and self.tall_jump(state))\
                or (self.GM_boulders(state) and self.tall_jump(state) and self.turbo_trainers(state) and (self.wing_whack(state) or self.glide(state)))
                # or state.can_reach_region(regionName.IOHPL, self.player) and self.PL_to_GGM(state) and self.flutter(state) and (self.grip_grab(state) or self.beak_buster(state))
    --]]
    
    local canBreakBoulders = access_GGM_humba(true)
    
    -- Normal Logic
    if ( has("springb") ) then
        logic = 0
    elseif ( has("climb") and (has("flutter") or has("arat") and has("tjump")) or canBreakBoulders <= logictype.CurrentStage and (has_legSpring() or has_glide() and has("tjump")) ) then
        logic = 1
    elseif ( has("climb") and has("arat") or can_clockworkShot() or canBreakBoulders <= logictype.CurrentStage and has("tjump") and has("ttrain") and has_wingWhack() ) then
        logic = 2
    
    -- Sequence Breaking
    elseif ( has_legSpring() or has_glide() and has("tjump") or has("tjump") and has("ttrain") and has_wingWhack() ) then
        logic = math.max(2, canBreakBoulders)
    end
    
    return convertLogic(logic, skip)
end

function cheato_GGM_waterStorage(skip)
    local logic = 99
    --[[        cheato_water_storage
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.grip_grab(state) and self.flap_flip(state) and self.dive(state) and self.climb(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = (self.grip_grab(state) or self.beak_buster(state)) and self.flap_flip(state) and self.dive(state) and self.climb(state)\
                or self.GM_boulders(state) and self.pack_whack(state) and self.tall_jump(state) and self.dive(state) and self.climb(state) and self.grip_grab(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = (self.grip_grab(state) or self.beak_buster(state)) and self.flap_flip(state) and self.dive(state) and self.climb(state)\
                or self.GM_boulders(state) and self.pack_whack(state) and self.tall_jump(state) and self.dive(state) and self.climb(state) and self.grip_grab(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = (self.grip_grab(state) or self.beak_buster(state)) and self.flap_flip(state) and self.dive(state) and self.climb(state)\
                or self.leg_spring(state) and self.glide(state) and self.GM_boulders(state)\
                or self.GM_boulders(state) and self.pack_whack(state) and self.tall_jump(state) and self.dive(state) and self.climb(state) and self.grip_grab(state)
    --]]
    
    local canBreakBoulders = access_GGM_humba(true)
    
    -- Normal Logic
    if ( has("ggrab") and has("fflip") and has("dive") and has("climb") ) then
        logic = 0
    elseif ( has("bbust") and has("fflip") and has("dive") and has("climb") or has("ggrab") and has("dive") and has("climb") and has("tjump") and has_packWhack() and canBreakBoulders <= logictype.CurrentStage ) then
        logic = 1
    elseif ( has("ggrab") and has("dive") and has("climb") and has("tjump") and has_packWhack() and canBreakBoulders < 3 ) then
        logic = canBreakBoulders -- Sequence Breaking
    elseif ( has_legSpring() and has_glide() and canBreakBoulders <= logictype.CurrentStage ) then
        logic = 3 -- Normal Logic
    
    -- Sequence Breaking
    elseif ( has_legSpring() and has_glide() or has("ggrab") and has("dive") and has("climb") and has("tjump") and has_packWhack() ) then
        logic = math.max(3, canBreakBoulders)
    end
    
    return convertLogic(logic, skip)
end

----- Other

