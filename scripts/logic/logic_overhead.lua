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
sequenceBreakLogic = Tracker:FindObjectForCode("sequencebreaklogic")
chuffyrandomized = Tracker:FindObjectForCode("randomizechuffy")
speedupminigames = Tracker:FindObjectForCode("speedupmini")

-- Note, Page, Jinjo Count

function notes()
    return Tracker:ProviderCountForCode("totalnote")
end

function notecount(targetnotes)
    return notes() >= tonumber(targetnotes)
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

-- Loading Zone Rules

function load_mt_mt()
    if (has("ber_er_manualoverride_off") or has("entrancerando_off")) and load_mt == "Mayahem Temple" then
        return true
    elseif has("ber_er_manualoverride_on") and has("entrancerando_on") and has("mte_mt") then
        return true
    else
        return false
    end
end

function load_mt_ggm()
    if (has("ber_er_manualoverride_off") or has("entrancerando_off")) and load_mt == "Glitter Gulch Mine" then
        return true
    elseif has("ber_er_manualoverride_on") and has("entrancerando_on") and has("mte_gg") then
        return true
    else
        return false
    end
end

function load_mt_ww()
    if (has("ber_er_manualoverride_off") or has("entrancerando_off")) and load_mt == "Witchyworld" then
        return true
    elseif has("ber_er_manualoverride_on") and has("entrancerando_on") and has("mte_ww") then
        return true
    else
        return false
    end
end

function load_mt_jrl()
    if (has("ber_er_manualoverride_off") or has("entrancerando_off")) and load_mt == "Jolly Roger's Lagoon - Town Center" then
        return true
    elseif has("ber_er_manualoverride_on") and has("entrancerando_on") and has("mte_jr") then
        return true
    else
        return false
    end
end

function load_mt_tdl()
    if (has("ber_er_manualoverride_off") or has("entrancerando_off")) and load_mt == "Terrydactyland" then
        return true
    elseif has("ber_er_manualoverride_on") and has("entrancerando_on") and has("mte_td") then
        return true
    else
        return false
    end
end

function load_mt_gi()
    if (has("ber_er_manualoverride_off") or has("entrancerando_off")) and load_mt == "Outside Grunty Industries" then
        return true
    elseif has("ber_er_manualoverride_on") and has("entrancerando_on") and has("mte_gi") then
        return true
    else
        return false
    end
end

function load_mt_hfp()
    if (has("ber_er_manualoverride_off") or has("entrancerando_off")) and load_mt == "Hailfire Peaks" then
        return true
    elseif has("ber_er_manualoverride_on") and has("entrancerando_on") and has("mte_hf") then
        return true
    else
        return false
    end
end

function load_mt_ccl()
    if (has("ber_er_manualoverride_off") or has("entrancerando_off")) and load_mt == "Cloud Cuckooland" then
        return true
    elseif has("ber_er_manualoverride_on") and has("entrancerando_on") and has("mte_cc") then
        return true
    else
        return false
    end
end

function load_mt_ck()
    if (has("ber_er_manualoverride_off") or has("entrancerando_off")) and load_mt == "Cauldron Keep" then
        return true
    elseif has("ber_er_manualoverride_on") and has("entrancerando_on") and has("mte_ck") then
        return true
    else
        return false
    end
end

function load_ggm_mt()
    if (has("ber_er_manualoverride_off") or has("entrancerando_off")) and load_ggm == "Mayahem Temple" then
        return true
    elseif has("ber_er_manualoverride_on") and has("entrancerando_on") and has("gge_mt") then
        return true
    else
        return false
    end
end

function load_ggm_ggm()
    if (has("ber_er_manualoverride_off") or has("entrancerando_off")) and load_ggm == "Glitter Gulch Mine" then
        return true
    elseif has("ber_er_manualoverride_on") and has("entrancerando_on") and has("gge_gg") then
        return true
    else
        return false
    end
end

function load_ggm_ww()
    if (has("ber_er_manualoverride_off") or has("entrancerando_off")) and load_ggm == "Witchyworld" then
        return true
    elseif has("ber_er_manualoverride_on") and has("entrancerando_on") and has("gge_ww") then
        return true
    else
        return false
    end
end

function load_ggm_jrl()
    if (has("ber_er_manualoverride_off") or has("entrancerando_off")) and load_ggm == "Jolly Roger's Lagoon - Town Center" then
        return true
    elseif has("ber_er_manualoverride_on") and has("entrancerando_on") and has("gge_jr") then
        return true
    else
        return false
    end
end

function load_ggm_tdl()
    if (has("ber_er_manualoverride_off") or has("entrancerando_off")) and load_ggm == "Terrydactyland" then
        return true
    elseif has("ber_er_manualoverride_on") and has("entrancerando_on") and has("gge_td") then
        return true
    else
        return false
    end
end

function load_ggm_gi()
    if (has("ber_er_manualoverride_off") or has("entrancerando_off")) and load_ggm == "Outside Grunty Industries" then
        return true
    elseif has("ber_er_manualoverride_on") and has("entrancerando_on") and has("gge_gi") then
        return true
    else
        return false
    end
end

function load_ggm_hfp()
    if (has("ber_er_manualoverride_off") or has("entrancerando_off")) and load_ggm == "Hailfire Peaks" then
        return true
    elseif has("ber_er_manualoverride_on") and has("entrancerando_on") and has("gge_hf") then
        return true
    else
        return false
    end
end

function load_ggm_ccl()
    if (has("ber_er_manualoverride_off") or has("entrancerando_off")) and load_ggm == "Cloud Cuckooland" then
        return true
    elseif has("ber_er_manualoverride_on") and has("entrancerando_on") and has("gge_cc") then
        return true
    else
        return false
    end
end

function load_ggm_ck()
    if (has("ber_er_manualoverride_off") or has("entrancerando_off")) and load_ggm == "Cauldron Keep" then
        return true
    elseif has("ber_er_manualoverride_on") and has("entrancerando_on") and has("gge_ck") then
        return true
    else
        return false
    end
end

function load_ww_mt()
    if (has("ber_er_manualoverride_off") or has("entrancerando_off")) and load_ww == "Mayahem Temple" then
        return true
    elseif has("ber_er_manualoverride_on") and has("entrancerando_on") and has("wwe_mt") then
        return true
    else
        return false
    end
end

function load_ww_ggm()
    if (has("ber_er_manualoverride_off") or has("entrancerando_off")) and load_ww == "Glitter Gulch Mine" then
        return true
    elseif has("ber_er_manualoverride_on") and has("entrancerando_on") and has("wwe_gg") then
        return true
    else
        return false
    end
end

function load_ww_ww()
    if (has("ber_er_manualoverride_off") or has("entrancerando_off")) and load_ww == "Witchyworld" then
        return true
    elseif has("ber_er_manualoverride_on") and has("entrancerando_on") and has("wwe_ww") then
        return true
    else
        return false
    end
end

function load_ww_jrl()
    if (has("ber_er_manualoverride_off") or has("entrancerando_off")) and load_ww == "Jolly Roger's Lagoon - Town Center" then
        return true
    elseif has("ber_er_manualoverride_on") and has("entrancerando_on") and has("wwe_jr") then
        return true
    else
        return false
    end
end

function load_ww_tdl()
    if (has("ber_er_manualoverride_off") or has("entrancerando_off")) and load_ww == "Terrydactyland" then
        return true
    elseif has("ber_er_manualoverride_on") and has("entrancerando_on") and has("wwe_td") then
        return true
    else
        return false
    end
end

function load_ww_gi()
    if (has("ber_er_manualoverride_off") or has("entrancerando_off")) and load_ww == "Outside Grunty Industries" then
        return true
    elseif has("ber_er_manualoverride_on") and has("entrancerando_on") and has("wwe_gi") then
        return true
    else
        return false
    end
end

function load_ww_hfp()
    if (has("ber_er_manualoverride_off") or has("entrancerando_off")) and load_ww == "Hailfire Peaks" then
        return true
    elseif has("ber_er_manualoverride_on") and has("entrancerando_on") and has("wwe_hf") then
        return true
    else
        return false
    end
end

function load_ww_ccl()
    if (has("ber_er_manualoverride_off") or has("entrancerando_off")) and load_ww == "Cloud Cuckooland" then
        return true
    elseif has("ber_er_manualoverride_on") and has("entrancerando_on") and has("wwe_cc") then
        return true
    else
        return false
    end
end

