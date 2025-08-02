--------------- Mayahem Temple

----- Basic & Access functions

function basic_MT_canUseFlightPad()
    return has("fpad") and (has("mumbomt") or (has_billDrill() and (can_reachSmallElevation() or has("flutter"))))
end

function access_MT_prisonCompoundAsBanjo(skip)
    local logic = 99
    --[[        prison_compound_as_banjo
    return self.prison_compound_open(state)\                                                    -- connector_MT_to_MTPrisonCompound
            or state.can_reach_region(regionName.HP, self.player) and self.HFP_to_MT(state)\
                and state.has(itemName.WARPMT3, self.player) and state.has(itemName.WARPMT5, self.player)\
            or state.can_reach_region(regionName.MTJSG, self.player) and state.has(itemName.WARPMT4, self.player)\
                and state.has(itemName.WARPMT3, self.player)\
            or state.has(itemName.WARPMT3, self.player)\
                and (state.has(itemName.WARPMT1, self.player) or state.has(itemName.WARPMT2, self.player))
    --]]
    
    local prisonCompoundOpen = connector_MT_to_MTPrisonCompound(true)
    local hfpAccess = Tracker:FindObjectForCode("@Region: Hailfire Peaks - Lava Side").AccessibilityLevel
    local hfpToMT = connector_HFP_to_MTKS(true)
    local mtJSGAccess = Tracker:FindObjectForCode("@Region: Mayahem Temple - Jade Snake Grove").AccessibilityLevel
    
    -- Normal Logic
    if ( prisonCompoundOpen <= logictype.CurrentStage or has("warpmt3") and (has("warpmt1") or has("warpmt2")) or (hfpAccess == AccessibilityLevel.Normal or hfpAccess == AccessibilityLevel.Cleared) and hfpToMT <= logictype.CurrentStage and has("warpmt3") and has("warpmt5") or (mtJSGAccess == AccessibilityLevel.Normal or mtJSGAccess == AccessibilityLevel.Cleared) and has("warpmt3") and has("warpmt4") ) then
        logic = 0
    
    -- Sequence Breaking
    else
        local hfpLogic = 99
        if ( hfpAccess > AccessibilityLevel.None and hfpToMT <= logictype.CurrentStage and has("warpmt3") and has("warpmt5") ) then
            hfpLogic = logictype.CurrentStage + 1
        elseif ( hfpAccess > AccessibilityLevel.None and has("warpmt3") and has("warpmt5") ) then
            hfpLogic = hfpToMT
        end
        
        local jsgLogic = 99
        if ( mtJSGAccess > AccessibilityLevel.None and has("warpmt3") and has("warpmt4") ) then
            jsgLogic = logictype.CurrentStage + 1
        end
        
        logic = math.min(prisonCompoundOpen, hfpLogic, jsgLogic)
    end
    
    return convertLogic(logic, skip)
end

function access_MT_prisonCompoundAsStony(skip)
    local logic = 99
    --[[        prison_compound_as_stony
    self.humbaMT(state) and (
            self.prison_compound_open(state)\
            or state.has(itemName.WARPMT3, self.player)\
                and (state.has(itemName.WARPMT1, self.player) or state.has(itemName.WARPMT2, self.player)\
                     or state.has(itemName.WARPMT4, self.player) or state.has(itemName.WARPMT5, self.player))
        )
    --]]
    
    local humba = access_MT_humba(true)
    local prisonCompoundOpen = connector_MT_to_MTPrisonCompound(true)
    
    -- Normal Logic
    if ( humba <= logictype.CurrentStage and (prisonCompoundOpen <= logictype.CurrentStage or has("warpmt3") and (has("warpmt1") or has("warpmt2") or has("warpmt4") or has("warpmt5"))) ) then
        logic = 0
    
    -- Sequence Breaking
    elseif ( has("warpmt3") and (has("warpmt1") or has("warpmt2") or has("warpmt4") or has("warpmt5")) ) then
        logic = humba
    else
        logic = math.max(humba, prisonCompoundOpen)
    end
    
    return convertLogic(logic, skip)
end

