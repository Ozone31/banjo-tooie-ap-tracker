--------------- Regions



--------------- Connectors

function connector_SM_to_JV(skip)
    local logic = 99
    --[[        canGetPassedKlungo
    if self.world.options.skip_klungo == 1:
        return True

    if self.world.options.logic_type == LogicType.option_intended:
            logic = self.mobile_attack(state)       -- self.can_shoot_any_egg(state) or self.beak_barge(state) or self.roll(state) or self.air_rat_a_tat_rap(state) or self.wonderwing(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.mobile_attack(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.ground_attack(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.ground_attack(state)
    --]]
    
    if ( has("skipklungo_on") ) then
        logic = 0
    else
        if ( has("eggshoot") or has("bbarge") or has("roll") or has("arat") or has("wwing") ) then
            logic = 0
        elseif ( can_groundAttack() ) then
            logic = 2
        end
    end
    
    return convertLogic(logic, skip)
end

function connector_SM_to_GL(skip)
    local logic = 99
    --[[        SM_to_GL
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.flight_pad(state) or self.flap_flip(state) and self.climb(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.flight_pad(state) or self.flap_flip(state) and self.climb(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.flight_pad(state)\
                or self.flap_flip(state) and self.climb(state)\
                or (self.tall_jump(state) or self.talon_trot(state) and self.flutter(state)) and self.beak_buster(state) and self.climb(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.flight_pad(state)\
                or self.flap_flip(state) and self.climb(state)\
                or (self.tall_jump(state) or self.talon_trot(state) and self.flutter(state)) and self.beak_buster(state) and self.climb(state)
    --]]
    
    if ( has("fpad") or has("fflip") and has("climb") ) then
        logic = 0
    elseif ( (has("tjump") or has("ttrot") and has("flutter")) and has("bbust") and has("climb") ) then
        logic = 2
    end

    return convertLogic(logic, skip)
end

function connector_JVorWH_to_IOHWarps(skip)
    local logic = 99
    
    if ( has("siloiohjv") or has("siloiohwh") or has("randomizesilos_off") ) then
        logic = 0
    end
    
    return convertLogic(logic, skip)
end

function connector_WH_to_IOHWarps(skip)
    local logic = 99
    
    if ( has("siloiohwh") or has("randomizesilos_off") ) then
        logic = 0
    end
    
    return convertLogic(logic, skip)
end

function connector_WH_to_PL(skip)
    local logic = 99
    --[[        WH_to_PL
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.slightly_elevated_ledge(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.slightly_elevated_ledge(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.slightly_elevated_ledge(state) or (self.flap_flip(state) and self.beak_buster(state))
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.slightly_elevated_ledge(state) or (self.flap_flip(state) and self.beak_buster(state))
    --]]
    
    if ( can_reachSlightlyElevatedLedge() ) then
        logic = 0
    elseif ( has("fflip") and has("bbust") ) then
        logic = 2
    end

    return convertLogic(logic, skip)
end

function connector_MT_to_MTJadeSnakeGrove(skip)
    local logic = 99
    --[[        MT_to_JSG
    if self.world.options.logic_type == LogicType.option_intended:
        logic = state.has(itemName.MUMBOMT, self.player)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = state.has(itemName.MUMBOMT, self.player)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = state.has(itemName.MUMBOMT, self.player)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.MT_flight_pad(state) and self.beak_bomb(state) or state.has(itemName.MUMBOMT, self.player)
    --]]
    
    if ( has("mumbomt") ) then
        logic = 0
    elseif ( basic_MT_canUseFlightPad() and has("bbomb") ) then
        logic = 3
    end
    
    return convertLogic(logic, skip)
end

function connector_MT_to_MTPrisonCompound(skip)
    local logic = 99
    --[[
    return self.has_explosives(state) or self.check_mumbo_magic(state, itemName.MUMBOMT)
    --]]
    
    local shootExplosiveEggs = can_shootExplosiveEggs(true)
    
    -- Normal Logic
    if ( shootExplosiveEggs <= logictype.CurrentStage or has("mumbomt") ) then
        logic = 0
    
    -- Sequence Breaking
    else
        logic = shootExplosiveEggs
    end
    
    return convertLogic(logic, skip)
end

function connector_MT_to_MTKickballStadium(skip)
    local logic = 99
    --[[        MT_to_KS
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.humbaMT(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.humbaMT(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.humbaMT(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.MT_flight_pad(state) and self.beak_bomb(state) or self.humbaMT(state)
    --]]
    
    local humbaMT = access_MT_humba(true)
    
    if ( humbaMT <= logictype.CurrentStage ) then
        logic = 0 -- Normal Logic
    elseif ( humbaMT < 3 ) then
        logic = humbaMT -- Sequence Breaking
    elseif ( basic_MT_canUseFlightPad() and has("bbomb") ) then
        logic = 3 -- Normal Logic
    else
        logic = humbaMT -- Sequence Breaking
    end
    
    return convertLogic(logic, skip)
end

function connector_MT_to_TDL(skip)
    local logic = 99
    --[[        mt_tdl_backdoor
    if self.intended_logic(state):
        logic = self.egg_aim(state) and\
            (self.grip_grab(state) and self.spring_pad(state) and self.flap_flip(state) and self.talon_trot(state) or self.MT_flight_pad(state)) and\
               self.backdoors_enabled(state)
    elif self.easy_tricks_logic(state):
        logic = (self.grip_grab(state) and self.spring_pad(state) and self.flap_flip(state) and self.egg_aim(state) and self.talon_trot(state)\
                or self.MT_flight_pad(state) and self.can_shoot_any_egg(state)) and\
               self.backdoors_enabled(state)
    elif self.hard_tricks_logic(state):
        logic = (self.grip_grab(state) and self.spring_pad(state) and self.flap_flip(state) and self.egg_aim(state) and self.talon_trot(state)\
                or self.MT_flight_pad(state) and self.can_shoot_any_egg(state)) and\
               self.backdoors_enabled(state)
    elif self.glitches_logic(state):
        logic = (self.grip_grab(state) and self.spring_pad(state) and self.flap_flip(state) and self.egg_aim(state) and self.talon_trot(state)\
                or self.MT_flight_pad(state) and self.can_shoot_any_egg(state)) and\
               self.backdoors_enabled(state)
    --]]
    
    if ( has("eggaim") and (has("ggrab") and has("tjump") and has("fflip") and has("ttrot") or basic_MT_canUseFlightPad()) and has("backdoorsopen_on") ) then
        logic = 0
    elseif ( basic_MT_canUseFlightPad() and can_shootEggs() and has("backdoorsopen_on") ) then
        logic = 1
    end
    
    return convertLogic(logic, skip)
end

function connector_MT_to_TDLHatch(skip)
    local logic = 99
    --[[        mt_to_hatch_region
    if self.intended_logic(state):
        logic = self.egg_aim(state) and\
            (self.flap_flip(state) or self.slightly_elevated_ledge(state)) and\
              ((self.grip_grab(state) and self.spring_pad(state) and self.flap_flip(state) and self.talon_trot(state)) or self.MT_flight_pad(state))
    elif self.easy_tricks_logic(state):
        logic = (self.flap_flip(state) or self.slightly_elevated_ledge(state))\
                and ((self.grip_grab(state) and self.spring_pad(state) and self.flap_flip(state) and self.egg_aim(state) and self.talon_trot(state))\
                    or (self.MT_flight_pad(state) and self.can_shoot_any_egg(state))\
                    or state.can_reach_region(regionName.TL_HATCH, self.player))\
                and (self.MT_flight_pad(state) and self.can_shoot_any_egg(state) or self.egg_aim(state))                -- this makes the entire previous section redundant
    elif self.hard_tricks_logic(state):
        logic = (self.flap_flip(state) or self.slightly_elevated_ledge(state))\
                and ((self.grip_grab(state) and self.spring_pad(state) and self.flap_flip(state) and self.egg_aim(state) and self.talon_trot(state))\
                    or (self.MT_flight_pad(state) and self.can_shoot_any_egg(state))\
                    or state.can_reach_region(regionName.TL_HATCH, self.player))\
                and (self.MT_flight_pad(state) and self.can_shoot_any_egg(state) or self.egg_aim(state))
    elif self.glitches_logic(state):
        logic = (self.flap_flip(state) or self.slightly_elevated_ledge(state))\
                and ((self.grip_grab(state) and self.spring_pad(state) and self.flap_flip(state) and self.egg_aim(state) and self.talon_trot(state))\
                    or (self.MT_flight_pad(state) and self.can_shoot_any_egg(state))\
                    or state.can_reach_region(regionName.TL_HATCH, self.player))\
                and (self.MT_flight_pad(state) and self.can_shoot_any_egg(state) or self.egg_aim(state))
    --]]
    
    if ( has("eggaim") and (has("fflip") or can_reachSlightlyElevatedLedge()) and (has("ggrab") and has("tjump") and has("fflip") and has("ttrot") or basic_MT_canUseFlightPad()) ) then
        logic = 0
    elseif ( (has("fflip") or can_reachSlightlyElevatedLedge()) and basic_MT_canUseFlightPad() and can_shootEggs() ) then
        logic = 1
    end
    
    return convertLogic(logic, skip)
end

function connector_MTPrisonCompound_to_GGM(skip)
    local logic = 99
    --[[
    rules.prison_compound_as_banjo(state) and rules.bill_drill(state)
    --]]
    
    if ( has_billDrill() ) then
        logic = access_MT_prisonCompoundAsBanjo(true)
    end
    
    return convertLogic(logic, skip)
end

function connector_MTKickballStadium_to_HFP(skip)
    local logic = 99
    --[[
    self.backdoors_enabled(state) and self.kickball_stadium_as_banjo(state)
    --]]
    
    if ( has("backdoorsopen_on") ) then
        logic = access_MT_kickballStadiumAsBanjo(true)
    end
    
    return convertLogic(logic, skip)
end

function connector_MT_to_MTWarps(skip)
    local logic = 99
    
    if ( has("warpmt1") or has("warpmt2") ) then
        logic = 0
    end
    
    return convertLogic(logic, skip)
end

function connector_MTJSG_to_MTWarps(skip)
    local logic = 99
    
    if ( has("warpmt4") ) then
        logic = 0
    end
    
    return convertLogic(logic, skip)
end

function connector_MTPC_to_MTWarps(skip)
    local logic = 99
    
    if ( has("warpmt3") ) then
        logic = 0
    end
    
    return convertLogic(logic, skip)
end

function connector_MTKS_to_MTWarps(skip)
    local logic = 99
    
    if ( has("warpmt5") ) then
        logic = 0
    end
    
    return convertLogic(logic, skip)
end

function connector_MTWarps_to_MT(skip)
    local logic = 99
    
    if ( has("warpmt1") or has("warpmt2") ) then
        logic = 0
    end
    
    return convertLogic(logic, skip)
end

function connector_MTWarps_to_MTJSG(skip)
    local logic = 99
    
    if ( has("warpmt4") ) then
        logic = 0
    end
    
    return convertLogic(logic, skip)
end

function connector_MTWarps_to_MTPC(skip)
    local logic = 99
    
    if ( has("warpmt3") ) then
        logic = 0
    end
    
    return convertLogic(logic, skip)
end

function connector_MTWarps_to_MTKS(skip)
    local logic = 99
    
    if ( has("warpmt5") ) then
        logic = 0
    end
    
    return convertLogic(logic, skip)
end

function connector_TDLHatch_to_TDL(skip)
    local logic = 99
    --[[        hatch_to_TDL
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.backdoors_enabled(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks : # normal
        logic = self.backdoors_enabled(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.backdoors_enabled(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = (self.clockwork_eggs(state) and self.egg_aim(state)) or self.backdoors_enabled(state)
    --]]
    
    if ( has("backdoorsopen_on") ) then
        logic = 0
    elseif ( has("ceggs") and has("eggaim") ) then
        logic = 3
    end
    
    return convertLogic(logic, skip)
end

function connector_PL_to_IOHWarps(skip)
    local logic = 99
    
    if ( has("siloiohpl") or has("randomizesilos_off") ) then
        logic = 0
    end
    
    return convertLogic(logic, skip)
end

function connector_IOHWarps_to_PL(skip)
    local logic = 99
    
    if ( has("siloiohpl") ) then
        logic = 0
    end
    
    return convertLogic(logic, skip)
end

function connector_PL_to_GGM(skip)
    local logic = 99
    --[[        PL_to_GGM
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.gm_jiggy(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks : # normal
        logic = self.gm_jiggy(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.gm_jiggy(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.gm_jiggy(state)\
                or (self.beak_buster(state) and (self.flap_flip(state) or self.tall_jump(state) or (self.talon_trot(state) and self.flutter(state) )))
    --]]
    
    if ( has("gga") ) then
        logic = 0
    elseif ( has("bbust") and (has("fflip") or has("tjump") or (has("ttrot") and has("flutter"))) ) then
        logic = 3
    end
    
    return convertLogic(logic, skip)
end

function connector_PL_to_PG(skip)
    local logic = 99
    --[[        PL_to_PG
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.fire_eggs(state) and self.egg_aim(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks : # normal
        logic = self.fire_eggs(state) and self.egg_aim(state)\
                or self.talon_trot(state) and self.fire_eggs(state)\
                or self.split_up(state) and self.fire_eggs(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.fire_eggs(state) and self.egg_aim(state)\
                or self.talon_trot(state) and self.fire_eggs(state)\
                or self.split_up(state) and self.fire_eggs(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.fire_eggs(state) and self.egg_aim(state)\
                or self.talon_trot(state) and self.fire_eggs(state)\
                or self.split_up(state) and self.fire_eggs(state)
    --]]
    
    if ( has("feggs") and has("eggaim") ) then
        logic = 0
    elseif ( has("feggs") and has("eggshoot") and (has("ttrot") or has("splitup")) ) then
        logic = 1
    elseif ( has("feggs") and has("eggshoot") and (has("siloiohjv") or has("siloiohwh") or has("siloiohpl")) and has("siloiohct") and has("clawbts") ) then
        logic = 7 -- smuggle clawbts from cliff top
    end
    
    return convertLogic(logic, skip)
end

function connector_PL_to_CT(skip)
    local logic = 99
    --[[
    rules.split_up(state)
    --]]
    
    if ( has("splitup") ) then
        logic = 0
    end
    
    return convertLogic(logic, skip)
end

function connector_GGM_to_GGMWaterStorageJinjo(skip)
    local logic = 99
    --[[        can_access_water_storage_jinjo_from_GGM
    if self.world.options.logic_type == LogicType.option_intended:
        logic = False
    elif self.world.options.logic_type == LogicType.option_easy_tricks : # normal
        logic = self.wing_whack(state) and self.leg_spring(state) and\
                    self.glide(state) and self.GM_boulders(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = (self.wing_whack(state) and self.leg_spring(state) and\
                    self.glide(state) and self.GM_boulders(state))\
                or self.clockwork_shot(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = (self.wing_whack(state) and self.leg_spring(state) and\
                                             self.glide(state) and self.GM_boulders(state))\
                or self.clockwork_shot(state)
    --]]
    
    local canBreakBoulders = access_GGM_canBreakBoulders(true)
    
    -- Normal Logic
    if ( has_wingWhack() and has_legSpring() and has_glide() and canBreakBoulders <= logictype.CurrentStage ) then
        logic = 1
    elseif ( can_clockworkShot() ) then
        logic = 2
    
    -- Sequence Breaking
    elseif ( has_wingWhack() and has_legSpring() and has_glide() ) then
        logic = canBreakBoulders
    end
    
    return convertLogic(logic, skip)
end

function connector_GGM_to_GGMFuelDepot(skip)
    local logic = 99
    --[[
    rules.humbaGGM(state)
    --]]
    
    logic = access_GGM_humba(true)
    
    return convertLogic(logic, skip)
end

function connector_GGM_to_WW(skip)
    local logic = 99
    --[[        ggm_to_ww
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.backdoors_enabled(state) and self.small_elevation(state) and self.humbaGGM(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.backdoors_enabled(state) and (self.small_elevation(state) or self.ggm_trot(state)) and self.humbaGGM(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.backdoors_enabled(state) and (self.small_elevation(state) or self.ggm_trot(state)) and self.humbaGGM(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = (self.clockwork_eggs(state) or self.backdoors_enabled(state)) and (self.small_elevation(state) or self.ggm_trot(state)) and self.humbaGGM(state)
    --]]
    
    local humbaAccess = access_GGM_humba(true)
    local ggmTrot = access_GGM_ttrot(true)
    
    if ( has("backdoorsopen_on") and can_reachSmallElevation() and humbaAccess <= logictype.CurrentStage ) then
        logic = 0 -- Normal Logic
    elseif ( has("backdoorsopen_on") and ggmTrot <= logictype.CurrentStage and humbaAccess <= logictype.CurrentStage ) then
        logic = 1 -- Normal Logic
    elseif ( has("backdoorsopen_on") and (can_reachSmallElevation() or ggmTrot < 3) and humbaAccess < 3 ) then
        logic = humbaAccess -- Sequence Breaking
    elseif ( can_shootEggs("ceggs") and can_reachSmallElevation() and humbaAccess <= logictype.CurrentStage ) then
        logic = 3 -- Normal Logic
    
    -- Sequence Breaking
    elseif ( has("backdoorsopen_on") or can_shootEggs("ceggs") ) then
        if ( can_reachSmallElevation() ) then
            logic = math.max(3, humbaAccess)
        else
            logic = math.max(3, humbaAccess, ggmTrot)
        end
    end
    
    return convertLogic(logic, skip)
end

function connector_PG_to_IOHWarps(skip)
    local logic = 99
    
    if ( has("siloiohpg") or has("randomizesilos_off") ) then
        logic = 0
    end
    
    return convertLogic(logic, skip)
end

function connector_IOHWarps_to_PG(skip)
    local logic = 99
    
    if ( has("siloiohpg") ) then
        logic = 0
    end
    
    return convertLogic(logic, skip)
end

function connector_PG_to_PGU(skip)
    local logic = 99
    --[[
    rules.dive(state)
    --]]
    
    if ( has("dive") ) then
        logic = 0
    end
    
    return convertLogic(logic, skip)
end

function connector_PGorCT_to_PL(skip)
    --[[        PG_to_PL
    if self.world.options.logic_type == LogicType.option_intended:
        logic = False
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = True
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = True
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = True
    --]]
    
    return convertLogic(1, skip)
end

function connector_PGU_to_PG(skip)
    local logic = 99
    --[[        PGU_to_PG
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.grip_grab(state) or self.tall_jump(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.grip_grab(state) or self.tall_jump(state) or (self.beak_buster(state) and (self.flutter(state) or self.air_rat_a_tat_rap(state)))
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.grip_grab(state) or self.tall_jump(state) or self.beak_buster(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.grip_grab(state) or self.tall_jump(state) or self.beak_buster(state)
    --]]
    
    if ( has("ggrab") or has("tjump") ) then
        logic = 0
    elseif ( has("bbust") and (has("flutter") or has("arat")) ) then -- FIXIT I would like to petition this one to be a hard trick, it's *difficult*
        logic = 1
    elseif ( has("bbust") ) then
        logic = 2
    end
    
    return convertLogic(logic, skip)
end

function connector_PGU_to_WL(skip)
    local logic = 99
    --[[
    rules.talon_torpedo(state)
    --]]
    
    if ( has("ttorp") ) then
        logic = 0
    end
    
    return convertLogic(logic, skip)
end

function connector_WW_to_WWInferno(skip)
    local logic = 99
    --[[        ww_to_inferno
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.humbaWW(state) or self.warp_to_inferno(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.humbaWW(state) or self.warp_to_inferno(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.humbaWW(state) or self.warp_to_inferno(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.glitchedInfernoAccess(state) or self.warp_to_inferno(state)
    --]]
    
    local wwHumba = access_WW_humba(true)
    local warpToInferno = access_WW_warpToInferno(true)
    local glitchIntoInferno = access_WW_glitchIntoInferno(true)
    
    -- Normal Logic
    if ( wwHumba <= logictype.CurrentStage or warpToInferno <= logictype.CurrentStage ) then
        logic = 0
    elseif ( wwHumba < 3 or warpToInferno < 3 ) then
        logic = math.min(wwHumba, warpToInferno)
    elseif ( glitchIntoInferno <= logictype.CurrentStage ) then
        logic = 3
    
    -- Sequence Breaking
    else
        logic = math.min(wwHumba, warpToInferno, glitchIntoInferno)
    end
    
    return convertLogic(logic, skip)
end

function connector_WW_to_TDL(skip)
    local logic = 99
    --[[        ww_tdl_backdoor
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.has_explosives(state) and self.claw_clamber_boots(state) and\
                self.talon_trot(state) and self.backdoors_enabled(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.has_explosives(state) and self.claw_clamber_boots(state) and self.backdoors_enabled(state)\
                and (
                    self.talon_trot(state)\
                    or state.can_reach_region(regionName.WWI, self.player) and self.turbo_trainers(state)
                )
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.has_explosives(state) and self.claw_clamber_boots(state) and self.backdoors_enabled(state) and (
                    self.talon_trot(state)\
                    or state.can_reach_region(regionName.WWI, self.player) and self.turbo_trainers(state)
                )

    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.has_explosives(state) and self.claw_clamber_boots(state) and self.backdoors_enabled(state) and (
                    self.talon_trot(state)\
                    or (self.warp_to_inferno(state) or self.humbaWW(state)) and self.turbo_trainers(state)
                )
     --]]
    
    local shootExplosiveEggs = can_shootExplosiveEggs(true)
    local wwHumba = access_WW_humba(true)
    local warpToInferno = access_WW_warpToInferno(true)
    
    if ( has("backdoorsopen_on") and has("clawbts") ) then
        -- Normal Logic
        if ( shootExplosiveEggs <= logictype.CurrentStage and has("ttrot") ) then
            logic = 0 
        elseif ( shootExplosiveEggs <= logictype.CurrentStage and has("ttrain") and (wwHumba <= logictype.CurrentStage or warpToInferno <= logictype.CurrentStage) ) then
            logic = 1
            
        -- Sequence Breaking
        else
            local ttrain = 99
            if ( has("ttrain") ) then
                ttrain = math.max(1, math.min(wwHumba, warpToInferno))
            end
            
            local ttrot = 99
            if ( has("ttrot") ) then
                ttrot = 0
            end
            
            logic = math.max(shootExplosiveEggs, math.min(ttrain, ttrot))
        end
    end
    
    return convertLogic(logic, skip)
end

function connector_WW_to_GGMFuelDepot(skip)
    local logic = 99
    --[[        ww_to_fuel_depot
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.climb(state) and self.flap_flip(state) and self.grip_grab(state) and self.longJumpToGripGrab(state) and self.saucer_door_open(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.climb(state) and self.flap_flip(state) and self.grip_grab(state) and self.longJumpToGripGrab(state) and self.saucer_door_open(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.climb(state) and self.flap_flip(state) and (self.grip_grab(state) or self.beak_buster(state)) and self.longJumpToGripGrab(state) and self.saucer_door_open(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.climb(state) and self.flap_flip(state) and (self.grip_grab(state) or self.beak_buster(state)) and self.longJumpToGripGrab(state) and self.saucer_door_open(state)
    --]]
    
    local canOpenSaucerDoor = access_WW_canOpenSaucerDoor(true)
    
    if ( has("climb") and has("fflip") and can_longJumpToGripGrab() ) then
        if ( canOpenSaucerDoor <= logictype.CurrentStage and has("ggrab") ) then
            logic = 0 -- Normal Logic
        elseif ( canOpenSaucerDoor < 2 and has("ggrab") ) then
            logic = 1 -- Sequence Breaking
        elseif ( canOpenSaucerDoor <= logictype.CurrentStage and has("bbust") ) then
            logic = 2 -- Normal Logic
        elseif ( has("ggrab") or has("bbust") ) then
            logic = canOpenSaucerDoor -- Sequence Breaking
        end
    end
    
    return convertLogic(logic, skip)
end

function connector_WW_to_WWA51(skip)
    local logic = 99
    --[[        a51_nests_from_WW
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.has_explosives(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.has_explosives(state) or self.glide(state) or self.leg_spring(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.has_explosives(state)\
                or self.glide(state)\
                or self.leg_spring(state)\
                or self.split_up(state) and self.spring_pad(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.has_explosives(state)\
                or self.glide(state)\
                or self.leg_spring(state)\
                or self.split_up(state) and self.spring_pad(state)
    --]]
    
    local shootExplosiveEggs = can_shootExplosiveEggs(true)
    
    -- Normal Logic
    if ( shootExplosiveEggs <= logictype.CurrentStage ) then
        logic = 0
    elseif ( shootExplosiveEggs < 2 or has_glide() or has_legSpring() ) then
        logic = 1
    elseif ( has("splitup") and has("tjump") ) then
        logic = 2
    
    -- Sequence Breaking
    else
        logic = shootExplosiveEggs
    end
    
    return convertLogic(logic, skip)
end

function connector_CT_to_IOHWarps(skip)
    local logic = 99
    
    if ( has("siloiohct") or has("randomizesilos_off") ) then
        logic = 0
    end
    
    return convertLogic(logic, skip)
end

function connector_IOHWarps_to_CT(skip)
    local logic = 99
    
    if ( has("siloiohct") ) then
        logic = 0
    end
    
    return convertLogic(logic, skip)
end

function connector_JRL_to_JRLWarps(skip)
    local logic = 99
    
    if ( has("warpjr1") ) then
        logic = 0
    end
    
    return convertLogic(logic, skip)
end

function connector_JRL_to_JRLU(skip)
    local logic = 99
    --[[        can_dive_in_JRL
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.dive(state) and state.has(itemName.MUMBOJR, self.player)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.dive(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.dive(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.dive(state)
    --]]
    
    if ( has("dive") and has("mumbojr") ) then
        logic = 0
    elseif ( has("dive") ) then
        logic = 1
    end
    
    return convertLogic(logic, skip)
end

function connector_JRLU_to_JRLAtlantis(skip)
    local logic = 99
    --[[
    rules.can_pass_octopi(state)
    --]]
    
    logic = access_JRL_canPassOctopi(true)
    
    return convertLogic(logic, skip)
end

function connector_JRLAtlantis_to_JRLSunkenShip(skip)
    local logic = 99
    --[[
    rules.can_pass_octopi(state)
    --]]
    
    logic = access_JRL_canPassOctopi(true)
    
    return convertLogic(logic, skip)
end

function connector_JRLAtlantis_to_JRLU(skip)
    local logic = 99
    --[[
    rules.can_pass_octopi(state)
    --]]
    
    logic = access_JRL_canPassOctopi(true)
    
    return convertLogic(logic, skip)
end

function connector_JRLAtlantis_to_JRLWarps(skip)
    local logic = 99
    
    if ( has("warpjr2") ) then
        logic = 0
    end
    
    return convertLogic(logic, skip)
end

function connector_JRLSunkenShip_to_JRLAtlantis(skip)
    local logic = 99
    --[[
    rules.can_escape_sunken_ship(state)
    --]]
    
    logic = access_JRL_canEscapeSunkenShip(true)
    
    return convertLogic(logic, skip)
end

function connector_JRLSunkenShip_to_JRLLockerCavern(skip)
    local logic = 99
    --[[
    rules.can_escape_sunken_ship(state)
    --]]
    
    logic = access_JRL_canEscapeSunkenShip(true)
    
    return convertLogic(logic, skip)
end

function connector_JRLSunkenShip_to_JRLWarps(skip)
    local logic = 99
    
    if ( has("warpjr3") ) then
        logic = 0
    end
    
    return convertLogic(logic, skip)
end

function connector_JRLSunkenShip_to_GGMWaterStorageJinjo(skip)
    local logic = 99
    --[[        sunken_ship_to_ggm
    if self.world.options.logic_type == LogicType.option_intended:
        return self.ice_eggs_item(state) and self.check_mumbo_magic(state, itemName.MUMBOJR)\
                and self.sub_aqua_egg_aiming(state) and self.talon_torpedo(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        return self.ice_eggs_item(state) and self.check_mumbo_magic(state, itemName.MUMBOJR)\
                    and self.sub_aqua_egg_aiming(state) and self.talon_torpedo(state)\
                or self.ice_eggs_item(state) and self.doubleAir(state) and self.sub_aqua_egg_aiming(state)\
                    and self.air_pit_from_jrl_warp_pads(state) and state.has(itemName.WARPJR4, self.player) and self.talon_torpedo(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        return self.ice_eggs_item(state) and self.check_mumbo_magic(state, itemName.MUMBOJR)\
                    and self.sub_aqua_egg_aiming(state) and self.talon_torpedo(state)\
                or self.ice_eggs_item(state) and self.sub_aqua_egg_aiming(state)\
                    and self.air_pit_from_jrl_warp_pads(state) and state.has(itemName.WARPJR4, self.player) and self.talon_torpedo(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        return self.ice_eggs_item(state) and self.check_mumbo_magic(state, itemName.MUMBOJR)\
                    and self.sub_aqua_egg_aiming(state) and self.talon_torpedo(state)\
                or self.ice_eggs_item(state) and self.sub_aqua_egg_aiming(state)\
                    and self.air_pit_from_jrl_warp_pads(state) and state.has(itemName.WARPJR4, self.player) and self.talon_torpedo(state)
    --]]
    
    if ( has("ieggs") and has("mumbojr") and has("auqaim") and has("ttorp") ) then
        logic = 0
    elseif ( has("ieggs") and has("dair") and has("auqaim") and has("ttorp") and basic_JRL_canGetAirFromWarping() and has("warpjr3") ) then
        logic = 1
    elseif ( has("ieggs") and has("auqaim") and has("ttorp") and basic_JRL_canGetAirFromWarping() and has("warpjr3") ) then
        logic = 2
    end
    
    return convertLogic(logic, skip)
end

function connector_JRLSeaweedSanctum_to_JRLAtlantis(skip)
    local logic = 99
    --[[
    rules.dive(state)
    --]]
    
    if ( has("dive") ) then
        logic = 0
    end
    
    return convertLogic(logic, skip)
end

function connector_JRLSeaweedSanctum_to_JRLBigFishCavern(skip)
    local logic = 99
    --[[        seaweed_to_bfc
    if self.intended_logic(state):
        logic = self.tall_jump(state) and self.grip_grab(state) and self.flap_flip(state) and self.dive(state)
    elif self.easy_tricks_logic(state):
        logic = self.dive(state)\
                and self.flap_flip(state)\
                and self.tall_jump(state)\
                and (self.beak_buster(state) or self.grip_grab(state))
    elif self.hard_tricks_logic(state):
        logic = self.dive(state)\
                and self.flap_flip(state)\
                and self.tall_jump(state)\
                and (self.beak_buster(state) or self.grip_grab(state))
    elif self.glitches_logic(state):
        logic = self.dive(state)\
                and self.flap_flip(state)\
                and self.tall_jump(state)\
                and (self.beak_buster(state) or self.grip_grab(state))
    --]]
    
    if ( has("tjump") and has("dive") and has("fflip") and has("ggrab") ) then
        logic = 0
    elseif ( has("tjump") and has("dive") and has("fflip") and has("bbust") ) then
        logic = 1
    end
    
    return convertLogic(logic, skip)
end

function connector_JRLLockerCavern_to_JRLSunkenShip(skip)
    local logic = 99
    --[[        locker_cavern_to_sunken_ship
    if self.intended_logic(state):
        logic = self.ice_eggs_item(state) and state.has(itemName.MUMBOJR, self.player) and self.sub_aqua_egg_aiming(state)\
                or self.humbaJRL(state)
    elif self.easy_tricks_logic(state):
        logic = self.ice_eggs_item(state) and state.has(itemName.MUMBOJR, self.player) and self.sub_aqua_egg_aiming(state)\
                or self.ice_eggs_item(state) and self.doubleAir(state) and self.sub_aqua_egg_aiming(state)\
                    and self.air_pit_from_jrl_warp_pads(state) and state.has(itemName.WARPJR5, self.player)\
                or self.humbaJRL(state)
    elif self.hard_tricks_logic(state):
        logic = state.has(itemName.MUMBOJR, self.player)\
                or self.air_pit_from_jrl_warp_pads(state) and state.has(itemName.WARPJR5, self.player)\
                or self.humbaJRL(state)
    elif self.glitches_logic(state):
        logic = state.has(itemName.MUMBOJR, self.player)\
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
end

function connector_JRLLockerCavern_to_JRLBigFishCavern(skip)
    local logic = 99
    --[[        locker_cavern_to_big_fish_cavern
    if self.intended_logic(state):
        logic = self.ice_eggs_item(state) and state.has(itemName.MUMBOJR, self.player) and self.sub_aqua_egg_aiming(state)\
                or self.humbaJRL(state)
    elif self.easy_tricks_logic(state):
        logic = self.ice_eggs_item(state) and state.has(itemName.MUMBOJR, self.player) and self.sub_aqua_egg_aiming(state)\
                or self.ice_eggs_item(state) and self.doubleAir(state) and self.sub_aqua_egg_aiming(state)\
                    and self.air_pit_from_jrl_warp_pads(state) and state.has(itemName.WARPJR5, self.player)\
                or self.humbaJRL(state)
    elif self.hard_tricks_logic(state):
        logic = state.has(itemName.MUMBOJR, self.player)\
                or self.air_pit_from_jrl_warp_pads(state) and state.has(itemName.WARPJR5, self.player)\
                or self.humbaJRL(state)
    elif self.glitches_logic(state):
        logic = state.has(itemName.MUMBOJR, self.player)\
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
end

function connector_JRLLockerCavern_to_JRLWarps(skip)
    local logic = 99
    
    if ( has("warpjr5") ) then
        logic = 0
    end
    
    return convertLogic(logic, skip)
end

function connector_JRLBigFishCavern_to_JRLLockerCavern(skip)
    local logic = 99
    --[[        big_fish_cave_to_locker_cavern
    if self.world.options.logic_type == LogicType.option_intended:
        return self.ice_eggs_item(state) and self.check_mumbo_magic(state, itemName.MUMBOJR) and self.sub_aqua_egg_aiming(state)\
                or self.humbaJRL(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        return self.ice_eggs_item(state) and self.check_mumbo_magic(state, itemName.MUMBOJR) and self.sub_aqua_egg_aiming(state)\
                or self.ice_eggs_item(state) and self.doubleAir(state) and self.sub_aqua_egg_aiming(state)\
                    and (
                        self.air_pit_from_jrl_warp_pads(state) and state.has(itemName.WARPJR4, self.player)\
                        or self.dive(state)
                    )\
                or self.humbaJRL(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        return self.check_mumbo_magic(state, itemName.MUMBOJR)\
                or self.air_pit_from_jrl_warp_pads(state) and state.has(itemName.WARPJR4, self.player)\
                or self.dive(state)\
                or self.humbaJRL(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        return self.check_mumbo_magic(state, itemName.MUMBOJR)\
                or self.air_pit_from_jrl_warp_pads(state) and state.has(itemName.WARPJR4, self.player)\
                or self.dive(state)\
                or self.humbaJRL(state)
    --]]
    
    jrlHumba = access_JRL_humba(true)
    
    -- Normal Logic
    if ( has("ieggs") and has("mumbojr") and has("auqaim") or jrlHumba <= logictype.CurrentStage ) then
        logic = 0
    elseif ( has("ieggs") and has("dair") and has("auqaim") and (has("warpjr1") and has("warpjr4") or has("dive")) or jrlHumba < 2 ) then
        logic = 1
    elseif ( has("mumbojr") or has("warpjr1") and has("warpjr4") or has("dive") ) then
        logic = 2
        
    -- Sequence Breaking
    else
        logic = jrlHumba
    end
    
    return convertLogic(logic, skip)
end

function connector_JRLBigFishCavern_to_JRLWarps(skip)
    local logic = 99
    
    if ( has("warpjr4") ) then
        logic = 0
    end
    
    return convertLogic(logic, skip)
end

function connector_JRLWarps_to_JRL(skip)
    local logic = 99
    
    if ( has("warpjr1") ) then
        logic = 0
    end
    
    return convertLogic(logic, skip)
end

function connector_JRLWarps_to_JRLAtlantis(skip)
    local logic = 99
    
    if ( has("warpjr2") and basic_JRL_canGetAirFromWarping() ) then
        logic = 0
    end
    
    return convertLogic(logic, skip)
end

function connector_JRLWarps_to_JRLSunkenShip(skip)
    local logic = 99
    
    if ( has("warpjr3") and basic_JRL_canGetAirFromWarping() ) then
        logic = 0
    end
    
    return convertLogic(logic, skip)
end

function connector_JRLWarps_to_JRLLockerCavern(skip)
    local logic = 99
    
    if ( has("warpjr5") and basic_JRL_canGetAirFromWarping() ) then
        logic = 0
    end
    
    return convertLogic(logic, skip)
end

function connector_JRLWarps_to_JRLBigFishCavern(skip)
    local logic = 99
    
    if ( has("warpjr4") and basic_JRL_canGetAirFromWarping() ) then
        logic = 0
    end
    
    return convertLogic(logic, skip)
end

function connector_HFP_to_MTKS(skip)
    local logic = 99
    --[[        HFP_to_MT
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.has_explosives(state)\
                or self.dragon_kazooie(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.has_explosives(state) or \
                self.check_mumbo_magic(state, itemName.MUMBOHP)\
                or self.dragon_kazooie(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.has_explosives(state) or \
                self.check_mumbo_magic(state, itemName.MUMBOHP)\
                or self.dragon_kazooie(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.has_explosives(state) or \
                self.check_mumbo_magic(state, itemName.MUMBOHP)\
                or self.dragon_kazooie(state)
    --]]
    
    local explosives = can_shootExplosiveEggs(true)
    local dragonKazooie = can_getDragonKazooie(true)
    
    -- Normal Logic
    if ( explosives <= logictype.CurrentStage or dragonKazooie <= logictype.CurrentStage ) then
        logic = 0
    elseif ( has("mumbohp") ) then
        logic = 1
    
    -- Sequence Breaking
    else
        logic = math.min(explosives, dragonKazooie)
    end
    
    return convertLogic(logic, skip)
end

function connector_HFP_to_JRL(skip)
    local logic = 99
    --[[        HFP_to_JRL
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.HFP_hot_water_cooled(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.HFP_hot_water_cooled(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.HFP_hot_water_cooled(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.HFP_hot_water_cooled(state)\
                or (self.grip_grab(state) and (self.flutter(state) or self.air_rat_a_tat_rap(state)) and self.ground_rat_a_tat_rap(state) and self.tall_jump(state))
    --]]
    
    local canCoolHotWater = access_HFP_canCoolHotWater(true)
    
    -- Normal Logic
    if ( canCoolHotWater <= logictype.CurrentStage ) then
        logic = 0
    elseif ( canCoolHotWater < 3 ) then
        logic = canCoolHotWater
    elseif ( has("ggrab") and has("grat") and has("tjump") and (has("flutter") or has("arat")) ) then
        logic = 3
    
    -- Sequence Breaking
    else
        logic = canCoolHotWater
    end
    
    return convertLogic(logic, skip)
end

function connector_WL_to_IOHWarps(skip)
    local logic = 99
    
    if ( has("siloiohwl") or has("randomizesilos_off") ) then
        logic = 0
    end
    
    return convertLogic(logic, skip)
end

function connector_IOHWarps_to_WL(skip)
    local logic = 99
    
    if ( has("siloiohwl") ) then
        logic = 0
    end
    
    return convertLogic(logic, skip)
end

function connector_WL_to_PGU(skip)
    local logic = 99
    --[[        WL_to_PGU
    # Going through the loading zone gives you dive for free, which is a thing beginners would not know.
    # If nestsanity is turned on, players are forced to go through the digger tunnel
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.talon_torpedo(state) and self.dive(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks : # normal
        logic = self.talon_torpedo(state)\
                and (not self.world.options.nestsanity or self.dive(state) or self.beak_buster(state))
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.talon_torpedo(state)\
                and (not self.world.options.nestsanity or self.dive(state) or self.beak_buster(state))
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = (not self.world.options.nestsanity or self.dive(state) or self.beak_buster(state))
    --]]
    
    if ( has("dive") and has("ttorp") ) then
        logic = 0
    elseif ( has("ttorp") and (has("bbust") or has("nestsanity_off")) ) then
        logic = 1
    elseif ( has("dive") or has("bbust") or has("nestsanity_off") ) then
        logic = 3
    end
    
    return convertLogic(logic, skip)
end

function connector_WL_to_QM(skip)
    local logic = 99
    --[[
    rules.springy_step_shoes(state)
    --]]
    
    if ( has("springb") ) then
        logic = 0
    end
    
    return convertLogic(logic, skip)
end

function connector_TDL_to_WW(skip)
    local logic = 99
    --[[
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.oogle_boogles_open(state) and (self.spring_pad(state) or self.has_explosives(state))
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.oogle_boogles_open(state) and (self.spring_pad(state) or self.has_explosives(state))
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.oogle_boogles_open(state) and (self.spring_pad(state) or self.has_explosives(state))
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = (self.spring_pad(state) or self.has_explosives(state)) and (self.oogle_boogles_open(state) or \
            self.clockwork_warp(state))
    --]]
    
    local oogleBooglesOpen = access_TDL_oogleBooglesOpen(true)
    local explosives = can_shootExplosiveEggs(true)
    
    -- Normal Logic
    if ( oogleBooglesOpen <= logictype.CurrentStage and (has("tjump") or explosives <= logictype.CurrentStage) ) then
        logic = 0
    elseif ( oogleBooglesOpen < 3 and explosives < 3 ) then
        logic = math.max(oogleBooglesOpen, explosives)
    elseif ( can_clockworkWarp() ) then
        logic = 3
    
    -- Sequence Breaking
    else
        logic = math.max(oogleBooglesOpen, explosives)
    end
    
    return convertLogic(logic, skip)
end

function connector_TDL_to_TDLHatch(skip)
    local logic = 99
    --[[        tdl_to_hatch
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.long_jump(state)\
                or self.springy_step_shoes(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.long_jump(state)\
                or self.springy_step_shoes(state)\
                or self.split_up(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.long_jump(state)\
                or self.springy_step_shoes(state)\
                or state.can_reach_region(regionName.TLTOP, self.player)\
                or self.split_up(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.long_jump(state)\
                or self.springy_step_shoes(state)\
                or self.TDL_flight_pad(state)\
                or self.split_up(state)\
                or state.can_reach_region(regionName.TLTOP, self.player)
    --]]
    
    local tdlTAccessibility = Tracker:FindObjectForCode("@Region: Terrydactyland - Top").AccessibilityLevel
    local tdlFlightPad = access_TDL_flightPad(true)
    
    -- Normal Logic
    if ( can_longJump() or has("springb") ) then
        logic = 0
    elseif ( has("splitup") ) then
        logic = 1
    elseif ( tdlTAccessibility == AccessibilityLevel.Normal or tdlTAccessibility == AccessibilityLevel.Cleared ) then
        logic = 2
    elseif ( tdlFlightPad <= logictype.CurrentStage ) then
        logic = 3
    
    -- Sequence Breaking
    elseif ( tdlTAccessibility > AccessibilityLevel.None ) then
        logic = math.min(logictype.CurrentStage + 1, tdlFlightPad)
    end
    
    return convertLogic(logic, skip)
end

function connector_TDL_to_WWA51(skip)
    local logic = 99
    --[[        a51_nests_from_TDL
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.oogle_boogles_open(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.oogle_boogles_open(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.oogle_boogles_open(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.oogle_boogles_open(state) or self.clockwork_warp(state)
    --]]
    
    local oogleBooglesOpen = access_TDL_oogleBooglesOpen(true)
    
    -- Normal Logic
    if ( oogleBooglesOpen <= logictype.CurrentStage ) then
        logic = 0
    elseif ( oogleBooglesOpen < 3 ) then
        logic = oogleBooglesOpen
    elseif ( can_clockworkWarp() ) then
        logic = 3
    
    -- Sequence Breaking
    else
        logic = oogleBooglesOpen
    end
    
    return convertLogic(logic, skip)
end

function connector_TDL_to_TDLTop(skip)
    local logic = 99
    --[[        tdl_to_tdl_top
    if self.world.options.logic_type == LogicType.option_intended:
        return self.springy_step_shoes(state)\
                    and (self.tall_jump(state) and (self.flutter(state) or self.air_rat_a_tat_rap(state))\
                        or self.talon_trot(state))\
                or self.TDL_flight_pad(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        return self.springy_step_shoes(state)\
                    and (self.tall_jump(state) and (self.flutter(state) or self.air_rat_a_tat_rap(state))\
                        or self.talon_trot(state))\
                or self.TDL_flight_pad(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        return self.springy_step_shoes(state)\
                or self.TDL_flight_pad(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        return self.springy_step_shoes(state)\
                or self.TDL_flight_pad(state)
    --]]
    
    local tdlFlight = access_TDL_flightPad(true)
    
    -- Normal Logic
    if ( has("springb") and (has("tjump") and (has("flutter") or has("arat")) or has("ttrot")) or tdlFlight <= logictype.CurrentStage ) then
        logic = 0
    elseif ( tdlFlight < 2 ) then
        logic = 1 -- Sequence Breaking
    elseif ( has("springb") ) then
        logic = 2
    
    -- Sequence Breaking
    else
        logic = tdlFlight
    end
    
    return convertLogic(logic, skip)
end

function connector_TDL_to_TDLWarps(skip)
    local logic = 99
    --[[
    return state.has(itemName.WARPTL1, self.player)\
            or state.has(itemName.WARPTL3, self.player) and state.can_reach_location(locationName.WARPTL3, self.player)\
            or state.has(itemName.WARPTL4, self.player) and state.can_reach_location(locationName.WARPTL4, self.player)
    --]]
    
    local mumboWarp = warp_TDL_mumbo(true)
    local humbaWarp = warp_TDL_humba(true)
    
    -- Normal Logic
    if ( has("warptl1") or has("warptl3") and mumboWarp <= logictype.CurrentStage or has("warptl4") and humbaWarp <= logictype.CurrentStage ) then
        logic = 0
        
    -- Sequence Breaking
    else
        local mumbo = 99
        if ( has("warptl3") ) then
            mumbo = mumboWarp
        end
        
        local humba = 99
        if ( has("warptl4") ) then
            humba = humbaWarp
        end
        
        logic = math.min(mumbo, humba)
    end
    
    return convertLogic(logic, skip)
end

function connector_TDL_to_TDLIMTop(skip)
    local logic = 99
    --[[        inside_the_mountain_to_top
     if self.world.options.logic_type == LogicType.option_intended:
        logic = self.flight_pad(state)\
                and (self.tall_jump(state) or self.grip_grab(state))
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.flight_pad(state)\
                and (self.tall_jump(state) or self.beak_buster(state) or self.grip_grab(state))
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.flight_pad(state)\
                and (self.tall_jump(state) or self.beak_buster(state) or self.grip_grab(state))
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.flight_pad(state)\
                and (self.tall_jump(state) or self.beak_buster(state) or self.grip_grab(state))
     --]]
    
    if ( has("fpad") and (has("tjump") or has("ggrab")) ) then
        logic = 0
    elseif ( has("fpad") and has("bbust") ) then
        logic = 1
    end
    
    return convertLogic(logic, skip)
end

function connector_TDLTop_and_TDLStompingPlains(skip) -- connector_TDLTop_to_TDLStompingPlains and connector_TDLStompingPlains_to_TDLTop
    local logic = 99
    --[[        can_cross_bonfire_cavern
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.ice_eggs(state) and self.long_jump(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = (self.ice_eggs(state)) and self.long_jump(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = (self.long_jump(state) or self.talon_trot(state))
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = (self.long_jump(state) or self.talon_trot(state))
    --]]
    
    if ( can_shootEggs("ieggs") and can_longJump() ) then
        logic = 0
    elseif ( has("ttrot") or can_longJump() ) then
        logic = 2
    end
    
    return convertLogic(logic, skip)
end

function connector_TDLTop_to_TDLWarps(skip)
    local logic = 99
    
    if ( has("warptl5") ) then
        logic = 0
    end
    
    return convertLogic(logic, skip)
end

function connector_TDLStompingPlains_to_TDLWarps(skip)
    local logic = 99
    
    if ( has("warptl2") ) then
        logic = 0
    end
    
    return convertLogic(logic, skip)
end

function connector_TDLWarps_to_TDL(skip)
    local logic = 99
    
    if ( has("warptl1") or has("warptl3") or has("warptl4") ) then
        logic = 0
    end
    
    return convertLogic(logic, skip)
end

function connector_TDLWarps_to_TDLTop(skip)
    local logic = 99
    
    if ( has("warptl5") ) then
        logic = 0
    end
    
    return convertLogic(logic, skip)
end

function connector_TDLWarps_to_TDLStompingPlains(skip)
    local logic = 99
    
    if ( has("warptl2") ) then
        logic = 0
    end
    
    return convertLogic(logic, skip)
end

function connector_QM_to_IOHWarps(skip)
    local logic = 99
    
    if ( has("siloiohqm") or has("randomizesilos_off") ) then
        logic = 0
    end
    
    return convertLogic(logic, skip)
end

function connector_IOHWarps_to_QM(skip)
    local logic = 99
    
    if ( has("siloiohqm") ) then
        logic = 0
    end
    
    return convertLogic(logic, skip)
end

function connector_QM_to_WL(skip)
    local logic = 99
    --[[        QM_to_WL
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.grip_grab(state) and self.flap_flip(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = (self.grip_grab(state) or self.beak_buster(state)) and self.flap_flip(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = (self.grip_grab(state) or self.beak_buster(state)) and self.flap_flip(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = (self.grip_grab(state) or self.beak_buster(state)) and self.flap_flip(state)
    --]]
    
    if ( has("ggrab") and has("fflip") ) then
        logic = 0
    elseif ( has("fflip") and has("bbust") ) then
        logic = 1
    end
    
    return convertLogic(logic, skip)
end

function connector_QM_to_CK(skip)
    local logic = 99
    --[[        quag_to_CK
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.claw_clamber_boots(state) and self.ck_jiggy(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.claw_clamber_boots(state) and self.ck_jiggy(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.claw_clamber_boots(state) and self.ck_jiggy(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = (self.clockwork_warp(state) and self.talon_trot(state) and self.climb(state) and self.beak_buster(state) or self.claw_clamber_boots(state))\
                and (self.ck_jiggy(state) or (self.climb(state) and self.tall_jump(state) and self.beak_buster(state) and (self.flutter(state) or self.air_rat_a_tat_rap(state))))
    --]]
    
    if ( has("cka") and has("clawbts") ) then
        logic = 0
    elseif ( (has("clawbts") or has("ttrot") and has("climb") and has("bbust") and can_clockworkWarp()) and (has("cka") or has("climb") and has("tjump") and has("bbust") and (has("flutter") or has("arat"))) ) then
        logic = 3
    end
    
    return convertLogic(logic, skip)
end

function connector_GIO_to_GIF1(skip)
    local logic = 99
    --[[        outside_gi_to_floor1
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.world.options.open_gi_frontdoor
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.world.options.open_gi_frontdoor
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.world.options.open_gi_frontdoor
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.clockwork_shot(state) or self.world.options.open_gi_frontdoor
    --]]

    if ( has("opengi_on") ) then
        logic = 0
    elseif ( can_clockworkShot() ) then
        logic = 3
    end
    
    return convertLogic(logic, skip)
end

function connector_GIO_to_GIOBack(skip)
    local logic = 99
    --[[        outside_gi_to_outside_back
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.climb(state) and self.flap_flip(state) and self.long_jump(state) and self.grip_grab(state) # The intended way to not take damage!
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.climb(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.climb(state) or self.extremelyLongJump(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.climb(state) or self.extremelyLongJump(state)
    --]]
    
    local extremelyLongJump = can_extremelyLongJump(true)
    
    -- Normal Logic
    if ( has("climb") and has("fflip") and can_longJump() and has("ggrab") ) then
        logic = 0
    elseif ( has("climb") ) then
        logic = 1
    elseif ( extremelyLongJump <= logictype.CurrentStage ) then
        logic = 2
    
    -- Sequence Breaking
    else
        logic = extremelyLongJump
    end
    
    return convertLogic(logic, skip)
end

function connector_GIO_to_GIFlight(skip)
    local logic = 99
    --[[        outside_gi_to_flight
    self.outside_gi_to_outside_back(state) and self.flight_pad(state) and self.gi_flight_pad_switch(state)      -- not sure why this is a connector for outside and not just from outside back since that is a clear requirement, but we'll roll with it
    --]]
    
    getToBack = connector_GIO_to_GIOBack(true)
    flightPadSwitch = access_GI_flightPadSwitch(true)
    
    -- Normal Logic
    if ( getToBack <= logictype.CurrentStage and has("fpad") and flightPadSwitch <= logictype.CurrentStage ) then
        logic = 0
    
    -- Sequence Breaking
    elseif ( has("fpad") ) then
        logic = math.max(getToBack, flightPadSwitch)
    end
    
    return convertLogic(logic, skip)
end

function connector_GIOBack_to_GIO(skip)
    local logic = 99
    --[[
    rules.climb(state)
    --]]
    
    if ( has("climb") ) then
        logic = 0
    end
    
    return convertLogic(logic, skip)
end

function connector_GIOBack_to_GIF2(skip)
    local logic = 99
    --[[        outside_gi_back_to_floor2
    if self.world.options.logic_type == LogicType.option_intended:
        logic = False
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = False
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = False
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.clockwork_eggs(state) and (self.climb(state) or self.extremelyLongJump(state))
    --]]
    
    extremelyLongJump = can_extremelyLongJump(true)
    
    -- Normal Logic
    if ( can_shootEggs("ceggs") and (has("climb") or extremelyLongJump <= logictype.CurrentStage) ) then
        logic = 3
    
    -- Sequence Breaking
    elseif ( can_shootEggs("ceggs") ) then
        logic = math.max(3, extremelyLongJump)
    end
    
    return convertLogic(logic, skip)
end

function connector_GIOBack_to_GIF3(skip)
    local logic = 99
    --[[        outside_gi_back_to_floor_3
    if self.world.options.logic_type == LogicType.option_intended:
        logic = False
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.claw_clamber_boots(state) and (self.flutter(state) or self.air_rat_a_tat_rap(state))
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.claw_clamber_boots(state) and (self.flutter(state) or self.air_rat_a_tat_rap(state))
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.claw_clamber_boots(state) and (self.flutter(state) or self.air_rat_a_tat_rap(state))
    --]]
    
    if ( has("clawbts") and (has("flutter") or has("arat")) ) then
        logic = 1
    end
    
    return convertLogic(logic, skip)
end

function connector_GIOBack_to_GIF4(skip)
    local logic = 99
    --[[        outside_gi_back_to_floor_4
    if self.world.options.logic_type == LogicType.option_intended:
        logic = False
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.claw_clamber_boots(state) and (self.flutter(state) or self.air_rat_a_tat_rap(state)) and self.small_elevation(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.claw_clamber_boots(state) and (self.flutter(state) or self.air_rat_a_tat_rap(state))
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.claw_clamber_boots(state) and (self.flutter(state) or self.air_rat_a_tat_rap(state))
    --]]
    
    if ( has("clawbts") and can_reachSmallElevation() and (has("flutter") or has("arat")) ) then
        logic = 1
    elseif ( has("clawbts") and (has("flutter") or has("arat")) ) then
        logic = 2
    end
    
    return convertLogic(logic, skip)
end

function connector_GIOBack_to_GIFlight(skip)
    local logic = 99
    --[[        outside_gi_back_to_flight
    self.climb(state) and self.flight_pad(state) and self.gi_flight_pad_switch(state)
    --]]
    
    local flightPadSwitch = access_GI_flightPadSwitch(true)
    
    -- Normal Logic
    if ( has("climb") and has("fpad") and flightPadSwitch <= logictype.CurrentStage ) then
        logic = 0
    
    -- Sequence Breaking
    elseif ( has("climb") and has("fpad") ) then
        logic = flightPadSwitch
    end
    
    return convertLogic(logic, skip)
end

function connector_GIElevatorShaft_to_GIF1(skip)
    local logic = 99
    --[[        elevator_shaft_to_floor_1
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.climb(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.climb(state) or self.beak_buster(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.climb(state) or self.beak_buster(state)\
                or state.can_reach_region(regionName.GI2EM, self.player) and self.em_chamber_to_elevator_shaft(state)\                          -- this just calls the elevator door function
                or state.can_reach_region(regionName.GI3B, self.player) and self.health_7(state) and self.boiler_plant_to_elevator_shaft(state)\        -- this just calls the elevator door function
                or state.can_reach_region(regionName.GI4B, self.player) and self.health_10(state) and self.floor_4_back_to_elevator_shaft(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.climb(state) or self.beak_buster(state)\
                or state.can_reach_region(regionName.GI2EM, self.player) and self.em_chamber_to_elevator_shaft(state)\
                or state.can_reach_region(regionName.GI3B, self.player) and self.health_7(state) and self.boiler_plant_to_elevator_shaft(state)\
                or state.can_reach_region(regionName.GI4B, self.player) and self.health_10(state) and self.floor_4_back_to_elevator_shaft(state)
    --]]
    
    -- Normal Logic
    if ( has("climb") ) then
        logic = 0
    elseif ( has("bbust") ) then
        logic = 1
    else
        local gi2emAccessibility = Tracker:FindObjectForCode("@Region: Grunty Industries 2nd Floor - Electromagnetic Chamber").AccessibilityLevel
        local gi3bpAccessibility = Tracker:FindObjectForCode("@Region: Grunty Industries 3rd Floor - Boiler Plant").AccessibilityLevel
        local gi4bAccessibility = Tracker:FindObjectForCode("@Region: Grunty Industries 4th Floor - Past the Crushers").AccessibilityLevel
        local gif4BackToElevatorShaft = connector_GIF4Back_to_GIElevatorShaft(true)
        local hp7 = health_canGet7(true)
        local hp10 = health_canGet10(true)
    
        if ( basic_GI_elevatorDoor() and (gi2emAccessibility == AccessibilityLevel.Normal or gi2emAccessibility == AccessibilityLevel.Cleared or (gi3bpAccessibility == AccessibilityLevel.Normal or gi3bpAccessibility == AccessibilityLevel.Cleared) and hp7 <= logictype.CurrentStage) or ((gi4bAccessibility == AccessibilityLevel.Normal or gi4bAccessibility == AccessibilityLevel.Cleared) and hp10 <= logictype.CurrentStage and gif4BackToElevatorShaft <= logictype.CurrentStage) ) then
            logic = 2
        
        -- Sequence Breaking
        else
            local fromF2 = 99
            if ( basic_GI_elevatorDoor() and gi2emAccessibility > AccessibilityLevel.None ) then
                fromF2 = logictype.CurrentStage + 1
            end
            
            local fromF3 = 99
            if ( basic_GI_elevatorDoor() and gi3emAccessibility > AccessibilityLevel.None ) then
                fromF3 = math.max(logictype.CurrentStage + 1, hp7)
            end
            
            local fromF4 = 99
            if ( gi4bAccessibility == AccessibilityLevel.Normal or gi4bAccessibility == AccessibilityLevel.Cleared ) then
                fromF4 = math.max(gif4BackToElevatorShaft, hp10)
            elseif ( gi4bAccessibility > AccessibilityLevel.None ) then
                fromF4 = math.max(logictype.CurrentStage + 1, gif4BackToElevatorShaft, hp10)
            end
            
            logic = math.max(2, math.min(fromF2, fromF3, fromF4))
        end
    end
    
    return convertLogic(logic, skip)
end

function connector_GIElevatorShaft_to_GIF2ElectromagneticChamber(skip)
    local logic = 99
    --[[        elevator_shaft_to_em
    if self.world.options.logic_type == LogicType.option_intended:
        logic = False
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = False
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = False
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = (self.climb(state)\
                    or state.can_reach_region(regionName.GI3B, self.player) and self.boiler_plant_to_elevator_shaft(state)\
                    or state.can_reach_region(regionName.GI4B, self.player) and (self.health_7(state) or self.beak_buster(state)) and self.floor_4_back_to_elevator_shaft(state))\
                and self.breegull_bash(state)
    --]]
    
    -- Normal Logic
    if ( has_bregullBash() and has("climb") ) then
        logic = 3
    elseif ( has_bregullBash() ) then
        local gi3bpAccessibility = Tracker:FindObjectForCode("@Region: Grunty Industries 3rd Floor - Boiler Plant").AccessibilityLevel
        local gi4bAccessibility = Tracker:FindObjectForCode("@Region: Grunty Industries 4th Floor - Past the Crushers").AccessibilityLevel
        local gif4BackToElevatorShaft = connector_GIF4Back_to_GIElevatorShaft(true)
        local hp7 = health_canGet7(true)
        
        if ( (gi3bpAccessibility == AccessibilityLevel.Normal or gi3bpAccessibility == AccessibilityLevel.Cleared) and basic_GI_elevatorDoor() or (gi4bAccessibility == AccessibilityLevel.Normal or gi4bAccessibility == AccessibilityLevel.Cleared) and (hp7 <= logictype.CurrentStage or has("bbust")) and gif4BackToElevatorShaft <= logictype.CurrentStage ) then
            logic = 3
            
        -- Sequence Breaking
        else
            local fromF3 = 99
            if ( basic_GI_elevatorDoor() and gi3emAccessibility > AccessibilityLevel.None ) then
                fromF3 = logictype.CurrentStage + 1
            end
            
            local fromF4bbust = 99
            if ( has("bbust") and (gi4bAccessibility == AccessibilityLevel.Normal or gi4bAccessibility == AccessibilityLevel.Cleared) ) then
                fromF4bbust = gif4BackToElevatorShaft
            elseif ( has("bbust") and gi4bAccessibility > AccessibilityLevel.None ) then
                fromF4bbust = math.max(logictype.CurrentStage + 1, gif4BackToElevatorShaft)
            end
            
            local fromF4hp = 99
            if ( gi4bAccessibility == AccessibilityLevel.Normal or gi4bAccessibility == AccessibilityLevel.Cleared ) then
                fromF4hp = math.max(gif4BackToElevatorShaft, hp7)
            elseif ( gi4bAccessibility > AccessibilityLevel.None ) then
                fromF4hp = math.max(logictype.CurrentStage + 1, gif4BackToElevatorShaft, hp7)
            end
            
            logic = math.max(3, math.min(fromF3, fromF4bbust, fromF4hp))
        end
    end
    
    return convertLogic(logic, skip)
end

function connector_GIElevatorShaft_to_GIF3BoilerPlant(skip)
    local logic = 99
    --[[        elevator_shaft_to_boiler_plant
    if self.world.options.logic_type == LogicType.option_intended:
        logic = False
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = False
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = False
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = (self.climb(state)\
                    or state.can_reach_region(regionName.GI4B, self.player) and self.floor_4_back_to_elevator_shaft(state))\
                and self.breegull_bash(state)
    --]]
    
    -- Normal Logic
    if ( has_bregullBash() and has("climb") ) then
        logic = 3
    elseif ( has_bregullBash() ) then
        local gi4bAccessibility = Tracker:FindObjectForCode("@Region: Grunty Industries 4th Floor - Past the Crushers").AccessibilityLevel
        local gif4BackToElevatorShaft = connector_GIF4Back_to_GIElevatorShaft(true)
        
        if ( (gi4bAccessibility == AccessibilityLevel.Normal or gi4bAccessibility == AccessibilityLevel.Cleared) and gif4BackToElevatorShaft <= logictype.CurrentStage ) then
            logic = 3
            
        -- Sequence Breaking
        elseif ( gi4bAccessibility == AccessibilityLevel.Normal or gi4bAccessibility == AccessibilityLevel.Cleared ) then
            logic = math.max(3, gif4BackToElevatorShaft)
        elseif ( gi4bAccessibility > AccessibilityLevel.None ) then
            logic = math.max(3, logictype.CurrentStage + 1, gif4BackToElevatorShaft)
        end
    end
    
    return convertLogic(logic, skip)
end

function connector_GIElevatorShaft_to_GIF4Back(skip)
    local logic = 99
    --[[        elevator_shaft_to_floor_4
    if self.world.options.logic_type == LogicType.option_intended:
        logic = False
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = False
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = False
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.climb(state) and (self.breegull_bash(state) or self.grenade_eggs(state) and self.egg_aim(state))
    --]]
    
    if ( has("climb") and (has_bregullBash() or has("geggs") and has("eggaim")) ) then
        logic = 3
    end
    
    return convertLogic(logic, skip)
end

function connector_GIF1_to_GIO(skip)
    local logic = 99
    --[[
    rules.split_up(state)
    --]]
    
    if ( has("splitup") or has("opengi_on") ) then
        logic = 0
    end
    
    return convertLogic(logic, skip)
end

function connector_GIF1_to_GIF2(skip)
    local logic = 99
    --[[        F1_to_F2
     if self.world.options.logic_type == LogicType.option_intended:
        logic = self.claw_clamber_boots(state) and (self.spring_pad(state) or self.leg_spring(state))
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.claw_clamber_boots(state) and (self.spring_pad(state) or self.leg_spring(state))
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.claw_clamber_boots(state) and (self.spring_pad(state) or self.leg_spring(state))
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.claw_clamber_boots(state) and (self.spring_pad(state) or self.leg_spring(state))
     --]]
    
    if ( has("clawbts") and (has("tjump") or has_legSpring()) ) then
        logic = 0
    elseif ( has("randomizewarppads_off") and has_legSpring() and has_glide() and has_wingWhack() ) then
        logic = 7 -- solo kazooie to go get the warp pad
    end
    
    return convertLogic(logic, skip)
end

function connector_GIF1_to_GIWarps(skip)
    local logic = 99
    --[[
    (rules.split_up(state) or self.options.open_gi_frontdoor) and state.has(itemName.WARPGI1, player)
    --]]
    
    if ( (has("splitup") or has("opengi_on")) and has("warpgi1") ) then
        logic = 0
    end
    
    return convertLogic(logic, skip)
end

function connector_GIWarps_to_GIF2(skip)
    local logic = 99
    --[[
    state.has(itemName.WARPGI2, player)
    --]]
    
    if ( has("warpgi2") ) then
        logic = 0
    end
    
    return convertLogic(logic, skip)
end

function connector_GIWarps_to_GIF3(skip)
    local logic = 99
    --[[
    state.has(itemName.WARPGI3, player)
    --]]
    
    if ( has("warpgi3") ) then
        logic = 0
    end
    
    return convertLogic(logic, skip)
end

function connector_GIWarps_to_GIF4(skip)
    local logic = 99
    --[[
    state.has(itemName.WARPGI4, player)
    --]]
    
    if ( has("warpgi4") ) then
        logic = 0
    end
    
    return convertLogic(logic, skip)
end

function connector_GIWarps_to_GIRoof(skip)
    local logic = 99
    --[[
    state.has(itemName.WARPGI5, player)
    --]]
    
    if ( has("warpgi5") ) then
        logic = 0
    end
    
    return convertLogic(logic, skip)
end

function connector_GIF2_to_GIF1(skip)
    local logic = 99
    --[[        F2_to_F1
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.grip_grab(state) and self.flap_flip(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = (self.grip_grab(state) or self.beak_buster(state)) and self.flap_flip(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = (self.grip_grab(state) or self.beak_buster(state)) and self.flap_flip(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = (self.grip_grab(state) or self.beak_buster(state)) and self.flap_flip(state)
    --]]
    
    if ( has("ggrab") and has("fflip") ) then
        logic = 0
    elseif ( has("fflip") and has("bbust") ) then
        logic = 1
    end
    
    return convertLogic(logic, skip)
end

function connector_GIF2_to_GIF2ElectromagneticChamber(skip)
    local logic = 99
    --[[        floor_2_to_em_room
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.floor_2_split_up(state) and self.grip_grab(state) and self.can_use_battery(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.floor_2_split_up(state) and self.can_use_battery(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.floor_2_split_up(state) and self.can_use_battery(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.floor_2_split_up(state) and self.can_use_battery(state)
    --]]
    
    if ( has("splitup") and has("ggrab") and basic_GI_canUseBattery() ) then
        logic = 0
    elseif ( has("splitup") and basic_GI_canUseBattery() ) then
        logic = 1
    end
    
    return convertLogic(logic, skip)
end

function connector_GIF2_to_GIF3(skip)
    local logic = 99
    --[[        F2_to_F3
    if self.world.options.logic_type == LogicType.option_intended:
        logic = (self.flap_flip(state) and self.grip_grab(state) and self.claw_clamber_boots(state) and self.climb(state))
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = ((self.flap_flip(state) and self.grip_grab(state) or self.veryLongJump(state)) and self.claw_clamber_boots(state) and self.climb(state))\
                # or self.leg_spring(state) and self.floor_2_split_up(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = ((self.flap_flip(state) and self.grip_grab(state) or self.veryLongJump(state)) and self.claw_clamber_boots(state) and self.climb(state))\
                # or self.leg_spring(state) and self.floor_2_split_up(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = ((self.flap_flip(state) and self.grip_grab(state) or self.veryLongJump(state))\
                    and self.claw_clamber_boots(state)\
                    and (self.climb(state) or (self.grenade_eggs(state) and self.third_person_egg_shooting(state) and self.flap_flip(state) and self.beak_buster(state))))\
                # or self.leg_spring(state) and self.floor_2_split_up(state)
    --]]
    
    if ( has("fflip") and has("ggrab") and has("clawbts") and has("climb") ) then
        logic = 0
    elseif ( has("clawbts") and has("climb") and can_veryLongJump() ) then
        logic = 1
    elseif ( (has("fflip") and has("ggrab") or can_veryLongJump()) and has("clawbts") and (has("climb") or has("eggaim") and can_shootEggs("geggs") and has("fflip") and has("bbust")) ) then
        logic = 3
    end
    
    return convertLogic(logic, skip)
end

function connector_GIF2_to_GIWarps(skip)
    local logic = 99
    --[[
    state.has(itemName.WARPGI2, player)
    --]]
    
    if ( has("warpgi2") ) then
        logic = 0
    end
    
    return convertLogic(logic, skip)
end

function connector_GIF2ElectromagneticChamber_to_GIElevatorShaft(skip)
    local logic = 99
    --[[
    self.elevator_door(state)
    --]]
    
    if ( basic_GI_elevatorDoor() ) then
        logic = 0
    end
    
    return convertLogic(logic, skip)
end

function connector_GIF3_to_GIOBack(skip)
    local logic = 99
    --[[
    self.climb(state) and self.drop_down_from_higher_floors_outside(state)
    --]]
    
    local dropDownFromHigherFloorsOutside = access_GI_dropDownFromHigherFloorsOutside(true)
    
    if ( has("climb") ) then
        logic = dropDownFromHigherFloorsOutside
    end
    
    return convertLogic(logic, skip)
end

function connector_GIF3_to_GIF2(skip)
    local logic = 99
    --[[        F3_to_F2
     if self.world.options.logic_type == LogicType.option_intended:
        logic = self.climb(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.climb(state) or (self.flap_flip(state) and self.beak_buster(state) and self.veryLongJump(state))
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.climb(state)\
                or self.flap_flip(state) and self.veryLongJump(state)\
                or self.tall_jump(state) and (self.flutter(state) or self.air_rat_a_tat_rap(state))

    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.climb(state)\
                or self.flap_flip(state) and self.veryLongJump(state)\
                or self.tall_jump(state) and (self.flutter(state) or self.air_rat_a_tat_rap(state))
     --]]
    
    if ( has("climb") ) then
        logic = 0
    elseif ( has("fflip") and has("bbust") and can_veryLongJump() ) then
        logic = 1
    elseif ( has("fflip") and can_veryLongJump() or has("tjump") and (has("flutter") or has("arat")) ) then
        logic = 2
    end
    
    return convertLogic(logic, skip)
end

function connector_GIF3_to_GIF3BoilerPlant(skip)
    local logic = 99
    --[[        floor_3_to_boiler_plant
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.flap_flip(state) and self.grip_grab(state)\
                or self.climb(state) and self.slightly_elevated_ledge(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks : # normal
        logic = self.flap_flip(state) and self.grip_grab(state)\
                or self.climb(state) and self.slightly_elevated_ledge(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.flap_flip(state) and self.grip_grab(state)\
                or self.climb(state) and self.slightly_elevated_ledge(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.flap_flip(state) and self.grip_grab(state)\
                or self.climb(state) and self.slightly_elevated_ledge(state)
    --]]
    
    if ( has("fflip") and has("ggrab") or has("climb") and can_reachSlightlyElevatedLedge() ) then
        logic = 0
    end
    
    return convertLogic(logic, skip)
end

function connector_GIF3_to_GIF4(skip)
    local logic = 99
    --[[        F3_to_F4
    if self.world.options.logic_type == LogicType.option_intended:
        logic = (self.climb(state) or self.leg_spring(state)) and self.small_elevation(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = (self.climb(state) or self.leg_spring(state)) and self.small_elevation(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = (self.climb(state) or self.leg_spring(state)) and self.small_elevation(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = (self.climb(state) or self.leg_spring(state)) and self.small_elevation(state)
    --]]
    
    if ( (has("climb") or has_legSpring()) and can_reachSmallElevation() ) then
        logic = 0
    end
    
    return convertLogic(logic, skip)
end

function connector_GIF3_to_GIWarps(skip)
    local logic = 99
    --[[
    state.has(itemName.WARPGI3, player)
    --]]
    
    if ( has("warpgi3") ) then
        logic = 0
    end
    
    return convertLogic(logic, skip)
end

function connector_GIF3BoilerPlant_to_GIElevatorShaft(skip)
    local logic = 99
    --[[
    rules.elevator_door(state)
    --]]
    
    if ( basic_GI_elevatorDoor() ) then
        logic = 0
    end
    
    return convertLogic(logic, skip)
end

function connector_GIF4_to_GIOBack(skip)
    local logic = 99
    --[[        floor_4_to_outside_back
    self.escape_floor_4_bk(state) and self.drop_down_from_higher_floors_outside(state)
    --]]
    
    local escapeFloor4 = access_GI_escapeFloor4(true)
    local dropDownFromHigherFloorsOutside = access_GI_dropDownFromHigherFloorsOutside(true)
    
    -- Normal Logic
    if ( escapeFloor4 <= logictype.CurrentStage and dropDownFromHigherFloorsOutside <= logictype.CurrentStage ) then
        logic = 0
    
    -- Sequence Breaking
    else
        logic = math.max(escapeFloor4, dropDownFromHigherFloorsOutside)
    end
    
    return convertLogic(logic, skip)
end

function connector_GIF4_to_GIF3(skip)
    local logic = 99
    --[[        floor_4_to_floor_3
     return self.escape_floor_4_bk(state) or self.leg_spring(state) and self.small_elevation(state)
     --]]
     
    if ( has_legSpring() and can_reachSmallElevation() ) then
        logic = 0
    else
        logic = access_GI_escapeFloor4(true)
    end
    
    return convertLogic(logic, skip)
end

function connector_GIF4_to_GIF4Back(skip)
    local logic = 99
    --[[        floor_4_to_floor_4_back
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.mumboGI(state) and self.tall_jump(state)\
                and state.has(itemName.WARPGI3, self.player) and state.has(itemName.WARPGI4, self.player)
    elif self.world.options.logic_type == LogicType.option_easy_tricks : # normal
        logic = self.mumboGI(state) and self.tall_jump(state)\
                and state.has(itemName.WARPGI3, self.player) and state.has(itemName.WARPGI4, self.player)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.mumboGI(state) and self.tall_jump(state)\
                and state.has(itemName.WARPGI3, self.player) and state.has(itemName.WARPGI4, self.player)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.mumboGI(state) and self.tall_jump(state)\
                    and state.has(itemName.WARPGI3, self.player) and state.has(itemName.WARPGI4, self.player)\
                or self.tall_jump(state) and self.pack_whack(state)\
                or self.precise_clockwork_warp(state) and (self.spring_pad(state) or self.flap_flip(state))
    --]]
    
    local mumboGI = access_GI_mumbo(true)
    
    if ( has("tjump") and (has("warpgi3") and has("warpgi4") or has("randomizewarppads_off")) and mumboGI <= logictype.CurrentStage ) then
        logic = 0 -- Normal Logic
    elseif ( has("tjump") and (has("warpgi3") and has("warpgi4") or has("randomizewarppads_off")) and mumboGI < 3 ) then
        logic = mumboGI -- Sequence Breaking
    elseif ( has("tjump") and has_packWhack() or can_preciseClockworkWarp() and (has("tjump") or has("fflip")) ) then
        logic = 3 -- Normal Logic
    
    -- Sequence Breaking
    elseif ( has("tjump") and (has("warpgi3") and has("warpgi4") or has("randomizewarppads_off")) ) then
        logic = mumboGI
    end
    
    return convertLogic(logic, skip)
end

function connector_GIF4_to_GIWarps(skip)
    local logic = 99
    --[[
    rules.warp_pad_floor_4(state) and state.has(itemName.WARPGI4, player)
    --]]
    
    local warpPadF4 = warp_GI_floor4(true)
    
    -- Normal Logic
    if ( has("warpgi4") and warpPadF4 <= logictype.CurrentStage ) then
        logic = 0
        
    -- Sequence Breaking
    elseif ( has("warpgi4") ) then
        logic = warpPadF4
    end
    
    return convertLogic(logic, skip)
end

function connector_GIF4Back_to_GIElevatorShaft(skip)
    local logic = 99
    --[[        floor_4_back_to_elevator_shaft
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.climb(state) and self.elevator_door(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.climb(state) and self.elevator_door(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.climb(state) and self.elevator_door(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.climb(state) and self.elevator_door(state)\
                or state.can_reach_region(regionName.GI4, self.player) and self.clockwork_warp(state) and (self.spring_pad(state) or self.flap_flip(state))
    --]]
    
    -- Normal Logic
    if ( has("climb") and basic_GI_elevatorDoor() ) then
        logic = 0
    elseif ( can_clockworkWarp() and (has("tjump") or has("fflip")) ) then
        local gi4Accessibility = Tracker:FindObjectForCode("@Region: Grunty Industries 4th Floor").AccessibilityLevel
        
        if ( gi4Accessibility == AccessibilityLevel.Normal or gi4Accessibility == AccessibilityLevel.Cleared ) then
            logic = 3
        elseif ( gi4Accessibility > AccessibilityLevel.None ) then
            logic = logictype.CurrentStage + 1 -- was already converted once by the json
        end
    end
    
    return convertLogic(logic, skip)
end

function connector_GIFlight_to_GIF1(skip)
    local logic = 99
    --[[        flight_to_floor_1
    if self.world.options.logic_type == LogicType.option_intended:
        logic = (self.beak_bomb(state) or self.egg_aim(state) or self.airborne_egg_aiming(state))\
                and (self.flutter(state) or self.air_rat_a_tat_rap(state))
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = (self.beak_bomb(state)\
                    or self.egg_aim(state)\
                    or self.airborne_egg_aiming(state)\
                    or self.has_explosives(state))\
                and (self.flutter(state) or self.air_rat_a_tat_rap(state))
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = (self.beak_bomb(state)\
                or self.egg_aim(state)\
                or self.airborne_egg_aiming(state)\
                or self.has_explosives(state))
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = (self.beak_bomb(state)\
                or self.egg_aim(state)\
                or self.airborne_egg_aiming(state)\
                or self.has_explosives(state))
    --]]
    
    local explosives = can_shootExplosiveEggs(true)
    
    -- Normal Logic
    if ( (has("bbomb") or has("eggaim") or has("aireaim")) and (has("flutter") or has("arat")) ) then
        logic = 0
    elseif ( explosives <= logictype.CurrentStage and (has("flutter") or has("arat")) ) then
        logic = 1
    elseif ( has("bbomb") or has("eggaim") or has("aireaim") or explosives <= logictype.CurrentStage ) then
        logic = 2
        
    -- Sequence Breaking
    else
        logic = explosives
    end
    
    return convertLogic(logic, skip)
end

function connector_GIFlight_to_GIF3BoilerPlant(skip)
    local logic = 99
    --[[        flight_to_boiler_plant
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.flight_pad(state) and (self.beak_bomb(state) or self.has_explosives(state) and (self.egg_aim(state) or self.airborne_egg_aiming(state)))
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.flight_pad(state) and (self.beak_bomb(state) or self.has_explosives(state) and (self.egg_aim(state) or self.airborne_egg_aiming(state)))
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.flight_pad(state) and (self.beak_bomb(state) or self.has_explosives(state) and (self.egg_aim(state) or self.airborne_egg_aiming(state)))
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.flight_pad(state) and (self.beak_bomb(state) or self.has_explosives(state) and (self.egg_aim(state) or self.airborne_egg_aiming(state)))
    --]]
    
    local explosives = can_shootExplosiveEggs(true)
    
    -- Normal Logic
    if ( has("fpad") and (has("bbomb") or explosives <= logictype.CurrentStage and (has("eggaim") or has("aireaim"))) ) then
        logic = 0
        
    -- Sequence Breaking
    elseif ( has("fpad") and (has("eggaim") or has("aireaim")) ) then
        logic = explosives
    end
    
    return convertLogic(logic, skip)
end

function connector_GIRoof_to_GIO_or_GIOB(skip) -- also _to_GIOB
    local logic = 99
    --[[        roof_to_ground_level
    if self.world.options.logic_type == LogicType.option_intended:
        logic = False
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.beak_buster(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.beak_buster(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.beak_buster(state)
    --]]
    
    if ( has("bbust") ) then
        logic = 1
    end
    
    return convertLogic(logic, skip)
end

function connector_GIRoof_to_GIFlight(skip)
    local logic = 99
    --[[
    rules.flight_pad(state)
    --]]
    
    if ( has("fpad") ) then
        logic = 0
    end
    
    return convertLogic(logic, skip)
end

function connector_GIRoof_to_GIF3_or_GIF4(skip) -- _to_GIF4
    local logic = 99
    --[[        roof_to_upper_floors
    if self.world.options.logic_type == LogicType.option_intended:
        logic = False
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
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

function connector_GIRoof_to_GIF5(skip)
    local logic = 99
    --[[        roof_to_floor5
    self.leg_spring(state) or self.spring_pad(state)
    --]]
    
    if ( has_legSpring() or has("tjump") ) then
        logic = 0
    end
    
    return convertLogic(logic, skip)
end

function connector_GIRoof_to_GIWarps(skip)
    local logic = 99
    --[[
    state.has(itemName.WARPGI5, player)
    --]]
    
    if ( has("warpgi5") ) then
        logic = 0
    end
    
    return convertLogic(logic, skip)
end

function connector_CK_to_Hag1(skip)
    local logic = 99
    --[[
     door_open = False
    if self.world.options.victory_condition == VictoryCondition.option_hag1:
        door_open = self.world.options.open_hag1 == 1 or state.has(itemName.JIGGY, self.player, 70)
    elif self.world.options.victory_condition == VictoryCondition.option_wonderwing_challenge:
        door_open = state.has(itemName.MUMBOTOKEN, self.player, 32)
    elif self.world.options.victory_condition == VictoryCondition.option_boss_hunt_and_hag1:
        door_open = state.has(itemName.MUMBOTOKEN, self.player, self.world.options.boss_hunt_length)
        
    if self.world.options.logic_type == LogicType.option_intended:
        return door_open and \
            self.warp_pad_ck_top(state) and \
            self.breegull_blaster(state) and \
            self.clockwork_eggs(state)\
            and self.can_shoot_linear_egg(state)\
            and (self.talon_trot(state) and self.tall_jump(state))
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        return door_open and \
            self.warp_pad_ck_top(state) and \
            self.breegull_blaster(state) and \
            self.clockwork_eggs(state)\
            and self.can_shoot_linear_egg(state)\
            and (self.talon_trot(state) or self.tall_jump(state))
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        return door_open and \
            self.warp_pad_ck_top(state) and \
            self.breegull_blaster(state) and \
            self.clockwork_eggs(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        return door_open and \
            self.warp_pad_ck_top(state) and \
            self.breegull_blaster(state) and \
            self.clockwork_eggs(state)
    --]]
    
    if ( has("goal_hag1") and (has("openhag1_on") or has("jiggy, 70")) or has("goal_wwing") and has("mumbotoken", 32) or has("goal_bosshag1") and has("mumbotoken", Tracker:FindObjectForCode('bossesforhag1').AcquiredCount) ) then 
        local warpHag1 = warp_CK_top(true)
    
        if ( warpHag1 <= logictype.CurrentStage and has("bblaster") and can_shootEggs("ceggs") and can_shootLinearEggs() and has("ttrot") and has("tjump") ) then
            logic = 0 -- Normal Logic
        elseif ( warpHag1 < 2 and has("bblaster") and can_shootEggs("ceggs") and can_shootLinearEggs() and has("ttrot") and has("tjump") ) then
            logic = warpHag1 -- Sequence Breaking
        elseif ( warpHag1 < logictype.CurrentStage and has("bblaster") and can_shootEggs("ceggs") ) then
            logic = 2 -- Normal Logic
        
        -- Sequence Breaking
        elseif ( has("bblaster") and can_shootEggs("ceggs") ) then
            logic = math.max(2, warpHag1)
        end
    end
    
    return convertLogic(logic, skip)
end

function connector_Chuffy_to_WW(skip)
    local logic = 99
    --[[
     state.has(itemName.TRAINSWWW, player) and rules.can_beat_king_coal(state)
     --]]
    
    if ( has("trainswww") ) then
        logic = chuffy_canBeatKingCoal(true)
    end
    
    return convertLogic(logic, skip)
end

function connector_Chuffy_to_CT(skip)
    local logic = 99
    --[[
     state.has(itemName.TRAINSWIH, player) and rules.can_beat_king_coal(state)
     --]]
    
    if ( has("trainswih") ) then
        logic = chuffy_canBeatKingCoal(true)
    end
    
    return convertLogic(logic, skip)
end

function connector_Chuffy_to_TDL(skip)
    local logic = 99
    --[[
     state.has(itemName.TRAINSWTD, player) and rules.can_beat_king_coal(state)
     --]]
    
    if ( has("trainswtd") ) then
        logic = chuffy_canBeatKingCoal(true)
    end
    
    return convertLogic(logic, skip)
end

function connector_Chuffy_to_GIF1(skip)
    local logic = 99
    --[[
     state.has(itemName.TRAINSWGI, player) and rules.can_beat_king_coal(state)
     --]]
    
    if ( has("trainswgi") ) then
        logic = chuffy_canBeatKingCoal(true)
    end
    
    return convertLogic(logic, skip)
end

function connector_Chuffy_to_HFP(skip)
    local logic = 99
    --[[
     state.has(itemName.TRAINSWHP1, player) and rules.can_beat_king_coal(state)
     --]]
    
    if ( has("trainswhp1") ) then
        logic = chuffy_canBeatKingCoal(true)
    end
    
    return convertLogic(logic, skip)
end

function connector_MT_to_WH(skip)
    local logic = 99
    --[[        MT_to_WH
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.mt_jiggy(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = True
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = True
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = True
    --]]
    
    if ( has("mta") ) then
        logic = 0
    else
        logic = 1
    end
    
    return convertLogic(logic, skip)
end

function connector_GGM_to_PL(skip)
    local logic = 99
    --[[        escape_ggm_loading_zone
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.gm_jiggy(state) and self.climb(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.climb(state) or self.beak_buster(state) or self.flutter(state) or self.air_rat_a_tat_rap(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.climb(state) or self.beak_buster(state) or self.flutter(state) or self.air_rat_a_tat_rap(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.climb(state) or self.beak_buster(state) or self.flutter(state) or self.air_rat_a_tat_rap(state)
    --]]
    
    if ( has("gga") and has("climb") ) then
        logic = 0
    elseif ( has("climb") or has("bbust") or has("flutter") or has("arat") ) then
        logic = 1
    end
    
    return convertLogic(logic, skip)
end

function connector_JRL_to_CT(skip)
    local logic = 99
    --[[        JRL_to_CT
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.jrl_jiggy(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = True
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = True
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = True
    --]]
    
    if ( has("jra") ) then
        logic = 0
    else
        logic = 1
    end
    
    return convertLogic(logic, skip)
end

function connector_TDL_to_WL(skip)
    local logic = 99
    --[[        TDL_to_IOHWL
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.tdl_jiggy(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = True
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = True
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = True
    --]]
    
    if ( has("tda") ) then
        logic = 0
    else
        logic = 1
    end
    
    return convertLogic(logic, skip)
end

function connector_HFP_to_CTHFP(skip)
    local logic = 99
    --[[        HFP_to_CTHFP
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.hfp_jiggy(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = True
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = True
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = True
    --]]
    
    if ( has("hfa") ) then
        logic = 0
    else
        logic = 1
    end
    
    return convertLogic(logic, skip)
end

function connector_CTHFP_to_CT(skip)
    local logic = 99
    --[[
    rules.backdoors_enabled(state)
    --]]
    
    if ( has("backdoorsopen_on") ) then
        logic = 0
    end
    
    return convertLogic(logic, skip)
end

function connector_CCL_to_WL(skip)
    local logic = 99
    --[[        CCL_to_WL
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.ccl_jiggy(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = True
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = True
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = True
    --]]
    
    if ( has("cca") ) then
        logic = 0
    else
        logic = 1
    end
    
    return convertLogic(logic, skip)
end

function connector_CK_to_QM(skip)
    local logic = 99
    --[[        CK_to_Quag
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.ck_jiggy(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.ck_jiggy(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = True
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = True
    --]]
    
    if ( has("cka") ) then
        logic = 0
    else
        logic = 2
    end
    
    return convertLogic(logic, skip)
end

function connector_TDLIMTop_to_Terry(skip)
    local logic = 99
    --[[        inside_the_mountain_to_terry
    if self.world.options.logic_type == LogicType.option_intended:
        logic = state.can_reach_region(regionName.TLBOSS, self.player)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic =  state.can_reach_region(regionName.TLBOSS, self.player) or self.solo_banjo_to_terry(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = state.can_reach_region(regionName.TLBOSS, self.player) or self.solo_banjo_to_terry(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = state.can_reach_region(regionName.TLBOSS, self.player)\
                or self.solo_banjo_to_terry(state)\
                or self.clockwork_warp(state)\
                or (
                    self.flight_pad(state) and self.beak_bomb(state)\
                    and (self.tall_jump(state) or self.beak_buster(state) or self.grip_grab(state))
                )
    
    
    return self.split_up(state) and state.has(itemName.WARPTL5, self.player) and (
                    state.has(itemName.WARPTL1, self.player) and state.can_reach_region(regionName.TL, self.player)\
                    or state.has(itemName.WARPTL2, self.player) and state.can_reach_region(regionName.TLSP, self.player)\
                    or state.has(itemName.WARPTL3, self.player) and not self.intended_logic(state)\
                        and state.can_reach_region(regionName.TL, self.player)\
                    or state.has(itemName.WARPTL4, self.player) and state.can_reach_region(regionName.TL, self.player)\
                )
    --]]
    
    local tdlAccessibility = Tracker:FindObjectForCode("@Region: Terrydactyland - Main Area").AccessibilityLevel
    local spAccessibility = Tracker:FindObjectForCode("@Region: Terrydactyland - Stomping Plains").AccessibilityLevel
    
    -- Normal Logic
    if ( has("splitup") and has("randomizewarppads_off") and (tdlAccessibility == AccessibilityLevel.Normal or tdlAccessibility == AccessibilityLevel.Cleared) or has("splitup") and has("warptl5") and ((has("warptl1") or has("warptl3") or has("warptl4")) and (tdlAccessibility == AccessibilityLevel.Normal or tdlAccessibility == AccessibilityLevel.Cleared) or has("warptl2") and (spAccessibility == AccessibilityLevel.Normal or spAccessibility == AccessibilityLevel.Cleared)) ) then
        logic = 1
    elseif ( can_clockworkWarp() or has("fpad") and has("bbomb") and (has("tjump") or has("bbust") or has("ggrab")) ) then
        logic = 3
    
    -- Sequence Breaking
    elseif ( has("splitup") and has("randomizewarppads_off") and tdlAccessibility > AccessibilityLevel.None or has("splitup") and has("warptl5") and ((has("warptl1") or has("warptl3") or has("warptl4")) and tdlAccessibility > AccessibilityLevel.None or has("warptl2") and spAccessibility > AccessibilityLevel.None) ) then
        logic = logictype.CurrentStage + 1
    end
    
    return convertLogic(logic, skip)
end

function connector_MTTT_to_MTBoss(skip)
    local logic = 99
    --[[
     rules.has_green_relics(state, 20)
     --]]
    
    if ( has("bossentranceitems_off") or has("bossentranceitems_tickets") or has("greenrelic", 20) ) then
        logic = 0
    end
    
    return convertLogic(logic, skip)
end

function connector_JRLLC_to_JRLBoss(skip)
    local logic = 99
    --[[
     ((rules.grenade_eggs_item(state) or rules.clockwork_eggs_item(state)) and rules.sub_aqua_egg_aiming(state)) \
            or rules.humbaJRL(state)
     --]]
    
    if ( (has("geggs") or has("ceggs")) and has("auqaim") ) then
        logic = 0
    else
        logic = access_JRL_humba(true)
    end
    
    return convertLogic(logic, skip)
end

function connector_GIF1_to_GIBoss(skip)
    local logic = 99
    --[[        can_enter_gi_repairdepot
     if self.world.options.logic_type == LogicType.option_intended:
        logic = self.can_use_battery(state) and self.mumboGI(state) and \
           self.humbaGI(state) and self.bill_drill(state) and self.climb(state) \
            and self.flap_flip(state) and self.grip_grab(state) \
            and (
                state.has(itemName.WARPGI2, self.player) and state.has(itemName.WARPGI3, self.player)
                if self.world.options.randomize_warp_pads
                else state.can_reach_region(regionName.GI2, self.player) and state.can_reach_region(regionName.GI3, self.player)
            )
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.can_use_battery(state) and self.mumboGI(state) and \
           self.humbaGI(state) and self.bill_drill(state) and self.climb(state) and self.flap_flip(state) and \
           (self.grip_grab(state) or (self.tall_jump(state) and (self.flutter(state) or self.air_rat_a_tat_rap(state))))\
           and (
                state.has(itemName.WARPGI2, self.player) and state.has(itemName.WARPGI3, self.player)
                if self.world.options.randomize_warp_pads
                else state.can_reach_region(regionName.GI2, self.player) and state.can_reach_region(regionName.GI3, self.player)        -- this is redundant, since you require humba and mumbo, which are on those floors respectively
            )
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.can_use_battery(state) and self.mumboGI(state) and \
           self.humbaGI(state) and self.bill_drill(state) and self.climb(state) and self.flap_flip(state) and\
           ((self.grip_grab(state) or (self.tall_jump(state) and (self.flutter(state) or self.air_rat_a_tat_rap(state))))\
                or self.extremelyLongJump(state))\
            and (
                state.has(itemName.WARPGI2, self.player) and state.has(itemName.WARPGI3, self.player)
                if self.world.options.randomize_warp_pads
                else state.can_reach_region(regionName.GI2, self.player) and state.can_reach_region(regionName.GI3, self.player)
            )
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.can_use_battery(state) and self.mumboGI(state) and \
           self.humbaGI(state) and self.bill_drill(state) and self.climb(state) and self.flap_flip(state) and\
           ((self.grip_grab(state) or (self.tall_jump(state) and (self.flutter(state) or self.air_rat_a_tat_rap(state))))\
                or self.extremelyLongJump(state))\
            and (
                state.has(itemName.WARPGI2, self.player) and state.has(itemName.WARPGI3, self.player)
                if self.world.options.randomize_warp_pads
                else state.can_reach_region(regionName.GI2, self.player) and state.can_reach_region(regionName.GI3, self.player)
            )
     --]]
     
    local mumbo = access_GI_mumbo(true)
    local humba = access_GI_humba(true)
    local extremelyLongJump = can_extremelyLongJump(true)
    
    -- Normal Logic
    if ( basic_GI_canUseBattery() and mumbo <= logictype.CurrentStage and humba <= logictype.CurrentStage and has_billDrill() and has("climb") and has("fflip") and has("ggrab") and (has("warpgi2") and has("warpgi3") or has("randomizewarppads_off")) ) then
        logic = 0
    elseif ( basic_GI_canUseBattery() and mumbo <= logictype.CurrentStage and humba <= logictype.CurrentStage and has_billDrill() and has("climb") and has("fflip") and (has("warpgi2") and has("warpgi3") or has("randomizewarppads_off")) and has("tjump") and (has("flutter") or has("arat")) ) then
        logic = 1
    elseif ( basic_GI_canUseBattery() and mumbo < 2 and humba < 2 and has_billDrill() and has("climb") and has("fflip") and (has("ggrab") or has("tjump") and (has("flutter") or has("arat"))) and (has("warpgi2") and has("warpgi3") or has("randomizewarppads_off")) ) then
        logic = 1 -- Sequence Breaking
    elseif ( basic_GI_canUseBattery() and mumbo <= logictype.CurrentStage and humba <= logictype.CurrentStage and has_billDrill() and has("climb") and has("fflip") and (has("warpgi2") and has("warpgi3") or has("randomizewarppads_off")) and extremelyLongJump <= logictype.CurrentStage ) then
        logic = 2
    
    -- Sequence Breaking
    elseif ( basic_GI_canUseBattery() and has_billDrill() and has("climb") and has("fflip") and (has("warpgi2") and has("warpgi3") or has("randomizewarppads_off")) ) then
        local nonLongJump = 99
        if ( has("ggrab") or has("tjump") and (has("flutter") or has("arat")) ) then
            nonLongJump = 1
        end
        
        logic = math.max(2, mumbo, humba, math.min(nonLongJump, extremelyLongJump))
    end
    
    return convertLogic(logic, skip)
end

function connector_HFPL_to_HFPLBoss(skip)
    local logic = 99
    --[[
     rules.flight_pad(state)
     --]]
    
    if ( has("fpad") ) then
        logic = 0
    end
    
    return convertLogic(logic, skip)
end

function connector_HFPI_to_HFPIBoss(skip)
    local logic = 99
    --[[        can_reach_hfp_ice_crater
     if self.world.options.logic_type == LogicType.option_intended:
        logic = self.claw_clamber_boots(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.claw_clamber_boots(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        # In case people go for the damage boost for Chilly Willy then die before getting the jiggy, we also require Pack Whack to prevent softlocks.
        logic = self.claw_clamber_boots(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        # In case people go for the damage boost for Chilly Willy then die before getting the jiggy, we also require Pack Whack to prevent softlocks.
        logic = self.claw_clamber_boots(state)
     --]]
    
    if ( has("clawbts") ) then
        logic = 0
    end
    
    return convertLogic(logic, skip)
end

function connector_to_Targitzan(skip)
    local logic = 99
    --[[
     rules.breegull_blaster(state)
     --]]
    
    if ( has("bblaster") ) then
        logic = 0
    end
    
    return convertLogic(logic, skip)
end

function connector_to_MrPatch(skip)
    local logic = 99
    --[[        can_enter_big_top
     if self.world.options.logic_type == LogicType.option_intended:
        logic = self.grenade_eggs_item(state) and self.airborne_egg_aiming(state) and self.has_enough_bigtop_tickets(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.grenade_eggs_item(state) and self.airborne_egg_aiming(state) and self.has_enough_bigtop_tickets(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.grenade_eggs_item(state) and self.airborne_egg_aiming(state) and self.has_enough_bigtop_tickets(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.grenade_eggs_item(state) and self.airborne_egg_aiming(state) and self.has_enough_bigtop_tickets(state)
    
    if self.world.options.randomize_tickets:
            return state.has(itemName.BTTICKET, self.player, 4)
        else:
            return self.can_kill_fruity(state)
     --]]
    
    if ( has("geggs") and has("aireaim") ) then
        if ( has("bossentranceitems_off") or has("bossentranceitems_greenrelics") ) then
            logic = other_WW_tickets(true)
        elseif ( has("ticket", 4) ) then
            logic = 0
        end
    end
    
    return convertLogic(logic, skip)
end

function connector_to_LordWooFakFak(skip)
    local logic = 99
    --[[
     rules.sub_aqua_egg_aiming(state) and rules.grenade_eggs_item(state)
     --]]
    
    if ( has("auqaim") and has("geggs") ) then
        logic = 0
    end
    
    return convertLogic(logic, skip)
end

function connector_to_Weldar(skip)
    local logic = 99
    --[[
     rules.grenade_eggs_item(state)
     --]]
    
    if ( has("geggs") ) then
        logic = 0
    end
    
    return convertLogic(logic, skip)
end

function connector_to_ChilliBilli(skip)
    local logic = 99
    --[[
     rules.ice_eggs_item(state)
     --]]
    
    if ( has("ieggs") ) then
        logic = 0
    end
    
    return convertLogic(logic, skip)
end

function connector_Terry_to_MTBoss(skip)
    local logic = 99
    --[[
     rules.breegull_blaster(state)
     --]]
    
    if ( has("bblaster") ) then
        logic = 0
    end
    
    return convertLogic(logic, skip)
end

function connector_Terry_to_GGMBoss(skip)
    local logic = 99
    --[[
     return state.has(itemName.CHUFFY, self.player)\
            if self.world.options.randomize_chuffy\
            else self.mumboGGM(state)
     --]]
    
    if ( chuffyrandomized.CurrentStage == 0 ) then
        logic = access_GGM_mumbo(true)
    elseif ( chuffyrandomized.CurrentStage == 1 and has("chuffy") ) then
        logic = 0
    end
    
    return convertLogic(logic, skip)
end