function load_ww_ck()
    if (has("ber_er_manualoverride_off") or has("entrancerando_off")) and load_ww == "Cauldron Keep" then
        return true
    elseif has("ber_er_manualoverride_on") and has("entrancerando_on") and has("wwe_ck") then
        return true
    else
        return false
    end
end

function load_jrl_mt()
    if (has("ber_er_manualoverride_off") or has("entrancerando_off")) and load_jrl == "Mayahem Temple" then
        return true
    elseif has("ber_er_manualoverride_on") and has("entrancerando_on") and has("jre_mt") then
        return true
    else
        return false
    end
end

function load_jrl_ggm()
    if (has("ber_er_manualoverride_off") or has("entrancerando_off")) and load_jrl == "Glitter Gulch Mine" then
        return true
    elseif has("ber_er_manualoverride_on") and has("entrancerando_on") and has("jre_gg") then
        return true
    else
        return false
    end
end

function load_jrl_ww()
    if (has("ber_er_manualoverride_off") or has("entrancerando_off")) and load_jrl == "Witchyworld" then
        return true
    elseif has("ber_er_manualoverride_on") and has("entrancerando_on") and has("jre_ww") then
        return true
    else
        return false
    end
end

function load_jrl_jrl()
    if (has("ber_er_manualoverride_off") or has("entrancerando_off")) and load_jrl == "Jolly Roger's Lagoon - Town Center" then
        return true
    elseif has("ber_er_manualoverride_on") and has("entrancerando_on") and has("jre_jr") then
        return true
    else
        return false
    end
end

function load_jrl_tdl()
    if (has("ber_er_manualoverride_off") or has("entrancerando_off")) and load_jrl == "Terrydactyland" then
        return true
    elseif has("ber_er_manualoverride_on") and has("entrancerando_on") and has("jre_td") then
        return true
    else
        return false
    end
end

function load_jrl_gi()
    if (has("ber_er_manualoverride_off") or has("entrancerando_off")) and load_jrl == "Outside Grunty Industries" then
        return true
    elseif has("ber_er_manualoverride_on") and has("entrancerando_on") and has("jre_gi") then
        return true
    else
        return false
    end
end

function load_jrl_hfp()
    if (has("ber_er_manualoverride_off") or has("entrancerando_off")) and load_jrl == "Hailfire Peaks" then
        return true
    elseif has("ber_er_manualoverride_on") and has("entrancerando_on") and has("jre_hf") then
        return true
    else
        return false
    end
end

function load_jrl_ccl()
    if (has("ber_er_manualoverride_off") or has("entrancerando_off")) and load_jrl == "Cloud Cuckooland" then
        return true
    elseif has("ber_er_manualoverride_on") and has("entrancerando_on") and has("jre_cc") then
        return true
    else
        return false
    end
end

function load_jrl_ck()
    if (has("ber_er_manualoverride_off") or has("entrancerando_off")) and load_jrl == "Cauldron Keep" then
        return true
    elseif has("ber_er_manualoverride_on") and has("entrancerando_on") and has("jre_ck") then
        return true
    else
        return false
    end
end

function load_hfp_mt()
    if (has("ber_er_manualoverride_off") or has("entrancerando_off")) and load_hfp == "Mayahem Temple" then
        return true
    elseif has("ber_er_manualoverride_on") and has("entrancerando_on") and has("hfe_mt") then
        return true
    else
        return false
    end
end

function load_hfp_ggm()
    if (has("ber_er_manualoverride_off") or has("entrancerando_off")) and load_hfp == "Glitter Gulch Mine" then
        return true
    elseif has("ber_er_manualoverride_on") and has("entrancerando_on") and has("hfe_gg") then
        return true
    else
        return false
    end
end

function load_hfp_ww()
    if (has("ber_er_manualoverride_off") or has("entrancerando_off")) and load_hfp == "Witchyworld" then
        return true
    elseif has("ber_er_manualoverride_on") and has("entrancerando_on") and has("hfe_ww") then
        return true
    else
        return false
    end
end

function load_hfp_jrl()
    if (has("ber_er_manualoverride_off") or has("entrancerando_off")) and load_hfp == "Jolly Roger's Lagoon - Town Center" then
        return true
    elseif has("ber_er_manualoverride_on") and has("entrancerando_on") and has("hfe_jr") then
        return true
    else
        return false
    end
end

function load_hfp_tdl()
    if (has("ber_er_manualoverride_off") or has("entrancerando_off")) and load_hfp == "Terrydactyland" then
        return true
    elseif has("ber_er_manualoverride_on") and has("entrancerando_on") and has("hfe_td") then
        return true
    else
        return false
    end
end

function load_hfp_gi()
    if (has("ber_er_manualoverride_off") or has("entrancerando_off")) and load_hfp == "Outside Grunty Industries" then
        return true
    elseif has("ber_er_manualoverride_on") and has("entrancerando_on") and has("hfe_gi") then
        return true
    else
        return false
    end
end

function load_hfp_hfp()
    if (has("ber_er_manualoverride_off") or has("entrancerando_off")) and load_hfp == "Hailfire Peaks" then
        return true
    elseif has("ber_er_manualoverride_on") and has("entrancerando_on") and has("hfe_hf") then
        return true
    else
        return false
    end
end

function load_hfp_ccl()
    if (has("ber_er_manualoverride_off") or has("entrancerando_off")) and load_hfp == "Cloud Cuckooland" then
        return true
    elseif has("ber_er_manualoverride_on") and has("entrancerando_on") and has("hfe_cc") then
        return true
    else
        return false
    end
end

function load_hfp_ck()
    if (has("ber_er_manualoverride_off") or has("entrancerando_off")) and load_hfp == "Cauldron Keep" then
        return true
    elseif has("ber_er_manualoverride_on") and has("entrancerando_on") and has("hfe_ck") then
        return true
    else
        return false
    end
end

function load_tdl_mt()
    if (has("ber_er_manualoverride_off") or has("entrancerando_off")) and load_tdl == "Mayahem Temple" then
        return true
    elseif has("ber_er_manualoverride_on") and has("entrancerando_on") and has("tde_mt") then
        return true
    else
        return false
    end
end

function load_tdl_ggm()
    if (has("ber_er_manualoverride_off") or has("entrancerando_off")) and load_tdl == "Glitter Gulch Mine" then
        return true
    elseif has("ber_er_manualoverride_on") and has("entrancerando_on") and has("tde_gg") then
        return true
    else
        return false
    end
end

function load_tdl_ww()
    if (has("ber_er_manualoverride_off") or has("entrancerando_off")) and load_tdl == "Witchyworld" then
        return true
    elseif has("ber_er_manualoverride_on") and has("entrancerando_on") and has("tde_ww") then
        return true
    else
        return false
    end
end

function load_tdl_jrl()
    if (has("ber_er_manualoverride_off") or has("entrancerando_off")) and load_tdl == "Jolly Roger's Lagoon - Town Center" then
        return true
    elseif has("ber_er_manualoverride_on") and has("entrancerando_on") and has("tde_jr") then
        return true
    else
        return false
    end
end

function load_tdl_tdl()
    if (has("ber_er_manualoverride_off") or has("entrancerando_off")) and load_tdl == "Terrydactyland" then
        return true
    elseif has("ber_er_manualoverride_on") and has("entrancerando_on") and has("tde_td") then
        return true
    else
        return false
    end
end

function load_tdl_gi()
    if (has("ber_er_manualoverride_off") or has("entrancerando_off")) and load_tdl == "Outside Grunty Industries" then
        return true
    elseif has("ber_er_manualoverride_on") and has("entrancerando_on") and has("tde_gi") then
        return true
    else
        return false
    end
end

function load_tdl_hfp()
    if (has("ber_er_manualoverride_off") or has("entrancerando_off")) and load_tdl == "Hailfire Peaks" then
        return true
    elseif has("ber_er_manualoverride_on") and has("entrancerando_on") and has("tde_hf") then
        return true
    else
        return false
    end
end

function load_tdl_ccl()
    if (has("ber_er_manualoverride_off") or has("entrancerando_off")) and load_tdl == "Cloud Cuckooland" then
        return true
    elseif has("ber_er_manualoverride_on") and has("entrancerando_on") and has("tde_cc") then
        return true
    else
        return false
    end
end

function load_tdl_ck()
    if (has("ber_er_manualoverride_off") or has("entrancerando_off")) and load_tdl == "Cauldron Keep" then
        return true
    elseif has("ber_er_manualoverride_on") and has("entrancerando_on") and has("tde_ck") then
        return true
    else
        return false
    end
end

