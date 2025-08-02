--------------- Chuffy

function chuffy_canEnterFromGGM(skip)
    local logic = 99
    --[[        ggm_to_chuffy
     if self.world.options.logic_type == LogicType.option_intended:
        logic = self.train_raised(state) and (
                    self.climb(state) and self.small_elevation(state)\
                )
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.train_raised(state) and (
                    self.small_elevation(state)\
                    or self.climb(state)
                )
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.train_raised(state) and (
                    self.small_elevation(state)\
                    or self.climb(state)\
                    or self.beak_buster(state)\
                )
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.train_raised(state) and (
                    self.small_elevation(state)\
                    or self.climb(state)\
                    or self.beak_buster(state)\
                )
    
    
    
     return state.has(itemName.CHUFFY, self.player)\
                if self.world.options.randomize_chuffy\
                else self.mumboGGM(state)
     --]]
    
    local trainRaised = 99
    if ( chuffyrandomized.CurrentStage == 0 ) then
        trainRaised = access_GGM_mumbo(true)
    elseif ( chuffyrandomized.CurrentStage == 1 and has("chuffy") ) then
        trainRaised = 0
    end
    
    local canGetInside = 99
    if ( has("climb") and can_reachSmallElevation() ) then
        canGetInside = 0
    elseif ( has("climb") or can_reachSmallElevation() ) then
        canGetInside = 1
    elseif ( has("bbust") ) then
        canGetInside = 2
    else
        local ggmTrot = access_GGM_ttrot(true)
        canGetInside = math.max(7, ggmTrot)
    end
    
    logic = math.max(trainRaised, canGetInside)
    
    return convertLogic(logic, skip)
end

function chuffy_canCallTrain(skip)
    local logic = 99
    --[[        can_call_train
    return state.has(itemName.CHUFFY, self.player)\
            if self.world.options.randomize_chuffy\
            else self.can_beat_king_coal(state) and self.mumboGGM(state)
    --]]
    
    if ( chuffyrandomized.CurrentStage == 0 ) then
        logic = math.min(access_GGM_mumbo(true), chuffy_canBeatKingCoal(true))
    elseif ( chuffyrandomized.CurrentStage == 1 and has("chuffy") ) then
        logic = 0
    end
    
    return convertLogic(logic, skip)
end
    

