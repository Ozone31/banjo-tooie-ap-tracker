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
    return Tracker:ProviderCountForCode("note") + Tracker:ProviderCountForCode("treble") + Tracker:ProviderCountForCode("bass")
end

function notecount(targetnotes)
    return notes() >= tonumber(targetnotes)
end

-- Solo Moves (Check for Split Up)

function shack_pack()
    return has("splitup") and has("shpack")
end

function snooze_pack()
    return has("splitup") and has("snpack")
end

function taxi_pack()
    return has("splitup") and has("taxpack")
end

function pack_whack()
    return has("splitup") and has("packwh")
end

function sack_pack()
    return has("splitup") and has("sapack")
end

function wing_whack()
    return has("splitup") and has("wwhack")
end

function glide()
    return has("splitup") and has("glide")
end

function leg_spring()
    return has("splitup") and has("lspring")
end

function hatch()
    return has("splitup") and has("hatch")
end

-- Health Checks

function health_6()
    if Tracker:FindObjectForCode("@Plateau").AccessibilityLevel == 6 then
        return has("honey", 1) and has("ttrot")
    else
        return false
    end
end

function health_7()
    if Tracker:FindObjectForCode("@Plateau").AccessibilityLevel == 6 then
        return has("honey", 4) and has("ttrot")
    else
        return false
    end
end

function health_8()
    if Tracker:FindObjectForCode("@Plateau").AccessibilityLevel == 6 then
        return has("honey", 9) and has("ttrot")
    else
        return false
    end
end

function health_9()
    if Tracker:FindObjectForCode("@Plateau").AccessibilityLevel == 6 then
        return has("honey", 16) and has("ttrot")
    else
        return false
    end
end

function health_10()
    if Tracker:FindObjectForCode("@Plateau").AccessibilityLevel == 6 then
        return has("honey", 25) and has("ttrot")
    else
        return false
    end
end

-- General Functions

function backdoors_enabled()
    return has("backdoorsopen_on")
end

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
        return canShootEggs("geggs")
    else
        return canShootEggs("geggs") or canShootEggs("ceggs")
    end
end

function egg_barge()
    return (has("begg") or has("feggs") or has("ieggs")) and has"eggshoot" and has("bbarge")
end

function hasLinearEgg()
    return has("begg") or has("feggs") or has("geggs") or has("ieggs")
end

function canShootLinearEgg()
    return has("eggaim") or has("eggshoot")
end

function hasGroundAttack()
    return canShootEggs() or has("bbarge") or has("roll") or has("arat") or has("grat") or has("bbust") or breegullBash() or has("wwing")
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
    if Tracker:FindObjectForCode("@Pine Grove").AccessibilityLevel == 6 then
        return has("humbaih") and has("grat")
    else
        return false
    end
end

function MT_flight_pad()
    return has("fpad") and (has("mumbomt") or (billDrill() and (canDoSmallElevation() or has("flutter"))))
end

function dilberta_free()
    if logictype.CurrentStage == 0 then
        return prison_compound_open() and billDrill() and has("humbamt") and has("mumbomt")
    else
        return prison_compound_open() and billDrill()
    end
end

function GM_boulders()
    return (billDrill() and canDoSmallElevation()) or humbaGGM()
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
        return has("ttrot") or has("ttrain") or has("springb")
    end
end

function humbaGGM()
    if logictype.CurrentStage <= 1 then
        return ggm_trot() and has("humbagm")
    else
        return (ggm_trot() or clockwork_shot()) and has("humbagm")
    end
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
        return mumboGGM() and ggm_to_chuffy() and attackKingCoal()
    else
        return has("chuffy") and attackKingCoal()
    end
end

function attackKingCoal()
    if logictype.CurrentStage == 0 then
        return canShootEggs("begg") or canShootEggs("geggs") or canShootEggs("ieggs")
    elseif logictype.CurrentStage == 1 then
        return canShootEggs("begg") or canShootEggs("geggs") or canShootEggs("ieggs") or has("bbarge") or has("roll") or has("arat")
    else
        return canShootEggs("begg") or canShootEggs("geggs") or canShootEggs("ieggs") or has("bbarge") or has("roll") or has("arat") or has("grat") or breegullBash()
    end
end

function ggm_to_chuffy()
    if logictype.CurrentStage == 0 then
        return has("climb") and canDoSmallElevation()
    elseif logictype.CurrentStage == 1 then
        return canDoSmallElevation() or has("climb")
    else
        return canDoSmallElevation() or has("climb") or has("bbust")
    end
end

function ww_to_chuffy()
    if logictype.CurrentStage == 0 then
        return has("trainswww") and has("climb") and canDoSmallElevation()
    else
        return has("trainswww") and (canDoSmallElevation() or has("climb"))
    end
end

function ioh_to_chuffy()
    if logictype.CurrentStage == 0 then
        return has("trainswih") and has("climb") and canDoSmallElevation()
    elseif logictype.CurrentStage == 1 then
        return has("trainswih") and (canDoSmallElevation() or has("climb"))
    else
        return has("trainswih") and (canDoSmallElevation() or has("climb") or has("bbust"))
    end
end

function tdl_to_chuffy()
    if logictype.CurrentStage == 0 then
        return has("trainswtd") and (has("climb") and canDoSmallElevation())
    elseif logictype.CurrentStage == 1 then
        return has("trainswtd") and ((canDoSmallElevation() or has("bbust")) and has("climb") or has("fflip") and has("bbust"))
    else
        return has("trainswtd") and (((canDoSmallElevation() or has("bbust")) and has("climb")) or extremelyLongJump() or has("fflip") and has("bbust"))
    end
end

function tdl_to_hatch()
    if logictype.CurrentStage == 0 then
        return longJump() or has("springb")
    elseif logictype.CurrentStage == 1 then
        return longJump() or has("springb") or has("splitup")
    elseif logictype.CurrentStage == 2 then
        return longJump() or has("springb") or tdl_top() or has("splitup")
    else
        return longJump() or has("springb") or TDLFlightPad() or has("splitup") or tdl_top()
    end
end

function gi_to_chuffy()
    return has("trainswgi")
end

function hfp_to_chuffy()
    if logictype.CurrentStage == 0 then
        return has("trainswhp1") and has("climb") and canDoSmallElevation()
    else
        return has("trainswhp1") and (has("climb") and (canDoSmallElevation() or has("bbust")) or has("ttrot"))
    end
end

function can_access_water_storage_jinjo_from_GGM()
    if logictype.CurrentStage == 0 then
        return false
    elseif logictype.CurrentStage == 1 then
        return wing_whack() and leg_spring() and glide() and GM_boulders()
    else
        return (wing_whack() and leg_spring() and glide() and GM_boulders()) or clockwork_shot()
    end
end

function can_access_water_storage_jinjo_from_JRL()
    if logictype.CurrentStage <= 1 then
        return has("ttorp")
    else
        return can_reach_atlantis() and has("ieggs") and has("auqaim") and has("ttorp")
    end
end

function humbaWW()
    if logictype.CurrentStage == 0 then
        return has("humbaww") and has("fflip") and has("ggrab")
    elseif logictype.CurrentStage == 1 then
        return has("humbaww") and ((has("fflip") and has("ggrab")) or (has("climb") and veryLongJump()) or leg_spring())
    else
        return has("humbaww") and ((has("fflip") and has("ggrab")) or (has("climb") and veryLongJump() and has("fflip")) or (clockwork_shot() and has("climb")) or leg_spring())
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
        return (longJumpToGripGrab() and has("fflip") and has("climb") and (has_explosives() or has("bbarge"))) or backdoors_enabled()
    elseif logictype.CurrentStage == 1 then
        return ((longJumpToGripGrab() and has("fflip") and has("climb") and (has_explosives() or has("bbarge"))) or (has("eggaim") and canShootEggs("geggs") and has("amazeogaze") and has("climb")) or (has_explosives() and leg_spring() and glide())) or backdoors_enabled()
    elseif logictype.CurrentStage <= 2 then
        return ((longJumpToGripGrab() and has("fflip") and has("climb") and (has_explosives() or has("bbarge"))) or (has("eggaim") and canShootEggs("geggs") and has("amazeogaze")) or (has_explosives() and leg_spring() and glide())) or backdoors_enabled() or clockwork_shot()
    else
        if Tracker:FindObjectForCode("@Glitter Gulch Mine - Main Area").AccessibilityLevel == 6 and humbaGGM() and canDoSmallElevation() and canShootEggs("ceggs") then
            return true
        else
            return (((longJumpToGripGrab() and has("fflip") and has("climb") and (has_explosives() or has("bbarge"))) or (has("eggaim") and canShootEggs("geggs") and has("amazeogaze")) or (has_explosives() and leg_spring() and glide())) or (ggm_access() and canDoSmallElevation() and canShootEggs("ceggs"))) or backdoors_enabled() or clockwork_shot()
        end
    end
end

function can_reach_saucer()
    return (longJumpToGripGrab() and has("fflip") and has("climb")) or canDoSmallElevation()
end

function smuggle_food()
    if logictype.CurrentStage <= 1 then
        return has("clawbts") and has("ttrot") and has_explosives()
    else
        return has_explosives() or springPad()
    end
end

function can_dive_in_JRL()
    if logictype.CurrentStage == 0 then
        return has("mumbojr") and has("dive")
    else
        return has("dive")
    end
end

function humbaJRL()
    return can_dive_in_JRL() and can_reach_atlantis() and has("humbajr")
end

function doubloon_water()
    if logictype.CurrentStage == 0 then
        return has("dive")
    else
        return has("dive") or (shack_pack() and has_explosives())
    end
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
    if has("backdoorsopen_on") and Tracker:FindObjectForCode("@Hailfire Peaks - Lava Side").AccessibilityLevel == 6 and (has("splitup") and (has("dive") or shack_pack())) then
        return true
    elseif Tracker:FindObjectForCode("@Hailfire Peaks - Lava Side").AccessibilityLevel == 6 and Tracker:FindObjectForCode("@Cloud Cuckooland - Outside").AccessibilityLevel == 6 and (has("splitup") and hasGroundAttack() and (has("dive") or shack_pack())) then
        return true
    else
        return false
    end
end

function humbaHFP()
    return hfpTop() and has("humbahp")
end

function TDLFlightPad()
    if logictype.CurrentStage == 0 then
        return can_beat_terry() and has("springb") and has("fpad")
    else
        return can_beat_terry() and has("fpad") and (has("springb") or (has("ttrot") and has("flutter")))
    end
end

function can_beat_terry()
    if logictype.CurrentStage <= 1 then
        return has("eggaim") and canShootLinearEgg() and tdl_top()
    else
        return tdl_top() and canShootLinearEgg() and (has("fflip") or has("eggaim"))
    end
end

function tdl_top()
    if logictype.CurrentStage <= 1 then
        return has("springb") and (has("tjump") and (has("flutter") or has("arat")) or has("splitup") or has("ttrot"))
    elseif logictype.CurrentStage == 2 then
        return has("springb") or leg_spring() and glide()
    else
        return has("springb") or leg_spring() and glide() or (has("fpad") and (has("tjump") or has("bbust") or has("ggrab")) and (has("bbomb") or clockworkWarp()))
    end
end

function mumboTDL()
    if logictype.CurrentStage == 0 then
        return has("sstride") and has("mumbotd")
    else
        return has("mumbotd")
    end
end

function humbaTDL()
    if logictype.CurrentStage <= 1 then
        return canDoSmallElevation() and has("humbatd")
    else
        return has("humbatd")
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
        return has("ttrot") and (has("flutter") or has("arat")) and has("bbust")
    end
end

function gi_train_station()
    return can_beat_king_coal() and has("trainswgi")
end

function can_use_battery()
    return pack_whack() and taxi_pack()
end

function can_beat_weldar()
    if logictype.CurrentStage == 0 then
        return can_use_battery() and mumboGI() and humbaGI() and canShootEggs("geggs") and billDrill() and has("climb") and has("fflip") and has("ggrab")
    elseif logictype.CurrentStage == 1 then
        return can_use_battery() and mumboGI() and humbaGI() and canShootEggs("geggs") and billDrill() and has("climb") and has("fflip") and (has("ggrab") or (has("tjump") and (has("flutter") or has("arat"))))
    else
        return can_use_battery() and mumboGI() and humbaGI() and canShootEggs("geggs") and billDrill() and has("climb") and has("fflip") and ((has("ggrab") or (has("tjump") and (has("flutter") or has("arat")))) or extremelyLongJump())
    end
end

function solo_banjo_waste_disposal()
    if logictype.CurrentStage == 0 then
        return has("ggrab") and can_use_battery() and has("climb")
    else
        return can_use_battery() and (has("ggrab") and has("climb") or has("tjump"))
    end
end

function breegullBash()
    return has("grat") and has("bbash")
end

function mumboGI()
    if logictype.CurrentStage <= 1 then
        if Tracker:FindObjectForCode("@Grunty Industries 3rd Floor").AccessibilityLevel == 6 then
            return canDoSmallElevation() and has("mumbogi")
        else
            return false
        end
    else
        if Tracker:FindObjectForCode("@Grunty Industries 3rd Floor").AccessibilityLevel == 6 then
            return has("mumbogi") and (canDoSmallElevation() or (has("climb") and clockwork_shot()))
        else
            return false
        end
    end
end

function humbaGI()
    if Tracker:FindObjectForCode("@Grunty Industries 2nd Floor").AccessibilityLevel == 6 then
        return has("humbagi")
    else
        return false
    end
end

function QM_to_WL()
    if logictype.CurrentStage == 0 then
        return has("ggrab") and has("fflip")
    else
        return (has("ggrab") or has("bbust")) and has("fflip")
    end
end

function quag_to_CK()
    if logictype.CurrentStage <= 2 then
        return has("clawbts") and has("cka")
    else
        return (clockworkWarp() and has("ttrot") or has("clawbts")) and (has("cka") or (has("climb") and has("tjump") and has("bbust") and (has("flutter") or has("arat"))))
    end
end

function lower_icy_side()
    if logictype.CurrentStage == 0 then
        return hfpTop() or has_explosives()
    else
        return hfpTop() or has_explosives() or has("mumbohp")
    end
end

function iceCube()
    return canShootEggs("begg") or canShootEggs("feggs") or has_explosives() or has("bbarge") or has("roll") or has("arat") or has("grat") or has("bbust") or breegullBash() or has("wwing")
end

function iceCubeKazooie()
    return has("splitup") and (has_explosives() or canShootEggs("feggs") or canShootEggs("begg") or wing_whack())