function load_ccl_mt()
    if (has("ber_er_manualoverride_off") or has("entrancerando_off")) and load_ccl == "Mayahem Temple" then
        return true
    elseif has("ber_er_manualoverride_on") and has("entrancerando_on") and has("cce_mt") then
        return true
    else
        return false
    end
end

function load_ccl_ggm()
    if (has("ber_er_manualoverride_off") or has("entrancerando_off")) and load_ccl == "Glitter Gulch Mine" then
        return true
    elseif has("ber_er_manualoverride_on") and has("entrancerando_on") and has("cce_gg") then
        return true
    else
        return false
    end
end

function load_ccl_ww()
    if (has("ber_er_manualoverride_off") or has("entrancerando_off")) and load_ccl == "Witchyworld" then
        return true
    elseif has("ber_er_manualoverride_on") and has("entrancerando_on") and has("cce_ww") then
        return true
    else
        return false
    end
end

function load_ccl_jrl()
    if (has("ber_er_manualoverride_off") or has("entrancerando_off")) and load_ccl == "Jolly Roger's Lagoon - Town Center" then
        return true
    elseif has("ber_er_manualoverride_on") and has("entrancerando_on") and has("cce_jr") then
        return true
    else
        return false
    end
end

function load_ccl_tdl()
    if (has("ber_er_manualoverride_off") or has("entrancerando_off")) and load_ccl == "Terrydactyland" then
        return true
    elseif has("ber_er_manualoverride_on") and has("entrancerando_on") and has("cce_td") then
        return true
    else
        return false
    end
end

function load_ccl_gi()
    if (has("ber_er_manualoverride_off") or has("entrancerando_off")) and load_ccl == "Outside Grunty Industries" then
        return true
    elseif has("ber_er_manualoverride_on") and has("entrancerando_on") and has("cce_gi") then
        return true
    else
        return false
    end
end

function load_ccl_hfp()
    if (has("ber_er_manualoverride_off") or has("entrancerando_off")) and load_ccl == "Hailfire Peaks" then
        return true
    elseif has("ber_er_manualoverride_on") and has("entrancerando_on") and has("cce_hf") then
        return true
    else
        return false
    end
end

function load_ccl_ccl()
    if (has("ber_er_manualoverride_off") or has("entrancerando_off")) and load_ccl == "Cloud Cuckooland" then
        return true
    elseif has("ber_er_manualoverride_on") and has("entrancerando_on") and has("cce_cc") then
        return true
    else
        return false
    end
end

function load_ccl_ck()
    if (has("ber_er_manualoverride_off") or has("entrancerando_off")) and load_ccl == "Cauldron Keep" then
        return true
    elseif has("ber_er_manualoverride_on") and has("entrancerando_on") and has("cce_ck") then
        return true
    else
        return false
    end
end

function load_gi_mt()
    if (has("ber_er_manualoverride_off") or has("entrancerando_off")) and load_gi == "Mayahem Temple" then
        return true
    elseif has("ber_er_manualoverride_on") and has("entrancerando_on") and has("gie_mt") then
        return true
    else
        return false
    end
end

function load_gi_ggm()
    if (has("ber_er_manualoverride_off") or has("entrancerando_off")) and load_gi == "Glitter Gulch Mine" then
        return true
    elseif has("ber_er_manualoverride_on") and has("entrancerando_on") and has("gie_gg") then
        return true
    else
        return false
    end
end

function load_gi_ww()
    if (has("ber_er_manualoverride_off") or has("entrancerando_off")) and load_gi == "Witchyworld" then
        return true
    elseif has("ber_er_manualoverride_on") and has("entrancerando_on") and has("gie_ww") then
        return true
    else
        return false
    end
end

function load_gi_jrl()
    if (has("ber_er_manualoverride_off") or has("entrancerando_off")) and load_gi == "Jolly Roger's Lagoon - Town Center" then
        return true
    elseif has("ber_er_manualoverride_on") and has("entrancerando_on") and has("gie_jr") then
        return true
    else
        return false
    end
end

function load_gi_tdl()
    if (has("ber_er_manualoverride_off") or has("entrancerando_off")) and load_gi == "Terrydactyland" then
        return true
    elseif has("ber_er_manualoverride_on") and has("entrancerando_on") and has("gie_td") then
        return true
    else
        return false
    end
end

function load_gi_gi()
    if (has("ber_er_manualoverride_off") or has("entrancerando_off")) and load_gi == "Outside Grunty Industries" then
        return true
    elseif has("ber_er_manualoverride_on") and has("entrancerando_on") and has("gie_gi") then
        return true
    else
        return false
    end
end

function load_gi_hfp()
    if (has("ber_er_manualoverride_off") or has("entrancerando_off")) and load_gi == "Hailfire Peaks" then
        return true
    elseif has("ber_er_manualoverride_on") and has("entrancerando_on") and has("gie_hf") then
        return true
    else
        return false
    end
end

function load_gi_ccl()
    if (has("ber_er_manualoverride_off") or has("entrancerando_off")) and load_gi == "Cloud Cuckooland" then
        return true
    elseif has("ber_er_manualoverride_on") and has("entrancerando_on") and has("gie_cc") then
        return true
    else
        return false
    end
end

function load_gi_ck()
    if (has("ber_er_manualoverride_off") or has("entrancerando_off")) and load_gi == "Cauldron Keep" then
        return true
    elseif has("ber_er_manualoverride_on") and has("entrancerando_on") and has("gie_ck") then
        return true
    else
        return false
    end
end

function load_ck_mt()
    if (has("ber_er_manualoverride_off") or has("entrancerando_off")) and load_ck == "Mayahem Temple" then
        return true
    elseif has("ber_er_manualoverride_on") and has("entrancerando_on") and has("cke_mt") then
        return true
    else
        return false
    end
end

function load_ck_ggm()
    if (has("ber_er_manualoverride_off") or has("entrancerando_off")) and load_ck == "Glitter Gulch Mine" then
        return true
    elseif has("ber_er_manualoverride_on") and has("entrancerando_on") and has("cke_gg") then
        return true
    else
        return false
    end
end

function load_ck_ww()
    if (has("ber_er_manualoverride_off") or has("entrancerando_off")) and load_ck == "Witchyworld" then
        return true
    elseif has("ber_er_manualoverride_on") and has("entrancerando_on") and has("cke_ww") then
        return true
    else
        return false
    end
end

function load_ck_jrl()
    if (has("ber_er_manualoverride_off") or has("entrancerando_off")) and load_ck == "Jolly Roger's Lagoon - Town Center" then
        return true
    elseif has("ber_er_manualoverride_on") and has("entrancerando_on") and has("cke_jr") then
        return true
    else
        return false
    end
end

function load_ck_tdl()
    if (has("ber_er_manualoverride_off") or has("entrancerando_off")) and load_ck == "Terrydactyland" then
        return true
    elseif has("ber_er_manualoverride_on") and has("entrancerando_on") and has("cke_td") then
        return true
    else
        return false
    end
end

function load_ck_gi()
    if (has("ber_er_manualoverride_off") or has("entrancerando_off")) and load_ck == "Outside Grunty Industries" then
        return true
    elseif has("ber_er_manualoverride_on") and has("entrancerando_on") and has("cke_gi") then
        return true
    else
        return false
    end
end

function load_ck_hfp()
    if (has("ber_er_manualoverride_off") or has("entrancerando_off")) and load_ck == "Hailfire Peaks" then
        return true
    elseif has("ber_er_manualoverride_on") and has("entrancerando_on") and has("cke_hf") then
        return true
    else
        return false
    end
end

function load_ck_ccl()
    if (has("ber_er_manualoverride_off") or has("entrancerando_off")) and load_ck == "Cloud Cuckooland" then
        return true
    elseif has("ber_er_manualoverride_on") and has("entrancerando_on") and has("cke_cc") then
        return true
    else
        return false
    end
end

function load_ck_ck()
    if (has("ber_er_manualoverride_off") or has("entrancerando_off")) and load_ck == "Cauldron Keep" then
        return true
    elseif has("ber_er_manualoverride_on") and has("entrancerando_on") and has("cke_ck") then
        return true
    else
        return false
    end
end

-- Boss Loading Zone Rules

function load_boss_mt_mt()
    if (has("ber_er_manualoverride_off") or has("randomizebossentrances_off")) and load_boss_mt == "Targitzan's Really Sacred Chamber" then
        return true
    elseif has("ber_er_manualoverride_on") and has("randomizebossentrances_on") and has("mtb_mt") then
        return true
    else
        return false
    end
end

