function has(item, amount)
    local count = Tracker:ProviderCountForCode(item)
    amount = tonumber(amount)
    if not amount then
        return count > 0
    else
        return count >= amount
    end
end

logictype = Tracker:FindObjectForCode("logictype")
chuffyrandomized = Tracker:FindObjectForCode("randomizechuffy")
speedupminigames = Tracker:FindObjectForCode("speedupmini")

-- Note, Page, Jinjo Count

function notes()
    return Tracker:ProviderCountForCode("note") + Tracker:ProviderCountForCode("treble")
end

function notecount(targetnotes)
    return notes() >= tonumber(targetnotes)
end

-- General Functions

function springPad()
    return has("tjump")
end

function canDoSmallElevation()
    return has("fflip") or has("tjump") or has("ttrot")
end

function canReachSlightlyElevatedLedge()
    return (has("fflip") or has("tjump") or (has("ttrot") and has("flutter"))) and has("ggrab")
end

function canShootEggs(egg)
    if egg then
        return has(egg) and (has("eggaim") or has("eggshoot"))
    else
        return (has("begg") or has("feggs") or has("geggs") or has("ieggs") or has("ceggs")) and (has("eggaim") or has("eggshoot"))
    end
end

function clockwork_shot()
    return has("ceggs") and has("eggaim")
end

function has_explosives()
    if logictype.CurrentStage == 0 then
        return has("geggs")
    else
        return has("geggs") or has("ceggs")
    end
end

function egg_barge()
    return hasLinearEgg() and has"eggshoot" and has("bbarge")
end

function hasLinearEgg()
    return has("begg") or has("feggs") or has("geggs") or has("ieggs")
end

function canShootLinearEgg()
    return has("eggaim") or has("eggshoot")
end

function hasGroundAttack()
    return has("eggshoot") or has("bbarge") or has("roll") or has("arat") or has("grat") or has("bbust")
end

function billDrill()
    return has("bbust") and has("bdrill")
end

function longJump()
    return has("ttrot") or has("flutter") or has("arat")
end

function has_fire()
    return canShootEggs("feggs") or dragon_kazooie()
end

function dragon_kazooie()
    return has("humbaih") and pinegrove_access() and has("grat")
end

function MT_flight_pad()
    return has("fpad") and (has("mumbomt") or (billDrill() and (canDoSmallElevation() or has("flutter"))))
end

function dilberta_free()
    if logictype.CurrentStage == 0 then
        return has("mta") and (has_explosives() or has("mumbomt")) and has("bdrill") and has("humbamt")
    else
        return has("mta") and (has_explosives() or has("mumbomt")) and has("bdrill")
    end
end

function GM_boulders()
    return (has("bdrill") and canDoSmallElevation()) or humbaGGM()
end

function GGMSlope()
    if logictype.CurrentStage == 0 then
        return ggm_trot()
    else
        return ggm_trot() or (GM_boulders() and has("splitup"))
    end
end

function ggm_trot()
    if logictype.CurrentStage == 0 then
        return has("ttrot")
    else
        return has("ttrot") or has("ttrain")
    end
end

function humbaGGM()
    return ggm_trot() and has("humbagm")
end

function mumboGGM()
    return canDoSmallElevation() and has("mumbogm")
end

function canary_mary_free()
    if logictype.CurrentStage == 0 then
        return humbaGGM()
    else
        return humbaGGM() or canShootEggs("ceggs")
    end
end

function can_beat_king_coal()
    if chuffyrandomized.CurrentStage == 0 then
        return mumboGGM() and ggm_access() and (has("fflip") or has("climb")) and hasGroundAttack()
    else
        return has("chuffy") and hasGroundAttack()
    end
end