end

function cclStarterPack()
    if logictype.CurrentStage <= 1 then
        return (has("fpad") and hasGroundAttack()) or canDoSmallElevation() or has("ggrab")
    else
        return (has("fpad") and hasGroundAttack()) or canDoSmallElevation() or has("ggrab") or clockwork_shot()
    end
end

function notes_ccl_high()
    return has("fpad") or has("humbacc")
end

function notes_ccl_low()
    return true
end

function notes_cheese()
    if logictype.CurrentStage == 0 then
        return (has("climb") and sack_pack()) or notes_ccl_high()
    elseif logictype.CurrentStage == 1 then
        return (has("climb") and sack_pack()) or notes_ccl_high() or has("springb") and has("splitup")
    else
        return (has("climb") and sack_pack()) or notes_ccl_high() or clockwork_shot() or has("springb") and has("splitup")
    end
end

function mumboCCL()
    return has("tjump") and has("mumbocc")
end

function can_use_floatus()
    return taxi_pack() and hatch()
end

function grow_beanstalk()
    return billDrill() and mumboCCL() and has("fpad") and has("climb")
end

function hasMobileAttack()
    return canShootEggs() or has("bbarge") or has("roll") or has("arat") or has("wwing")
end

function hasRepeatableMobileAttack()
    return canShootEggs("begg") or canShootEggs("feggs") or canShootEggs("geggs") or canShootEggs("ieggs") or has("bbarge") or has("roll") or has("arat")
end

-- Area Access

function plateau_start()
    if first_silo == "Isle O Hags - Plateau" or first_silo == "ALL" then
        return true
    else
        return false
    end
end

function pinegrove_start()
    if first_silo == "Isle O Hags - Pine Grove" or first_silo == "ALL" then
        return true
    else
        return false
    end
end

function clifftop_start()
    if first_silo == "Isle O Hags - Cliff Top" or first_silo == "ALL" then
        return true
    else
        return false
    end
end

function wasteland_start()
    if first_silo == "Isle O Hags - Wasteland" or first_silo == "ALL" then
        return true
    else
        return false
    end
end

function quagmire_start()
    if first_silo == "Isle O Hags - Quagmire" or first_silo == "ALL" then
        return true
    else
        return false
    end
end

function SM_to_GL()
    if logictype.CurrentStage <= 1 then
        return has("fpad") or has("fflip") and has("climb")
    else
        return has("fpad") or has("fflip") and has("climb") or (has("tjump") or has("ttrot") and has("flutter")) and has("bbust") and has("climb")
    end
end

function canGetPassedKlungo()
    if logictype.CurrentStage <= 1 then
        return hasMobileAttack()
    else
        return hasGroundAttack()
    end
end

function plateauTop()
    if logictype.CurrentStage <= 1 then
        return has("ttrot") or has("splitup")
    else
        return has("ttrot") or has("splitup") or clockwork_shot()
    end
end

function can_access_JSG()
    if logictype.CurrentStage <= 2 then
        return has("mumbomt")
    else
        return glitchedJSGAccess()
    end
end

function glitchedJSGAccess()
    return MT_flight_pad() and has("bbomb") or has("mumbomt")
end

function WH_to_PL()
    if logictype.CurrentStage <= 1 then
        return canReachSlightlyElevatedLedge()
    else
        return canReachSlightlyElevatedLedge() or (has("fflip") and has("bbust"))
    end
end

function PL_to_GGM()
    if logictype.CurrentStage <= 2 then
        return has("gga")
    else
        return has("gga") or (has("bbust") and (has("fflip") or has("tjump") or (has("ttrot") and has("flutter"))))
    end
end

function PL_to_PG()
    if logictype.CurrentStage == 0 then
        return has("feggs") and has("eggaim")
    else
        return has("feggs") and has("eggaim") or has("ttrot") and canShootEggs("feggs") or has("splitup") and canShootEggs("feggs")
    end
end

function CT_to_PL()
    if logictype.CurrentStage == 0 then
        return false
    else
        return true
    end
end

function PG_to_PL()
    if logictype.CurrentStage == 0 then
        return false
    else
        return true
    end
end

function PGU_to_PG()
    if logictype.CurrentStage == 0 then
        return has("ggrab") or has("tjump")
    elseif logictype.CurrentStage == 1 then
        return has("ggrab") or has("tjump") or (has("bbust") and (has("flutter") or has("arat")))
    else
        return has("ggrab") or has("tjump") or has("bbust")
    end
end

function WL_to_PGU()
    if logictype.CurrentStage == 0 then
        return has("ttorp") and has("dive")
    elseif logictype.CurrentStage <= 2 then
        return has("ttorp") and (has("nestsanity_off") or has("dive") or has("bbust"))
    else
        return (has("nestsanity_off") or has("dive") or has("bbust"))
    end
end

function GGM_to_PL()
    if logictype.CurrentStage == 0 then
        return has("gga") and has("climb")
    else
        return has("climb")
    end
end

function escape_ggm_loading_zone()
    if logictype.CurrentStage == 0 then
        return has("gga") and has("climb")
    else
        return has("climb") or has("bbust") or has("flutter") or has("arat")
    end
end

function WW_to_PG()
    if logictype.CurrentStage == 0 then
        return has("wwa")
    else
        return true
    end
end

function HFP_to_CTHFP()
    if logictype.CurrentStage == 0 then
        return has("hfa")
    else
        return true
    end
end

function JRL_to_CT()
    if logictype.CurrentStage == 0 then
        return has("jra")
    else
        return true
    end
end

function exit_level()
    if logictype.CurrentStage == 0 then
        if load_jrl == "Mayahem Temple" then
            return has("mta")
        elseif load_jrl == "Glitter Gulch Mine" then
            return has("gga")
        elseif load_jrl == "Witchyworld" then
            return has("wwa")
        elseif load_jrl == "Jolly Roger's Lagoon - Town Center" then
            return has("jra")
        elseif load_jrl == "Terrydactyland" then
            return has("tda")
        elseif load_jrl == "Outside Grunty Industries" then
            return has("gia")
        elseif load_jrl == "Hailfire Peaks" then
            return has("hfa")
        elseif load_jrl == "Cloud Cuckooland" then
            return has("cca")
        elseif load_jrl == "Cauldron Keep" then
            return has("cka")
        end
    else
        return true
    end
end

function TDL_to_IOHWL()
    if logictype.CurrentStage == 0 then
        return has("tda")
    else
        return true
    end
end

function CCL_to_IOHWL()
    if logictype.CurrentStage == 0 then
        return has("cca")
    else
        return true
    end
end

function TDL_to_WW()
    if logictype.CurrentStage <= 2 then
        return oogle_boogles_open() and (springPad() or has_explosives())
    else
        return (springPad() or has_explosives()) and (oogle_boogles_open() or clockworkWarp())
    end
end

function ggm_to_fuel_depot()
    return humbaGGM() and canDoSmallElevation()
end

function ggm_to_ww()
    if logictype.CurrentStage <= 2 then
        return backdoors_enabled() and canDoSmallElevation() and has("humbagm")
    else
        return (canShootEggs("ceggs") or backdoors_enabled()) and canDoSmallElevation() and has("humbagm")
    end
end

function ww_to_fuel_depot()
    if logictype.CurrentStage <= 1 then
        return has("climb") and has("fflip") and has("ggrab") and longJumpToGripGrab() and saucer_door_open()
    else
        return has("climb") and has("fflip") and (has("ggrab") or has("bbust")) and longJumpToGripGrab() and saucer_door_open()
    end
end

function glitchedInfernoAccess()
    return (
        humbaWW() or canShootEggs("ceggs") and has("tjump")
    )
end

function hatch_to_TDL()
    if logictype.CurrentStage <= 2 then
        return backdoors_enabled()
    else
        return (has("ceggs") and has("eggaim")) or backdoors_enabled()
    end
end

function outside_gi_to_outside_back()
    if logictype.CurrentStage == 0 then
        return has("climb") and has("fflip") and longJump() and has("ggrab")
    elseif logictype.CurrentStage == 1 then
        return has("climb")
    else
        return has("climb") or extremelyLongJump()
    end
end

function outside_gi_to_floor1()
    if logictype.CurrentStage <= 2 then
        return false
    else
        return clockwork_shot()
    end
end

function outside_gi_back_to_floor2()
    if logictype.CurrentStage <= 2 then
        return false
    else
        return canShootEggs("ceggs") and (has("climb") or extremelyLongJump())
    end
end

function outside_gi_back_to_floor_3()
    if logictype.CurrentStage == 0 then
        return false
    else
        return has("clawbts") and (has("flutter") or has("arat"))
    end
end

function outside_gi_back_to_floor_4()
    if logictype.CurrentStage == 0 then
        return false
    else
        return has("clawbts") and (has("flutter") or has("arat")) and canDoSmallElevation()
    end
end

function outside_gi_to_floor_5() -- and can reach 4th Floor or humbagi and can reach 2nd Floor
    return outside_gi_to_outside_back() and has("fpad")
end

function outside_gi_back_to_floor_5() -- and can reach 4th Floor or humbagi and can reach 2nd Floor
    return has("climb") and has("fpad")
end

function elevator_shaft_to_floor_1() -- there's a lot of region stuff
    if logictype.CurrentStage == 0 then
        return has("climb")
    else
        return has("climb") or has("bbust")
    end
end

function elevator_shaft_to_em() -- there's a lot of region stuff
    if logictype.CurrentStage <= 2 then
        return false
    else
        return has("climb") and breegullBash()
    end
end

function elevator_shaft_to_boiler_plant() -- there's a lot of region stuff
    if logictype.CurrentStage <= 2 then
        return false
    else
        return has("climb") and breegullBash()
    end
end

function elevator_shaft_to_floor_4()
    if logictype.CurrentStage <= 2 then
        return false
    else
        return has("climb") and (breegullBash() or has("geggs") and has("eggaim"))
    end
end

function em_chamber_to_elevator_shaft()
    return elevator_door()
end

function boiler_plant_to_elevator_shaft()
    return elevator_door()
end

function floor_2_em_room_to_elevator_shaft()
    return elevator_door()
end

function floor_4_back_to_elevator_shaft() -- glitched logic has a 4th floor alternative
    return has("climb") and elevator_door()
end

function floor_5_to_foor_1()
    if logictype.CurrentStage == 0 then
        return has("fpad") and (has("bbomb") or has("eggaim") or has("aireaim")) and (has("flutter") or has("arat"))
    elseif logictype.CurrentStage == 1 then
        return has("fpad") and (has("bbomb") or has("eggaim") or has("aireaim") or has_explosives()) and (has("flutter") or has("arat"))
    else
        return has("fpad") and (has("bbomb") or has("eggaim") or has("aireaim") or has_explosives())
    end
end

function elevator_door()
    return has("bbarge") or has_explosives() or has("grat") or has("arat")
end

function F1_to_F2()
    if logictype.CurrentStage == 0 then
        return has("clawbts") and (springPad() or leg_spring())
    else
        return has("clawbts") and (springPad() or leg_spring()) or leg_spring() and glide() and (wing_whack() or has("eggaim"))
    end
end

function F2_to_F1()
    if logictype.CurrentStage == 0 then
        return has("ggrab") and has("fflip")
    else
        return (has("ggrab") or has("bbust")) and has("fflip")
    end
end

function floor_2_to_em_room()
    if logictype.CurrentStage == 0 then
        return floor_2_split_up() and has("ggrab") and can_use_battery()
    else
        return floor_2_split_up() and can_use_battery()
    end
end

function floor_2_split_up()
    if logictype.CurrentStage <= 1 then
        return has("splitup") and (has("climb") or has_explosives())
    else
        return has("splitup") and (has("climb") or has_explosives() or has("clawbts") and extremelyLongJump())
    end
end

function F2_to_F3()
    if logictype.CurrentStage == 0 then
        return (has("fflip") and has("ggrab") and has("clawbs") and has("climb"))
    elseif logictype.CurrentStage <= 2 then
        return ((has("fflip") and has("ggrab") or veryLongJump()) and has("clawbts") and has("climb")) or leg_spring() and floor_2_split_up()
    else
        return ((has("fflip") and has("ggrab") or veryLongJump()) and has("clawbts") and (has("climb") or (has("geggs") and has("eggshoot") and has("fflip") and has("bbust")))) or leg_spring() and floor_2_split_up()
    end
end

function floor_3_to_outside_back()
    return has("climb") and drop_down_from_higher_floors_outside()
end

function floor_4_to_outside_back()
    return escape_floor_4_bk() and drop_down_from_higher_floors_outside()
end

function drop_down_from_higher_floors_outside()
    if logictype.CurrentStage == 0 then
        return false
    elseif logictype.CurrentStage == 1 then
        return has("bbust") or has("flutter") or has("arat")
    else
        return true
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

function floor_3_to_boiler_plant()
    return has("fflip") and has("ggrab") or has("climb") and canReachSlightlyElevatedLedge()
end

function F3_to_F4()
    return (has("climb") or leg_spring()) and canDoSmallElevation()
end

function escape_floor_4_bk()
    if logictype.CurrentStage <= 1 then
        return has("springb")
    else
        return has("springb") or has("fflip") and has("ggrab")
    end
end

function floor_4_to_floor_4_back()
    if logictype.CurrentStage <= 2 then
        return mumboGI() and has("tjump")
    else
        return (mumboGI() and has("tjump")) or (has("tjump") and pack_whack()) or (clockworkWarp() and (springPad() or has("fflip")))
    end
end

function floor_5_to_boiler_plant()
    return has("fpad") and (has("bbomb") or has_explosives() and (has("eggaim") or has("aireaim")))
end

function hfpTop()
    if Tracker:FindObjectForCode("@Inside Chuffy").AccessibilityLevel == 6 and has("trainswhp1") then
        return true
    else
        if logictype.CurrentStage == 0 then
            return canDoSmallElevation() or has("fpad") or has_explosives()
        else
            return canDoSmallElevation() or has("fpad") or has_explosives() or has("mumbohp") or dragon_kazooie()
        end
    end
end

function HFP_to_JRL()
    if logictype.CurrentStage <= 2 then
        return HFP_hot_water_cooled()
    else
        return HFP_hot_water_cooled() or (has("ggrab") and (has("flutter") or has("arat")) and has("grat") and has("tjump"))
    end
end

function CK_to_Quag()
    if logictype.CurrentStage == 0 then
        return has("cka")
    else
        return true
    end
end