function load_boss_mt_ggm()
    if (has("ber_er_manualoverride_off") or has("randomizebossentrances_off")) and load_boss_mt == "Inside Chuffy's Boiler" then
        return true
    elseif has("ber_er_manualoverride_on") and has("randomizebossentrances_on") and has("mtb_gg") then
        return true
    else
        return false
    end
end

function load_boss_mt_ww()
    if (has("ber_er_manualoverride_off") or has("randomizebossentrances_off")) and load_boss_mt == "Big Top Interior" then
        return true
    elseif has("ber_er_manualoverride_on") and has("randomizebossentrances_on") and has("mtb_ww") then
        return true
    else
        return false
    end
end

function load_boss_mt_jrl()
    if (has("ber_er_manualoverride_off") or has("randomizebossentrances_off")) and load_boss_mt == "Davy Jones' Locker" then
        return true
    elseif has("ber_er_manualoverride_on") and has("randomizebossentrances_on") and has("mtb_jr") then
        return true
    else
        return false
    end
end

function load_boss_mt_tdl()
    if (has("ber_er_manualoverride_off") or has("randomizebossentrances_off")) and load_boss_mt == "Terry's Nest" then
        return true
    elseif has("ber_er_manualoverride_on") and has("randomizebossentrances_on") and has("mtb_td") then
        return true
    else
        return false
    end
end

function load_boss_mt_gi()
    if (has("ber_er_manualoverride_off") or has("randomizebossentrances_off")) and load_boss_mt == "Repair Depot" then
        return true
    elseif has("ber_er_manualoverride_on") and has("randomizebossentrances_on") and has("mtb_gi") then
        return true
    else
        return false
    end
end

function load_boss_mt_hfpl()
    if (has("ber_er_manualoverride_off") or has("randomizebossentrances_off")) and load_boss_mt == "Chilli Billi Crater" then
        return true
    elseif has("ber_er_manualoverride_on") and has("randomizebossentrances_on") and has("mtb_hl") then
        return true
    else
        return false
    end
end

function load_boss_mt_hfpi()
    if (has("ber_er_manualoverride_off") or has("randomizebossentrances_off")) and load_boss_mt == "Chilli Willy Crater" then
        return true
    elseif has("ber_er_manualoverride_on") and has("randomizebossentrances_on") and has("mtb_hi") then
        return true
    else
        return false
    end
end

function load_boss_mt_ccl()
    if (has("ber_er_manualoverride_off") or has("randomizebossentrances_off")) and load_boss_mt == "Mingy Jongo Skull" then
        return true
    elseif has("ber_er_manualoverride_on") and has("randomizebossentrances_on") and has("mtb_cc") then
        return true
    else
        return false
    end
end

function load_boss_ggm_mt()
    if (has("ber_er_manualoverride_off") or has("randomizebossentrances_off")) and load_boss_ggm == "Targitzan's Really Sacred Chamber" then
        return true
    elseif has("ber_er_manualoverride_on") and has("randomizebossentrances_on") and has("ggb_mt") then
        return true
    else
        return false
    end
end

function load_boss_ggm_ggm()
    if (has("ber_er_manualoverride_off") or has("randomizebossentrances_off")) and load_boss_ggm == "Inside Chuffy's Boiler" then
        return true
    elseif has("ber_er_manualoverride_on") and has("randomizebossentrances_on") and has("ggb_gg") then
        return true
    else
        return false
    end
end

function load_boss_ggm_ww()
    if (has("ber_er_manualoverride_off") or has("randomizebossentrances_off")) and load_boss_ggm == "Big Top Interior" then
        return true
    elseif has("ber_er_manualoverride_on") and has("randomizebossentrances_on") and has("ggb_ww") then
        return true
    else
        return false
    end
end

function load_boss_ggm_jrl()
    if (has("ber_er_manualoverride_off") or has("randomizebossentrances_off")) and load_boss_ggm == "Davy Jones' Locker" then
        return true
    elseif has("ber_er_manualoverride_on") and has("randomizebossentrances_on") and has("ggb_jr") then
        return true
    else
        return false
    end
end

function load_boss_ggm_tdl()
    if (has("ber_er_manualoverride_off") or has("randomizebossentrances_off")) and load_boss_ggm == "Terry's Nest" then
        return true
    elseif has("ber_er_manualoverride_on") and has("randomizebossentrances_on") and has("ggb_td") then
        return true
    else
        return false
    end
end

function load_boss_ggm_gi()
    if (has("ber_er_manualoverride_off") or has("randomizebossentrances_off")) and load_boss_ggm == "Repair Depot" then
        return true
    elseif has("ber_er_manualoverride_on") and has("randomizebossentrances_on") and has("ggb_gi") then
        return true
    else
        return false
    end
end

function load_boss_ggm_hfpl()
    if (has("ber_er_manualoverride_off") or has("randomizebossentrances_off")) and load_boss_ggm == "Chilli Billi Crater" then
        return true
    elseif has("ber_er_manualoverride_on") and has("randomizebossentrances_on") and has("ggb_hl") then
        return true
    else
        return false
    end
end

function load_boss_ggm_hfpi()
    if (has("ber_er_manualoverride_off") or has("randomizebossentrances_off")) and load_boss_ggm == "Chilli Willy Crater" then
        return true
    elseif has("ber_er_manualoverride_on") and has("randomizebossentrances_on") and has("ggb_hi") then
        return true
    else
        return false
    end
end

function load_boss_ggm_ccl()
    if (has("ber_er_manualoverride_off") or has("randomizebossentrances_off")) and load_boss_ggm == "Mingy Jongo Skull" then
        return true
    elseif has("ber_er_manualoverride_on") and has("randomizebossentrances_on") and has("ggb_cc") then
        return true
    else
        return false
    end
end

function load_boss_ww_mt()
    if (has("ber_er_manualoverride_off") or has("randomizebossentrances_off")) and load_boss_ww == "Targitzan's Really Sacred Chamber" then
        return true
    elseif has("ber_er_manualoverride_on") and has("randomizebossentrances_on") and has("wwb_mt") then
        return true
    else
        return false
    end
end

function load_boss_ww_ggm()
    if (has("ber_er_manualoverride_off") or has("randomizebossentrances_off")) and load_boss_ww == "Inside Chuffy's Boiler" then
        return true
    elseif has("ber_er_manualoverride_on") and has("randomizebossentrances_on") and has("wwb_gg") then
        return true
    else
        return false
    end
end

function load_boss_ww_ww()
    if (has("ber_er_manualoverride_off") or has("randomizebossentrances_off")) and load_boss_ww == "Big Top Interior" then
        return true
    elseif has("ber_er_manualoverride_on") and has("randomizebossentrances_on") and has("wwb_ww") then
        return true
    else
        return false
    end
end

function load_boss_ww_jrl()
    if (has("ber_er_manualoverride_off") or has("randomizebossentrances_off")) and load_boss_ww == "Davy Jones' Locker" then
        return true
    elseif has("ber_er_manualoverride_on") and has("randomizebossentrances_on") and has("wwb_jr") then
        return true
    else
        return false
    end
end

function load_boss_ww_tdl()
    if (has("ber_er_manualoverride_off") or has("randomizebossentrances_off")) and load_boss_ww == "Terry's Nest" then
        return true
    elseif has("ber_er_manualoverride_on") and has("randomizebossentrances_on") and has("wwb_td") then
        return true
    else
        return false
    end
end

function load_boss_ww_gi()
    if (has("ber_er_manualoverride_off") or has("randomizebossentrances_off")) and load_boss_ww == "Repair Depot" then
        return true
    elseif has("ber_er_manualoverride_on") and has("randomizebossentrances_on") and has("wwb_gi") then
        return true
    else
        return false
    end
end

function load_boss_ww_hfpl()
    if (has("ber_er_manualoverride_off") or has("randomizebossentrances_off")) and load_boss_ww == "Chilli Billi Crater" then
        return true
    elseif has("ber_er_manualoverride_on") and has("randomizebossentrances_on") and has("wwb_hl") then
        return true
    else
        return false
    end
end

function load_boss_ww_hfpi()
    if (has("ber_er_manualoverride_off") or has("randomizebossentrances_off")) and load_boss_ww == "Chilli Willy Crater" then
        return true
    elseif has("ber_er_manualoverride_on") and has("randomizebossentrances_on") and has("wwb_hi") then
        return true
    else
        return false
    end
end

function load_boss_ww_ccl()
    if (has("ber_er_manualoverride_off") or has("randomizebossentrances_off")) and load_boss_ww == "Mingy Jongo Skull" then
        return true
    elseif has("ber_er_manualoverride_on") and has("randomizebossentrances_on") and has("wwb_cc") then
        return true
    else
        return false
    end
