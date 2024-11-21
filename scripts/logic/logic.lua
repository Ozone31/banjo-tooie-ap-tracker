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
    return has("humbaih") and pinegrove_access() and has("grat")
end

function MT_flight_pad()
    return has("fpad") and (has("mumbomt") or (billDrill() and (canDoSmallElevation() or has("flutter"))))
end

function dilberta_free()
    if logictype.CurrentStage == 0 then
        return (has_explosives() or has("mumbomt")) and billDrill() and has("humbamt")
    else
        return (has_explosives() or has("mumbomt")) and billDrill()
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
        return has("trainswtd") and has("climb") and canDoSmallElevation()
    elseif logictype.CurrentStage == 1 then
        return has("trainswtd") and (canDoSmallElevation() or has("bbust")) and has("climb")
    else
        return has("trainswtd") and (((canDoSmallElevation() or has("bbust")) and has("climb")) or extremelyLongJump())
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
        return has("splitup") and has("wwhack") and has("lspring") and has("glide") and GM_boulders()
    else
        return (has("splitup") and has("wwhack") and has("lspring") and has("glide") and GM_boulders()) or clockwork_shot()
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
        return has("humbaww") and ((has("fflip") and has("ggrab")) or (has("climb") and veryLongJump()) or (has("splitup") and has("lspring")))
    else
        return has("humbaww") and ((has("fflip") and has("ggrab")) or (has("climb") and veryLongJump() and has("fflip")) or (clockwork_shot() and has("climb")) or (has("splitup") and has("lspring")))
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

function saucer_door_open_ww()
    if logictype.CurrentStage == 0 then
        return longJumpToGripGrab() and has("fflip") and has("climb") and (has_explosives() or has("bbarge"))
    elseif logictype.CurrentStage == 1 then
        return (longJumpToGripGrab() and has("fflip") and has("climb") and (has_explosives() or has("bbarge"))) or (has("eggaim") and canShootEggs("geggs") and has("amazeogaze") and has("climb")) or (has_explosives() and has("splitup") and has("lspring") and has("glide"))
    elseif logictype.CurrentStage <= 2 then
        return (longJumpToGripGrab() and has("fflip") and has("climb") and (has_explosives() or has("bbarge"))) or (has("eggaim") and canShootEggs("geggs") and has("amazeogaze")) or (has_explosives() and has("splitup") and has("lspring") and has("glide"))
    else
        return ((longJumpToGripGrab() and has("fflip") and has("climb") and (has_explosives() or has("bbarge"))) or (has("eggaim") and canShootEggs("geggs") and has("amazeogaze")) or (has_explosives() and has("splitup") and has("lspring") and has("glide"))) or (ggm_access() and canDoSmallElevation() and canShootEggs("ceggs"))
    end
end

function saucer_door_open_ggm()
    if logictype.CurrentStage <= 2 then
        return false
    else
        return canDoSmallElevation() and canShootEggs("ceggs")
    end
end

function can_reach_saucer()
    return (longJumpToGripGrab() and has("fflip") and has("climb")) or canDoSmallElevation()
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
        return has("dive") or (has("splitup") and has("shpack") and has_explosives())
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

function HFP_hot_water_cooled() -- Need HFP and CCL access
    return has("splitup") and hasGroundAttack() and (has("dive") or has("shpack"))
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
        return has("eggaim") and canShootLinearEgg() and tdl_top()
    else
        return tdl_top() and canShootLinearEgg() and (has("fflip") or has("eggaim"))
    end
end

function tdl_top()
    if logictype.CurrentStage <= 1 then
        return has("springb")
    elseif logictype.CurrentStage == 2 then
        return has("springb") or has("splitup") and has("lspring") and has("glide")
    else
        return has("springb") or has("splitup") and has("lspring") and has("glide") or (has("fpad") and (has("bbomb") or clockworkWarp()))
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
    return has("packwh") and has("taxpack") and has("splitup")
end

function can_beat_weldar()
    if logictype.CurrentStage == 0 then
        return can_use_battery() and mumboGI() and has("humbagi") and canShootEggs("geggs") and billDrill() and has("climb") and has("fflip") and has("ggrab")
    elseif logictype.CurrentStage == 1 then
        return can_use_battery() and mumboGI() and has("humbagi") and canShootEggs("geggs") and billDrill() and has("climb") and has("fflip") and (has("ggrab") or (has("tjump") and (has("flutter") or has("arat"))))
    else
        return can_use_battery() and mumboGI() and has("humbagi") and canShootEggs("geggs") and billDrill() and has("climb") and has("fflip") and ((has("ggrab") or (has("tjump") and (has("flutter") or has("arat")))) or extremelyLongJump())
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
        return canDoSmallElevation() and has("mumbogi")
    else
        return has("mumbogi") and (canDoSmallElevation() or (has("climb") and clockwork_shot()))
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
    return has("splitup") and (has_explosives() or canShootEggs("feggs") or canShootEggs("begg") or has("wwhack"))
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
        return has("gga") or (has("bbust") and (has("fflip") or has("tjump") or (has("ttrot") and (has("flutter") or has("arat")))))
    end