function mt_tdl_backdoor()
    if logictype.CurrentStage == 0 then
        return has("eggaim") and (has("fflip") or canReachSlightlyElevatedLedge()) and ((has("ggrab") and springPad() and has("fflip")) or MT_flight_pad()) and backdoors_enabled()
    else
        return (has("fflip") or canReachSlightlyElevatedLedge()) and ((has("ggrab") and springPad() and has("fflip")) or MT_flight_pad()) and backdoors_enabled()
    end
end

function mt_hfp_backdoor()
    return has("humbamt") and has("mumbomt") and backdoors_enabled()
end

function ww_tdl_backdoor()
    if logictype.CurrentStage <= 1 then
        return has_explosives() and has("clawbts") and has("ttrot") and backdoors_enabled()
    else
        return has_explosives() and has("clawbts") and (has("ttrot") or ((has("ggrab") or has("bbust")) and has("climb") and has("fflip"))) and backdoors_enabled()
    end
end

-- Isle O' Hags

function pink_mystery_egg()
    return (canShootEggs("geggs") or (has("aireaim") and has("geggs"))) and has("fpad")
end
    
-- Mayahem Temple

function mt_jiggy4()
    if logictype.CurrentStage == 0 then
        return has("eggaim") and hasLinearEgg()
    elseif logictype.CurrentStage == 1 then
        return has("eggaim") or (MT_flight_pad() and has("aireaim"))
    else
        return (has("eggaim") or (MT_flight_pad() and has("aireaim"))) or (has("fflip") and has("bbust")) or (MT_flight_pad() and has("bbomb"))
    end
end

function mt_jiggy5()
    if logictype.CurrentStage == 0 then
        return has("eggaim") and (has("fflip") or canReachSlightlyElevatedLedge()) and ((has("ggrab") and springPad() and has("fflip") and has("ttrot")) or MT_flight_pad())
    else
        if Tracker:FindObjectForCode("@Terrydactyland - Unga Bungas' Cave").AccessibilityLevel == 6 and ((has("fflip") or canReachSlightlyElevatedLedge()) and (MT_flight_pad() and canShootEggs() or has("eggaim"))) then
            return true
        else
            return (has("fflip") or canReachSlightlyElevatedLedge()) and ((has("ggrab") and springPad() and has("fflip") and has("eggaim") and has("ttrot")) or (MT_flight_pad() and canShootEggs())) and (MT_flight_pad() and canShootEggs() or has("eggaim"))
        end
    end
end

function mt_jiggy8()
    if logictype.CurrentStage == 0 then
        return billDrill() and (has("dive") or canReachSlightlyElevatedLedge() and has("tjump")) and canDoSmallElevation() and prison_compound_open()
    elseif logictype.CurrentStage == 1 then
        return billDrill() and canDoSmallElevation() and prison_compound_open() and (has("dive") or canReachSlightlyElevatedLedge() or has("bbust"))
    else
        return prison_compound_open() and ((billDrill() and canDoSmallElevation()) or extremelyLongJump() or clockwork_shot()) and (has("dive") or canReachSlightlyElevatedLedge() or has("bbust"))
    end
end

function cheato_prison()
    if logictype.CurrentStage == 0 then
        return prison_compound_open() and canReachSlightlyElevatedLedge() and has("tjump")
    elseif logictype.CurrentStage == 1 then
        return prison_compound_open() and canReachSlightlyElevatedLedge()
    else
        return prison_compound_open() and (canReachSlightlyElevatedLedge() or clockwork_shot())
    end
end

function jiggy_prison_quicksand()
    if logictype.CurrentStage == 0 then
        return canReachSlightlyElevatedLedge() and has("sstride") and prison_compound_open() and has("tjump")
    else
        return canReachSlightlyElevatedLedge() and has("sstride") and prison_compound_open()
    end
end

function prison_compound_open()
    return has_explosives() or has("mumbomt")
end

-- Glitter Gulch Mine

function gm_jiggy10()
    if logictype.CurrentStage == 0 then
        return humbaGGM() and has("dive") and (has("tjump") or has("ggrab"))
    elseif logictype.CurrentStage == 1 then
        return has("dive") and (has("tjump") or has("ggrab") or has("bbust")) and (humbaGGM() or has("ttrot") and (has("flutter") or has("arat")) or has("roll") and has("tjump") and (has("flutter") or has("arat")))
    else
        return has("dive") and (has("tjump") or has("ggrab") or has("bbust") or clockwork_shot()) and (humbaGGM() or has("ttrot") and (has("flutter") or has("arat")) or has("roll") and has("tjump") and (has("flutter") or has("arat")))
    end
end

function jiggy_generator_cavern()
    if logictype.CurrentStage == 0 then
        return has("feggs") and has("eggaim") and longJump() and (has("fflip") or has("ttrot"))
    elseif logictype.CurrentStage == 1 then
        return (longJump() and (has("fflip") or has("ttrot")) and (has_fire() or billDrill())) or has("fflip") and has("bbust") and has("climb") or GM_boulders() and leg_spring() and canShootEggs("feggs") or GM_boulders() and has("tjump") and pack_whack() and has("climb")
    else
        return longJump() and (has("fflip") or has("ttrot")) or has("fflip") and has("bbust") and has("climb") or clockwork_shot() or GM_boulders() and has("tjump") and pack_whack() and has("climb") or GM_boulders() and leg_spring()
    end
end

function notes_hard_fuel_depot()
    if logictype.CurrentStage == 0 then
        return canDoSmallElevation()
    elseif logictype.CurrentStage == 1 then
        return canDoSmallElevation() or ggm_trot() or has("bbust")
    else
        return canDoSmallElevation() or ggm_trot() or clockwork_shot() or has("bbust") or has("arat")
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
            return (humbaWW() and mumboWW()) or (clockworkWarp())
        else
            return humbaWW() and mumboWW()
        end
    end
end

function notes_ww_area51_right()
    if logictype.CurrentStage == 0 then
        return has_explosives() and springPad()
    elseif logictype.CurrentStage == 1 then
        return has_explosives() and springPad() or leg_spring() or glide()
    else
        return ((has_explosives() or has("splitup")) and springPad()) or leg_spring() or clockwork_shot() or glide()
    end
end

function notes_ww_area51_left()
    if logictype.CurrentStage == 0 then
        return has_explosives() and springPad() and longJump()
    elseif logictype.CurrentStage == 1 then
        return has_explosives() and springPad() and longJump() or leg_spring() or glide()
    else
        return has_explosives() and springPad() and longJump() or has("splitup") and springPad() or leg_spring() or clockwork_shot() or glide()
    end
end

function a51_nests_from_WW()
    if logictype.CurrentStage == 0 then
        return has_explosives()
    elseif logictype.CurrentStage == 1 then
        return has_explosives() or glide() or leg_spring()
    else
        return has_explosives() or glide() or leg_spring() or has("splitup") and springPad()
    end
end

function a51_nests_from_TDL()
    if logictype.CurrentStage <= 2 then
        return oogle_boogles_open()
    else
        return oogle_boogles_open() or clockworkWarp()
    end
end

function honeycomb_space_zone()
    if logictype.CurrentStage <= 1 then
        return has("ggrab") and has("climb") and has("fflip")
    elseif logictype.CurrentStage == 2 then
        return (has("ggrab") or has("bbust")) and has("climb") and has("fflip") and (clockwork_shot() or longJumpToGripGrab()) or leg_spring() and glide() or clockwork_shot() and (has("ttrot") or has("splitup"))
    else
        if Tracker:FindObjectForCode("@Glitter Gulch Mine - Fuel Depot Behind the Rocks").AccessibilityLevel == 6 and clockwork_shot() and ggm_to_ww() then
            return true
        else
            return (has("ggrab") or has("bbust")) and has("climb") and has("fflip") and (clockwork_shot() or longJumpToGripGrab()) or leg_spring() and glide() or clockwork_shot() and (has("ttrot") or has("splitup"))
        end
    end
end

function jiggy_peril()
    if Tracker:FindObjectForCode("@Glitter Gulch Mine - Main Area").AccessibilityLevel == 6 then
        return humbaGGM() and mumboWW() and saucer_door_open() and can_reach_saucer() and has_explosives()
    else
        return false
    end
end

-- Jolly Roger's Lagoon

function jr_jiggy4()
    if logictype.CurrentStage == 0 then
        return HFP_hot_water_cooled() and jrl_waste_disposal() and has("fflip") and (has_explosives() or has("bbarge"))
    elseif logictype.CurrentStage == 1 then
        return HFP_hot_water_cooled() and jrl_waste_disposal() and (has("fflip") or has("tjump") and has("bbust") or has("ttrot") and has("flutter") and has("bbust")) and (has_explosives() or has("bbarge"))
    elseif logictype.CurrentStage == 2 then
        return HFP_hot_water_cooled() and jrl_waste_disposal() and ((has("fflip") or has("tjump") and has("bbust") or has("ttrot") and has("flutter") and has("bbust") or has("tjump") and has("flutter") or extremelyLongJump()) and (has_explosives() or has("bbarge")) or clockwork_shot())
    else
        return HFP_hot_water_cooled() and jrl_waste_disposal() and ((has("fflip") or has("tjump") and has("bbust") or has("ttrot") and has("flutter") and has("bbust")) and (has_explosives() or has("bbarge")) or clockwork_shot())
    end
end

function jr_jiggy10()
    if logictype.CurrentStage == 0 then
        return has("mumbojr") and has("ttorp") and has("eggaim") and has("ieggs")
    elseif logictype.CurrentStage == 1 then
        return has("ttorp") and has("eggaim") and has("ieggs")
    else
        return has("ttorp") and canShootEggs("ieggs") and (has("ttrot") or has("eggaim"))
    end
end

function jiggy_merry_maggie()
    if logictype.CurrentStage <= 1 then
        return can_reach_atlantis()
    else
        return (has("auqaim") or has("eggaim")) and hasLinearEgg()
    end
end

function jr_doubloonalcove()
    if logictype.CurrentStage == 0 then
        return has("splitup") and has_explosives() and springPad()
    elseif logictype.CurrentStage == 1 then
        return has("splitup") and has_explosives() and (springPad() or leg_spring())
    else
        return has("splitup") and has_explosives() and (springPad() or leg_spring() or pack_whack() and has("tjump") and has("ggrab") or glide() and has("tjump") or wing_whack() and has("tjump")) or clockwork_shot()
    end
end

function jrl_waste_disposal()
    if logictype.CurrentStage == 0 then
        return (has_explosives() or billDrill()) and (has("ttrot") or has("tjump") and has("roll") and has("flutter"))
    else
        return (has_explosives() or billDrill()) and (has("ttrot") or has("tjump") and has("roll") and has("flutter") or has("doubloon", 28) and has("ttrain"))
    end
end

-- Terrydactyland

function td_jinjo2()
    if logictype.CurrentStage == 0 then
        return TDLFlightPad() and (has("bbomb") or has("geggs") and has("eggaim"))
    elseif logictype.CurrentStage == 1 then
        return TDLFlightPad() and (has("bbomb") or canShootEggs("geggs"))
    else
        return (TDLFlightPad() and has("bbomb")) or (canShootEggs("geggs") and (has("eggaim") or longJump() or TDLFlightPad() or has("ttrain") or has("splitup")))
    end
end

function td_jiggy2() -- Need CCL access
    return has("ttorp") and has("dive")
end

function td_jiggy8()
    if logictype.CurrentStage <= 1 then
        return can_reach_stomping_plains() and has("ttrot")
    else
        return can_reach_stomping_plains() and (has("tjump") or has("ttrot"))
    end
end

function jiggy_terry_nest()
    if logictype.CurrentStage == 0 then
        return can_beat_terry() and (has_explosives() or billDrill())
    else
        return (has_explosives() or billDrill()) and can_beat_terry()
    end
end

function scrut()
    if logictype.CurrentStage == 0 then
        return can_beat_king_coal() and has("trainswtd") and has("trainswww") and canShootEggs("geggs") and has("eggaim")
    else
        return can_beat_king_coal() and has("trainswtd") and has("trainswww") and canShootEggs("geggs")
    end
end

function scrat()
    if logictype.CurrentStage == 0 then
        return can_beat_king_coal() and has("trainswih") and has("trainswtd") and taxi_pack() and has("mumboih") and (has("tjump") or has("ttrot"))
    else
        return can_beat_king_coal() and has("trainswih") and has("trainswtd") and taxi_pack() and has("mumboih")
    end
end

function scrit()
    if logictype.CurrentStage == 0 then
        return mumboTDL() and billDrill() and has("tjump")
    else
        return mumboTDL() and billDrill()
    end
end

function can_reach_stomping_plains()
    if logictype.CurrentStage == 0 then
        return canShootEggs("ieggs") and tdl_top() and longJump()
    elseif logictype.CurrentStage == 1 then
        return tdl_top() and (wing_whack() or glide() or canShootEggs("ieggs") and longJump())
    elseif logictype.CurrentStage == 2 then
        return tdl_top() and (longJump() or has("ttrot") or has("splitup"))
    else
        return tdl_top() and (longJump() or has("ttrot"))
    end
end

function glowbo_tdl()
    if logictype.CurrentStage == 0 then
        return canDoSmallElevation() or TDLFlightPad()
    elseif logictype.CurrentStage == 1 then
        return canDoSmallElevation() or TDLFlightPad() or humbaTDL() or has("springb") or has("ttrain") or has("bbust")
    else
        return canDoSmallElevation() or TDLFlightPad() or humbaTDL() or has("springb") or has("ttrain") or clockwork_shot() or has("bbust")
    end
end

function jinjo_stomping_plains()
    if logictype.CurrentStage <= 2 then
        return can_reach_stomping_plains() and has("splitup") and has("tjump")
    else
        return can_reach_stomping_plains() and (has("splitup") and has("tjump") or egg_barge() and (has("tjump") or has("ttrot")))
    end
end

function jiggy_oogle_boogle()
    if logictype.CurrentStage == 0 then
        return oogle_boogles_open() and canShootEggs("feggs") and smuggle_food() and has("ggrab") and billDrill() and springPad()
    elseif logictype.CurrentStage <= 2 then
        return oogle_boogles_open() and has_fire() and smuggle_food() and has("ggrab") and billDrill() and springPad()
    else
        return (oogle_boogles_open() or clockworkWarp()) and has_fire() and has("ggrab") and billDrill() and smuggle_food() and springPad()
    end
end

-- Grunty Industries