end

function load_boss_jrl_mt()
    if (has("ber_er_manualoverride_off") or has("randomizebossentrances_off")) and load_boss_jrl == "Targitzan's Really Sacred Chamber" then
        return true
    elseif has("ber_er_manualoverride_on") and has("randomizebossentrances_on") and has("jrb_mt") then
        return true
    else
        return false
    end
end

function load_boss_jrl_ggm()
    if (has("ber_er_manualoverride_off") or has("randomizebossentrances_off")) and load_boss_jrl == "Inside Chuffy's Boiler" then
        return true
    elseif has("ber_er_manualoverride_on") and has("randomizebossentrances_on") and has("jrb_gg") then
        return true
    else
        return false
    end
end

function load_boss_jrl_ww()
    if (has("ber_er_manualoverride_off") or has("randomizebossentrances_off")) and load_boss_jrl == "Big Top Interior" then
        return true
    elseif has("ber_er_manualoverride_on") and has("randomizebossentrances_on") and has("jrb_ww") then
        return true
    else
        return false
    end
end

function load_boss_jrl_jrl()
    if (has("ber_er_manualoverride_off") or has("randomizebossentrances_off")) and load_boss_jrl == "Davy Jones' Locker" then
        return true
    elseif has("ber_er_manualoverride_on") and has("randomizebossentrances_on") and has("jrb_jr") then
        return true
    else
        return false
    end
end

function load_boss_jrl_tdl()
    if (has("ber_er_manualoverride_off") or has("randomizebossentrances_off")) and load_boss_jrl == "Terry's Nest" then
        return true
    elseif has("ber_er_manualoverride_on") and has("randomizebossentrances_on") and has("jrb_td") then
        return true
    else
        return false
    end
end

function load_boss_jrl_gi()
    if (has("ber_er_manualoverride_off") or has("randomizebossentrances_off")) and load_boss_jrl == "Repair Depot" then
        return true
    elseif has("ber_er_manualoverride_on") and has("randomizebossentrances_on") and has("jrb_gi") then
        return true
    else
        return false
    end
end

function load_boss_jrl_hfpl()
    if (has("ber_er_manualoverride_off") or has("randomizebossentrances_off")) and load_boss_jrl == "Chilli Billi Crater" then
        return true
    elseif has("ber_er_manualoverride_on") and has("randomizebossentrances_on") and has("jrb_hl") then
        return true
    else
        return false
    end
end

function load_boss_jrl_hfpi()
    if (has("ber_er_manualoverride_off") or has("randomizebossentrances_off")) and load_boss_jrl == "Chilli Willy Crater" then
        return true
    elseif has("ber_er_manualoverride_on") and has("randomizebossentrances_on") and has("jrb_hi") then
        return true
    else
        return false
    end
end

function load_boss_jrl_ccl()
    if (has("ber_er_manualoverride_off") or has("randomizebossentrances_off")) and load_boss_jrl == "Mingy Jongo Skull" then
        return true
    elseif has("ber_er_manualoverride_on") and has("randomizebossentrances_on") and has("jrb_cc") then
        return true
    else
        return false
    end
end

function load_boss_hfpl_mt()
    if (has("ber_er_manualoverride_off") or has("randomizebossentrances_off")) and load_boss_hfpl == "Targitzan's Really Sacred Chamber" then
        return true
    elseif has("ber_er_manualoverride_on") and has("randomizebossentrances_on") and has("hlb_mt") then
        return true
    else
        return false
    end
end

function load_boss_hfpl_ggm()
    if (has("ber_er_manualoverride_off") or has("randomizebossentrances_off")) and load_boss_hfpl == "Inside Chuffy's Boiler" then
        return true
    elseif has("ber_er_manualoverride_on") and has("randomizebossentrances_on") and has("hlb_gg") then
        return true
    else
        return false
    end
end

function load_boss_hfpl_ww()
    if (has("ber_er_manualoverride_off") or has("randomizebossentrances_off")) and load_boss_hfpl == "Big Top Interior" then
        return true
    elseif has("ber_er_manualoverride_on") and has("randomizebossentrances_on") and has("hlb_ww") then
        return true
    else
        return false
    end
end

function load_boss_hfpl_jrl()
    if (has("ber_er_manualoverride_off") or has("randomizebossentrances_off")) and load_boss_hfpl == "Davy Jones' Locker" then
        return true
    elseif has("ber_er_manualoverride_on") and has("randomizebossentrances_on") and has("hlb_jr") then
        return true
    else
        return false
    end
end

function load_boss_hfpl_tdl()
    if (has("ber_er_manualoverride_off") or has("randomizebossentrances_off")) and load_boss_hfpl == "Terry's Nest" then
        return true
    elseif has("ber_er_manualoverride_on") and has("randomizebossentrances_on") and has("hlb_td") then
        return true
    else
        return false
    end
end

function load_boss_hfpl_gi()
    if (has("ber_er_manualoverride_off") or has("randomizebossentrances_off")) and load_boss_hfpl == "Repair Depot" then
        return true
    elseif has("ber_er_manualoverride_on") and has("randomizebossentrances_on") and has("hlb_gi") then
        return true
    else
        return false
    end
end

function load_boss_hfpl_hfpl()
    if (has("ber_er_manualoverride_off") or has("randomizebossentrances_off")) and load_boss_hfpl == "Chilli Billi Crater" then
        return true
    elseif has("ber_er_manualoverride_on") and has("randomizebossentrances_on") and has("hlb_hl") then
        return true
    else
        return false
    end
end

function load_boss_hfpl_hfpi()
    if (has("ber_er_manualoverride_off") or has("randomizebossentrances_off")) and load_boss_hfpl == "Chilli Willy Crater" then
        return true
    elseif has("ber_er_manualoverride_on") and has("randomizebossentrances_on") and has("hlb_hi") then
        return true
    else
        return false
    end
end

function load_boss_hfpl_ccl()
    if (has("ber_er_manualoverride_off") or has("randomizebossentrances_off")) and load_boss_hfpl == "Mingy Jongo Skull" then
        return true
    elseif has("ber_er_manualoverride_on") and has("randomizebossentrances_on") and has("hlb_cc") then
        return true
    else
        return false
    end
end

function load_boss_tdl_mt()
    if (has("ber_er_manualoverride_off") or has("randomizebossentrances_off")) and load_boss_tdl == "Targitzan's Really Sacred Chamber" then
        return true
    elseif has("ber_er_manualoverride_on") and has("randomizebossentrances_on") and has("tdb_mt") then
        return true
    else
        return false
    end
end

function load_boss_tdl_ggm()
    if (has("ber_er_manualoverride_off") or has("randomizebossentrances_off")) and load_boss_tdl == "Inside Chuffy's Boiler" then
        return true
    elseif has("ber_er_manualoverride_on") and has("randomizebossentrances_on") and has("tdb_gg") then
        return true
    else
        return false
    end
end

function load_boss_tdl_ww()
    if (has("ber_er_manualoverride_off") or has("randomizebossentrances_off")) and load_boss_tdl == "Big Top Interior" then
        return true
    elseif has("ber_er_manualoverride_on") and has("randomizebossentrances_on") and has("tdb_ww") then
        return true
    else
        return false
    end
end

function load_boss_tdl_jrl()
    if (has("ber_er_manualoverride_off") or has("randomizebossentrances_off")) and load_boss_tdl == "Davy Jones' Locker" then
        return true
    elseif has("ber_er_manualoverride_on") and has("randomizebossentrances_on") and has("tdb_jr") then
        return true
    else
        return false
    end
end

function load_boss_tdl_tdl()
    if (has("ber_er_manualoverride_off") or has("randomizebossentrances_off")) and load_boss_tdl == "Terry's Nest" then
        return true
    elseif has("ber_er_manualoverride_on") and has("randomizebossentrances_on") and has("tdb_td") then
        return true
    else
        return false
    end
end

function load_boss_tdl_gi()
    if (has("ber_er_manualoverride_off") or has("randomizebossentrances_off")) and load_boss_tdl == "Repair Depot" then
        return true
    elseif has("ber_er_manualoverride_on") and has("randomizebossentrances_on") and has("tdb_gi") then
        return true
    else
        return false
    end
end

function load_boss_tdl_hfpl()
    if (has("ber_er_manualoverride_off") or has("randomizebossentrances_off")) and load_boss_tdl == "Chilli Billi Crater" then
        return true
    elseif has("ber_er_manualoverride_on") and has("randomizebossentrances_on") and has("tdb_hl") then
        return true
    else
        return false
    end