end

function PL_to_PG()
    if logictype.CurrentStage == 0 then
        return has("feggs") and has("eggaim")
    else
        return (has("feggs") and has("eggaim")) or (has("ttrot") and canShootEggs("feggs"))
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
        return has("ttorp")
    else
        return true
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

function TDL_to_WW()
    if logictype.CurrentStage <= 2 then
        return oogle_boogles_open() and (springPad() or has_explosives())
    else
        return (springPad() or has_explosives()) and (oogle_boogles_open() or clockworkWarp())
    end
end

function ggm_to_ww()
    if logictype.CurrentStage <= 2 then
        return false
    else
        return humbaGGM() and canShootEggs("ceggs")
    end
end

function glitchedInfernoAccess()
    return (
        humbaWW() or canShootEggs("ceggs")
    )
end

function hatch_to_TDL()
    if logictype.CurrentStage <= 2 then
        return false
    else
        return has("ceggs") and has("eggaim")
    end
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

function outside_gi_to_floor1()
    if logictype.CurrentStage <= 2 then
        return false
    else
        return has("ceggs") and has("eggaim")
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
        return has("clawbts") and (has("flutter") or has("arat")) and has("climb")
    else
        return has("clawbts") and (has("flutter") or has("arat")) and (has("climb") or extremelyLongJump())
    end
end

function outside_gi_to_floor3_f2access()
    if logictype.CurrentStage == 0 then
        return false
    elseif logictype.CurrentStage == 1 then
        return has("clawbts") and (has("flutter") or has("arat"))
    else
        return has("clawbts") and (has("flutter") or has("arat"))
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
    if logictype.CurrentStage <= 1 then
        return false
    elseif logictype.CurrentStage == 2 then
        return has("splitup") and has("clawbts") and has("lspring") and (has("wwhack") or has("eggaim")) and has("fpad")
    else
        return (breegullBash() and has("climb")) or has("climb") and has_explosives() and has("eggaim") and (has("springb") or has("fflip") and has("ggrab") or has("splitup") and roof_access()) or has("splitup") and has("clawbts") and has("lspring") and (has("wwhack") or has("eggaim")) and has("fpad")
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
        return (has("fflip") and has("ggrab") and has("clawbs") and has("climb")) or has("humbagi")
    else
        return ((has("fflip") and has("ggrab") or veryLongJump()) and has("clawbts") and (has("climb") or (has("geggs") and has("eggshoot") and has("fflip") and has("bbust")))) or has("humbgi") or (has("splitup") and has("lspring"))
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

function hfpTop()
    if logictype.CurrentStage == 0 then
        return canDoSmallElevation() or has("fpad") or has_explosives()
    else
        return canDoSmallElevation() or has("fpad") or has_explosives() or has("mumbohp")
    end
end

function HFP_to_MT()
    if logictype.CurrentStage == 0 then
        return has_explosives()
    else
        return has_explosives() or has("mumbohp")
    end
end

function HFP_to_JRL()
    if logictype.CurrentStage <= 2 then
        return HFP_hot_water_cooled()
    else
        return HFP_hot_water_cooled() or (has("ggrab") and has("flutter") and has("grat") and has("tjump"))
    end
end

function CK_to_Quag()
    if logictype.CurrentStage == 0 then
        return has("cka")
    else
        return true
    end
end

-- Mayahem Temple

function mt_jiggy4()
    if logictype.CurrentStage == 0 then
        return has("eggaim") and (canShootEggs("begg") or canShootEggs("feggs") or canShootEggs("geggs"))
    elseif logictype.CurrentStage == 1 then
        return (canShootEggs("begg") or canShootEggs("feggs") or canShootEggs("geggs") or canShootEggs("ceggs")) and (has("eggaim") or (MT_flight_pad() and has("aireaim")))
    else
        return (canShootEggs("begg") or canShootEggs("feggs") or canShootEggs("geggs") or canShootEggs("ceggs")) and (has("eggaim") or (MT_flight_pad() and has("aireaim"))) or (has("fflip") and has("bbust")) or (MT_flight_pad() and has("bbomb"))
    end
end