function solo_kazooie_gi()
    if Tracker:FindObjectForCode("@Grunty Industries 1st Floor").AccessibilityLevel == 6 and has("splitup") then
        return true
    elseif Tracker:FindObjectForCode("@Grunty Industries 2nd Floor").AccessibilityLevel == 6 and (has("splitup") and floor_2_split_up()) then
        return true
    elseif Tracker:FindObjectForCode("@Grunty Industries 3rd Floor").AccessibilityLevel == 6 and (has("splitup") and canDoSmallElevation() and (has("tjump") or leg_spring())) then
        return true
    elseif Tracker:FindObjectForCode("@Grunty Industries 4th Floor").AccessibilityLevel == 6 and (has("splitup") and canDoSmallElevation()) then
        return true
    else
        return false
    end
end

function notes_gi_train_station_hard()
    if logictype.CurrentStage == 0 then
        return canDoSmallElevation() or leg_spring()
    elseif logictype.CurrentStage == 1 then
        return canDoSmallElevation() or leg_spring() or has("bbust")
    else
        return true
    end
end

function notes_gi_train_station_easy()
    if logictype.CurrentStage == 0 then
        return canDoSmallElevation() or leg_spring() or has("ggrab")
    elseif logictype.CurrentStage == 1 then
        return canDoSmallElevation() or leg_spring() or has("bbust") or has("ggrab")
    else
        return true
    end
end

function notes_floor_3()
    if logictype.CurrentStage <= 1 then
        return ((has("ggrab") and has("fflip") or has("splitup")) and springPad() and has("climb")) or (has("climb") and veryLongJump()) or canDoSmallElevation() and leg_spring()
    else
        return ((has("ggrab") and has("fflip") or has("splitup")) and springPad() and has("climb")) or (has("climb") and veryLongJump()) or clockwork_shot() or canDoSmallElevation() and leg_spring()
    end
end

function jiggy_guarded()
    if logictype.CurrentStage == 0 then
        return has("splitup") and has("clawbts") and has("eggaim") and (canShootEggs("begg") or canShootEggs("feggs") or canShootEggs("geggs")) and (springPad() or wing_whack() or glide())
    elseif logictype.CurrentStage == 1 then
        if Tracker:FindObjectForCode("@Grunty Industries 2nd Floor").AccessibilityLevel == 6 then
            return has("splitup") and (springPad() or has("clawbts") and (wing_whack() or glide()) and (has("eggaim") or wing_whack())) and (canShootEggs("begg") or canShootEggs("feggs") or canShootEggs("geggs"))
        else
            return has("splitup") and (has("clawbts") and springPad() or has("clawbts") and (wing_whack() or glide()) and (has("eggaim") or wing_whack())) and (canShootEggs("begg") or canShootEggs("feggs") or canShootEggs("geggs"))
        end
    else
        if Tracker:FindObjectForCode("@Grunty Industries 2nd Floor").AccessibilityLevel == 6 then
            return has("splitup") and (springPad() or has("clawbts") and (wing_whack() or glide()) and (has("eggaim") or wing_whack())) and (canShootEggs("begg") or canShootEggs("feggs") or canShootEggs("geggs")) or has("clawbts") and (springPad() or leg_spring()) and clockwork_shot()
        else
            return has("splitup") and (has("clawbts") and springPad() or has("clawbts") and (wing_whack() or glide()) and (has("eggaim") or wing_whack())) and (canShootEggs("begg") or canShootEggs("feggs") or canShootEggs("geggs")) or has("clawbts") and (springPad() or leg_spring()) and clockwork_shot()
        end
    end
end

function treble_gi()
    if logictype.CurrentStage == 0 then
        if Tracker:FindObjectForCode("@Grunty Industries 1st Floor").AccessibilityLevel == 6 and (has("splitup") and has("clawbts")) then
            return true
        elseif Tracker:FindObjectForCode("@Grunty Industries Roof").AccessibilityLevel == 6 then
            return true
        else
            return false
        end
    elseif logictype.CurrentStage == 1 then
        if Tracker:FindObjectForCode("@Grunty Industries 1st Floor").AccessibilityLevel == 6 and (has("splitup") and has("clawbts") or leg_spring() and glide() and (wing_whack() or has("eggaim"))) then
            return true
        elseif Tracker:FindObjectForCode("@Grunty Industries Roof").AccessibilityLevel == 6 then
            return true
        else
            return false
        end
    else
        if Tracker:FindObjectForCode("@Grunty Industries 1st Floor").AccessibilityLevel == 6 and (has("splitup") and has("clawbts") or leg_spring() and glide() and (wing_whack() or has("eggaim"))) then
            return true
        elseif Tracker:FindObjectForCode("@Grunty Industries Roof").AccessibilityLevel == 6 then
            return true
        else
            return clockwork_shot()
        end
    end
end

function nest_gi_outside_right()
    local access = false
    if logictype.CurrentStage == 0 then
        if Tracker:FindObjectForCode("@Outside Grunty Industries").AccessibilityLevel == 6 and outside_gi_to_outside_back() then
            return true
        elseif Tracker:FindObjectForCode("@Outside Grunty Industries - Behind the building").AccessibilityLevel == 6 and has("climb") then
            return true
        else
            return false
        end
    elseif logictype.CurrentStage == 1 then
        if Tracker:FindObjectForCode("@Outside Grunty Industries").AccessibilityLevel == 6 and outside_gi_to_outside_back() then
            return true
        elseif Tracker:FindObjectForCode("@Outside Grunty Industries - Behind the building").AccessibilityLevel == 6 and has("climb") then
            return true
        elseif Tracker:FindObjectForCode("@Grunty Industries 1st Floor").AccessibilityLevel == 6 and (has("splitup") and has("tjump") or leg_spring()) then
            return true
        elseif Tracker:FindObjectForCode("@Grunty Industries 2nd Floor").AccessibilityLevel == 6 and (floor_2_split_up() and (has("tjump") or leg_spring())) then
            return true
        elseif Tracker:FindObjectForCode("@Grunty Industries Roof").AccessibilityLevel == 6 then
            return true
        else
            return false
        end
    else
        if Tracker:FindObjectForCode("@Outside Grunty Industries").AccessibilityLevel == 6 and outside_gi_to_outside_back() then
            return true
        elseif Tracker:FindObjectForCode("@Outside Grunty Industries - Behind the building").AccessibilityLevel == 6 and has("climb") then
            return true
        elseif Tracker:FindObjectForCode("@Grunty Industries 1st Floor").AccessibilityLevel == 6 and (has("splitup") and has("tjump") or leg_spring()) then
            return true
        elseif Tracker:FindObjectForCode("@Grunty Industries 2nd Floor").AccessibilityLevel == 6 and (floor_2_split_up() and (has("tjump") or leg_spring())) then
            return true
        elseif Tracker:FindObjectForCode("@Grunty Industries Roof").AccessibilityLevel == 6 then
            return true
        else
            return clockwork_shot()
        end
    end
end

function nest_gi_outside_left()
    if logictype.CurrentStage == 0 and has("climb") then
        return true
    elseif logictype.CurrentStage == 1 then
        if Tracker:FindObjectForCode("@Grunty Industries 1st Floor").AccessibilityLevel == 6 and (has("splitup") and has("tjump") or leg_spring()) then
            return true
        elseif Tracker:FindObjectForCode("@Grunty Industries 2nd Floor").AccessibilityLevel == 6 and (floor_2_split_up() and (has("tjump") or leg_spring())) then
            return true
        elseif Tracker:FindObjectForCode("@Grunty Industries Roof").AccessibilityLevel == 6 then
            return true
        else
            return false
        end
    else
        if Tracker:FindObjectForCode("@Grunty Industries 1st Floor").AccessibilityLevel == 6 and (has("splitup") and has("tjump") or leg_spring()) then
            return true
        elseif Tracker:FindObjectForCode("@Grunty Industries 2nd Floor").AccessibilityLevel == 6 and (floor_2_split_up() and (has("tjump") or leg_spring())) then
            return true
        elseif Tracker:FindObjectForCode("@Grunty Industries Roof").AccessibilityLevel == 6 then
            return true
        else
            return clockwork_shot()
        end
    end
end

function jinjo_gi_outside()
    if logictype.CurrentStage == 0 then
        if Tracker:FindObjectForCode("@Grunty Industries 2nd Floor").AccessibilityLevel == 6 then
            return floor_2_split_up() and pack_whack() and (wing_whack() or canShootEggs()) and has("clawbts")
        else
            return false
        end
    elseif logictype.CurrentStage <= 2 then
        if Tracker:FindObjectForCode("@Grunty Industries 2nd Floor").AccessibilityLevel == 6 and (floor_2_split_up() and pack_whack() and wing_whack() and has("clawbts")) then
            return true
        elseif Tracker:FindObjectForCode("@Grunty Industries Roof").AccessibilityLevel == 6 and (solo_kazooie_gi() and (wing_whack() or canShootEggs())) then
            return true
        else
            return false
        end
    else
        if Tracker:FindObjectForCode("@Grunty Industries 2nd Floor").AccessibilityLevel == 6 and (floor_2_split_up() and pack_whack() and wing_whack() and has("clawbts")) then
            return true
        elseif Tracker:FindObjectForCode("@Grunty Industries Roof").AccessibilityLevel == 6 and ((solo_kazooie_gi() and (wing_whack() or canShootEggs())) or taxi_pack() or egg_barge()) then
            return true
        elseif Tracker:FindObjectForCode("@Outside Grunty Industries - Behind the building").AccessibilityLevel == 6 and (has("clawbts") and egg_barge()) then
            return true
        else
            return false
        end
    end
end

function nest_elevator_shaft_floor2()
    if logictype.CurrentStage == 0 then
        if Tracker:FindObjectForCode("@Grunty Industries 2nd Floor - Electromagnetic Chamber").AccessibilityLevel == 6 and floor_2_em_room_to_elevator_shaft() then
            return true
        else
            return has("climb")
        end
    elseif logictype.CurrentStage == 1 then
        if Tracker:FindObjectForCode("@Grunty Industries 2nd Floor - Electromagnetic Chamber").AccessibilityLevel == 6 and floor_2_em_room_to_elevator_shaft() then
            return true
        elseif Tracker:FindObjectForCode("@Grunty Industries 3rd Floor - Boiler Plant").AccessibilityLevel == 6 and (boiler_plant_to_elevator_shaft() and has("bbust")) then
            return true
        elseif Tracker:FindObjectForCode("@Grunty Industries 4th Floor - Past the Crushers").AccessibilityLevel == 6 and (floor_4_back_to_elevator_shaft() and has("bbust")) then
            return true
        else
            return has("climb")
        end
    else
        if Tracker:FindObjectForCode("@Grunty Industries 2nd Floor - Electromagnetic Chamber").AccessibilityLevel == 6 and floor_2_em_room_to_elevator_shaft() then
            return true
        elseif Tracker:FindObjectForCode("@Grunty Industries 3rd Floor - Boiler Plant").AccessibilityLevel == 6 and boiler_plant_to_elevator_shaft() then
            return true
        elseif Tracker:FindObjectForCode("@Grunty Industries 4th Floor - Past the Crushers").AccessibilityLevel == 6 and ((health_7() or has("bbust")) and floor_4_back_to_elevator_shaft()) then
            return true
        else
            return has("climb")
        end
    end
end

function nest_elevator_shaft_floor3()
    if logictype.CurrentStage == 0 then
        if Tracker:FindObjectForCode("@Grunty Industries 3rd Floor - Boiler Plant").AccessibilityLevel == 6 and boiler_plant_to_elevator_shaft() then
            return true
        else
            return has("climb")
        end
    elseif logictype.CurrentStage == 1 then
        if Tracker:FindObjectForCode("@Grunty Industries 3rd Floor - Boiler Plant").AccessibilityLevel == 6 and boiler_plant_to_elevator_shaft() then
            return true
        elseif Tracker:FindObjectForCode("@Grunty Industries 4th Floor - Past the Crushers").AccessibilityLevel == 6 and (floor_4_back_to_elevator_shaft() and has("bbust")) then
            return true
        else
            return has("climb")
        end
    else
        if Tracker:FindObjectForCode("@Grunty Industries 3rd Floor - Boiler Plant").AccessibilityLevel == 6 and boiler_plant_to_elevator_shaft() then
            return true
        elseif Tracker:FindObjectForCode("@Grunty Industries 4th Floor - Past the Crushers").AccessibilityLevel == 6 and floor_4_back_to_elevator_shaft() then
            return true
        else
            return has("climb")
        end
    end
end

function nest_elevator_shaft_floor4()
    if Tracker:FindObjectForCode("@Grunty Industries 4th Floor - Past the Crushers").AccessibilityLevel == 6 then
        return floor_4_back_to_elevator_shaft()
    else
        return has("climb")
    end
end

function jiggy_underwater_waste_disposal()
    if logictype.CurrentStage <= 2 then
        return can_beat_weldar() and shack_pack()
    else
        return (can_beat_weldar() and (shack_pack() or leg_spring())) or can_use_battery() and ((has("climb") and has("fflip") and has("ttorp") and has("dive") and has("wwing")) or (shack_pack() and has("climb") and has("ggrab")))
    end
end

function nest_gi_floor1_high_pipe()
    if logictype.CurrentStage == 0 then
        return has("splitup") and has("clawbts") and (leg_spring() or has("tjump"))
    elseif logictype.CurrentStage == 1 then
        if Tracker:FindObjectForCode("@Grunty Industries 2nd Floor").AccessibilityLevel == 6 then
            return (springPad() and F2_to_F1() or leg_spring()) or has("clawbts") and (wing_whack() or glide()) and (has("eggaim") or wing_whack())
        else
            return has("clawbts") and (springPad() and F2_to_F1() or leg_spring()) or has("clawbts") and (wing_whack() or glide()) and (has("eggaim") or wing_whack())
        end
    else
        if Tracker:FindObjectForCode("@Grunty Industries 2nd Floor").AccessibilityLevel == 6 then
            return ((springPad() or clockwork_shot()) and F2_to_F1() or leg_spring()) or has("clawbts") and (wing_whack() or glide()) and (has("eggaim") or wing_whack())
        else
            return has("clawbts") and ((springPad() or clockwork_shot()) and F2_to_F1() or leg_spring()) or has("clawbts") and (wing_whack() or glide()) and (has("eggaim") or wing_whack())
        end
    end
end