end

function load_boss_tdl_hfpi()
    if (has("ber_er_manualoverride_off") or has("randomizebossentrances_off")) and load_boss_tdl == "Chilli Willy Crater" then
        return true
    elseif has("ber_er_manualoverride_on") and has("randomizebossentrances_on") and has("tdb_hi") then
        return true
    else
        return false
    end
end

function load_boss_tdl_ccl()
    if (has("ber_er_manualoverride_off") or has("randomizebossentrances_off")) and load_boss_tdl == "Mingy Jongo Skull" then
        return true
    elseif has("ber_er_manualoverride_on") and has("randomizebossentrances_on") and has("tdb_cc") then
        return true
    else
        return false
    end
end

function load_boss_hfpi_mt()
    if (has("ber_er_manualoverride_off") or has("randomizebossentrances_off")) and load_boss_hfpi == "Targitzan's Really Sacred Chamber" then
        return true
    elseif has("ber_er_manualoverride_on") and has("randomizebossentrances_on") and has("hib_mt") then
        return true
    else
        return false
    end
end

function load_boss_hfpi_ggm()
    if (has("ber_er_manualoverride_off") or has("randomizebossentrances_off")) and load_boss_hfpi == "Inside Chuffy's Boiler" then
        return true
    elseif has("ber_er_manualoverride_on") and has("randomizebossentrances_on") and has("hib_gg") then
        return true
    else
        return false
    end
end

function load_boss_hfpi_ww()
    if (has("ber_er_manualoverride_off") or has("randomizebossentrances_off")) and load_boss_hfpi == "Big Top Interior" then
        return true
    elseif has("ber_er_manualoverride_on") and has("randomizebossentrances_on") and has("hib_ww") then
        return true
    else
        return false
    end
end

function load_boss_hfpi_jrl()
    if (has("ber_er_manualoverride_off") or has("randomizebossentrances_off")) and load_boss_hfpi == "Davy Jones' Locker" then
        return true
    elseif has("ber_er_manualoverride_on") and has("randomizebossentrances_on") and has("hib_jr") then
        return true
    else
        return false
    end
end

function load_boss_hfpi_tdl()
    if (has("ber_er_manualoverride_off") or has("randomizebossentrances_off")) and load_boss_hfpi == "Terry's Nest" then
        return true
    elseif has("ber_er_manualoverride_on") and has("randomizebossentrances_on") and has("hib_td") then
        return true
    else
        return false
    end
end

function load_boss_hfpi_gi()
    if (has("ber_er_manualoverride_off") or has("randomizebossentrances_off")) and load_boss_hfpi == "Repair Depot" then
        return true
    elseif has("ber_er_manualoverride_on") and has("randomizebossentrances_on") and has("hib_gi") then
        return true
    else
        return false
    end
end

function load_boss_hfpi_hfpl()
    if (has("ber_er_manualoverride_off") or has("randomizebossentrances_off")) and load_boss_hfpi == "Chilli Billi Crater" then
        return true
    elseif has("ber_er_manualoverride_on") and has("randomizebossentrances_on") and has("hib_hl") then
        return true
    else
        return false
    end
end

function load_boss_hfpi_hfpi()
    if (has("ber_er_manualoverride_off") or has("randomizebossentrances_off")) and load_boss_hfpi == "Chilli Willy Crater" then
        return true
    elseif has("ber_er_manualoverride_on") and has("randomizebossentrances_on") and has("hib_hi") then
        return true
    else
        return false
    end
end

function load_boss_hfpi_ccl()
    if (has("ber_er_manualoverride_off") or has("randomizebossentrances_off")) and load_boss_hfpi == "Mingy Jongo Skull" then
        return true
    elseif has("ber_er_manualoverride_on") and has("randomizebossentrances_on") and has("hib_cc") then
        return true
    else
        return false
    end
end

function load_boss_gi_mt()
    if (has("ber_er_manualoverride_off") or has("randomizebossentrances_off")) and load_boss_gi == "Targitzan's Really Sacred Chamber" then
        return true
    elseif has("ber_er_manualoverride_on") and has("randomizebossentrances_on") and has("gib_mt") then
        return true
    else
        return false
    end
end

function load_boss_gi_ggm()
    if (has("ber_er_manualoverride_off") or has("randomizebossentrances_off")) and load_boss_gi == "Inside Chuffy's Boiler" then
        return true
    elseif has("ber_er_manualoverride_on") and has("randomizebossentrances_on") and has("gib_gg") then
        return true
    else
        return false
    end
end

function load_boss_gi_ww()
    if (has("ber_er_manualoverride_off") or has("randomizebossentrances_off")) and load_boss_gi == "Big Top Interior" then
        return true
    elseif has("ber_er_manualoverride_on") and has("randomizebossentrances_on") and has("gib_ww") then
        return true
    else
        return false
    end
end

function load_boss_gi_jrl()
    if (has("ber_er_manualoverride_off") or has("randomizebossentrances_off")) and load_boss_gi == "Davy Jones' Locker" then
        return true
    elseif has("ber_er_manualoverride_on") and has("randomizebossentrances_on") and has("gib_jr") then
        return true
    else
        return false
    end
end

function load_boss_gi_tdl()
    if (has("ber_er_manualoverride_off") or has("randomizebossentrances_off")) and load_boss_gi == "Terry's Nest" then
        return true
    elseif has("ber_er_manualoverride_on") and has("randomizebossentrances_on") and has("gib_td") then
        return true
    else
        return false
    end
end

function load_boss_gi_gi()
    if (has("ber_er_manualoverride_off") or has("randomizebossentrances_off")) and load_boss_gi == "Repair Depot" then
        return true
    elseif has("ber_er_manualoverride_on") and has("randomizebossentrances_on") and has("gib_gi") then
        return true
    else
        return false
    end
end

function load_boss_gi_hfpl()
    if (has("ber_er_manualoverride_off") or has("randomizebossentrances_off")) and load_boss_gi == "Chilli Billi Crater" then
        return true
    elseif has("ber_er_manualoverride_on") and has("randomizebossentrances_on") and has("gib_hl") then
        return true
    else
        return false
    end
end

function load_boss_gi_hfpi()
    if (has("ber_er_manualoverride_off") or has("randomizebossentrances_off")) and load_boss_gi == "Chilli Willy Crater" then
        return true
    elseif has("ber_er_manualoverride_on") and has("randomizebossentrances_on") and has("gib_hi") then
        return true
    else
        return false
    end
end

function load_boss_gi_ccl()
    if (has("ber_er_manualoverride_off") or has("randomizebossentrances_off")) and load_boss_gi == "Mingy Jongo Skull" then
        return true
    elseif has("ber_er_manualoverride_on") and has("randomizebossentrances_on") and has("gib_cc") then
        return true
    else
        return false
    end
end

function load_boss_ccl_mt()
    if (has("ber_er_manualoverride_off") or has("randomizebossentrances_off")) and load_boss_ccl == "Targitzan's Really Sacred Chamber" then
        return true
    elseif has("ber_er_manualoverride_on") and has("randomizebossentrances_on") and has("ccb_mt") then
        return true
    else
        return false
    end
end

function load_boss_ccl_ggm()
    if (has("ber_er_manualoverride_off") or has("randomizebossentrances_off")) and load_boss_ccl == "Inside Chuffy's Boiler" then
        return true
    elseif has("ber_er_manualoverride_on") and has("randomizebossentrances_on") and has("ccb_gg") then
        return true
    else
        return false
    end
end

function load_boss_ccl_ww()
    if (has("ber_er_manualoverride_off") or has("randomizebossentrances_off")) and load_boss_ccl == "Big Top Interior" then
        return true
    elseif has("ber_er_manualoverride_on") and has("randomizebossentrances_on") and has("ccb_ww") then
        return true
    else
        return false
    end
end

function load_boss_ccl_jrl()
    if (has("ber_er_manualoverride_off") or has("randomizebossentrances_off")) and load_boss_ccl == "Davy Jones' Locker" then
        return true
    elseif has("ber_er_manualoverride_on") and has("randomizebossentrances_on") and has("ccb_jr") then
        return true
    else
        return false
    end
end

function load_boss_ccl_tdl()
    if (has("ber_er_manualoverride_off") or has("randomizebossentrances_off")) and load_boss_ccl == "Terry's Nest" then
        return true
    elseif has("ber_er_manualoverride_on") and has("randomizebossentrances_on") and has("ccb_td") then
        return true
    else
        return false
    end
end