function chuffy_canEnterFromWW(skip)
    local logic = 99
    --[[        ww_to_chuffy
     if self.world.options.logic_type == LogicType.option_intended:
        logic = state.has(itemName.TRAINSWWW, self.player) and (self.climb(state) and self.small_elevation(state))\
                and self.can_call_train(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = state.has(itemName.TRAINSWWW, self.player) and (self.small_elevation(state) or self.climb(state))\
                and self.can_call_train(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = state.has(itemName.TRAINSWWW, self.player) and (self.small_elevation(state) or self.climb(state))\
                and self.can_call_train(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = state.has(itemName.TRAINSWWW, self.player) and (self.small_elevation(state) or self.climb(state))\
                and self.can_call_train(state)
     --]]
    
    if ( has("trainswww") ) then
        local canCallTrain = chuffy_canCallTrain(true)
        
        if ( has("climb") and can_reachSmallElevation() and canCallTrain <= logictype.CurrentStage ) then
            logic = 0
        elseif ( has("climb") or can_reachSmallElevation() ) then
            logic = math.max(1, canCallTrain)
        end
    end
    
    return convertLogic(logic, skip)
end

function chuffy_canEnterFromIOH(skip)
    local logic = 99
    --[[        ioh_to_chuffy
     if self.world.options.logic_type == LogicType.option_intended:
        logic = state.has(itemName.TRAINSWIH, self.player) and (self.climb(state) and self.small_elevation(state))\
                and self.can_call_train(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = state.has(itemName.TRAINSWIH, self.player) and (self.small_elevation(state) or self.climb(state))\
                and self.can_call_train(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = state.has(itemName.TRAINSWIH, self.player) and (self.small_elevation(state) or self.climb(state) or self.beak_buster(state))\
                and self.can_call_train(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = state.has(itemName.TRAINSWIH, self.player) and (self.small_elevation(state) or self.climb(state) or self.beak_buster(state))\
                and self.can_call_train(state)
     --]]
    
    if ( has("trainswih") ) then
        local canCallTrain = chuffy_canCallTrain(true)
        
        if ( has("climb") and can_reachSmallElevation() and canCallTrain <= logictype.CurrentStage ) then
            logic = 0
        elseif ( has("climb") or can_reachSmallElevation() ) then
            logic = math.max(1, canCallTrain)
        elseif ( has("bbust") ) then
            logic = math.max(2, canCallTrain)
        end
    end
    
    return convertLogic(logic, skip)
end

function chuffy_canEnterFromTDL(skip)
    local logic = 99
    --[[        tdl_to_chuffy
     if self.world.options.logic_type == LogicType.option_intended:
        logic = state.has(itemName.TRAINSWTD, self.player)\
                and (self.climb(state) and self.small_elevation(state))\
                and self.can_call_train(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = state.has(itemName.TRAINSWTD, self.player)\
                and ((self.small_elevation(state) or self.beak_buster(state)) and self.climb(state)\
                    or self.flap_flip(state) and self.beak_buster(state))\
                and self.can_call_train(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = state.has(itemName.TRAINSWTD, self.player)\
                and (
                    ((self.small_elevation(state) or self.beak_buster(state)) and self.climb(state))\
                    or self.extremelyLongJump(state)\
                    or self.flap_flip(state) and self.beak_buster(state)\
                    or self.tall_jump(state) and self.beak_buster(state)
                )\
                and self.can_call_train(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = state.has(itemName.TRAINSWTD, self.player)\
                and (
                    ((self.small_elevation(state) or self.beak_buster(state)) and self.climb(state))\
                    or self.extremelyLongJump(state)\
                    or self.flap_flip(state) and self.beak_buster(state)\
                    or self.tall_jump(state) and self.beak_buster(state)
                )\
                and self.can_call_train(state)
     --]]
    
    if ( has("trainswtd") ) then
        local canCallTrain = chuffy_canCallTrain(true)
        
        if ( has("climb") and can_reachSmallElevation() and canCallTrain <= logictype.CurrentStage ) then
            logic = 0
        elseif ( has("bbust") and (has("climb") or has("fflip")) ) then
            logic = math.max(1, canCallTrain)
        elseif ( has("bbust") and has("tjump") ) then
            logic = math.max(2, canCallTrain)
        else
            logic = math.max(2, canCallTrain, can_extremelyLongJump(true))
        end
    end
    
    return convertLogic(logic, skip)
end

function chuffy_canEnterFromGI(skip)
    local logic = 99
    --[[        gi_to_chuffy
     if self.world.options.logic_type == LogicType.option_intended:
        logic = state.has(itemName.TRAINSWGI, self.player)\
                and self.can_call_train(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = state.has(itemName.TRAINSWGI, self.player)\
                and self.can_call_train(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = state.has(itemName.TRAINSWGI, self.player)\
                and self.can_call_train(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = state.has(itemName.TRAINSWGI, self.player)\
                and self.can_call_train(state)
     --]]
    
    if ( has("trainswgi") ) then
        logic = chuffy_canCallTrain(true)
    end
    
    return convertLogic(logic, skip)
end

function chuffy_canEnterFromHFP(skip)
    local logic = 99
    --[[        hfp_to_chuffy
     if self.world.options.logic_type == LogicType.option_intended:
        logic = state.has(itemName.TRAINSWHP1, self.player) and self.climb(state) and self.small_elevation(state)\
                and self.can_call_train(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = state.has(itemName.TRAINSWHP1, self.player) and (
                    self.climb(state) and (self.small_elevation(state) or self.beak_buster(state))\
                    or self.talon_trot(state)
                )\
                and self.can_call_train(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = state.has(itemName.TRAINSWHP1, self.player) and (
                    self.climb(state) and (self.small_elevation(state) or self.beak_buster(state))\
                    or self.talon_trot(state)\
                    or self.tall_jump(state) and self.beak_buster(state)
                )\
                and self.can_call_train(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = state.has(itemName.TRAINSWHP1, self.player) and (
                    self.climb(state) and (self.small_elevation(state) or self.beak_buster(state))\
                    or self.talon_trot(state)\
                    or self.tall_jump(state) and self.beak_buster(state)
                )\
                and self.can_call_train(state)
     --]]
    
    if ( has("trainswhp1") ) then
        local canCallTrain = chuffy_canCallTrain(true)
        
        if ( has("climb") and can_reachSmallElevation() and canCallTrain <= logictype.CurrentStage ) then
            logic = 0
        elseif ( has("climb") and has("bbust") or has("ttrot") ) then
            logic = math.max(1, canCallTrain)
        elseif ( has("tjump") and has("bbust") ) then
            logic = math.max(2, canCallTrain)
        end
    end
    
    return convertLogic(logic, skip)
end

function chuffy_canBeatKingCoal(skip)
    local logic = 99
    --[[        can_beat_king_coal
     if self.world.options.logic_type == LogicType.option_intended:
        hasAttack = self.blue_eggs(state) or self.grenade_eggs(state) or self.ice_eggs(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        hasAttack = self.blue_eggs(state) or self.grenade_eggs(state) or self.ice_eggs(state) or self.beak_barge(state) or self.roll(state) or self.air_rat_a_tat_rap(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        hasAttack = self.blue_eggs(state) or self.grenade_eggs(state) or self.ice_eggs(state) or self.beak_barge(state) or self.roll(state)\
        or self.air_rat_a_tat_rap(state) or self.ground_rat_a_tat_rap(state) or self.breegull_bash(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        hasAttack = self.blue_eggs(state) or self.grenade_eggs(state) or self.ice_eggs(state) or self.beak_barge(state) or self.roll(state)\
        or self.air_rat_a_tat_rap(state) or self.ground_rat_a_tat_rap(state) or self.breegull_bash(state)

    return state.can_reach_region(regionName.GMBOSS, self.player) and hasAttack
     --]]
    
    local hasAttack = 99
    if ( can_shootEggs("begg") or can_shootEggs("geggs") or can_shootEggs("ieggs") ) then
        hasAttack = 0
    elseif ( has("bbarge") or has("roll") or has("arat") ) then
        hasAttack = 1
    elseif ( has("grat") ) then
        hasAttack = 2
    end
    
    local chuffyAccessibility = Tracker:FindObjectForCode("@Region: Boss Arena - Old King Coal").AccessibilityLevel
    if ( chuffyAccessibility == AccessibilityLevel.Normal or chuffyAccessibility == AccessibilityLevel.Cleared ) then
        logic = hasAttack
    elseif ( chuffyAccessibility > AccessibilityLevel.None ) then
        logic = math.max(hasAttack, logictype.CurrentStage + 1)
    end
    
    return convertLogic(logic, skip)
end