function cheato_window()
    if logictype.CurrentStage == 0 then
        if Tracker:FindObjectForCode("@Grunty Industries Roof").AccessibilityLevel == 6 then
            return has("eggaim") or has("aireaim") or has("bbomb")
        else
            return false
        end
    elseif logictype.CurrentStage == 1 then
        if Tracker:FindObjectForCode("@Grunty Industries Roof").AccessibilityLevel == 6 and (has("eggaim") or has("aireaim") or has("bbomb")) then
            return true
        elseif Tracker:FindObjectForCode("@Grunty Industries 1st Floor").AccessibilityLevel == 6 and (leg_spring() and has("clawbts") and has("wwhack")) then
            return true
        else
            return false
        end
    elseif logictype.CurrentStage == 2 then
        if Tracker:FindObjectForCode("@Grunty Industries Roof").AccessibilityLevel == 6 and (has("eggaim") or has("aireaim") or has("bbomb")) then
            return true
        elseif Tracker:FindObjectForCode("@Grunty Industries 1st Floor").AccessibilityLevel == 6 and (leg_spring() and has("clawbts") and has("wwhack")) then
            return true
        else
            return clockwork_shot()
        end
    else
        if Tracker:FindObjectForCode("@Grunty Industries Roof").AccessibilityLevel == 6 and (has("eggaim") or has("aireaim") or has("bbomb")) then
            return true
        elseif Tracker:FindObjectForCode("@Grunty Industries 1st Floor").AccessibilityLevel == 6 and (leg_spring() and has("clawbts") and has("wwhack")) then
            return true
        elseif Tracker:FindObjectForCode("@Grunty Industries 2nd Floor").AccessibilityLevel == 6 and (clockwork_shot() and solo_kazooie_gi()) then
            return true
        else
            return clockwork_shot()
        end
    end
end

function jiggy_skivvy()
    if Tracker:FindObjectForCode("@Grunty Industries Roof").AccessibilityLevel == 6 then
        return humbaGI() and billDrill() and (has("aireaim") or has("bbomb")) and floor_2_skivvy_switch()
    else
        return false
    end
end

function floor_2_skivvy_switch()
    if logictype.CurrentStage == 0 then
        if Tracker:FindObjectForCode("@Grunty Industries 2nd Floor").AccessibilityLevel == 6 then
            return has("clawbts") and has("fflip") and has("ggrab")
        else
            return false
        end
    else
        if Tracker:FindObjectForCode("@Grunty Industries 2nd Floor").AccessibilityLevel == 6 and (has("clawbts") and ((has("fflip") and has("ggrab")) or has("ttrot") and (has("flutter") or has("arat"))) or solo_kazooie_gi() and (leg_spring() or has("clawbts") and (canShootEggs() or wing_whack()))) then
            return true
        elseif Tracker:FindObjectForCode("@Grunty Industries 3rd Floor").AccessibilityLevel == 6 and (has("climb") and (veryLongJump() or (has("fflip") or has("tjump")) and has("ggrab")) or canDoSmallElevation() and has("splitup") and leg_spring()) then
            return true
        else
            return false
        end
    end
end

function nest_funny_platform()
    if logictype.CurrentStage == 0 then
        if Tracker:FindObjectForCode("@Grunty Industries 2nd Floor").AccessibilityLevel == 6 then
            return has("clawbts") and has("fflip") and has("ggrab")
        else
            return false
        end
    elseif logictype.CurrentStage == 1 then
        if Tracker:FindObjectForCode("@Grunty Industries 2nd Floor").AccessibilityLevel == 6 and (has("clawbts") and has("fflip") and has("ggrab") or solo_kazooie_gi() and (leg_spring() or has("clawbts") and (canShootEggs() or wing_whack())) and glide()) then
            return true
        elseif Tracker:FindObjectForCode("@Grunty Industries 3rd Floor").AccessibilityLevel == 6 and (has("climb") and (veryLongJump() or (has("fflip") or has("tjump"))) and has("ggrab") or canDoSmallElevation() and has("splitup") and leg_spring() and glide()) then
            return true
        else
            return false
        end
    else
        if Tracker:FindObjectForCode("@Grunty Industries 2nd Floor").AccessibilityLevel == 6 and (has("clawbts") and ((has("fflip") and has("ggrab")) or has("ttrot") and (has("flutter") or has("arat"))) or solo_kazooie_gi() and (leg_spring() or has("clawbts") and (canShootEggs() or wing_whack()))) then
            return true
        elseif Tracker:FindObjectForCode("@Grunty Industries 3rd Floor").AccessibilityLevel == 6 and (has("climb") and (veryLongJump() or (has("fflip") or has("tjump"))) and has("ggrab") or canDoSmallElevation() and has("splitup") and leg_spring() and glide()) then
            return true
        else
            return clockwork_shot()
        end
    end
end

function jinjo_boiler()
    if logictype.CurrentStage == 0 then
        if Tracker:FindObjectForCode("@Grunty Industries Roof").AccessibilityLevel == 6 then
            return floor_5_to_boiler_plant()
        else
            return false
        end
    elseif logictype.CurrentStage == 1 then
        if Tracker:FindObjectForCode("@Grunty Industries Roof").AccessibilityLevel == 6 and floor_5_to_boiler_plant() then
            return true
        elseif Tracker:FindObjectForCode("@Grunty Industries 3rd Floor").AccessibilityLevel == 6 and (canDoSmallElevation() and leg_spring() and glide()) then
            return true
        else
            return false
        end
    else
        if Tracker:FindObjectForCode("@Grunty Industries Roof").AccessibilityLevel == 6 and floor_5_to_boiler_plant() then
            return true
        elseif Tracker:FindObjectForCode("@Grunty Industries 3rd Floor").AccessibilityLevel == 6 and (canDoSmallElevation() and leg_spring() and glide()) then
            return true
        else
            return clockwork_shot()
        end
    end
end

function jiggy_twinkly()
    if logictype.CurrentStage == 0 then
        return can_use_battery() and has("ggrab") and has("ttrain") or can_use_battery() and elevator_door()
    else
        if Tracker:FindObjectForCode("@Grunty Industries Roof").AccessibilityLevel == 6 then
            return can_use_battery() and (has("tjump") or has("ggrab")) and (leg_spring() or (glide() or wing_whack()) and has("tjump") or floor_5_to_boiler_plant() or has("ttrain"))
        else
            return can_use_battery() and (has("tjump") or has("ggrab")) and (leg_spring() or (glide() or wing_whack()) and has("tjump") or has("ttrain"))
        end
    end
end

function jiggy_trash_compactor()
    if logictype.CurrentStage == 0 then
        return snooze_pack()
    elseif logictype.CurrentStage <= 2 then
        return snooze_pack() or pack_whack() and has("tjump")
    else
        return snooze_pack() or pack_whack() and has("tjump") or (has("eggaim") and has("ceggs") and breegullBash() and has("ttrot"))
    end
end

-- Hailfire Peaks

function hp_jiggy1()
    if logictype.CurrentStage == 0 then
        return canShootEggs("feggs") and canShootEggs("ieggs") and has("clawbts") and has("fpad") and has("eggshoot") and (has("tjump") or has("ttrot")) and has("climb")
    elseif logictype.CurrentStage == 1 then
        return canShootEggs("feggs") and canShootEggs("ieggs") and has("clawbts") and has("fpad") and has("eggshoot") and (has("tjump") or has("ttrot")) and (has("climb") or has("fflip") or has("tjump") and has("ggrab") or has("ttrot") and has("ggrab"))
    else
        return canShootEggs("feggs") and canShootEggs("ieggs") and has("clawbts") and has("fpad") and has("eggshoot") and pack_whack() and (has("clawbts") or ((has("tjump") and has("roll") or has("ttrot")) and (has("flutter") or has("arat")) and has("ggrab"))) and (has("tjump") or has("ttrot")) and (has("climb") or has("fflip") or has("tjump") and has("ggrab") or has("ttrot") and has("ggrab"))
    end
end

function jiggy_hfp_stomping()
    if logictype.CurrentStage <= 1 then
        return can_reach_stomping_plains() and snooze_pack() and has("tjump")
    elseif logictype.CurrentStage == 2 then
        return can_reach_stomping_plains() and has("tjump") and has("splitup")
    else
        return can_reach_stomping_plains() and has("tjump") and has("splitup") -- additional regional stuff
    end
end

function notes_ladder()
    if logictype.CurrentStage <= 1 then
        return hfpTop() or has("splitup")
    else
        return hfpTop()
    end
end

function cheato_icicle_grotto()
    if logictype.CurrentStage == 0 then
        return has("climb") and (canShootEggs("ceggs") or shack_pack())
    elseif logictype.CurrentStage <= 2 then
        return has("climb") and shack_pack() or ((leg_spring() or has("climb")) and canShootEggs("ceggs"))
    else
        return hfpTop() and (has("climb") and shack_pack() or ((leg_spring() or has("climb")) and canShootEggs("ceggs"))) or ((has("ttrot") or has("splitup")) and clockwork_shot())
    end
end

function cheato_colosseum()
    if logictype.CurrentStage == 0 then
        return has("clawbts") and (has_explosives() or dragon_kazooie())
    elseif logictype.CurrentStage <= 2 then
        return has("clawbts") and (has_explosives() or has("mumbohp") or dragon_kazooie())
    else
        return (has("clawbts") and (has_explosives() or has("mumbohp") or dragon_kazooie())) or hfpTop() and has("eggshoot")
    end
end

function honeycomb_volcano()
    if logictype.CurrentStage == 0 then
        return hfpTop() and has("geggs") and has("eggaim") and springPad() and (has("ttrot") or has("splitup"))
    elseif logictype.CurrentStage == 1 then
        return has("splitup") and (has("tjump") or wing_whack() or glide() or leg_spring()) or hfpTop() and has("geggs") and has("eggaim") and springPad() and has("ttrot")
    else
        return has("splitup") and (has("tjump") or wing_whack() or glide() or leg_spring()) or hfpTop() and has("geggs") and has("eggaim") and springPad() and has("ttrot") or extremelyLongJump() or hfpTop() and clockwork_shot()
    end
end

function jinjo_mildred()
    if logictype.CurrentStage == 0 then
        return hfpTop() and (canShootEggs("feggs") or has_explosives() or billDrill() or dragon_kazooie())
    elseif logictype.CurrentStage == 1 then
        return hfpTop() and ((canDoSmallElevation() or has("bbust")) and (canShootEggs("feggs") or has_explosives() or billDrill() or dragon_kazooie()) or (has("mumbohp") and has("tjump")) or has("splitup") and (has("tjump") and leg_spring()) and (canShootEggs("feggs") or has_explosives()))
    else
        return hfpTop() and ((canDoSmallElevation() or has("bbust")) and (canShootEggs("feggs") or has_explosives() or billDrill() or dragon_kazooie()) or (has("mumbohp") and has("tjump")) or has("splitup") and (has("tjump") and leg_spring()) and (canShootEggs("feggs") or has_explosives()) or clockwork_shot())
    end
end

function jiggy_sabreman()
    return has("mumbohp") and canShootEggs("feggs") and taxi_pack() and has("tjump") and hfpTop()
end

function jiggy_oil_drill()
    if logictype.CurrentStage == 0 then
        return humbaHFP() and shack_pack() and has("ggrab")
    elseif logictype.CurrentStage <= 2 then
        return humbaHFP() and shack_pack() and (pack_whack() and has("tjump") or has("ggrab"))
    else
        return humbaHFP() and shack_pack() and (pack_whack() or has("ggrab"))
    end
end

function notes_lower_icy_side()
    if logictype.CurrentStage == 0 then
        return iceCube() and hfpTop()
    else
        return hfpTop() and (iceCube() or has("splitup") and iceCubeKazooie() or has("mumbohp") or pack_whack() or humbaHFP())
    end
end

function notes_boggy()
    if logictype.CurrentStage == 0 then
        return iceCube() and hfpTop() and canDoSmallElevation()
    elseif logictype.CurrentStage == 1 then
        return hfpTop() and (iceCube() and (canDoSmallElevation() or has("bbust")) or has("splitup") and (leg_spring() or has("tjump")) and iceCubeKazooie() or has("tjump") and has("mumbohp") or pack_whack() or humbaHFP())
    else
        return hfpTop() and (iceCube() and (canDoSmallElevation() or has("bbust")) or has("splitup") and (leg_spring() or has("tjump")) and iceCubeKazooie() or has("tjump") and has("mumbohp") or pack_whack() or clockwork_shot() or humbaHFP())
    end
end

function notes_oil_drill()
    if logictype.CurrentStage == 0 then
        return hfpTop() and (has("fflip") or has("ttrot")) and iceCube() or hfpTop() and has("splitup") and has("ggrab") and pack_whack() or hfpTop() and has("splitup") and iceCubeKazooie()
    elseif logictype.CurrentStage == 1 then
        return hfpTop() and (has("fflip") or has("ttrot") or has("fpad")) and iceCube() or hfpTop() and has("splitup") and (has("ggrab") or has("tjump")) and pack_whack() or hfpTop() and has("splitup") and iceCubeKazooie() or humbaHFP()
    else
        return hfpTop() and (has("fflip") or has("ttrot") or has("fpad")) and iceCube() or hfpTop() and has("splitup") and (has("ggrab") or has("tjump")) and pack_whack() or hfpTop() and has("splitup") and iceCubeKazooie() or humbaHFP() or hfpTop() and clockwork_shot()
    end
end

function notes_upper_icy_side()
    if logictype.CurrentStage == 0 then
        return iceCube() and hfpTop()
    else
        return hfpTop() and (iceCube() or has("splitup") and iceCubeKazooie() or has("mumbohp") or pack_whack() or humbaHFP())
    end
end

function treble_hfp()
    if logictype.CurrentStage == 0 then
        return hfpTop() and has("geggs") and has("eggaim") and springPad() and (has("ttrot") or has("splitup"))
    elseif logictype.CurrentStage == 1 then
        return (has("splitup") and iceCubeKazooie() and (has("tjump") or wing_whack() or glide() or leg_spring())) or (hfpTop() and has("geggs") and has("eggaim") and springPad() and veryLongJump())
    else
        return (has("splitup") and iceCubeKazooie() and (has("tjump") or wing_whack() or glide() or leg_spring())) or (hfpTop() and (has("geggs") and veryLongJump() or clockwork_shot()) and has("eggaim") and springPad()) or (extremelyLongJump() and clockwork_shot())
    end
end

function nest_hfp_spring_pad()
    if logictype.CurrentStage == 0 then
        return hfpTop() and springPad() and has("ttrot") and iceCube() or hfpTop() and springPad() and has("splitup") and iceCubeKazooie()
    elseif logictype.CurrentStage == 1 then
        return (has("splitup") and iceCubeKazooie() and (has("tjump") or wing_whack() or glide() or leg_spring())) or (hfpTop() and springPad() and has("ttrot") and iceCube())
    else
        return (has("splitup") and iceCubeKazooie() and (has("tjump") or wing_whack() or glide() or leg_spring())) or (hfpTop() and (springPad() and iceCube() or clockwork_shot()) and has("ttrot")) or (extremelyLongJump() and clockwork_shot())
    end