function load_boss_ccl_gi()
    if (has("ber_er_manualoverride_off") or has("randomizebossentrances_off")) and load_boss_ccl == "Repair Depot" then
        return true
    elseif has("ber_er_manualoverride_on") and has("randomizebossentrances_on") and has("ccb_gi") then
        return true
    else
        return false
    end
end

function load_boss_ccl_hfpl()
    if (has("ber_er_manualoverride_off") or has("randomizebossentrances_off")) and load_boss_ccl == "Chilli Billi Crater" then
        return true
    elseif has("ber_er_manualoverride_on") and has("randomizebossentrances_on") and has("ccb_hl") then
        return true
    else
        return false
    end
end

function load_boss_ccl_hfpi()
    if (has("ber_er_manualoverride_off") or has("randomizebossentrances_off")) and load_boss_ccl == "Chilli Willy Crater" then
        return true
    elseif has("ber_er_manualoverride_on") and has("randomizebossentrances_on") and has("ccb_hi") then
        return true
    else
        return false
    end
end

function load_boss_ccl_ccl()
    if (has("ber_er_manualoverride_off") or has("randomizebossentrances_off")) and load_boss_ccl == "Mingy Jongo Skull" then
        return true
    elseif has("ber_er_manualoverride_on") and has("randomizebossentrances_on") and has("ccb_cc") then
        return true
    else
        return false
    end
end

---------------------------------------- Mia's Notes to Readers

--[[
    Hello anyone who's here to read this! This poptracker pack
    is going to be pretty faithful to the original Regions.py
    and Rules.py code. In each function, I will begin with a
    commented-out block that contains the python code for the
    function in question, followed by my lua conversion of that
    function which accounts for possible sequence breaking.
    
    Importantly, what I consider sequence breaking is anything
    that is not currently in logic, but is still possible for
    the player to obtain with their current means. This has an
    incremental level so that players can customize on their
    poptracker what difficulty of sequence breaking aught to
    show up (plus a separate button for new tricks that aren't
    yet implemented into the rules, or some things that won't
    ever get implemented, eg. instant transform tricks).
    
    Important Credits: Ozone made the original Poptracker for
    this randomizer, and this would not have been possible had
    I not had his code to use as a base! So, a big thank you to
    Ozone for all of his hard work! And of course: a huge thank
    you to the entire Banjo-Tooie Archipelago dev team; without
    their hard work, we wouldn't be able to enjoy all of this!
    You all rock! I'm honored to be among you!
--]]



--------------- Code Overhaul Stuff

function convertLogic(logic, skip)
    -- Converts an integer value into an AccessibilityLevel based on your poptracker settings
    -- logic is the minimum difficulty you can complete a check, determined by the function calling this one
    -- some functions are not called by the json and thus we want the logic value back rather than an AccessibilityLevel
    
    if ( skip ) then
        return logic
    end

    if ( logic <= logictype.CurrentStage ) then
        return AccessibilityLevel.Normal -- this check is in logic
    elseif ( logic == 7 and has("shownewtricks_on") ) then
        return AccessibilityLevel.SequenceBreak -- the check is not in logic, but you can get it with a new trick that hasn't been added to any logic yet
    elseif ( sequenceBreakLogic.CurrentStage <= logictype.CurrentStage ) then
        return AccessibilityLevel.None -- the check is not in logic and sequence break visibility is off
    elseif ( logic <= sequenceBreakLogic.CurrentStage ) then
        return AccessibilityLevel.SequenceBreak -- the check is not in logic, but can be obtained by whatever difficulty of tricks we have our tracker set to see
    else
        return AccessibilityLevel.None -- the check is not in logic, and is either impossible or we don't have the tracker set to show tricks this high
    end
end


--------------- Basic Moves

----- Progressive Moves

function has_bregullBash()
    return has("grat") and has("bbash")
end

function has_beakBomb()
    return has("fpad") and has("bbomb")
end

function has_billDrill()
    return has("bbust") and has("bdrill")
end

----- Split Up Moves

function has_wingWhack()
    return has("splitup") and has("wwhack")
end

function has_legSpring()
    return has("splitup") and has("lspring")
end

function has_glide()
    return has("splitup") and has("glide")
end

function has_hatch()
    return has("splitup") and has("hatch")
end

function has_shackPack()
    return has("splitup") and has("shpack")
end

function has_snoozePack()
    return has("splitup") and has("snpack")
end

function has_taxiPack()
    return has("splitup") and has("taxpack")
end

function has_packWhack()
    return has("splitup") and has("packwh")
end

function has_sackPack()
    return has("splitup") and has("sapack")
end



--------------- Complex Moves

function can_reachSmallElevation()
    return has("fflip") or has("tjump") or has("ttrot")
end

function can_reachSlightlyElevatedLedge()
    return (has("fflip") or has("tjump") or (has("ttrot") and has("flutter"))) and has("ggrab")
end

function can_longJump()
    return has("ttrot") or (has("arat") or has("flutter"))
end

function can_longJumpToGripGrab()
    return has("ggrab") and (has("arat") or has("flutter"))
end

function can_veryLongJump()
    return (has("ttrot") and (has("flutter") or has("arat")) or (has("tjump") and has("roll") and has("flutter")))
end