function can_access_water_storage_jinjo_from_GGM()
    if logictype.CurrentStage == 0 then
        return false
    elseif logictype.CurrentStage == 1 then
        return has("splitup") and has("wwhack") and has("lspring") and has("glide") and GM_boulders()
    else
        return (has("splitup") and has("wwhack") and has("lspring") and has("glide") and GM_boulders()) or clockwork_shot()
    end
end

function can_access_water_storage_jinjo_from_JRL()
    if logictype.CurrentStage <= 1 then
        return has("ttorp")
    else
        return can_reach_atlantis() and has("ieggs") and has("augaim") and has("ttrop")
    end
end

function humbaWW()
    if logictype.CurrentStage == 0 then
        return has("humbaww") and has("fflip") and has("ggrab")
    elseif logictype.CurrentStage == 1 then
        return has("humbaww") and ((has("fflip") and has("ggrab")) or (has("climb") and veryLongJump()))
    else
        return has("humbaww") and ((has("climb") and veryLongJump() and has("fflip")) or (clockwork_shot() and has("climb")))
    end
end

function mumboWW()
    if logictype.CurrentStage <= 2 then
        return  humbaWW() and has("mumboww")
    else
        return glitchedInfernoAccess() and has("mumboww")
    end
end

function veryLongJump()
    return has("ttrot") and (has("flutter") or has("arat")) or (has("tjump") and has("roll") and has("flutter"))
end

function longJumpToGripGrab()
    return has("ggrab") and has("arat") and has("flutter")
end

function saucer_door_open()
    if logictype.CurrentStage == 0 then
        return ww_access() and longJumpToGripGrab() and has("fflip") and has("climb") and (has_explosives() or has("bbarge"))
    elseif logictype.CurrentStage <= 2 then
        return ww_access() and (longJumpToGripGrab() and has("fflip") and has("climb") and (has_explosives() or has("bbarge"))) or (has("eggaim") and has("geggs")) or (has_explosives() and has("splitup") and has("lspring") and has("glide"))
    else
        return (ww_access() and (longJumpToGripGrab() and has("fflip") and has("climb") and (has_explosives() or has("bbarge"))) or (has("eggaim") and has("geggs")) or (has_explosives() and has("splitup") and has("lspring") and has("glide"))) or (ggm_access() and canDoSmallElevation() and canShootEggs("ceggs"))
    end
end

function can_reach_saucer()
    return (ww_access() and longJumpToGripGrab() and has("fflip") and has("climb")) or (ggm_access() and canDoSmallElevation())
end

function long_swim()
    if logictype.CurrentStage == 0 then
        return has("mumbojr") and has("dive")
    elseif logictype.CurrentStage == 1 then
        return (has("dair") or has("mumbojr")) and has("dive")
    else
        return has("dive")
    end
end

function can_reach_atlantis()
    if logictype.CurrentStage <= 1 then
        return has("ieggs") and long_swim() and has("auqaim")
    else
        return long_swim()
    end
end

function HFP_hot_water_cooled()
    return hfp_access() and ccl_access() and has("splitup") and hasGroundAttack() and has("dive")
end

function TDLFlightPad()
    if logictype.CurrentStage == 0 then
        return can_beat_terry() and has("springb") and has("fpad")
    else
        return can_beat_terry() and ((has("springb") and has("fpad")) or (has("ttrot") and has("flutter")))
    end
end

function can_beat_terry()
    if logictype.CurrentStage <= 1 then
        return has("eggaim") and canShootLinearEgg() and has("springb")
    elseif logictype.CurrentStage == 2 then
        return has("springb") and canShootLinearEgg() and (has("fflip") or has("eggaim"))
    else
        return canShootEggs() and (has("fflip") or has("eggaim")) and (has("springb") or (has("fpad") and (has("bbomb") or has("eggaim") and has("eggshoot") and has("geggs") and has("ceggs"))))
    end
end

function mumboTDL()
    if logictype.CurrentStage == 0 then
        return ((canDoSmallElevation() and has("sstride")) or TDLFlightPad()) and has("mumbotd")
    else
        return (canDoSmallElevation() or TDLFlightPad()) and has("mumbotd")
    end