end

function jiggy_ice_station()
    if logictype.CurrentStage <= 1 and Tracker:FindObjectForCode("@Witchyworld - Main Area").AccessibilityLevel == 6 then
        return can_beat_king_coal() and canShootEggs("geggs") and has("trainswhp1") and has("trainswhp2") and has("eggaim") and has("fpad") and has("climb") and has("bbust")
    elseif Tracker:FindObjectForCode("@Witchyworld - Main Area").AccessibilityLevel == 6 then
        return can_beat_king_coal() and canShootEggs("geggs") and has("trainswhp1") and has("trainswhp2") and has("fpad") and has("climb") and has("bbust")
    else
        return clockwork_shot() and canDoSmallElevation()
    end
end

function nest_icy_side_train_station_hard()
    if logictype.CurrentStage == 0 and Tracker:FindObjectForCode("@Witchyworld - Main Area").AccessibilityLevel == 6 then
        return can_beat_king_coal() and canShootEggs("geggs") and has("trainswhp1") and has("trainswhp2") and has("eggaim") and has("fpad") and has("dive")
    elseif Tracker:FindObjectForCode("@Witchyworld - Main Area").AccessibilityLevel == 6 then
        return can_beat_king_coal() and canShootEggs("geggs") and has("trainswhp1") and has("trainswhp2") and has("fpad") and (has("bbust") or has("dive"))
    else
        return false
    end
end

-- Cloud Cuckooland

function cc_jinjo3()
    if logictype.CurrentStage == 0 then
        return has("splitup") and springPad() or has("humbacc")
    elseif logictype.CurrentStage == 1 then
        return has("splitup") and (springPad() or has("fpad")) or has("springb") and billDrill() and (has("flutter") or has("arat") or has("splitup")) or leg_spring() or has("humbacc")
    else
        return has("splitup") and (springPad() or has("fpad")) or clockwork_shot() or has("springb") and (has("flutter") or has("arat") or has("splitup")) or leg_spring() or has("humbacc")
    end
end

function cc_jiggy2()
    if logictype.CurrentStage == 0 then
        return has("springb") and sack_pack() and grow_beanstalk() and can_use_floatus() and has("climb") and has("ttrain")
    elseif logictype.CurrentStage == 1 then
        return (has("springb") or has("fpad")) and sack_pack() and grow_beanstalk() and can_use_floatus() and has("climb") and (has("ttrain") or has("humbacc"))
    elseif logictype.CurrentStage == 2 then
        return (has("springb") or has("fpad") or clockwork_shot()) and sack_pack() and grow_beanstalk() and (can_use_floatus() or pack_whack()) and has("climb") and (has("ttrain") or has("humbacc"))
    else
        return (has("springb") or has("fpad") or clockwork_shot()) and sack_pack() and grow_beanstalk() and (can_use_floatus() or pack_whack()) and has("climb") and (has("ttrain") or has("humbacc") or canShootEggs("ceggs"))
    end
end

function cc_jiggy3()
    if logictype.CurrentStage == 0 then
        return (
            canShootEggs("begg") and canShootEggs("feggs") and canShootEggs("geggs") and canShootEggs("ieggs") and mumboCCL() and (has("fflip") or leg_spring())
        )
    elseif logictype.CurrentStage == 1 then
        return (
            canShootEggs("begg") and canShootEggs("feggs") and canShootEggs("geggs") and canShootEggs("ieggs") and mumboCCL() and (has("fflip") or leg_spring() or has("fpad"))
        )
    else
        return (
            canShootEggs("begg") and canShootEggs("feggs") and canShootEggs("geggs") and canShootEggs("ieggs") and (mumboCCL() and (has("fflip") or leg_spring() or has("fpad")) or (leg_spring() or (has("splitup") and has("tjump"))) and (has("fpad") and has("bbomb") or glide()))
        )
    end
end

function jiggy_superstash()
    if logictype.CurrentStage == 0 then
        return canShootEggs("ceggs") and has("ggrab") and has("fpad") and has("fflip")
    elseif logictype.CurrentStage <= 2 then
        return canShootEggs("ceggs") and has("ggrab") and has("fpad") and has("fflip") and (has("ggrab") or veryLongJump() and has("climb"))
    else
        return canShootEggs("ceggs")
    end
end

function jiggy_cheese()
    if logictype.CurrentStage <= 2 then
        return sack_pack() and grow_beanstalk() and can_use_floatus() and shack_pack()
    else
        return sack_pack() and grow_beanstalk() and can_use_floatus() and shack_pack() or (has("ttrot") or clockworkWarp()) and has("fflip") and has("bbust") and has("fpad") or has("fpad") and (leg_spring() or (has("tjump") and wing_whack())) and clockworkWarp()
    end
end

-- Spiral Mountain Nests

function nest_lair_top()
    if logictype.CurrentStage == 0 then
        return canDoSmallElevation()
    elseif logictype.CurrentStage == 1 then
        return canDoSmallElevation() or has("ggrab") or has("bbust")
    else
        return canDoSmallElevation() or has("ggrab") or has("bbust") or has("arat") or has("flutter") or clockwork_shot()
    end
end

-- Mayahem Temple Nests

function nest_pillars()
    if logictype.CurrentStage == 0 then
        return has("dive") or has("fflip") and has("tjump") and prison_compound_open()
    else
        return (has("dive") or has("fflip") or has("bbust")) and prison_compound_open()
    end
end

function nest_mt_cell_right()
    if logictype.CurrentStage == 0 then
        return (canReachSlightlyElevatedLedge() or has("fflip")) and has("tjump") and prison_compound_open()
    elseif logictype.CurrentStage == 1 then
        return (canReachSlightlyElevatedLedge() or has("fflip")) and prison_compound_open()
    else
        return prison_compound_open() and (canReachSlightlyElevatedLedge() or has("fflip") or clockwork_shot())
    end
end

function nest_mt_cell_left()
    if logictype.CurrentStage == 0 then
        return (canReachSlightlyElevatedLedge() or has("fflip")) and has("tjump") and prison_compound_open()
    elseif logictype.CurrentStage == 1 then
        return (canReachSlightlyElevatedLedge() or has("fflip")) and prison_compound_open()
    else
        return prison_compound_open() and ((canReachSlightlyElevatedLedge() or has("fflip")) or clockwork_shot() and has("tjump"))
    end
end

-- Glitter Gulch Mine Nests

function nest_bill_drill()
    if logictype.CurrentStage == 0 then
        return canReachSlightlyElevatedLedge() and has("fflip")
    elseif logictype.CurrentStage == 1 then
        return ((has("ttrot") or has("springb") or has("ttrain")) and (has("flutter") or has("arat")) or has("tjump")) and has("ggrab") or has("fflip") or GM_boulders() and has("splitup")
    else
        return ((has("ttrot") or has("springb")) and (has("flutter") or has("arat")) or has("tjump")) and has("ggrab") or has("fflip") or has("ttrain") or clockwork_shot() or GM_boulders() and has("splitup")
    end
end

function nest_flooded_caves()
    if logictype.CurrentStage == 0 then
        return humbaGGM() and has("dive")
    else
        return has("dive") and (humbaGGM() or has("ttrot") and (has("flutter") or has("arat")) or has("roll") and has("tjump") and (has("flutter") or has("arat")))
    end
end

function nest_outside_power_hut()
    if logictype.CurrentStage == 0 then
        return GM_boulders() and canDoSmallElevation()
    elseif logictype.CurrentStage == 1 then
        return GM_boulders() and (canDoSmallElevation() or has("bbust") or has("ttrain") or has("splitup"))
    else
        return GM_boulders() and (canDoSmallElevation() or has("bbust") or has("ttrain") or has("splitup") or clockwork_shot())
    end
end

function nest_ggm_mumbo()
    if logictype.CurrentStage == 0 then
        return canDoSmallElevation()
    elseif logictype.CurrentStage == 1 then
        return canDoSmallElevation() or has("ggrab") or has("bbust")
    else
        return canDoSmallElevation() or has("ggrab") or clockwork_shot() or has("bbust")
    end
end

function nest_toxic_gas_cave()
    if logictype.CurrentStage <= 2 then
        return GM_boulders()
    else
        return GM_boulders() or has("grat") or has("bbarge") or egg_barge()
    end
end

function nest_canary_high()
    if logictype.CurrentStage <= 1 then
        return humbaGGM() and (canDoSmallElevation() or has("ggrab"))
    else
        return humbaGGM() and (canDoSmallElevation() or has("ggrab") or clockwork_shot())
    end
end

function nest_canary_low()
    return humbaGGM()
end

-- Witchyworld Nests

function nest_pump_room()
    if logictype.CurrentStage == 0 then
        return (has("fflip") or leg_spring() or has("splitup") and has("ggrab")) and has_explosives()
    elseif logictype.CurrentStage == 1 then
        return (has("fflip") or leg_spring() or has("splitup") and has("ggrab") or pack_whack() and has("tjump")) and has_explosives()
    else
        return (has("fflip") or leg_spring() or has("splitup") and has("ggrab") or pack_whack() and has("tjump") or clockwork_shot() and canDoSmallElevation()) and has_explosives()
    end
end

function nest_big_top()
    return has("geggs") and has("aireaim") and (has_explosives() or humbaWW())
end

-- Jolly Roger's Lagoon Nests

function nest_jolly_gunpowder()
    if logictype.CurrentStage == 0 then
        return has("dive") or canShootEggs("geggs")
    else
        return has("dive") or has_explosives()
    end
end

function nest_seaweed_bottom()
    if logictype.CurrentStage == 0 then
        return has("fflip")
    elseif logictype.CurrentStage == 1 then
        return has("fflip") or has_explosives() and pack_whack() and has("tjump")
    else
        return has("fflip") or has_explosives() and pack_whack() and has("tjump") or clockwork_shot()
    end
end

function nest_seaweed_others()
    if logictype.CurrentStage == 0 then
        return has("fflip") or (has("tjump") or has("ttrot") and has("flutter")) and has("ggrab")
    elseif logictype.CurrentStage == 1 then
        return has("fflip") or has_explosives() and pack_whack() and has("tjump")
    else
        return has("fflip") or has_explosives() and pack_whack() and has("tjump") or clockwork_shot()
    end
end

function nest_bacon()
    if logictype.CurrentStage <= 1 then
        return true
    else
        return (has("auqaim") and hasLinearEgg()) or has("humbajr")
    end
end

function nest_lord_woo()
    if logictype.CurrentStage <= 1 then
        return canShootEggs("geggs")
    else
        return has("geggs") and has("auqaim")
    end
end

-- Terrydactyland Nests

function nest_tdl_waterfall_alcove()
    if logictype.CurrentStage == 0 then
        return has("fflip") and has("ggrab")
    elseif logictype.CurrentStage == 1 then
        return has("fflip") and has("ggrab") or has("flutter") or has("arat") or has("splitup") or humbaTDL() and has("roar")
    elseif logictype.CurrentStage == 2 then
        return has("fflip") and has("ggrab") or has("flutter") or has("arat") or has("splitup") or humbaTDL() and has("roar") or clockwork_shot() or has("ttrot") or has("ttrain") or has("springb")
    else
        return has("fflip") and has("ggrab") or has("flutter") or has("arat") or has("splitup") or humbaTDL() and has("roar") or clockwork_shot() or has("ttrot") or has("ttrain") or has("springb") or tdl_top()
    end 
end

function nest_tdl_wall_with_holes()
    if logictype.CurrentStage == 0 then
        return has("ttrot") or has("tjump") and has("ggrab")
    elseif logictype.CurrentStage == 1 then
        return has("ttrot") or has("tjump") and has("ggrab") or humbaTDL() or (has("splitup") and (leg_spring() or glide() or pack_whack())) or has("springb") or has("ttrain")
    else
        return has("ttrot") or has("tjump") and has("ggrab") or humbaTDL() or (has("splitup") and (leg_spring() or glide() or pack_whack() or sack_pack())) or has("springb") or has("ttrain") or clockwork_shot()
    end
end

function nest_river_passage_entrance()
    if logictype.CurrentStage == 0 then
        return has("tjump") or has("ggrab")
    elseif logictype.CurrentStage == 1 then
        return has("tjump") or has("ggrab") or (has("splitup") and (pack_whack() or wing_whack() or glide()))
    else
        return has("tjump") or has("ggrab") or (has("splitup") and (pack_whack() or wing_whack() or glide())) or clockwork_shot()
    end
end

function nest_mountain_flight_pad()
    if logictype.CurrentStage == 0 then
        return has("tjump") or has("ggrab")
    elseif logictype.CurrentStage == 1 then
        return has("tjump") or has("ggrab") or has("bbust") or (leg_spring() and glide()) or tdl_top() and has("splitup")
    else
        return has("tjump") or has("ggrab") or has("bbust") or (leg_spring() and glide()) or tdl_top() and has("splitup") or clockwork_shot()
    end
end

function nest_river_passage()
    if logictype.CurrentStage == 0 then
        return has("tjump") and has("ggrab") and (has("fflip") or has("splitup"))
    elseif logictype.CurrentStage == 1 then
        return has("tjump") and has("ggrab") and (has("fflip") or has("splitup")) or (leg_spring() and glide()) or (pack_whack() and has("tjump")) or (pack_whack() and has("ggrab")) or sack_pack()
    else
        return has("tjump") and has("ggrab") and (has("fflip") or has("splitup")) or (leg_spring() and glide()) or (pack_whack() and has("tjump")) or (pack_whack() and has("ggrab")) or sack_pack() or clockwork_shot()
    end
end

function nest_stomping_plains_footprint()
    return has("tjump") and has("splitup") or snooze_pack() or has("ttrot")
end

-- Grunty Industries Nests

function nest_gi_outside_waste_disposal()
    if logictype.CurrentStage <= 1 then
        return canReachSlightlyElevatedLedge() or has("splitup") or has("fflip")
    else
        return canReachSlightlyElevatedLedge() or has("splitup") or clockwork_shot() or has("fflip")
    end
end

function nest_outside_trash_compactor()
    if logictype.CurrentStage == 0 then
        return snooze_pack()
    else
        return true
    end
end