function access_MT_kickballStadiumAsBanjo(skip)
    local logic = 99
    --[[        kickball_stadium_as_banjo
    return state.can_reach_region(regionName.HP, self.player) and self.HFP_to_MT(state)\
            or state.has(itemName.WARPMT5, self.player) and (
                state.has(itemName.WARPMT1, self.player)\
                or state.has(itemName.WARPMT2, self.player)\
                or state.has(itemName.WARPMT3, self.player) and self.prison_compound_as_banjo(state)\
                or state.has(itemName.WARPMT4, self.player) and state.can_reach_region(regionName.MTJSG, self.player)
            )
    --]]
    
    local hfpAccess = Tracker:FindObjectForCode("@Region: Hailfire Peaks - Lava Side").AccessibilityLevel
    local hfpToMT = connector_HFP_to_MTKS(true)
    local prisonCompoundAsBanjo = access_MT_prisonCompoundAsBanjo(true)
    local mtJSGAccess = Tracker:FindObjectForCode("@Region: Mayahem Temple - Jade Snake Grove").AccessibilityLevel
    local humba = access_MT_humba(true)
    
    -- Normal Logic
    if ( (hfpAccess == AccessibilityLevel.Normal or hfpAccess == AccessibilityLevel.Cleared) and hfpToMT <= logictype.CurrentStage or has("warpmt5") and (has("warpmt1") or has("warpmt2") or has("warpmt3") and prisonCompoundAsBanjo <= logictype.CurrentStage or has("warpmt4") and (mtJSGAccess == AccessibilityLevel.Normal or mtJSGAccess == AccessibilityLevel.Cleared)) or has("randomizewarppads_off") and humba <= logictype.CurrentStage ) then
        logic = 0
    
    -- Sequence Breaking
    else
        local hfpLogic = 99
        if ( hfpAccess > AccessibilityLevel.None and hfpToMT <= logictype.CurrentStage ) then
            hfpLogic = logictype.CurrentStage + 1
        elseif ( hfpAccess > AccessibilityLevel.None ) then
            hfpLogic = hfpToMT
        end
        
        local pcLogic = 99
        if ( has("warpmt5") and has("warpmt3") ) then
            pcLogic = prisonCompoundAsBanjo
        end
        
        local jsgLogic = 99
        if ( has("warpmt5") and has("warpmt4") and mtJSGAccess > AccessibilityLevel.None ) then
            jsgLogic = logictype.CurrentStage + 1
        end
        
        local instantTransform = 99
        if ( has("humbamt") and mtJSGAccess > AccessibilityLevel.None ) then
            instantTransform = 7
        end
        
        local warpsNotRandomized = 99
        if ( has("randomizewarppads_off") ) then
            warpsNotRandomized = humba
        end
        
        logic = math.min(hfpLogic, pcLogic, jsgLogic, instantTransform, warpsNotRandomized)
    end
    
    return convertLogic(logic, skip)
end