end

function humbaTDL()
    if logictype.CurrentStage <= 1 then
        return (canDoSmallElevation() or TDLFlightPad()) and has("humbatd")
    else
        return has("humbatd") and (canDoSmallElevation() or TDLFlightPad() or clockwork_shot())
    end
end

function oogle_boogles_open()
    return humbaTDL() and mumboTDL()
end

function smuggle_food()
    return has("clawbts")
end

function clockworkWarp()
    return has("ceggs") and has("geggs") and has("eggaim") and has("eggshoot")
end

function extremelyLongJump()
    if logictype.CurrentStage <= 1 then
        return false
    else
        return has("ttrot") and has("flutter") and has("bbust")
    end
end

function gi_train_station()
    return can_beat_king_coal() and has("trainswgi")
end

function can_use_battery()
    return has("packwh") and has("taxpack") and has("splitup")
end

function can_beat_weldar()
    return can_use_battery() and mumboGI() and has("humbagi") and canShootEggs("geggs") and billDrill()
end

function breegullBash()
    return has("grat") and has("bbash")
end

function mumboGI()
    if logictype.CurrentStage <= 1 then
        return canDoSmallElevation() and has("mumbogi")
    else
        return has("mumbogi") and (canDoSmallElevation() or (has("climb") and clockwork_shot()))
    end
end

function iceCube()
    return hasGroundAttack()
end

function cclStarterPack()
    if logictype.CurrentStage <= 1 then
        return (has("fpad") and hasGroundAttack()) or canDoSmallElevation() or has("ggrab")
    else
        return (has("fpad") and hasGroundAttack()) or canDoSmallElevation() or has("ggrab") or clockwork_shot()
    end
end

function notes_ccl_high()
    return cclStarterPack() and has("fpad")
end

function notes_ccl_low()
    return cclStarterPack()
end

function mumboCCL()
    return has("tjump") and has("mumbocc")
end

function can_use_floatus()
    return has("splitup") and has("taxpack") and has("hatch")
end

function grow_beanstalk()
    return billDrill() and mumboCCL() and has("fpad") and has("climb")
end

function hasMobileAttack()
    return has("eggshoot") or has("bbarge") or has("roll") or has("arat")
end

-- Train Logic

function train_WW()
    return has("chuffy") and has("trainswww") and ((has("trainswtd") and tdl_access()) or (clifftop_access() and has("trainswih")) or (hfp_access() and has("trainswhp1")) or (can_beat_king_coal() and ggm_access()) or (gi_outside_access() and has("trainswgi") and has("clawbts")))
end

function train_TDL()
    return has("chuffy") and has("trainswtd") and ((has("trainswww") and ww_access()) or (clifftop_access() and has("trainswih")) or (hfp_access() and has("trainswhp1")) or (can_beat_king_coal() and ggm_access()) or (gi_outside_access() and has("trainswgi") and has("clawbts")))
end

function train_HFP()
    return has("chuffy") and has("trainswhp1") and ((has("trainswww") and ww_access()) or (clifftop_access() and has("trainswih")) or (has("trainswtd") and tdl_access()) or (can_beat_king_coal() and ggm_access()) or (gi_outside_access() and has("trainswgi") and has("clawbts")))
end

function train_CT()
    return has("chuffy") and has("trainswih") and ((has("trainswww") and ww_access()) or (has("trainswtd") and tdl_access()) or (can_beat_king_coal() and ggm_access()) or (gi_outside_access() and has("trainswgi") and has("clawbts")))
end

function train_GI()
    return has("chuffy") and has("trainswgi") and ((has("trainswww") and ww_access()) or (clifftop_access() and has("trainswih")) or (hfp_access() and has("trainswhp1")) or (can_beat_king_coal() and ggm_access()) or (has("trainswtd") and tdl_access()))