function mt_jiggy5()
    if logictype.CurrentStage == 0 then
        return has("eggaim") and (has("fflip") or canReachSlightlyElevatedLedge()) and ((has("ggrab") and springPad() and has("fflip")) or MT_flight_pad())
    else
        return (has("fflip") or canReachSlightlyElevatedLedge()) and ((has("ggrab") and springPad() and has("fflip") and has("eggaim")) or (MT_flight_pad() and canShootEggs()))
    end
end

function mt_jiggy8()
    if logictype.CurrentStage == 0 then
        return billDrill() and (has("dive") or canReachSlightlyElevatedLedge() and has("tjump")) and canDoSmallElevation()
    elseif logictype.CurrentStage == 1 then
        return billDrill() and canDoSmallElevation() and (has("dive") or canReachSlightlyElevatedLedge() or has("bbust"))
    else
        return ((billDrill() and canDoSmallElevation()) or extremelyLongJump() or clockwork_shot()) and (has("dive") or canReachSlightlyElevatedLedge() or has("bbust"))
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
            return (humbaWW() and mumboWW()) or (canShootEggs("geggs") and canShootEggs("ceggs"))
        else
            return humbaWW() and mumboWW()
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

function td_jiggy2() -- Need CCL access
    return has("ttorp") and has("dive")
end

function td_jiggy8()
    if logictype.CurrentStage == 0 then
        return canShootEggs("ieggs") and tdl_top() and longJump() and has("ttrot")
    elseif logictype.CurrentStage == 1 then
        return tdl_top() and ((has("splitup") and (has("wwhack") or has("glide"))) or canShootEggs("ieggs")) and longJump() and has("ttrot")
    elseif logictype.CurrentStage == 2 then
        return tdl_top() and longJump() and (has("tjump") or has("ttrot"))
    else
        return tdl_top() and (has("tjump") or has("ttrot"))
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
        return can_beat_king_coal() and has("trainswih") and has("trainswtd") and has("splitup") and has("taxpack") and has("mumboih") and (has("tjump") or has("ttrot"))
    else
        return can_beat_king_coal() and has("trainswih") and has("trainswtd") and has("splitup") and has("taxpack") and has("mumboih")
    end
end

function scrit()
    if logictype.CurrentStage == 0 then
        return mumboTDL() and billDrill() and has("tjump")
    else
        return mumboTDL() and billDrill()
    end
end

-- Cloud Cuckooland

function cc_jiggy2()
    if logictype.CurrentStage == 0 then
        return has("springb") and has("splitup") and has("sapack") and grow_beanstalk() and can_use_floatus() and has("climb") and has("ttrain")
    elseif logictype.CurrentStage == 1 then
        return (has("springb") or has("fpad")) and has("splitup") and has("sapack") and grow_beanstalk() and can_use_floatus() and has("climb") and (has("ttrain") or has("humbacc"))
    elseif logictype.CurrentStage == 1 then
        return (has("springb") or has("fpad")) and has("splitup") and has("sapack") and grow_beanstalk() and (can_use_floatus() or has("packwh")) and has("climb") and (has("ttrain") or has("humbacc"))
    else
        return (has("springb") or has("fpad")) and has("splitup") and has("sapack") and grow_beanstalk() and (can_use_floatus() or has("packwh")) and has("climb") and (has("ttrain") or has("humbacc") or canShootEggs("ceggs"))
    end
end

function cc_jiggy3()
    if logictype.CurrentStage == 0 then
        return (
            canShootEggs("begg") and canShootEggs("feggs") and canShootEggs("geggs") and canShootEggs("ieggs") and mumboCCL() and (has("fflip") or (has("splitup") and has("lspring")))
        )
    elseif logictype.CurrentStage == 1 then
        return (
            canShootEggs("begg") and canShootEggs("feggs") and canShootEggs("geggs") and canShootEggs("ieggs") and mumboCCL() and (has("fflip") or (has("splitup") and has("lspring")) or has("fpad"))
        )
    else
        return (
            canShootEggs("begg") and canShootEggs("feggs") and canShootEggs("geggs") and canShootEggs("ieggs") and (mumboCCL() and (has("fflip") or (has("splitup") and has("lspring")) or has("fpad")) or (has("splitup") and (has("lspring") or has("tjump")) and has("fpad") and has("bbomb")))
        )
    end
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

-- Progressive Bash Attack Toggle
function togglePBash()
    if Tracker:FindObjectForCode('pbash').CurrentStage == 1 then
        Tracker:FindObjectForCode('grat').Active = true
    elseif Tracker:FindObjectForCode('pbash').CurrentStage == 2 then
        Tracker:FindObjectForCode('grat').Active = true
        Tracker:FindObjectForCode('bbash').Active = true
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
        Tracker:FindObjectForCode('grat').Active = falsed
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
ScriptHost:AddWatchForCode("pbashwatch", "pbash", togglePBash)