function access_MT_canFreeDilberta(skip)
    local logic = 99
    --[[        dilberta_free
    if self.world.options.logic_type == LogicType.option_intended:
        return self.prison_compound_as_banjo(state) and self.bill_drill(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        return self.prison_compound_as_banjo(state) and self.bill_drill(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        return self.prison_compound_as_banjo(state) and self.bill_drill(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        return self.prison_compound_as_banjo(state) and self.bill_drill(state)
    --]]
    
    local prisonCompoundAsBanjo = access_MT_prisonCompoundAsBanjo(true)
    
    -- Normal Logic
    if ( prisonCompoundAsBanjo <= logictype.CurrentStage and has_billDrill() ) then
        logic = 0
    
    -- Sequence Breaking
    elseif ( has_billDrill() ) then
        logic = prisonCompoundAsBanjo
    end
    
    return convertLogic(logic, skip)
end

function access_MT_getOnKickballStadium(skip)
    local logic = 99
    --[[        nest_mt_stadium
    if self.world.options.logic_type == LogicType.option_intended:
        return self.MT_flight_pad(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        return self.MT_flight_pad(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        return self.MT_flight_pad(state) or self.clockwork_shot(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        return self.MT_flight_pad(state) or self.clockwork_shot(state)
    --]]
    
    if ( basic_MT_canUseFlightPad() ) then
        logic = 0
    elseif ( can_clockworkShot() ) then
        logic = 2
    end
    
    return convertLogic(logic, skip)
end

function access_MT_humba(skip)
    local logic = 99
    --[[        humbaMT
    state.can_reach_region(regionName.MTJSG, self.player) and state.has(itemName.HUMBAMT, self.player)
    --]]
    
    if ( has("humbamt") ) then
        if ( (has("warpmt1") or has("warpmt2")) and has("warpmt4") ) then
            logic = 0
        else
            logic = connector_MT_to_MTJadeSnakeGrove(true)
        end
    end
    
    return convertLogic(logic, skip)
end

----- Silos

function silo_MT_eggAim(skip)
    local logic = 99
    --[[
    self.check_notes(state, locationName.EGGAIM)
    --]]
    
    if ( eggaim_count() ) then
        logic = 0
    end
    
    return convertLogic(logic, skip)
end

function silo_MT_breegullBlaster(skip)
    local logic = 99
    --[[
    self.check_notes(state, locationName.BBLASTER)
    --]]
    
    if ( bblaster_count() ) then
        logic = 0
    end
    
    return convertLogic(logic, skip)
end

function silo_MT_gripGrab(skip)
    local logic = 99
    --[[
    self.check_notes(state, locationName.GGRAB)
    --]]
    
    if ( ggrab_count() ) then
        return AccessibilityLevel.Normal
    end
    
    return convertLogic(logic, skip)
end

----- Warp Pads

----- Jiggies

function jiggy_MT_slightlySacredChamber(skip)
    local logic = 99
    --[[        jiggy_sschamber
     if self.world.options.logic_type == LogicType.option_intended:
        logic = self.has_green_relics(state, 10)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.has_green_relics(state, 10)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.has_green_relics(state, 10)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.has_green_relics(state, 10)
     --]]
    
    if ( has("bossentranceitems_off") or has("bossentranceitems_tickets") or has("greenrelic", 10) ) then
        logic = 0
    end
    
    return convertLogic(logic, skip)
end

function jiggy_MT_targitzan(skip)
    local logic = 99
    --[[        jiggy_targitzan
     if self.intended_logic(state):
      logic = self.blue_eggs_item(state) or self.fire_eggs_item(state) or self.grenade_eggs_item(state)
    elif self.easy_tricks_logic(state):
      logic = (self.blue_eggs_item(state) or self.fire_eggs_item(state))\
                or (self.ice_eggs_item(state) and self.beak_bayonet(state))\
                or (self.grenade_eggs_item(state) and (self.ice_eggs_item(state) or self.beak_bayonet(state)))
    elif self.hard_tricks_logic(state):
      logic = (self.blue_eggs_item(state) or self.fire_eggs_item(state))\
                or (self.ice_eggs_item(state) and self.beak_bayonet(state))\
                or (self.grenade_eggs_item(state) and (self.ice_eggs_item(state) or self.beak_bayonet(state)))
    elif self.glitches_logic(state):
      logic = (self.blue_eggs_item(state) or self.fire_eggs_item(state))\
                or (self.ice_eggs_item(state) and self.beak_bayonet(state))\
                or (self.grenade_eggs_item(state) and (self.ice_eggs_item(state) or self.beak_bayonet(state)))
     --]]
    
    if ( has("begg") or has("feggs") or has("geggs") and logictype.CurrentStage == 0 ) then -- FIXIT this is a bug! intended should not be fine with just grenade eggs
        logic = 0
    elseif ( has("ieggs") and (has("bbayonet") or has("geggs")) ) then
        logic = 1
    end
    
    return convertLogic(logic, skip)
end

function jiggy_MT_mayahemKickball(skip)
    local logic = 99
    --[[        jiggy_mayahem_kickball
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.humbaMT(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.humbaMT(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.humbaMT(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.humbaMT(state)
    --]]
    
    local humba = access_MT_humba(true)
    
    -- Normal Logic
    if ( humba <= logictype.CurrentStage ) then
        logic = 0
    
    -- Sequence Breaking
    else
        logic = humba
    end
    
    return convertLogic(logic, skip)
end

function jiggy_MT_bovina(skip)
    local logic = 99
    --[[        jiggy_bovina
    if self.world.options.logic_type == LogicType.option_intended:
      logic = self.egg_aim(state) and (self.has_linear_egg(state))
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
      logic = self.egg_aim(state) or (self.MT_flight_pad(state) and self.airborne_egg_aiming(state))
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = (self.egg_aim(state) or (self.MT_flight_pad(state) and self.airborne_egg_aiming(state)))\
                or (self.flap_flip(state) and self.beak_buster(state))\
                or self.MT_flight_pad(state) and self.beak_bomb(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = (self.egg_aim(state) or (self.MT_flight_pad(state) and self.airborne_egg_aiming(state)))\
                or (self.flap_flip(state) and self.beak_buster(state))\
                or self.MT_flight_pad(state) and self.beak_bomb(state)
    --]]
    
    if ( has("eggaim") and has_linearEgg() ) then
        logic = 0
    elseif ( has("eggaim") or basic_MT_canUseFlightPad() and has("aireaim") ) then
        logic = 1
    elseif ( has("fflip") and has("bbust") or basic_MT_canUseFlightPad() and has("bbomb") ) then
        logic = 2
    elseif ( has("ttrot") and has("arat") ) then
        logic = 7
    end
    
    return convertLogic(logic, skip)
end

function jiggy_MT_treasureChamber(skip)
    local logic = 99
    --[[        jiggy_treasure_chamber
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.egg_aim(state) and\
            (self.flap_flip(state) or self.slightly_elevated_ledge(state)) and\
              ((self.grip_grab(state) and self.spring_pad(state) and self.flap_flip(state) and self.talon_trot(state)) or self.MT_flight_pad(state))
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = (self.flap_flip(state) or self.slightly_elevated_ledge(state))\
                and ((self.grip_grab(state) and self.spring_pad(state) and self.flap_flip(state) and self.egg_aim(state) and self.talon_trot(state))\
                    or (self.MT_flight_pad(state) and self.can_shoot_any_egg(state))\
                    or state.can_reach_region(regionName.TL_HATCH, self.player))\
                and (self.MT_flight_pad(state) and self.can_shoot_any_egg(state) or self.egg_aim(state))
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = (self.flap_flip(state) or self.slightly_elevated_ledge(state))\
                and ((self.grip_grab(state) and self.spring_pad(state) and self.flap_flip(state) and self.egg_aim(state) and self.talon_trot(state))\
                    or (self.MT_flight_pad(state) and self.can_shoot_any_egg(state))\
                    or state.can_reach_region(regionName.TL_HATCH, self.player))\
                and (self.MT_flight_pad(state) and self.can_shoot_any_egg(state) or self.egg_aim(state))
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = (self.flap_flip(state) or self.slightly_elevated_ledge(state))\
                and ((self.grip_grab(state) and self.spring_pad(state) and self.flap_flip(state) and self.egg_aim(state) and self.talon_trot(state))\
                    or (self.MT_flight_pad(state) and self.can_shoot_any_egg(state))\
                    or state.can_reach_region(regionName.TL_HATCH, self.player))\
                and (self.MT_flight_pad(state) and self.can_shoot_any_egg(state) or self.egg_aim(state))
    --]]
    
    -- FIXIT: I need to go look at this logic in game myself. it seems a little off, but I could be wrong
    
    local ungaAccessibility = Tracker:FindObjectForCode("@Region: Terrydactyland - Unga Bungas' Cave").AccessibilityLevel
    
    -- Normal Logic
    if ( has("eggaim") and (has("fflip") or can_reachSlightlyElevatedLedge()) and ((has("ggrab") and has("tjump") and has("fflip") and has("ttrot")) or basic_MT_canUseFlightPad()) ) then
        logic = 0
    elseif ( (has("fflip") or can_reachSlightlyElevatedLedge()) and (has("ggrab") and has("tjump") and has("fflip") and has("eggaim") and has("ttrot") or basic_MT_canUseFlightPad() and can_shootEggs() or (ungaAccessibility == AccessibilityLevel.Normal or ungaAccessibility == AccessibilityLevel.Cleared)) and (basic_MT_canUseFlightPad() and can_shootEggs() or has("eggaim")) ) then
        logic = 1
    
    -- Sequence Breaking
    elseif ( (has("fflip") or can_reachSlightlyElevatedLedge()) and ungaAccessibility > AccessibilityLevel.None and (basic_MT_canUseFlightPad() and can_shootEggs() or has("eggaim")) ) then
        logic = logictype.CurrentStage + 1 -- was already converted once by the json
    end
    
    return convertLogic(logic, skip)
end

function jiggy_MT_goldenGoliath(skip)
    local logic = 99
    --[[        jiggy_golden_goliath
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.check_mumbo_magic(state, itemName.MUMBOMT)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.check_mumbo_magic(state, itemName.MUMBOMT)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.check_mumbo_magic(state, itemName.MUMBOMT)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.check_mumbo_magic(state, itemName.MUMBOMT) or self.clockwork_eggs(state)
    --]]
    
    if ( has("mumbomt") ) then
        logic = 0
    elseif ( can_shootEggs("ceggs") ) then
        logic = 3
    end
    
    return convertLogic(logic, skip)
end

function jiggy_MT_quicksandInPrisonCompound(skip)
    local logic = 99
    --[[        jiggy_prison_quicksand
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.slightly_elevated_ledge(state)\
              and self.stilt_stride(state) and self.prison_compound_as_banjo(state) and self.tall_jump(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.slightly_elevated_ledge(state)\
              and self.stilt_stride(state) and self.prison_compound_as_banjo(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.slightly_elevated_ledge(state)\
              and self.stilt_stride(state) and self.prison_compound_as_banjo(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.slightly_elevated_ledge(state)\
              and self.stilt_stride(state) and self.prison_compound_as_banjo(state)
    --]]
    
    local prisonCompoundAsBanjo = access_MT_prisonCompoundAsBanjo(true)
    
    -- Normal Logic
    if ( can_reachSlightlyElevatedLedge() and has("sstride") and prisonCompoundAsBanjo <= logictype.CurrentStage and has("tjump") ) then
        logic = 0
    elseif ( can_reachSlightlyElevatedLedge() and has("sstride") and prisonCompoundAsBanjo <= logictype.CurrentStage ) then
        logic = 1
    
    -- Sequence Breaking
    elseif ( can_reachSlightlyElevatedLedge() and has("sstride") ) then
        logic = math.max(1, prisonCompoundAsBanjo)
    end
    
    return convertLogic(logic, skip)
end

function jiggy_MT_pillars(skip)
    local logic = 99
    --[[        jiggy_pillars
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.bill_drill(state) and (self.dive(state) or self.slightly_elevated_ledge(state) and self.tall_jump(state))\
                and self.small_elevation(state) and self.prison_compound_as_banjo(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.bill_drill(state) and self.small_elevation(state) and self.prison_compound_as_banjo(state)\
                and (self.dive(state) or self.slightly_elevated_ledge(state) or self.beak_buster(state))
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.prison_compound_as_banjo(state) and \
            ((self.bill_drill(state) and self.small_elevation(state)) or self.extremelyLongJump(state) or self.clockwork_shot(state))\
                and (self.dive(state) or self.slightly_elevated_ledge(state) or self.beak_buster(state))
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.prison_compound_as_banjo(state) and \
            ((self.bill_drill(state) and self.small_elevation(state)) or self.extremelyLongJump(state) or self.clockwork_shot(state))\
                and (self.dive(state) or self.slightly_elevated_ledge(state) or self.beak_buster(state))
    --]]
    
    local prisonCompoundAsBanjo = access_MT_prisonCompoundAsBanjo(true)
    local extremelyLongJump = can_extremelyLongJump(true)
    
    -- Normal Logic
    if ( has_billDrill() and (has("dive") or has("tjump") and can_reachSlightlyElevatedLedge()) and can_reachSmallElevation() and prisonCompoundAsBanjo <= logictype.CurrentStage ) then
        logic = 0
    elseif ( has_billDrill() and (can_reachSlightlyElevatedLedge() or has("bbust")) and can_reachSmallElevation() and prisonCompoundAsBanjo <= logictype.CurrentStage ) then
        logic = 1
    elseif ( (extremelyLongJump <= logictype.CurrentStage or can_clockworkShot()) and (has("dive") or can_reachSlightlyElevatedLedge() or has("bbust")) and prisonCompoundAsBanjo <= logictype.CurrentStage ) then
        logic = 2
    
    -- Sequence Breaking
    elseif ( has("dive") or can_reachSlightlyElevatedLedge() or has("bbust") ) then
        if ( has_billDrill() and can_reachSmallElevation() or can_clockworkShot() ) then
            logic = prisonCompoundAsBanjo
        else
            logic = math.max(extremelyLongJump, prisonCompoundAsBanjo)
        end
    end
    
    return convertLogic(logic, skip)
end

function jiggy_MT_topOfTemple(skip)
    local logic = 99
    --[[        jiggy_top
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.talon_trot(state) or self.MT_flight_pad(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.talon_trot(state) or self.MT_flight_pad(state) or self.flap_flip(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = True
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = True
    --]]
    
    if ( has("ttrot") or basic_MT_canUseFlightPad() ) then
        logic = 0
    elseif ( has("fflip") ) then
        logic = 1
    else
        logic = 2
    end
    
    return convertLogic(logic, skip)
end

function jiggy_MT_ssslumber(skip)
    local logic = 99
    --[[        jiggy_ssslumber
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.talon_trot(state) and self.grip_grab(state) and self.flap_flip(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.talon_trot(state) and (self.grip_grab(state) or self.beak_buster(state))\
            and self.flap_flip(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.talon_trot(state) and (self.grip_grab(state) or self.beak_buster(state))\
            and self.flap_flip(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.talon_trot(state) and (self.grip_grab(state) or self.beak_buster(state))\
            and self.flap_flip(state)
    --]]
    
    if ( has("ttrot") and has("ggrab") and has("fflip") ) then
        logic = 0
    elseif ( has("ttrot") and has("bbust") and has("fflip") ) then
        logic = 1
    end
    
    return convertLogic(logic, skip)
end

----- Notes

----- Nests

function nests_MT_pillars(skip)
    local logic = 99
    --[[        nest_pillars
    if self.world.options.logic_type == LogicType.option_intended:
        logic = (self.dive(state) or self.slightly_elevated_ledge(state) and self.tall_jump(state)) and self.prison_compound_as_banjo(state)\
                or self.prison_compound_as_stony(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = (self.dive(state) or self.slightly_elevated_ledge(state) or self.beak_buster(state)) and self.prison_compound_as_banjo(state)\
                or self.prison_compound_as_stony(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = (self.dive(state)\
                or self.slightly_elevated_ledge(state)\
                or self.beak_buster(state)\
                or self.clockwork_shot(state)) and self.prison_compound_as_banjo(state)\
                or self.prison_compound_as_stony(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = (self.dive(state)\
                or self.slightly_elevated_ledge(state)\
                or self.beak_buster(state)\
                or self.clockwork_shot(state)) and self.prison_compound_as_banjo(state)\
                or self.prison_compound_as_stony(state)
    --]]
    
    local prisonCompoundAsBanjo = access_MT_prisonCompoundAsBanjo(true)
    local prisonCompoundAsStony = access_MT_prisonCompoundAsStony(true)
    
    -- Normal Logic
    if ( (has("dive") or has("tjump") and can_reachSlightlyElevatedLedge()) and prisonCompoundAsBanjo <= logictype.CurrentStage or prisonCompoundAsStony <= logictype.CurrentStage ) then
        logic = 0
    elseif ( (has("dive") or can_reachSlightlyElevatedLedge() or has("bbust")) and prisonCompoundAsBanjo <= logictype.CurrentStage ) then
        logic = 1
    elseif ( can_clockworkShot() and prisonCompoundAsBanjo <= logictype.CurrentStage ) then
        logic = 2
    
    -- Sequence Breaking
    else
        local banjo = 99
        if ( has("dive") or can_reachSlightlyElevatedLedge() or has("bbust") or can_clockworkShot() ) then
            banjo = prisonCompoundAsBanjo
        end
        
        logic = math.min(prisonCompoundAsStony, banjo)
    end
    
    return convertLogic(logic, skip)
end

function nests_MT_topOfPrisonCellRight(skip)
    local logic = 99
    --[[        nest_mt_cell_right
    if self.world.options.logic_type == LogicType.option_intended:
        logic = (self.slightly_elevated_ledge(state) or self.flap_flip(state)) and self.tall_jump(state) and self.prison_compound_as_banjo(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = (self.slightly_elevated_ledge(state) or self.flap_flip(state)) and self.prison_compound_as_banjo(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.prison_compound_as_banjo(state) and (self.slightly_elevated_ledge(state) or self.flap_flip(state) or self.clockwork_shot(state))
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.prison_compound_as_banjo(state) and (self.slightly_elevated_ledge(state) or self.flap_flip(state) or self.clockwork_shot(state))
    --]]
    
    local prisonCompoundAsBanjo = access_MT_prisonCompoundAsBanjo(true)
    
    -- Normal Logic
    if ( prisonCompoundAsBanjo <= logictype.CurrentStage and has("tjump") and (has("fflip") or can_reachSlightlyElevatedLedge()) ) then
        logic = 0
    elseif ( prisonCompoundAsBanjo <= logictype.CurrentStage and (has("fflip") or can_reachSlightlyElevatedLedge()) ) then
        logic = 1
    elseif ( prisonCompoundAsBanjo <= logictype.CurrentStage and can_clockworkShot() ) then
        logic = 2
    
    -- Sequence Breaking
    elseif ( has("fflip") or can_reachSlightlyElevatedLedge() or can_clockworkShot() ) then
        logic = prisonCompoundAsBanjo
    end
    
    return convertLogic(logic, skip)
end

function nests_MT_topOfPrisonCellLeft(skip)
    local logic = 99
    --[[        nest_mt_cell_left
    if self.world.options.logic_type == LogicType.option_intended:
        logic = (self.slightly_elevated_ledge(state) or self.flap_flip(state)) and self.tall_jump(state) and self.prison_compound_as_banjo(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = (self.slightly_elevated_ledge(state) or self.flap_flip(state)) and self.prison_compound_as_banjo(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.prison_compound_as_banjo(state) and (self.slightly_elevated_ledge(state) or self.flap_flip(state) or self.clockwork_shot(state) and self.tall_jump(state))
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.prison_compound_as_banjo(state) and (self.slightly_elevated_ledge(state) or self.flap_flip(state) or self.clockwork_shot(state) and self.tall_jump(state))
    --]]
    
    local prisonCompoundAsBanjo = access_MT_prisonCompoundAsBanjo(true)
    
    -- Normal Logic
    if ( prisonCompoundAsBanjo <= logictype.CurrentStage and has("tjump") and (has("fflip") or can_reachSlightlyElevatedLedge()) ) then
        logic = 0
    elseif ( prisonCompoundAsBanjo <= logictype.CurrentStage and (has("fflip") or can_reachSlightlyElevatedLedge()) ) then
        logic = 1
    elseif ( prisonCompoundAsBanjo <= logictype.CurrentStage and can_clockworkShot() and has("tjump") ) then
        logic = 2
    
    -- Sequence Breaking
    elseif ( has("fflip") or can_reachSlightlyElevatedLedge() or can_clockworkShot() and has("tjump") ) then
        logic = prisonCompoundAsBanjo
    end
    
    return convertLogic(logic, skip)
end

function nests_MT_onCodeChamber(skip)
    local logic = 99
    --[[        nest_code_chamber
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.talon_trot(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = True
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = True
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = True
     --]]

    if ( has("ttrot") ) then
        logic = 0
    else
        logic = 1
    end
    
    return convertLogic(logic, skip)
end

----- Signs

function signs_MT_nearCodeChamber(skip)
    local logic = 99
    --[[        signpost_code_chamber
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.grip_grab(state)\
                and self.talon_trot(state) and self.flap_flip(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.grip_grab(state)\
                and self.talon_trot(state) and self.flap_flip(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.grip_grab(state)\
                and self.talon_trot(state) and self.flap_flip(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.grip_grab(state)\
                and self.talon_trot(state) and self.flap_flip(state)
    --]]
    
    if ( has("ttrot") and has("ggrab") and has("fflip") ) then
        logic = 0
    elseif ( has("ttrain") and load_mt_mt() and has("mta") ) then
        logic = 7 -- smuggle ttrain from spiral mountain
    elseif ( has("clawbts") and (load_jrl_mt() and has("jra") or load_hfp_mt() and has("hfa") or load_ggm_mt() and has("gga") or connector_PL_to_PG(true) <= 7 and load_ww_mt() and has("wwa")) ) then
        logic = 7 -- smuggle clawbts from cliff top into jrl entrance, hfp entrance, ggm entrance, or ww entrance
    elseif ( has("clawbts") and (load_gi_mt() and has("gia") or load_ck_mt() and has("cka")) or has("springb") and (load_tdl_mt() and has("tda") or load_ccl_mt() and has("cca")) ) then
        logic = 7 -- smuggle clawbts from quagmire if GI or CK take you to JRL, or springb from wasteland if either TDL or CCL take you to JRL, or ttrain from spiral mountain if MT takes you to JRL
    end
    
    return convertLogic(logic, skip)
end

function signs_MT_pillars(skip)
    local logic = 99
    --[[        nest_pillars
    if self.world.options.logic_type == LogicType.option_intended:
        logic = (self.dive(state) or self.slightly_elevated_ledge(state) and self.tall_jump(state)) and self.prison_compound_as_banjo(state)\
                or self.prison_compound_as_stony(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = (self.dive(state) or self.slightly_elevated_ledge(state) or self.beak_buster(state)) and self.prison_compound_as_banjo(state)\
                or self.prison_compound_as_stony(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = (self.dive(state)\
                or self.slightly_elevated_ledge(state)\
                or self.beak_buster(state)\
                or self.prison_compound_as_stony(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = (self.dive(state)\
                or self.slightly_elevated_ledge(state)\
                or self.beak_buster(state)\
                or self.prison_compound_as_stony(state)
    --]]
    
    local prisonCompoundAsBanjo = access_MT_prisonCompoundAsBanjo(true)
    local prisonCompoundAsStony = access_MT_prisonCompoundAsStony(true)
    
    -- Normal Logic
    if ( (has("dive") or has("tjump") and can_reachSlightlyElevatedLedge()) and prisonCompoundAsBanjo <= logictype.CurrentStage or prisonCompoundAsStony <= logictype.CurrentStage ) then
        logic = 0
    elseif ( (has("dive") or can_reachSlightlyElevatedLedge() or has("bbust")) and prisonCompoundAsBanjo <= logictype.CurrentStage ) then
        logic = 1
    
    -- Sequence Breaking
    else
        local banjo = 99
        if ( has("dive") or can_reachSlightlyElevatedLedge() or has("bbust") or can_clockworkShot() ) then
            banjo = prisonCompoundAsBanjo
        end
        
        logic = math.min(prisonCompoundAsStony, banjo)
    end
    
    return convertLogic(logic, skip)
end

----- Other - Jinjos

function jinjo_MT_jadeSnakeGrove(skip)
    local logic = 99
    --[[        jinjo_jadesnakegrove
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.grip_grab(state) and self.flap_flip(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.flap_flip(state) and\
                (self.beak_buster(state) or self.grip_grab(state))
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = (self.flap_flip(state) and (self.beak_buster(state) or self.grip_grab(state))) or\
                self.clockwork_shot(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = (self.flap_flip(state) and (self.beak_buster(state) or self.grip_grab(state))) or\
                self.clockwork_shot(state) or self.check_mumbo_magic(state, itemName.MUMBOMT)
    --]]
    
    if ( has("ggrab") and has("fflip") ) then
        logic = 0
    elseif ( has("fflip") and has("bbust") ) then
        logic = 1
    elseif ( can_clockworkShot() ) then
        logic = 2
    elseif ( has("mumbomt") ) then
        logic = 3
    end
    
    return convertLogic(logic, skip)
end

function jinjo_MT_pool(skip)
    local logic = 99
    --[[
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.dive(state)\
            or state.has(itemName.MUMBOMT, self.player)\
            or self.humbaMT(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = True
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = True
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = True
    --]]
    
    -- Normal Logic
    if ( has("dive") or has("mumbomt") or access_MT_humba(true) == 0 ) then
        logic = 0
    else
        logic = 1
    end
    
    return convertLogic(logic, skip)
end

----- Other - Glowbos

----- Other - Honeycombs

function honeycomb_MT_entrance(skip)
    local logic = 99
    --[[        honeycomb_mt_entrance
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.humbaMT(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.humbaMT(state) or \
                self.clockwork_eggs(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.humbaMT(state) or \
                self.clockwork_eggs(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.humbaMT(state)\
                or self.clockwork_eggs(state)\
                or self.breegull_bash(state)
    --]]
    
    local humba = access_MT_humba(true)
    
    if ( humba <= logictype.CurrentStage ) then
        logic = 0 -- Normal Logic
    elseif ( can_shootEggs("ceggs") ) then
        logic = 1 -- Normal Logic
    elseif ( humba < 3 ) then
        logic = humba -- Sequence Breaking
    elseif ( has_breegullBash() ) then
        logic = 3 -- Normal Logic
    
    -- Sequence Breaking
    else
        logic = humba
    end
    
    return convertLogic(logic, skip)
end

function honeycomb_MT_bovina(skip)
    local logic = 99
    --[[        honeycomb_bovina
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.grip_grab(state) and self.flap_flip(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = (self.flap_flip(state) and (self.grip_grab(state) or self.beak_buster(state)))\
                or self.MT_flight_pad(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = (self.flap_flip(state) and (self.grip_grab(state) or self.beak_buster(state)))\
                or self.MT_flight_pad(state) or self.clockwork_shot(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = (self.flap_flip(state) and (self.grip_grab(state) or self.beak_buster(state)))\
                or self.MT_flight_pad(state) or self.clockwork_shot(state)
    --]]
    
    if ( has("ggrab") and has("fflip") ) then
        logic = 0
    elseif ( has("fflip") and has("bbust") or basic_MT_canUseFlightPad() ) then
        logic = 1
    elseif ( can_clockworkShot() ) then
        logic = 2
    end
    
    return convertLogic(logic, skip)
end

function honeycomb_MT_treasureChamber(skip)
    local logic = 99
    --[[        honeycomb_treasure_chamber
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.can_shoot_any_egg(state) and self.egg_aim(state) and self.talon_trot(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = (self.MT_flight_pad(state) and self.can_shoot_any_egg(state) and (self.grip_grab(state) or self.talon_trot(state)))\
                or (self.can_shoot_any_egg(state) and self.egg_aim(state) and self.talon_trot(state))
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = (self.MT_flight_pad(state) and self.can_shoot_any_egg(state) and (self.grip_grab(state) or self.clockwork_shot(state) or self.talon_trot(state)))\
                or (self.can_shoot_any_egg(state) and self.egg_aim(state) and (self.talon_trot(state) or self.clockwork_shot(state)))
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = (self.MT_flight_pad(state) and self.can_shoot_any_egg(state) and (self.grip_grab(state) or self.clockwork_shot(state) or self.talon_trot(state)))\
                or (self.can_shoot_any_egg(state) and self.egg_aim(state) and (self.talon_trot(state) or self.clockwork_shot(state)))
    --]]
    
    if ( can_shootEggs() and has("eggaim") and has("ttrot") ) then
        logic = 0
    elseif ( basic_MT_canUseFlightPad() and can_shootEggs() and (has("ggrab") or has("ttrot")) ) then
        logic = 1
    elseif ( can_clockworkShot() ) then
        logic = 2
    elseif ( has("eggaim") or basic_MT_canUseFlightPad() and can_shootEggs() ) then
        -- various talon trot smugglings
        if ( has("ttrain") and load_mt_mt() and has("mta") ) then
            logic = 7 -- smuggle ttrain from spiral mountain
        elseif ( has("clawbts") and (load_jrl_mt() and has("jra") or load_hfp_mt() and has("hfa") or load_ggm_mt() and has("gga") or connector_PL_to_PG(true) <= 7 and load_ww_mt() and has("wwa")) ) then
            logic = 7 -- smuggle clawbts from cliff top into jrl entrance, hfp entrance, ggm entrance, or ww entrance
        elseif ( has("clawbts") and (load_gi_mt() and has("gia") or load_ck_mt() and has("cka")) or has("springb") and (load_tdl_mt() and has("tda") or load_ccl_mt() and has("cca")) ) then
            logic = 7 -- smuggle clawbts from quagmire if GI or CK take you to JRL, or springb from wasteland if either TDL or CCL take you to JRL, or ttrain from spiral mountain if MT takes you to JRL
        end
    end
    
    return convertLogic(logic, skip)
end

----- Other - Cheato Pages

function cheato_MT_topOutsideTreasureChamber(skip)
    local logic = 99
    --[[        cheato_snakehead
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.egg_aim(state) and self.grip_grab(state) and self.spring_pad(state) and self.flap_flip(state) and self.talon_trot(state)\
                or self.MT_flight_pad(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.grip_grab(state) and self.spring_pad(state) and self.flap_flip(state) and self.can_shoot_any_egg(state) and self.egg_aim(state) and self.talon_trot(state)\
                or self.MT_flight_pad(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = (self.grip_grab(state) and self.spring_pad(state) and self.flap_flip(state) and self.can_shoot_any_egg(state) and self.egg_aim(state) and self.talon_trot(state))\
                or self.MT_flight_pad(state)\
                or self.clockwork_shot(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = ((self.grip_grab(state) and self.spring_pad(state) and self.flap_flip(state) and self.can_shoot_any_egg(state) and self.egg_aim(state) and self.talon_trot(state))\
                or (self.MT_flight_pad(state)))\
                or self.clockwork_shot(state)
    --]]
    
    if ( has("eggaim") and has("ggrab") and has("tjump") and has("fflip") and has("ttrot") or basic_MT_canUseFlightPad() ) then
        logic = 0
    elseif ( can_clockworkShot() ) then
        logic = 2
    end
    
    return convertLogic(logic, skip)
end

function cheato_MT_prisonCompound(skip)
    local logic = 99
    --[[        cheato_prison
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.prison_compound_as_banjo(state) and self.slightly_elevated_ledge(state) and self.tall_jump(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.prison_compound_as_banjo(state) and self.slightly_elevated_ledge(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.prison_compound_as_banjo(state) and (self.slightly_elevated_ledge(state) or self.clockwork_shot(state))
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.prison_compound_as_banjo(state) and (self.slightly_elevated_ledge(state) or self.clockwork_shot(state))
    --]]
    
    local prisonCompoundAsBanjo = access_MT_prisonCompoundAsBanjo(true)
    
    -- Normal Logic
    if ( prisonCompoundAsBanjo <= logictype.CurrentStage and has("tjump") and can_reachSlightlyElevatedLedge() ) then
        logic = 0
    elseif ( prisonCompoundAsBanjo <= logictype.CurrentStage and can_reachSlightlyElevatedLedge() ) then
        logic = 1
    elseif ( prisonCompoundAsBanjo <= logictype.CurrentStage and can_clockworkShot() ) then
        logic = 2
    
    -- Sequence Breaking
    elseif ( can_reachSlightlyElevatedLedge() or can_clockworkShot() ) then
        logic = prisonCompoundAsBanjo
    end
    
    return convertLogic(logic, skip)
end

function cheato_MT_jadeSnakeGrove(skip)
    local logic = 99
    --[[        cheato_jade_snake_grove
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.grip_grab(state)\
                    and self.talon_trot(state) and self.flap_flip(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.grip_grab(state)\
                    and self.talon_trot(state) and self.flap_flip(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.talon_trot(state) and self.flap_flip(state) and self.grip_grab(state)\
                    or self.egg_aim(state) and self.clockwork_eggs(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.talon_trot(state) and self.flap_flip(state) and self.grip_grab(state)\
                    or self.egg_aim(state) and self.clockwork_eggs(state)
    --]]
    
    if ( has("ggrab") and has("ttrot") and has("fflip") ) then
        logic = 0
    elseif ( can_clockworkShot() ) then
        logic = 2
    elseif ( has("ggrab") and has("fflip") ) then
        -- various talon trot smugglings
        if ( has("ttrain") and load_mt_mt() and has("mta") ) then
            logic = 7 -- smuggle ttrain from spiral mountain
        elseif ( has("clawbts") and (load_jrl_mt() and has("jra") or load_hfp_mt() and has("hfa") or load_ggm_mt() and has("gga") or connector_PL_to_PG(true) <= 7 and load_ww_mt() and has("wwa")) ) then
            logic = 7 -- smuggle clawbts from cliff top into jrl entrance, hfp entrance, ggm entrance, or ww entrance
        elseif ( has("clawbts") and (load_gi_mt() and has("gia") or load_ck_mt() and has("cka")) or has("springb") and (load_tdl_mt() and has("tda") or load_ccl_mt() and has("cca")) ) then
            logic = 7 -- smuggle clawbts from quagmire if GI or CK take you to MT, or springb from wasteland if either TDL or CCL take you to MT, or ttrain from spiral mountain if MT takes you to MT
        end
    end
    
    return convertLogic(logic, skip)
end

----- Other