end

-- Area Access

function plateau_access()
    if logictype.CurrentStage <= 1 then
        return has("ggrab") or (has("mta") and billDrill() and has("mumbomt"))
    else
        return true
    end
end

function plateauTop()
    if logictype.CurrentStage <= 1 then
        return has("ttrot") or has("splitup")
    else
        return has("ttrot") or has("splitup") or clockwork_shot()
    end
end

function pinegrove_access(fromTrain)
    if logictype.CurrentStage == 0 then
        return canShootEggs("feggs") and plateau_access() and has("eggaim")
    else
        if fromTrain then
            return canShootEggs("feggs") and plateau_access()
        else
            return (canShootEggs("feggs") and plateau_access()) or (train_WW() and has("wwa")) or (train_TDL() and has("ttorp"))
        end
    end
end

function clifftop_access(fromTrain)
    if logictype.CurrentStage <= 0 then
        return has("splitup") and plateau_access()
    else
        if fromTrain then
            return has("splitup") and plateau_access()
        else
            return (has("splitup") and plateau_access()) or train_CT()
        end
    end
end

function wasteland_access(fromTrain)
    if logictype.CurrentStage == 0 then
        return pinegrove_access() and has("ttorp")
    else
        if fromTrain then
            return pinegrove_access(fromTrain) and has("ttorp")
        else
            return (pinegrove_access(fromTrain) and has("ttorp")) or train_TDL() or (can_leave_GI_from_inside() and has("gia"))
        end
    end
end

function quagmire_access(fromTrain)
    if logictype.CurrentStage == 0 then
        return wasteland_access() and has("springb")
    else
        if fromTrain then
            return wasteland_access(fromTrain) and has("springb")
        else
            return (wasteland_access(fromTrain) and has("springb")) or (can_leave_GI_from_inside() and has("gia"))
        end
    end
end

function mt_access()
    return has("mta") or (hfp_access() and (has_explosives() or has("mumbohp")))
end

function can_access_JSG()
    if logictype.CurrentStage <= 2 then
        return has("mumbomt")
    else
        return glitchedJSGAccess()
    end
end

function glitchedJSGAccess()
    return MT_flight_pad() or has("mumbomt")
end

function prison_compound_open()
    if logictype.CurrentStage == 0 then
        return (has("geggs") or has("mumbomt")) and (has("mta") or (hfp_access() or HFP_to_MT()))
    else
        return (has_explosives() or has("mumbomt")) and (has("mta") or (hfp_access() or HFP_to_MT()))
    end
end

function ggm_access()
    if logictype.CurrentStage == 0 then
        return (has("gga") and has("ggrab")) or dilberta_free()
    elseif logictype.CurrentStage <= 2 then
        return (has("gga") and has("ggrab")) or dilberta_free() or (jrl_access() and can_reach_atlantis() and has("ttorp") and has("ieggs") and has("auqaim"))
    else
        return true
    end
end

function ww_access(fromTrain)
    if logictype.CurrentStage == 0 then
        return has("wwa") and pinegrove_access()
    else
        if fromTrain then
            return (has("wwa") and pinegrove_access(fromTrain)) or (tdl_access("True") and has("mumbotd") and has("humbatd"))
        else
            return (has("wwa") and pinegrove_access(fromTrain)) or train_WW() or (tdl_access("True") and has("mumbotd") and has("humbatd"))
        end
    end
end

function glitchedInfernoAccess()
    return (
        humbaWW() or canShootEggs("ceggs")
    )
end

function jrl_access()
    if logictype.CurrentStage == 0 then
        return clifftop_access() and has("jra")
    else
        return clifftop_access() and has("jra") or (hfp_access() and ccl_access() and has("splitup"))
    end
end

