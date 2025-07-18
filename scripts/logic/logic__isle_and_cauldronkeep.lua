--------------- Isle o' Hags

----- Basic & Access functions

function access_PL_top(skip)
    local logic = 99
    --[[        plateau_top
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.talon_trot(state) or self.split_up(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.talon_trot(state) or self.split_up(state) or (state.can_reach_region(regionName.IOHCT, self.player) and self.claw_clamber_boots(state))
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.talon_trot(state) or self.split_up(state)\
                or self.clockwork_shot(state)\
                or (state.can_reach_region(regionName.IOHCT, self.player) and self.claw_clamber_boots(state))
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.talon_trot(state) or self.split_up(state)\
                or self.clockwork_shot(state)\
                or (state.can_reach_region(regionName.IOHCT, self.player) and self.claw_clamber_boots(state))
    --]]
    
    local ctAccessibility = Tracker:FindObjectForCode("@Region: Cliff Top").AccessibilityLevel
    
    -- Normal Logic
    if ( has("ttrot") or has("splitup") ) then
        logic = 0
    elseif ( has("clawbts") and (ctAccessibility == AccessibilityLevel.Normal or ctAccessibility == AccessibilityLevel.Cleared) ) then
        logic = 1
    elseif ( can_clockworkShot() ) then
        logic = 2
    
    -- Sequence Breaking
    elseif ( has("clawbts") and ctAccessibility > AccessibilityLevel.None ) then
        logic = logictype.CurrentStage + 1 -- was already converted once by the json
    else
        -- various talon trot smugglings
        local wwiAccessibility = Tracker:FindObjectForCode("@Region: Witchyworld - The Inferno").AccessibilityLevel
        local ctAccessibility = Tracker:FindObjectForCode("@Region: Cliff Top").AccessibilityLevel
        local jrlAccessibility = Tracker:FindObjectForCode("@Region: Jolly Roger's Lagoon - Main Area").AccessibilityLevel
        local tdlAccessibility = Tracker:FindObjectForCode("@Region: Terrydactyland - Main Area").AccessibilityLevel
        
        if ( wwiAccessibility > AccessibilityLevel.None and has("ttrain") and (load_ww_ww() and has("wwa") or load_jrl_ww() or load_hfp_ww() and (connector_CTHFP_to_CT(true) or ctAccessibility > AccessibilityLevel.None)) ) then
            logic = 7 -- ttrain from WW
        elseif ( jrlAccessibility > AccessibilityLevel.None and has("ttrain") and has("doubloon", 28) and (load_ww_jrl() and has("wwa") or load_jrl_jrl() or load_hfp_jrl() and (connector_CTHFP_to_CT(true) or ctAccessibility > AccessibilityLevel.None)) ) then
            logic = 7 -- ttrain from JRL
        elseif ( tdlAccessibility > AccessibilityLevel.None and has("springb") and (load_ww_tdl() and has("wwa") or load_jrl_tdl() or load_hfp_tdl() and (connector_CTHFP_to_CT(true) or ctAccessibility > AccessibilityLevel.None)) ) then
            logic = 7 -- springb from TDL
        end
    end
    
    return convertLogic(logic, skip)
end

function access_PL_canReachHoneyB(skip)
    local logic = 99
    --[[        can_reach_honey_b
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.talon_trot(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.talon_trot(state)\
                or state.can_reach_region(regionName.IOHCT, self.player) and self.claw_clamber_boots(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.talon_trot(state)\
                or state.can_reach_region(regionName.IOHCT, self.player) and self.claw_clamber_boots(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.talon_trot(state)\
                or state.can_reach_region(regionName.IOHCT, self.player) and self.claw_clamber_boots(state)
    --]]
    
    local ctAccessibility = Tracker:FindObjectForCode("@Region: Cliff Top").AccessibilityLevel
    
    -- Normal Logic
    if ( has("ttrot") ) then
        logic = 0
    elseif ( has("clawbts") and (ctAccessibility == AccessibilityLevel.Normal or ctAccessibility == AccessibilityLevel.Cleared) ) then
        logic = 1
    
    -- Sequence Breaking
    elseif ( has("clawbts") and ctAccessibility > AccessibilityLevel.None ) then
        logic = logictype.CurrentStage + 1 -- was already converted once by the json
    else
        -- various talon trot smugglings
        local wwiAccessibility = Tracker:FindObjectForCode("@Region: Witchyworld - The Inferno").AccessibilityLevel
        local ctAccessibility = Tracker:FindObjectForCode("@Region: Cliff Top").AccessibilityLevel
        local jrlAccessibility = Tracker:FindObjectForCode("@Region: Jolly Roger's Lagoon - Main Area").AccessibilityLevel
        local tdlAccessibility = Tracker:FindObjectForCode("@Region: Terrydactyland - Main Area").AccessibilityLevel
        
        if ( wwiAccessibility > AccessibilityLevel.None and has("ttrain") and (load_ww_ww() and has("wwa") or load_jrl_ww() or load_hfp_ww() and (connector_CTHFP_to_CT(true) or ctAccessibility > AccessibilityLevel.None)) ) then
            logic = 7 -- ttrain from WW
        elseif ( jrlAccessibility > AccessibilityLevel.None and has("ttrain") and has("doubloon", 28) and (load_ww_jrl() and has("wwa") or load_jrl_jrl() or load_hfp_jrl() and (connector_CTHFP_to_CT(true) or ctAccessibility > AccessibilityLevel.None)) ) then
            logic = 7 -- ttrain from JRL
        elseif ( tdlAccessibility > AccessibilityLevel.None and has("springb") and (load_ww_tdl() and has("wwa") or load_jrl_tdl() or load_hfp_tdl() and (connector_CTHFP_to_CT(true) or ctAccessibility > AccessibilityLevel.None)) ) then
            logic = 7 -- springb from TDL
        end
    end
    
    return convertLogic(logic, skip)
end

----- Silos

function silo_SM_roystenBoulder(skip) -- not technically a silo, but does teach new moves
    local logic = 99
    --[[
    self.bill_drill(state)
    --]]
    
    if ( has_billDrill() ) then
        logic = 0
    end
    
    return convertLogic(logic, skip)
end

function silo_PL_fireEggs(skip)
    local logic = 99
    --[[
    self.check_notes(state, locationName.FEGGS)
    --]]
    
    if ( feggs_count() ) then
        logic = 0
    end
    
    return convertLogic(logic, skip)
end

function silo_PG_grenadeEggs(skip)
    local logic = 99
    --[[
    self.check_notes(state, locationName.GEGGS)
    --]]
    
    if ( geggs_count() ) then
        logic = 0
    end
    
    return convertLogic(logic, skip)
end

function silo_CT_iceEggs(skip)
    local logic = 99
    --[[
    self.check_notes(state, locationName.IEGGS)
    --]]
    
    if ( ieggs_count() ) then
        logic = 0
    end
    
    return convertLogic(logic, skip)
end

function silo_WL_clockworkEggs(skip)
    local logic = 99
    --[[
    self.check_notes(state, locationName.CEGGS)
    --]]
    
    if ( ceggs_count() ) then
        logic = 0
    end
    
    return convertLogic(logic, skip)
end

----- Jiggies

-- I don't need to do the jinjo families here, nor of course king jingaling

----- Notes

function treble_JV(skip)
    local logic = 99
    --[[        treble_jv
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.grip_grab(state) and self.flap_flip(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.grip_grab(state) and self.flap_flip(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = ((self.grip_grab(state) or self.beak_buster(state)) and self.flap_flip(state))\
                or self.clockwork_shot(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = ((self.grip_grab(state) or self.beak_buster(state)) and self.flap_flip(state))\
                or self.clockwork_shot(state)
    --]]
    
    if ( has("ggrab") and has("fflip") ) then
        logic = 0
    elseif ( has("bbust") and has("fflip") or can_clockworkShot() ) then
        logic = 2
    end
    
    return convertLogic(logic, skip)
end

function notes_PL_sign(skip)
    local logic = 99
    --[[        notes_plateau_sign
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.grip_grab(state) and self.flap_flip(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = (self.grip_grab(state) or self.beak_buster(state)) and self.flap_flip(state)\
                or self.leg_spring(state)\
                or self.split_up(state) and self.tall_jump(state)\
                or self.glide(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = ((self.grip_grab(state) or self.beak_buster(state)) and self.flap_flip(state))\
                or self.clockwork_shot(state)\
                or self.leg_spring(state)\
                or self.split_up(state) and self.grip_grab(state)\
                or self.split_up(state) and self.tall_jump(state)\
                or self.glide(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = ((self.grip_grab(state) or self.beak_buster(state)) and self.flap_flip(state))\
                or self.clockwork_shot(state)\
                or self.leg_spring(state)\
                or self.split_up(state) and self.grip_grab(state)\
                or self.split_up(state) and self.tall_jump(state)\
                or self.glide(state)
    --]]
    
    if ( has("ggrab") and has("fflip") ) then
        logic = 0
    elseif ( has("bbust") and has("fflip") or has_legSpring() or has_glide() or has("splitup") and has("tjump") ) then
        logic = 1
    elseif ( can_clockworkShot() or has("splitup") and has("ggrab") ) then
        logic = 2
    end
    
    return convertLogic(logic, skip)
end

function notes_WL_bottomNearClockworkSilo(skip)
    local logic = 99
    --[[        notes_bottom_clockwork
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

function notes_WL_topNearClockworkSilo(skip)
    local logic = 99
    --[[        notes_top_clockwork
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.flap_flip(state) or \
                (self.tall_jump(state) or (self.talon_trot(state) and self.flutter(state)))\
                    and self.grip_grab(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.flap_flip(state) or \
                (self.tall_jump(state) or (self.talon_trot(state) and self.flutter(state)))\
                    and self.grip_grab(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = (self.flap_flip(state) or \
                (self.tall_jump(state) or (self.talon_trot(state) and self.flutter(state)))\
                    and self.grip_grab(state))\
                or self.clockwork_shot(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = (self.flap_flip(state) or \
                    (self.tall_jump(state) or (self.talon_trot(state) and self.flutter(state)))\
                    and self.grip_grab(state))\
                    or self.clockwork_shot(state)
    --]]
    
    if ( has("fflip") or has("ggrab") and (has("tjump") or has("ttrot") and has("flutter")) ) then
        logic = 0
    elseif ( can_clockworkShot() ) then
        logic = 2
    elseif ( has("springb") and has("flutter") ) then
        logic = 7 -- smuggle talon trot
    end
    
    return convertLogic(logic, skip)
end

----- Nests

function nests_GL_lairTop(skip)
    local logic = 99
    --[[        nest_lair_top
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.small_elevation(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.small_elevation(state) or self.grip_grab(state) or self.beak_buster(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.small_elevation(state)\
                or self.grip_grab(state)\
                or self.beak_buster(state)\
                or self.air_rat_a_tat_rap(state)\
                or self.flutter(state)\
                or self.clockwork_shot(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.small_elevation(state)\
                or self.grip_grab(state)\
                or self.beak_buster(state)\
                or self.air_rat_a_tat_rap(state)\
                or self.flutter(state)\
                or self.clockwork_shot(state)
    --]]
    
    if ( can_reachSmallElevation() ) then
        logic = 0
    elseif ( has("ggrab") or has("bbust") ) then
        logic = 1
    elseif ( has("arat") or has("flutter") or can_clockworkShot() ) then
        logic = 2
    elseif ( has("wwing") ) then
        logic = 7
    end
    
    return convertLogic(logic, skip)
end

function nests_SM_waterfallTop(skip)
    local logic = 99
    --[[        nest_sm_waterfall_top
     self.flight_pad(state)
     --]]
    
    -- FIXIT (needs testing) someone in the discord said you can clockwork shot these. does it need to be from the ledge, or can you do it even without tall jump/arat/flutter/etc?
    
    if ( has("fpad") ) then
        logic = 0
    end
    
    return convertLogic(logic, skip)
end

function nests_SM_waterfallPlatform(skip)
    local logic = 99
    --[[        nest_sm_waterfall_platform
    if self.world.options.logic_type == LogicType.option_intended:
        return self.flight_pad(state)\
                or self.small_elevation(state)\
                or self.air_rat_a_tat_rap(state)\
                or self.flutter(state)\
                or self.flap_flip(state)\
                or self.grip_grab(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        return self.flight_pad(state)\
                or self.small_elevation(state)\
                or self.air_rat_a_tat_rap(state)\
                or self.flutter(state)\
                or self.flap_flip(state)\
                or self.grip_grab(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        return self.flight_pad(state)\
                or self.small_elevation(state)\
                or self.air_rat_a_tat_rap(state)\
                or self.flutter(state)\
                or self.flap_flip(state)\
                or self.grip_grab(state)\
                or self.clockwork_shot(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        return self.flight_pad(state)\
                or self.small_elevation(state)\
                or self.air_rat_a_tat_rap(state)\
                or self.flutter(state)\
                or self.flap_flip(state)\
                or self.grip_grab(state)\
                or self.clockwork_shot(state)
    --]]
    
    if ( has("fpad") or can_reachSmallElevation() or has("arat") or has("flutter") or has("fflip") or has("ggrab") ) then
        logic = 0
    elseif ( can_clockworkShot() ) then
        logic = 2
    elseif ( has("wwing") ) then
        logic = 7
    end
    
    return convertLogic(logic, skip)
end

function nests_JV_bottlesDresser(skip)
    local logic = 99
    --[[        nest_bottles_house
    if self.world.options.logic_type == LogicType.option_intended:
        return self.small_elevation(state) or self.grip_grab(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        return self.small_elevation(state) or self.grip_grab(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        return self.small_elevation(state) or self.grip_grab(state) or self.clockwork_shot(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        return self.small_elevation(state) or self.grip_grab(state) or self.clockwork_shot(state)
    --]]
    
    if ( can_reachSmallElevation() or has("ggrab") ) then
        logic = 0
    elseif ( can_clockworkShot() ) then
        logic = 2
    elseif ( has("wwing") ) then
        logic = 7
    end
    
    return convertLogic(logic, skip)
end

function nests_CT_difficultAlcove(skip)
    local logic = 99
    --[[        nest_cliff_top_hard
    if self.world.options.logic_type == LogicType.option_intended:
        return self.small_elevation(state) or self.grip_grab(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        return self.small_elevation(state)\
                or self.grip_grab(state)\
                or self.beak_buster(state)\
             or self.claw_clamber_boots(state)\
             or self.air_rat_a_tat_rap(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        return self.small_elevation(state)\
                or self.grip_grab(state)\
                or self.clockwork_shot(state)\
                or self.beak_buster(state)\
                or self.flutter(state)\
             or self.claw_clamber_boots(state)\
             or self.air_rat_a_tat_rap(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        return self.small_elevation(state)\
                or self.grip_grab(state)\
                or self.clockwork_shot(state)\
                or self.beak_buster(state)\
                or self.flutter(state)\
             or self.claw_clamber_boots(state)\
             or self.air_rat_a_tat_rap(state)
    --]]
    
    if ( can_reachSmallElevation() or has("ggrab") ) then
        logic = 0
    elseif ( has("bbust") or has("clawbts") or has("arat") ) then
        logic = 1
    elseif ( has("flutter") or can_clockworkShot() ) then
        logic = 2
    elseif ( has("wwing") ) then
        logic = 7
    end
    
    return convertLogic(logic, skip)
end

function nests_WL_anotherDiggerTunnel(skip)
    local logic = 99
    --[[        nest_another_digger_tunnel
    if self.world.options.logic_type == LogicType.option_intended:
        return self.dive(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        return self.dive(state) or self.beak_buster(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        return self.dive(state) or self.beak_buster(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        return self.dive(state) or self.beak_buster(state)
    --]]
    
    if ( has("dive") ) then
        logic = 0
    elseif ( has("bbust") ) then
        logic = 1
    end
    
    return convertLogic(logic, skip)
end

function nests_QM_mediumNearGI(skip)
    local logic = 99
    --[[        nest_quagmire_medium
    if self.world.options.logic_type == LogicType.option_intended:
        return self.small_elevation(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        return self.small_elevation(state) or self.air_rat_a_tat_rap(state) or self.beak_buster(state) or self.claw_clamber_boots(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        return self.small_elevation(state) or self.air_rat_a_tat_rap(state) or self.clockwork_shot(state) or self.beak_buster(state) or self.claw_clamber_boots(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        return self.small_elevation(state) or self.air_rat_a_tat_rap(state) or self.clockwork_shot(state) or self.beak_buster(state) or self.claw_clamber_boots(state)
    --]]
    
    if ( can_reachSmallElevation() ) then
        logic = 0
    elseif ( has("arat") or has("bbust") or has("clawbts") ) then
        logic = 1
    elseif ( can_clockworkShot() ) then
        logic = 2
    elseif ( has("wwing") ) then
        logic = 7
    end
    
    return convertLogic(logic, skip)
end

function nests_QM_hardNearGI(skip)
    local logic = 99
    --[[        nest_quagmire_hard
    if self.world.options.logic_type == LogicType.option_intended:
        return self.small_elevation(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        return self.small_elevation(state) or self.beak_buster(state) or self.claw_clamber_boots(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        return self.small_elevation(state) or self.clockwork_shot(state) or self.beak_buster(state) or self.claw_clamber_boots(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        return self.small_elevation(state) or self.clockwork_shot(state) or self.beak_buster(state) or self.claw_clamber_boots(state)
    --]]
    
    if ( can_reachSmallElevation() ) then
        logic = 0
    elseif ( has("bbust") or has("clawbts") ) then
        logic = 1
    elseif ( can_clockworkShot() ) then
        logic = 2
    elseif ( has("wwing") ) then
        logic = 7
    end
    
    return convertLogic(logic, skip)
end

----- Signs

function signs_WH_jiggywiggyBack(skip)
    local logic = 99
    --[[        signpost_jiggywiggy_back
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.small_elevation(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.small_elevation(state)\
                or self.flutter(state)\
                or self.air_rat_a_tat_rap(state)\
                or self.beak_buster(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.small_elevation(state)\
                or self.flutter(state)\
                or self.air_rat_a_tat_rap(state)\
                or self.beak_buster(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.small_elevation(state)\
                or self.flutter(state)\
                or self.air_rat_a_tat_rap(state)\
                or self.beak_buster(state)
    --]]
    
    if ( can_reachSmallElevation() ) then
        logic = 0
    elseif ( has("flutter") or has("arat") or has("bbust") ) then
        logic = 1
    elseif ( has("wwing") ) then
        logic = 7
    end
    
    return convertLogic(logic, skip)
end

----- Other - Jinjos

function jinjo_SM(skip)
    local logic = 99
    --[[
    self.talon_torpedo(state) and self.dive(state)
    --]]
    
    if ( has("ttorp") and has("dive") ) then
        logic = 0
    end
    
    return convertLogic(logic, skip)
end

function jinjo_PL(skip)
    local logic = 99
    --[[        jinjo_plateau
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.bill_drill(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.bill_drill(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.bill_drill(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.bill_drill(state) or self.egg_barge(state) or self.taxi_pack(state)
    --]]
    
    if ( has_billDrill() ) then
        logic = 0
    elseif ( can_eggBarge() or has_taxiPack() ) then
        logic = 3
    end
    
    return convertLogic(logic, skip)
end

function jinjo_CT(skip)
    local logic = 99
    --[[        jinjo_clifftop
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.claw_clamber_boots(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.claw_clamber_boots(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.claw_clamber_boots(state) or self.clockwork_shot(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.claw_clamber_boots(state) or self.clockwork_shot(state)
    --]]
    
    if ( has("clawbts") ) then
        logic = 0
    elseif ( can_clockworkShot() ) then
        logic = 2
    end
    
    return convertLogic(logic, skip)
end

function jinjo_WL(skip)
    local logic = 99
    --[[        jinjo_wasteland
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.grip_grab(state) and self.flap_flip(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = (self.grip_grab(state) or self.beak_buster(state)) and self.flap_flip(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = ((self.grip_grab(state) or self.beak_buster(state)) and self.flap_flip(state))\
                    or self.clockwork_shot(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = ((self.grip_grab(state) or self.beak_buster(state)) and self.flap_flip(state))\
                    or self.clockwork_shot(state)
    --]]
    
    if ( has("ggrab") and has("fflip") ) then
        logic = 0
    elseif ( has("bbust") and has("fflip") ) then
        logic = 1
    elseif ( can_clockworkShot() ) then
        logic = 2
    end
    
    return convertLogic(logic, skip)
end

----- Other - Glowbos

function glowbo_CT(skip)
    local logic = 99
    --[[        glowbo_cliff
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.climb(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.climb(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.climb(state) or (self.clockwork_shot(state) and state.can_reach_region(regionName.IOHCT, self.player))
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.climb(state) or (self.clockwork_shot(state) and state.can_reach_region(regionName.IOHCT, self.player))
    --]]
    
    local ctAccessibility = Tracker:FindObjectForCode("@Region: Cliff Top").AccessibilityLevel
    
    -- Normal Logic
    if ( has("climb") ) then
        logic = 0
    elseif ( can_clockworkShot() and (ctAccessibility == AccessibilityLevel.Normal or ctAccessibility == AccessibilityLevel.Cleared) ) then
        logic = 2
    
    -- Sequence Breaking
    elseif ( can_clockworkShot() and ctAccessibility > AccessibilityLevel.None ) then
        logic = logictype.CurrentStage + 1 -- was already converted once by the json
    end
    
    return convertLogic(logic, skip)
end

----- Other - Honeycombs

----- Other - Cheato Pages

function cheato_SM(skip)
    local logic = 99
    --[[        cheato_spiral
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.spring_pad(state) or self.flight_pad(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.spring_pad(state) or self.flight_pad(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = True
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = True
    --]]
    
    if ( has("tjump") or has("fpad") ) then
        logic = 0
    else
        logic = 2
    end
    
    return convertLogic(logic, skip)
end

----- Other

function other_SM_pinkMysteryEgg(skip)
    local logic = 99
    --[[        pink_mystery_egg
    if self.world.options.logic_type == LogicType.option_intended:
        logic = (self.grenade_eggs(state) or (self.airborne_egg_aiming(state) and self.grenade_eggs_item(state))) \
                and self.flight_pad(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = (self.grenade_eggs(state) or (self.airborne_egg_aiming(state) and self.grenade_eggs_item(state))) \
                and self.flight_pad(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = (self.grenade_eggs(state) or (self.airborne_egg_aiming(state) and self.grenade_eggs_item(state))) \
                and self.flight_pad(state) \
             or self.egg_aim(state) and self.grenade_eggs(state) and self.clockwork_shot(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = (self.has_explosives(state) or (self.airborne_egg_aiming(state) and self.grenade_eggs_item(state))) \
                and self.flight_pad(state) \
             or self.egg_aim(state) and self.grenade_eggs(state) and self.clockwork_shot(state)
    --]]
    
    -- Normal Logic
    if ( has("fpad") and (can_shootEggs("geggs") or has("geggs") and has("aireaim")) ) then
        logic = 0
    elseif ( has("geggs") and has("eggaim") and can_clockworkShot() ) then
        logic = 2
    end
    
    return convertLogic(logic, skip)
end

function other_SM_blueMysteryEgg(skip)
    local logic = 99
    --[[        blue_mystery_egg
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.grip_grab(state) and self.flap_flip(state) and self.flight_pad(state)\
                and self.tall_jump(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.grip_grab(state) and self.flap_flip(state) and self.flight_pad(state)\
                and (self.tall_jump(state) or self.beak_buster(state))
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = ((self.grip_grab(state) and self.flap_flip(state) and (self.tall_jump(state) or self.beak_buster(state)))\
                or self.clockwork_shot(state)) and self.flight_pad(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = ((self.grip_grab(state) and self.flap_flip(state) and (self.tall_jump(state) or self.beak_buster(state)))\
                or self.clockwork_shot(state)) and self.flight_pad(state)
    --]]
    
    if ( has("ggrab") and has("fflip") and has("fpad") and has("tjump") ) then
        logic = 0
    elseif ( has("ggrab") and has("fflip") and has("fpad") and has("bbust") ) then
        logic = 1
    elseif ( has("fpad") and can_clockworkShot() ) then
        logic = 2
    end
    
    return convertLogic(logic, skip)
end

function other_JV_iceKey(skip)
    local logic = 99
    --[[        ice_key
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.grip_grab(state) and self.flap_flip(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.grip_grab(state) and self.flap_flip(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = (self.grip_grab(state) and self.flap_flip(state)) or self.clockwork_shot(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = (self.grip_grab(state) and self.flap_flip(state)) or self.clockwork_shot(state)
    --]]
    
    if ( has("ggrab") and has("fflip") ) then
        logic = 0
    elseif ( can_clockworkShot() ) then
        logic = 2
    end
    
    return convertLogic(logic, skip)
end

function other_WH_yellowMysteryEgg(skip)
    local logic = 99
    --[[
    (self.has_explosives(state) or self.bill_drill(state)) and self.hatch(state)
    --]]
    
    local explosives = can_shootExplosiveEggs(true)
    
    -- Normal Logic
    if ( has_hatch() and (has_billDrill() or explosives <= logictype.CurrentStage) ) then
        logic = 0
    
    -- Sequence Breaking
    elseif ( has_hatch() ) then
        logic = explosives
    end
    
    return convertLogic(logic, skip)
end

function other_CT_trainSwitch(skip)
    local logic = 99
    --[[
    self.grip_grab(state) and self.flap_flip(state)
    --]]
    
    -- Normal Logic
    if ( has("ggrab") and has("fflip") ) then
        logic = 0
    end
    
    return convertLogic(logic, skip)
end



--------------- Cauldron Keep

----- Warp Pads

function warp_CK_top(skip)
    --[[        warp_pad_ck_top
    if self.world.options.logic_type == LogicType.option_intended:
        return self.pack_whack(state)\
                or self.sack_pack(state)\
                or self.shack_pack(state)\
                or state.has(itemName.WARPCK1, self.player) and state.has(itemName.WARPCK2, self.player)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        return self.pack_whack(state)\
                or self.sack_pack(state)\
                or self.shack_pack(state)\
                or state.has(itemName.WARPCK1, self.player) and state.has(itemName.WARPCK2, self.player)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        return self.pack_whack(state)\
                or self.sack_pack(state)\
                or self.shack_pack(state)\
                or state.has(itemName.WARPCK1, self.player) and state.has(itemName.WARPCK2, self.player)
    elif self.world.options.logic_type == LogicType.option_glitches:
        return self.pack_whack(state)\
                or self.sack_pack(state)\
                or self.shack_pack(state)\
                or state.has(itemName.WARPCK1, self.player) and state.has(itemName.WARPCK2, self.player)
    --]]
    
    if ( has_packWhack() or has_sackPack() or has_shackPack() or has("warpck1") and has("warpck2") ) then
        logic = 0
    end
    
    return convertLogic(logic, skip)
end