function can_extremelyLongJump(skip)
    local logic = 99
    --[[        extremelyLongJump
    if self.world.options.logic_type == LogicType.option_intended:
        logic = False
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = False
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.talon_trot(state) and (self.flutter(state) or self.air_rat_a_tat_rap(state)) and self.beak_buster(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.talon_trot(state) and (self.flutter(state) or self.air_rat_a_tat_rap(state)) and self.beak_buster(state)
    --]]
    
    if ( has("ttrot") and has("bbust") and (has("flutter") or has("arat")) ) then
        logic = 2
    end
    
    return convertLogic(logic, skip)
end

function can_shootEggs(egg)
    if egg then
        return has(egg) and (has("eggaim") or has("eggshoot"))
    else
        return (has("begg") or has("feggs") or has("geggs") or has("ieggs") or has("ceggs")) and (has("eggaim") or has("eggshoot"))
    end
end

function has_linearEgg()
    return has("begg") or has("feggs") or has("geggs") or has("ieggs")
end

function can_shootLinearEggs()
    return (has("eggaim") or has("eggshoot")) and has_linearEgg()
end

function can_shootExplosiveEggs(skip)
    local logic = 99
    --[[        has_explosives
    if self.world.options.logic_type == LogicType.option_intended:
        return self.grenade_eggs(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        return self.grenade_eggs(state) or self.clockwork_eggs(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        return self.grenade_eggs(state) or self.clockwork_eggs(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        return self.grenade_eggs(state) or self.clockwork_eggs(state)
    --]]
    
    if ( can_shootEggs("geggs") ) then
        logic = 0
    elseif ( can_shootEggs("ceggs") ) then
        logic = 1
    end

    return convertLogic(logic, skip)
end

function can_clockworkShot()
    return has("eggaim") and has("ceggs")
end

function can_clockworkWarp()
    return has("eggaim") and has("ceggs") and has("eggshoot") and has("geggs")
end

function can_preciseClockworkWarp()
    return can_clockworkWarp() and has("ttrot")
end

function can_getDragonKazooie(skip)
    local logic = 99
    --[[        dragon_kazooie
    self.check_humba_magic(state, itemName.HUMBAIH) and state.can_reach_region(regionName.IOHPG, self.player) and self.ground_rat_a_tat_rap(state)
    --]]
    
    if ( has("humbaih") and has("grat") ) then
        local pgAccessibility = Tracker:FindObjectForCode("@Region: Pine Grove").AccessibilityLevel
    
        -- Normal Logic
        if ( pgAccessibility == AccessibilityLevel.Normal or pgAccessibility == AccessibilityLevel.Cleared ) then
            logic = 0
    
        -- Sequence Breaking
        elseif ( pgAccessibility > AccessibilityLevel.None ) then
            logic = logictype.CurrentStage + 1 -- was already converted once by the json
        end
    end
    
    return convertLogic(logic, skip)
end

function can_useFire(skip)
    local logic = 99
    --[[        has_fire
    self.fire_eggs(state) or self.dragon_kazooie(state)
    --]]
    
    if ( can_shootEggs("feggs") ) then
        logic = 0
    else
        logic = can_getDragonKazooie(true)
    end
    
    return convertLogic(logic, skip)
end

function can_groundAttack()
    return can_shootEggs() or has("bbarge") or has("roll") or has("arat") or has("grat") or has("bbust") or has("wwing")
end

function can_eggBarge()
    return (has("begg") or has("feggs") or has("ieggs")) and has"eggshoot" and has("bbarge")
end



--------------- Health Upgrades

function health_canGetFromHoneyB(num, skip)
    logic = 99
    --[[
    state.has(itemName.HONEY, self.player, <num>) and self.can_reach_honey_b(state)     -- <num> = {1, 4, 9, 16, 25} depending on which check
    --]]
    
    local honeyNeeded = 99
    if ( num < 1 or num > 5 ) then
        return convertLogic(99, skip) -- should never hit this, checks range from 1st to 5th
    elseif ( num == 1 ) then
        honeyNeeded = 1
    elseif ( num == 2 ) then
        honeyNeeded = 4
    elseif ( num == 3 ) then
        honeyNeeded = 9
    elseif ( num == 4 ) then
        honeyNeeded = 16
    elseif ( num == 5 ) then
        honeyNeeded = 25
    end
    
    if ( has("honey", honeyNeeded) ) then
        logic = access_PL_canReachHoneyB(true)
    end
    
    return convertLogic(logic, skip)
end

function health_canGet6(skip)
    logic = 99
    --[[
    if self.world.options.honeyb_rewards:
        return state.has(itemName.HEALTHUP, self.player, amt)
    else:
        return state.can_reach_region(regionName.IOHPL, self.player) and state.has(itemName.HONEY, self.player, 1) and self.talon_trot(state)
     --]]
     
    if ( (has("honeybcontent_rewards") or has("honeybcontent_both")) and has("maxhealth", 1) ) then
        logic = 0
    elseif ( has("honeybcontent_off") or has("honeybcontent_honeycombs") ) then
        local plAccessibility = Tracker:FindObjectForCode("@Region: Plateau").AccessibilityLevel
        
        if ( plAccessibility == AccessibilityLevel.Normal or plAccessibility == AccessibilityLevel.Cleared ) then
            logic = health_canGetFromHoneyB(1, true)
        elseif ( plAccessibility > AccessibilityLevel.None ) then
            logic = math.max(logictype.CurrentStage + 1, health_canGetFromHoneyB(1, true))
        end
    end
    
    return convertLogic(logic, skip)
end

function health_canGet7(skip)
    logic = 99
    --[[
    if self.world.options.honeyb_rewards:
        return state.has(itemName.HEALTHUP, self.player, amt)
    else:
        return state.can_reach_region(regionName.IOHPL, self.player) and state.has(itemName.HONEY, self.player, 4) and self.talon_trot(state)
     --]]
     
    if ( (has("honeybcontent_rewards") or has("honeybcontent_both")) and has("maxhealth", 2) ) then
        logic = 0
    elseif ( has("honeybcontent_off") or has("honeybcontent_honeycombs") ) then
        local plAccessibility = Tracker:FindObjectForCode("@Region: Plateau").AccessibilityLevel
        
        if ( plAccessibility == AccessibilityLevel.Normal or plAccessibility == AccessibilityLevel.Cleared ) then
            logic = health_canGetFromHoneyB(2, true)
        elseif ( plAccessibility > AccessibilityLevel.None ) then
            logic = math.max(logictype.CurrentStage + 1, health_canGetFromHoneyB(2, true))
        end
    end
    
    return convertLogic(logic, skip)
end

function health_canGet8(skip)
    logic = 99
    --[[
    if self.world.options.honeyb_rewards:
        return state.has(itemName.HEALTHUP, self.player, amt)
    else:
        return state.can_reach_region(regionName.IOHPL, self.player) and state.has(itemName.HONEY, self.player, 9) and self.talon_trot(state)
     --]]
     
    if ( (has("honeybcontent_rewards") or has("honeybcontent_both")) and has("maxhealth", 3) ) then
        logic = 0
    elseif ( has("honeybcontent_off") or has("honeybcontent_honeycombs") ) then
        local plAccessibility = Tracker:FindObjectForCode("@Region: Plateau").AccessibilityLevel
        
        if ( plAccessibility == AccessibilityLevel.Normal or plAccessibility == AccessibilityLevel.Cleared ) then
            logic = health_canGetFromHoneyB(3, true)
        elseif ( plAccessibility > AccessibilityLevel.None ) then
            logic = math.max(logictype.CurrentStage + 1, health_canGetFromHoneyB(3, true))
        end
    end
    
    return convertLogic(logic, skip)
end

function health_canGet9(skip)
    logic = 99
    --[[
    if self.world.options.honeyb_rewards:
        return state.has(itemName.HEALTHUP, self.player, amt)
    else:
        return state.can_reach_region(regionName.IOHPL, self.player) and state.has(itemName.HONEY, self.player, 16) and self.talon_trot(state)
     --]]
     
    if ( (has("honeybcontent_rewards") or has("honeybcontent_both")) and has("maxhealth", 4) ) then
        logic = 0
    elseif ( has("honeybcontent_off") or has("honeybcontent_honeycombs") ) then
        local plAccessibility = Tracker:FindObjectForCode("@Region: Plateau").AccessibilityLevel
        
        if ( plAccessibility == AccessibilityLevel.Normal or plAccessibility == AccessibilityLevel.Cleared ) then
            logic = health_canGetFromHoneyB(4, true)
        elseif ( plAccessibility > AccessibilityLevel.None ) then
            logic = math.max(logictype.CurrentStage + 1, health_canGetFromHoneyB(4, true))
        end
    end
    
    return convertLogic(logic, skip)
end

function health_canGet10(skip)
    logic = 99
    --[[
    if self.world.options.honeyb_rewards:
        return state.has(itemName.HEALTHUP, self.player, amt)
    else:
        return state.can_reach_region(regionName.IOHPL, self.player) and state.has(itemName.HONEY, self.player, 25) and self.talon_trot(state)
     --]]
     
    if ( (has("honeybcontent_rewards") or has("honeybcontent_both")) and has("maxhealth", 5) ) then
        logic = 0
    elseif ( has("honeybcontent_off") or has("honeybcontent_honeycombs") ) then
        local plAccessibility = Tracker:FindObjectForCode("@Region: Plateau").AccessibilityLevel
        
        if ( plAccessibility == AccessibilityLevel.Normal or plAccessibility == AccessibilityLevel.Cleared ) then
            logic = health_canGetFromHoneyB(5, true)
        elseif ( plAccessibility > AccessibilityLevel.None ) then
            logic = math.max(logictype.CurrentStage + 1, health_canGetFromHoneyB(5, true))
        end
    end
    
    return convertLogic(logic, skip)
end

function health_honeyBCheck1(skip)
    return health_canGetFromHoneyB(1)
end
function health_honeyBCheck2(skip)
    return health_canGetFromHoneyB(2)
end
function health_honeyBCheck3(skip)
    return health_canGetFromHoneyB(3)
end
function health_honeyBCheck4(skip)
    return health_canGetFromHoneyB(4)
end
function health_honeyBCheck5(skip)
    return health_canGetFromHoneyB(5)
end



---------------------------------------- 

--[[

Mia's Notes to Self:

list of moves/items that cannot under any circumstances be used without other moves/items:
- bill drill cannot be used without beak buster
- beak bayonet cannot be used without breegull blaster
- beak bomb cannot be used without flight pad
- breegull bash cannot be used without ground rat
- baby t-rex roar cannot be used without humba t-rex
- all split up moves cannot be used without split up
- all eggs cannot be used without either egg aim, egg shoot, airborne egg aim, or sub-aqua egg aim
- shock jump pad cannot be used without tall jump
- dragon kazooie: flame cannot be used without ground rat, or if solo, wing whack. infinite fire eggs cannot be used without fire eggs

--]]

--[[

Mia's List of Known Bugs in the AP Logic:

- [Glitter Gulch Mine - Anything that requires small elevation] There are a lot of checks that require small elevation, but the function for that does not account for smuggling talon trot (this includes entering Chuffy!)
- [Glitter Gulch Mine - Mumbo anything] Checks for small elevation but does not account for the fact that you can smuggle talon trot for that elevation on any difficulty
- [Terrydactyland - Taxi Pack Silo] erroneously has tall jump outside of the function brackets, accidentally making all tricks require it instead of only some
- [Grunty Industries - Connector between outside back and floor 4] You don't need tall jump to make the jumps if you have arat
- [Grunty Industries - egg nests by floor 4 fire escape] You can collect them with just arat
- [Hailfire Peaks - Treble] you can get it with clockworks instead of grenade eggs for the clawbts strategy
- [Hailfire Peaks - Stomping Plains Jiggy] you don't need tall jump if you have pack whack

--]]