function tdl_access(fromTrain)
    if logictype.CurrentStage == 0 then
        return wasteland_access() and has("tda")
    else
        if fromTrain then
            return wasteland_access(fromTrain) and has("tda")
        else
            return (wasteland_access(fromTrain) and has("tda")) or train_TDL()
        end
    end
end

function gi_access()
    return (can_beat_king_coal() and has("trainswgi")) or (has("clawbts") and gi_outside_access())
end

function gi_floor2_access()
    if logictype.CurrentStage == 0 then
        return gi_access() and can_access_gi_fl1_2fl2()
    else
        return (gi_access() and can_access_gi_fl1_2fl2()) or ((gi_outside_access() or can_leave_GI_from_inside()) and (outside_gi_to_floor2() or (outside_gi_to_floor3() and F3_to_F2())))
    end 
end

function gi_floor3_access()
    return (gi_outside_access() and outside_gi_to_floor3()) or (gi_floor2_access() and F2_to_F3())
end

function gi_outside_access()
    return quagmire_access() and has("gia")
end

function gi_front_door()
    return enter_GI() and has("splitup")
end

function roof_access()
    if logictype.CurrentStage == 0 then
        return has("fpad") and has("climb")
    else
        return has("fpad") and (has("climb") or (has("splitup") and has("lspring")))
    end
end

function outside_gi_to_floor2()
    if logictype.CurrentStage <= 2 then
        return false
    else
        return canShootEggs("ceggs") and (has("climb") or extremelyLongJump())
    end
end

function outside_gi_to_floor3()
    if logictype.CurrentStage == 0 then
        return false
    elseif logictype.CurrentStage == 1 then
        return has("clawbts") and veryLongJump() and has("climb")
    else
        return has("clawbts") and veryLongJump() and (has("climb") or extremelyLongJump())
    end
end

function can_access_gi_fl1_2fl2()
    if logictype.CurrentStage == 0 then
        return has("clawbts") and (springPad() or (has("splitup") and has("lspring")))
    else
        return (has("clawbts") and (springPad() or (has("splitup") and has("lspring")))) or has("splitup") and has("lspring") and has("glide") and (has("wwhack") or has("eggaim"))
    end
end

function can_access_gi_fl2_2fl3all()
    if logictype.CurrentStage == 0 then
        return (has("ggrab") and has("clawbts")) or has("humbagi")
    else
        return (has("clawbts") or has("humbagi")) or has("lspring")
    end
end

function F1_to_F3()
    if logictype.CurrentStage <= 2 then
        return false
    else
        return has("bbash") and has("climb")
    end
end

function F2_to_F1()
    if logictype.CurrentStage == 0 then
        return has("ggrab") and has("fflip")
    else
        return (has("ggrab") or has("bbust")) and has("fflip")
    end
end

function F2_to_F3()
    if logictype.CurrentStage == 0 then
        return (has("fflip") and has("ggrab") and has("clawbs")) or has("humbagi")
    else
        return ((has("fflip") and has("ggrab") or veryLongJump()) and has("clawbts")) or has("humbagi") or (has("splitup") and has("lspring"))
    end
end

function F3_to_F2()
    if logictype.CurrentStage == 0 then
        return has("climb")
    elseif logictype.CurrentStage == 1 then
        return has("climb") or (has("fflip") and has("bbust") and veryLongJump())
    else
        return has("climb") or (has("fflip") and longJump())
    end
end

function can_leave_GI_from_inside()
    return train_GI() and (has("splitup") or has("clawbts"))
end

function hfp_access(fromTrain)
    if logictype.CurrentStage == 0 then
        return clifftop_access() and has("hfa")
    else
        if fromTrain then
            return has("hfa") and clifftop_access(fromTrain)
        else
            return (has("hfa") and clifftop_access(fromTrain)) or train_HFP()
        end
    end
end

function hfpTop()
    return canDoSmallElevation() or has("splitup") or has("fpad")
end

function ccl_access()
    return wasteland_access() and has("cca")
end

