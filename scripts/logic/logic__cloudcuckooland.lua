--------------- Cloud Cuckooland

----- Basic & Access functions

function basic_CCL_mumbo()
    return has("mumbocc") and has("tjump")
end

function basic_CCL_canGrowBeanstalk()
    return basic_CCL_hasEnoughBeans() and basic_CCL_mumbo() and has("fpad") and has("climb")
end

function basic_CCL_canUseFloatus()
    return has_taxiPack() and has_hatch()
end

function basic_CCL_hasEnoughBeans()
    return has_billDrill() and has("randomizebeans_off") or has("bean", 2)
end

function basic_CCL_canReachSackPackSilo()
    return has_shackPack() and (has("randomizewarppads_off") or has("warpcc1") and has("warpcc2") or basic_CCL_canUseFloatus())
end


----- Silos

function silo_CCL_sackPack(skip)
    local logic = 99
    --[[
    self.can_access_sack_pack_silo(state) and self.check_notes(state, locationName.SAPACK)
    --]]
    
    if ( basic_CCL_canReachSackPackSilo() and sapack_count() ) then
        logic = 0
    end
    
    return convertLogic(logic, skip)
end

----- Warp Pads

----- Jiggies

function jiggy_CCL_mingyJongo(skip)
    local logic = 99
    --[[        jiggy_mingy
    if self.world.options.logic_type == LogicType.option_intended:
        logic = (self.can_shoot_linear_egg(state) or self.beak_barge(state) or self.air_rat_a_tat_rap(state) or self.wonderwing(state))\
                and self.talon_trot(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.can_shoot_linear_egg(state) or self.beak_barge(state) or self.air_rat_a_tat_rap(state) or self.wonderwing(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.ground_attack(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.ground_attack(state)
    --]]
    
    if ( has("ttrot") and (can_shootLinearEggs() or has("bbarge") or has("arat") or has("wwing")) ) then
        logic = 0
    elseif ( can_shootLinearEggs() or has("bbarge") or has("arat") or has("wwing") ) then
        logic = 1
    elseif ( can_groundAttack() ) then
        logic = 2
    end
    
    return convertLogic(logic, skip)
end

function jiggy_CCL_mrFit(skip)
    local logic = 99
    --[[        jiggy_mr_fit
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.mr_fit_high_jump(state) and self.mr_fit_sack_race(state) and self.turbo_trainers(state)                -- on all difficulties, sack race checks for high jump completion. checking for high jump completion here is redundant
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.mr_fit_high_jump(state) and self.mr_fit_sack_race(state) and \
                (self.turbo_trainers(state) or state.has(itemName.HUMBACC, self.player))
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.mr_fit_high_jump(state) and self.mr_fit_sack_race(state) and \
                (self.turbo_trainers(state) or state.has(itemName.HUMBACC, self.player))
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.mr_fit_high_jump(state) and self.mr_fit_sack_race(state) and \
                (self.turbo_trainers(state) or state.has(itemName.HUMBACC, self.player) or self.clockwork_eggs(state))
    --]]
    
    local sackRace = other_CCL_mrFittSackRace(true)
    
    if ( sackRace <= logictype.CurrentStage and has("ttrain") ) then
        logic = 0
    elseif ( sackRace <= logictype.CurrentStage and has("humbacc") ) then
        logic = 1
    elseif ( sackRace < 3 and (has("ttrain") or has("humbacc")) ) then
        logic = sackRace -- Sequence Breaking
    elseif ( sackRace <= logictype.CurrentStage and can_shootEggs("ceggs") ) then
        logic = 3
    
    -- Sequence Breaking
    elseif ( has("ttrain") or has("humbacc") or can_shootEggs("ceggs") ) then
        logic = sackRace
    end
    
    return convertLogic(logic, skip)
end

function jiggy_CCL_potOfGold(skip)
    local logic = 99
    --[[        jiggy_pot_of_gold
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.blue_eggs(state) and self.fire_eggs(state) and self.grenade_eggs(state) and self.ice_eggs(state)\
                and self.mumboCCL(state) and (self.flap_flip(state) or self.leg_spring(state))
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.blue_eggs(state) and self.fire_eggs(state) and self.grenade_eggs(state) and self.ice_eggs(state) and self.mumboCCL(state)\
                and (self.flap_flip(state) or self.leg_spring(state) or self.flight_pad(state))
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.blue_eggs(state) and self.fire_eggs(state) and self.grenade_eggs(state) and self.ice_eggs(state)\
                    and (self.mumboCCL(state) and (self.flap_flip(state) or self.leg_spring(state) or self.flight_pad(state))\
                or (self.leg_spring(state) or (self.split_up(state) and self.tall_jump(state)))\
                    and (self.flight_pad(state) and self.beak_bomb(state) or self.glide(state)))
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.blue_eggs(state) and self.fire_eggs(state) and self.grenade_eggs(state) and self.ice_eggs(state)\
                    and (self.mumboCCL(state) and (self.flap_flip(state) or self.leg_spring(state) or self.flight_pad(state))\
                or (self.leg_spring(state) or (self.split_up(state) and self.tall_jump(state)))\
                    and (self.flight_pad(state) and self.beak_bomb(state) or self.glide(state)))
    --]]
    
    if ( can_shootEggs("begg") and can_shootEggs("feggs") and can_shootEggs("geggs") and can_shootEggs("ieggs") and basic_CCL_mumbo() and (has("fflip") or has_legSpring()) ) then
        logic = 0
    elseif ( can_shootEggs("begg") and can_shootEggs("feggs") and can_shootEggs("geggs") and can_shootEggs("ieggs") and basic_CCL_mumbo() and has("fpad") ) then
        logic = 1
    elseif ( can_shootEggs("begg") and can_shootEggs("feggs") and can_shootEggs("geggs") and can_shootEggs("ieggs") and (has_legSpring() or has("splitup") and has("tjump")) and (has("fpad") and has("bbomb") or has_glide()) ) then
        logic = 2
    end
    
    return convertLogic(logic, skip)
end

function jiggy_CCL_canaryMary(skip)
    local logic = 99
    --[[
    self.canary_mary_free(state) and state.can_reach_region(regionName.GM, self.player)
    --]]
    
    local ggmAccessibility = Tracker:FindObjectForCode("@Region: Glitter Gulch Mine - Main Area").AccessibilityLevel
    local canaryMary = jiggy_GGM_canFreeCanaryMary(true)
    
    -- Normal Logic
    if ( canaryMary <= logictype.CurrentStage and (ggmAccessibility == AccessibilityLevel.Normal or ggmAccessibility == AccessibilityLevel.Cleared) ) then
        logic = 0
    
    -- Sequence Breaking
    elseif ( ggmAccessibility == AccessibilityLevel.Normal or ggmAccessibility == AccessibilityLevel.Cleared ) then
        logic = canaryMary
    elseif ( ggmAccessibility > AccessibilityLevel.None ) then
        logic = math.max(logictype.CurrentStage + 1, canaryMary)
    end
    
    return convertLogic(logic, skip)
end

function jiggy_CCL_cheeseWedge(skip)
    local logic = 99
    --[[        jiggy_cheese
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.sack_pack(state) and self.grow_beanstalk(state) and \
                self.can_use_floatus(state) and self.shack_pack(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.sack_pack(state) and self.grow_beanstalk(state) and \
                self.can_use_floatus(state) and self.shack_pack(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.sack_pack(state) and self.grow_beanstalk(state) and \
                self.can_use_floatus(state) and self.shack_pack(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.sack_pack(state) and self.grow_beanstalk(state) and \
                    self.can_use_floatus(state) and self.shack_pack(state)\
                or (self.talon_trot(state) or self.clockwork_warp(state)) and self.flap_flip(state) and self.beak_buster(state) and self.flight_pad(state)\
                or self.flight_pad(state) and (self.leg_spring(state) or (self.tall_jump(state) and self.wing_whack(state))) and self.clockwork_warp(state)
    --]]
    
    if ( has_sackPack() and basic_CCL_canGrowBeanstalk() and basic_CCL_canUseFloatus() and has_shackPack() ) then
        logic = 0
    elseif ( (has("ttrot") or can_clockworkWarp()) and has("fflip") and has("bbust") and has("fpad") or has("fpad") and can_clockworkWarp() and (has_legSpring() or has("tjump") and has_wingWhack()) ) then
        logic = 3
    end
    
    return convertLogic(logic, skip)
end

function jiggy_CCL_trashCan(skip)
    local logic = 99
    --[[        jiggy_trash_can
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.wing_whack(state) and self.flight_pad(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.split_up(state)\
                and (self.flight_pad(state) or self.glide(state))\
                and (self.wing_whack(state) or self.blue_eggs(state) or self.fire_eggs(state) or self.ice_eggs(state))
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.split_up(state)\
                and (self.flight_pad(state) or self.glide(state) or ((self.tall_jump(state) or self.leg_spring(state)) and self.wing_whack(state)))\
                and (self.wing_whack(state) or self.blue_eggs(state) or self.fire_eggs(state) or self.ice_eggs(state))
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.split_up(state)\
                and (self.flight_pad(state) or self.glide(state) or ((self.tall_jump(state) or self.leg_spring(state)) and self.wing_whack(state)))\
                and (self.wing_whack(state) or self.blue_eggs(state) or self.fire_eggs(state) or self.ice_eggs(state))
    --]]
    
    if ( has_wingWhack() and has("fpad") ) then
        logic = 0
    elseif ( has("splitup") and (has("fpad") or has_glide()) and (has_wingWhack() or can_shootEggs("begg") or can_shootEggs("feggs") or can_shootEggs("ieggs")) ) then
        logic = 1
    elseif ( has("splitup") and has_wingWhack() and (has("tjump") or has_legSpring()) ) then
        logic = 2
    end
    
    return convertLogic(logic, skip)
end

function jiggy_CCL_superStash(skip)
    local logic = 99
    --[[        jiggy_superstash
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.clockwork_eggs(state) and self.grip_grab(state) and self.flight_pad(state) and self.flap_flip(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.clockwork_eggs(state) and self.flight_pad(state) and self.flap_flip(state)\
                 and (self.grip_grab(state) or self.veryLongJump(state) and self.climb(state))
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.clockwork_eggs(state) and self.flight_pad(state) and self.flap_flip(state)\
                 and (self.grip_grab(state) or self.veryLongJump(state) and self.climb(state))
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.clockwork_eggs(state)
    --]]
    
    if ( can_shootEggs("ceggs") and has("ggrab") and has("fpad") and has("fflip") ) then
        logic = 0
    elseif ( can_shootEggs("ceggs") and has("fpad") and has("fflip") and can_veryLongJump() and has("climb") ) then
        logic = 1
    elseif ( can_shootEggs("ceggs") ) then
        logic = 3
    end
    
    return convertLogic(logic, skip)
end

function jiggy_CCL_jellyCastle(skip)
    local logic = 99
    --[[
    self.shack_pack(state) and self.climb(state)
    --]]
    
    if ( has_shackPack() and has("climb") ) then
        logic = 0
    end
    
    return convertLogic(logic, skip)
end

----- Notes

function notes_CCL_sackPackSilo(skip)
    local logic = 99
    --[[        notes_ccl_silo
    if self.intended_logic(state):
        logic = self.can_access_sack_pack_silo(state)
    elif self.easy_tricks_logic(state):
        logic = self.can_access_sack_pack_silo(state)\
                or self.clockwork_eggs(state)
    elif self.hard_tricks_logic(state):
        logic = self.can_access_sack_pack_silo(state)\
                or self.clockwork_eggs(state)
    elif self.glitches_logic(state):
        logic = self.can_access_sack_pack_silo(state)\
                or self.clockwork_eggs(state)
    --]]
    
    if ( basic_CCL_canReachSackPackSilo() ) then
        logic = 0
    elseif ( can_shootEggs("ceggs") ) then
        logic = 1
    end
    
    return convertLogic(logic, skip)
end

function notes_CCL_cheeseWedgeExit(skip)
    local logic = 99
    --[[        notes_cheese
    if self.world.options.logic_type == LogicType.option_intended:
        logic = (self.climb(state) and self.sack_pack(state))\
                or self.notes_ccl_high(state)                       -- high notes are always: self.flight_pad(state) or state.has(itemName.HUMBACC, self.player)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = (self.climb(state) and self.sack_pack(state))\
                or self.notes_ccl_high(state)\
                or self.springy_step_shoes(state) and self.split_up(state)\
                or self.claw_clamber_boots and self.glide(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.climb(state)\
                or (self.springy_step_shoes(state))\
                or self.notes_ccl_high(state)\
                or self.clockwork_shot(state)\
                or self.springy_step_shoes(state) and self.split_up(state)\     -- redundant since the same check without split up is in this same conditional
                or self.claw_clamber_boots and self.glide(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.climb(state)\
                or (self.springy_step_shoes(state))\
                or self.notes_ccl_high(state)\
                or self.clockwork_shot(state)\
                or self.springy_step_shoes(state) and self.split_up(state)\
                or self.claw_clamber_boots and self.glide(state)
    --]]
    
    if ( has("climb") and has_sackPack() or has("fpad") or has("humbacc") ) then
        logic = 0
    elseif ( has("springb") and has("splitup") or has("clawbts") and has_glide() ) then
        logic = 1
    elseif ( has("climb") or has("springb") or can_clockworkShot() ) then
        logic = 2
    end
    
    return convertLogic(logic, skip)
end

function notes_CCL_dippyPoolExit(skip)
    local logic = 99
    --[[        notes_dippy
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.dive(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.dive(state) or self.shack_pack(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = True
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = True
    --]]
    
    if ( has("dive") ) then
        logic = 0
    elseif ( has_shackPack() ) then
        logic = 1
    else
        logic = 2
    end
    
    return convertLogic(logic, skip)
end

function notes_CCL_mrFittSackRaceExit(skip)
    local logic = 99
    --[[        notes_sack_race
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.flight_pad(state)\
                or self.long_jump(state) and self.climb(state)\
                or state.has(itemName.HUMBACC, self.player)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.flight_pad(state)\
                or self.climb(state) and (self.long_jump(state) or self.grip_grab(state) or self.pack_whack(state) or self.sack_pack(state))\
                or state.has(itemName.HUMBACC, self.player)\
                or self.claw_clamber_boots
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.flight_pad(state)\
                or self.climb(state) and (self.long_jump(state) or self.grip_grab(state) or self.pack_whack(state) or self.sack_pack(state))\
                or self.leg_spring(state) and (self.glide(state) or self.wing_whack(state))\
                or state.has(itemName.HUMBACC, self.player)\
                or self.claw_clamber_boots
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.flight_pad(state)\
                or self.climb(state) and (self.long_jump(state) or self.grip_grab(state) or self.pack_whack(state) or self.sack_pack(state))\
                or self.leg_spring(state) and (self.glide(state) or self.wing_whack(state))\
                or state.has(itemName.HUMBACC, self.player)\
                or self.claw_clamber_boots
    --]]
    
    if ( has("fpad") or can_longJump() and has("climb") or has("humbacc") ) then
        logic = 0
    elseif ( has("climb") and (has("ggrab") or has_packWhack() or has_sackPack()) or has("clawbts") ) then
        logic = 1
    elseif ( has_legSpring() and (has_glide() or has_wingWhack()) ) then
        logic = 2
    end
    
    return convertLogic(logic, skip)
end

function notes_CCL_high(skip)
    local logic = 99
    --[[        notes_ccl_high
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.flight_pad(state) or state.has(itemName.HUMBACC, self.player)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.flight_pad(state) or state.has(itemName.HUMBACC, self.player)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.flight_pad(state) or state.has(itemName.HUMBACC, self.player)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic =self.flight_pad(state) or state.has(itemName.HUMBACC, self.player)
    --]]
    
    if ( has("fpad") or has("humbacc") ) then
        logic = 0
    end
    
    return convertLogic(logic, skip)
end

----- Nests

function nests_CCL_flight(skip)
    local logic = 99
    --[[        nest_ccl_flight
    self.flight_pad(state) or state.has(itemName.HUMBACC, self.player)
    --]]
    
    if ( has("fpad") or has("humbacc") ) then
        logic = 0
    end
    
    return convertLogic(logic, skip)
end

function nests_CCL_jellyCastle(skip)
    local logic = 99
    --[[        nest_jelly_castle
    self.nest_ccl_flight(state) or self.climb(state) and (self.small_elevation(state) or self.split_up(state))      -- nest_ccl_flight is just: self.flight_pad(state) or state.has(itemName.HUMBACC, self.player)
    --]]
    
    if ( has("fpad") or has("humbacc") or has("climb") and (can_reachSmallElevation() or has("splitup")) ) then
        logic = 0
    end
    
    return convertLogic(logic, skip)
end

function nests_CCL_dippy(skip)
    local logic = 99
    --[[        nest_ccl_dippy
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.nest_ccl_flight(state) or self.dive(state) and self.talon_torpedo(state) and self.flap_flip(state)     -- nest_ccl_flight is just: self.flight_pad(state) or state.has(itemName.HUMBACC, self.player)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = True # Slide from pot of gold token pile
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = True
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = True
    --]]
    
    if ( has("fpad") or has("humbacc") or has("dive") and has("ttorp") and has("fflip") ) then
        logic = 0
    else
        logic = 1
    end
    
    return convertLogic(logic, skip)
end

function nests_CCL_outsideTrashCan(skip)
    local logic = 99
    --[[        nest_outside_trash_can
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.climb(state) and self.tall_jump(state) or self.nest_ccl_flight(state)              -- nest_ccl_flight is just: self.flight_pad(state) or state.has(itemName.HUMBACC, self.player)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.climb(state) and (self.tall_jump(state) or self.pack_whack(state))\
                or (self.flight_pad(state) or self.glide(state))\                                   -- checking for fpad is redundant
                or self.nest_ccl_flight(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.climb(state) and (self.tall_jump(state) or self.pack_whack(state))\
                or (self.flight_pad(state) or self.glide(state) or ((self.tall_jump(state) or self.leg_spring(state)) and self.wing_whack(state)))\
                or self.nest_ccl_flight(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.climb(state) and (self.tall_jump(state) or self.pack_whack(state))\
                or (self.flight_pad(state) or self.glide(state) or ((self.tall_jump(state) or self.leg_spring(state)) and self.wing_whack(state)))\
                or self.nest_ccl_flight(state)
    --]]
    
    if ( has("fpad") or has("humbacc") or has("climb") and has("tjump") ) then
        logic = 0
    elseif ( has("climb") and has_packWhack() or has_glide() ) then
        logic = 1
    elseif ( has_wingWhack() and (has("tjump") or has_legSpring()) ) then
        logic = 2
    end
    
    return convertLogic(logic, skip)
end

function nests_CCL_insideTrashCan(skip)
    local logic = 99
    --[[        nest_inside_trash_can
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.flight_pad(state) and self.leg_spring(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.climb(state) and self.shack_pack(state) and self.pack_whack(state)\
                or self.split_up(state)\                                                                            -- checking for split up here is redundant
                    and (self.flight_pad(state) or self.glide(state) or (self.leg_spring(state) and self.wing_whack(state)))\   -- checking for leg spring here is redundant
                    and self.leg_spring(state)

    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.climb(state) and self.shack_pack(state) and (self.pack_whack(state) or self.tall_jump(state) and self.grip_grab(state))\
                or self.split_up(state)\
                    and (self.flight_pad(state) or self.glide(state) or (self.leg_spring(state) and self.wing_whack(state)))\
                    and (self.leg_spring(state) or (self.glide(state) and self.tall_jump(state) or self.clockwork_shot(state)))

    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.climb(state) and self.shack_pack(state) and (self.pack_whack(state) or self.tall_jump(state) and self.grip_grab(state))\
                or self.split_up(state)\
                    and (self.flight_pad(state) or self.glide(state) or (self.leg_spring(state) and self.wing_whack(state)))\
                    and (self.leg_spring(state) or (self.glide(state) and self.tall_jump(state) or self.clockwork_shot(state)))\
                or self.flight_pad(state) and self.clockwork_warp(state) and self.climb(state)
    --]]
    
    if ( has("fpad") and has_legSpring() ) then
        logic = 0
    elseif ( has("climb") and has_shackPack() and has_packWhack() or has_legSpring() and (has_glide() or has_wingWhack()) ) then
        logic = 1
    elseif ( has("climb") and has_shackPack() and has("tjump") and has("ggrab") or has_glide() and has("tjump") or has("splitup") and has("fpad") and can_clockworkShot() ) then
        logic = 2
    elseif ( has("fpad") and can_clockworkWarp() and has("climb") ) then
        logic = 3
    end
    
    return convertLogic(logic, skip)
end

function nests_CCL_insideCheeseWedge(skip)
    local logic = 99
    --[[
    self.flight_pad(state)
    --]]
    
    if ( has("fpad") ) then
        logic = 0
    elseif ( has("humbacc") ) then
        logic = 7 -- Instant Transform
    end
    
    return convertLogic(logic, skip)
end

function nests_CCL_nearSuperStash(skip)
    local logic = 99
    --[[        nest_near_superstash
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.grip_grab(state) and self.flap_flip(state) or state.has(itemName.HUMBACC, self.player)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.flap_flip(state) and self.grip_grab(state) or self.veryLongJump(state) and (self.climb(state) or self.flight_pad(state))\
                or state.has(itemName.HUMBACC, self.player)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.flap_flip(state) and self.grip_grab(state) or self.veryLongJump(state) and (self.climb(state) or self.flight_pad(state))\
                or self.clockwork_shot(state)\
                or state.has(itemName.HUMBACC, self.player)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.flap_flip(state) and self.grip_grab(state) or self.veryLongJump(state) and (self.climb(state) or self.flight_pad(state))\
                or self.clockwork_shot(state)\
                or state.has(itemName.HUMBACC, self.player)
    --]]
    
    if ( has("ggrab") and has("fflip") or has("humbacc") ) then
        logic = 0
    elseif ( can_veryLongJump() and (has("climb") or has("fpad")) ) then
        logic = 1
    elseif ( can_clockworkShot() ) then
        logic = 2
    end
    
    return convertLogic(logic, skip)
end

function nests_CCL_insidePotOGold(skip)
    local logic = 99
    --[[        nest_pot_of_gold
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.mumboCCL(state) and (self.flap_flip(state) or self.leg_spring(state))
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.mumboCCL(state) and (self.flap_flip(state) or self.leg_spring(state) or self.flight_pad(state))
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = (self.mumboCCL(state) and (self.flap_flip(state) or self.leg_spring(state) or self.flight_pad(state))\
                 or (self.leg_spring(state) or (self.split_up(state) and self.tall_jump(state))) and self.flight_pad(state) and self.beak_bomb(state))
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = (self.mumboCCL(state) and (self.flap_flip(state) or self.leg_spring(state) or self.flight_pad(state))\
                 or (self.leg_spring(state) or (self.split_up(state) and self.tall_jump(state))) and self.flight_pad(state) and self.beak_bomb(state))
    --]]
    
    if ( basic_CCL_mumbo() and (has("fflip") or has_legSpring()) ) then
        logic = 0
    elseif ( basic_CCL_mumbo() and has("fpad") ) then
        logic = 1
    elseif ( (has_legSpring() or has("splitup") and has("tjump")) and has("fpad") and has("bbomb") ) then
        logic = 2
    end
    
    return convertLogic(logic, skip)
end

----- Signs

function signs_CCL_underwater(skip)
    local logic = 99
    --[[        signpost_ccl_underwater
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.dive(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.dive(state) or self.shack_pack(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.dive(state) or self.shack_pack(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.dive(state) or self.shack_pack(state)
    --]]
    
    if ( has("dive") ) then
        logic = 0
    elseif ( has_shackPack() ) then
        logic = 1
    end
    
    return convertLogic(logic, skip)
end

function signs_CCL_onCentralCavernPoolRim(skip)
    local logic = 99
    --[[        signpost_pool_rim
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.flap_flip(state) and self.grip_grab(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = True
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = True
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = True
    --]]
    
    if ( has("fflip") and has("ggrab") ) then
        logic = 0
    else
        logic = 1
    end
    
    return convertLogic(logic, skip)
end

----- Other - Jinjos

function jinjo_CCL_trashCan(skip)
    local logic = 99
    --[[        jinjo_trash_can
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.shack_pack(state) and self.climb(state) and self.tall_jump(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.shack_pack(state) and self.climb(state) and (self.tall_jump(state) or self.pack_whack(state))\
                or (self.flight_pad(state) or self.glide(state)) and self.leg_spring(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.shack_pack(state) and self.climb(state) and (self.tall_jump(state) or self.pack_whack(state))\
                or self.split_up(state)\
                    and (self.flight_pad(state) or self.glide(state) or ((self.tall_jump(state) or self.leg_spring(state)) and self.wing_whack(state)))\
                    and (self.leg_spring(state) or (self.glide(state) and self.tall_jump(state) or self.clockwork_shot(state)))
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.shack_pack(state) and self.climb(state) and (self.tall_jump(state) or self.pack_whack(state))\
                or self.split_up(state)\
                    and (self.flight_pad(state) or self.glide(state) or ((self.tall_jump(state) or self.leg_spring(state)) and self.wing_whack(state)))\
                    and (self.leg_spring(state) or (self.glide(state) and self.tall_jump(state) or self.clockwork_shot(state)))
    --]]
    
    if ( has_shackPack() and has("climb") and has("tjump") ) then
        logic = 0
    elseif ( has_shackPack() and has("climb") and has_packWhack() or has_legSpring() and (has("fpad") or has_glide()) ) then
        logic = 1
    elseif ( has_legSpring() and has_wingWhack() or has("splitup") and (has("fpad") or has_glide() or has_wingWhack() and has("tjump")) and (has_glide() and has("tjump") or can_clockworkShot()) ) then
        logic = 2
    end
    
    return convertLogic(logic, skip)
end

function jinjo_CCL_cheeseWedge(skip)
    local logic = 99
    --[[        jinjo_cheese
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.flight_pad(state) and (self.sack_pack(state) and self.grow_beanstalk(state) and \              -- grow_beanstalk requires fpad
                 self.can_use_floatus(state))
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.flight_pad(state) and ((self.sack_pack(state) and self.grow_beanstalk(state) and \
                 self.can_use_floatus(state)) or self.leg_spring(state))
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.flight_pad(state) and ((self.sack_pack(state) and self.grow_beanstalk(state) and \
                 self.can_use_floatus(state)) or self.clockwork_shot(state) or self.leg_spring(state))
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.flight_pad(state) and ((self.sack_pack(state) and self.grow_beanstalk(state) and \
                 self.can_use_floatus(state)) or self.clockwork_shot(state) or self.leg_spring(state))
    --]]
    
    if ( has_sackPack() and basic_CCL_canGrowBeanstalk() and basic_CCL_canUseFloatus() ) then
        logic = 0
    elseif ( has("fpad") and has_legSpring() ) then
        logic = 1
    elseif ( has("fpad") and can_clockworkShot() ) then
        logic = 2
    elseif ( has("humbacc") and can_clockworkShot() ) then
        logic = 7 -- Instant Transform
    end
    
    return convertLogic(logic, skip)
end

function jinjo_CCL_centralCavern(skip)
    local logic = 99
    --[[        jinjo_central
     if self.world.options.logic_type == LogicType.option_intended:
        logic = self.split_up(state) and self.spring_pad(state)\
                or state.has(itemName.HUMBACC, self.player)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.split_up(state) and (self.spring_pad(state) or self.flight_pad(state))\
                or self.springy_step_shoes(state) and self.bill_drill(state) and (self.flutter(state) or self.air_rat_a_tat_rap(state) or self.split_up(state))\
                or self.leg_spring(state)\
                or state.has(itemName.HUMBACC, self.player)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.split_up(state) and (self.spring_pad(state) or self.flight_pad(state))\
                or self.clockwork_shot(state)\
                or self.springy_step_shoes(state) and (self.flutter(state) or self.air_rat_a_tat_rap(state) or self.split_up(state))\
                    and (
                        self.bill_drill(state)\
                        or not self.world.options.randomize_warp_pads\
                        or state.has(itemName.WARPCC1, self.player) and state.has(itemName.WARPCC2, self.player)
                    )\
                or self.leg_spring(state)\
                or state.has(itemName.HUMBACC, self.player)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.split_up(state) and (self.spring_pad(state) or self.flight_pad(state))\
                or self.clockwork_shot(state)\
                or self.springy_step_shoes(state) and (self.flutter(state) or self.air_rat_a_tat_rap(state) or self.split_up(state))\
                    and (
                        self.bill_drill(state)\
                        or not self.world.options.randomize_warp_pads\
                        or state.has(itemName.WARPCC1, self.player) and state.has(itemName.WARPCC2, self.player)
                    )\
                or self.leg_spring(state)\
                or state.has(itemName.HUMBACC, self.player)
     --]]
    
    if ( has("splitup") and has("tjump") or has("humbacc") ) then
        logic = 0
    elseif ( has("splitup") and has("fpad") or has("springb") and has_billDrill() and (has("flutter") or has("arat") or has("splitup")) or has_legSpring() ) then
        logic = 1
    elseif ( can_clockworkShot() or has("springb") and (has("flutter") or has("arat") or has("splitup")) and (has("randomizewarppads_off") or has("warpcc1") and has("warpcc2")) ) then
        logic = 2
    end
    
    return convertLogic(logic, skip)
end

function jinjo_CCL_inHumbasWigwam(skip)
    local logic = 99
    --[[        jinjo_humba_ccl
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.climb(state) or state.has(itemName.HUMBACC, self.player)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.climb(state) or state.has(itemName.HUMBACC, self.player) or self.leg_spring(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.climb(state) or state.has(itemName.HUMBACC, self.player) or self.leg_spring(state) or self.clockwork_shot(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.climb(state) or state.has(itemName.HUMBACC, self.player) or self.leg_spring(state) or self.clockwork_shot(state)
    --]]
    
    if ( has("climb") or has("humbacc") ) then
        logic = 0
    elseif ( has_legSpring() ) then
        logic = 1
    elseif ( can_clockworkShot() ) then
        logic = 2
    end
    
    return convertLogic(logic, skip)
end

----- Other - Glowbos

function glowbo_CCL_outdoorPool(skip)
    local logic = 99
    --[[        ccl_glowbo_pool
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.dive(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = True
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = True # Jumping in the pool outside and going through the loading zone gives dive for free.
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = True
    --]]
    
    if ( has("dive") ) then
        logic = 0
    else
        logic = 1
    end
    
    return convertLogic(logic, skip)
end

function glowbo_CCL_cavernPool(skip)
    local logic = 99
    --[[        glowbo_cavern
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.small_elevation(state) and self.dive(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.dive(state) or self.shack_pack(state) and self.tall_jump(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.dive(state) or self.shack_pack(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.dive(state) or self.shack_pack(state)
    --]]
    
    if ( can_reachSmallElevation() and has("dive") ) then
        logic = 0
    elseif ( has("dive") or has_shackPack() and has("tjump") ) then
        logic = 1
    elseif ( has_shackPack() ) then
        logic = 2
    end
    
    return convertLogic(logic, skip)
end

----- Other - Honeycombs

function honeycomb_CCL_onTrashCan(skip)
    local logic = 99
    --[[        honeycomb_trash
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.flight_pad(state) or state.has(itemName.HUMBACC, self.player)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.flight_pad(state) or self.glide(state) or state.has(itemName.HUMBACC, self.player)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.flight_pad(state) or self.glide(state) or state.has(itemName.HUMBACC, self.player)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.flight_pad(state) or self.glide(state) or state.has(itemName.HUMBACC, self.player)
    --]]
    
    if ( has("fpad") or has("humbacc") ) then
        logic = 0
    elseif ( has_glide() ) then
        logic = 1
    end
    
    return convertLogic(logic, skip)
end

function honeycomb_CCL_behindPotOGold(skip)
    local logic = 99
    --[[        honeycomb_pot
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.flight_pad(state) or state.has(itemName.HUMBACC, self.player)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = (self.flight_pad(state) or self.wing_whack(state) or self.glide(state)) or state.has(itemName.HUMBACC, self.player)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = (self.flight_pad(state) or self.wing_whack(state) or self.glide(state)) or state.has(itemName.HUMBACC, self.player)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = (self.flight_pad(state) or self.wing_whack(state) or self.glide(state)) or state.has(itemName.HUMBACC, self.player)
    --]]
    
    if ( has("fpad") or has("humbacc") ) then
        logic = 0
    elseif ( has_wingWhack() or has_glide() ) then
        logic = 1
    end
    
    return convertLogic(logic, skip)
end

----- Other - Cheato Pages

----- Other

function other_CCL_mrFittHighJump(skip)
    local logic = 99
    --[[        mr_fit_high_jump
    if self.intended_logic(state):
        logic = self.springy_step_shoes(state) and self.bill_drill(state)
    elif self.easy_tricks_logic(state):
        logic = self.springy_step_shoes(state) and self.bill_drill(state) or state.has(itemName.HUMBACC, self.player)
    elif self.hard_tricks_logic(state):
        logic = (self.springy_step_shoes(state) and self.bill_drill(state))\
                or self.flight_pad(state)\
                or self.clockwork_shot(state)\
                or state.has(itemName.HUMBACC, self.player)
    elif self.glitches_logic(state):
        logic = (self.springy_step_shoes(state) and self.bill_drill(state))\
                or self.flight_pad(state)\
                or self.clockwork_shot(state)\
                or state.has(itemName.HUMBACC, self.player)
    --]]
    
    if ( has("springb") and has_billDrill() ) then
        logic = 0
    elseif ( has("humbacc") ) then
        logic = 1
    elseif ( has("fpad") or can_clockworkShot() ) then
        logic = 2
    end
    
    return convertLogic(logic, skip)
end

function other_CCL_mrFittSackRace(skip)
    local logic = 99
    --[[        mr_fit_sack_race
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.mr_fit_high_jump(state) and self.sack_pack(state) and \
                self.grow_beanstalk(state) and self.can_use_floatus(state) and self.climb(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.mr_fit_high_jump(state) and self.sack_pack(state) and self.grow_beanstalk(state) \
                and self.can_use_floatus(state) and self.climb(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.mr_fit_high_jump(state) and self.sack_pack(state) and \
                self.grow_beanstalk(state) and (self.can_use_floatus(state) or self.pack_whack(state))\
                and self.climb(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.mr_fit_high_jump(state) and self.sack_pack(state) and \
                self.grow_beanstalk(state) and (self.can_use_floatus(state) or self.pack_whack(state))\
                and self.climb(state)
    --]]
    
    local highJump = other_CCL_mrFittHighJump(true)
    
    if ( highJump <= logictype.CurrentStage and has_sackPack() and basic_CCL_canGrowBeanstalk() and basic_CCL_canUseFloatus() and has("climb") ) then
        logic = 0 -- Normal Logic
    elseif ( highJump < 2 and has_sackPack() and basic_CCL_canGrowBeanstalk() and basic_CCL_canUseFloatus() and has("climb") ) then
        logic = 1 -- Sequence Breaking
    elseif ( highJump <= logictype.CurrentStage and has_sackPack() and basic_CCL_canGrowBeanstalk() and has_packWhack() and has("climb") ) then
        logic = 2 -- Normal Logic
    
    -- Sequence Breaking
    elseif ( has_sackPack() and basic_CCL_canGrowBeanstalk() and (basic_CCL_canUseFloatus() or has_packWhack()) and has("climb") ) then
        logic = math.max(2, highJump)
    end
    
    return convertLogic(logic, skip)
end