function nest_gi_train_station_small_box()
    if logictype.CurrentStage == 0 then
        return canDoSmallElevation()
    else
        return true
    end
end

function nest_gi_train_station_medium_box()
    if logictype.CurrentStage == 0 then
        return canReachSlightlyElevatedLedge() or has("fflip") or leg_spring()
    elseif logictype.CurrentStage == 1 then
        return canReachSlightlyElevatedLedge() or has("fflip") or has("splitup") or has("flutter") or has("arat")
    else
        return canReachSlightlyElevatedLedge() or has("fflip") or has("splitup") or has("flutter") or has("arat") or clockwork_shot()
    end
end

function nest_trash_compactor()
    if logictype.CurrentStage == 0 then
        return snooze_pack()
    elseif logictype.CurrentStage == 1 then
        return snooze_pack() or has("splitup") and has("tjump") or wing_whack() or glide() or leg_spring() or has("fflip") or canShootEggs("ceggs")
    else
        return snooze_pack() or has("splitup") and has("tjump") or wing_whack() or glide() or leg_spring() or canShootEggs("ceggs") or has("fflip")
    end
end

function nest_floor3_boxes()
    if logictype.CurrentStage <= 1 then
        return canReachSlightlyElevatedLedge() or canDoSmallElevation() and leg_spring()
    else
        return canReachSlightlyElevatedLedge() or clockwork_shot() or canDoSmallElevation() and leg_spring()
    end
end

function nest_floor3_shortcut()
    if logictype.CurrentStage <= 1 then
        return canDoSmallElevation()
    else
        return canDoSmallElevation() or clockwork_shot()
    end
end

function nest_floor4_front()
    if logictype.CurrentStage <= 1 then
        return canDoSmallElevation()
    else
        return canDoSmallElevation() or clockwork_shot()
    end
end

function nest_outside_QC()
    if logictype.CurrentStage <= 1 then
        return has("climb")
    elseif logictype.CurrentStage == 2 then
        return has("climb") or pack_whack() and has("tjump") or has("splitup") and (leg_spring() or springPad())
    else
        return has("climb") or pack_whack() and has("tjump") or has("splitup") and (leg_spring() or springPad()) or clockworkWarp() and (springPad() or has("fflip"))
    end
end

function nest_quality_control()
    if logictype.CurrentStage <= 2 then
        return can_use_battery() and has("climb")
    else
        return can_use_battery() and has("climb") or clockworkWarp() and (springPad() or has("fflip"))
    end
end

function nest_floor5_small_stack()
    if logictype.CurrentStage <= 1 then
        return canDoSmallElevation() or has("splitup")
    else
        return canDoSmallElevation() or has("splitup") or clockwork_shot()
    end
end

function nest_outside_repair_depot()
    if logictype.CurrentStage == 0 then
        return has("fflip") and has("climb") and has("ggrab")
    elseif logictype.CurrentStage == 1 then
        return has("fflip") and has("climb") and (has("ggrab") or (has("tjump") and (has("flutter") or has("arat"))))
    else
        return has("fflip") and has("climb") and (has("ggrab") or (has("tjump") and (has("flutter") or has("arat")))) or leg_spring() and (glide() or wing_whack()) or clockwork_shot()
    end
end

function nest_egg_fan_easy()
    if logictype.CurrentStage == 0 then
        return (has("tjump") or has("flutter") or has("arat")) and has("climb")
    elseif logictype.CurrentStage == 1 then
        return has("climb")
    else
        return has("climb") or leg_spring() and (wing_whack() or glide())
    end
end

function nest_egg_fan_hard()
    if logictype.CurrentStage <= 1 then
        return can_beat_weldar()
    else
        return can_beat_weldar() or (has("climb") or leg_spring() and (wing_whack() or glide())) and clockwork_shot()
    end
end

function nest_waste_disposal_water_pump()
    if logictype.CurrentStage <= 1 then
        return jrl_waste_disposal() and has("fflip") and has("climb")
    else
        return jrl_waste_disposal() and has("climb") and (has("fflip") or has("tjump") and has("flutter") or extremelyLongJump() or has("tjump") and has("bbust") or has("ttrot") and has("flutter") and has("bbust"))
    end
end

-- Hailfire Peaks Nests

function nest_hfp_entrance_shelter()
    if logictype.CurrentStage == 0 then
        return has("fpad") or leg_spring()
    elseif logictype.CurrentStage == 1 then
        return has("fpad") or leg_spring() or glide() or has("tjump") and wing_whack() or has("fflip") and (has("ggrab") or has("bbust"))
    else
        return has("fpad") or leg_spring() or glide() or clockwork_shot() or has("tjump") and wing_whack() or has("fflip") and (has("ggrab") or has("bbust"))
    end
end

function nest_ice_cube()
    if logictype.CurrentStage == 0 then
        return iceCube() and hfpTop()
    else
        return hfpTop() and (iceCube() or has("splitup") and iceCubeKazooie() or has("mumbohp") or pack_whack() or (hfpTop() and has("humbahp")))
    end
end

function nest_chilly_willy()
    if logictype.CurrentStage <= 1 then
        return canShootEggs("feggs") and has("clawbts")
    else
        return has("clawbts") or (pack_whack() and has("tjump") and has("flutter") and (has("ttrot") or has("fflip")))
    end
end

function nest_hfp_kickball_feather()
    if logictype.CurrentStage <= 1 then
        return canDoSmallElevation()
    else
        return true
    end
end

-- Cloud Cuckooland Nests

function nest_jelly_castle()
    return (has("fpad") or has("humbacc")) or has("climb") and (canDoSmallElevation() or has("splitup"))
end

function nest_ccl_dippy()
    if logictype.CurrentStage == 0 then
        return (has("fpad") or has("humbacc")) or has("dive") and has("ttorp") and has("fflip")
    else
        return true
    end
end

function nest_outside_trash_can()
    if logictype.CurrentStage == 0 then
        return has("climb") and has("tjump") or (has("fpad") or has("humbacc"))
    elseif logictype.CurrentStage == 1 then
        return has("climb") and (has("tjump") or pack_whack()) or (has("fpad") or glide()) or (has("fpad") or has("humbacc"))
    else
        return has("climb") and (has("tjump") or pack_whack()) or (has("fpad") or glide() or ((has("tjump") or leg_spring()) and wing_whack())) or (has("fpad") or has("humbacc"))
    end
end

function nest_inside_trash_can()
    if logictype.CurrentStage == 0 then
        return has("fpad") and leg_spring()
    elseif logictype.CurrentStage == 1 then
        return has("climb") and has("splitup") and shack_pack() and pack_whack() or (has("fpad") or glide() or (leg_spring() and wing_whack())) and leg_spring()
    elseif logictype.CurrentStage == 2 then
        return has("climb") and has("splitup") and shack_pack() and (pack_whack() or has("tjump") and has("ggrab")) or (has("fpad") or (has("splitup") and (glide() or leg_spring() and wing_whack()))) and (has("splitup") and (leg_spring() or has("tjump") and glide()) or clockwork_shot())
    else
        return has("climb") and has("splitup") and shack_pack() and (pack_whack() or has("tjump") and has("ggrab")) or (has("fpad") or (has("splitup") and (glide() or leg_spring() and wing_whack()))) and (has("splitup") and (leg_spring() or has("tjump") and glide()) or clockwork_shot()) or has("fpad") and clockworkWarp() and has("climb")
    end
end

function nest_near_superstash()
    if logictype.CurrentStage == 0 then
        return has("ggrab") and has("fflip") or has("humbacc")
    elseif logictype.CurrentStage == 1 then
        return has("fflip") and has("ggrab") or veryLongJump() and (has("climb") or has("fpad")) or has("humbacc")
    else
        return has("fflip") and has("ggrab") or veryLongJump() and (has("climb") or has("fpad")) or clockwork_shot() or has("humbacc")
    end
end

function nest_pot_of_gold()
    if logictype.CurrentStage == 0 then
        return mumboCCL() and (has("fflip") or leg_spring())
    elseif logictype.CurrentStage == 1 then
        return mumboCCL() and (has("fflip") or leg_spring() or has("fpad"))
    else
        return (mumboCCL() and (has("fflip") or leg_spring() or has("fpad")) or (leg_spring() or (has("splitup") and has("tjump"))) and has("fpad") and has("bbomb"))
    end
end

-- Move Silos

function ieggs_count()
    return notecount(silo_ieggs)
end

function snpack_count()
    return notecount(silo_snpack)
end

function shpack_count()
    return notecount(silo_shpack)
end

function ceggs_count()
    return notecount(silo_ceggs)
end

function eggaim_count()
    return notecount(silo_eggaim)
end

function auqaim_count()
    return notecount(silo_auqaim)
end

function ttorp_count()
    return notecount(silo_ttorp)
end

function hatch_count()
    return notecount(silo_hatch)
end

function bdrill_count()
    return notecount(silo_bdrill)
end

function feggs_count()
    return notecount(silo_feggs)
end

function sapack_count()
    return notecount(silo_sapack)
end

function packwh_count()
    return notecount(silo_packwh)
end

function clawbts_count()
    return notecount(silo_clawbts)
end

function aireaim_count()
    return notecount(silo_aireaim)
end

function taxpack_count()
    return notecount(silo_taxpack)
end

function springb_count()
    return notecount(silo_springb)
end

function ggrab_count()
    return notecount(silo_ggrab)
end

function glide_count()
    return notecount(silo_glide)
end

function splitup_count()
    return notecount(silo_splitup)
end

function wwhack_count()
    return notecount(silo_wwhack)
end

function geggs_count()
    return notecount(silo_geggs)
end

function lspring_count()
    return notecount(silo_lspring)
end

function bbayonet_count()
    return notecount(silo_bbayonet)
end

function bblaster_count()
    return notecount(silo_bblaster)
end

-- Progressive Eggs Toggle

function togglePBEggs()
    if Tracker:FindObjectForCode('pbeggs').CurrentStage == 1 then
        Tracker:FindObjectForCode('begg').Active = true
        Tracker:FindObjectForCode('feggs').Active = true
    elseif Tracker:FindObjectForCode('pbeggs').CurrentStage == 2 then
        Tracker:FindObjectForCode('begg').Active = true
        Tracker:FindObjectForCode('feggs').Active = true
        Tracker:FindObjectForCode('geggs').Active = true
    elseif Tracker:FindObjectForCode('pbeggs').CurrentStage == 3 then
        Tracker:FindObjectForCode('begg').Active = true
        Tracker:FindObjectForCode('feggs').Active = true
        Tracker:FindObjectForCode('geggs').Active = true
        Tracker:FindObjectForCode('ieggs').Active = true
    elseif Tracker:FindObjectForCode('pbeggs').CurrentStage == 4 then
        Tracker:FindObjectForCode('begg').Active = true
        Tracker:FindObjectForCode('feggs').Active = true
        Tracker:FindObjectForCode('geggs').Active = true
        Tracker:FindObjectForCode('ieggs').Active = true
        Tracker:FindObjectForCode('ceggs').Active = true
    end
end

-- Progressive Beak Buster Toggle
function togglePBBust()
    if Tracker:FindObjectForCode('pbbust').CurrentStage == 1 then
        Tracker:FindObjectForCode('bbust').Active = true
    elseif Tracker:FindObjectForCode('pbbust').CurrentStage == 2 then
        Tracker:FindObjectForCode('bbust').Active = true
        Tracker:FindObjectForCode('bdrill').Active = true
    end
end

-- Progressive Shoes Toggle
function togglePShoes()
    if Tracker:FindObjectForCode('pshoes').CurrentStage == 1 then
        Tracker:FindObjectForCode('sstride').Active = true
    elseif Tracker:FindObjectForCode('pshoes').CurrentStage == 2 then
        Tracker:FindObjectForCode('sstride').Active = true
        Tracker:FindObjectForCode('ttrain').Active = true
    elseif Tracker:FindObjectForCode('pshoes').CurrentStage == 3 then
        Tracker:FindObjectForCode('sstride').Active = true
        Tracker:FindObjectForCode('ttrain').Active = true
        Tracker:FindObjectForCode('springb').Active = true
    elseif Tracker:FindObjectForCode('pshoes').CurrentStage == 4 then
        Tracker:FindObjectForCode('sstride').Active = true
        Tracker:FindObjectForCode('ttrain').Active = true
        Tracker:FindObjectForCode('springb').Active = true
        Tracker:FindObjectForCode('clawbts').Active = true
    end
end

-- Progressive Water Training Toggle
function togglePSwim()
    if Tracker:FindObjectForCode('pswim').CurrentStage == 1 then
        Tracker:FindObjectForCode('dive').Active = true
    elseif Tracker:FindObjectForCode('pswim').CurrentStage == 2 then
        Tracker:FindObjectForCode('dive').Active = true
        Tracker:FindObjectForCode('dair').Active = true
    elseif Tracker:FindObjectForCode('pswim').CurrentStage == 3 then
        Tracker:FindObjectForCode('dive').Active = true
        Tracker:FindObjectForCode('dair').Active = true
        Tracker:FindObjectForCode('fswim').Active = true
    end
end

-- Progressive Adv. Water Training Toggle
function togglePASwim()
    if Tracker:FindObjectForCode('paswim').CurrentStage == 1 then
        Tracker:FindObjectForCode('dive').Active = true
    elseif Tracker:FindObjectForCode('paswim').CurrentStage == 2 then
        Tracker:FindObjectForCode('dive').Active = true
        Tracker:FindObjectForCode('auqaim').Active = true
    elseif Tracker:FindObjectForCode('paswim').CurrentStage == 3 then
        Tracker:FindObjectForCode('dive').Active = true
        Tracker:FindObjectForCode('auqaim').Active = true
        Tracker:FindObjectForCode('ttorp').Active = true
    elseif Tracker:FindObjectForCode('paswim').CurrentStage == 4 then
        Tracker:FindObjectForCode('dive').Active = true
        Tracker:FindObjectForCode('auqaim').Active = true
        Tracker:FindObjectForCode('ttorp').Active = true
        Tracker:FindObjectForCode('dair').Active = true
    elseif Tracker:FindObjectForCode('paswim').CurrentStage == 5 then
        Tracker:FindObjectForCode('dive').Active = true
        Tracker:FindObjectForCode('auqaim').Active = true
        Tracker:FindObjectForCode('ttorp').Active = true
        Tracker:FindObjectForCode('dair').Active = true
        Tracker:FindObjectForCode('fswim').Active = true
    end
end

