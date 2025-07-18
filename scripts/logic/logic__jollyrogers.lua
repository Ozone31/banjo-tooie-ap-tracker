--------------- Jolly Roger Lagoon

----- Basic & Access functions

function basic_JRL_canGetAirFromWarping()
    --[[
    return state.has(itemName.WARPJR1, self.player)\
            or state.has(itemName.WARPJR2, self.player) and self.dive(state)\
            or state.has(itemName.WARPJR4, self.player) and self.dive(state)
    --]]
    
    return has("randomizewarppads_off") or has("warpjr1") or has("warpjr2") and has("dive") or has("warpjr4") and has("dive")
end

function access_JRL_canEnterGIWasteDisposal(skip)
    local logic = 99
    --[[        jrl_waste_disposal
     if self.intended_logic(state):
        logic = (self.has_explosives(state) or self.bill_drill(state))\
                    and (self.talon_trot(state)\
                         or self.tall_jump(state) and (self.flutter(state) or self.air_rat_a_tat_rap(state))
                    )
    elif self.easy_tricks_logic(state):
        logic = (self.has_explosives(state) or self.bill_drill(state))\
                and (self.talon_trot(state)\
                    or self.tall_jump(state) and (self.flutter(state) or self.air_rat_a_tat_rap(state))\
                    or state.has(itemName.DOUBLOON, self.player, 28) and self.turbo_trainers(state)
                )
    elif self.hard_tricks_logic(state):
        logic = (self.has_explosives(state) or self.bill_drill(state))\
                and (self.talon_trot(state)\
                    or self.tall_jump(state) and (self.flutter(state) or self.air_rat_a_tat_rap(state))\
                    or state.has(itemName.DOUBLOON, self.player, 28) and self.turbo_trainers(state)
                )
    elif self.glitches_logic(state):
        logic = (self.has_explosives(state) or self.bill_drill(state))\
                and (self.talon_trot(state)\
                    or self.tall_jump(state) and (self.flutter(state) or self.air_rat_a_tat_rap(state))\
                    or state.has(itemName.DOUBLOON, self.player, 28) and self.turbo_trainers(state)
                )
     --]]
    
    explosives = can_shootExplosiveEggs(true)
    
    -- Normal Logic
    if ( (explosives <= logictype.CurrentStage or has_billDrill()) and (has("ttrot") or has("tjump") and (has("flutter") or has("arat"))) ) then
        logic = 0
    elseif ( (explosives <= logictype.CurrentStage or has_billDrill()) and has("doubloon", 28) and has("ttrain") ) then
        logic = 1
    
    -- Sequence Breaking
    elseif ( has("ttrot") or has("tjump") and has("roll") and has("flutter") or has("doubloon", 28) and has("ttrain") ) then
        logic = math.max(1, explosives)
    elseif ( (explosives <= 7 or has_billDrill()) and has("clawbts") and load_jrl_jrl() and has("jra") ) then
        logic = 7 -- smuggle clawbts from cliff top
    elseif ( (explosives <= 7 or has_billDrill()) and has("clawbts") and (load_hfp_jrl() and has("hfa") or load_ggm_jrl() and has("gga") or connector_PL_to_PG(true) <= 7 and load_ww_jrl() and has("wwa")) ) then
        logic = 7 -- smuggle clawbts from cliff top into hfp entrance, ggm entrance, or ww entrance
    elseif ( (explosives <= 7 or has_billDrill()) and (has("clawbts") and (load_gi_jrl() and has("gia") or load_ck_jrl() and has("cka")) or has("springb") and (load_tdl_jrl() and has("tda") or load_ccl_jrl() and has("cca")) or has("ttrain") and load_mt_jrl() and has("mta")) ) then
        logic = 7 -- smuggle clawbts from quagmire if GI or CK take you to JRL, or springb from wasteland if either TDL or CCL take you to JRL, or ttrain from spiral mountain if MT takes you to JRL
    end
    
    return convertLogic(logic, skip)
end

function access_JRL_humba(skip)
    local logic = 99
    --[[        humbaJRL
    state.can_reach_region(regionName.JRAT, self.player) and state.has(itemName.HUMBAJR, self.player)
    --]]
    
    if ( has("humbajr") ) then
        local jrlAAccessibility = Tracker:FindObjectForCode("@Region: Jolly Roger's Lagoon - Atlantis").AccessibilityLevel
        
        -- Normal Logic
        if ( jrlAAccessibility == AccessibilityLevel.Normal or jrlAAccessibility == AccessibilityLevel.Cleared ) then
            logic = 0
            
        -- Sequence Breaking
        elseif ( jrlAAccessibility > AccessibilityLevel.None ) then
            logic = logictype.CurrentStage + 1 -- was already converted once by the json
        end
    end
    
    return convertLogic(logic, skip)
end