function ck_access()
    if logictype.CurrentStage <= 2 then
        return quagmire_access() and has("cka") and has("clawbts")
    else
        return quagmire_access() and has("cka") and (has("clawbts") or (has("geggs") and has("ceggs") and has("eggaim")))
    end
end

function HFP_to_MT()
    if logictype.CurrentStage == 0 then
        return has_explosives()
    else
        return has_explosives() or has("mumbohp")
    end
end

function ggm_to_ww()
    if logictype.CurrentStage <= 2 then
        return false
    else
        return  humbaGGM() and canShootEggs("ceggs")
    end
end

-- Mayahem Temple

function mt_jiggy4()
    if logictype.CurrentStage == 0 then
        return has("eggaim") and (canShootEggs("begg") or canShootEggs("feggs") or canShootEggs("geggs"))
    elseif logictype.CurrentStage == 1 then
        return (canShootEggs("begg") or canShootEggs("feggs") or canShootEggs("geggs") or canShootEggs("ceggs")) and (has("eggaim") or (MT_flight_pad() and has("aireaim")))
    else
        return (canShootEggs("begg") or canShootEggs("feggs") or canShootEggs("geggs") or canShootEggs("ceggs")) and ((has("fflip") and has("bbust")) or has("eggaim") or (MT_flight_pad() and has("aireaim")))
    end
end

function mt_jiggy5()
    if logictype.CurrentStage == 0 then
        return has("eggaim") and (has("fflip") or canReachSlightlyElevatedLedge()) and ((has("ggrab") and springPad() and has("fflip")) or MT_flight_pad())
    else
        return (has("fflip") or canReachSlightlyElevatedLedge()) and ((has("ggrab") and springPad() and canShootLinearEgg() and has("eggaim")) or (MT_flight_pad() and canShootLinearEgg()))
    end
end

-- Witchyworld

function ww_jiggy2()
    if logictype.CurrentStage == 0 then
        return humbaWW() and mumboWW() and has("ggrab")
    elseif logictype.CurrentStage <= 2 then
        return humbaWW() and mumboWW()
    else
        if speedupminigames.CurrentStage == 0 then
            return (has("humbaww") and has("mumboww")) or (canShootEggs("geggs") and canShootEggs("ceggs"))
        else
            return has("humbaww") and has("mumboww")
        end
    end
end

-- Jolly Roger's Lagoon

function jr_jiggy10()
    if logictype.CurrentStage == 0 then
        return has("mumbojr") and has("ttorp") and has("eggaim") and has("ieggs")
    elseif logictype.CurrentStage == 1 then
        return has("ttorp") and has("eggaim") and has("ieggs")
    else
        return has("ttorp") and canShootEggs("ieggs") and (has("ttrot") or has("eggaim"))
    end
end

-- Terrydactyl Land

function td_jiggy2()
    return has("ttorp") and ccl_access() and cclStarterPack() and has("dive")
end

function td_jiggy8()
    if logictype.CurrentStage == 0 then
        return canShootEggs("ieggs") and has("springb") and longJump()
    elseif logictype.CurrentStage == 1 then
        return has("springb") and ((has("splitup") and (has("wwhack") or has("glide"))) or canShootEggs("ieggs")) and longJump()
    elseif logictype.CurrentStage == 2 then
        return has("springb") and longJump()
    else
        return (has("springb") or (has("fpad") and (has("bbomb") or clockworkWarp()))) and longJump()
    end
end

-- Cloud Cuckooland