-- Progressive Bash Attack Toggle
function togglePBash()
    if Tracker:FindObjectForCode('pbash').CurrentStage == 1 then
        Tracker:FindObjectForCode('grat').Active = true
    elseif Tracker:FindObjectForCode('pbash').CurrentStage == 2 then
        Tracker:FindObjectForCode('grat').Active = true
        Tracker:FindObjectForCode('bbash').Active = true
    end
end

-- Progressive Flight Toggle
function togglePFlight()
    if Tracker:FindObjectForCode('pflight').CurrentStage == 1 then
        Tracker:FindObjectForCode('fpad').Active = true
    elseif Tracker:FindObjectForCode('pflight').CurrentStage == 2 then
        Tracker:FindObjectForCode('fpad').Active = true
        Tracker:FindObjectForCode('bbomb').Active = true
    elseif Tracker:FindObjectForCode('pflight').CurrentStage == 3 then
        Tracker:FindObjectForCode('fpad').Active = true
        Tracker:FindObjectForCode('bbomb').Active = true
        Tracker:FindObjectForCode('aireaim').Active = true
    end
end

-- Progressive Egg Aim Toggle
function togglePEggAim()
    if Tracker:FindObjectForCode('peggaim').CurrentStage == 1 then
        Tracker:FindObjectForCode('eggshoot').Active = true
    elseif Tracker:FindObjectForCode('peggaim').CurrentStage == 2 then
        Tracker:FindObjectForCode('eggshoot').Active = true
        Tracker:FindObjectForCode('eggaim').Active = true
    end
end

-- Progressive Adv. Egg Aim Toggle
function togglePAEggAim()
    if Tracker:FindObjectForCode('paeggaim').CurrentStage == 1 then
        Tracker:FindObjectForCode('eggshoot').Active = true
    elseif Tracker:FindObjectForCode('paeggaim').CurrentStage == 2 then
        Tracker:FindObjectForCode('eggshoot').Active = true
        Tracker:FindObjectForCode('amazeogaze').Active = true
    elseif Tracker:FindObjectForCode('paeggaim').CurrentStage == 3 then
        Tracker:FindObjectForCode('eggshoot').Active = true
        Tracker:FindObjectForCode('amazeogaze').Active = true
        Tracker:FindObjectForCode('eggaim').Active = true
    elseif Tracker:FindObjectForCode('paeggaim').CurrentStage == 4 then
        Tracker:FindObjectForCode('eggshoot').Active = true
        Tracker:FindObjectForCode('amazeogaze').Active = true
        Tracker:FindObjectForCode('eggaim').Active = true
        Tracker:FindObjectForCode('bblaster').Active = true
    end
end

-- BK Move Toggle

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
        Tracker:FindObjectForCode('grat').Active = true
        Tracker:FindObjectForCode('arat').Active = true
        Tracker:FindObjectForCode('bbarge').Active = true
        Tracker:FindObjectForCode('begg').Active = true
        Tracker:FindObjectForCode('bbust').Active = true
        Tracker:FindObjectForCode('sstride').Active = true
        Tracker:FindObjectForCode('ttrain').Active = true
        Tracker:FindObjectForCode('bbomb').Active = true
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
        Tracker:FindObjectForCode('grat').Active = false
        Tracker:FindObjectForCode('arat').Active = false
        Tracker:FindObjectForCode('bbarge').Active = false
        Tracker:FindObjectForCode('begg').Active = false
        Tracker:FindObjectForCode('bbust').Active = false
        Tracker:FindObjectForCode('sstride').Active = false
        Tracker:FindObjectForCode('ttrain').Active = false
        Tracker:FindObjectForCode('bbomb').Active = false
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
        Tracker:FindObjectForCode('grat').Active = false
        Tracker:FindObjectForCode('arat').Active = false
        Tracker:FindObjectForCode('bbarge').Active = false
        Tracker:FindObjectForCode('begg').Active = false
        Tracker:FindObjectForCode('bbust').Active = false
        Tracker:FindObjectForCode('sstride').Active = false
        Tracker:FindObjectForCode('ttrain').Active = false
        Tracker:FindObjectForCode('bbomb').Active = false
    end
end

-- Loading Zone Rules

function load_mt_mt()
    if load_mt == "Mayahem Temple" then
        return true
    else
        return false
    end
end

function load_mt_ggm()
    if load_mt == "Glitter Gulch Mine" then
        return true
    else
        return false
    end
end

function load_mt_ww()
    if load_mt == "Witchyworld" then
        return true
    else
        return false
    end
end

function load_mt_jrl()
    if load_mt == "Jolly Roger's Lagoon - Town Center" then
        return true
    else
        return false
    end
end

function load_mt_tdl()
    if load_mt == "Terrydactyland" then
        return true
    else
        return false
    end
end

function load_mt_gi()
    if load_mt == "Outside Grunty Industries" then
        return true
    else
        return false
    end
end

function load_mt_hfp()
    if load_mt == "Hailfire Peaks" then
        return true
    else
        return false
    end
end

function load_mt_ccl()
    if load_mt == "Cloud Cuckooland" then
        return true
    else
        return false
    end
end

function load_mt_ck()
    if load_mt == "Cauldron Keep" then
        return true
    else
        return false
    end
end

function load_ggm_mt()
    if load_ggm == "Mayahem Temple" then
        return true
    else
        return false
    end
end

function load_ggm_ggm()
    if load_ggm == "Glitter Gulch Mine" then
        return true
    else
        return false
    end
end

function load_ggm_ww()
    if load_ggm == "Witchyworld" then
        return true
    else
        return false
    end
end

function load_ggm_jrl()
    if load_ggm == "Jolly Roger's Lagoon - Town Center" then
        return true
    else
        return false
    end
end

function load_ggm_tdl()
    if load_ggm == "Terrydactyland" then
        return true
    else
        return false
    end
end

function load_ggm_gi()
    if load_ggm == "Outside Grunty Industries" then
        return true
    else
        return false
    end
end

function load_ggm_hfp()
    if load_ggm == "Hailfire Peaks" then
        return true
    else
        return false
    end
end

function load_ggm_ccl()
    if load_ggm == "Cloud Cuckooland" then
        return true
    else
        return false
    end
end

function load_ggm_ck()
    if load_ggm == "Cauldron Keep" then
        return true
    else
        return false
    end
end

function load_ww_mt()
    if load_ww == "Mayahem Temple" then
        return true
    else
        return false
    end
end

function load_ww_ggm()
    if load_ww == "Glitter Gulch Mine" then
        return true
    else
        return false
    end
end

function load_ww_ww()
    if load_ww == "Witchyworld" then
        return true
    else
        return false
    end
end

function load_ww_jrl()
    if load_ww == "Jolly Roger's Lagoon - Town Center" then
        return true
    else
        return false
    end
end

function load_ww_tdl()
    if load_ww == "Terrydactyland" then
        return true
    else
        return false
    end
end

function load_ww_gi()
    if load_ww == "Outside Grunty Industries" then
        return true
    else
        return false
    end
end

function load_ww_hfp()
    if load_ww == "Hailfire Peaks" then
        return true
    else
        return false
    end
end

function load_ww_ccl()
    if load_ww == "Cloud Cuckooland" then
        return true
    else
        return false
    end
end

function load_ww_ck()
    if load_ww == "Cauldron Keep" then
        return true
    else
        return false
    end
end

function load_jrl_mt()
    if load_jrl == "Mayahem Temple" then
        return true
    else
        return false
    end
end

function load_jrl_ggm()
    if load_jrl == "Glitter Gulch Mine" then
        return true
    else
        return false
    end
end

function load_jrl_ww()
    if load_jrl == "Witchyworld" then
        return true
    else
        return false
    end
end

function load_jrl_jrl()
    if load_jrl == "Jolly Roger's Lagoon - Town Center" then
        return true
    else
        return false
    end
end

function load_jrl_tdl()
    if load_jrl == "Terrydactyland" then
        return true
    else
        return false
    end
end

function load_jrl_gi()
    if load_jrl == "Outside Grunty Industries" then
        return true
    else
        return false
    end
end

function load_jrl_hfp()
    if load_jrl == "Hailfire Peaks" then
        return true
    else
        return false
    end
end

function load_jrl_ccl()
    if load_jrl == "Cloud Cuckooland" then
        return true
    else
        return false
    end
end

function load_jrl_ck()
    if load_jrl == "Cauldron Keep" then
        return true
    else
        return false
    end
end

function load_hfp_mt()
    if load_hfp == "Mayahem Temple" then
        return true
    else
        return false
    end
end

function load_hfp_ggm()
    if load_hfp == "Glitter Gulch Mine" then
        return true
    else
        return false
    end
end

function load_hfp_ww()
    if load_hfp == "Witchyworld" then
        return true
    else
        return false
    end
end

function load_hfp_jrl()
    if load_hfp == "Jolly Roger's Lagoon - Town Center" then
        return true
    else
        return false
    end
end

function load_hfp_tdl()
    if load_hfp == "Terrydactyland" then
        return true
    else
        return false
    end
end

function load_hfp_gi()
    if load_hfp == "Outside Grunty Industries" then
        return true
    else
        return false
    end
end

function load_hfp_hfp()
    if load_hfp == "Hailfire Peaks" then
        return true
    else
        return false
    end
end

function load_hfp_ccl()
    if load_hfp == "Cloud Cuckooland" then
        return true
    else
        return false
    end
end

function load_hfp_ck()
    if load_hfp == "Cauldron Keep" then
        return true
    else
        return false
    end
end

function load_tdl_mt()
    if load_tdl == "Mayahem Temple" then
        return true
    else
        return false
    end
end

function load_tdl_ggm()
    if load_tdl == "Glitter Gulch Mine" then
        return true
    else
        return false
    end
end

function load_tdl_ww()
    if load_tdl == "Witchyworld" then
        return true
    else
        return false
    end
end

function load_tdl_jrl()
    if load_tdl == "Jolly Roger's Lagoon - Town Center" then
        return true
    else
        return false
    end
end

function load_tdl_tdl()
    if load_tdl == "Terrydactyland" then
        return true
    else
        return false
    end
end

function load_tdl_gi()
    if load_tdl == "Outside Grunty Industries" then
        return true
    else
        return false
    end
end

function load_tdl_hfp()
    if load_tdl == "Hailfire Peaks" then
        return true
    else
        return false
    end
end

function load_tdl_ccl()
    if load_tdl == "Cloud Cuckooland" then
        return true
    else
        return false
    end
end

function load_tdl_ck()
    if load_tdl == "Cauldron Keep" then
        return true
    else
        return false
    end
end

function load_ccl_mt()
    if load_ccl == "Mayahem Temple" then
        return true
    else
        return false
    end
end

function load_ccl_ggm()
    if load_ccl == "Glitter Gulch Mine" then
        return true
    else
        return false
    end
end

function load_ccl_ww()
    if load_ccl == "Witchyworld" then
        return true
    else
        return false
    end
end

function load_ccl_jrl()
    if load_ccl == "Jolly Roger's Lagoon - Town Center" then
        return true
    else
        return false
    end
end

function load_ccl_tdl()
    if load_ccl == "Terrydactyland" then
        return true
    else
        return false
    end
end

function load_ccl_gi()
    if load_ccl == "Outside Grunty Industries" then
        return true
    else
        return false
    end
end

function load_ccl_hfp()
    if load_ccl == "Hailfire Peaks" then
        return true
    else
        return false
    end
end

function load_ccl_ccl()
    if load_ccl == "Cloud Cuckooland" then
        return true
    else
        return false
    end
end

function load_ccl_ck()
    if load_ccl == "Cauldron Keep" then
        return true
    else
        return false
    end
end

function load_gi_mt()
    if load_gi == "Mayahem Temple" then
        return true
    else
        return false
    end
end

function load_gi_ggm()
    if load_gi == "Glitter Gulch Mine" then
        return true
    else
        return false
    end
end

function load_gi_ww()
    if load_gi == "Witchyworld" then
        return true
    else
        return false
    end
end

function load_gi_jrl()
    if load_gi == "Jolly Roger's Lagoon - Town Center" then
        return true
    else
        return false
    end
end

function load_gi_tdl()
    if load_gi == "Terrydactyland" then
        return true
    else
        return false
    end
end

function load_gi_gi()
    if load_gi == "Outside Grunty Industries" then
        return true
    else
        return false
    end
end

function load_gi_hfp()
    if load_gi == "Hailfire Peaks" then
        return true
    else
        return false
    end
end

function load_gi_ccl()
    if load_gi == "Cloud Cuckooland" then
        return true
    else
        return false
    end
end

function load_gi_ck()
    if load_gi == "Cauldron Keep" then
        return true
    else
        return false
    end
end

function load_ck_mt()
    if load_ck == "Mayahem Temple" then
        return true
    else
        return false
    end
end

function load_ck_ggm()
    if load_ck == "Glitter Gulch Mine" then
        return true
    else
        return false
    end
end

function load_ck_ww()
    if load_ck == "Witchyworld" then
        return true
    else
        return false
    end
end

function load_ck_jrl()
    if load_ck == "Jolly Roger's Lagoon - Town Center" then
        return true
    else
        return false
    end
end

function load_ck_tdl()
    if load_ck == "Terrydactyland" then
        return true
    else
        return false
    end
end

function load_ck_gi()
    if load_ck == "Outside Grunty Industries" then
        return true
    else
        return false
    end
end

function load_ck_hfp()
    if load_ck == "Hailfire Peaks" then
        return true
    else
        return false
    end
end

function load_ck_ccl()
    if load_ck == "Cloud Cuckooland" then
        return true
    else
        return false
    end
end

function load_ck_ck()
    if load_ck == "Cauldron Keep" then
        return true
    else
        return false
    end
end

ScriptHost:AddWatchForCode("bkmovewatch", "randomizebkmoves", toggleBKMoves)
ScriptHost:AddWatchForCode("pbeggswatch", "pbeggs", togglePBEggs)
ScriptHost:AddWatchForCode("pbbustwatch", "pbbust", togglePBBust)
ScriptHost:AddWatchForCode("pshoeswatch", "pshoes", togglePShoes)
ScriptHost:AddWatchForCode("pswimwatch", "pswim", togglePSwim)
ScriptHost:AddWatchForCode("paswimwatch", "paswim", togglePASwim)
ScriptHost:AddWatchForCode("pbashwatch", "pbash", togglePBash)
ScriptHost:AddWatchForCode("pflightwatch", "pflight", togglePFlight)
ScriptHost:AddWatchForCode("peggaimwatch", "peggaim", togglePEggAim)
ScriptHost:AddWatchForCode("paeggaimwatch", "paeggaim", togglePAEggAim)