function access_JRL_canPassOctopi(skip)
    local logic = 99
    --[[        can_pass_octopi
    if self.world.options.logic_type == LogicType.option_intended:
        return self.ice_eggs_item(state) and self.check_mumbo_magic(state, itemName.MUMBOJR) and self.sub_aqua_egg_aiming(state)\
                or self.humbaJRL(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        return self.ice_eggs_item(state) and (self.doubleAir(state) or self.check_mumbo_magic(state, itemName.MUMBOJR)) and self.sub_aqua_egg_aiming(state)\
                or self.humbaJRL(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        return True
    elif self.world.options.logic_type == LogicType.option_glitches:
        return True
    --]]
    
    jrlHumba = access_JRL_humba(true)
    
    if ( has("ieggs") and has("mumbojr") and has("auqaim") or jrlHumba <= logictype.CurrentStage ) then
        logic = 0
    elseif ( has("ieggs") and has("dair") and has("auqaim") or jrlHumba < 2 ) then
        logic = 1
    else
        logic = 2
    end
    
    return convertLogic(logic, skip)
end

function access_JRL_canEscapeSunkenShip(skip)
    local logic = 99
    --[[        can_escape_sunken_ship
    if self.world.options.logic_type == LogicType.option_intended:
        return self.ice_eggs_item(state) and self.check_mumbo_magic(state, itemName.MUMBOJR) and self.sub_aqua_egg_aiming(state)\
                or self.humbaJRL(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        return self.ice_eggs_item(state) and self.check_mumbo_magic(state, itemName.MUMBOJR) and self.sub_aqua_egg_aiming(state)\
                or self.ice_eggs_item(state) and self.doubleAir(state) and self.sub_aqua_egg_aiming(state)\
                    and self.air_pit_from_jrl_warp_pads(state) and state.has(itemName.WARPJR3, self.player)\
                or self.humbaJRL(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        return self.check_mumbo_magic(state, itemName.MUMBOJR)\
                or self.air_pit_from_jrl_warp_pads(state) and state.has(itemName.WARPJR3, self.player)\
                or self.humbaJRL(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        return self.check_mumbo_magic(state, itemName.MUMBOJR)\
                or self.air_pit_from_jrl_warp_pads(state) and state.has(itemName.WARPJR3, self.player)\
                or self.humbaJRL(state)
    --]]
    
    jrlHumba = access_JRL_humba(true)
    
    -- Normal Logic
    if ( has("ieggs") and has("mumbojr") and has("auqaim") or jrlHumba <= logictype.CurrentStage ) then
        logic = 0
    elseif ( has("ieggs") and has("dair") and has("auqaim") and basic_JRL_canGetAirFromWarping() and (has("warpjr3") or has("randomizewarppads_off")) or jrlHumba < 2 ) then
        logic = 1
    elseif ( has("mumbojr") or basic_JRL_canGetAirFromWarping() and (has("warpjr3") or has("randomizewarppads_off")) ) then
        logic = 2
        
    -- Sequence Breaking
    else
        logic = jrlHumba
    end
    
    return convertLogic(logic, skip)
end

function access_JRL_canEscapeFromLockerCavern(skip)
    local logic = 99
    --[[        can_escape_from_locker_cavern
    if self.world.options.logic_type == LogicType.option_intended:
        return self.ice_eggs_item(state) and self.check_mumbo_magic(state, itemName.MUMBOJR) and self.sub_aqua_egg_aiming(state)\
                or self.humbaJRL(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        return self.ice_eggs_item(state) and self.check_mumbo_magic(state, itemName.MUMBOJR) and self.sub_aqua_egg_aiming(state)\
                or self.ice_eggs_item(state) and self.doubleAir(state) and self.sub_aqua_egg_aiming(state)\
                    and self.air_pit_from_jrl_warp_pads(state) and state.has(itemName.WARPJR5, self.player)\
                or self.humbaJRL(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        return self.check_mumbo_magic(state, itemName.MUMBOJR)\
                or self.air_pit_from_jrl_warp_pads(state) and state.has(itemName.WARPJR5, self.player)\
                or self.humbaJRL(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        return self.check_mumbo_magic(state, itemName.MUMBOJR)\
                or self.air_pit_from_jrl_warp_pads(state) and state.has(itemName.WARPJR5, self.player)\
                or self.humbaJRL(state)
    --]]
    
    jrlHumba = access_JRL_humba(true)
    
    -- Normal Logic
    if ( has("ieggs") and has("mumbojr") and has("auqaim") or jrlHumba <= logictype.CurrentStage ) then
        logic = 0
    elseif ( has("ieggs") and has("dair") and has("auqaim") and basic_JRL_canGetAirFromWarping() and (has("warpjr5") or has("randomizewarppads_off")) or jrlHumba < 2 ) then
        logic = 1
    elseif ( has("mumbojr") or basic_JRL_canGetAirFromWarping() and (has("warpjr5") or has("randomizewarppads_off")) ) then
        logic = 2
        
    -- Sequence Breaking
    else
        logic = jrlHumba
    end
    
    return convertLogic(logic, skip)
end

function access_JRL_canClimbSeaweedSanctum(skip)
    local logic = 99
    --[[        can_climb_seaweed
     if self.world.options.logic_type == LogicType.option_intended:
        return self.tall_jump(state) and self.grip_grab(state) and self.dive(state) and self.flap_flip(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        return self.dive(state)\
                and self.flap_flip(state)\
                and self.tall_jump(state)\
                and (self.beak_buster(state) or self.grip_grab(state))
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        return self.dive(state)\
                and self.flap_flip(state)\
                and self.tall_jump(state)\
                and (self.beak_buster(state) or self.grip_grab(state))
    elif self.world.options.logic_type == LogicType.option_glitches:
        return self.dive(state)\
                and self.flap_flip(state)\
                and self.tall_jump(state)\
                and (self.beak_buster(state) or self.grip_grab(state))
     --]]
    
    if ( has("tjump") and has("ggrab") and has("dive") and has("fflip") ) then
        logic = 0
    elseif ( has("tjump") and has("bbust") and has("dive") and has("fflip") ) then
        logic = 1
    end
    
    return convertLogic(logic, skip)
end

----- Silos

function silo_JRL_subAquaEggAiming(skip)
    local logic = 99
    --[[
    (self.has_explosives(state) or state.has(itemName.DOUBLOON, self.player, 28)) and self.check_notes(state, locationName.AUQAIM)
    --]]
    
    local explosives = can_shootExplosiveEggs(true)
    
    -- Normal Logic
    if ( auqaim_count() and (explosives <= logictype.CurrentStage or has("doubloon", 28)) ) then
        logic = 0
    
    -- Sequence Breaking
    elseif ( auqaim_count() ) then
        logic = explosives
    end
    
    return convertLogic(logic, skip)
end

function silo_JRL_talonTorpedo(skip)
    local logic = 99
    --[[
    self.can_access_talon_torpedo_silo(state) and self.check_notes(state, locationName.TTORP)
    
    if self.world.options.logic_type == LogicType.option_intended:
        return self.grip_grab(state) and self.tall_jump(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        return (self.grip_grab(state) or self.beak_buster(state)) and self.tall_jump(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        return (self.grip_grab(state) or self.beak_buster(state)) and self.tall_jump(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        return (self.grip_grab(state) or self.beak_buster(state)) and self.tall_jump(state)
    --]]
    
    if ( ttorp_count() and has("ggrab") and has("tjump") ) then
        logic = 0
    elseif ( ttorp_count() and has("bbust") and has("tjump") ) then
        logic = 1
    elseif ( ttorp_count() ) then
        local humba = access_JRL_humba(true)
        if ( humba < 99 ) then
            logic = 7 -- you can beach yourself on the ledge with the sub, and then instant transform
        end
    end
    
    return convertLogic(logic, skip)
end

function silo_JRL_wingWhack(skip)
    local logic = 99
    --[[
    (self.has_explosives(state)) and self.split_up(state) and self.check_notes(state, locationName.WWHACK)
    --]]
    
    local explosives = can_shootExplosiveEggs(true)
    
    -- Normal Logic
    if ( wwhack_count() and has("splitup") and explosives <= logictype.CurrentStage ) then
        logic = 0
    
    -- Sequence Breaking
    elseif ( wwhack_count() and has("splitup") ) then
        logic = explosives
    end
    
    return convertLogic(logic, skip)
end

----- Warp Pads

----- Jiggies

function jiggy_JRL_subChallenge(skip)
    local logic = 99
    --[[        jiggy_sub_challenge
     self.humbaJRL(state)
    --]]
    
    logic = access_JRL_humba(true)
    
    return convertLogic(logic, skip)
end

function jiggy_JRL_tiptup(skip)
    local logic = 99
    --[[        jiggy_tiptup
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.hatch(state) and self.has_explosives(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.hatch(state) and self.has_explosives(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.hatch(state) and self.has_explosives(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.hatch(state) and self.has_explosives(state)
    --]]
    
    local explosives = can_shootExplosiveEggs(true)
    
    -- Normal Logic
    if ( has_hatch() and explosives <= logictype.CurrentStage ) then
        logic = 0
    
    -- Sequence Breaking
    elseif ( has_hatch() ) then
        logic = explosives
    end
    
    return convertLogic(logic, skip)
end

function jiggy_JRL_chrisPBacon(skip)
    local logic = 99
    --[[        jiggy_bacon
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.sub_aqua_egg_aiming(state) and self.has_linear_egg(state) and state.has(itemName.MUMBOJR, self.player)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.sub_aqua_egg_aiming(state) and self.has_linear_egg(state)\
                    and (state.has(itemName.MUMBOJR, self.player) or self.doubleAir(state))
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = (self.sub_aqua_egg_aiming(state) and self.has_linear_egg(state)) or \
            (self.humbaJRL(state) and self.egg_aim(state) and self.has_linear_egg(state))
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = (self.sub_aqua_egg_aiming(state) and self.has_linear_egg(state)) or \
            (self.humbaJRL(state) and self.egg_aim(state) and self.has_linear_egg(state))
    --]]
    
    local humba = access_JRL_humba(true)
    
    -- Normal Logic
    if ( has("auqaim") and can_shootLinearEggs() and has("mumbojr") ) then
        logic = 0
    elseif ( has("auqaim") and can_shootLinearEggs() and has("dair") ) then
        logic = 1
    elseif ( has("auqaim") and can_shootLinearEggs() or humba <= logictype.CurrentStage and has("eggaim") and can_shootLinearEggs() ) then
        logic = 2
    
    -- Sequence Breaking
    elseif ( has("eggaim") and can_shootLinearEggs() ) then
        logic = math.max(2, humba)
    end
    
    return convertLogic(logic, skip)
end

function jiggy_JRL_pigPool(skip)
    local logic = 99
    --[[        jiggy_pig_pool
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.HFP_hot_water_cooled(state)\
                and self.jrl_waste_disposal(state)\
                and self.flap_flip(state)\
                and (self.has_explosives(state) or self.beak_barge(state))
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.HFP_hot_water_cooled(state)\
                and self.jrl_waste_disposal(state)\
                and (self.flap_flip(state)\
                    or self.tall_jump(state) and self.beak_buster(state)\
                    or self.talon_trot(state) and self.flutter(state) and self.beak_buster(state)
                )\
                and (self.has_explosives(state)\
                    or self.beak_barge(state)\
                    or self.dragon_kazooie(state) and self.ground_rat_a_tat_rap(state)\
                )
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.HFP_hot_water_cooled(state)\
                and self.jrl_waste_disposal(state)\
                and ((self.flap_flip(state)\
                    or self.tall_jump(state) and self.beak_buster(state)\
                    or self.talon_trot(state) and self.flutter(state) and self.beak_buster(state)\
                    or self.tall_jump(state) and self.flutter(state)\
                    or self.extremelyLongJump(state)\
                    ) and (
                        self.has_explosives(state)\
                        or self.beak_barge(state)\
                        or self.dragon_kazooie(state) and self.ground_rat_a_tat_rap(state)\
                    )\
                    or self.clockwork_shot(state)
                )
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.HFP_hot_water_cooled(state)\
                and self.jrl_waste_disposal(state)\
                and ((self.flap_flip(state)\
                    or self.tall_jump(state) and self.beak_buster(state)\
                    or self.talon_trot(state) and self.flutter(state) and self.beak_buster(state)\
                    or self.tall_jump(state) and self.flutter(state)\
                    or self.extremelyLongJump(state)\
                    ) and (
                        self.has_explosives(state)\
                        or self.beak_barge(state)\
                        or self.dragon_kazooie(state) and self.ground_rat_a_tat_rap(state)\
                    )\
                    or self.clockwork_shot(state)
                )
    --]]
    
    local canCoolHotWater = access_HFP_canCoolHotWater(true)
    local canEnterGIWasteDisposal = access_JRL_canEnterGIWasteDisposal(true)
    local explosives = can_shootExplosiveEggs(true)
    local dragonKazooie = can_getDragonKazooie(true)
    local extremelyLongJump = can_extremelyLongJump(true)
    local sequenceBreak = 0
    
    -- Normal Logic
    if ( canCoolHotWater <= logictype.CurrentStage and canEnterGIWasteDisposal <= logictype.CurrentStage ) then
        if ( has("fflip") and (has("bbarge") or explosives <= logictype.CurrentStage) ) then
            logic = 0
        elseif ( (has("fflip") or has("tjump") and has("bbust") or has("ttrot") and has("flutter") and has("bbust")) and (has("bbarge") or explosives <= logictype.CurrentStage or has("grat") and dragonKazooie <= logictype.CurrentStage) ) then
            logic = 1
        elseif ( has("fflip") and explosives < 2 ) then
            logic = 1 -- Sequence Breaking
        elseif ( can_clockworkShot() or (has("fflip") or has("tjump") and has("bbust") or has("ttrot") and has("flutter") and has("bbust") or has("tjump") and has("flutter") or extremelyLongJump <= logictype.CurrentStage) and (has("bbarge") or explosives <= logictype.CurrentStage or has("grat") and dragonKazooie <= logictype.CurrentStage) ) then
            logic = 2
            
        -- Sequence Breaking
        else
            sequenceBreak = 1
        end
    else
        sequenceBreak = 1
    end
    
    if ( sequenceBreak == 1 ) then
        local jumpMethod_normal = 99
        if ( has("fflip") or has("tjump") and has("bbust") or has("ttrot") and has("flutter") and has("bbust") or has("tjump") and has("flutter") ) then
            jumpMethod_normal = 2
        end
        
        local attackMethod_normal = 99
        if ( has("bbarge") ) then
            attackMethod_normal = 2
        end
        
        local attackMethod_dragon = 99
        if ( has("grat") ) then
            attackMethod_dragon = dragonKazooie
        end
        
        logic = math.max(2, canCoolHotWater, canEnterGIWasteDisposal, math.min(jumpMethod_normal, extremelyLongJump), math.min(attackMethod_normal, attackMethod_dragon, explosives))
    end
    
    return convertLogic(logic, skip)
end

function jiggy_JRL_smugglersCavern(skip)
    local logic = 99
    --[[        jiggy_smuggler
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.has_explosives(state) and \
                 self.split_up(state) and self.glide(state)             -- split up and glide is redundant, glide requires split up
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.has_explosives(state) and \
                 self.split_up(state) and self.glide(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.has_explosives(state) and \
                 self.split_up(state) and self.glide(state)\
                 or self.clockwork_shot(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.has_explosives(state) and \
                 self.split_up(state) and self.glide(state)\
                 or self.clockwork_shot(state)
    --]]
    
    local explosives = can_shootExplosiveEggs(true)
    
    -- Normal Logic
    if ( explosives <= logictype.CurrentStage and has_glide() ) then
        logic = 0
    elseif ( explosives < 2 and has_glide() ) then
        logic = 1 -- Sequence Breaking
    elseif ( can_clockworkShot() ) then
        logic = 2
    
    -- Sequence Breaking
    elseif ( has_glide() ) then
        logic = explosives
    end
    
    return convertLogic(logic, skip)
end

function jiggy_JRL_merryMaggie(skip)
    local logic = 99
    --[[        jiggy_merry_maggie
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.sub_aqua_egg_aiming(state) and self.has_linear_egg(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.sub_aqua_egg_aiming(state) and self.has_linear_egg(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = (self.sub_aqua_egg_aiming(state) or self.egg_aim(state)) and self.has_linear_egg(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = (self.sub_aqua_egg_aiming(state) or self.egg_aim(state)) and self.has_linear_egg(state)
    --]]
    
    if ( has_linearEgg() and has("auqaim") ) then
        logic = 0
    elseif ( has_linearEgg() and has("eggaim") ) then
        logic = 2
    end
    
    return convertLogic(logic, skip)
end

function jiggy_JRL_lordWooFakFak(skip)
    local logic = 99
    --[[        jiggy_lord_woo
     if self.world.options.logic_type == LogicType.option_intended:
        logic = state.can_reach_region(regionName.JR, self.player) and (
                    self.sub_aqua_egg_aiming(state) and self.grenade_eggs(state)\
                    and (self.humbaJRL(state) or state.has(itemName.MUMBOJR, self.player))
                )
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = state.can_reach_region(regionName.JR, self.player) and (
                    self.sub_aqua_egg_aiming(state) and self.grenade_eggs(state)\
                    and (self.humbaJRL(state) or state.has(itemName.MUMBOJR, self.player))
                )
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.grenade_eggs(state) and self.sub_aqua_egg_aiming(state) and (
                    self.talon_torpedo(state) and self.doubleAir(state)\
                    or state.can_reach_region(regionName.JR, self.player)\
                    and (self.humbaJRL(state) or state.has(itemName.MUMBOJR, self.player))
                )
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.grenade_eggs(state) and self.sub_aqua_egg_aiming(state) and (
                    self.talon_torpedo(state) and self.doubleAir(state)\
                    or state.can_reach_region(regionName.JR, self.player)\
                    and (self.humbaJRL(state) or state.has(itemName.MUMBOJR, self.player))
                )
     --]]
    
    -- Normal Logic
    if ( has("auqaim") and has("geggs") ) then
        local jrlAccessibility = Tracker:FindObjectForCode("@Region: Jolly Roger's Lagoon - Main Area").AccessibilityLevel
        local humba = access_JRL_humba(true)
    
        if ( (jrlAccessibility == AccessibilityLevel.Normal or jrlAccessibility == AccessibilityLevel.Cleared) and (humba <= logictype.CurrentStage or has("mumbojr")) ) then
            logic = 0
        elseif ( (jrlAccessibility == AccessibilityLevel.Normal or jrlAccessibility == AccessibilityLevel.Cleared or jrlAccessibility > AccessibilityLevel.None and logictype.CurrentStage == 0) and humba < 2 ) then
            logic = 1 -- Sequence Breaking
        elseif ( has("ttorp") and has("dair") ) then
            logic = 2
        
        -- Sequence Breaking
        elseif ( jrlAccessibility == AccessibilityLevel.Normal or jrlAccessibility == AccessibilityLevel.Cleared ) then
            logic = humba
        elseif ( jrlAccessibility > AccessibilityLevel.None ) then
            logic = math.max(humba, logictype.CurrentStage + 1)
        end
    end
    
    return convertLogic(logic, skip)
end

function jiggy_JRL_seemee(skip)
    local logic = 99
    --[[        jiggy_see_mee
    self.talon_torpedo(state)
    --]]
    
    if ( has("ttorp") ) then
        logic = 0
    end
    
    return convertLogic(logic, skip)
end

function jiggy_JRL_pawno(skip)
    local logic = 99
    --[[        jiggy_pawno
    if self.world.options.logic_type == LogicType.option_intended:
        logic = state.has(itemName.DOUBLOON, self.player, 23) and self.small_elevation(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = state.has(itemName.DOUBLOON, self.player, 23) and self.small_elevation(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = state.has(itemName.DOUBLOON, self.player, 23) and (self.small_elevation(state) or self.clockwork_shot(state))
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = state.has(itemName.DOUBLOON, self.player, 23) and (self.small_elevation(state) or self.clockwork_shot(state))
    --]]
    
    if ( has("doubloon", 23) and can_reachSmallElevation() ) then
        logic = 0
    elseif ( has("doubloon", 23) and can_clockworkShot() ) then
        logic = 2
    end
    
    return convertLogic(logic, skip)
end

function jiggy_JRL_ufo(skip)
    local logic = 99
    --[[        jiggy_ufo
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.check_mumbo_magic(state, itemName.MUMBOJR) and self.talon_torpedo(state) and \
                self.egg_aim(state) and self.ice_eggs(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.talon_torpedo(state) and self.egg_aim(state) and \
                self.ice_eggs(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.talon_torpedo(state) and self.ice_eggs(state)\
              and (self.talon_trot(state) or self.egg_aim(state))
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.talon_torpedo(state) and self.ice_eggs(state)\
              and (self.talon_trot(state) or self.egg_aim(state))
    --]]
    
    if ( has("mumbojr") and has("ttorp") and has("eggaim") and can_shootEggs("ieggs") ) then
        logic = 0
    elseif ( has("ttorp") and has("eggaim") and can_shootEggs("ieggs") ) then
        logic = 1
    elseif ( has("ttorp") and has("ttrot") and can_shootEggs("ieggs") ) then
        logic = 2
    end
    
    return convertLogic(logic, skip)
end

----- Notes

function treble_JRL(skip)
    local logic = 99
    --[[        treble_jrl
    self.sub_aqua_egg_aiming(state) or self.talon_torpedo(state) or self.humbaJRL(state)
    --]]
    
    local humba = access_JRL_humba(true)
    
    -- Normal Logic
    if ( has("auqaim") or has("ttorp") or humba <= logictype.CurrentStage ) then
        logic = 0
        
    -- Sequence Breaking
    else
        logic = humba
    end
    
    return convertLogic(logic, skip)
end

function notes_JRL_blubbuls(skip)
    local logic = 99
    --[[        notes_jrl_blubs
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.sub_aqua_egg_aiming(state) or self.talon_torpedo(state) or self.humbaJRL(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.sub_aqua_egg_aiming(state) or self.talon_torpedo(state) or self.humbaJRL(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.sub_aqua_egg_aiming(state) or self.talon_torpedo(state) or self.humbaJRL(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.sub_aqua_egg_aiming(state) or self.talon_torpedo(state) or self.humbaJRL(state)
    --]]
    
    local humba = access_JRL_humba(true)
    
    -- Normal Logic
    if ( has("auqaim") or has("ttorp") or humba <= logictype.CurrentStage ) then
        logic = 0
        
    -- Sequence Breaking
    else
        logic = humba
    end
    
    return convertLogic(logic, skip)
end

function notes_JRL_jollys(skip)
    local logic = 99
    --[[        notes_jolly
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.talon_trot(state) or (self.tall_jump(state) and self.grip_grab(state))\
            or self.flap_flip(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.small_elevation(state) or self.long_jump(state) or self.roll(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.small_elevation(state) or self.long_jump(state) or self.clockwork_shot(state) or self.roll(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.small_elevation(state) or self.long_jump(state) or self.clockwork_shot(state) or self.roll(state)
    --]]
    
    if ( has("ttrot") or has("tjump") and has("ggrab") or has("fflip") ) then
        logic = 0
    elseif ( can_reachSmallElevation() or can_longJump() or has("roll") ) then
        logic = 1
    elseif ( can_clockworkShot() ) then
        logic = 2
    elseif ( has("bbust") ) then
        logic = 7 -- FIXIT tricky but doable
    elseif ( has("doubloon", 28) and has("ttrain") ) then
        logic = 7 -- smuggle talon trot from JRL
    elseif ( has("clawbts") and load_jrl_jrl() and has("jra") ) then
        logic = 7 -- smuggle clawbts from cliff top
    elseif ( has("clawbts") and (load_hfp_jrl() and has("hfa") or load_ggm_jrl() and has("gga") or connector_PL_to_PG(true) <= 7 and load_ww_jrl() and has("wwa")) ) then
        logic = 7 -- smuggle clawbts from cliff top into hfp entrance, ggm entrance, or ww entrance
    elseif ( has("clawbts") and (load_gi_jrl() and has("gia") or load_ck_jrl() and has("cka")) or has("springb") and (load_tdl_jrl() and has("tda") or load_ccl_jrl() and has("cca")) or has("ttrain") and load_mt_jrl() and has("mta") ) then
        logic = 7 -- smuggle clawbts from quagmire if GI or CK take you to JRL, or springb from wasteland if either TDL or CCL take you to JRL, or ttrain from spiral mountain if MT takes you to JRL
    end
    
    return convertLogic(logic, skip)
end

function notes_JRL_pawnos(skip)
    local logic = 99
    --[[        pawno_shelves
     if self.world.options.logic_type == LogicType.option_intended:
         logic = self.small_elevation(state) or self.grip_grab(state)
     elif self.world.options.logic_type == LogicType.option_easy_tricks:
         logic = self.small_elevation(state) or self.grip_grab(state)\
                or self.has_explosives(state) and self.split_up(state)
     elif self.world.options.logic_type == LogicType.option_hard_tricks:
         logic = self.small_elevation(state) or self.grip_grab(state) or self.clockwork_shot(state)\
                    or self.has_explosives(state) and self.split_up(state)
     elif self.world.options.logic_type == LogicType.option_glitches:
         logic = self.small_elevation(state) or self.grip_grab(state) or self.clockwork_shot(state)\
                    or self.has_explosives(state) and self.split_up(state)
     --]]
     
    local explosives = can_shootExplosiveEggs()
    
    -- Normal Logic
    if ( can_reachSmallElevation() or has("ggrab") ) then
        logic = 0
    elseif ( explosives <= logictype.CurrentStage and has("splitup") ) then
        logic = 1
    elseif ( can_clockworkShot() ) then
        logic = 2
    elseif ( has("wwing") or has("bbust") ) then
        logic = 7
        
    -- Sequence Breaking
    elseif ( has("splitup") ) then
        logic = explosives
    end
    
    return convertLogic(logic, skip)
end

----- Doubloons

function doubloons_JRL_ledgeAlcove(skip)
    local logic = 99
    --[[        doubloon_ledge
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.split_up(state) and self.has_explosives(state)\
                and self.spring_pad(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.split_up(state) and self.has_explosives(state)\
                and (self.spring_pad(state) or self.leg_spring(state))
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.split_up(state) and self.has_explosives(state)\
                    and (
                        self.spring_pad(state)\
                        or self.leg_spring(state)\
                        or self.pack_whack(state) and self.tall_jump(state) and self.grip_grab(state)\          -- all of these alternates that require tall jump are redundant because you have the spring pad
                        or self.glide(state) and self.tall_jump(state)\
                        or self.wing_whack(state) and self.tall_jump(state)
                    )\
                or self.clockwork_shot(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.split_up(state) and self.has_explosives(state)\
                    and (
                        self.spring_pad(state)\
                        or self.leg_spring(state)\
                        or self.pack_whack(state) and self.tall_jump(state) and self.grip_grab(state)\
                        or self.glide(state) and self.tall_jump(state)\
                        or self.wing_whack(state) and self.tall_jump(state)
                    )\
                or self.clockwork_shot(state)
    --]]
    
    local explosives = can_shootExplosiveEggs(true)
    
    -- Normal Logic
    if ( has("splitup") and has("tjump") and explosives <= logictype.CurrentStage ) then
        logic = 0
    elseif ( has_legSpring() and explosives <= logictype.CurrentStage ) then
        logic = 1
    elseif ( has("splitup") and has("tjump") and explosives < 2 ) then
        logic = 1 -- Sequence Breaking
    elseif ( can_clockworkShot() ) then
        logic = 2
    
    -- Sequence Breaking
    elseif ( has("splitup") and has("tjump") or has_legSpring() ) then
        logic = math.max(1, explosives)
    end
    
    return convertLogic(logic, skip)
end

function doubloons_JRL_dirtPatches(skip)
    local logic = 99
    --[[        doubloon_dirtpatch
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.bill_drill(state) or self.has_explosives(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.bill_drill(state) or self.has_explosives(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.bill_drill(state) or self.has_explosives(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.bill_drill(state) or self.has_explosives(state)
    --]]
    
    local explosives = can_shootExplosiveEggs(true)
    
    -- Normal Logic
    if ( has_billDrill() or explosives <= logictype.CurrentStage ) then
        logic = 0
    
    -- Sequence Breaking
    else
        logic = explosives
    end
    
    return convertLogic(logic, skip)
end

function doubloons_JRL_underwater(skip)
    local logic = 99
    --[[        doubloon_water
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.dive(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.dive(state) or self.shack_pack(state) and self.has_explosives(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.dive(state) or self.shack_pack(state) and self.has_explosives(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.dive(state) or self.shack_pack(state) and self.has_explosives(state)
    --]]
    
    local explosives = can_shootExplosiveEggs(true)
    
    -- Normal Logic
    if ( has("dive") ) then
        logic = 0
    elseif ( has_shackPack() and explosives <= logictype.CurrentStage ) then
        logic = 1
    
    -- Sequence Breaking
    elseif ( has_shackPack() ) then
        logic = math.max(1, explosives)
    end
    
    return convertLogic(logic, skip)
end

----- Nests

function nests_JRL_rentedRoom(skip)
    local logic = 99
    --[[
    self.has_explosives(state) or state.has(itemName.DOUBLOON, self.player, 28)
    --]]
    
    local explosives = can_shootExplosiveEggs(true)
    
    -- Normal Logic
    if ( explosives <= logictype.CurrentStage or has("doubloon", 28) ) then
        logic = 0
    
    -- Sequence Breaking
    else
        logic = explosives
    end
    
    return convertLogic(logic, skip)
end

function nests_JRL_gunpowderRoom(skip)
    local logic = 99
    --[[        nest_jolly_gunpowder
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.dive(state) or self.grenade_eggs(state)                -- grenade eggs are the only acceptable eggs for explosives on intended difficulty, so all of these checks can have the same logic
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.dive(state) or self.has_explosives(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.dive(state) or self.has_explosives(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.dive(state) or self.has_explosives(state)
    --]]
    
    local explosives = can_shootExplosiveEggs(true)
    
    -- Normal Logic
    if ( has("dive") or explosives <= logictype.CurrentStage ) then
        logic = 0
    
    -- Sequence Breaking
    else
        logic = explosives
    end
    
    return convertLogic(logic, skip)
end

function nests_JRL_seaweedSanctumBottom(skip)
    local logic = 99
    --[[        nest_seaweed_bottom
     if self.intended_logic(state):
        logic = self.flap_flip(state)
    elif self.easy_tricks_logic(state):
        logic = self.flap_flip(state)
    elif self.hard_tricks_logic(state):
        logic = self.flap_flip(state)\
                or self.clockwork_shot(state)\
                or self.tall_jump(state) and self.beak_buster(state)
    elif self.glitches_logic(state):
        logic = self.flap_flip(state)\
                or self.clockwork_shot(state)\
                or self.tall_jump(state) and self.beak_buster(state)
     --]]
    
    if ( has("fflip") ) then
        logic = 0
    elseif ( can_clockworkShot() or has("tjump") and has("bbust") ) then
        logic = 2
    end
    
    return convertLogic(logic, skip)
end

function nests_JRL_seaweedSanctumOthers(skip)
    local logic = 99
    --[[        nest_seaweed_others
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.can_climb_seaweed(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.can_climb_seaweed(state)\
                or state.can_reach_region(regionName.JRBFC, self.player) and (self.flutter(state) or self.air_rat_a_tat_rap(state))
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.can_climb_seaweed(state)\
                or state.can_reach_region(regionName.JRBFC, self.player) and (
                    self.flutter(state) or self.air_rat_a_tat_rap(state)\
                    or self.clockwork_shot(state)
                )
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.can_climb_seaweed(state)\
                or state.can_reach_region(regionName.JRBFC, self.player) and (
                    self.flutter(state) or self.air_rat_a_tat_rap(state)\
                    or self.clockwork_shot(state)
                )
     --]]
    
    local jrlbfcAccessibility = Tracker:FindObjectForCode("@Region: Jolly Roger's Lagoon - Big Fish Cavern").AccessibilityLevel
    local canClimbSeaweedSanctum = access_JRL_canClimbSeaweedSanctum(true)
    
    -- Normal Logic
    if ( canClimbSeaweedSanctum <= logictype.CurrentStage ) then
        logic = 0
    elseif ( (has("flutter") or has("arat")) and (jrlbfcAccessibility == AccessibilityLevel.Normal or jrlbfcAccessibility == AccessibilityLevel.Cleared) ) then
        logic = 1
    elseif ( canClimbSeaweedSanctum < 2 ) then
        logic = 1 -- Sequence Breaking
    elseif ( can_clockworkShot() and (jrlbfcAccessibility == AccessibilityLevel.Normal or jrlbfcAccessibility == AccessibilityLevel.Cleared) ) then
        logic = 2
    
    -- Sequence Breaking
    else
        local fromBFC = 99
        if ( has("flutter") or has("arat") or can_clockworkShot() and jrlbfcAccessibility > AccessibilityLevel.None ) then
            fromBFC = math.max(2, logictype.CurrentStage + 1)
        end
        
        logic = math.min(canClimbSeaweedSanctum, fromBFC)
    end
    
    return convertLogic(logic, skip)
end

function nests_JRL_seaweedSanctumTop(skip)
    local logic = 99
    --[[        nest_seaweed_top
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.grip_grab(state) and self.flap_flip(state) and (
                    self.can_climb_seaweed(state)\
                    or state.can_reach_region(regionName.JRBFC, self.player)
                )
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = (self.grip_grab(state) or self.beak_buster(state)) and self.flap_flip(state)\
                and (
                    self.can_climb_seaweed(state)\
                    or state.can_reach_region(regionName.JRBFC, self.player)
                )
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = ((self.grip_grab(state) or self.beak_buster(state)) and self.flap_flip(state)\
                    or self.clockwork_shot(state))\
                and (
                    self.can_climb_seaweed(state)\
                    or state.can_reach_region(regionName.JRBFC, self.player)
                )
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = ((self.grip_grab(state) or self.beak_buster(state)) and self.flap_flip(state)\
                    or self.clockwork_shot(state))\
                and (
                    self.can_climb_seaweed(state)\
                    or state.can_reach_region(regionName.JRBFC, self.player)
                )
     --]]
    
    local jrlbfcAccessibility = Tracker:FindObjectForCode("@Region: Jolly Roger's Lagoon - Big Fish Cavern").AccessibilityLevel
    local canClimbSeaweedSanctum = access_JRL_canClimbSeaweedSanctum(true)
    
    -- Normal Logic
    if ( has("ggrab") and has("fflip") and (canClimbSeaweedSanctum <= logictype.CurrentStage or jrlbfcAccessibility == AccessibilityLevel.Normal or jrlbfcAccessibility == AccessibilityLevel.Cleared) ) then
        logic = 0
    elseif ( has("bbust") and has("fflip") and (canClimbSeaweedSanctum <= logictype.CurrentStage or jrlbfcAccessibility == AccessibilityLevel.Normal or jrlbfcAccessibility == AccessibilityLevel.Cleared) ) then
        logic = 1
    elseif ( (has("ggrab") or has("bbust")) and has("fflip") and (canClimbSeaweedSanctum < 2 or logictype.CurrentStage == 0 and jrlbfcAccessibility > AccessibilityLevel.None) ) then
        logic = 1 -- Sequence Breaking
    elseif ( can_clockworkShot() and (canClimbSeaweedSanctum <= logictype.CurrentStage or jrlbfcAccessibility == AccessibilityLevel.Normal or jrlbfcAccessibility == AccessibilityLevel.Cleared) ) then
        logic = 2
    
    -- Sequence Breaking
    elseif ( can_clockworkShot() or (has("ggrab") or has("bbust")) and has("fflip") ) then
        local fromBFC = 99
        if ( jrlbfcAccessibility > AccessibilityLevel.None ) then
            fromBFC = logictype.CurrentStage + 1
        end
    
        logic = math.max(2, math.min(canClimbSeaweedSanctum, fromBFC))
    end
    
    return convertLogic(logic, skip)
end

function nests_JRL_templeOfTheFishes(skip)
    local logic = 99
    --[[        nest_bacon
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.sub_aqua_egg_aiming(state) and self.has_linear_egg(state)\
                or self.humbaJRL(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.sub_aqua_egg_aiming(state) and self.has_linear_egg(state)\
                or self.humbaJRL(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.sub_aqua_egg_aiming(state) and self.has_linear_egg(state)\
                or self.humbaJRL(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.sub_aqua_egg_aiming(state) and self.has_linear_egg(state)\
                or self.humbaJRL(state)
    --]]
    
    local humba = access_JRL_humba(true)
    
    -- Normal Logic
    if ( has("auqaim") and can_shootLinearEggs() or humba <= logictype.CurrentStage ) then
        logic = 0
        
    -- Sequence Breaking
    else
        logic = humba
    end
    
    return convertLogic(logic, skip)
end

function nests_JRL_lordWooFakFak(skip)
    local logic = 99
    --[[        nest_lord_woo
    if self.world.options.logic_type == LogicType.option_intended:
        logic = (state.has(itemName.MUMBOJR, self.player) or self.humbaJRL(state))\
                    and self.grenade_eggs_item(state) and self.sub_aqua_egg_aiming(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = (state.has(itemName.MUMBOJR, self.player) or self.doubleAir(state) or self.humbaJRL(state))\
                    and self.grenade_eggs_item(state) and self.sub_aqua_egg_aiming(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.grenade_eggs_item(state) and self.sub_aqua_egg_aiming(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.grenade_eggs_item(state) and self.sub_aqua_egg_aiming(state)
     --]]
    
    local humba = access_JRL_humba(true)
    
    -- Normal Logic
    if ( (has("mumbojr") or humba <= logictype.CurrentStage) and has("auqaim") and has("geggs") ) then
        logic = 0
    elseif ( has("dair") and has("auqaim") and has("geggs") ) then
        logic = 1
    elseif ( humba < 2 and has("auqaim") and has("geggs") ) then
        logic = 1 -- Sequence Breaking
    elseif ( has("auqaim") and has("geggs") ) then
        logic = 2
    end
    
    return convertLogic(logic, skip)
end

----- Signs

function signpost_JRL_smugglersCavern(skip)
    local logic = 99
    --[[        signpost_smugglers
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.has_explosives(state) or self.dive(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.has_explosives(state) or self.dive(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.has_explosives(state) or self.dive(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.has_explosives(state) or self.dive(state)
    --]]
    
    local explosives = can_shootExplosiveEggs(true)
    
    -- Normal Logic
    if ( has("dive") or explosives <= logictype.CurrentStage ) then
        logic = 0
    
    -- Sequence Breaking
    else
        logic = explosives
    end
    
    return convertLogic(logic, skip)
end

function signpost_JRL_wastePipeAlcove(skip)
    local logic = 99
    --[[        signpost_jrl_pipes
    if self.world.options.logic_type == LogicType.option_intended:
        logic = (self.has_explosives(state) or self.bill_drill(state)) and \
                self.grip_grab(state) and self.spring_pad(state) and self.talon_trot(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = ((self.has_explosives(state) or self.bill_drill(state))\
                    and self.grip_grab(state) and self.spring_pad(state) and self.talon_trot(state))\
                or (self.has_explosives(state) and self.spring_pad(state)\
                    and (self.glide(state) or self.leg_spring(state)))
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = ((self.has_explosives(state) or self.bill_drill(state))\
                    and self.grip_grab(state) and self.spring_pad(state) and self.talon_trot(state))\
                or (self.has_explosives(state) and self.spring_pad(state)\
                    and (self.glide(state) or self.leg_spring(state)))
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = ((self.has_explosives(state) or self.bill_drill(state))\
                    and self.grip_grab(state) and self.spring_pad(state) and self.talon_trot(state))\
                or (self.has_explosives(state) and self.spring_pad(state)\
                    and (self.glide(state) or self.leg_spring(state)))
    --]]
    
    local explosives = can_shootExplosiveEggs(true)
    
    -- Normal Logic
    if ( has("ggrab") and has("tjump") and has("ttrot") and (has_billDrill() or explosives <= logictype.CurrentStage) ) then
        logic = 0
    elseif ( explosives <= logictype.CurrentStage and has("tjump") and (has_glide() or has_legSpring()) ) then
        logic = 1
    
    -- Sequence Breaking
    elseif ( has("tjump") and (has("ggrab") and has("ttrot") or has_glide() or has_legSpring()) ) then
        logic = math.max(1, explosives)
    end
    
    return convertLogic(logic, skip)
end

----- Other - Jinjos

function jinjo_JRL_alcove(skip)
    local logic = 99
    --[[        jinjo_alcove
    if self.world.options.logic_type == LogicType.option_intended:
        logic = state.has(itemName.DOUBLOON, self.player, 28) and self.turbo_trainers(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = (state.has(itemName.DOUBLOON, self.player, 28) and self.turbo_trainers(state))\
                or (self.has_explosives(state) and (self.pack_whack(state) or self.sack_pack(state)\
                        or (self.leg_spring(state) and self.glide(state))))
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = (state.has(itemName.DOUBLOON, self.player, 28) and self.turbo_trainers(state))\
                or (self.has_explosives(state) and (self.pack_whack(state) or self.sack_pack(state)\
                    or (self.leg_spring(state) and self.glide(state))))\
                or self.tall_jump(state) and (self.flutter(state) or self.air_rat_a_tat_rap(state))\
                or self.clockwork_shot(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = (state.has(itemName.DOUBLOON, self.player, 28) and self.turbo_trainers(state))\
                or (self.has_explosives(state) and (self.pack_whack(state) or self.sack_pack(state)\
                    or (self.leg_spring(state) and self.glide(state))))\
                or self.tall_jump(state) and (self.flutter(state) or self.air_rat_a_tat_rap(state))\
                or self.clockwork_shot(state)
    --]]
    
    local explosives = can_shootExplosiveEggs(true)
    
    -- Normal Logic
    if ( has("doubloon", 28) and has("ttrain") ) then
        logic = 0
    elseif ( explosives <= logictype.CurrentStage and (has_packWhack() or has_sackPack() or has_glide() and has_legSpring()) ) then
        logic = 1
    elseif ( can_clockworkShot() or has("tjump") and (has("flutter") or has("arat")) ) then
        logic = 2
    
    -- Sequence Breaking
    elseif ( has_packWhack() or has_sackPack() or has_glide() and has_legSpring() ) then
        logic = math.max(1, explosives)
    end
    
    return convertLogic(logic, skip)
end

function jinjo_JRL_atBlubbers(skip)
    local logic = 99
    --[[        jinjo_blubber
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.spring_pad(state) or self.flap_flip(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.spring_pad(state) or self.flap_flip(state) or (self.has_explosives(state) and self.leg_spring(state))
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.spring_pad(state) or self.flap_flip(state) or self.clockwork_shot(state) or (self.has_explosives(state) and self.leg_spring(state))
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.spring_pad(state) or self.flap_flip(state) or self.clockwork_shot(state) or (self.has_explosives(state) and self.leg_spring(state))
    --]]
    
    local explosives = can_shootExplosiveEggs(true)
    
    -- Normal Logic
    if ( has("tjump") or has("fflip") ) then
        logic = 0
    elseif ( explosives <= logictype.CurrentStage and has_legSpring() ) then
        logic = 1
    elseif ( can_clockworkShot() ) then
        logic = 2
    
    -- Sequence Breaking
    else
        logic = math.max(1, explosives)
    end
    
    return convertLogic(logic, skip)
end

function jinjo_JRL_seaweedSanctum(skip)
    local logic = 99
    --[[        jinjo_seaweed_sanctum
     if self.world.options.logic_type == LogicType.option_intended:
        logic = self.grip_grab(state) and self.flap_flip(state) and (
            self.can_climb_seaweed(state)\
            or state.can_reach_region(regionName.JRBFC, self.player)
        )
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = (self.grip_grab(state) or self.beak_buster(state)) and self.flap_flip(state)\
                and (
                    self.can_climb_seaweed(state)\
                    or state.can_reach_region(regionName.JRBFC, self.player)
                )
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = ((self.grip_grab(state) or self.beak_buster(state)) and self.flap_flip(state)\
                    or self.clockwork_shot(state))\
                and (
                    self.can_climb_seaweed(state)\
                    or state.can_reach_region(regionName.JRBFC, self.player)
                )
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = ((self.grip_grab(state) or self.beak_buster(state)) and self.flap_flip(state)\
                    or self.clockwork_shot(state))\
                and (
                    self.can_climb_seaweed(state)\
                    or state.can_reach_region(regionName.JRBFC, self.player)
                )
     --]]
    
    local jrlbfcAccessibility = Tracker:FindObjectForCode("@Region: Jolly Roger's Lagoon - Big Fish Cavern").AccessibilityLevel
    local canClimbSeaweedSanctum = access_JRL_canClimbSeaweedSanctum(true)
    
    -- Normal Logic
    if ( has("ggrab") and has("fflip") and (canClimbSeaweedSanctum <= logictype.CurrentStage or jrlbfcAccessibility == AccessibilityLevel.Normal or jrlbfcAccessibility == AccessibilityLevel.Cleared) ) then
        logic = 0
    elseif ( has("bbust") and has("fflip") and (canClimbSeaweedSanctum <= logictype.CurrentStage or jrlbfcAccessibility == AccessibilityLevel.Normal or jrlbfcAccessibility == AccessibilityLevel.Cleared) ) then
        logic = 1
    elseif ( (has("ggrab") or has("bbust")) and has("fflip") and (canClimbSeaweedSanctum < 2 or logictype.CurrentStage == 0 and jrlbfcAccessibility > AccessibilityLevel.None) ) then
        logic = 1 -- Sequence Breaking
    elseif ( can_clockworkShot() and (canClimbSeaweedSanctum <= logictype.CurrentStage or jrlbfcAccessibility == AccessibilityLevel.Normal or jrlbfcAccessibility == AccessibilityLevel.Cleared) ) then
        logic = 2
    
    -- Sequence Breaking
    elseif ( can_clockworkShot() or (has("ggrab") or has("bbust")) and has("fflip") ) then
        local fromBFC = 99
        if ( jrlbfcAccessibility > AccessibilityLevel.None ) then
            fromBFC = logictype.CurrentStage + 1
        end
    
        logic = math.max(2, math.min(canClimbSeaweedSanctum, fromBFC))
    end
    
    return convertLogic(logic, skip)
end

function jinjo_JRL_sunkenShip(skip)
    local logic = 99
    --[[
    self.humbaJRL(state) or self.sub_aqua_egg_aiming(state) or self.talon_torpedo(state)
    --]]
    
    local humba = access_JRL_humba(true)
    
    -- Normal Logic
    if ( has("auqaim") or has("ttorp") or humba <= logictype.CurrentStage ) then
        logic = 0
        
    -- Sequence Breaking
    else
        logic = humba
    end
    
    return convertLogic(logic, skip)
end

----- Other - Glowbos

----- Other - Honeycombs

function honeycomb_JRL_wastePipes(skip)
    local logic = 99
    --[[        honeycomb_jrl_pipes
    if self.world.options.logic_type == LogicType.option_intended:
        logic = (self.has_explosives(state) or  self.bill_drill(state)) and \
                self.grip_grab(state) and self.spring_pad(state) and self.talon_trot(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = ((self.has_explosives(state) or self.bill_drill(state))\
                    and self.grip_grab(state) and self.spring_pad(state) and self.talon_trot(state))\
                or (self.has_explosives(state) and self.spring_pad(state)\
                    and (self.glide(state) or self.leg_spring(state)))
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = ((self.has_explosives(state) or self.bill_drill(state))\
                    and self.grip_grab(state) and self.spring_pad(state) and self.talon_trot(state))\
                or (self.has_explosives(state) and self.spring_pad(state)\
                    and (self.glide(state) or self.leg_spring(state)))\
                or self.clockwork_shot(state) and (self.veryLongJump(state) or self.has_explosives(state) and self.split_up(state)) -- checking for explosives is redundant because we check for clockwork shot
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = ((self.has_explosives(state) or self.bill_drill(state))\
                    and self.grip_grab(state) and self.spring_pad(state) and self.talon_trot(state))\
                or (self.has_explosives(state) and self.spring_pad(state)\
                    and (self.glide(state) or self.leg_spring(state)))\
                or self.clockwork_shot(state) and (self.veryLongJump(state) or self.has_explosives(state) and self.split_up(state))
    --]]
    
    local explosives = can_shootExplosiveEggs(true)
    
    -- Normal Logic
    if ( (has_billDrill() or explosives <= logictype.CurrentStage) and has("ggrab") and has("tjump") and has("ttrot") ) then
        logic = 0
    elseif ( explosives <= logictype.CurrentStage and has("tjump") and (has_glide() or has_legSpring()) ) then
        logic = 1
    elseif ( explosives < 2 and has("ggrab") and has("tjump") and has("ttrot") ) then
        logic = 1 -- Sequence Breaking
    elseif ( can_clockworkShot() and (can_veryLongJump() or has("splitup")) ) then
        logic = 2
    
    -- Sequence Breaking
    elseif ( has("ggrab") and has("tjump") and has("ttrot") or has("tjump") and (has_glide() or has_legSpring()) ) then
        logic = math.max(1, explosives)
    end
    
    return convertLogic(logic, skip)
end

----- Other - Cheato Pages

function cheato_JRL_pawno(skip)
    local logic = 99
    --[[        cheato_pawno
    if self.world.options.logic_type == LogicType.option_intended:
        logic = state.has(itemName.DOUBLOON, self.player, 28) and self.small_elevation(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = state.has(itemName.DOUBLOON, self.player, 28) and self.small_elevation(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = state.has(itemName.DOUBLOON, self.player, 28) and (self.small_elevation(state) or self.clockwork_shot(state))
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = state.has(itemName.DOUBLOON, self.player, 28) and (self.small_elevation(state) or self.clockwork_shot(state))
    --]]
    
    if ( has("doubloon", 28) and can_reachSmallElevation() ) then
        logic = 0
    elseif ( has("doubloon", 28) and can_clockworkShot() ) then
        logic = 2
    end
    
    return convertLogic(logic, skip)
end

function cheato_JRL_ancientSwimmingBaths(skip)
    local logic = 99
    --[[        cheato_ancient_swimming_baths
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.talon_torpedo(state) and \
                self.glide(state) and self.tall_jump(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.talon_torpedo(state) and \
                ((self.glide(state) and self.tall_jump(state)) or self.leg_spring(state) or
                (self.pack_whack(state) and self.grip_grab(state)))
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.talon_torpedo(state) and ((self.glide(state) and self.tall_jump(state)) or self.leg_spring(state) or
                self.wing_whack(state) or
                (self.pack_whack(state) and self.grip_grab(state)))
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.talon_torpedo(state) and ((self.glide(state) and self.tall_jump(state)) or self.leg_spring(state) or
                self.wing_whack(state) or
                (self.check_solo_moves(state, itemName.WWING) and self.tall_jump(state)) or
                (self.tall_jump(state) and self.pack_whack(state) and self.grip_grab(state)))
    --]]
    
    -- Normal Logic
    if ( has("ttorp") and has("tjump") and has_glide() ) then
        logic = 0
    elseif ( has("ttorp") and (has("ggrab") and has_packWhack() or has_legSpring()) ) then
        logic = 1
    elseif ( has("ttorp") and has_wingWhack() ) then
        logic = 2
    elseif ( has("tjump") and has("wwing") ) then
        logic = 3
    
    -- Sequence Breaking
    elseif ( has("ttorp") and has_wingWhack() ) then
        logic = 7
    end
    
    return convertLogic(logic, skip)
end

----- Other