function cc_jiggy2()
    if logictype.CurrentStage == 0 then
        return cclStarterPack() and has("springb") and has("splitup") and has("sapack") and grow_beanstalk() and can_use_floatus() and has("climb") and has("ttrain")
    elseif logictype.CurrentStage == 1 then
        return cclStarterPack() and (has("springb") or has("fpad")) and has("splitup") and has("sapack") and grow_beanstalk() and can_use_floatus() and has("climb") and (has("ttrain") or has("humbacc"))
    elseif logictype.CurrentStage == 1 then
        return cclStarterPack() and (has("springb") or has("fpad")) and has("splitup") and has("sapack") and grow_beanstalk() and (can_use_floatus() or has("packwh")) and has("climb") and (has("ttrain") or has("humbacc"))
    else
        return cclStarterPack() and (has("springb") or has("fpad")) and has("splitup") and has("sapack") and grow_beanstalk() and (can_use_floatus() or has("packwh")) and has("climb") and (has("ttrain") or has("humbacc") or canShootEggs("ceggs"))
    end
end

function cc_jiggy3()
    if logictype.CurrentStage <= 1 then
        return (
            cclStarterPack() and has("begg") and canShootEggs("feggs") and canShootEggs("geggs") and canShootEggs("ieggs") and billDrill() and mumboCCL()
        )
    else
        return (
            cclStarterPack() and has("begg") and canShootEggs("feggs") and canShootEggs("geggs") and canShootEggs("ieggs") and ((has("bdrill") and mumboCCL()) or has("splitup"))
        )
    end
end

-- BK Move Toggle

Tracker:FindObjectForCode('grat').Active = true
Tracker:FindObjectForCode('arat').Active = true
Tracker:FindObjectForCode('bbarge').Active = true
Tracker:FindObjectForCode('begg').Active = true
Tracker:FindObjectForCode('bbust').Active = true
Tracker:FindObjectForCode('sstride').Active = true
Tracker:FindObjectForCode('ttrain').Active = true
Tracker:FindObjectForCode('bbomb').Active = true

function toggleBKMoves()
    if Tracker:FindObjectForCode('randomizebkmoves').CurrentStage == 0 then
        Tracker:FindObjectForCode('dive').Active = true
        Tracker:FindObjectForCode('fpad').Active = true
        Tracker:FindObjectForCode('fflip').Active = true
        Tracker:FindObjectForCode('eggshoot').Active = true
        Tracker:FindObjectForCode('roll').Active = true
        Tracker:FindObjectForCode('ttrot').Active = true
        Tracker:FindObjectForCode('tjump').Active = true
        Tracker:FindObjectForCode('climb').Active = true
        Tracker:FindObjectForCode('flutter').Active = true
        Tracker:FindObjectForCode('wwing').Active = true
    elseif Tracker:FindObjectForCode('randomizebkmoves').CurrentStage == 1 then
        Tracker:FindObjectForCode('dive').Active = false
        Tracker:FindObjectForCode('fpad').Active = false
        Tracker:FindObjectForCode('fflip').Active = false
        Tracker:FindObjectForCode('eggshoot').Active = false
        Tracker:FindObjectForCode('roll').Active = false
        Tracker:FindObjectForCode('ttrot').Active = true
        Tracker:FindObjectForCode('tjump').Active = true
        Tracker:FindObjectForCode('climb').Active = false
        Tracker:FindObjectForCode('flutter').Active = false
        Tracker:FindObjectForCode('wwing').Active = false
    elseif Tracker:FindObjectForCode('randomizebkmoves').CurrentStage == 2 then
        Tracker:FindObjectForCode('dive').Active = false
        Tracker:FindObjectForCode('fpad').Active = false
        Tracker:FindObjectForCode('fflip').Active = false
        Tracker:FindObjectForCode('eggshoot').Active = false
        Tracker:FindObjectForCode('roll').Active = false
        Tracker:FindObjectForCode('ttrot').Active = false
        Tracker:FindObjectForCode('tjump').Active = false
        Tracker:FindObjectForCode('climb').Active = false
        Tracker:FindObjectForCode('flutter').Active = false
        Tracker:FindObjectForCode('wwing').Active = false
    end
end

ScriptHost:AddWatchForCode("bkmovewatch", "randomizebkmoves", toggleBKMoves)