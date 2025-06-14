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

function totalNotes()
    Tracker:FindObjectForCode('totalnote').AcquiredCount = Tracker:FindObjectForCode('note').AcquiredCount + Tracker:FindObjectForCode('bass').AcquiredCount + Tracker:FindObjectForCode('treble').AcquiredCount
    
    updateSilos()
end

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

-- Move Silos Toggle

function updateSilos()
    local siloObj = Tracker:FindObjectForCode('silo_feggs_tracking')
    siloObj:SetOverlay(silo_feggs)
    if feggs_count() then
        siloObj:SetOverlayColor("#f9d700")
        siloObj.Active = true
    else
        siloObj:SetOverlayColor("#d9d9d9")
        siloObj.Active = false
    end
    
    siloObj = Tracker:FindObjectForCode('silo_geggs_tracking')
    siloObj:SetOverlay(silo_geggs)
    if geggs_count() then
        siloObj:SetOverlayColor("#f9d700")
        siloObj.Active = true
    else
        siloObj:SetOverlayColor("#d9d9d9")
        siloObj.Active = false
    end
    
    siloObj = Tracker:FindObjectForCode('silo_ieggs_tracking')
    siloObj:SetOverlay(silo_ieggs)
    if ieggs_count() then
        siloObj:SetOverlayColor("#f9d700")
        siloObj.Active = true
    else
        siloObj:SetOverlayColor("#d9d9d9")
        siloObj.Active = false
    end
    
    siloObj = Tracker:FindObjectForCode('silo_ceggs_tracking')
    siloObj:SetOverlay(silo_ceggs)
    if ceggs_count() then
        siloObj:SetOverlayColor("#f9d700")
        siloObj.Active = true
    else
        siloObj:SetOverlayColor("#d9d9d9")
        siloObj.Active = false
    end
    
    siloObj = Tracker:FindObjectForCode('silo_eggaim_tracking')
    siloObj:SetOverlay(silo_eggaim)
    if eggaim_count() then
        siloObj:SetOverlayColor("#f9d700")
        siloObj.Active = true
    else
        siloObj:SetOverlayColor("#d9d9d9")
        siloObj.Active = false
    end
    
    siloObj = Tracker:FindObjectForCode('silo_bblaster_tracking')
    siloObj:SetOverlay(silo_bblaster)
    if bblaster_count() then
        siloObj:SetOverlayColor("#f9d700")
        siloObj.Active = true
    else
        siloObj:SetOverlayColor("#d9d9d9")
        siloObj.Active = false
    end
    
    siloObj = Tracker:FindObjectForCode('silo_ggrab_tracking')
    siloObj:SetOverlay(silo_ggrab)
    if ggrab_count() then
        siloObj:SetOverlayColor("#f9d700")
        siloObj.Active = true
    else
        siloObj:SetOverlayColor("#d9d9d9")
        siloObj.Active = false
    end
    
    siloObj = Tracker:FindObjectForCode('silo_bdrill_tracking')
    siloObj:SetOverlay(silo_bdrill)
    if bdrill_count() then
        siloObj:SetOverlayColor("#f9d700")
        siloObj.Active = true
    else
        siloObj:SetOverlayColor("#d9d9d9")
        siloObj.Active = false
    end
    
    siloObj = Tracker:FindObjectForCode('silo_bbayonet_tracking')
    siloObj:SetOverlay(silo_bbayonet)
    if bbayonet_count() then
        siloObj:SetOverlayColor("#f9d700")
        siloObj.Active = true
    else
        siloObj:SetOverlayColor("#d9d9d9")
        siloObj.Active = false
    end
    
    siloObj = Tracker:FindObjectForCode('silo_splitup_tracking')
    siloObj:SetOverlay(silo_splitup)
    if splitup_count() then
        siloObj:SetOverlayColor("#f9d700")
        siloObj.Active = true
    else
        siloObj:SetOverlayColor("#d9d9d9")
        siloObj.Active = false
    end
    
    siloObj = Tracker:FindObjectForCode('silo_aireaim_tracking')
    siloObj:SetOverlay(silo_aireaim)
    if aireaim_count() then
        siloObj:SetOverlayColor("#f9d700")
        siloObj.Active = true
    else
        siloObj:SetOverlayColor("#d9d9d9")
        siloObj.Active = false
    end
    
    siloObj = Tracker:FindObjectForCode('silo_packWhack_tracking')
    siloObj:SetOverlay(silo_packwh)
    if packwh_count() then
        siloObj:SetOverlayColor("#f9d700")
        siloObj.Active = true
    else
        siloObj:SetOverlayColor("#d9d9d9")
        siloObj.Active = false
    end
    
    siloObj = Tracker:FindObjectForCode('silo_auqaim_tracking')
    siloObj:SetOverlay(silo_auqaim)
    if auqaim_count() then
        siloObj:SetOverlayColor("#f9d700")
        siloObj.Active = true
    else
        siloObj:SetOverlayColor("#d9d9d9")
        siloObj.Active = false
    end
    
    siloObj = Tracker:FindObjectForCode('silo_wingWhack_tracking')
    siloObj:SetOverlay(silo_wwhack)
    if wwhack_count() then
        siloObj:SetOverlayColor("#f9d700")
        siloObj.Active = true
    else
        siloObj:SetOverlayColor("#d9d9d9")
        siloObj.Active = false
    end
    
    siloObj = Tracker:FindObjectForCode('silo_ttorp_tracking')
    siloObj:SetOverlay(silo_ttorp)
    if ttorp_count() then
        siloObj:SetOverlayColor("#f9d700")
        siloObj.Active = true
    else
        siloObj:SetOverlayColor("#d9d9d9")
        siloObj.Active = false
    end
    
    siloObj = Tracker:FindObjectForCode('silo_springb_tracking')
    siloObj:SetOverlay(silo_springb)
    if springb_count() then
        siloObj:SetOverlayColor("#f9d700")
        siloObj.Active = true
    else
        siloObj:SetOverlayColor("#d9d9d9")
        siloObj.Active = false
    end
    
    siloObj = Tracker:FindObjectForCode('silo_hatch_tracking')
    siloObj:SetOverlay(silo_hatch)
    if hatch_count() then
        siloObj:SetOverlayColor("#f9d700")
        siloObj.Active = true
    else
        siloObj:SetOverlayColor("#d9d9d9")
        siloObj.Active = false
    end
    
    siloObj = Tracker:FindObjectForCode('silo_taxiPack_tracking')
    siloObj:SetOverlay(silo_taxpack)
    if taxpack_count() then
        siloObj:SetOverlayColor("#f9d700")
        siloObj.Active = true
    else
        siloObj:SetOverlayColor("#d9d9d9")
        siloObj.Active = false
    end
    
    siloObj = Tracker:FindObjectForCode('silo_clawbts_tracking')
    siloObj:SetOverlay(silo_clawbts)
    if clawbts_count() then
        siloObj:SetOverlayColor("#f9d700")
        siloObj.Active = true
    else
        siloObj:SetOverlayColor("#d9d9d9")
        siloObj.Active = false
    end
    
    siloObj = Tracker:FindObjectForCode('silo_snoozePack_tracking')
    siloObj:SetOverlay(silo_snpack)
    if snpack_count() then
        siloObj:SetOverlayColor("#f9d700")
        siloObj.Active = true
    else
        siloObj:SetOverlayColor("#d9d9d9")
        siloObj.Active = false
    end
    
    siloObj = Tracker:FindObjectForCode('silo_legSpring_tracking')
    siloObj:SetOverlay(silo_lspring)
    if lspring_count() then
        siloObj:SetOverlayColor("#f9d700")
        siloObj.Active = true
    else
        siloObj:SetOverlayColor("#d9d9d9")
        siloObj.Active = false
    end
    
    siloObj = Tracker:FindObjectForCode('silo_shackPack_tracking')
    siloObj:SetOverlay(silo_shpack)
    if shpack_count() then
        siloObj:SetOverlayColor("#f9d700")
        siloObj.Active = true
    else
        siloObj:SetOverlayColor("#d9d9d9")
        siloObj.Active = false
    end
    
    siloObj = Tracker:FindObjectForCode('silo_glide_tracking')
    siloObj:SetOverlay(silo_glide)
    if glide_count() then
        siloObj:SetOverlayColor("#f9d700")
        siloObj.Active = true
    else
        siloObj:SetOverlayColor("#d9d9d9")
        siloObj.Active = false
    end
    
    siloObj = Tracker:FindObjectForCode('silo_sackPack_tracking')
    siloObj:SetOverlay(silo_sapack)
    if sapack_count() then
        siloObj:SetOverlayColor("#f9d700")
        siloObj.Active = true
    else
        siloObj:SetOverlayColor("#d9d9d9")
        siloObj.Active = false
    end
end

-- Progressive Eggs Toggle

function togglePEggs()
    if Tracker:FindObjectForCode('peggs').CurrentStage == 1 then
        Tracker:FindObjectForCode('begg').Active = true
        Tracker:FindObjectForCode('feggs').Active = true
    elseif Tracker:FindObjectForCode('peggs').CurrentStage == 2 then
        Tracker:FindObjectForCode('begg').Active = true
        Tracker:FindObjectForCode('feggs').Active = true
        Tracker:FindObjectForCode('geggs').Active = true
    elseif Tracker:FindObjectForCode('peggs').CurrentStage == 3 then
        Tracker:FindObjectForCode('begg').Active = true
        Tracker:FindObjectForCode('feggs').Active = true
        Tracker:FindObjectForCode('geggs').Active = true
        Tracker:FindObjectForCode('ieggs').Active = true
    elseif Tracker:FindObjectForCode('peggs').CurrentStage == 4 then
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

-- Warps Toggle

function setWarpState(warpObj, stringCode, twoWarps)
    if ( stringCode == "xxxxx" or twoWarps and stringCode == "xx" ) then
        warpObj.CurrentStage = 0
        warpObj.Active = false
    else
        warpObj.Active = true
        if ( stringCode == "1xxxx" or twoWarps and stringCode == "1x" ) then
            warpObj.CurrentStage = 1
        elseif ( stringCode == "x2xxx" or twoWarps and stringCode == "x2" ) then
            warpObj.CurrentStage = 2
        elseif ( stringCode == "xx3xx" or twoWarps and stringCode == "12" ) then
            warpObj.CurrentStage = 3
        elseif ( stringCode == "xxx4x" ) then
            warpObj.CurrentStage = 4
        elseif ( stringCode == "xxxx5" ) then
            warpObj.CurrentStage = 5
        elseif ( stringCode == "12xxx" ) then
            warpObj.CurrentStage = 6
        elseif ( stringCode == "1x3xx" ) then
            warpObj.CurrentStage = 7
        elseif ( stringCode == "1xx4x" ) then
            warpObj.CurrentStage = 8
        elseif ( stringCode == "1xxx5" ) then
            warpObj.CurrentStage = 9
        elseif ( stringCode == "x23xx" ) then
            warpObj.CurrentStage = 10
        elseif ( stringCode == "x2x4x" ) then
            warpObj.CurrentStage = 11
        elseif ( stringCode == "x2xx5" ) then
            warpObj.CurrentStage = 12
        elseif ( stringCode == "xx34x" ) then
            warpObj.CurrentStage = 13
        elseif ( stringCode == "xx3x5" ) then
            warpObj.CurrentStage = 14
        elseif ( stringCode == "xxx45" ) then
            warpObj.CurrentStage = 15
        elseif ( stringCode == "123xx" ) then
            warpObj.CurrentStage = 16
        elseif ( stringCode == "12x4x" ) then
            warpObj.CurrentStage = 17
        elseif ( stringCode == "12xx5" ) then
            warpObj.CurrentStage = 18
        elseif ( stringCode == "1x34x" ) then
            warpObj.CurrentStage = 19
        elseif ( stringCode == "1x3x5" ) then
            warpObj.CurrentStage = 20
        elseif ( stringCode == "1xx45" ) then
            warpObj.CurrentStage = 21
        elseif ( stringCode == "x234x" ) then
            warpObj.CurrentStage = 22
        elseif ( stringCode == "x23x5" ) then
            warpObj.CurrentStage = 23
        elseif ( stringCode == "x2x45" ) then
            warpObj.CurrentStage = 24
        elseif ( stringCode == "xx345" ) then
            warpObj.CurrentStage = 25
        elseif ( stringCode == "1234x" ) then
            warpObj.CurrentStage = 26
        elseif ( stringCode == "123x5" ) then
            warpObj.CurrentStage = 27
        elseif ( stringCode == "12x45" ) then
            warpObj.CurrentStage = 28
        elseif ( stringCode == "1x345" ) then
            warpObj.CurrentStage = 29
        elseif ( stringCode == "x2345" ) then
            warpObj.CurrentStage = 30
        elseif ( stringCode == "12345" ) then
            warpObj.CurrentStage = 31
        end
    end
end

function toggleWarps()
    -- Mayahem Temple
    local warpObj = Tracker:FindObjectForCode('warpsmt')
    local overlayString = ""
    local stringCode = ""
    if has("warpmt1") then
        overlayString = overlayString .. "1 "
        stringCode = stringCode .. "1"
    else
        overlayString = overlayString .. "  "
        stringCode = stringCode .. "x"
    end
    if has("warpmt2") then
        overlayString = overlayString .. "2 "
        stringCode = stringCode .. "2"
    else
        overlayString = overlayString .. "  "
        stringCode = stringCode .. "x"
    end
    if has("warpmt3") then
        overlayString = overlayString .. "3\n"
        stringCode = stringCode .. "3"
    else
        overlayString = overlayString .. " \n"
        stringCode = stringCode .. "x"
    end
    if has("warpmt4") then
        overlayString = overlayString .. "4 "
        stringCode = stringCode .. "4"
    else
        overlayString = overlayString .. "  "
        stringCode = stringCode .. "x"
    end
    if has("warpmt5") then
        overlayString = overlayString .. "5 \n"
        stringCode = stringCode .. "5"
    else
        overlayString = overlayString .. "  \n"
        stringCode = stringCode .. "x"
    end
    warpObj:SetOverlay(overlayString)
    warpObj:SetOverlayColor("#f9d700")
    warpObj:SetOverlayFontSize(8)
    setWarpState(warpObj, stringCode)
    
    -- Glitter Gulch Mine
    warpObj = Tracker:FindObjectForCode('warpsgm')
    overlayString = ""
    stringCode = ""
    if has("warpgm1") then
        overlayString = overlayString .. "1 "
        stringCode = stringCode .. "1"
    else
        overlayString = overlayString .. "  "
        stringCode = stringCode .. "x"
    end
    if has("warpgm2") then
        overlayString = overlayString .. "2 "
        stringCode = stringCode .. "2"
    else
        overlayString = overlayString .. "  "
        stringCode = stringCode .. "x"
    end
    if has("warpgm3") then
        overlayString = overlayString .. "3\n"
        stringCode = stringCode .. "3"
    else
        overlayString = overlayString .. " \n"
        stringCode = stringCode .. "x"
    end
    if has("warpgm4") then
        overlayString = overlayString .. "4 "
        stringCode = stringCode .. "4"
    else
        overlayString = overlayString .. "  "
        stringCode = stringCode .. "x"
    end
    if has("warpgm5") then
        overlayString = overlayString .. "5 \n"
        stringCode = stringCode .. "5"
    else
        overlayString = overlayString .. "  \n"
        stringCode = stringCode .. "x"
    end
    warpObj:SetOverlay(overlayString)
    warpObj:SetOverlayColor("#f9d700")
    warpObj:SetOverlayFontSize(8)
    setWarpState(warpObj, stringCode)
    
    -- Witchyworld
    warpObj = Tracker:FindObjectForCode('warpsww')
    overlayString = ""
    stringCode = ""
    if has("warpww1") then
        overlayString = overlayString .. "1 "
        stringCode = stringCode .. "1"
    else
        overlayString = overlayString .. "  "
        stringCode = stringCode .. "x"
    end
    if has("warpww2") then
        overlayString = overlayString .. "2 "
        stringCode = stringCode .. "2"
    else
        overlayString = overlayString .. "  "
        stringCode = stringCode .. "x"
    end
    if has("warpww3") then
        overlayString = overlayString .. "3\n"
        stringCode = stringCode .. "3"
    else
        overlayString = overlayString .. " \n"
        stringCode = stringCode .. "x"
    end
    if has("warpww4") then
        overlayString = overlayString .. "4 "
        stringCode = stringCode .. "4"
    else
        overlayString = overlayString .. "  "
        stringCode = stringCode .. "x"
    end
    if has("warpww5") then
        overlayString = overlayString .. "5 \n"
        stringCode = stringCode .. "5"
    else
        overlayString = overlayString .. "  \n"
        stringCode = stringCode .. "x"
    end
    warpObj:SetOverlay(overlayString)
    warpObj:SetOverlayColor("#f9d700")
    warpObj:SetOverlayFontSize(8)
    setWarpState(warpObj, stringCode)
    
    -- Jolly Roger's Lagoon
    warpObj = Tracker:FindObjectForCode('warpsjr')
    overlayString = ""
    stringCode = ""
    if has("warpjr1") then
        overlayString = overlayString .. "1 "
        stringCode = stringCode .. "1"
    else
        overlayString = overlayString .. "  "
        stringCode = stringCode .. "x"
    end
    if has("warpjr2") then
        overlayString = overlayString .. "2 "
        stringCode = stringCode .. "2"
    else
        overlayString = overlayString .. "  "
        stringCode = stringCode .. "x"
    end
    if has("warpjr3") then
        overlayString = overlayString .. "3\n"
        stringCode = stringCode .. "3"
    else
        overlayString = overlayString .. " \n"
        stringCode = stringCode .. "x"
    end
    if has("warpjr4") then
        overlayString = overlayString .. "4 "
        stringCode = stringCode .. "4"
    else
        overlayString = overlayString .. "  "
        stringCode = stringCode .. "x"
    end
    if has("warpjr5") then
        overlayString = overlayString .. "5 \n"
        stringCode = stringCode .. "5"
    else
        overlayString = overlayString .. "  \n"
        stringCode = stringCode .. "x"
    end
    warpObj:SetOverlay(overlayString)
    warpObj:SetOverlayColor("#f9d700")
    warpObj:SetOverlayFontSize(8)
    setWarpState(warpObj, stringCode)
    
    -- Terrydactyland
    warpObj = Tracker:FindObjectForCode('warpstl')
    overlayString = ""
    stringCode = ""
    if has("warptl1") then
        overlayString = overlayString .. "1 "
        stringCode = stringCode .. "1"
    else
        overlayString = overlayString .. "  "
        stringCode = stringCode .. "x"
    end
    if has("warptl2") then
        overlayString = overlayString .. "2 "
        stringCode = stringCode .. "2"
    else
        overlayString = overlayString .. "  "
        stringCode = stringCode .. "x"
    end
    if has("warptl3") then
        overlayString = overlayString .. "3\n"
        stringCode = stringCode .. "3"
    else
        overlayString = overlayString .. " \n"
        stringCode = stringCode .. "x"
    end
    if has("warptl4") then
        overlayString = overlayString .. "4 "
        stringCode = stringCode .. "4"
    else
        overlayString = overlayString .. "  "
        stringCode = stringCode .. "x"
    end
    if has("warptl5") then
        overlayString = overlayString .. "5 \n"
        stringCode = stringCode .. "5"
    else
        overlayString = overlayString .. "  \n"
        stringCode = stringCode .. "x"
    end
    warpObj:SetOverlay(overlayString)
    warpObj:SetOverlayColor("#f9d700")
    warpObj:SetOverlayFontSize(8)
    setWarpState(warpObj, stringCode)
    
    -- Grunty Industries
    warpObj = Tracker:FindObjectForCode('warpsgi')
    overlayString = ""
    stringCode = ""
    if has("warpgi1") then
        overlayString = overlayString .. "1 "
        stringCode = stringCode .. "1"
    else
        overlayString = overlayString .. "  "
        stringCode = stringCode .. "x"
    end
    if has("warpgi2") then
        overlayString = overlayString .. "2 "
        stringCode = stringCode .. "2"
    else
        overlayString = overlayString .. "  "
        stringCode = stringCode .. "x"
    end
    if has("warpgi3") then
        overlayString = overlayString .. "3\n"
        stringCode = stringCode .. "3"
    else
        overlayString = overlayString .. " \n"
        stringCode = stringCode .. "x"
    end
    if has("warpgi4") then
        overlayString = overlayString .. "4 "
        stringCode = stringCode .. "4"
    else
        overlayString = overlayString .. "  "
        stringCode = stringCode .. "x"
    end
    if has("warpgi5") then
        overlayString = overlayString .. "5 \n"
        stringCode = stringCode .. "5"
    else
        overlayString = overlayString .. "  \n"
        stringCode = stringCode .. "x"
    end
    warpObj:SetOverlay(overlayString)
    warpObj:SetOverlayColor("#f9d700")
    warpObj:SetOverlayFontSize(8)
    setWarpState(warpObj, stringCode)
    
    -- Hailfire Peaks
    warpObj = Tracker:FindObjectForCode('warpshp')
    overlayString = ""
    stringCode = ""
    if has("warphp1") then
        overlayString = overlayString .. "1 "
        stringCode = stringCode .. "1"
    else
        overlayString = overlayString .. "  "
        stringCode = stringCode .. "x"
    end
    if has("warphp2") then
        overlayString = overlayString .. "2 "
        stringCode = stringCode .. "2"
    else
        overlayString = overlayString .. "  "
        stringCode = stringCode .. "x"
    end
    if has("warphp3") then
        overlayString = overlayString .. "3\n"
        stringCode = stringCode .. "3"
    else
        overlayString = overlayString .. " \n"
        stringCode = stringCode .. "x"
    end
    if has("warphp4") then
        overlayString = overlayString .. "4 "
        stringCode = stringCode .. "4"
    else
        overlayString = overlayString .. "  "
        stringCode = stringCode .. "x"
    end
    if has("warphp5") then
        overlayString = overlayString .. "5 \n"
        stringCode = stringCode .. "5"
    else
        overlayString = overlayString .. "  \n"
        stringCode = stringCode .. "x"
    end
    warpObj:SetOverlay(overlayString)
    warpObj:SetOverlayColor("#f9d700")
    warpObj:SetOverlayFontSize(8)
    setWarpState(warpObj, stringCode)
    
    -- Cloud Cuckooland
    warpObj = Tracker:FindObjectForCode('warpscc')
    overlayString = ""
    stringCode = ""
    if has("warpcc1") then
        overlayString = overlayString .. "1 "
        stringCode = stringCode .. "1"
    else
        overlayString = overlayString .. "  "
        stringCode = stringCode .. "x"
    end
    if has("warpcc2") then
        overlayString = overlayString .. "2 \n\n"
        stringCode = stringCode .. "2"
    else
        overlayString = overlayString .. "  \n\n"
        stringCode = stringCode .. "x"
    end
    warpObj:SetOverlay(overlayString)
    warpObj:SetOverlayColor("#f9d700")
    warpObj:SetOverlayFontSize(8)
    setWarpState(warpObj, stringCode, true)
    
    -- Cauldron Keep
    warpObj = Tracker:FindObjectForCode('warpsck')
    overlayString = ""
    stringCode = ""
    if has("warpck1") then
        overlayString = overlayString .. "1 "
        stringCode = stringCode .. "1"
    else
        overlayString = overlayString .. "  "
        stringCode = stringCode .. "x"
    end
    if has("warpck2") then
        overlayString = overlayString .. "2 \n\n"
        stringCode = stringCode .. "2"
    else
        overlayString = overlayString .. "  \n\n"
        stringCode = stringCode .. "x"
    end
    warpObj:SetOverlay(overlayString)
    warpObj:SetOverlayColor("#f9d700")
    warpObj:SetOverlayFontSize(8)
    setWarpState(warpObj, stringCode, true)
end

function toggleBossMoves()
    local targitzanMoves = Tracker:FindObjectForCode('bossmoves_targitzan')
    local oldKingCoalMoves = Tracker:FindObjectForCode('bossmoves_oldkingcoal')
    local mrPatchMoves = Tracker:FindObjectForCode('bossmoves_mrpatch')
    local lordWooFakFakMoves = Tracker:FindObjectForCode('bossmoves_lordwoofakfak')
    local terryMoves = Tracker:FindObjectForCode('bossmoves_terry')
    local dragonBrothersMoves = Tracker:FindObjectForCode('bossmoves_dragonbrothers')
    local mingyJongoMoves = Tracker:FindObjectForCode('bossmoves_mingyjongo')
    
    if ( has("eggshoot") and has("amazeogaze") and has("eggaim") and has("bblaster") ) then
        targitzanMoves.Active = true
    else
        targitzanMoves.Active = false
    end
    
    if ( has("eggshoot") and has("chuffy") ) then
        oldKingCoalMoves.Active = true
    else
        oldKingCoalMoves.Active = false
    end
    
    if ( has("fpad") and has("aireaim") and has("eggaim") and has("geggs") ) then
        mrPatchMoves.Active = true
    else
        mrPatchMoves.Active = false
    end
    
    if ( has("dive") and has("humbajr") and has("auqaim") and has("geggs") ) then
        lordWooFakFakMoves.Active = true
    else
        lordWooFakFakMoves.Active = false
    end
    
    if ( has("springb") and has("eggaim") ) then
        terryMoves.Active = true
    else
        terryMoves.Active = false
    end
    
    if ( has("fpad") and has("clawbts") and has("ieggs") and has("feggs") ) then
        dragonBrothersMoves.Active = true
    else
        dragonBrothersMoves.Active = false
    end
    
    if ( has("cca") ) then
        mingyJongoMoves.Active = true
    else
        mingyJongoMoves.Active = false
    end
end

function overrideLayouts()
    if ( has("entrancerando_off") and has("randomizewarppads_off") ) then
        Tracker:AddLayouts("var_warpsanity_off/layouts/tracker.json")
    elseif ( has("entrancerando_off") and has("randomizewarppads_on") ) then
        Tracker:AddLayouts("layouts/tracker.json")
    elseif ( has("entrancerando_on") and has("randomizewarppads_on") ) then
        Tracker:AddLayouts("var_entrancerando_warpsanity/layouts/tracker.json")
    elseif ( has("entrancerando_on") and has("randomizewarppads_off") ) then
        Tracker:AddLayouts("var_entrancerando/layouts/tracker.json")
    end
    
    if ( has("mousepace_on") ) then
        Tracker:AddLayouts("layouts/broadcast - mousepace.json")
    elseif ( has("entrancerando_off") and has("randomizewarppads_off") ) then
        Tracker:AddLayouts("var_warpsanity_off/layouts/broadcast.json")
    elseif ( has("entrancerando_off") and has("randomizewarppads_on") ) then
        Tracker:AddLayouts("layouts/broadcast.json")
    elseif ( has("entrancerando_on") and has("randomizewarppads_on") ) then
        Tracker:AddLayouts("var_entrancerando_warpsanity/layouts/broadcast.json")
    elseif ( has("entrancerando_on") and has("randomizewarppads_off") ) then
        Tracker:AddLayouts("var_entrancerando/layouts/broadcast.json")
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



--------------- Chuffy

function chuffy_canEnterFromGGM(skip)
    local logic = 99
    --[[        ggm_to_chuffy
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.climb(state) and self.small_elevation(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.small_elevation(state) or self.climb(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.small_elevation(state) or self.climb(state) or self.beak_buster(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.small_elevation(state) or self.climb(state) or self.beak_buster(state)
    --]]
    
    local ggmTrot = access_GGM_ttrot(true)
    
    -- Normal Logic
    if ( has("climb") and can_reachSmallElevation() ) then
        logic = 0
    elseif ( has("climb") or can_reachSmallElevation() ) then
        logic = 1
    elseif ( has("bbust") ) then
        logic = 2
    else
        logic = math.max(7, ggmTrot)
    end
    
    return convertLogic(logic, skip)
end

function chuffy_canEnterFromWW(skip)
    local logic = 99
    --[[        ww_to_chuffy
    if self.world.options.logic_type == LogicType.option_intended:
        logic = state.has(itemName.TRAINSWWW, self.player) and (self.climb(state) and self.small_elevation(state))
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = state.has(itemName.TRAINSWWW, self.player) and (self.small_elevation(state) or self.climb(state))
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = state.has(itemName.TRAINSWWW, self.player) and (self.small_elevation(state) or self.climb(state))
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = state.has(itemName.TRAINSWWW, self.player) and (self.small_elevation(state) or self.climb(state))
    --]]
    
    if ( has("trainswww") ) then
        if ( has("climb") and can_reachSmallElevation() ) then
            logic = 0
        elseif ( has("climb") or can_reachSmallElevation() ) then
            logic = 1
        end
    end
    
    return convertLogic(logic, skip)
end

function chuffy_canEnterFromIOH(skip)
    local logic = 99
    --[[        ioh_to_chuffy
    if self.world.options.logic_type == LogicType.option_intended:
        logic = state.has(itemName.TRAINSWIH, self.player) and (self.climb(state) and self.small_elevation(state))
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = state.has(itemName.TRAINSWIH, self.player) and (self.small_elevation(state) or self.climb(state))
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = state.has(itemName.TRAINSWIH, self.player) and (self.small_elevation(state) or self.climb(state) or self.beak_buster(state))
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = state.has(itemName.TRAINSWIH, self.player) and (self.small_elevation(state) or self.climb(state) or self.beak_buster(state))
    --]]
    
    if ( has("trainswih") ) then
        if ( has("climb") and can_reachSmallElevation() ) then
            logic = 0
        elseif ( has("climb") or can_reachSmallElevation() ) then
            logic = 1
        elseif ( has("bbust") ) then
            logic = 2
        end
    end
    
    return convertLogic(logic, skip)
end

function chuffy_canEnterFromTDL(skip)
    local logic = 99
    --[[        tdl_to_chuffy
    if self.world.options.logic_type == LogicType.option_intended:
        logic = state.has(itemName.TRAINSWTD, self.player)\
                    and (self.climb(state) and self.small_elevation(state))
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = state.has(itemName.TRAINSWTD, self.player)\
                    and ((self.small_elevation(state) or self.beak_buster(state)) and self.climb(state)\
                        or self.flap_flip(state) and self.beak_buster(state))
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = state.has(itemName.TRAINSWTD, self.player)\
                    and (((self.small_elevation(state) or self.beak_buster(state)) and self.climb(state))\
                        or self.extremelyLongJump(state)\
                        or self.flap_flip(state) and self.beak_buster(state))\
                    or self.tall_jump(state) and self.beak_buster(state))
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = state.has(itemName.TRAINSWTD, self.player)\
                    and (((self.small_elevation(state) or self.beak_buster(state)) and self.climb(state))\
                        or self.extremelyLongJump(state)\
                        or self.flap_flip(state) and self.beak_buster(state))\
                    or self.tall_jump(state) and self.beak_buster(state))
    --]]
    
    if ( has("trainswtd") ) then
        if ( has("climb") and can_reachSmallElevation() ) then
            logic = 0
        elseif ( has("bbust") and (has("climb") or has("fflip")) ) then
            logic = 1
        elseif ( has("bbust") and has("tjump") ) then
            logic = 2
        else
            logic = math.max(2, can_extremelyLongJump(true))
        end
    end
    
    return convertLogic(logic, skip)
end

function chuffy_canEnterFromGI(skip)
    local logic = 99
    --[[        gi_to_chuffy
    if self.world.options.logic_type == LogicType.option_intended:
        logic = state.has(itemName.TRAINSWGI, self.player)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = state.has(itemName.TRAINSWGI, self.player)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = state.has(itemName.TRAINSWGI, self.player)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = state.has(itemName.TRAINSWGI, self.player)
    --]]
    
    if ( has("trainswgi") ) then
        logic = 0
    end
    
    return convertLogic(logic, skip)
end

function chuffy_canEnterFromHFP(skip)
    local logic = 99
    --[[        hfp_to_chuffy
    if self.world.options.logic_type == LogicType.option_intended:
        logic = state.has(itemName.TRAINSWHP1, self.player) and self.climb(state) and self.small_elevation(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = state.has(itemName.TRAINSWHP1, self.player) and (
                    self.climb(state) and (self.small_elevation(state) or self.beak_buster(state))\
                    or self.talon_trot(state)
                )
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = state.has(itemName.TRAINSWHP1, self.player) and (
                    self.climb(state) and (self.small_elevation(state) or self.beak_buster(state))\
                    or self.talon_trot(state)\
                    or self.tall_jump(state) and self.beak_buster(state)
                )
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = state.has(itemName.TRAINSWHP1, self.player) and (
                    self.climb(state) and (self.small_elevation(state) or self.beak_buster(state))\
                    or self.talon_trot(state)\
                    or self.tall_jump(state) and self.beak_buster(state)
                )
     --]]
    
    if ( has("trainswhp1") ) then
        if ( has("climb") and can_reachSmallElevation() ) then
            logic = 0
        elseif ( has("climb") and has("bbust") or has("ttrot") ) then
            logic = 1
        elseif ( has("tjump") and has("bbust") ) then
            logic = 2
        end
    end
    
    return convertLogic(logic, skip)
end

function chuffy_canBeatKingCoal(skip)
    local logic = 99
    --[[        can_beat_king_coal
    hasAttack = False
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

    if not self.world.options.randomize_chuffy:
        return self.mumboGGM(state) and state.can_reach_region(regionName.GM, self.player) and self.ggm_to_chuffy(state) and hasAttack
    else:
        return state.has(itemName.CHUFFY, self.player) and hasAttack
    --]]
    
    local hasAttack = -1
    if ( can_shootEggs("begg") or can_shootEggs("geggs") or can_shootEggs("ieggs") ) then
        hasAttack = 0
    elseif ( has("bbarge") or has("roll") or has("arat") ) then
        hasAttack = 1
    elseif ( has("grat") ) then
        hasAttack = 2
    end
    
    if ( chuffyrandomized.CurrentStage == 0 ) then -- not randomized
        local ggmAccessibility = Tracker:FindObjectForCode("@Region: Glitter Gulch Mine - Main Area").AccessibilityLevel
        local chuffyAccess = chuffy_canEnterFromGGM(true)
        
        -- Normal Logic
        if ( has("mumbogm") and (ggmAccessibility == AccessibilityLevel.Normal or ggmAccessibility == AccessibilityLevel.Cleared) and chuffyAccess <= logictype.CurrentStage and hasAttack <= logictype.CurrentStage ) then
            logic = 0
        
        -- Sequence Breaking
        elseif ( has("mumbogm") and ggmAccessibility > AccessibilityLevel.None and chuffyAccess <= logictype.CurrentStage and hasAttack <= logictype.CurrentStage ) then
            logic = logictype.CurrentStage + 1 -- Access to GGM is the only thing out of logic, and that was already converted once by the json
        elseif ( has("mumbogm") and ggmAccessibility > AccessibilityLevel.None ) then
            logic = math.max(chuffyAccess, hasAttack) -- One or both of these other two is what is out of logic, so sequence break is whichever is hardest
        end
    else -- Chuffy is randomized
    
        -- Normal Logic
        if ( has("chuffy") and hasAttack <= logictype.CurrentStage ) then
            logic = 0
        
        -- Sequence Breaking
        elseif ( has("chuffy") ) then
            logic = hasAttack
        end
    end
    
    return convertLogic(logic, skip)
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
     
    if ( has("honeybrewards_on") and has("maxhealth", 1) ) then
        logic = 0
    elseif ( has("honeybrewards_off") ) then
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
     
    if ( has("honeybrewards_on") and has("maxhealth", 2) ) then
        logic = 0
    elseif ( has("honeybrewards_off") ) then
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
     
    if ( has("honeybrewards_on") and has("maxhealth", 3) ) then
        logic = 0
    elseif ( has("honeybrewards_off") ) then
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
     
    if ( has("honeybrewards_on") and has("maxhealth", 4) ) then
        logic = 0
    elseif ( has("honeybrewards_off") ) then
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
     
    if ( has("honeybrewards_on") and has("maxhealth", 5) ) then
        logic = 0
    elseif ( has("honeybrewards_off") ) then
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

function connector_MT_to_TDLHatch(skip)
    local logic = 99
    --[[
    rules.jiggy_treasure_chamber(state)
    --]]
    
    logic = jiggy_MT_treasureChamber(true)
    
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

function connector_GGM_to_Chuffy(skip)
    local logic = 99
    --[[
    rules.can_beat_king_coal(state) and rules.ggm_to_chuffy(state)
    --]]
    
    local canBeatKingCoal = chuffy_canBeatKingCoal(true)
    local canEnterFromGGM = chuffy_canEnterFromGGM(true)
    
    -- Normal Logic
    if ( canBeatKingCoal <= logictype.CurrentStage and canEnterFromGGM <= logictype.CurrentStage ) then
        logic = 0
    
    -- Sequence Breaking
    else
        logic = math.max(canBeatKingCoal, canEnterFromGGM)
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

function connector_WW_to_Chuffy(skip)
    local logic = 99
    --[[
    rules.can_beat_king_coal(state) and rules.ww_to_chuffy(state)
    --]]
    
    local canBeatKingCoal = chuffy_canBeatKingCoal(true)
    local canEnterFromWW = chuffy_canEnterFromWW(true)
    
    -- Normal Logic
    if ( canBeatKingCoal <= logictype.CurrentStage and canEnterFromWW <= logictype.CurrentStage ) then
        logic = 0
    
    -- Sequence Breaking
    else
        logic = math.max(canBeatKingCoal, canEnterFromWW)
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

function connector_CT_to_Chuffy(skip)
    local logic = 99
    --[[
    rules.can_beat_king_coal(state) and rules.ioh_to_chuffy(state)
    --]]
    
    local canBeatKingCoal = chuffy_canBeatKingCoal(true)
    local canEnterFromIOH = chuffy_canEnterFromIOH(true)
    
    -- Normal Logic
    if ( canBeatKingCoal <= logictype.CurrentStage and canEnterFromIOH <= logictype.CurrentStage ) then
        logic = 0
    
    -- Sequence Breaking
    else
        logic = math.max(canBeatKingCoal, canEnterFromIOH)
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
    if self.world.options.logic_type == LogicType.option_intended:
        return self.tall_jump(state) and self.grip_grab(state) and self.dive(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        return self.dive(state)\
                and (self.slightly_elevated_ledge(state) or self.flap_flip(state))\
                and self.tall_jump(state)\
                and (self.beak_buster(state) or self.grip_grab(state))
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        return self.dive(state)\
                and (self.slightly_elevated_ledge(state) or self.flap_flip(state))\
                and self.tall_jump(state)\
                and (self.beak_buster(state) or self.grip_grab(state))
    elif self.world.options.logic_type == LogicType.option_glitches:
        return self.dive(state)\
                and (self.slightly_elevated_ledge(state) or self.flap_flip(state))\
                and self.tall_jump(state)\
                and (self.beak_buster(state) or self.grip_grab(state))
    --]]
    
    if ( has("tjump") and has("ggrab") and has("dive") ) then
        logic = 0
    elseif ( has("dive") and has("tjump") and (has("fflip") or can_reachSlightlyElevatedLedge()) and (has("bbust") or has("ggrab")) ) then
        logic = 1
    end
    
    return convertLogic(logic, skip)
end

function connector_JRLLockerCavern_to_JRLSunkenShip(skip)
    local logic = 99
    --[[
    rules.can_escape_from_locker_cavern(state)
    --]]
    
    logic = access_JRL_canEscapeFromLockerCavern(true)
    
    return convertLogic(logic, skip)
end

function connector_JRLLockerCavern_to_JRLBigFishCavern(skip)
    local logic = 99
    --[[
    rules.can_escape_from_locker_cavern(state)
    --]]
    
    logic = access_JRL_canEscapeFromLockerCavern(true)
    
    return convertLogic(logic, skip)
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
    --[[        can_escape_big_fish_cave_from_water
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
    elseif ( has("ieggs") and has("dair") and has("auqaim") and (basic_JRL_canGetAirFromWarping() and has("warpjr4") or has("dive")) or jrlHumba < 2 ) then
        logic = 1
    elseif ( has("mumbojr") or basic_JRL_canGetAirFromWarping() and has("warpjr4") or has("dive") ) then
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

function connector_HFP_to_Chuffy(skip)
    local logic = 99
    --[[
    rules.can_beat_king_coal(state) and rules.hfp_to_chuffy(state)
    --]]
    
    local canBeatKingCoal = chuffy_canBeatKingCoal(true)
    local canEnterFromHFP = chuffy_canEnterFromHFP(true)
    
    -- Normal Logic
    if ( canBeatKingCoal <= logictype.CurrentStage and canEnterFromHFP <= logictype.CurrentStage ) then
        logic = 0
    
    -- Sequence Breaking
    else
        logic = math.max(canBeatKingCoal, canEnterFromHFP)
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

function connector_TDL_to_Chuffy(skip)
    local logic = 99
    --[[
    rules.can_beat_king_coal(state) and rules.tdl_to_chuffy(state)
    --]]
    
    local canBeatKingCoal = chuffy_canBeatKingCoal(true)
    local canEnterFromTDL = chuffy_canEnterFromTDL(true)
    
    -- Normal Logic
    if ( canBeatKingCoal <= logictype.CurrentStage and canEnterFromTDL <= logictype.CurrentStage ) then
        logic = 0
    
    -- Sequence Breaking
    else
        logic = math.max(canBeatKingCoal, canEnterFromTDL)
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
                        or self.talon_trot(state))
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        return self.springy_step_shoes(state)\
                    and (self.tall_jump(state) and (self.flutter(state) or self.air_rat_a_tat_rap(state))\
                        or self.talon_trot(state))
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        return self.springy_step_shoes(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        return (self.springy_step_shoes(state) or \
                (self.flight_pad(state) and (self.tall_jump(state) or self.beak_buster(state) or self.grip_grab(state))\
                 and (self.beak_bomb(state) or self.clockwork_warp(state))))
    --]]
    
    if ( has("springb") and (has("tjump") and (has("flutter") or has("arat")) or has("ttrot")) ) then
        logic = 0
    elseif ( has("springb") ) then
        logic = 2
    elseif ( has("fpad") and (has("tjump") or has("bbust") or has("ggrab")) and (has("bbomb") or can_clockworkWarp()) ) then
        logic = 3
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
        logic = (self.clockwork_warp(state) and self.talon_trot(state) or self.claw_clamber_boots(state))\
                and (self.ck_jiggy(state) or (self.climb(state) and self.tall_jump(state) and self.beak_buster(state) and (self.flutter(state) or self.air_rat_a_tat_rap(state))))
    --]]
    
    if ( has("cka") and has("clawbts") ) then
        logic = 0
    elseif ( (has("clawbts") or has("ttrot") and can_clockworkWarp()) and (has("cka") or has("climb") and has("tjump") and has("bbust") and (has("flutter") or has("arat"))) ) then
        logic = 3
    end
    
    return convertLogic(logic, skip)
end

function connector_GIO_to_GIF1(skip)
    local logic = 99
    --[[        outside_gi_to_floor1
    if self.world.options.logic_type == LogicType.option_intended:
        logic = False
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = False
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = False
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.clockwork_shot(state)
    --]]

    if ( can_clockworkShot() ) then
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
        logic = self.claw_clamber_boots(state) and (self.flutter(state) or self.air_rat_a_tat_rap(state)) and self.small_elevation(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.claw_clamber_boots(state) and (self.flutter(state) or self.air_rat_a_tat_rap(state)) and self.small_elevation(state)
    --]]
    
    if ( has("clawbts") and can_reachSmallElevation() and (has("flutter") or has("arat")) ) then
        logic = 1
    elseif ( has("clawbts") and has("arat") ) then
        logic = 7 -- FIXIT you don't need tall jump to get to floor 4 from the fire escape if you have arat
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
    
    if ( has("splitup") ) then
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
        logic = self.claw_clamber_boots(state) and (self.spring_pad(state) or self.leg_spring(state))\
                or self.leg_spring(state) and self.glide(state) and (self.wing_whack(state) or self.egg_aim(state))
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.claw_clamber_boots(state) and (self.spring_pad(state) or self.leg_spring(state))\
                or self.leg_spring(state) and self.glide(state) and (self.wing_whack(state) or self.egg_aim(state))
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.claw_clamber_boots(state) and (self.spring_pad(state) or self.leg_spring(state))\
                or self.leg_spring(state) and self.glide(state) and (self.wing_whack(state) or self.egg_aim(state))
    --]]
    
    if ( has("clawbts") and (has("tjump") or has_legSpring()) ) then
        logic = 0
    elseif ( has_legSpring() and has_glide() and (has_wingWhack() or has("eggaim")) ) then
        logic = 1
    end
    
    return convertLogic(logic, skip)
end

function connector_GIF1_to_Chuffy(skip)
    local logic = 99
    --[[
    rules.can_beat_king_coal(state) and rules.gi_to_chuffy(state)
    --]]
    
    local canBeatKingCoal = chuffy_canBeatKingCoal(true)
    local canEnterFromGI = chuffy_canEnterFromGI(true)
    
    -- Normal Logic
    if ( canBeatKingCoal <= logictype.CurrentStage and canEnterFromGI <= logictype.CurrentStage ) then
        logic = 0
    
    -- Sequence Breaking
    else
        logic = math.max(canBeatKingCoal, canEnterFromGI)
    end
    
    return convertLogic(logic, skip)
end

function connector_GIF1_to_GIWarps(skip)
    local logic = 99
    --[[
    rules.split_up(state) and state.has(itemName.WARPGI1, player)
    --]]
    
    if ( has("splitup") and has("warpgi1") ) then
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
        logic = self.climb(state) or (self.flap_flip(state) and self.veryLongJump(state))
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.climb(state) or (self.flap_flip(state) and self.veryLongJump(state))
    --]]
    
    if ( has("climb") ) then
        logic = 0
    elseif ( has("fflip") and has("bbust") and can_veryLongJump() ) then
        logic = 1
    elseif ( has("fflip") and can_veryLongJump() ) then
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
    
    local warpPadF4 = access_GI_warpPadF4(true)
    
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
    state.has(itemName.CHUFFY, player) and state.has(itemName.TRAINSWWW, player)
    --]]
    
    if ( has("chuffy") and has("trainswww") ) then
        logic = 0
    end
    
    return convertLogic(logic, skip)
end

function connector_Chuffy_to_CT(skip)
    local logic = 99
    --[[
    state.has(itemName.CHUFFY, player) and state.has(itemName.TRAINSWIH, player)
    --]]
    
    if ( has("chuffy") and has("trainswih") ) then
        logic = 0
    end
    
    return convertLogic(logic, skip)
end

function connector_Chuffy_to_TDL(skip)
    local logic = 99
    --[[
    state.has(itemName.CHUFFY, player) and state.has(itemName.TRAINSWTD, player)
    --]]
    
    if ( has("chuffy") and has("trainswtd") ) then
        logic = 0
    end
    
    return convertLogic(logic, skip)
end

function connector_Chuffy_to_GIF1(skip)
    local logic = 99
    --[[
    state.has(itemName.CHUFFY, player) and state.has(itemName.TRAINSWGI, player)
    --]]
    
    if ( has("chuffy") and has("trainswgi") ) then
        logic = 0
    end
    
    return convertLogic(logic, skip)
end

function connector_Chuffy_to_HFP(skip)
    local logic = 99
    --[[
    state.has(itemName.CHUFFY, player) and state.has(itemName.TRAINSWHP1, player)
    --]]
    
    if ( has("chuffy") and has("trainswhp1") ) then
        logic = 0
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
    
    
    -- Normal Logic
    if ( has("ttrot") ) then
        logic = 0
    else
        local ctAccessibility = Tracker:FindObjectForCode("@Region: Cliff Top").AccessibilityLevel -- FIXIT I can't for the life of me get this to work if your only way to cliff top is split up. reminder to check the poptracker discord to see if anyone has suggestions
        local jrlAccessibility = Tracker:FindObjectForCode("@Region: Jolly Roger's Lagoon - Main Area").AccessibilityLevel
        local tdlAccessibility = Tracker:FindObjectForCode("@Region: Terrydactyland - Main Area").AccessibilityLevel
        local giAccessibility = Tracker:FindObjectForCode("@Region: Grunty Industries 1st Floor").AccessibilityLevel
    
        if ( has("clawbts") and (ctAccessibility == AccessibilityLevel.Normal or ctAccessibility == AccessibilityLevel.Cleared) ) then
            logic = 1
        
        -- Sequence Breaking
        elseif ( has("clawbts") and ctAccessibility > AccessibilityLevel.None ) then
            logic = logictype.CurrentStage + 1 -- was already converted once by the json
        elseif ( (load_jrl_jrl() or load_hfp_jrl() and ctAccessibility > AccessibilityLevel.None or load_ww_jrl() and has("wwa")) and jrlAccessibility > AccessibilityLevel.None and has("doubloon", 28) and has("ttrain") ) then
            logic = 7 -- smuggle turbo trainers from JRL, technically requires 28 doubloons
        elseif ( (load_jrl_tdl() or load_hfp_tdl() and ctAccessibility > AccessibilityLevel.None or load_ww_tdl() and has("wwa")) and tdlAccessibility > AccessibilityLevel.None and has("springb") ) then
            logic = 7 -- smuggle springy step shoes from TDL, requires entrance rando
        elseif ( (load_jrl_gi() or load_hfp_gi() and ctAccessibility > AccessibilityLevel.None or load_ww_gi() and has("wwa")) and giAccessibility > AccessibilityLevel.None and has("splitup") and has("clawbts") ) then
            logic = 7 -- smuggle claw clambers from GI, requires entrance rando, first floor access and split up to get out
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
        return self.dive(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        return self.dive(state) or self.beak_buster(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        return self.dive(state) or self.beak_buster(state)
    --]]
    
    if ( has("dive") ) then
        logic = 0
    elseif ( has("bbust") ) then
        logic = 2
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
        logic = self.spring_pad(state) or self.flight_pad(state) or\
            self.clockwork_shot(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.spring_pad(state) or self.flight_pad(state) or\
            self.clockwork_shot(state)
    --]]
    
    if ( has("tjump") or has("fpad") ) then
        logic = 0
    elseif ( can_clockworkShot() ) then
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
        logic = connector_MT_to_MTJadeSnakeGrove(true)
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

function jiggy_MT_targitzan(skip)
    local logic = 99
    --[[        jiggy_targitzan
    if self.world.options.logic_type == LogicType.option_intended:
      logic = self.jiggy_sschamber(state) and (self.blue_eggs_item(state) or self.fire_eggs_item(state) or self.grenade_eggs_item(state))           -- has("bblaster")
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
      logic = self.jiggy_sschamber(state)\
                     and ((self.blue_eggs_item(state) or self.fire_eggs_item(state) or self.grenade_eggs_item(state))\
                          or self.ice_eggs_item(state) and self.beak_bayonet(state))
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
      logic = self.jiggy_sschamber(state)\
                     and ((self.blue_eggs_item(state) or self.fire_eggs_item(state) or self.grenade_eggs_item(state))\
                          or self.ice_eggs_item(state) and self.beak_bayonet(state))
    elif self.world.options.logic_type == LogicType.option_glitches:
      logic = self.jiggy_sschamber(state)\
                     and ((self.blue_eggs_item(state) or self.fire_eggs_item(state) or self.grenade_eggs_item(state))\
                          or self.ice_eggs_item(state) and self.beak_bayonet(state))
    --]]
    
    if ( has("bblaster") and (has("begg") or has("feggs") or has("geggs")) ) then
        logic = 0
    elseif ( has("bblaster") and has("ieggs") and has("bbayonet") ) then
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
    
    return convertLogic(0, skip)
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
        logic = self.dive(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = True
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = True
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = True
    --]]
    
    -- Normal Logic
    if ( has("dive") ) then
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
    end
    
    return convertLogic(logic, skip)
end

----- Other

--------------- Glitter Gulch Mine

----- Basic & Access functions

function access_GGM_canLeave(skip)
    local logic = 99
    --[[
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.gm_jiggy(state) and self.climb(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.climb(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.climb(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.climb(state)
    --]]
    
    -- Normal Logic
    if ( has("climb") and has("gga") ) then
        logic = 0
        
    -- Sequence Breaking
    elseif ( has("climb") ) then
        logic = 1
    end
    
    return convertLogic(logic, skip)
end

function access_GGM_ttrot(skip)
    local logic = 99
    --[[
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.talon_trot(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.talon_trot(state) or self.turbo_trainers(state) or self.springy_step_shoes(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.talon_trot(state) or self.turbo_trainers(state) or self.springy_step_shoes(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.talon_trot(state) or self.turbo_trainers(state) or self.springy_step_shoes(state)
    --]]
    
    if ( has("ttrot") ) then
        logic = 0
    elseif ( has("ttrain") or has("springb") ) then
        logic = 1
    end
    
    return convertLogic(logic, skip)
end

function access_GGM_humba(skip)
    local logic = 99
    --[[        humbaGGM
    state.has(itemName.HUMBAGM, self.player) and state.can_reach_location(locationName.WARPGM3, self.player)
    --]]
    
    local warpToHumba = warp_GGM_humba(true)
    
    -- Normal Logic
    if ( has("humbagm") and warpToHumba <= logictype.CurrentStage ) then
        logic = 0
    
    -- Sequence Breaking
    elseif ( has("humbagm") ) then
        logic = warpToHumba
    end
    
    return convertLogic(logic, skip)
end

function access_GGM_canBreakBoulders(skip)
    local logic = 99
    --[[        GM_boulders
    return (self.bill_drill(state) and self.small_elevation(state)) or self.humbaGGM(state)
    --]]
    
    -- FIXIT check which boulders actually need a small elevation, because every one I've tried so far doesn't. I suspect the only one that does is the ordnance storage one
    -- FIXIT also every single if statement in glitter gulch mine that checks for small elevation should check for alternatives (eg. smuggling springy step shoes)
    
    local humba = access_GGM_humba(true)
    
    -- Normal Logic
    if ( has_billDrill() and can_reachSmallElevation() or humba <= logictype.CurrentStage ) then
        logic = 0
    
    -- Sequence Breaking
    else
        logic = humba
    end
    
    return convertLogic(logic, skip)
end

function access_GGM_mumbo(skip)
    local logic = 99
    --[[
    self.small_elevation(state) and state.has(itemName.MUMBOGM, self.player)
    --]]
    
    if ( can_reachSmallElevation() and has("mumbogm") ) then
        logic = 0
    elseif ( has("mumbogm") and access_GGM_ttrot(true) <= 7 ) then
        logic = 7 -- FIXIT you can smuggle talon trot to get to him
    end
    
    return convertLogic(logic, skip)
end

function access_GGM_slopes(skip)
    local logic = 99
    --[[        GGM_slope
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.ggm_trot(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.ggm_trot(state) or (self.GM_boulders(state) and self.split_up(state))
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.ggm_trot(state) or (self.GM_boulders(state) and self.split_up(state))
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.ggm_trot(state) or (self.GM_boulders(state) and self.split_up(state))
    --]]
    
    local ggmTrot = access_GGM_ttrot(true)
    local canBreakBoulders = access_GGM_canBreakBoulders(true)
    
    -- Normal Logic
    if ( ggmTrot <= logictype.CurrentStage ) then
        logic = 0
    elseif ( canBreakBoulders <= logictype.CurrentStage and has("splitup") ) then
        logic = 1
    
    -- Sequence Breaking
    else
        local splitUp = 99
        if ( has("splitup") ) then
            splitUp = canBreakBoulders
        end
        
        logic = math.max(1, math.min(ggmTrot, splitUp))
    end
    
    return convertLogic(logic, skip)
end

function access_GGM_canReachWaterfallCavernGate(skip)
    local logic = 99
    --[[        reach_waterfall_cavern_gate
    if self.world.options.logic_type == LogicType.option_intended:
      logic = self.turbo_trainers(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
      logic = self.ggm_trot(state)\
            or self.GM_boulders(state) and self.split_up(state)\
            or state.has(itemName.WARPGM1, self.player) and state.has(itemName.WARPGM5, self.player)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.ggm_trot(state)\
            or self.GM_boulders(state) and self.split_up(state)\
            or state.has(itemName.WARPGM1, self.player) and state.has(itemName.WARPGM5, self.player)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.ggm_trot(state)\
            or self.GM_boulders(state) and self.split_up(state)\
            or state.has(itemName.WARPGM1, self.player) and state.has(itemName.WARPGM5, self.player)
    --]]
    
    local ggmTrot = access_GGM_ttrot(true)
    local canBreakBoulders = access_GGM_canBreakBoulders(true)
    
    -- Normal Logic
    if ( has("ttrain") ) then
        logic = 0
    elseif ( ggmTrot <= logictype.CurrentStage or canBreakBoulders <= logictype.CurrentStage and has("splitup") or has("warpgm1") and has("warpgm5") or has("randomizewarppads_off") ) then
        logic = 1
        
    -- Sequence Breaking
    else
        local boulders = 99
        if ( has("splitup") ) then
            boulders = canBreakBoulders
        end
        
        logic = math.max(1, math.min(ggmTrot, boulders))
    end
    
    return convertLogic(logic, skip)
end

----- Silos

function silo_GGM_billDrill(skip)
    local logic = 99
    --[[        silo_bill_drill
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.check_notes(state, locationName.BDRILL)\
                and (self.flap_flip(state)\
                     or (self.tall_jump(state) or self.talon_trot(state) and self.flutter(state)) and self.grip_grab(state))
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.check_notes(state, locationName.BDRILL)\
                and (self.flap_flip(state)\
                     or (self.tall_jump(state) or self.talon_trot(state) and self.flutter(state)) and self.grip_grab(state))
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.check_notes(state, locationName.BDRILL)\
                and (self.flap_flip(state)\
                    or (self.tall_jump(state) or self.talon_trot(state) and self.flutter(state)) and self.grip_grab(state)\
                    or self.turbo_trainers(state))
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.check_notes(state, locationName.BDRILL)\
                and (self.flap_flip(state)\
                    or (self.tall_jump(state) or self.talon_trot(state) and self.flutter(state)) and self.grip_grab(state)\
                    or self.turbo_trainers(state))
    --]]
    
    if ( bdrill_count() ) then
        if ( has("fflip") or has("ggrab") and (has("tjump") or has("ttrot") and has("flutter")) ) then
            logic = 0
        elseif ( has("ttrain") ) then
            logic = 2
        end
    end
    
    return convertLogic(logic, skip)
end

function silo_GGM_beakBayonet(skip)
    local logic = 99
    --[[
    self.GM_boulders(state) and self.check_notes(state, locationName.BBAYONET)
    --]]
    
    local canBreakBoulders = access_GGM_canBreakBoulders(true)
    
    -- Normal Logic
    if ( canBreakBoulders <= logictype.CurrentStage and bbayonet_count() ) then
        logic = 0
    
    -- Sequence Breaking
    elseif ( bbayonet_count() ) then
        logic = canBreakBoulders
    end
    
    return convertLogic(logic, skip)
end

----- Warp Pads

function warp_GGM_humba(skip)
    local logic = 99
    --[[        warp_pad_ggm_wumba
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.ggm_trot(state) or self.warp_to_ggm_wumba(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.ggm_trot(state) or self.warp_to_ggm_wumba(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.ggm_trot(state) or self.clockwork_shot(state) or self.warp_to_ggm_wumba(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.ggm_trot(state) or self.clockwork_shot(state) or self.warp_to_ggm_wumba(state)
        
    return state.has(itemName.WARPGM3, self.player) and (
            state.has(itemName.WARPGM1, self.player)\
            or state.has(itemName.WARPGM2, self.player) and (
                self.small_elevation(state)\
                    or self.grip_grab(state)\
                    or self.beak_buster(state)\
                    or self.ggm_trot(state)\                                    -- redundant for this specific function
                    or self.warp_to_ggm_mumbo(state)                            -- redundant for this specific function; if you have the other warps, problem already solved
                if self.world.options.logic_type != LogicType.option_intended
                else self.small_elevation(state)
            )\
            or state.has(itemName.WARPGM4, self.player)\
            or state.has(itemName.WARPGM5, self.player)\
        )
    
    return state.has(itemName.WARPGM2, self.player) and (
            state.has(itemName.WARPGM1, self.player)\
            or state.has(itemName.WARPGM4, self.player)\
            or state.has(itemName.WARPGM5, self.player)\
        )
     --]]
    
    local ggmTrot = access_GGM_ttrot(true)
    
    if ( ggmTrot <= logictype.CurrentStage or has("warpgm3") and (has("warpgm1") or has("warpgm4") or has("warpgm5") or has("warpgm2") and can_reachSmallElevation()) ) then
        logic = 0 -- Normal Logic
    elseif ( has("warpgm3") and has("warpgm2") and (has("ggrab") or has("bbust")) ) then
        logic = 1 -- Normal Logic
    elseif ( ggmTrot < 2 ) then
        logic = ggmTrot -- Sequence Breaking
    elseif ( can_clockworkShot() ) then
        logic = 2 -- Normal Logic
        
    -- Sequence Breaking
    else
        logic = ggmTrot
    end
    
    return convertLogic(logic, skip)
end

function warp_GGM_mumbo(skip)
    local logic = 99
    --[[        warp_pad_ggm_mumbo
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.small_elevation(state) or self.warp_to_ggm_mumbo(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.small_elevation(state)\
                or self.grip_grab(state)\
                or self.beak_buster(state)\
                or self.ggm_trot(state)\
                or self.warp_to_ggm_mumbo(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.small_elevation(state)\
                or self.grip_grab(state)\
                or self.beak_buster(state)\
                or self.ggm_trot(state)\
                or self.warp_to_ggm_mumbo(state)\
                or self.clockwork_shot(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.small_elevation(state)\
                or self.grip_grab(state)\
                or self.beak_buster(state)\
                or self.ggm_trot(state)\
                or self.warp_to_ggm_mumbo(state)\
                or self.clockwork_shot(state)
                
    return state.has(itemName.WARPGM2, self.player) and (
            state.has(itemName.WARPGM1, self.player)\
            or state.has(itemName.WARPGM4, self.player)\
            or state.has(itemName.WARPGM5, self.player)\
        )
    --]]
    
    local ggmTrot = access_GGM_ttrot(true)
    
    -- Normal Logic
    if ( can_reachSmallElevation() or has("warpgm2") and (has("warpgm1") or has("warpgm4") or has("warpgm5")) ) then
        logic = 0
    elseif ( has("ggrab") or has("bbust") or ggmTrot <= logictype.CurrentStage ) then
        logic = 1
    elseif ( can_clockworkShot() ) then
        logic = 2
    elseif ( has("wwing") ) then
        logic = 7
        
    -- Sequence Breaking
    else
        logic = math.max(1, ggmTrot)
    end
    
    return convertLogic(logic, skip)
end

----- Jiggies

function jiggy_GGM_canFreeCanaryMary(skip)
    local logic = 99
    --[[        canary_mary_free
    if self.world.options.logic_type == LogicType.option_intended:
        return self.humbaGGM(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        return self.humbaGGM(state) or self.clockwork_eggs(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        return self.humbaGGM(state) or self.clockwork_eggs(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        return self.humbaGGM(state) or self.clockwork_eggs(state)
    --]]
    
    local humba = access_GGM_humba(true)
    
    -- Normal Logic
    if ( humba <= logictype.CurrentStage ) then
        logic = 0
    elseif ( can_shootEggs("ceggs") ) then
        logic = 1
    
    -- Sequence Breaking
    else
        logic = humba
    end
    
    return convertLogic(logic, skip)
end

function jiggy_GGM_generatorCavern(skip)
    local logic = 99
    --[[        jiggy_generator_cavern
    if self.world.options.logic_type == LogicType.option_intended:
      logic = self.fire_eggs(state) and self.egg_aim(state)\
                 and self.long_jump(state) and (self.flap_flip(state) or self.talon_trot(state))
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
      logic = (self.long_jump(state) and (self.flap_flip(state) or self.talon_trot(state)) and (self.has_fire(state) or self.bill_drill(state)))\
            or self.flap_flip(state) and self.beak_buster(state) and self.climb(state)\
            or self.GM_boulders(state) and self.leg_spring(state) and self.fire_eggs(state)\
            or self.GM_boulders(state) and self.tall_jump(state) and self.pack_whack(state) and self.climb(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.long_jump(state) and (self.flap_flip(state) or self.talon_trot(state))\
            or self.flap_flip(state) and self.beak_buster(state)\
            or self.clockwork_shot(state)\
            or self.GM_boulders(state) and self.tall_jump(state) and self.pack_whack(state) and self.climb(state)\
            or self.GM_boulders(state) and self.leg_spring(state)\
            or self.beak_buster(state) and self.grip_grab(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = (self.long_jump(state) and (self.flap_flip(state) or self.talon_trot(state)))\
            or self.flap_flip(state) and self.beak_buster(state)\
            or self.clockwork_shot(state)\
            or self.GM_boulders(state) and self.tall_jump(state) and self.pack_whack(state) and self.climb(state)\
            or self.GM_boulders(state) and self.leg_spring(state)\
            or self.beak_buster(state) and self.grip_grab(state)
    --]]
    
    local hasFire = can_useFire(true)
    local canBreakBoulders = access_GGM_canBreakBoulders(true)
    
    -- Normal Logic
    if ( has("feggs") and has("eggaim") and can_longJump() and (has("fflip") or has("ttrot")) ) then
        logic = 0
    elseif ( can_longJump() and (has("fflip") or has("ttrot")) and (has_billDrill() or hasFire <= logictype.CurrentStage) or has("fflip") and has("bbust") and has("climb") or canBreakBoulders <= logictype.CurrentStage and (has_legSpring() and can_shootEggs("feggs") or has("tjump") and has_packWhack() and has("climb")) ) then
        logic = 1
    elseif ( can_longJump() and (has("fflip") or has("ttrot")) or has("fflip") and has("bbust") or can_clockworkShot() or canBreakBoulders <= logictype.CurrentStage and has_legSpring() or has("ggrab") and has("bbust") ) then
        logic = 2
    
    -- Sequence Breaking
    elseif ( has_legSpring() or has("tjump") and has_packWhack() and has("climb") ) then
        logic = math.max(1, canBreakBoulders)
    end
    
    return convertLogic(logic, skip)
end

function jiggy_GGM_waterfallCavern(skip)
    local logic = 99
    --[[        jiggy_waterfall_cavern
    if self.world.options.logic_type == LogicType.option_intended:
      logic = (self.grip_grab(state) or self.small_elevation(state)) and self.reach_waterfall_cavern_gate(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
      logic = self.reach_waterfall_cavern_gate(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.reach_waterfall_cavern_gate(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.reach_waterfall_cavern_gate(state)
    --]]
    
    local reachWaterfallCavernGate = access_GGM_canReachWaterfallCavernGate(true)
    
    -- Normal Logic
    if ( (has("ggrab") or can_reachSmallElevation()) and reachWaterfallCavernGate <= logictype.CurrentStage ) then
        logic = 0
    elseif ( reachWaterfallCavernGate <= logictype.CurrentStage ) then
        logic = 1
    
    -- Sequence Breaking
    else
        logic = math.max(1, reachWaterfallCavernGate)
    end
    
    return convertLogic(logic, skip)
end

function jiggy_GGM_ordnanceStorage(skip)
    local logic = 99
    --[[        jiggy_ordnance_storage
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.breegull_blaster(state) and self.beak_bayonet(state) and \
                self.GM_boulders(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.breegull_blaster(state) and self.beak_bayonet(state) and \
                self.GM_boulders(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.breegull_blaster(state) and self.beak_bayonet(state) and \
                self.GM_boulders(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.breegull_blaster(state) and self.beak_bayonet(state) and \
                self.GM_boulders(state)
    --]]
    
    local canBreakBoulders = access_GGM_canBreakBoulders(true)
    
    -- Normal Logic
    if ( has("bblaster") and has("bbayonet") and canBreakBoulders <= logictype.CurrentStage ) then
        logic = 0
    
    -- Sequence Breaking
    elseif ( has("bblaster") and has("bbayonet") ) then
        logic = canBreakBoulders
    end
    
    return convertLogic(logic, skip)
end

function jiggy_GGM_crushingShed(skip)
    local logic = 99
    --[[        jiggy_crushing_shed
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.mumboGGM(state) and self.beak_barge(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.mumboGGM(state) and self.beak_barge(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.mumboGGM(state) and self.beak_barge(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.mumboGGM(state) and self.beak_barge(state)
    --]]
    
    local mumbo = access_GGM_mumbo(true)
    
    -- Normal Logic
    if ( mumbo <= logictype.CurrentStage and has("bbarge") ) then
        logic = 0
    
    -- Sequence Breaking
    elseif ( has("bbarge") ) then
        logic = mumbo
    end
    
    return convertLogic(logic, skip)
end

function jiggy_GGM_waterfall(skip)
    local logic = 99
    --[[        jiggy_waterfall
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.springy_step_shoes(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.springy_step_shoes(state) or \
                (self.glide(state)\
                or self.wing_whack(state) and (self.tall_jump(state) or self.leg_spring(state))) and self.GM_boulders(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.springy_step_shoes(state) or \
                (self.glide(state)\
                or self.wing_whack(state) and (self.tall_jump(state) or self.leg_spring(state))) and self.GM_boulders(state)\
                or self.clockwork_shot(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.springy_step_shoes(state) or \
                (self.glide(state)\
                or self.wing_whack(state) and (self.tall_jump(state) or self.leg_spring(state))) and self.GM_boulders(state)\
                or self.clockwork_shot(state)
    --]]
    
    local canBreakBoulders = access_GGM_canBreakBoulders(true)
    
    -- Normal Logic
    if ( has("springb") ) then
        logic = 0
    elseif ( canBreakBoulders <= logictype.CurrentStage and (has_glide() or has_wingWhack() and (has("tjump") or has_legSpring())) ) then
        logic = 1
    elseif ( can_clockworkShot() ) then
        logic = 2
    
    -- Sequence Breaking
    elseif ( has_glide() or has_wingWhack() and (has("tjump") or has_legSpring()) ) then
        logic = math.max(1, canBreakBoulders)
    end
    
    return convertLogic(logic, skip)
end

function jiggy_GGM_powerHut(skip)
    local logic = 99
    --[[        jiggy_power_hut
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.GM_boulders(state) and self.split_up(state) and self.climb(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.GM_boulders(state) and\
                ((self.split_up(state) and self.climb(state)) or self.has_fire(state) or self.bill_drill(state))
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.GM_boulders(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.GM_boulders(state)
    --]]
    
    local canBreakBoulders = access_GGM_canBreakBoulders(true)
    local hasFire = can_useFire(true)
    
    -- Normal Logic
    if ( canBreakBoulders <= logictype.CurrentStage and has("splitup") and has("climb") ) then
        logic = 0
    elseif ( canBreakBoulders <= logictype.CurrentStage and (hasFire <= logictype.CurrentStage or has_billDrill()) ) then
        logic = 1
    elseif ( canBreakBoulders <= logictype.CurrentStage ) then
        logic = 2
    
    -- Sequence Breaking
    else
        logic = math.max(2, canBreakBoulders)
    end
    
    return convertLogic(logic, skip)
end

function jiggy_GGM_floodedCaves(skip)
    local logic = 99
    --[[        jiggy_flooded_caves
    if self.world.options.logic_type == LogicType.option_intended:
            logic = self.humbaGGM(state) and self.dive(state) and (self.tall_jump(state) or self.grip_grab(state))

    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.dive(state) and (self.tall_jump(state) or self.grip_grab(state) or self.beak_buster(state))\
                and (self.humbaGGM(state)\
                    or self.reach_waterfall_cavern_gate(state) and (
                        self.talon_trot(state) and (self.flutter(state) or self.air_rat_a_tat_rap(state))\
                        or self.roll(state) and self.tall_jump(state) and (self.flutter(state) or self.air_rat_a_tat_rap(state))
                    )
                )

    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.dive(state) and (self.tall_jump(state) or self.grip_grab(state) or self.beak_buster(state) or self.clockwork_shot(state))\
                and (self.humbaGGM(state)\
                    or self.reach_waterfall_cavern_gate(state) and (
                        self.talon_trot(state) and (self.flutter(state) or self.air_rat_a_tat_rap(state))\
                        or self.roll(state) and self.tall_jump(state) and (self.flutter(state) or self.air_rat_a_tat_rap(state))
                    )
                )

    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.dive(state) and (self.tall_jump(state) or self.grip_grab(state) or self.beak_buster(state) or self.clockwork_shot(state))\
                and (self.humbaGGM(state)\
                    or self.reach_waterfall_cavern_gate(state) and (
                        self.talon_trot(state) and (self.flutter(state) or self.air_rat_a_tat_rap(state))\
                        or self.roll(state) and self.tall_jump(state) and (self.flutter(state) or self.air_rat_a_tat_rap(state))
                    )
                )
    --]]
    
    local humba = access_GGM_humba(true)
    local canReachWaterfallCavern = access_GGM_canReachWaterfallCavernGate(true)
    
    -- Normal Logic
    if ( has("dive") and (has("tjump") or has("ggrab")) and humba <= logictype.CurrentStage ) then
        logic = 0
    elseif ( has("dive") and (has("tjump") or has("ggrab") or has("bbust")) and (humba <= logictype.CurrentStage or canReachWaterfallCavern <= logictype.CurrentStage and (has("ttrot") or has("roll") and has("tjump")) and (has("flutter") or has("arat"))) ) then
        logic = 1
    elseif ( has("dive") and can_clockworkShot() and (humba <= logictype.CurrentStage or canReachWaterfallCavern <= logictype.CurrentStage and (has("ttrot") or has("roll") and has("tjump")) and (has("flutter") or has("arat"))) ) then
        logic = 2
    
    -- Sequence Breaking
    elseif ( has("dive") and humba <= logictype.CurrentStage ) then
        logic = 7 -- instant transform
    elseif ( has("dive") and (has("tjump") or has("ggrab") or has("bbust") or can_clockworkShot()) ) then
        local waterfallCavern = 99
        if ( (has("ttrot") or has("roll") and has("tjump")) and (has("flutter") or has("arat")) ) then
            waterfallCavern = canReachWaterfallCavern
        end
        
        logic = math.max(2, math.min(humba, waterfallCavern))
    end
    
    return convertLogic(logic, skip)
end

----- Notes

function treble_GGM(skip)
    local logic = 99
    --[[        treble_gm
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.dive(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.dive(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.dive(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.dive(state) or (self.GM_boulders(state) and self.leg_spring(state))
    --]]
    
    local canBreakBoulders = access_GGM_canBreakBoulders(true)
    
    -- Normal Logic
    if ( has("dive") ) then
        logic = 0
    elseif ( has_legSpring() and canBreakBoulders <= logictype.CurrentStage ) then
        logic = 3
        
    -- Sequence Breaking
    elseif ( has_legSpring() ) then
        logic = math.max(3, canBreakBoulders)
    end
    
    return convertLogic(logic, skip)
end

function notes_GGM_greenPile(skip)
    local logic = 99
    --[[        notes_green_pile
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.GGM_slope(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.GGM_slope(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.GGM_slope(state) or self.clockwork_shot(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.GGM_slope(state) or self.clockwork_shot(state)
    --]]
    
    local slopes = access_GGM_slopes(true)
    
    if ( slopes <= logictype.CurrentStage ) then
        logic = 0 -- Normal Logic
    elseif ( slopes < 2 ) then
        logic = slopes -- Sequence Breaking
    elseif ( can_clockworkShot() ) then
        logic = 2 -- Normal Logic
    
    -- Sequence Breaking
    else
        logic = slopes
    end
    
    return convertLogic(logic, skip)
end

function notes_GGM_nearProspectorsHutEasy(skip)
    local logic = 99
    --[[        notes_prospector_easy
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.GGM_slope(state)\
                or self.flap_flip(state)\
                or (self.mt_jiggy(state) and self.dilberta_free(state))\
                or self.tall_jump(state) and self.grip_grab(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = True
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = True
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = True
    --]]
    
    local mtpcAccessibility = Tracker:FindObjectForCode("@Region: Mayahem Temple - Prison Compound").AccessibilityLevel
    local slopes = access_GGM_slopes(true)
    local freeDilberta = access_MT_canFreeDilberta(true)
    
    if ( slopes <= logictype.CurrentStage or has("fflip") or (mtpcAccessibility == AccessibilityLevel.Normal or mtpcAccessibility == AccessibilityLevel.Cleared) and freeDilberta <= logictype.CurrentStage or has("tjump") and has("ggrab") ) then
        logic = 0
    else
        logic = 1
    end
    
    return convertLogic(logic, skip)
end

function notes_GGM_nearProspectorsHutHard(skip) -- FIXIT I need to test to make sure I know which one of the five notes uses this; I just sorta guessed for now
    local logic = 99
    --[[        notes_prospector_hard
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.GGM_slope(state) or self.flap_flip(state) or (self.mt_jiggy(state) and self.dilberta_free(state))
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = True
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = True
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = True
    --]]
    
    local mtpcAccessibility = Tracker:FindObjectForCode("@Region: Mayahem Temple - Prison Compound").AccessibilityLevel
    local slopes = access_GGM_slopes(true)
    local freeDilberta = access_MT_canFreeDilberta(true)
    
    if ( slopes <= logictype.CurrentStage or has("fflip") or (mtpcAccessibility == AccessibilityLevel.Normal or mtpcAccessibility == AccessibilityLevel.Cleared) and freeDilberta <= logictype.CurrentStage ) then
        logic = 0
    else
        logic = 1
    end
    
    return convertLogic(logic, skip)
end

function notes_GGM_nearMumboEasy(skip)
    local logic = 99
    --[[        notes_gm_mumbo_easy
     if self.world.options.logic_type == LogicType.option_intended:
        logic = self.small_elevation(state) or self.warp_to_ggm_mumbo(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.small_elevation(state) or self.grip_grab(state) or self.beak_buster(state) or self.ggm_trot(state) or self.warp_to_ggm_mumbo(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.small_elevation(state) or self.grip_grab(state) or self.clockwork_shot(state) or self.beak_buster(state) or self.ggm_trot(state) or self.warp_to_ggm_mumbo(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.small_elevation(state) or self.grip_grab(state) or self.clockwork_shot(state) or self.beak_buster(state) or self.ggm_trot(state) or self.warp_to_ggm_mumbo(state)
                
    return state.has(itemName.WARPGM2, self.player) and (
            state.has(itemName.WARPGM1, self.player)\
            or state.has(itemName.WARPGM4, self.player)\
            or state.has(itemName.WARPGM5, self.player)\
        )
     --]]
    
    local ggmTrot = access_GGM_ttrot(true)
    
    -- Normal Logic
    if ( can_reachSmallElevation() or has("warpgm2") and (has("warpgm1") or has("warpgm4") or has("warpgm5")) ) then
        logic = 0
    elseif ( has("ggrab") or has("bbust") or ggmTrot <= logictype.CurrentStage ) then
        logic = 1
    elseif ( can_clockworkShot() ) then
        logic = 2
    elseif ( has("wwing") ) then
        logic = 7
    
    -- Sequence Breaking
    else
        logic = math.max(1, ggmTrot)
    end
    
    return convertLogic(logic, skip)
end

function notes_GGM_nearMumboHard(skip)
    local logic = 99
    --[[        notes_gm_mumbo_hard
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.small_elevation(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.small_elevation(state) or self.grip_grab(state) or self.beak_buster(state) or self.ggm_trot(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.small_elevation(state) or self.grip_grab(state) or self.clockwork_shot(state) or self.beak_buster(state) or self.ggm_trot(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.small_elevation(state) or self.grip_grab(state) or self.clockwork_shot(state) or self.beak_buster(state) or self.ggm_trot(state)
    --]]
    
    local ggmTrot = access_GGM_ttrot(true)
    
    -- Normal Logic
    if ( can_reachSmallElevation() ) then
        logic = 0
    elseif ( has("ggrab") or has("bbust") or ggmTrot <= logictype.CurrentStage ) then
        logic = 1
    elseif ( can_clockworkShot() ) then
        logic = 2
    elseif ( has("wwing") ) then
        logic = 7
    
    -- Sequence Breaking
    else
        logic = math.max(1, ggmTrot)
    end
    
    return convertLogic(logic, skip)
end

function notes_GGM_fuelDepotEasy(skip)
    local logic = 99
    --[[        notes_easy_fuel_depot
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

function notes_GGM_fuelDepotHard(skip)
    local logic = 99
    --[[        notes_hard_fuel_depot
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.small_elevation(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.small_elevation(state) or self.ggm_trot(state) or self.beak_buster(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.small_elevation(state) or self.ggm_trot(state) or self.clockwork_shot(state) or self.beak_buster(state) or self.air_rat_a_tat_rap(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.small_elevation(state) or self.ggm_trot(state) or self.clockwork_shot(state) or self.beak_buster(state) or self.air_rat_a_tat_rap(state)
    --]]
    
    local ggmTrot = access_GGM_ttrot(true)
    
    -- Normal Logic
    if ( can_reachSmallElevation() ) then
        logic = 0
    elseif ( has("bbust") or ggmTrot <= logictype.CurrentStage ) then
        logic = 1
    elseif ( can_clockworkShot() or has("arat") ) then
        logic = 2
    elseif ( has("wwing") ) then
        logic = 7
    
    -- Sequence Breaking
    else
        logic = math.max(1, ggmTrot)
    end
    
    return convertLogic(logic, skip)
end

----- Nests

function nests_GGM_nearBillDrillSilo(skip)
    local logic = 99
    --[[        nest_bill_drill
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.slightly_elevated_ledge(state) or self.flap_flip(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = ((self.talon_trot(state) or self.springy_step_shoes(state) or self.turbo_trainers(state)) and (self.flutter(state) or self.air_rat_a_tat_rap(state)) or self.tall_jump(state)) and self.grip_grab(state)\
                or self.flap_flip(state)\
                or self.GM_boulders(state) and self.split_up(state)\
                or self.humbaGGM(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = ((self.talon_trot(state) or self.springy_step_shoes(state)) and (self.flutter(state) or self.air_rat_a_tat_rap(state)) or self.tall_jump(state)) and self.grip_grab(state)\
                or self.flap_flip(state)\
                or self.turbo_trainers(state)\
                or self.clockwork_shot(state)\
                or self.GM_boulders(state) and self.split_up(state)\
                or self.humbaGGM(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = ((self.talon_trot(state) or self.springy_step_shoes(state)) and (self.flutter(state) or self.air_rat_a_tat_rap(state)) or self.tall_jump(state)) and self.grip_grab(state)\
                or self.flap_flip(state)\
                or self.turbo_trainers(state)\
                or self.clockwork_shot(state)\
                or self.GM_boulders(state) and self.split_up(state)\
                or self.humbaGGM(state)
    --]]
    
    local canBreakBoulders = access_GGM_canBreakBoulders(true)
    local humba = access_GGM_humba(true)
    
    -- Normal Logic
    if ( can_reachSlightlyElevatedLedge() or has("fflip") ) then
        logic = 0
    elseif ( has("ggrab") and ((has("ttrot") or has("springb") or has("ttrain")) and (has("flutter") or has("arat")) or has("tjump")) or canBreakBoulders <= logictype.CurrentStage and has("splitup") or humba <= logictype.CurrentStage ) then
        logic = 1
    elseif ( can_clockworkShot() or has("ttrain") ) then
        logic = 2
    
    -- Sequence Breaking
    else
        local splitUp = 99
        if ( has("splitup") ) then
            splitUp = canBreakBoulders
        end
        
        logic = math.max(1, math.min(humba, canBreakBoulders))
    end
    
    return convertLogic(logic, skip)
end

function nests_GGM_floodedCaves(skip)
    local logic = 99
    --[[        nest_flooded_caves
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.humbaGGM(state) and self.dive(state)

    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.dive(state)\
                and (self.humbaGGM(state)\
                    or self.talon_trot(state) and (self.flutter(state) or self.air_rat_a_tat_rap(state))\
                    or self.roll(state) and self.tall_jump(state)\
                        and (self.flutter(state) or self.air_rat_a_tat_rap(state)) and self.reach_waterfall_cavern_gate(state)
                )

    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.dive(state)\
                and (self.humbaGGM(state)\
                    or self.talon_trot(state) and (self.flutter(state) or self.air_rat_a_tat_rap(state))\
                    or self.roll(state) and self.tall_jump(state)\
                        and (self.flutter(state) or self.air_rat_a_tat_rap(state)) and self.reach_waterfall_cavern_gate(state)
                )

    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.dive(state)\
                and (self.humbaGGM(state)\
                    or self.talon_trot(state) and (self.flutter(state) or self.air_rat_a_tat_rap(state))\
                    or self.roll(state) and self.tall_jump(state)\
                        and (self.flutter(state) or self.air_rat_a_tat_rap(state)) and self.reach_waterfall_cavern_gate(state)
                )
     --]]
    
    local humba = access_GGM_humba(true)
    local canReachWaterfallCavern = access_GGM_canReachWaterfallCavernGate(true)
    
    -- Normal Logic
    if ( has("dive") and humba <= logictype.CurrentStage ) then
        logic = 0
    elseif ( has("dive") and (humba <= logictype.CurrentStage or has("ttrot") and (has("flutter") or has("arat")) or has("roll") and has("tjump") and (has("flutter") or has("arat")) and canReachWaterfallCavern <= logictype.CurrentStage) ) then
        logic = 1
    
    -- Sequence Breaking
    elseif ( has("dive") ) then
        local longJump = 99
        if ( has("roll") and has("tjump") and (has("flutter") or has("arat")) ) then
            longJump = math.max(1, canReachWaterfallCavern)
        end
        
        logic = math.min(humba, longJump)
    end
    
    return convertLogic(logic, skip)
end

function nests_GGM_outsidePowerHut(skip)
    local logic = 99
    --[[        nest_outside_power_hut
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.GM_boulders(state) and self.small_elevation(state)

    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.GM_boulders(state) and (\
                    self.small_elevation(state)\
                    or self.beak_buster(state)\
                    or self.turbo_trainers(state)\
                    or self.split_up(state))

    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.GM_boulders(state) and (\
                    self.small_elevation(state)\
                    or self.beak_buster(state)\
                    or self.turbo_trainers(state)\
                    or self.split_up(state)\
                    or self.clockwork_shot(state)
                )

    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.GM_boulders(state) and (\
                    self.small_elevation(state)\
                    or self.beak_buster(state)\
                    or self.turbo_trainers(state)\
                    or self.split_up(state)\
                    or self.clockwork_shot(state)
                )
    --]]
    
    local canBreakBoulders = access_GGM_canBreakBoulders(true)
    
    -- Normal Logic
    if ( canBreakBoulders <= logictype.CurrentStage and can_reachSmallElevation() ) then
        logic = 0
    elseif ( canBreakBoulders <= logictype.CurrentStage and (has("bbust") or has("ttrain") or has("splitup")) ) then
        logic = 1
    elseif ( canBreakBoulders <= logictype.CurrentStage and clockwork_shot() ) then
        logic = 2
    
    -- Sequence Breaking
    elseif ( has("bbust") or has("ttrain") or has("splitup") or clockwork_shot() ) then
        logic = math.max(2, canBreakBoulders)
    end
    
    return convertLogic(logic, skip)
end

function nests_GGM_mumbo(skip)
    local logic = 99
    --[[        nest_ggm_mumbo
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.small_elevation(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.small_elevation(state) or self.grip_grab(state) or self.beak_buster(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.small_elevation(state) or self.grip_grab(state) or self.clockwork_shot(state) or self.beak_buster(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.small_elevation(state) or self.grip_grab(state) or self.clockwork_shot(state) or self.beak_buster(state)
    --]]
    
    if ( can_reachSmallElevation() ) then
        logic = 0
    elseif ( has("ggrab") or has("bbust") ) then
        logic = 1
    elseif ( can_clockworkShot() ) then
        logic = 2
    end
    
    return convertLogic(logic, skip)
end

function nests_GGM_toxicGasCave(skip)
    local logic = 99
    --[[        nest_toxic_gas_cave
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.GM_boulders(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.GM_boulders(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.GM_boulders(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.GM_boulders(state) or self.ground_rat_a_tat_rap(state) or self.beak_barge(state) or self.egg_barge(state)      -- egg barge requires beak barge, so this is redundant
    --]]
    
    local canBreakBoulders = access_GGM_canBreakBoulders(true)
    
    if ( canBreakBoulders <= logictype.CurrentStage ) then
        logic = 0 -- Normal Logic
    elseif ( canBreakBoulders < 3 ) then
        logic = canBreakBoulders -- Sequence Breaking
    elseif ( has("grat") or has("bbarge") ) then
        logic = 3 -- Normal Logic
    
    -- Sequence Breaking
    else
        logic = canBreakBoulders
    end
    
    return convertLogic(logic, skip)
end

function nests_GGM_canaryCaveHigh(skip)
    local logic = 99
    --[[        nest_canary_high
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.humbaGGM(state) and (self.small_elevation(state) or self.grip_grab(state))
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.humbaGGM(state) and (self.small_elevation(state) or self.grip_grab(state))
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.humbaGGM(state) and (self.small_elevation(state) or self.grip_grab(state) or self.clockwork_shot(state))
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.humbaGGM(state) and (self.small_elevation(state) or self.grip_grab(state) or self.clockwork_shot(state))
    --]]
    
    local humba = access_GGM_humba(true)
    
    if ( humba <= logictype.CurrentStage and (can_reachSmallElevation() or has("ggrab")) ) then
        logic = 0 -- Normal Logic
    elseif ( humba < 2 and (can_reachSmallElevation() or has("ggrab")) ) then
        logic = humba -- Sequence Breaking
    elseif ( humba <= logictype.CurrentStage and can_clockworkShot() ) then
        logic = 2 -- Normal Logic
    
    -- Sequence Breaking
    elseif ( can_reachSmallElevation() or has("ggrab") or can_clockworkShot() ) then
        logic = math.max(2, humba)
    end
    
    return convertLogic(logic, skip)
end

function nests_GGM_canaryCaveLow(skip)
    local logic = 99
    --[[        nest_canary_low
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.humbaGGM(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.humbaGGM(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.humbaGGM(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.humbaGGM(state)
    --]]
    
    logic = access_GGM_humba(true)
    
    return convertLogic(logic, skip)
end

----- Signs

function signpost_GGM_gloomyCavern(skip)
    local logic = 99
    --[[        signpost_gloomy_cavern
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.GM_boulders(state) and (self.small_elevation(state) or self.split_up(state))
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.GM_boulders(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.GM_boulders(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.GM_boulders(state)
    --]]
    
    local canBreakBoulders = access_GGM_canBreakBoulders(true)
    
    -- Normal Logic
    if ( canBreakBoulders <= logictype.CurrentStage and (has("splitup") or can_reachSmallElevation()) ) then
        logic = 0
    elseif ( canBreakBoulders <= logictype.CurrentStage ) then
        logic = 1
    
    -- Sequence Breaking
    else
        logic = math.max(1, canBreakBoulders)
    end
    
    return convertLogic(logic, skip)
end

function signpost_GGM_chuffysWagon(skip)
    local logic = 99
    --[[        signpost_chuffy
    if self.world.options.logic_type == LogicType.option_intended:
        logic = state.can_reach_region(regionName.GM, self.player) and self.flap_flip(state)\
                or state.can_reach_region(regionName.WW, self.player) and state.has(itemName.TRAINSWWW, self.player) and state.has(itemName.CHUFFY, self.player)\
                or state.can_reach_region(regionName.TL, self.player) and state.has(itemName.TRAINSWTD, self.player) and state.has(itemName.CHUFFY, self.player)\
                or state.can_reach_region(regionName.GI1, self.player) and state.has(itemName.TRAINSWGI, self.player) and state.has(itemName.CHUFFY, self.player)\
                or state.can_reach_region(regionName.IOHCT, self.player) and state.has(itemName.TRAINSWIH, self.player) and state.has(itemName.CHUFFY, self.player)

    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = state.can_reach_region(regionName.GM, self.player) and (self.small_elevation(state) or self.beak_buster(state) or self.humbaGGM(state) or self.ggm_trot(state))\
                or state.can_reach_region(regionName.WW, self.player) and state.has(itemName.TRAINSWWW, self.player) and state.has(itemName.CHUFFY, self.player)\
                or state.can_reach_region(regionName.TL, self.player) and state.has(itemName.TRAINSWTD, self.player) and state.has(itemName.CHUFFY, self.player)\
                or state.can_reach_region(regionName.GI1, self.player) and state.has(itemName.TRAINSWGI, self.player) and state.has(itemName.CHUFFY, self.player)\
                or state.can_reach_region(regionName.IOHCT, self.player) and state.has(itemName.TRAINSWIH, self.player) and state.has(itemName.CHUFFY, self.player)\
                or state.can_reach_region(regionName.HP, self.player) and state.has(itemName.TRAINSWHP1, self.player) and self.hfp_top(state)\
                    and (self.leg_spring(state)\
                        or self.tall_jump(state) and self.pack_whack(state)\
                        or self.flap_flip(state)\
                        or self.claw_clamber_boots(state)\
                        or self.flight_pad(state))
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = state.can_reach_region(regionName.GM, self.player) and (self.small_elevation(state) or self.beak_buster(state) or self.humbaGGM(state) or self.ggm_trot(state))\
                or state.can_reach_region(regionName.WW, self.player) and state.has(itemName.TRAINSWWW, self.player) and state.has(itemName.CHUFFY, self.player)\
                or state.can_reach_region(regionName.TL, self.player) and state.has(itemName.TRAINSWTD, self.player) and state.has(itemName.CHUFFY, self.player)\
                or state.can_reach_region(regionName.GI1, self.player) and state.has(itemName.TRAINSWGI, self.player) and state.has(itemName.CHUFFY, self.player)\
                or state.can_reach_region(regionName.IOHCT, self.player) and state.has(itemName.TRAINSWIH, self.player) and state.has(itemName.CHUFFY, self.player)\
                or state.can_reach_region(regionName.HP, self.player) and state.has(itemName.TRAINSWHP1, self.player) and self.hfp_top(state)\
                    and (self.leg_spring(state)\
                        or self.tall_jump(state) and self.pack_whack(state)\
                        or self.flap_flip(state)\
                        or self.claw_clamber_boots(state)\
                        or self.flight_pad(state))
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = state.can_reach_region(regionName.GM, self.player) and (self.small_elevation(state) or self.beak_buster(state) or self.humbaGGM(state) or self.ggm_trot(state))\
                or state.can_reach_region(regionName.WW, self.player) and state.has(itemName.TRAINSWWW, self.player) and state.has(itemName.CHUFFY, self.player)\
                or state.can_reach_region(regionName.TL, self.player) and state.has(itemName.TRAINSWTD, self.player) and state.has(itemName.CHUFFY, self.player)\
                or state.can_reach_region(regionName.GI1, self.player) and state.has(itemName.TRAINSWGI, self.player) and state.has(itemName.CHUFFY, self.player)\
                or state.can_reach_region(regionName.IOHCT, self.player) and state.has(itemName.TRAINSWIH, self.player) and state.has(itemName.CHUFFY, self.player)\
                or state.can_reach_region(regionName.HP, self.player) and state.has(itemName.TRAINSWHP1, self.player) and self.hfp_top(state)\
                    and (self.leg_spring(state)\
                        or self.tall_jump(state) and self.pack_whack(state)\
                        or self.flap_flip(state)\
                        or self.claw_clamber_boots(state)\
                        or self.flight_pad(state))
    --]]
    
    local ggmAccessibility = Tracker:FindObjectForCode("@Region: Glitter Gulch Mine - Main Area").AccessibilityLevel
    local wwAccessibility = Tracker:FindObjectForCode("@Region: Witchyworld - Main Area").AccessibilityLevel
    local tdlAccessibility = Tracker:FindObjectForCode("@Region: Terrydactyland - Main Area").AccessibilityLevel
    local gif1Accessibility = Tracker:FindObjectForCode("@Region: Grunty Industries 1st Floor").AccessibilityLevel
    local ctAccessibility = Tracker:FindObjectForCode("@Region: Cliff Top").AccessibilityLevel
    local hfpAccessibility = Tracker:FindObjectForCode("@Region: Hailfire Peaks - Lava Side").AccessibilityLevel
    local ggmAccessTrue = (ggmAccessibility == AccessibilityLevel.Normal or ggmAccessibility == AccessibilityLevel.Cleared)
    local wwAccessTrue = (wwAccessibility == AccessibilityLevel.Normal or wwAccessibility == AccessibilityLevel.Cleared)
    local tdlAccessTrue = (tdlAccessibility == AccessibilityLevel.Normal or tdlAccessibility == AccessibilityLevel.Cleared)
    local gif1AccessTrue = (gif1Accessibility == AccessibilityLevel.Normal or gif1Accessibility == AccessibilityLevel.Cleared)
    local ctAccessTrue = (ctAccessibility == AccessibilityLevel.Normal or ctAccessibility == AccessibilityLevel.Cleared)
    local hfpAccessTrue = (hfpAccessibility == AccessibilityLevel.Normal or hfpAccessibility == AccessibilityLevel.Cleared)
    local ggmHumba = access_GGM_humba(true)
    local hfpTop = access_HFP_lavaSideTop(true)
    local ggmTrot = access_GGM_ttrot(true)
    
    -- Normal Logic
    if ( ggmAccessTrue and has("fflip") or has("chuffy") and (wwAccessTrue and has("trainswww") or tdlAccessTrue and has("trainswtd") or gif1AccessTrue and has("trainswgi") or ctAccessTrue and has("trainswih")) ) then
        logic = 0
    elseif ( ggmAccessTrue and (can_reachSmallElevation() or has("bbust") or ggmHumba <= logictype.CurrentStage or ggmTrot <= logictype.CurrentStage) or has("chuffy") and hfpAccessTrue and has("trainswhp1") and hfpTop <= logictype.CurrentStage and (has_legSpring() or has("tjump") and has_packWhack() or has("fflip") or has("clawbts") or has("fpad")) ) then
        logic = 1
    
    -- Sequence Breaking
    else
        local fromGGM = 99
        if ( ggmAccessTrue ) then
            fromGGM = math.min(ggmHumba, ggmTrot)
        elseif ( ggmAccessibility > AccessibilityLevel.None and (has("fflip") or can_reachSmallElevation() or has("bbust")) ) then
            fromGGM = logictype.CurrentStage + 1
        elseif ( ggmAccessibility > AccessibilityLevel.None ) then
            fromGGM = math.max(logictype.CurrentStage + 1, math.min(ggmHumba, ggmTrot))
        end
        
        local fromWW = 99
        if ( has("chuffy") and has("trainswww") and wwAccessibility > AccessibilityLevel.None ) then
            fromWW = logictype.CurrentStage + 1
        end
        
        local fromTDL = 99
        if ( has("chuffy") and has("trainswtd") and tdlAccessibility > AccessibilityLevel.None ) then
            fromTDL = logictype.CurrentStage + 1
        end
        
        local fromGI = 99
        if ( has("chuffy") and has("trainswgi") and gif1Accessibility > AccessibilityLevel.None ) then
            fromGI = logictype.CurrentStage + 1
        end
        
        local fromCT = 99
        if ( has("chuffy") and has("trainswih") and ctAccessibility > AccessibilityLevel.None ) then
            fromCT = logictype.CurrentStage + 1
        end
        
        local fromHFP = 99
        if ( hfpAccessTrue and has("chuffy") and has("trainswhp1") and (has_legSpring() or has("tjump") and has_packWhack() or has("fflip") or has("clawbts") or has("fpad")) ) then
            fromHFP = hfpTop
        elseif ( hfpAccessibility > AccessibilityLevel.None and has("chuffy") and has("trainswhp1") and (has_legSpring() or has("tjump") and has_packWhack() or has("fflip") or has("clawbts") or has("fpad")) ) then
            fromHFP = math.max(hfpTop, logictype.CurrentStage + 1)
        end
        
        logic = math.max(1, math.min(fromGGM, fromWW, fromTDL, fromGI, fromCT, fromHFP))
    end
    
    return convertLogic(logic, skip)
end

----- Other - Jinjos

function jinjo_GGM_jail(skip)
    local logic = 99
    --[[        jinjo_jail
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.humbaGGM(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.humbaGGM(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.humbaGGM(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.humbaGGM(state) or (self.bill_drill(state) and self.clockwork_shot(state))
    --]]
    
    local humba = access_GGM_humba(true)
    
    if ( humba <= logictype.CurrentStage ) then
        logic = 0 -- Normal Logic
    elseif ( humba < 3 ) then
        logic = humba -- Sequence Breaking
    elseif ( has_billDrill() and can_clockworkShot() ) then
        logic = 3 -- Normal Logic
    
    -- Sequence Breaking
    else
        logic = humba
    end
    
    return convertLogic(logic, skip)
end

function jinjo_GGM_boulderOnBlueHill(skip)
    local logic = 99
    --[[        jinjo_boulder
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.humbaGGM(state) or (self.ggm_trot(state) and self.bill_drill(state))
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.humbaGGM(state) or (self.ggm_trot(state) and self.bill_drill(state))
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.humbaGGM(state) or (self.ggm_trot(state) and self.bill_drill(state))
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.humbaGGM(state)\
                or (self.ggm_trot(state) and (self.bill_drill(state) or self.egg_barge(state)))
    --]]
    
    local humba = access_GGM_humba(true)
    local ggmTrot = access_GGM_ttrot(true)
    
    if ( humba <= logictype.CurrentStage or has_billDrill() and ggmTrot <= logictype.CurrentStage ) then
        logic = 0 -- Normal Logic
    elseif ( humba < 3 or has_billDrill() and ggmTrot < 3 ) then
         -- Sequence Breaking
        local trot = 99
        if ( has_billDrill() ) then
            trot = ggmTrot
        end
        
        logic = math.min(humba, trot)
    elseif ( humba <= logictype.CurrentStage and can_eggBarge() ) then
        logic = 3 -- Normal Logic
    
    -- Sequence Breaking
    else
        local trot = 99
        if ( has_billDrill() or can_eggBarge() ) then
            trot = ggmTrot
        end
        
        logic = math.max(3, math.min(humba, trot))
    end
    
    return convertLogic(logic, skip)
end

----- Other - Glowbos

function glowbo_GGM_entrance(skip)
    local logic = 99
    --[[        glowbo_entrance_ggm
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.GGM_slope(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.GGM_slope(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = True
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = True
    --]]
    
    local slopes = access_GGM_slopes(true)
    
    if ( slopes <= logictype.CurrentStage ) then
        logic = 0 -- Normal Logic
    elseif ( slopes < 2 ) then
        logic = slopes  -- Sequence Breaking
    else
        logic = 2 -- Normal Logic
    end
    
    return convertLogic(logic, skip)
end

----- Other - Honeycombs

function honeycomb_GGM_boulderNearProspectorsHut(skip)
    local logic = 99
    --[[        honeycomb_prospector
    if self.world.options.logic_type == LogicType.option_intended:
        logic = (self.flap_flip(state) or self.ggm_trot(state) or self.slightly_elevated_ledge(state)) and self.bill_drill(state)\
                 or self.humbaGGM(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.bill_drill(state) or self.humbaGGM(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.bill_drill(state) or self.humbaGGM(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.bill_drill(state) or self.humbaGGM(state) or self.ground_rat_a_tat_rap(state) or self.egg_barge(state)
    --]]
    
    local humba = access_GGM_humba(true)
    local ggmTrot = access_GGM_ttrot(true)
    
    if ( humba <= logictype.CurrentStage or has_billDrill() and (has("fflip") or can_reachSlightlyElevatedLedge() or ggmTrot <= logictype.CurrentStage) ) then
        logic = 0 -- Normal Logic
    elseif ( has_billDrill() ) then
        logic = 1 -- Normal Logic
    elseif ( humba < 3 ) then
        logic = humba -- Sequence Breaking
    elseif ( has("grat") or can_eggBarge() ) then
        logic = 3 -- Normal Logic
    
    -- Sequence Breaking
    else
        logic = humba
    end
    
    return convertLogic(logic, skip)
end

function honeycomb_GGM_trainStation(skip)
    local logic = 99
    --[[        honeycomb_gm_station
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.ground_attack(state) or self.humbaGGM(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.ground_attack(state) or self.humbaGGM(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.ground_attack(state) or self.humbaGGM(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.ground_attack(state) or self.humbaGGM(state)
    --]]
    
    local humba = access_GGM_humba(true)
    
    -- Normal Logic
    if ( can_groundAttack() or humba <= logictype.CurrentStage ) then
        logic = 0
    
    -- Sequence Breaking
    else
        logic = humba
    end
    
    return convertLogic(logic, skip)
end

----- Other - Cheato Pages

function cheato_GGM_entrance(skip)
    local logic = 99
    --[[
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.springy_step_shoes(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.springy_step_shoes(state) or \
                (self.climb(state) and (self.flutter(state) or (self.air_rat_a_tat_rap(state) and self.tall_jump(state))))\
                or (self.GM_boulders(state) and self.leg_spring(state))\
                or (self.GM_boulders(state) and self.glide(state) and self.tall_jump(state))
                # or state.can_reach_region(regionName.IOHPL, self.player) and self.PL_to_GGM(state) and self.flutter(state) and (self.grip_grab(state) or self.beak_buster(state)) # Flutter right as you enter the level.
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.springy_step_shoes(state) or \
                (self.climb(state) and (self.flutter(state) or self.air_rat_a_tat_rap(state)))\
                or (self.clockwork_shot(state))\
                or (self.GM_boulders(state) and self.leg_spring(state))\
                or (self.GM_boulders(state) and self.glide(state) and self.tall_jump(state))\
                or (self.GM_boulders(state) and self.tall_jump(state) and self.turbo_trainers(state) and (self.wing_whack(state) or self.glide(state)))
                # or state.can_reach_region(regionName.IOHPL, self.player) and self.PL_to_GGM(state) and self.flutter(state) and (self.grip_grab(state) or self.beak_buster(state))
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.springy_step_shoes(state) or \
                (self.climb(state) and (self.flutter(state) or self.air_rat_a_tat_rap(state)))\
                or (self.clockwork_shot(state))\
                or (self.GM_boulders(state) and self.leg_spring(state))\
                or (self.GM_boulders(state) and self.glide(state) and self.tall_jump(state))\
                or (self.GM_boulders(state) and self.tall_jump(state) and self.turbo_trainers(state) and (self.wing_whack(state) or self.glide(state)))
                # or state.can_reach_region(regionName.IOHPL, self.player) and self.PL_to_GGM(state) and self.flutter(state) and (self.grip_grab(state) or self.beak_buster(state))
    --]]
    
    local canBreakBoulders = access_GGM_humba(true)
    
    -- Normal Logic
    if ( has("springb") ) then
        logic = 0
    elseif ( has("climb") and (has("flutter") or has("arat") and has("tjump")) or canBreakBoulders <= logictype.CurrentStage and (has_legSpring() or has_glide() and has("tjump")) ) then
        logic = 1
    elseif ( has("climb") and has("arat") or can_clockworkShot() or canBreakBoulders <= logictype.CurrentStage and has("tjump") and has("ttrain") and has_wingWhack() ) then
        logic = 2
    
    -- Sequence Breaking
    elseif ( has_legSpring() or has_glide() and has("tjump") or has("tjump") and has("ttrain") and has_wingWhack() ) then
        logic = math.max(2, canBreakBoulders)
    end
    
    return convertLogic(logic, skip)
end

function cheato_GGM_waterStorage(skip)
    local logic = 99
    --[[        cheato_water_storage
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.grip_grab(state) and self.flap_flip(state) and self.dive(state) and self.climb(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = (self.grip_grab(state) or self.beak_buster(state)) and self.flap_flip(state) and self.dive(state) and self.climb(state)\
                or self.GM_boulders(state) and self.pack_whack(state) and self.tall_jump(state) and self.dive(state) and self.climb(state) and self.grip_grab(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = (self.grip_grab(state) or self.beak_buster(state)) and self.flap_flip(state) and self.dive(state) and self.climb(state)\
                or self.GM_boulders(state) and self.pack_whack(state) and self.tall_jump(state) and self.dive(state) and self.climb(state) and self.grip_grab(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = (self.grip_grab(state) or self.beak_buster(state)) and self.flap_flip(state) and self.dive(state) and self.climb(state)\
                or self.leg_spring(state) and self.glide(state) and self.GM_boulders(state)\
                or self.GM_boulders(state) and self.pack_whack(state) and self.tall_jump(state) and self.dive(state) and self.climb(state) and self.grip_grab(state)
    --]]
    
    local canBreakBoulders = access_GGM_humba(true)
    
    -- Normal Logic
    if ( has("ggrab") and has("fflip") and has("dive") and has("climb") ) then
        logic = 0
    elseif ( has("bbust") and has("fflip") and has("dive") and has("climb") or has("ggrab") and has("dive") and has("climb") and has("tjump") and has_packWhack() and canBreakBoulders <= logictype.CurrentStage ) then
        logic = 1
    elseif ( has("ggrab") and has("dive") and has("climb") and has("tjump") and has_packWhack() and canBreakBoulders < 3 ) then
        logic = canBreakBoulders -- Sequence Breaking
    elseif ( has_legSpring() and has_glide() and canBreakBoulders <= logictype.CurrentStage ) then
        logic = 3 -- Normal Logic
    
    -- Sequence Breaking
    elseif ( has_legSpring() and has_glide() or has("ggrab") and has("dive") and has("climb") and has("tjump") and has_packWhack() ) then
        logic = math.max(3, canBreakBoulders)
    end
    
    return convertLogic(logic, skip)
end

----- Other



--------------- Witchyworld

----- Basic & Access functions

function access_WW_canOpenSaucerDoor(skip)
    local logic = 99
    --[[        saucer_door_open
    if self.world.options.logic_type == LogicType.option_intended:
        return self.longJumpToGripGrab(state) and self.flap_flip(state) and self.climb(state)\
              and (self.has_explosives(state) or self.beak_barge(state)) or\
              self.backdoors_enabled(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        return (self.longJumpToGripGrab(state) and self.flap_flip(state) and self.climb(state) and (self.has_explosives(state) or self.beak_barge(state)))\
            or (self.egg_aim(state) and self.grenade_eggs(state) and self.amaze_o_gaze(state) and self.climb(state))\
            or (self.has_explosives(state) and self.leg_spring(state) and self.glide(state))\
            or self.backdoors_enabled(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        return (self.longJumpToGripGrab(state) and self.flap_flip(state) and self.climb(state) and (self.has_explosives(state) or self.beak_barge(state)))\
            or (self.egg_aim(state) and self.grenade_eggs(state) and self.amaze_o_gaze(state))\
            or (self.has_explosives(state) and self.leg_spring(state) and self.glide(state))\
            or self.backdoors_enabled(state)\
            or self.clockwork_shot(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        return (self.longJumpToGripGrab(state) and self.flap_flip(state) and self.climb(state) and (self.has_explosives(state) or self.beak_barge(state)))\
            or (self.egg_aim(state) and self.grenade_eggs(state) and self.amaze_o_gaze(state))\
            or (self.has_explosives(state) and self.leg_spring(state) and self.glide(state))\
            or self.backdoors_enabled(state)\
            or self.clockwork_shot(state)\
            or (state.can_reach_region(regionName.GM, self.player) and self.humbaGGM(state) and self.small_elevation(state) and self.clockwork_eggs(state)) # You can shoot a clockwork through the door from GGM.
    --]]
    
    -- Normal Logic
    if (has("backdoorsopen_on") ) then
        logic = 0
    else
        local explosives = can_shootExplosiveEggs(true)
    
        if ( can_longJumpToGripGrab() and has("fflip") and has("climb") and (has("bbarge") or explosives <= logictype.CurrentStage) ) then
            logic = 0
        elseif ( has("eggaim") and has("geggs") and has("amazeogaze") and has("climb") or has_legSpring() and has_glide() and explosives <= logictype.CurrentStage ) then
            logic = 1
        elseif ( can_longJumpToGripGrab() and has("fflip") and has("climb") and explosives < 2 ) then
            logic = explosives -- Sequence Breaking
        elseif ( can_clockworkShot() ) then
            logic = 2
        else
            local ggmAccessibility = Tracker:FindObjectForCode("@Region: Glitter Gulch Mine - Main Area").AccessibilityLevel
            local humba = access_GGM_humba(true)
            
            if ( (ggmAccessibility == AccessibilityLevel.Normal or ggmAccessibility == AccessibilityLevel.Cleared) and humba <= logictype.CurrentStage and can_reachSmallElevation() and can_shootEggs("ceggs") ) then
                logic = 3
                
            -- Sequence Breaking
            else
                local withExplosives = 99
                if ( can_longJumpToGripGrab() and has("fflip") and has("climb") or has_legSpring() and has_glide() ) then
                    withExplosives = explosives
                end
                
                local withHumba = 99
                if ( (ggmAccessibility == AccessibilityLevel.Normal or ggmAccessibility == AccessibilityLevel.Cleared) and can_reachSmallElevation() and can_shootEggs("ceggs") ) then
                    withHumba = humba
                elseif ( ggmAccessibility > AccessibilityLevel.None and can_reachSmallElevation() and can_shootEggs("ceggs") ) then
                    withHumba = math.max(humba, logictype.CurrentStage + 1)
                end
                
                logic = math.max(3, math.min(withExplosives, withHumba))
            end
        end
    end
    
    return convertLogic(logic, skip)
end

function access_WW_warpToHumba(skip)
    local logic = 99
    --[[        warp_to_ww_wumba
    return state.has(itemName.WARPWW4, self.player) and (
            state.has(itemName.WARPWW1, self.player)\
            or state.has(itemName.WARPWW2, self.player)\
            or state.has(itemName.WARPWW3, self.player)\
            or state.has(itemName.WARPWW5, self.player) and state.can_reach_region(regionName.WWI, self.player)\
        )
    --]]

    local wwiAccessibility = Tracker:FindObjectForCode("@Region: Witchyworld - The Inferno").AccessibilityLevel
    
    if ( has("warpww4") ) then  
        -- Normal Logic
        if ( has("warpww1") or has("warpww2") or has("warpww3") or (wwiAccessibility == AccessibilityLevel.Normal or wwiAccessibility == AccessibilityLevel.Cleared) and has("warpww5") ) then
            logic = 0
    
        -- Sequence Breaking
        elseif ( wwiAccessibility > AccessibilityLevel.None and has("warpww5") ) then
            logic = logictype.CurrentStage + 1 -- was already converted once by the json
        end
    end

    return convertLogic(logic, skip)
end

function access_WW_warpToInferno(skip)
    local logic = 99
    --[[        warp_to_inferno
    return state.has(itemName.WARPWW5, self.player) and (
            state.has(itemName.WARPWW1, self.player)\
            or state.has(itemName.WARPWW2, self.player)\
            or state.has(itemName.WARPWW3, self.player)\
            or state.has(itemName.WARPWW4, self.player) and state.can_reach_location(locationName.WARPWW4, self.player)\
        )
    --]]
    
    local humbaWarp = warp_WW_humba(true)
    
    if ( has("warpww5") ) then
        -- Normal Logic
        if ( has("warpww1") or has("warpww2") or has("warpww3") or has("warpww4") and humbaWarp <= logictype.CurrentStage ) then
            logic = 0
            
        -- Sequence Breaking
        elseif ( has("warpww4") ) then
            logic = humbaWarp
        end
    end

    return convertLogic(logic, skip)
end

function access_WW_glitchIntoInferno(skip)
    local logic = 99
    --[[        glitchedInfernoAccess
    self.humbaWW(state) or self.clockwork_eggs(state) and self.tall_jump(state)
    --]]

    local wwHumba = access_WW_humba(true)
    
    -- Normal Logic
    if ( can_shootEggs("ceggs") and has("tjump") or wwHumba <= logictype.CurrentStage ) then
        logic = 0
        
    -- Sequence Breaking
    else
        logic = wwHumba
    end

    return convertLogic(logic, skip)
end

function access_WW_humba(skip)
    local logic = 99
    --[[        humbaWW
    if self.world.options.logic_type == LogicType.option_intended:
        logic = state.has(itemName.HUMBAWW, self.player) and (
                    self.flap_flip(state) and self.grip_grab(state)\
                    or self.warp_to_ww_wumba(state)
                )
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = state.has(itemName.HUMBAWW, self.player) and (
                    self.flap_flip(state) and self.grip_grab(state) \
                    or self.climb(state) and self.veryLongJump(state) and self.flap_flip(state)\
                    or self.warp_to_ww_wumba(state)
                )
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = state.has(itemName.HUMBAWW, self.player) and (
                    self.flap_flip(state) and self.grip_grab(state) \
                    or self.climb(state) and self.veryLongJump(state) and self.flap_flip(state)\
                    or self.warp_to_ww_wumba(state)
                )
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = state.has(itemName.HUMBAWW, self.player) and (
                    self.flap_flip(state) and self.grip_grab(state) \
                    or self.climb(state) and self.veryLongJump(state) and self.flap_flip(state)\
                    or self.warp_to_ww_wumba(state)
                )
    --]]
    
    if ( has("humbaww") ) then
        local warpToHumba = access_WW_warpToHumba(true)
    
        -- Normal Logic
        if ( has("fflip") and has("ggrab") or warpToHumba <= logictype.CurrentStage) then
            logic = 0
        elseif ( has("climb") and can_veryLongJump() and has("fflip")) then
            logic = 1
    
        -- Sequence Breaking
        else
            logic = warpToHumba
        end
    end
    
    return convertLogic(logic, skip)
end

function access_WW_mumbo(skip)
    local logic = 99
    --[[        mumboWW
    if self.world.options.logic_type == LogicType.option_intended:
        logic = state.can_reach_region(regionName.WWI, self.player) and state.has(itemName.MUMBOWW, self.player)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = state.can_reach_region(regionName.WWI, self.player) and state.has(itemName.MUMBOWW, self.player)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = state.can_reach_region(regionName.WWI, self.player) and state.has(itemName.MUMBOWW, self.player)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = state.can_reach_region(regionName.WWI, self.player) and state.has(itemName.MUMBOWW, self.player)\
                and self.escape_inferno_as_mumbo(state)                             -- this extra requirement is here because you can glitch into inferno. this isn't really great for readability and messes with my logic, so I'll adjust for it below
                
    return self.humbaWW(state)\
        or state.has(itemName.WARPWW5, self.player) and (
            state.has(itemName.WARPWW1, self.player)\
            or state.has(itemName.WARPWW2, self.player)\
            or state.has(itemName.WARPWW3, self.player)\
            or state.has(itemName.WARPWW4, self.player)
        )
     --]]
    
    local humba = access_WW_humba(true)
    local infernoAccess = connector_WW_to_WWInferno(true)
    
    -- Normal Logic
    if ( has("mumboww") and infernoAccess <= logictype.CurrentStage and (humba <= logictype.CurrentStage or has("warpww5") and (has("warpww1") or has("warpww2") or has("warpww3") or has("warpww4"))) ) then
        logic = 0
    
    -- Sequence Breaking
    elseif ( has("mumboww") ) then
        local warps = 99
        if ( has("warpww5") and (has("warpww1") or has("warpww2") or has("warpww3") or has("warpww4")) ) then
            warps = 0
        end
        
        logic = math.max(infernoAccess, math.min(warps, humba))
    end
    
    return convertLogic(logic, skip)
end

----- Silos

function silo_WW_airborneEggAiming(skip)
    local logic = 99
    --[[
    self.check_notes(state, locationName.AIREAIM)
    --]]
    
    if ( aireaim_count() ) then
        logic = 0
    end
    
    return convertLogic(logic, skip)
end

function silo_WW_splitUp(skip)
    local logic = 99
    --[[
    self.check_notes(state, locationName.SPLITUP)
    --]]
    
    if ( splitup_count() ) then
        logic = 0
    end
    
    return convertLogic(logic, skip)
end

function silo_WW_packWhack(skip)
    local logic = 99
    --[[
    self.split_up(state) and self.check_notes(state, locationName.PACKWH)
    --]]
    
    if ( has("splitup") and packwh_count() ) then
        logic = 0
    end
    
    return convertLogic(logic, skip)
end

----- Warp Pads

function warp_WW_humba(skip)
    local logic = 99
    --[[        warp_pad_ww_wumba
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.flap_flip(state) and self.grip_grab(state)\
                or self.warp_to_ww_wumba(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.flap_flip(state)\
                    and ((self.flap_flip(state) and self.grip_grab(state)) \
                        or (self.climb(state) and self.veryLongJump(state)))\
                or self.warp_to_ww_wumba(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.flap_flip(state) and self.grip_grab(state) \
                or self.climb(state) and self.veryLongJump(state) and self.flap_flip(state)\
                or self.clockwork_shot(state) and self.climb(state)\
                or self.leg_spring(state)\
                or self.warp_to_ww_wumba(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.flap_flip(state) and self.grip_grab(state) \
                or self.climb(state) and self.veryLongJump(state) and self.flap_flip(state)\
                or self.clockwork_shot(state) and self.climb(state)\
                or self.leg_spring(state)\
                or self.warp_to_ww_wumba(state)
    --]]
    
    local warpToHumba = access_WW_warpToHumba(true)
    
    -- Normal Logic
    if ( has("fflip") and has("ggrab") or warpToHumba <= logictype.CurrentStage) then
        logic = 0
    elseif ( has("fflip") and has("climb") and can_veryLongJump() or warpToHumba < 2) then
        logic = 1
    elseif ( has("climb") and can_clockworkShot() or warpToHumba < 3 or has_legSpring()) then
        logic = 2

    -- Sequence Breaking
    else
        logic = warpToHumba
    end

    return convertLogic(logic, skip)
end

----- Jiggies

function jiggy_WW_hoopHurry(skip)
    local logic = 99
    --[[        jiggy_hoop_hurry
     if self.world.options.logic_type == LogicType.option_intended:
        logic = self.split_up(state) and self.has_explosives(state) and self.turbo_trainers(state)\
            and self.spring_pad(state) and (self.flap_flip(state) or self.leg_spring(state))
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.split_up(state) and self.has_explosives(state)\
            and (self.leg_spring(state) or self.tall_jump(state))\
            and (self.spring_pad(state) or self.flap_flip(state) or self.leg_spring(state))
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.split_up(state) and self.has_explosives(state)\
            and (self.leg_spring(state) or self.tall_jump(state))\
            and (self.spring_pad(state) or self.flap_flip(state) or self.leg_spring(state))
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.split_up(state) and self.has_explosives(state)\
            and (self.leg_spring(state) or self.tall_jump(state))\
            and (self.spring_pad(state) or self.flap_flip(state) or self.leg_spring(state))
    --]]
    
    local explosives = can_shootExplosiveEggs(true)
    
    -- Normal Logic
    if ( has("splitup") and explosives <= logictype.CurrentStage and has("ttrain") and has("tjump") and (has("fflip") or has_legSpring()) ) then
        logic = 0
    elseif ( has("splitup") and explosives <= logictype.CurrentStage and (has("tjump") or has_legSpring()) ) then
        logic = 1
    
    -- Sequence Breaking
    elseif ( has("splitup") and (has("tjump") or has_legSpring()) ) then
        logic = math.max(1, explosives)
    end
    
    return convertLogic(logic, skip)
end

function jiggy_WW_dodgem(skip)
    local logic = 99
    --[[        jiggy_dodgem
     if self.world.options.logic_type == LogicType.option_intended:
        logic = self.humbaWW(state) and self.mumboWW(state) and \
                self.grip_grab(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.humbaWW(state) and self.mumboWW(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.humbaWW(state) and self.mumboWW(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        if self.world.options.speed_up_minigames:
            # No van required if you can clockwork warp into dodgems, since the door is already opened!
            logic = (self.humbaWW(state) and self.mumboWW(state))\
                or (self.precise_clockwork_warp(state))
        else:
            logic = self.humbaWW(state) and self.mumboWW(state)
    --]]
    
    local humba = access_WW_humba(true)
    local mumbo = access_WW_mumbo(true)
    
    -- Normal Logic
    if ( humba <= logictype.CurrentStage and mumbo <= logictype.CurrentStage and has("ggrab") ) then
        logic = 0
    elseif ( humba <= logictype.CurrentStage and mumbo <= logictype.CurrentStage ) then
        logic = 1
    elseif ( humba < 3 and mumbo < 3 ) then
        logic = math.max(humba, mumbo) -- Sequence Breaking
    elseif ( has("speedupmini_on") and can_preciseClockworkWarp() ) then
        logic = 3
    
    -- Sequence Breaking
    else
        logic = math.max(1, humba, mumbo)
    end
    
    return convertLogic(logic, skip)
end

function jiggy_WW_mrPatch(skip)
    local logic = 99
    --[[        jiggy_patches
     if self.world.options.logic_type == LogicType.option_intended:
        logic = self.airborne_egg_aiming(state) and self.egg_aim(state) and \
                self.grenade_eggs(state) and self.flight_pad(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.airborne_egg_aiming(state) and self.egg_aim(state) and \
                self.grenade_eggs(state) and self.flight_pad(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.airborne_egg_aiming(state) and self.egg_aim(state) and \
                self.grenade_eggs(state) and self.flight_pad(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.airborne_egg_aiming(state) and self.egg_aim(state) and \
                self.grenade_eggs(state) and self.flight_pad(state)
    --]]
    
    if ( has("aireaim") and has("eggaim") and has("geggs") and has("fpad") ) then
        logic = 0
    end
    
    return convertLogic(logic, skip)
end

function jiggy_WW_saucerOfPeril(skip)
    local logic = 99
    --[[        jiggy_peril
     if self.world.options.logic_type == LogicType.option_intended:
        logic = self.humbaGGM(state) and \
                self.mumboWW(state) and \
                self.saucer_door_open(state) and \  
                self.can_reach_saucer(state) and\                   -- (self.longJumpToGripGrab(state) and self.flap_flip(state) and self.climb(state)) or (state.can_reach_region(regionName.GM, self.player) and self.small_elevation(state))
                state.can_reach_region(regionName.GM, self.player) and self.has_explosives(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.humbaGGM(state) and \
                self.mumboWW(state) and \
                self.saucer_door_open(state) and state.can_reach_region(regionName.GM, self.player) and \
                self.can_reach_saucer(state) and\
                self.has_explosives(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.humbaGGM(state) and \
                self.mumboWW(state) and \
                self.saucer_door_open(state) and state.can_reach_region(regionName.GM, self.player) and \
                self.can_reach_saucer(state) and\
                self.has_explosives(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.humbaGGM(state) and \
                self.mumboWW(state) and \
                self.saucer_door_open(state) and state.can_reach_region(regionName.GM, self.player) and \
                self.can_reach_saucer(state) and\
                self.has_explosives(state)
    --]]
    
    local ggmAccessibility = Tracker:FindObjectForCode("@Region: Glitter Gulch Mine - Main Area").AccessibilityLevel
    local humbaGGM = access_GGM_humba(true)
    local mumboWW = access_WW_mumbo(true)
    local saucerDoor = access_WW_canOpenSaucerDoor(true)
    local explosives = can_shootExplosiveEggs(true)
    
    -- Normal Logic
    if ( (ggmAccessibility == AccessibilityLevel.Normal or ggmAccessibility == AccessibilityLevel.Cleared) and humbaGGM <= logictype.CurrentStage and mumboWW <= logictype.CurrentStage and saucerDoor <= logictype.CurrentStage and explosives <= logictype.CurrentStage and can_reachSmallElevation() ) then -- only small elevation is needed from the can_reach_saucer function, because you're guaranteed to have GGM access for the rest of this and the other side of the if statement requires fflip anyway
        logic = 0
    
    -- Sequence Breaking
    elseif ( (ggmAccessibility == AccessibilityLevel.Normal or ggmAccessibility == AccessibilityLevel.Cleared) and can_reachSmallElevation() ) then
        logic = math.max(humbaGGM, mumboWW, saucerDoor, explosives)
    elseif ( ggmAccessibility > AccessibilityLevel.None and can_reachSmallElevation() ) then
        logic = math.max(humbaGGM, mumboWW, saucerDoor, explosives, logictype.CurrentStage + 1)
    end
    
    return convertLogic(logic, skip)
end

function jiggy_WW_balloonBurst(skip)
    local logic = 99
    --[[        jiggy_balloon_burst
     if self.world.options.logic_type == LogicType.option_intended:
        logic = self.split_up(state) and self.has_explosives(state) and self.airborne_egg_aiming(state)\
            and self.spring_pad(state) and (self.flap_flip(state) or self.leg_spring(state))
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.split_up(state) and self.has_explosives(state) and self.airborne_egg_aiming(state)\
            and (self.leg_spring(state) or self.tall_jump(state))\
            and (self.spring_pad(state) or self.flap_flip(state) or self.leg_spring(state))
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.split_up(state) and self.has_explosives(state) and self.airborne_egg_aiming(state)\
            and (self.leg_spring(state) or self.tall_jump(state))\
            and (self.spring_pad(state) or self.flap_flip(state) or self.leg_spring(state))
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.split_up(state) and self.has_explosives(state) and self.airborne_egg_aiming(state)\
            and (self.leg_spring(state) or self.tall_jump(state))\
            and (self.spring_pad(state) or self.flap_flip(state) or self.leg_spring(state))
    --]]
    
    local explosives = can_shootExplosiveEggs(true)
    
    -- Normal Logic
    if ( has("splitup") and explosives <= logictype.CurrentStage and has("aireaim") and has("tjump") and (has("fflip") or has_legSpring()) ) then
        logic = 0
    elseif ( has("splitup") and explosives <= logictype.CurrentStage and has("aireaim") and (has("tjump") or has_legSpring()) ) then
        logic = 1
    
    -- Sequence Breaking
    elseif ( has("splitup") and has("aireaim") and (has("tjump") or has_legSpring()) ) then
        logic = math.max(1, explosives)
    end
    
    return convertLogic(logic, skip)
end

function jiggy_WW_diveOfDeath(skip)
    local logic = 99
    --[[        jiggy_dive_of_death
     if self.world.options.logic_type == LogicType.option_intended:
        logic = self.grip_grab(state) and self.climb(state) and self.flap_flip(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.climb(state) and (self.flap_flip(state) or self.talon_trot(state) or (\
            self.tall_jump(state) and (self.beak_buster(state) or self.air_rat_a_tat_rap(state))))
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.climb(state) and (self.flap_flip(state) or self.talon_trot(state) or self.clockwork_shot(state) or (\
            self.tall_jump(state) and (self.beak_buster(state) or self.air_rat_a_tat_rap(state))))
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.climb(state) and (self.flap_flip(state) or self.talon_trot(state) or self.clockwork_shot(state) or (\
            self.tall_jump(state) and (self.beak_buster(state) or self.air_rat_a_tat_rap(state))))
    --]]
    
    if ( has("ggrab") and has("climb") and has("fflip") ) then
        logic = 0
    elseif ( has("climb") and (has("fflip") or has("ttrot") or has("tjump") and (has("bbust") or has("arat"))) ) then
        logic = 1
    elseif ( logictype.CurrentStage > 1 and has("climb") and can_clockworkShot() ) then
        logic = 2
    end
    
    return convertLogic(logic, skip)
end

function jiggy_WW_mrsBoggy(skip)
    local logic = 99
    --[[        jiggy_mrs_boggy
     if self.world.options.logic_type == LogicType.option_intended:
        logic = self.moggy(state) and self.soggy(state) and self.groggy(state)

    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.moggy(state) and self.soggy(state) and self.groggy(state)

    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.moggy(state) and self.soggy(state) and self.groggy(state)

    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.moggy(state) and self.soggy(state) and self.groggy(state)
    --]]
    
    local moggy = other_WW_moggy(true)
    local soggy = other_WW_soggy(true)
    local groggy = other_WW_groggy(true)
    
    -- Normal Logic
    if ( moggy <= logictype.CurrentStage and soggy <= logictype.CurrentStage and groggy <= logictype.CurrentStage ) then
        logic = 0
    
    -- Sequence Breaking
    else
        logic = math.max(moggy, soggy, groggy)
    end
    
    return convertLogic(logic, skip)
end

function jiggy_WW_starSpinner(skip)
    local logic = 99
    --[[        jiggy_star_spinner
     if self.world.options.logic_type == LogicType.option_intended:
            logic = self.mumboWW(state) and self.talon_trot(state)
        elif self.world.options.logic_type == LogicType.option_easy_tricks:
            logic = self.mumboWW(state) and self.talon_trot(state)
        elif self.world.options.logic_type == LogicType.option_hard_tricks:
            logic = self.mumboWW(state)
        elif self.world.options.logic_type == LogicType.option_glitches:
            logic = self.mumboWW(state)
    --]]
    
    local mumbo = access_WW_mumbo(true)
    
    -- Normal Logic
    if ( has("ttrot") and mumbo <= logictype.CurrentStage ) then
        logic = 0
    elseif ( mumbo <= logictype.CurrentStage ) then
        logic = 1
    
    -- Sequence Breaking
    else
        logic = math.max(1, mumbo)
    end
    
    return convertLogic(logic, skip)
end

function jiggy_WW_topOfInferno(skip)
    local logic = 99
    --[[        jiggy_inferno
     if self.world.options.logic_type == LogicType.option_intended:
        logic = self.split_up(state) and self.tall_jump(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.split_up(state) and (self.tall_jump(state) or self.leg_spring(state))\
                or self.flap_flip(state) and (self.talon_trot(state) or self.turbo_trainers(state))
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.split_up(state) and (self.tall_jump(state) or self.leg_spring(state))\
                or self.flap_flip(state) and (self.talon_trot(state) or self.turbo_trainers(state))
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.split_up(state) and (self.tall_jump(state) or self.leg_spring(state))\
                or self.flap_flip(state) and (self.talon_trot(state) or self.turbo_trainers(state))
     --]]
    
    if ( has("splitup") and has("tjump") ) then
        logic = 0
    elseif ( has_legSpring() or has("fflip") and (has("ttrot") or has("ttrain")) ) then
        logic = 1
    end
    
    return convertLogic(logic, skip)
end

function jiggy_WW_cactusOfStrength(skip)
    local logic = 99
    --[[        jiggy_cactus
     if self.world.options.logic_type == LogicType.option_intended:
        logic = self.bill_drill(state) and self.grenade_eggs(state)\
              and self.beak_buster(state) and self.climb(state)         -- beak buster is required for bill drill
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.bill_drill(state) and self.grenade_eggs(state)\
              and self.beak_buster(state) and\
                (self.climb(state) or self.leg_spring(state) and self.glide(state))
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.bill_drill(state) and self.grenade_eggs(state)\
              and self.beak_buster(state) and\
                (self.clockwork_shot(state) or self.climb(state) or self.leg_spring(state) and self.glide(state))
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.bill_drill(state) and self.grenade_eggs(state)\
              and self.beak_buster(state) and\
                (self.clockwork_shot(state) or self.climb(state) or self.leg_spring(state) and self.glide(state))
    --]]
    
    if ( has_billDrill() and can_shootEggs("geggs") and has("climb") ) then
        logic = 0
    elseif ( has_billDrill() and can_shootEggs("geggs") and has_legSpring() and has_glide() ) then
        logic = 1
    elseif ( has_billDrill() and can_shootEggs("geggs") and can_clockworkShot() ) then
        logic = 2
    end
    
    return convertLogic(logic, skip)
end

----- Notes

function treble_WW(skip)
    local logic = 99
    --[[        treble_ww
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.humbaWW(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.humbaWW(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.humbaWW(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.humbaWW(state) or self.clockwork_eggs(state)
    --]]
    
    local humba = access_WW_humba(true)
    
    if ( humba <= logictype.CurrentStage ) then
        logic = 0 -- Normal Logic
    elseif ( humba < 3 ) then
        logic = humba -- Sequence Breaking
    elseif ( can_shootEggs("ceggs") ) then
        logic = 3 -- Normal Logic
    
    -- Sequence Breaking
    else
        logic = humba
    end
    
    return convertLogic(logic, skip)
end

function notes_WW_area51OnFencePostLeft(skip)
    local logic = 99
    --[[        notes_ww_area51_left
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.has_explosives(state) and self.spring_pad(state) and self.long_jump(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.has_explosives(state) and self.spring_pad(state) and self.long_jump(state)\
                or self.leg_spring(state)\
                or self.glide(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.has_explosives(state) and self.spring_pad(state) and self.long_jump(state)\
                or self.split_up(state) and self.spring_pad(state)\
                or self.leg_spring(state)\
                or self.clockwork_shot(state)\
                or self.glide(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.has_explosives(state) and self.spring_pad(state) and self.long_jump(state)\
                or self.split_up(state) and self.spring_pad(state)\
                or self.leg_spring(state)\
                or self.clockwork_shot(state)\
                or self.glide(state)
    --]]
    
    local explosives = can_shootExplosiveEggs(true)
    
    -- Normal Logic
    if ( explosives <= logictype.CurrentStage and has("tjump") and can_longJump() ) then
        logic = 0
    elseif ( can_legSpring() or can_glide() ) then
        logic = 1
    elseif ( has("tjump") and can_longJump() and explosives < 2 ) then
        logic = 1 -- Sequence Breaking
    elseif ( has("splitup") and has("tjump") or can_clockworkShot() ) then
        logic = 2
    
    -- Sequence Breaking
    elseif ( has("tjump") and can_longJump() ) then
        logic = explosives
    end
    
    return convertLogic(logic, skip)
end

function notes_WW_area51OnFencePostRight(skip)
    local logic = 99
    --[[        notes_ww_area51_right
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.has_explosives(state) and self.spring_pad(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.has_explosives(state) and self.spring_pad(state)\
                or self.leg_spring(state)\
                or self.glide(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = ((self.has_explosives(state) or self.split_up(state)) and self.spring_pad(state))\
                or self.leg_spring(state)\
                or self.clockwork_shot(state)\
                or self.glide(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = ((self.has_explosives(state) or self.split_up(state)) and self.spring_pad(state))\
                or self.leg_spring(state)\
                or self.clockwork_shot(state)\
                or self.glide(state)
    --]]
    
    local explosives = can_shootExplosiveEggs(true)
    
    -- Normal Logic
    if ( explosives <= logictype.CurrentStage and has("tjump") ) then
        logic = 0
    elseif ( can_legSpring() or can_glide() ) then
        logic = 1
    elseif ( has("tjump") and explosives < 2 ) then
        logic = 1 -- Sequence Breaking
    elseif ( has("splitup") and has("tjump") or can_clockworkShot() ) then
        logic = 2
    
    -- Sequence Breaking
    elseif ( has("tjump") ) then
        logic = explosives
    end
    
    return convertLogic(logic, skip)
end

function notes_WW_diveOfDeath(skip)
    local logic = 99
    --[[        notes_dive_of_death
    if self.world.options.logic_type == LogicType.option_intended:
        logic = ((self.grip_grab(state) and self.flap_flip(state)) or self.climb(state)) and self.dive(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = ((self.grip_grab(state) or self.beak_buster(state)) and self.flap_flip(state) or self.climb(state))\
                    and (self.tall_jump(state) or self.dive(state))\
                or (self.leg_spring(state) or self.glide(state)) and self.tall_jump(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = (self.grip_grab(state) or self.beak_buster(state)) and self.flap_flip(state)\
                or self.climb(state)\
                or self.leg_spring(state)\
                or self.glide(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = (self.grip_grab(state) or self.beak_buster(state)) and self.flap_flip(state)\
                or self.climb(state)\
                or self.ground_rat_a_tat_rap(state)\
                or self.beak_barge(state)\
                or self.leg_spring(state)\
                or self.glide(state)\
                or self.pack_whack(state)\
                or self.taxi_pack(state)
    --]]
    
    if ( (has("ggrab") and has("fflip") or has("climb")) and has("dive") ) then
        logic = 0
    elseif ( ((has("ggrab") or has("bbust")) and has("fflip") or has("climb")) and (has("dive") or has("tjump")) or (has_legSpring() or can_glide()) and has("tjump") ) then
        logic = 1
    elseif ( (has("ggrab") or has("bbust")) and has("fflip") or has("climb") or has_legSpring() or has_glide() ) then
        logic = 2
    elseif ( has("grat") or has("bbarge") or has_packWhack() or has_taxiPack() ) then
        logic = 3
    end
    
    return convertLogic(logic, skip)
end

----- Nests

function nests_WW_pumpRoom(skip)
    local logic = 99
    --[[        nest_pump_room
    if self.world.options.logic_type == LogicType.option_intended:
        logic = (self.flap_flip(state)\
                    or self.leg_spring(state)\
                    or self.split_up(state) and self.grip_grab(state)
                ) and self.has_explosives(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = (self.flap_flip(state)\
                    or self.leg_spring(state)\
                    or self.split_up(state) and self.grip_grab(state)\
                    or self.pack_whack(state) and self.tall_jump(state)\
                ) and self.has_explosives(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = (self.flap_flip(state)\
                or self.leg_spring(state)\
                or self.split_up(state) and self.grip_grab(state)\
                or self.pack_whack(state) and self.tall_jump(state)\
                or self.clockwork_shot(state) and self.small_elevation(state)
                ) and self.has_explosives(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = (self.flap_flip(state)\
                or self.leg_spring(state)\
                or self.split_up(state) and self.grip_grab(state)\
                or self.pack_whack(state) and self.tall_jump(state)\
                or self.clockwork_shot(state) and self.small_elevation(state)
                ) and self.has_explosives(state)
    --]]
    
    local explosives = can_shootExplosiveEggs(true)
    
    -- Normal Logic
    if ( explosives <= logictype.CurrentStage and (has("fflip") or has_legSpring() or has("splitup") and has("ggrab")) ) then
        logic = 0
    elseif ( explosives <= logictype.CurrentStage and has_packWhack() and has("tjump") ) then
        logic = 1
    elseif ( explosives <= logictype.CurrentStage and can_clockworkShot() and can_reachSmallElevation() ) then
        logic = 2
    
    -- Sequence Breaking
    elseif ( has("fflip") or has_legSpring() or has("splitup") and has("ggrab") or has_packWhack() and has("tjump") or can_clockworkShot() and can_reachSmallElevation() ) then
        logic = math.max(2, explosives)
    elseif ( can_clockworkShot() ) then
        logic = 7 -- FIXIT you can reach the pump room without tall jump if you hug the barrel
    end
    
    return convertLogic(logic, skip)
end

function nests_WW_bigTop(skip)
    local logic = 99
    --[[        nest_big_top
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.grenade_eggs_item(state) and self.airborne_egg_aiming(state) and self.can_kill_fruity(state)       -- self.has_explosives(state) or self.humbaWW(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.grenade_eggs_item(state) and self.airborne_egg_aiming(state) and self.can_kill_fruity(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.grenade_eggs_item(state) and self.airborne_egg_aiming(state) and self.can_kill_fruity(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.grenade_eggs_item(state) and self.airborne_egg_aiming(state) and self.can_kill_fruity(state)
    --]]
    
    local explosives = can_shootExplosiveEggs(true)
    local humba = access_WW_humba(true)
    
    -- Normal Logic
    if ( has("geggs") and has("aireaim") and (explosives <= logictype.CurrentStage or humba <= logictype.CurrentStage) ) then -- notably doesn't require the ability to shoot said eggs
        logic = 0
    
    -- Sequence Breaking
    elseif ( has("geggs") and has("aireaim") ) then
        logic = math.min(explosives, humba)
    end
    
    return convertLogic(logic, skip)
end

----- Signs

function signpost_WW_pumpRoom(skip)
    local logic = 99
    --[[        signpost_pump_master
    if self.world.options.logic_type == LogicType.option_intended:
        logic = (self.flap_flip(state)\
                    or self.leg_spring(state)\
                    or self.split_up(state) and self.grip_grab(state)
                ) and self.has_explosives(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = (self.flap_flip(state)\
                    or self.leg_spring(state)\
                    or self.split_up(state) and self.grip_grab(state)\
                    or self.pack_whack(state) and self.tall_jump(state)\
                ) and self.has_explosives(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = (self.flap_flip(state)\
                    or self.leg_spring(state)\
                    or self.split_up(state) and self.grip_grab(state)\
                    or self.pack_whack(state) and self.tall_jump(state)
                ) and self.has_explosives(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = (self.flap_flip(state)\
                    or self.leg_spring(state)\
                    or self.split_up(state) and self.grip_grab(state)\
                    or self.pack_whack(state) and self.tall_jump(state)
                ) and self.has_explosives(state)
    --]]
    
    local explosives = can_shootExplosiveEggs(true)
    
    -- Normal Logic
    if ( explosives <= logictype.CurrentStage and (has("fflip") or has_legSpring() or has("splitup") and has("ggrab")) ) then
        logic = 0
    elseif ( explosives <= logictype.CurrentStage and has_packWhack() and has("tjump") ) then
        logic = 1
    
    -- Sequence Breaking
    elseif ( has("fflip") or has_legSpring() or has("splitup") and has("ggrab") or has_packWhack() and has("tjump") ) then
        logic = math.max(1, explosives)
    end
    
    return convertLogic(logic, skip)
end

function signpost_WW_inGobisCell(skip)
    local logic = 99
    --[[        signpost_gobi
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.grenade_eggs(state) and self.egg_aim(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.grenade_eggs(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.grenade_eggs(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.grenade_eggs(state)
    --]]
    
    if ( can_shootEggs("geggs") and has("eggaim") ) then
        logic = 0
    elseif ( can_shootEggs("geggs") ) then
        logic = 1
    end
    
    return convertLogic(logic, skip)
end

----- Other - Jinjos

function jinjo_WW_onBigTop(skip)
    local logic = 99
    --[[        jinjo_tent
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.talon_trot(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.talon_trot(state)\
                or self.humbaWW(state)\
                or self.split_up(state)\
                or state.can_reach_region(regionName.WWI, self.player) and self.turbo_trainers(state)       -- either humba or warping, so I'll just use the warping function since humba completes an earlier conditional
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.talon_trot(state)\
                or self.humbaWW(state)\
                or self.clockwork_shot(state)\
                or self.split_up(state)\
                or state.can_reach_region(regionName.WWI, self.player) and self.turbo_trainers(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.talon_trot(state)\
                or self.humbaWW(state)\
                or self.clockwork_shot(state)\
                or self.split_up(state)\
                or (self.warp_to_inferno(state) or self.humbaWW(state)) and self.turbo_trainers(state)      -- checking for humba here is redundant since having it would already complete an earlier conditional
     --]]
    
    local humba = access_WW_humba(true)
    local warpToInferno = access_WW_warpToInferno(true)
    
    -- Normal Logic
    if ( has("ttrot") ) then
        logic = 0
    elseif ( has("splitup") or humba <= logictype.CurrentStage or has("ttrain") and warpToInferno <= logictype.CurrentStage ) then
        logic = 1
    elseif ( can_clockworkShot() ) then
        logic = 2
    elseif ( humba < 3 or has("ttrain") and warpToInferno < 3 ) then
        logic = 2 -- Sequence Breaking
    elseif ( has("ttrain") and warpToInferno <= logictype.CurrentStage ) then
        logic = 3
    
    -- Sequence Breaking
    else
        local notVan = 99
        if ( has("ttrain") ) then
            notVan = warpToInferno
        end
        
        logic = math.max(1, math.min(notVan, humba))
    end
    
    return convertLogic(logic, skip)
end

function jinjo_WW_caveOfHorrors(skip)
    local logic = 99
    --[[        jinjo_cave_of_horrors
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.grenade_eggs(state) and self.egg_aim(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.grenade_eggs(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.grenade_eggs(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.grenade_eggs(state)
    --]]
    
    if ( can_shootEggs("geggs") and has("eggaim") ) then
        logic = 0
    elseif ( can_shootEggs("geggs") ) then
        logic = 1
    end
    
    return convertLogic(logic, skip)
end

function jinjo_WW_nearCactusOfStrength(skip)
    local logic = 99
    --[[        jinjo_cactus
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.grip_grab(state) and self.flap_flip(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = (self.grip_grab(state) and self.flap_flip(state))\
                or (self.climb(state) and self.talon_trot(state) and (self.flutter(state) or self.air_rat_a_tat_rap(state)))\
                or self.leg_spring(state)\
             or self.pack_whack(state) and self.tall_jump(state) and self.grip_grab(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = (self.grip_grab(state) and self.flap_flip(state))\
                or (self.climb(state) and self.talon_trot(state) and (self.flutter(state) or self.air_rat_a_tat_rap(state)))\
                or self.leg_spring(state)\
                or self.clockwork_shot(state)\
             or self.pack_whack(state) and self.tall_jump(state) and self.grip_grab(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = (self.grip_grab(state) and self.flap_flip(state))\
                or (self.climb(state) and self.talon_trot(state) and (self.flutter(state) or self.air_rat_a_tat_rap(state)))\
                or self.leg_spring(state)\
                or self.clockwork_shot(state)\
             or self.pack_whack(state) and self.tall_jump(state) and self.grip_grab(state)
    --]]
    
    if ( has("ggrab") and has("fflip") ) then
        logic = 0
    elseif ( has("climb") and has("ttrot") and (has("flutter") or has("arat")) or has_legSpring() or has_packWhack() and has("tjump") and has("ggrab") ) then
        logic = 1
    elseif ( can_clockworkShot() ) then
        logic = 2
    end
    
    return convertLogic(logic, skip)
end

function jinjo_WW_area51VanDoor(skip)
    local logic = 99
    --[[        jinjo_van_door
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.has_explosives(state) and \
                self.humbaWW(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.has_explosives(state) and \
                self.humbaWW(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.has_explosives(state) and \
                self.humbaWW(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = (self.has_explosives(state) and self.humbaWW(state)) or self.clockwork_eggs(state)
    --]]
    
    local explosives = can_shootExplosiveEggs(true)
    local humba = access_WW_humba(true)
    
    if ( explosives <= logictype.CurrentStage and humba <= logictype.CurrentStage ) then
        logic = 0 -- Normal Logic
    elseif ( explosives < 3 and humba < 3 ) then
        logic = math.max(explosives, humba)
    elseif ( can_shootEggs("ceggs") ) then
        logic = 3
    
    -- Sequence Breaking
    else
        logic = math.max(3, explosives, humba)
    end
    
    return convertLogic(logic, skip)
end

function jinjo_WW_onDodgemDome(skip)
    local logic = 99
    --[[        jinjo_dodgem
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.talon_trot(state) and self.climb(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.talon_trot(state) and self.climb(state)\
                or self.leg_spring(state) and self.glide(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = (self.talon_trot(state) or self.clockwork_shot(state)) and self.climb(state)\
                or self.leg_spring(state) and self.glide(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = (self.talon_trot(state) or self.clockwork_shot(state)) and self.climb(state)\
                or self.leg_spring(state) and self.glide(state)
    --]]
    
    if ( has("ttrot") and has("climb") ) then
        logic = 0
    elseif ( has_legSpring() and has_glide() ) then
        logic = 1
    elseif ( can_clockworkShot() and has("climb") ) then
        logic = 2
    end
    
    return convertLogic(logic, skip)
end

----- Other - Glowbos

function glowbo_WW_humbasWigwam(skip)
    local logic = 99
    --[[        glowbo_wigwam
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.flap_flip(state) and self.grip_grab(state)\
                or self.warp_to_ww_wumba(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = (self.flap_flip(state) and self.grip_grab(state)) \
                or (self.climb(state) and self.veryLongJump(state) and self.flap_flip(state))\
                or self.leg_spring(state)\
                or self.warp_to_ww_wumba(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = (self.flap_flip(state) and self.grip_grab(state)) \
                or (self.climb(state) and self.veryLongJump(state) and self.flap_flip(state))\
                or (self.clockwork_shot(state) and self.climb(state))\
                or self.leg_spring(state)\
                or self.warp_to_ww_wumba(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = (self.flap_flip(state) and self.grip_grab(state)) \
                or (self.climb(state) and self.veryLongJump(state) and self.flap_flip(state))\
                or (self.clockwork_shot(state) and self.climb(state)\
                or self.leg_spring(state))\
                or self.warp_to_ww_wumba(state)
    --]]
    
    local warpToHumba = access_WW_warpToHumba(true)
    
    -- Normal Logic
    if ( has("fflip") and has("ggrab") or warpToHumba <= logictype.CurrentStage ) then
        logic = 0
    elseif ( has("climb") and can_veryLongJump() and has("fflip") or has_legSpring() ) then
        logic = 1
    elseif ( has("climb") and can_clockworkShot() ) then
        logic = 2

    -- Sequence Breaking
    else
        logic = warpToHumba
    end
    
    return convertLogic(logic, skip)
end

----- Other - Honeycombs

function honeycomb_WW_topOfSpaceZone(skip)
    local logic = 99
    --[[        honeycomb_space_zone
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.grip_grab(state) and self.climb(state) and self.flap_flip(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.grip_grab(state) and self.climb(state) and self.flap_flip(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = (self.grip_grab(state) or self.beak_buster(state)) and self.climb(state) and self.flap_flip(state)\
                or self.leg_spring(state) and self.glide(state)\
                or self.clockwork_shot(state) and (self.talon_trot(state) or self.split_up(state))
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = (self.grip_grab(state) or self.beak_buster(state)) and self.climb(state) and self.flap_flip(state)\
                or self.clockwork_shot(state) and state.can_reach_region(regionName.GMFD, self.player) and self.ggm_to_ww(state)\
                or self.leg_spring(state) and self.glide(state)\
                or self.clockwork_shot(state) and (self.talon_trot(state) or self.split_up(state))
    --]]
    
    local ggmfdAccessibility = Tracker:FindObjectForCode("@Region: Glitter Gulch Mine - Fuel Depot Behind the Rocks").AccessibilityLevel
    local ggmToWW = connector_GGM_to_WW(true)
    
    -- Normal Logic
    if ( has("ggrab") and has("climb") and has("fflip") ) then
        logic = 0
    elseif ( (has("ggrab") or has("bbust")) and has("climb") and has("fflip") or has_legSpring() and has_glide() or can_clockworkShot() and (has("ttrot") or has("splitup")) ) then
        logic = 2
    elseif ( can_clockworkShot() and (ggmfdAccessibility == AccessibilityLevel.Normal or ggmfdAccessibility == AccessibilityLevel.Cleared) and ggmToWW <= logictype.CurrentStage ) then
        logic = 3
    
    -- Sequence Breaking
    elseif ( can_clockworkShot() and (ggmfdAccessibility == AccessibilityLevel.Normal or ggmfdAccessibility == AccessibilityLevel.Cleared) ) then 
        logic = math.max(3, ggmToWW)
    elseif ( can_clockworkShot() and ggmfdAccessibility > AccessibilityLevel.None ) then 
        logic = math.max(3, ggmToWW, logictype.CurrentStage + 1)
    end
    
    return convertLogic(logic, skip)
end

function honeycomb_WW_pumpRoomEntrance(skip)
    local logic = 99
    --[[        honeycomb_crazy_castle
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.has_explosives(state) and (self.small_elevation(state) or self.split_up(state))
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.has_explosives(state) and (self.small_elevation(state) or self.split_up(state))
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = (self.has_explosives(state) and (self.small_elevation(state) or self.split_up(state))) or self.clockwork_shot(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = (self.has_explosives(state) and (self.small_elevation(state) or self.split_up(state)))\
                or self.clockwork_shot(state)\
                or self.pack_whack(state)
    --]]
    
    local explosives = can_shootExplosiveEggs(true)
    
    if ( explosives <= logictype.CurrentStage and (can_reachSmallElevation() or has("splitup")) ) then
        logic = 0 -- Normal Logic
    elseif ( explosives < 2 and (can_reachSmallElevation() or has("splitup")) ) then
        logic = explosives -- Sequence Breaking
    elseif ( can_clockworkShot() ) then
        logic = 2 -- Normal Logic
    elseif ( has_packWhack() ) then
        logic = 3
    
    -- Sequence Breaking
    elseif ( can_reachSmallElevation() or has("splitup") ) then
        logic = explosives
    elseif ( explosives <= 7 ) then
        logic = 7 -- FIXIT you don't need small elevation; you can jump up the barrel and then into the room without tall jump
    end
    
    return convertLogic(logic, skip)
end

----- Other - Cheato Pages

function cheato_WW_hauntedCavern(skip)
    local logic = 99
    --[[        cheato_haunted_cavern
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.slightly_elevated_ledge(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.grip_grab(state) or (self.leg_spring(state) and \
                (self.wing_whack(state) or self.glide(state)))
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.grip_grab(state) or (self.leg_spring(state) and \
                (self.wing_whack(state) or self.glide(state)))\
                or self.clockwork_shot(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.grip_grab(state) or (self.leg_spring(state) and \
                (self.wing_whack(state) or self.glide(state)))\
                or self.clockwork_shot(state)
    --]]
    
    if ( can_reachSlightlyElevatedLedge() ) then
        logic = 0
    elseif ( has("ggrab") or has_legSpring() and (has_wingWhack() or has_glide()) ) then
        logic = 1
    elseif ( can_clockworkShot() ) then
        logic = 2
    end
    
    return convertLogic(logic, skip)
end

function cheato_WW_inferno(skip)
    local logic = 99
    --[[        cheato_inferno
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.humbaWW(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.humbaWW(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.humbaWW(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.humbaWW(state) or self.clockwork_eggs(state)
     --]]
    
    local humba = access_WW_humba(true)
    
    if ( humba <= logictype.CurrentStage ) then
        logic = 0 -- Normal Logic
    elseif ( humba < 3 ) then
        logic = humba -- Sequence Breaking
    elseif ( can_shootEggs("ceggs") ) then
        logic = 3 -- Normal Logic
        
    -- Sequence Breaking
    else
        logic = humba
    end
    
    return convertLogic(logic, skip)
end

----- Other

function trainSwitch_WW(skip)
    local logic = 99
    --[[        tswitch_ww
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.grip_grab(state) and self.flap_flip(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.grip_grab(state) and self.flap_flip(state)\
            or self.leg_spring(state)\
            or self.grip_grab(state) and self.pack_whack(state) and self.tall_jump(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.grip_grab(state) and self.flap_flip(state)\
            or self.leg_spring(state)\
            or self.grip_grab(state) and self.pack_whack(state) and self.tall_jump(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.grip_grab(state) and self.flap_flip(state)\
            or self.leg_spring(state)\
            or self.grip_grab(state) and self.pack_whack(state) and self.tall_jump(state)
    --]]
    
    if ( has("ggrab") and has("fflip") ) then
        logic = 0
    elseif ( has_legSpring() or has("tjump") and has("ggrab") and has_packWhack() ) then
        logic = 1
    end
    
    return convertLogic(logic, skip)
end

function other_WW_moggy(skip)
    local logic = 99
    --[[        moggy
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.mumboWW(state) and \
            self.has_explosives(state)\

    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.mumboWW(state) and \
            self.has_explosives(state)\

    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.mumboWW(state) and \
            ((self.split_up(state) and self.spring_pad(state)) or self.leg_spring(state) or self.glide(state) or self.has_explosives(state))

    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.mumboWW(state) and \
            ((self.split_up(state) and self.spring_pad(state)) or self.leg_spring(state) or self.glide(state) or self.has_explosives(state))
    --]]
    
    local mumbo = access_WW_mumbo(true)
    local explosives = can_shootExplosiveEggs(true)
    
    if ( mumbo <= logictype.CurrentStage and explosives <= logictype.CurrentStage ) then
        logic = 0 -- Normal Logic
    elseif ( mumbo < 2 and explosives < 2 ) then
        logic = 1 -- Sequence Breaking
    elseif ( mumbo <= logictype.CurrentStage and (has("splitup") and has("tjump") or has_legSpring() or has_glide()) ) then
        logic = 2 -- Normal Logic
    
    -- Sequence Breaking
    else
        local withoutExplosives = 99
        if ( has("splitup") and has("tjump") or has_legSpring() or has_glide() ) then
            withoutExplosives = 2
        end
        
        logic = math.max(mumbo, math.min(explosives, withoutExplosives))
    end
    
    return convertLogic(logic, skip)
end

function other_WW_soggy(skip)
    local logic = 99
    --[[        soggy
    if self.world.options.logic_type == LogicType.option_intended:
        logic = state.can_reach_region(regionName.WWI, self.player)

    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = state.can_reach_region(regionName.WWI, self.player)

    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = state.can_reach_region(regionName.WWI, self.player)

    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = state.can_reach_region(regionName.WWI, self.player)
    --]]
    
    local wwiAccessibility = Tracker:FindObjectForCode("@Region: Witchyworld - The Inferno").AccessibilityLevel
    
    -- Normal Logic
    if ( wwiAccessibility == AccessibilityLevel.Normal or wwiAccessibility == AccessibilityLevel.Cleared ) then
        logic = 0
    
    -- Sequence Breaking
    elseif ( wwiAccessibility > AccessibilityLevel.None ) then
        logic = logictype.CurrentStage + 1
    end
    
    return convertLogic(logic, skip)
end

function other_WW_groggy(skip)
    local logic = 99
    --[[        groggy
    if self.world.options.logic_type == LogicType.option_intended:
        logic = state.can_reach_region(regionName.WWI, self.player) and \
            self.taxi_pack(state) and \
            self.spring_pad(state)

    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = state.can_reach_region(regionName.WWI, self.player) and \
            self.taxi_pack(state) and \
            (self.spring_pad(state) or self.leg_spring(state) or self.glide(state))

    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = state.can_reach_region(regionName.WWI, self.player) and \
            self.taxi_pack(state)\
            and (self.spring_pad(state) or self.leg_spring(state) or self.glide(state))

    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = state.can_reach_region(regionName.WWI, self.player) and \
                self.taxi_pack(state)\
                and (self.spring_pad(state) or self.leg_spring(state) or self.glide(state))
    --]]
    
    local wwiAccessibility = Tracker:FindObjectForCode("@Region: Witchyworld - The Inferno").AccessibilityLevel
    
    -- Normal Logic
    if ( (wwiAccessibility == AccessibilityLevel.Normal or wwiAccessibility == AccessibilityLevel.Cleared) and has_taxiPack() and has("tjump") ) then
        logic = 0
    elseif ( (wwiAccessibility == AccessibilityLevel.Normal or wwiAccessibility == AccessibilityLevel.Cleared) and has_taxiPack() and (has_legSpring() or has_glide()) ) then
        logic = 1
    
    -- Sequence Breaking
    elseif ( wwiAccessibility > AccessibilityLevel.None and has_taxiPack() and (has("tjump") or has_legSpring() or has_glide()) ) then
        logic = logictype.CurrentStage + 1
    end
    
    return convertLogic(logic, skip)
end



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
    if self.world.options.logic_type == LogicType.option_intended:
        logic = (self.has_explosives(state) or self.bill_drill(state))\
                    and (self.talon_trot(state)\
                         or self.tall_jump(state) and self.roll(state) and self.flutter(state)
                    )
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = (self.has_explosives(state) or self.bill_drill(state))\
                and (self.talon_trot(state)\
                    or self.tall_jump(state) and self.roll(state) and self.flutter(state)\
                    or state.has(itemName.DOUBLOON, self.player, 28) and self.turbo_trainers(state)
                )
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = (self.has_explosives(state) or self.bill_drill(state))\
                and (self.talon_trot(state)\
                    or self.tall_jump(state) and self.roll(state) and self.flutter(state)\
                    or state.has(itemName.DOUBLOON, self.player, 28) and self.turbo_trainers(state)
                )
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = (self.has_explosives(state) or self.bill_drill(state))\
                and (self.talon_trot(state)\
                    or self.tall_jump(state) and self.roll(state) and self.flutter(state)\
                    or state.has(itemName.DOUBLOON, self.player, 28) and self.turbo_trainers(state)
                )
    --]]
    
    explosives = can_shootExplosiveEggs(true)
    
    -- Normal Logic
    if ( (explosives <= logictype.CurrentStage or has_billDrill()) and (has("ttrot") or has("tjump") and has("roll") and has("flutter")) ) then
        logic = 0
    elseif ( (explosives <= logictype.CurrentStage or has_billDrill()) and has("doubloon", 28) and has("ttrain") ) then
        logic = 1
    
    -- Sequence Breaking
    elseif ( has("ttrot") or has("tjump") and has("roll") and has("flutter") or has("doubloon", 28) and has("ttrain") ) then
        logic = math.max(1, explosives)
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
        logic = self.sub_aqua_egg_aiming(state) and self.grenade_eggs(state)\
                    and (self.humbaJRL(state) or self.check_mumbo_magic(state, itemName.MUMBOJR))
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.sub_aqua_egg_aiming(state) and self.grenade_eggs(state)\
                    and (self.humbaJRL(state) or self.check_mumbo_magic(state, itemName.MUMBOJR))
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.grenade_eggs(state) and self.sub_aqua_egg_aiming(state) and (
                    self.talon_torpedo(state) and self.doubleAir(state)\
                    or self.check_mumbo_magic(state, itemName.MUMBOJR)\
                    or self.humbaJRL(state)
                )
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.grenade_eggs(state) and self.sub_aqua_egg_aiming(state) and (
                    self.talon_torpedo(state) and self.doubleAir(state)\
                    or self.check_mumbo_magic(state, itemName.MUMBOJR)\
                    or self.humbaJRL(state)
                )
    --]]
    
    -- Normal Logic
    if ( has("auqaim") and has("geggs") ) then
        local humba = access_JRL_humba(true)
    
        if ( humba <= logictype.CurrentStage or has("mumbojr") ) then
            logic = 0
        elseif ( humba < 2 ) then
            logic = 1 -- Sequence Breaking
        elseif ( has("ttorp") and has("dair") ) then
            logic = 2
        
        -- Sequence Breaking
        else
            logic = humba
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
    elseif ( has("wwing") ) then
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
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.flap_flip(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.flap_flip(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.flap_flip(state)\
                or self.clockwork_shot(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.flap_flip(state)\
                or self.clockwork_shot(state)
    --]]
    
    if ( has("fflip") ) then
        logic = 0
    elseif ( can_clockworkShot() ) then
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



--------------- Terrydactyland

----- Basic & Access functions

function access_TDL_terryFight(skip)
    local logic = 99
    --[[        can_beat_terry
    if self.world.options.logic_type == LogicType.option_intended:
        return self.egg_aim(state) and self.can_shoot_linear_egg(state) and state.can_reach_region(regionName.TLTOP, self.player)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        return self.egg_aim(state)  and self.can_shoot_linear_egg(state) and state.can_reach_region(regionName.TLTOP, self.player)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        return self.can_shoot_linear_egg(state) and (self.flap_flip(state) or self.egg_aim(state)) and state.can_reach_region(regionName.TLTOP, self.player)
    elif self.world.options.logic_type == LogicType.option_glitches:
        return self.can_shoot_any_egg(state) and (self.flap_flip(state) or self.egg_aim(state)) and state.can_reach_region(regionName.TLTOP, self.player)
    --]]
    
    local tdltAccessibility = Tracker:FindObjectForCode("@Region: Terrydactyland - Top").AccessibilityLevel
    
    -- Normal Logic
    if ( has("eggaim") and can_shootLinearEggs() and (tdltAccessibility == AccessibilityLevel.Normal or tdltAccessibility == AccessibilityLevel.Cleared) ) then
        logic = 0
    elseif ( has("eggaim") and can_shootLinearEggs() and logictype.CurrentStage == 0 and tdltAccessibility > AccessibilityLevel.None ) then
        logic = 1 -- Sequence Breaking
    elseif ( has("fflip") and can_shootLinearEggs() and (tdltAccessibility == AccessibilityLevel.Normal or tdltAccessibility == AccessibilityLevel.Cleared) ) then
        logic = 2
    elseif ( has("eggaim") and can_shootLinearEggs() and logictype.CurrentStage == 1 and tdltAccessibility > AccessibilityLevel.None ) then
        logic = 2 -- Sequence Breaking
    elseif ( can_shootEggs() and (has("fflip") or has("eggaim")) and (tdltAccessibility == AccessibilityLevel.Normal or tdltAccessibility == AccessibilityLevel.Cleared) ) then
        logic = 3
    
    -- Sequence Breaking
    elseif ( can_shootEggs() and (has("fflip") or has("eggaim")) and tdltAccessibility > AccessibilityLevel.None ) then
        logic = logictype.CurrentStage + 1
    end
    
    return convertLogic(logic, skip)
end

function access_TDL_scrit(skip)
    local logic = 99
    --[[
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.mumboTDL(state) and self.bill_drill(state) and self.tall_jump(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.mumboTDL(state) and self.bill_drill(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.mumboTDL(state) and self.bill_drill(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.mumboTDL(state) and self.bill_drill(state)
    --]]
    
    local mumbo = access_TDL_mumbo(true)
    
    -- Normal Logic
    if ( mumbo <= logictype.CurrentStage and has_billDrill() and has("tjump") ) then
        logic = 0
    elseif ( mumbo <= logictype.CurrentStage and has_billDrill() ) then
        logic = 1
    
    -- Sequence Breaking
    elseif ( has_billDrill() ) then
        logic = math.max(1, mumbo)
    end
    
    return convertLogic(logic, skip)
end

function access_TDL_scrat(skip)
    local logic = 99
    --[[
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.can_beat_king_coal(state) and state.has(itemName.TRAINSWIH, self.player) and state.has(itemName.TRAINSWTD, self.player) and self.taxi_pack(state) and self.check_mumbo_magic(state, itemName.MUMBOIH) and (self.tall_jump(state) or self.talon_trot(state))
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.can_beat_king_coal(state) and state.has(itemName.TRAINSWIH, self.player) and state.has(itemName.TRAINSWTD, self.player) and self.taxi_pack(state) and self.check_mumbo_magic(state, itemName.MUMBOIH)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.can_beat_king_coal(state) and state.has(itemName.TRAINSWIH, self.player) and state.has(itemName.TRAINSWTD, self.player) and self.taxi_pack(state) and self.check_mumbo_magic(state, itemName.MUMBOIH)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.can_beat_king_coal(state) and state.has(itemName.TRAINSWIH, self.player) and state.has(itemName.TRAINSWTD, self.player) and self.taxi_pack(state) and self.check_mumbo_magic(state, itemName.MUMBOIH)
    --]]
    
    local canBeatKingCoal = chuffy_canBeatKingCoal(true)
    
    -- Normal Logic
    if ( canBeatKingCoal <= logictype.CurrentStage and has("trainswih") and has("trainswtd") and has_taxiPack() and has("mumboih") and (has("tjump") or has("ttrot")) ) then
        logic = 0
    elseif ( canBeatKingCoal <= logictype.CurrentStage and has("trainswih") and has("trainswtd") and has_taxiPack() and has("mumboih") ) then
        logic = 1
    
    -- Sequence Breaking
    elseif ( has("trainswih") and has("trainswtd") and has_taxiPack() and has("mumboih") ) then
        logic = math.max(1, canBeatKingCoal)
    end
    
    return convertLogic(logic, skip)
end

function access_TDL_scrut(skip)
    local logic = 99
    --[[
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.can_beat_king_coal(state) and state.has(itemName.TRAINSWTD, self.player) and state.has(itemName.TRAINSWWW, self.player) and self.grenade_eggs(state) and self.egg_aim(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.can_beat_king_coal(state) and state.has(itemName.TRAINSWTD, self.player) and state.has(itemName.TRAINSWWW, self.player) and self.grenade_eggs(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.can_beat_king_coal(state) and state.has(itemName.TRAINSWTD, self.player) and state.has(itemName.TRAINSWWW, self.player) and self.grenade_eggs(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.can_beat_king_coal(state) and state.has(itemName.TRAINSWTD, self.player) and state.has(itemName.TRAINSWWW, self.player) and self.grenade_eggs(state)
    --]]
    
    local canBeatKingCoal = chuffy_canBeatKingCoal(true)
    
    -- Normal Logic
    if ( canBeatKingCoal <= logictype.CurrentStage and has("trainswtd") and has("trainswww") and can_shootEggs("geggs") and has("eggaim") ) then
        logic = 0
    elseif ( canBeatKingCoal <= logictype.CurrentStage and has("trainswtd") and has("trainswww") and can_shootEggs("geggs") ) then
        logic = 1
    
    -- Sequence Breaking
    elseif ( has("trainswtd") and has("trainswww") and can_shootEggs("geggs") ) then
        logic = math.max(1, canBeatKingCoal)
    end
    
    return convertLogic(logic, skip)
end

function access_TDL_oogleBooglesOpen(skip)
    local logic = 99
    --[[        oogle_boogles_open
    self.humbaTDL(state) and self.mumboTDL(state)
    --]]
    
    local humba = access_TDL_humba(true)
    local mumbo = access_TDL_mumbo(true)
    
    -- Normal Logic
    if ( humba <= logictype.CurrentStage and mumbo <= logictype.CurrentStage ) then
        logic = 0
    
    -- Sequence Breaking
    else
        logic = math.max(humba, mumbo)
    end
    
    return convertLogic(logic, skip)
end

function access_TDL_oogleBoogle(skip)
    local logic = 99
    --[[        access_oogle_boogle
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.oogle_boogles_open(state) or state.can_reach_region(regionName.WW, self.player) and self.ww_tdl_backdoor(state)        -- connector_WW_to_TDL
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.oogle_boogles_open(state) or state.can_reach_region(regionName.WW, self.player) and self.ww_tdl_backdoor(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.oogle_boogles_open(state) or state.can_reach_region(regionName.WW, self.player) and self.ww_tdl_backdoor(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.oogle_boogles_open(state)\
                or state.can_reach_region(regionName.WW, self.player) and self.ww_tdl_backdoor(state)\
                or self.clockwork_warp(state)
    --]]
    
    local wwAccessibility = Tracker:FindObjectForCode("@Region: Witchyworld - Main Area").AccessibilityLevel
    local oogleBooglesOpen = access_TDL_oogleBooglesOpen(true)
    local WW_to_TDL = connector_WW_to_TDL(true)
    
    if ( oogleBooglesOpen <= logictype.CurrentStage or (wwAccessibility == AccessibilityLevel.Normal or wwAccessibility == AccessibilityLevel.Cleared) and WW_to_TDL <= logictype.CurrentStage ) then
        logic = 0 -- Normal Logic
    elseif ( oogleBooglesOpen < 2 or (wwAccessibility == AccessibilityLevel.Normal or wwAccessibility == AccessibilityLevel.Cleared) and WW_to_TDL < 2 ) then
        logic = 1 -- Sequence Breaking
    elseif ( can_clockworkWarp() ) then
        logic = 2 -- Normal Logic
    elseif ( wwAccessibility == AccessibilityLevel.Normal or wwAccessibility == AccessibilityLevel.Cleared ) then
        logic = math.min(oogleBooglesOpen, WW_to_TDL) -- Sequence Breaking
    elseif ( wwAccessibility > AccessibilityLevel.None ) then
        logic = math.min(oogleBooglesOpen, math.max(logictype.CurrentStage + 1, WW_to_TDL)) -- Sequence Breaking, middle part was already converted once by the json
    end
    
    return convertLogic(logic, skip)
end

function access_TDL_flightPad(skip)
    local logic = 99
    --[[        TDL_flight_pad
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.can_beat_terry(state) and self.springy_step_shoes(state) and self.flight_pad(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.can_beat_terry(state) and self.flight_pad(state)\
                and (self.springy_step_shoes(state) or (self.talon_trot(state) and self.flutter(state)))
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.can_beat_terry(state) and self.flight_pad(state)\
                and (self.springy_step_shoes(state) or (self.talon_trot(state) and self.flutter(state)))
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.can_beat_terry(state) and self.flight_pad(state)\
                and (self.springy_step_shoes(state) or (self.talon_trot(state) and self.flutter(state)))
    --]]
    
    local canBeatTerry = access_TDL_terryFight(true)
    
    -- Normal Logic
    if ( canBeatTerry <= logictype.CurrentStage and has("springb") and has("fpad") ) then
        logic = 0
    elseif ( canBeatTerry <= logictype.CurrentStage and has("fpad") and has("ttrot") and has("flutter") ) then
        logic = 1
    
    -- Sequence Breaking
    elseif ( has("fpad") and (has("springb") or has("ttrot") and has("flutter")) ) then
        logic = canBeatTerry
    end
    
    return convertLogic(logic, skip)
end

function access_TDL_humba(skip)
    local logic = 99
    --[[        humbaTDL
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.small_elevation(state) and state.has(itemName.HUMBATD, self.player)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = state.has(itemName.HUMBATD, self.player)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = state.has(itemName.HUMBATD, self.player)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = state.has(itemName.HUMBATD, self.player)
    --]]
    
    if ( has("humbatd") and can_reachSmallElevation() ) then
        logic = 0
    elseif ( has("humbatd") ) then
        logic = 1
    end
    
    return convertLogic(logic, skip)
end

function access_TDL_mumbo(skip)
    local logic = 99
    --[[        mumboTDL
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.stilt_stride(state) and state.has(itemName.MUMBOTD, self.player)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = state.has(itemName.MUMBOTD, self.player)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = state.has(itemName.MUMBOTD, self.player)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = state.has(itemName.MUMBOTD, self.player)
    --]]
    
    if ( has("mumbotd") and has("sstride") ) then
        logic = 0
    elseif ( has("mumbotd") ) then
        logic = 1
    end
    
    return convertLogic(logic, skip)
end

function access_TDL_warpToMumbo(skip, infiniteLoopStopper)
    local logic = 99
    --[[        warp_to_tdl_mumbo
    state.has(itemName.WARPTL3, self.player) and (
        state.has(itemName.WARPTL1, self.player)\
        or state.has(itemName.WARPTL2, self.player) and state.can_reach_region(regionName.TLSP, self.player)\
        or state.has(itemName.WARPTL4, self.player) and state.can_reach_location(locationName.WARPTL4, self.player)\
        or state.has(itemName.WARPTL5, self.player) and state.can_reach_region(regionName.TLTOP, self.player)\
    )
    --]]
    
    if ( has("warptl3") ) then
        local tdlSPAccessibility = Tracker:FindObjectForCode("@Region: Terrydactyland - Stomping Plains").AccessibilityLevel
        local mumboWarp = 99
        if ( infiniteLoopStopper ) then
            mumboWarp = 99
        else
            mumboWarp = warp_TDL_mumbo(true, true)
        end
        local tdlTAccessibility = Tracker:FindObjectForCode("@Region: Terrydactyland - Top").AccessibilityLevel
        
        -- Normal Logic
        if ( has("warptl1") or has("warptl2") and (tdlSPAccessibility == AccessibilityLevel.Normal or tdlSPAccessibility == AccessibilityLevel.Cleared) or has("warptl4") and mumboWarp <= logictype.CurrentStage or has("warptl5") and (tdlTAccessibility == AccessibilityLevel.Normal or tdlTAccessibility == AccessibilityLevel.Cleared) ) then
            logic = 0
            
        -- Sequence Breaking
        else
            stomping = 99
            if ( has("warptl2") and tdlSPAccessibility > AccessibilityLevel.None ) then
                stomping = logictype.CurrentStage + 1 -- was already converted once by the json
            end
            
            mumbo = 99
            if ( has("warptl4") ) then
                mumbo = mumboWarp
            end
            
            top = 99
            if ( has("warptl5") and tdlTAccessibility > AccessibilityLevel.None ) then
                top = logictype.CurrentStage + 1 -- was already converted once by the json
            end
            
            logic = math.min(stomping, mumbo, top)
        end
    end

    return convertLogic(logic, skip)
end

function access_TDL_warpToHumba(skip, infiniteLoopStopper)
    local logic = 99
    --[[        warp_to_tdl_wumba
    state.has(itemName.WARPTL4, self.player) and (
        state.has(itemName.WARPTL1, self.player)\
        or state.has(itemName.WARPTL2, self.player) and state.can_reach_region(regionName.TLSP, self.player)\
        or state.has(itemName.WARPTL3, self.player) and state.can_reach_location(locationName.WARPTL3, self.player)\
        or state.has(itemName.WARPTL5, self.player) and state.can_reach_region(regionName.TLTOP, self.player)\
    )
    --]]
    
    if ( has("warptl4") ) then
        local tdlSPAccessibility = Tracker:FindObjectForCode("@Region: Terrydactyland - Stomping Plains").AccessibilityLevel
        local humbaWarp = 99
        if ( infiniteLoopStopper ) then
            humbaWarp = 99
        else
            humbaWarp = warp_TDL_humba(true, true)
        end
        local tdlTAccessibility = Tracker:FindObjectForCode("@Region: Terrydactyland - Top").AccessibilityLevel
        
        -- Normal Logic
        if ( has("warptl1") or has("warptl2") and (tdlSPAccessibility == AccessibilityLevel.Normal or tdlSPAccessibility == AccessibilityLevel.Cleared) or has("warptl3") and humbaWarp <= logictype.CurrentStage or has("warptl5") and (tdlTAccessibility == AccessibilityLevel.Normal or tdlTAccessibility == AccessibilityLevel.Cleared) ) then
            logic = 0
            
        -- Sequence Breaking
        else
            stomping = 99
            if ( has("warptl2") and tdlSPAccessibility > AccessibilityLevel.None ) then
                stomping = logictype.CurrentStage + 1 -- was already converted once by the json
            end
            
            humba = 99
            if ( has("warptl3") ) then
                humba = humbaWarp
            end
            
            top = 99
            if ( has("warptl5") and tdlTAccessibility > AccessibilityLevel.None ) then
                top = logictype.CurrentStage + 1 -- was already converted once by the json
            end
            
            logic = math.min(stomping, humba, top)
        end
    end

    return convertLogic(logic, skip)
end

----- Silos

function silo_TDL_springyStepShoes(skip)
    local logic = 99
    --[[
    self.check_notes(state, locationName.SPRINGB) and self.silo_spring(state)
    
    if self.world.options.logic_type == LogicType.option_intended:
        return self.flap_flip(state) and self.grip_grab(state)\
                or self.TDL_flight_pad(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        return self.flap_flip(state) and (self.grip_grab(state) or self.beak_buster(state))\
                or self.TDL_flight_pad(state)\
                or self.veryLongJump(state)\
                or self.turbo_trainers(state)\
                or self.springy_step_shoes(state)

    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        return self.flap_flip(state) and (self.grip_grab(state) or self.beak_buster(state))\
                or self.TDL_flight_pad(state)\
                or self.veryLongJump(state)\
                or self.turbo_trainers(state)\
                or self.springy_step_shoes(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        return self.flap_flip(state) and (self.grip_grab(state) or self.beak_buster(state))\
                or self.TDL_flight_pad(state)\
                or self.veryLongJump(state)\
                or self.turbo_trainers(state)\
                or self.springy_step_shoes(state)
    --]]
    
    if ( springb_count() ) then
        local flightPad = access_TDL_flightPad(true)
        
        -- Normal Logic
        if ( has("fflip") and has("ggrab") or flightPad <= logictype.CurrentStage ) then
            logic = 0
        elseif ( has("fflip") and has("bbust") or can_veryLongJump() or has("ttrain") or has("springb") ) then
            logic = 1
        
        -- Sequence Breaking
        else
            logic = flightPad
        end
    end
    
    return convertLogic(logic, skip)
end

function silo_TDL_taxiPack(skip)
    local logic = 99
    --[[
    self.can_access_taxi_pack_silo(state) and self.check_notes(state, locationName.TAXPACK)
    
    if self.world.options.logic_type == LogicType.option_intended:
        return self.split_up(state) and (self.tall_jump(state) and (self.grip_grab(state) or self.sack_pack(state)))
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        return self.split_up(state) and\
                    (self.tall_jump(state) and (self.grip_grab(state) or
                    self.pack_whack(state) and self.tall_jump(state)\                       -- checking for tall jump here is redundant because it's also outside of the brackets
                    or self.pack_whack(state) and self.grip_grab(state)\
                    or self.sack_pack(state)))
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        return self.split_up(state) and\
                    (self.tall_jump(state) and (self.grip_grab(state)\
                    or self.pack_whack(state) and self.tall_jump(state)\
                    or self.pack_whack(state) and self.grip_grab(state)\
                    or self.sack_pack(state)))
    elif self.world.options.logic_type == LogicType.option_glitches:
        return self.split_up(state) and\
                    (self.tall_jump(state) and (self.grip_grab(state) or
                    self.pack_whack(state) and self.tall_jump(state)\
                    or self.pack_whack(state) and self.grip_grab(state)\
                    or self.sack_pack(state)))
    --]]
    
    -- FIXIT - needs testing - you probably do not need tall jump with pack whack if you have grip grab
    
    if ( taxpack_count() and has("splitup") ) then
        if ( has("tjump") and (has("ggrab") or has_sackPack()) ) then
            logic = 0
        elseif ( has("tjump") and has_packWhack() ) then
            logic = 1
        end
    end
    
    return convertLogic(logic, skip)
end

function silo_TDL_hatch(skip)
    local logic = 99
    --[[
    self.split_up(state) and self.check_notes(state, locationName.HATCH)
    --]]
    
    if ( hatch_count() and has("splitup") ) then
        logic = 0
    end
    
    return convertLogic(logic, skip)
end

----- Warp Pads

function warp_TDL_mumbo(skip, infiniteLoopStopper)
    local logic = 99
    --[[        warp_pad_tdl_mumbo
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.stilt_stride(state)\
                or self.warp_to_tdl_mumbo(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = True
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = True
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = True
    --]]
    
    local mumboWarp = 99
    if ( infiniteLoopStopper ) then
        mumboWarp = 99
    else
        mumboWarp = access_TDL_warpToMumbo(true, true)
    end
    
    if ( has("sstride") or mumboWarp <= logictype.CurrentStage ) then
        logic = 0
    else
        logic = 1
    end

    return convertLogic(logic, skip)
end

function warp_TDL_humba(skip, infiniteLoopStopper)
    local logic = 99
    --[[        warp_pad_tdl_wumba
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.small_elevation(state) or self.warp_to_tdl_wumba(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = True
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = True
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = True
    --]]
    
    local humbaWarp = 99
    if ( infiniteLoopStopper ) then
        humbaWarp = 99
    else
        humbaWarp = access_TDL_warpToHumba(true, true)
    end
    
    if ( can_reachSmallElevation() or humbaWarp <= logictype.CurrentStage ) then
        logic = 0
    else
        logic = 1
    end

    return convertLogic(logic, skip)
end

----- Jiggies

function jiggy_TDL_terrysNest(skip)
    local logic = 99
    --[[        jiggy_terry_nest
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.can_beat_terry(state) and (self.has_explosives(state) or \
                self.bill_drill(state))
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = (self.has_explosives(state) or self.bill_drill(state)) and self.can_beat_terry(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = (self.has_explosives(state) or self.bill_drill(state)) and self.can_beat_terry(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = (self.has_explosives(state) or self.bill_drill(state)) and self.can_beat_terry(state)
    --]]
    
    local canBeatTerry = access_TDL_terryFight(true)
    local explosives = can_shootExplosiveEggs(true)
    
    -- Normal Logic
    if ( canBeatTerry <= logictype.CurrentStage and (has_billDrill() or explosives <= logictype.CurrentStage) ) then
        logic = 0
        
    -- Sequence Breaking
    else
        local withBillDrill = 99
        if ( has_billDrill() ) then
            withBillDrill = 0
        end
        
        logic = math.max(canBeatTerry, math.min(withBillDrill, explosives))
    end
    
    return convertLogic(logic, skip)
end

function jiggy_TDL_dippy(skip)
    local logic = 99
    --[[        jiggy_dippy
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.talon_torpedo(state) and state.can_reach_region(regionName.CC, self.player) and self.dive(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.talon_torpedo(state) and state.can_reach_region(regionName.CC, self.player) and (self.dive(state) or self.beak_buster(state))
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.talon_torpedo(state) and state.can_reach_region(regionName.CC, self.player)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.talon_torpedo(state) and state.can_reach_region(regionName.CC, self.player)
    --]]
    
    local cclAccessibility = Tracker:FindObjectForCode("@Region: Cloud Cuckooland").AccessibilityLevel
    
    -- Normal Logic
    if ( has("dive") and has("ttorp") and (cclAccessibility == AccessibilityLevel.Normal or cclAccessibility == AccessibilityLevel.Cleared) ) then
        logic = 0
    elseif ( has("bbust") and has("ttorp") and (cclAccessibility == AccessibilityLevel.Normal or cclAccessibility == AccessibilityLevel.Cleared) ) then
        logic = 1
    elseif ( has("ttorp") and (cclAccessibility == AccessibilityLevel.Normal or cclAccessibility == AccessibilityLevel.Cleared) ) then
        logic = 2
        
    -- Sequence Breaking
    elseif ( has("ttorp") and cclAccessibility > AccessibilityLevel.None ) then
        logic = math.max(2, logictype.CurrentStage + 1) -- was already converted once by the json
    end
    
    return convertLogic(logic, skip)
end

function jiggy_TDL_scrotty(skip)
    local logic = 99
    --[[        jiggy_scrotty
    self.scrit(state) and self.scrat(state) and self.scrut(state)
    --]]
    
    local scrit = access_TDL_scrit(true)
    local scrat = access_TDL_scrat(true)
    local scrut = access_TDL_scrut(true)
    
    -- Normal Logic
    if ( scrit <= logictype.CurrentStage and scrat <= logictype.CurrentStage and scrut <= logictype.CurrentStage ) then
        logic = 0
        
    -- Sequence Breaking
    else
        logic = math.max(scrit, scrat, scrut)
    end
    
    return convertLogic(logic, skip)
end

function jiggy_TDL_oogleBoogle(skip)
    local logic = 99
    --[[        jiggy_oogle_boogle
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.access_oogle_boogle(state) and self.fire_eggs(state) and \
                self.smuggle_food(state) and self.grip_grab(state) and \
                self.bill_drill(state) and self.spring_pad(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.access_oogle_boogle(state) and self.has_fire(state) and \
                self.smuggle_food(state) and self.grip_grab(state) and \
                self.bill_drill(state) and self.spring_pad(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.access_oogle_boogle(state) and self.has_fire(state) and \
                self.grip_grab(state) and self.bill_drill(state) and self.smuggle_food(state)\
                and self.spring_pad(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = (self.access_oogle_boogle(state) or self.clockwork_warp(state))\
                and self.has_fire(state) and self.grip_grab(state) and self.bill_drill(state) and self.smuggle_food(state) and self.spring_pad(state)
            
    
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.claw_clamber_boots(state) and self.talon_trot(state) and self.has_explosives(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.claw_clamber_boots(state) and self.has_explosives(state)\
                and (
                    self.talon_trot(state)\
                    or state.can_reach_region(regionName.WWI, self.player) and self.turbo_trainers(state)
                )
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.has_explosives(state) or self.spring_pad(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.has_explosives(state) or self.spring_pad(state)
    --]]
    
    local oogleBoogle = access_TDL_oogleBoogle(true)
    local explosives = can_shootExplosiveEggs(true)
    local hasFire = can_useFire(true)
    local wwHumba = access_WW_humba(true)
    local warpToInferno = access_WW_warpToInferno(true)
    
    -- Normal Logic
    if ( oogleBoogle <= logictype.CurrentStage and can_shootEggs("feggs") and has("ggrab") and has("tjump") and has_billDrill() and has("clawbts") and has("ttrot") and explosives <= logictype.CurrentStage ) then
        logic = 0
    elseif ( oogleBoogle <= logictype.CurrentStage and hasFire <= logictype.CurrentStage and has("ggrab") and has("tjump") and has_billDrill() and has("clawbts") and (has("ttrot") or has("ttrain") and (wwHumba <= logictype.CurrentStage or warpToInferno <= logictype.CurrentStage)) and explosives <= logictype.CurrentStage ) then
        logic = 1
    elseif ( oogleBoogle < 2 and can_shootEggs("feggs") and has("ggrab") and has("tjump") and has_billDrill() and has("clawbts") and (has("ttrot") or has("ttrain") and (wwHumba < 2 or warpToInferno < 2)) and explosives < 2 ) then
        logic = 1 -- Sequence Breaking
    elseif ( oogleBoogle <= logictype.CurrentStage and hasFire <= logictype.CurrentStage and has("ggrab") and has("tjump") and has_billDrill() ) then
        logic = 2
    elseif ( oogleBoogle < 3 and hasFire < 3 and has("ggrab") and has("tjump") and has_billDrill() ) then
        logic = 2 -- Sequence Breaking
    elseif ( can_clockworkWarp() and hasFire <= logictype.CurrentStage and has("ggrab") and has("tjump") and has_billDrill() ) then
        logic = 3
        
    -- Sequence Breaking
    elseif ( has("ggrab") and has("tjump") and has_billDrill() ) then
        local withWarp = 99
        if ( can_clockworkWarp() ) then
            withWarp = 3
        end
        
        logic = math.max(2, hasFire, math.min(withWarp, oogleBoogle))
    end
    
    return convertLogic(logic, skip)
end

function jiggy_TDL_chompa(skip)
    local logic = 99
    --[[        jiggy_chompa
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.breegull_blaster(state) and (
            ((self.tall_jump(state) or self.grip_grab(state)) and self.flight_pad(state)
             or (self.egg_aim(state) and self.has_explosives(state) and self.springy_step_shoes(state)))
        )
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.breegull_blaster(state) and (
            ((self.tall_jump(state) or self.grip_grab(state)) and self.flight_pad(state)
             or (self.egg_aim(state) and self.has_explosives(state) and self.springy_step_shoes(state))
             or (self.springy_step_shoes(state) and self.veryLongJump(state)))
        )
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.breegull_blaster(state) and (
            ((self.tall_jump(state) or self.grip_grab(state) or self.beak_buster(state)) and self.flight_pad(state)
             or (self.egg_aim(state) and self.has_explosives(state) and self.springy_step_shoes(state))
             or (self.springy_step_shoes(state) and self.veryLongJump(state)))
        )
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.breegull_blaster(state) and (
            ((self.tall_jump(state) or self.grip_grab(state) or self.beak_buster(state)) and self.flight_pad(state)
             or (self.egg_aim(state) and self.has_explosives(state) and self.springy_step_shoes(state))
             or (self.springy_step_shoes(state) and self.veryLongJump(state)))
        )
    --]]
    
    local explosives = can_shootExplosiveEggs(true)
    
    if ( has("bblaster") ) then
        -- Normal Logic
        if ( (has("tjump") or has("ggrab")) and has("fpad") or has("springb") and has("eggaim") and explosives <= logictype.CurrentStage ) then
            logic = 0
        elseif ( has("springb") and can_veryLongJump() ) then
            logic = 1
        elseif ( has("springb") and has("eggaim") and explosives < 2 ) then
            logic = 1 -- Sequence Breaking
        elseif ( has("bbust") and has("fpad") ) then
            logic = 2
            
        -- Sequence Breaking
        elseif ( has("springb") and has("eggaim") ) then
            logic = explosives
        end
    end
    
    return convertLogic(logic, skip)
end

function jiggy_TDL_terrysKids(skip)
    local logic = 99
    --[[        jiggy_terry_kids
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.can_beat_terry(state) and self.hatch(state) and \
                self.taxi_pack(state) and self.access_oogle_boogle(state)\
                and self.flight_pad(state) and self.climb(state) and self.spring_pad(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.can_beat_terry(state) and self.hatch(state) and \
                self.taxi_pack(state) and self.access_oogle_boogle(state)\
                and self.flight_pad(state) and self.climb(state) and self.spring_pad(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.can_beat_terry(state) and self.hatch(state) and \
                self.taxi_pack(state) and self.access_oogle_boogle(state)\
                and self.flight_pad(state) and self.climb(state) and self.spring_pad(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.can_beat_terry(state) and self.hatch(state) and \
                self.taxi_pack(state) and self.access_oogle_boogle(state)\
                and self.flight_pad(state) and self.climb(state) and self.spring_pad(state)
    --]]
    
    local canBeatTerry = access_TDL_terryFight(true)
    local oogleBoogle = access_TDL_oogleBoogle(true)
    
    -- Normal Logic
    if ( canBeatTerry <= logictype.CurrentStage and has_hatch() and has_taxiPack() and oogleBoogle <= logictype.CurrentStage and has("fpad") and has("climb") and has("tjump") ) then
        logic = 0
        
    -- Sequence Breaking
    elseif ( has_hatch() and has_taxiPack() and has("fpad") and has("climb") and has("tjump") ) then
        logic = math.max(canBeatTerry, oogleBoogle)
    end
    
    return convertLogic(logic, skip)
end

function jiggy_TDL_stompingPlainsAsDuo(skip)
    local logic = 99
    --[[        jiggy_stomping_plains
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.talon_trot(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.talon_trot(state) or self.springy_step_shoes(state) or self.turbo_trainers(state)\
                or self.split_up(state) and self.snooze_pack(state) and self.tall_jump(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.tall_jump(state) or self.talon_trot(state) or self.springy_step_shoes(state) or self.turbo_trainers(state)\
                or self.split_up(state) and self.snooze_pack(state) and self.tall_jump(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.tall_jump(state) or self.talon_trot(state) or self.springy_step_shoes(state) or self.turbo_trainers(state)\
                or self.split_up(state) and self.snooze_pack(state) and self.tall_jump(state)
    --]]
    
    if ( has("ttrot") ) then
        logic = 0
    elseif ( has("springb") or has("ttrain") or has("tjump") and has_snoozePack() ) then
        logic = 1
    elseif ( has("tjump") ) then
        logic = 2
    elseif ( has("wwing") ) then
        logic = 7
    end
    
    return convertLogic(logic, skip)
end

function jiggy_TDL_rocknutTribe(skip)
    local logic = 99
    --[[        jiggy_rocknuts
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.egg_aim(state) and self.clockwork_eggs(state) and self.long_jump(state) and self.tall_jump(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.egg_aim(state) and self.clockwork_eggs(state) and self.long_jump(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.clockwork_eggs(state) and ((self.egg_aim(state) and self.long_jump(state)) or self.veryLongJump(state))
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.clockwork_eggs(state) and ((self.egg_aim(state) and self.long_jump(state)) or self.veryLongJump(state))
    --]]
    
    if ( can_clockworkShot() and can_longJump() and has("tjump") ) then
        logic = 0
    elseif ( can_clockworkShot() and can_longJump() ) then
        logic = 1
    elseif ( can_shootEggs("ceggs") and can_veryLongJump() ) then
        logic = 2
    end
    
    return convertLogic(logic, skip)
end

function jiggy_TDL_roarCage(skip)
    local logic = 99
    --[[        jiggy_roar_cage
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.humbaTDL(state) and self.roar(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.humbaTDL(state) and self.roar(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.humbaTDL(state) and self.roar(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.humbaTDL(state) and self.roar(state)\
                or self.clockwork_shot(state) and (self.springy_step_shoes(state) or self.long_jump(state) or self.split_up(state))
    --]]
    
    local humba = access_TDL_humba(true)
    
    if ( humba <= logictype.CurrentStage and has("roar") ) then
        logic = 0 -- Normal Logic
    elseif ( humba < 3 and has("roar") ) then
        logic = humba -- Sequence Breaking
    elseif ( can_clockworkShot() and (has("springb") or can_longJump() or has("splitup")) ) then
        logic = 3 -- Normal Logic
    
    -- Sequence Breaking
    elseif ( has("roar") ) then
        logic = humba
    end
    
    return convertLogic(logic, skip)
end

----- Notes

function treble_TDL(skip)
    local logic = 99
    --[[        treble_tdl
    if self.world.options.logic_type == LogicType.option_intended:
        logic = ((self.flap_flip(state) and self.grip_grab(state)) or self.TDL_flight_pad(state)) and self.bill_drill(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = ((self.flap_flip(state) and (self.grip_grab(state) or self.beak_buster(state)))\
                 or self.TDL_flight_pad(state)) and self.bill_drill(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = ((self.flap_flip(state) and (self.grip_grab(state) or self.beak_buster(state)))\
                 or self.TDL_flight_pad(state)) and self.bill_drill(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = ((self.flap_flip(state) and (self.grip_grab(state) or self.beak_buster(state))) or self.TDL_flight_pad(state))\
                    and (self.bill_drill(state) or self.egg_barge(state) or self.ground_rat_a_tat_rap(state))\
                or self.humbaTDL(state) and self.mumboTDL(state)
    --]]
    
    local flightPad = access_TDL_flightPad(true)
    local humba = access_TDL_humba(true)
    local mumbo = access_TDL_mumbo(true)
    
    -- Normal Logic
    if ( has_billDrill() and (has("fflip") and has("ggrab") or flightPad <= logictype.CurrentStage) ) then
        logic = 0
    elseif ( has_billDrill() and has("fflip") and has("bbust") ) then
        logic = 1
    elseif ( has_billDrill() and flightPad < 3 ) then
        logic = flightPad -- Sequence Breaking
    elseif ( (can_eggBarge() or has("grat")) and (has("fflip") and (has("bbust") or has("ggrab")) or flightPad <= logictype.CurrentStage) or humba <= logictype.CurrentStage and mumbo <= logictype.CurrentStage ) then
        logic = 3
    
    -- Sequence Breaking
    else
        local withFlight = 99
        if ( can_eggBarge() or has("grat") or has_billDrill() ) then
            withFlight = flightPad
        end
        
        logic = math.max(3, math.min(withFlight, math.max(humba, mumbo)))
    end
    
    return convertLogic(logic, skip)
end

function notes_TDL_nearTrainStationRight(skip)
    local logic = 99
    --[[        notes_tdl_station_right
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.small_elevation(state)\
                or self.humbaTDL(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.small_elevation(state)\
                or self.humbaTDL(state)\
                or self.split_up(state)\
                or self.springy_step_shoes(state)\
                or self.turbo_trainers(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.small_elevation(state)\
                or self.humbaTDL(state)\
                or self.split_up(state)\
                or self.springy_step_shoes(state)\
                or self.turbo_trainers(state)\
                or self.clockwork_shot(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.small_elevation(state)\
                or self.humbaTDL(state)\
                or self.split_up(state)\
                or self.springy_step_shoes(state)\
                or self.turbo_trainers(state)\
                or self.clockwork_shot(state)
    --]]
    
    local humba = access_TDL_humba(true)
    
    -- Normal Logic
    if ( can_reachSmallElevation() or humba <= logictype.CurrentStage ) then
        logic = 0
    elseif ( has("splitup") or has("springb") or has("ttrain") ) then
        logic = 1
    elseif ( humba < 2 ) then
        logic = 1 -- Sequence Breaking
    elseif ( can_clockworkShot() ) then
        logic = 2
    elseif ( has("wwing") ) then
        logic = 7
    
    -- Sequence Breaking
    else
        logic = humba
    end
    
    return convertLogic(logic, skip)
end

function notes_TDL_nearRoarCage(skip)
    local logic = 99
    --[[        notes_roar_cage
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.long_jump(state)\
                or self.springy_step_shoes(state)\
                or self.TDL_flight_pad(state)\
                or self.humbaTDL(state) and self.roar(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.long_jump(state)\
                or self.springy_step_shoes(state)\
                or self.TDL_flight_pad(state)\
                or self.humbaTDL(state) and self.roar(state)\
                or self.split_up(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.long_jump(state)\
                or self.springy_step_shoes(state)\
                or self.TDL_flight_pad(state)\
                or self.humbaTDL(state) and self.roar(state)\
                or self.split_up(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.long_jump(state)\
                or self.springy_step_shoes(state)\
                or self.TDL_flight_pad(state)\
                or self.humbaTDL(state) and self.roar(state)\
                or self.split_up(state)
    --]]
    
    local flightPad = access_TDL_flightPad(true)
    local humba = access_TDL_humba(true)
    
    -- Normal Logic
    if ( can_longJump() or has("springb") or flightPad <= logictype.CurrentStage or humba <= logictype.CurrentStage and has("roar") ) then
        logic = 0
    elseif ( has("splitup") ) then
        logic = 1
    
    -- Sequence Breaking
    else
        local dino = 99
        if ( has("roar") ) then
            dino = humba
        end
        
        logic = math.min(flightPad, dino)
    end
    
    return convertLogic(logic, skip)
end

function notes_TDL_riverPassage(skip)
    local logic = 99
    --[[        notes_river_passage
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.dive(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.dive(state) or self.humbaTDL(state) or self.shack_pack(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.dive(state) or self.humbaTDL(state) or self.shack_pack(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.dive(state) or self.humbaTDL(state) or self.shack_pack(state)
    --]]
    
    local humba = access_TDL_humba(true)
    
    -- Normal Logic
    if ( has("dive") ) then
        logic = 0
    elseif ( humba <= logictype.CurrentStage or has_shackPack() ) then
        logic = 1
    
    -- Sequence Breaking
    else
        logic = math.max(1, humba)
    end
    
    return convertLogic(logic, skip)
end

----- Nests

function nests_TDL_wallWithHoles(skip)
    local logic = 99
    --[[        nest_tdl_wall_with_holes
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.talon_trot(state) or self.tall_jump(state) and self.grip_grab(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.talon_trot(state)\
                or self.tall_jump(state) and self.grip_grab(state)\
                or self.humbaTDL(state)\
                or self.leg_spring(state)\
                or self.glide(state)\
                or self.pack_whack(state)\
                or self.springy_step_shoes(state)\
                or self.turbo_trainers(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.talon_trot(state)\
                or self.tall_jump(state) and self.grip_grab(state)\
                or self.humbaTDL(state)\
                or self.leg_spring(state)\
                or self.glide(state)\
                or self.pack_whack(state)\
                or self.sack_pack(state)\
                or self.springy_step_shoes(state)\
                or self.turbo_trainers(state)\
                or self.clockwork_shot(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.talon_trot(state)\
                or self.tall_jump(state) and self.grip_grab(state)\
                or self.humbaTDL(state)\
                or self.leg_spring(state)\
                or self.glide(state)\
                or self.pack_whack(state)\
                or self.sack_pack(state)\
                or self.springy_step_shoes(state)\
                or self.turbo_trainers(state)\
                or self.clockwork_shot(state)
    --]]
    
    local humba = access_TDL_humba(true)
    
    -- Normal Logic
    if ( has("ttrot") or has("tjump") and has("ggrab") ) then
        logic = 0
    elseif ( humba <= logictype.CurrentStage or has_legSpring() or has_glide() or has_packWhack() or has("springb") or has("ttrain") ) then
        logic = 1
    elseif ( can_clockworkShot() or has_sackPack() ) then
        logic = 2
    
    -- Sequence Breaking
    else
        logic = math.max(1, humba)
    end
    
    return convertLogic(logic, skip)
end

function nests_TDL_waterfallAlcove(skip)
    local logic = 99
    --[[        nest_tdl_waterfall_alcove
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.flap_flip(state) and self.grip_grab(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.flap_flip(state) and self.grip_grab(state)\
                or self.flutter(state)\
                or self.air_rat_a_tat_rap(state)\
                or self.split_up(state)\
                or self.humbaTDL(state) and self.roar(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.flap_flip(state) and self.grip_grab(state)\
                or self.flutter(state)\
                or self.air_rat_a_tat_rap(state)\
                or self.split_up(state)\
                or self.humbaTDL(state) and self.roar(state)\
                or self.clockwork_shot(state)\
                or self.talon_trot(state)\
                or self.turbo_trainers(state)\
                or state.can_reach_region(regionName.TLTOP, self.player)\
                or self.springy_step_shoes(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.flap_flip(state) and self.grip_grab(state)\
                or self.flutter(state)\
                or self.air_rat_a_tat_rap(state)\
                or self.split_up(state)\
                or self.humbaTDL(state) and self.roar(state)\
                or self.clockwork_shot(state)\
                or self.talon_trot(state)\
                or self.turbo_trainers(state)\
                or self.springy_step_shoes(state)\
                or state.can_reach_region(regionName.TLTOP, self.player)\
                or self.humbaTDL(state) and self.mumboTDL(state)
    --]]
    
    -- FIXIT this should probably be in logic on easy tricks with the flight pad
    
    local humba = access_TDL_humba(true)
    local tdltAccessibility = Tracker:FindObjectForCode("@Region: Terrydactyland - Top").AccessibilityLevel
    local mumbo = access_TDL_mumbo(true)
    
    -- Normal Logic
    if ( has("fflip") and has("ggrab") ) then
        logic = 0
    elseif ( has("flutter") or has("arat") or has("splitup") or humba <= logictype.CurrentStage and has("roar") ) then
        logic = 1
    elseif ( can_clockworkShot() or has("ttrot") or has("ttrain") or has("springb") or tdltAccessibility == AccessibilityLevel.Normal or tdltAccessibility == AccessibilityLevel.Cleared ) then
        logic = 2
    elseif ( humba < 3 and has("roar") ) then
        logic = 2 -- Sequence Breaking
    elseif ( humba <= logictype.CurrentStage and mumbo <= logictype.CurrentStage ) then
        logic = 3
    
    -- Sequence Breaking
    else
        local withRoar = 99
        if ( has("roar") ) then
            withRoar = 1
        end
        
        logic = math.max(3, humba, math.min(withRoar, mumbo))
    end
    
    return convertLogic(logic, skip)
end

function nests_TDL_nearRiverPassage(skip)
    local logic = 99
    --[[        nest_river_passage_entrance
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.tall_jump(state) or self.grip_grab(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.tall_jump(state)\
                or self.grip_grab(state)\
                or self.pack_whack(state)\
                or self.wing_whack(state)\
                or self.glide(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.tall_jump(state)\
                or self.grip_grab(state)\
                or self.pack_whack(state)\
                or self.wing_whack(state)\
                or self.glide(state)\
                or self.clockwork_shot(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.tall_jump(state)\
                or self.grip_grab(state)\
                or self.pack_whack(state)\
                or self.wing_whack(state)\
                or self.glide(state)\
                or self.clockwork_shot(state)
    --]]
    
    if ( has("tjump") and has("ggrab") ) then
        logic = 0
    elseif ( has("tjump") or has("ggrab") or has_packWhack() or has_wingWhack() or has_glide() ) then
        logic = 1
    elseif ( can_clockworkShot() ) then
        logic = 2
    end
    
    return convertLogic(logic, skip)
end

function nests_TDL_trainStation(skip)
    local logic = 99
    --[[        enter_tdl_train_station
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.small_elevation(state)\
                or state.can_reach_region(regionName.CHUFFY, self.player) and state.has(itemName.CHUFFY, self.player) and state.has(itemName.TRAINSWTD, self.player)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.small_elevation(state)\
                or self.turbo_trainers(state)\
                or self.springy_step_shoes(state)\
                or state.can_reach_region(regionName.CHUFFY, self.player) and state.has(itemName.CHUFFY, self.player) and state.has(itemName.TRAINSWTD, self.player)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = True
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = True
    --]]
    
    local chuffyAccessibility = Tracker:FindObjectForCode("@Region: Inside Chuffy").AccessibilityLevel
    
    -- Normal Logic
    if ( can_reachSmallElevation() or has("trainswtd") and (chuffyAccessibility == AccessibilityLevel.Normal or chuffyAccessibility == AccessibilityLevel.Cleared) ) then
        logic = 0
    elseif ( has("ttrain") or has("springb") ) then
        logic = 1
    elseif ( logictype.CurrentStage == 0 and chuffyAccessibility > AccessibilityLevel.None ) then
        logic = 1 -- Sequence Breaking
    else
        logic = 2
    end
    
    return convertLogic(logic, skip)
end

function nests_TDL_insideMountainByFlightPad(skip)
    local logic = 99
    --[[        nest_mountain_flight_pad
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.tall_jump(state) or self.grip_grab(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.tall_jump(state)\
                or self.grip_grab(state)\
                or self.beak_buster(state)\
                or self.leg_spring(state) and self.glide(state)\
                or state.can_reach_region(regionName.TLTOP, self.player) and self.split_up(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.tall_jump(state)\
                or self.grip_grab(state)\
                or self.beak_buster(state)\
                or self.leg_spring(state) and self.glide(state)\
                or state.can_reach_region(regionName.TLTOP, self.player) and self.split_up(state)\
                or self.clockwork_shot(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.tall_jump(state)\
                or self.grip_grab(state)\
                or self.beak_buster(state)\
                or self.leg_spring(state) and self.glide(state)\
                or state.can_reach_region(regionName.TLTOP, self.player) and self.split_up(state)\
                or self.clockwork_shot(state)
    --]]
    
    local tdltAccessibility = Tracker:FindObjectForCode("@Region: Terrydactyland - Top").AccessibilityLevel
    
    -- Normal Logic
    if ( has("tjump") or has("ggrab") ) then
        logic = 0
    elseif ( has("bbust") or has_legSpring() and has_glide() or has("splitup") and (tdltAccessibility == AccessibilityLevel.Normal or tdltAccessibility == AccessibilityLevel.Cleared) ) then
        logic = 1
    elseif ( can_clockworkShot() ) then
        logic = 2
    
    -- Sequence Breaking
    elseif ( has("splitup") and tdltAccessibility > AccessibilityLevel.None ) then
        logic = logictype.CurrentStage + 1
    end
    
    return convertLogic(logic, skip)
end

function nests_TDL_insideMountainUnderwater(skip)
    local logic = 99
    --[[        nest_mountain_underwater
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.dive(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.dive(state) or self.humbaTDL(state) or self.shack_pack(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.dive(state) or self.humbaTDL(state) or self.shack_pack(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.dive(state) or self.humbaTDL(state) or self.shack_pack(state)
    --]]
    
    local humba = access_TDL_humba(true)
    
    -- Normal Logic
    if ( has("dive") ) then
        logic = 0
    elseif ( has_shackPack() or humba <= logictype.CurrentStage ) then
        logic = 1
    
    -- Sequence Breaking
    else
        logic = humba
    end
    
    return convertLogic(logic, skip)
end

function nests_TDL_riverPassageNearSilo(skip)
    local logic = 99
    --[[        nest_river_passage
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.tall_jump(state) and self.grip_grab(state) and (self.flap_flip(state) or self.split_up(state))
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.tall_jump(state) and self.grip_grab(state) and (self.flap_flip(state) or self.split_up(state))\
                or self.leg_spring(state) and self.glide(state)\
                or self.pack_whack(state) and self.tall_jump(state)\
                or self.pack_whack(state) and self.grip_grab(state)\
                or self.sack_pack(state)\
             or self.split_up(state) and self.tall_jump(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.tall_jump(state) and self.grip_grab(state) and (self.flap_flip(state) or self.split_up(state))\
                or self.leg_spring(state) and self.glide(state)\
                or self.pack_whack(state) and self.tall_jump(state)\
                or self.pack_whack(state) and self.grip_grab(state)\
                or self.sack_pack(state)\
                or self.clockwork_shot(state)\
             or self.split_up(state) and self.tall_jump(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.tall_jump(state) and self.grip_grab(state) and (self.flap_flip(state) or self.split_up(state))\
                or self.leg_spring(state) and self.glide(state)\
                or self.pack_whack(state) and self.tall_jump(state)\
                or self.pack_whack(state) and self.grip_grab(state)\
                or self.sack_pack(state)\
                or self.clockwork_shot(state)\
             or self.split_up(state) and self.tall_jump(state)
    --]]
    
    if ( has("tjump") and has("ggrab") and (has("fflip") or has("splitup")) ) then
        logic = 0
    elseif ( has_legSpring() and has_glide() or has_packWhack() and (has("ggrab") or has("tjump")) or has_sackPack() or has("splitup") and has("tjump") ) then
        logic = 1
    elseif ( can_clockworkShot() ) then
        logic = 2
    elseif ( has("tjump") ) then
        logic = 7 -- FIXIT you can tall jump and then beak buster or even damage boost off the wall enemy to get up, did it myself
    end
    
    return convertLogic(logic, skip)
end

function nests_TDL_ungaBungasCaveTop(skip)
    local logic = 99
    --[[
    state.can_reach_region(regionName.MT, self.player) and self.jiggy_treasure_chamber(state) or self.small_elevation(state)
    --]]
    
    local mtAccessibility = Tracker:FindObjectForCode("@Region: Mayahem Temple - Main Area").AccessibilityLevel
    local jiggyTreasureChamber = jiggy_MT_treasureChamber(true)
    
    -- Normal Logic
    if ( can_reachSmallElevation() or (mtAccessibility == AccessibilityLevel.Normal or mtAccessibility == AccessibilityLevel.Cleared) and jiggyTreasureChamber <= logictype.CurrentStage ) then
        logic = 0
    
    -- Sequence Breaking
    elseif ( mtAccessibility == AccessibilityLevel.Normal or mtAccessibility == AccessibilityLevel.Cleared ) then
        logic = jiggyTreasureChamber
    elseif ( mtAccessibility > AccessibilityLevel.None ) then
        logic = math.max(jiggyTreasureChamber, logictype.CurrentStage + 1)
    end
    
    return convertLogic(logic, skip)
end

function nests_TDL_stompingPlainsFootprint(skip)
    local logic = 99
    --[[        nest_stomping_plains_footprint
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.tall_jump(state) and self.split_up(state)\
                or self.snooze_pack(state)\
                or self.talon_trot(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.tall_jump(state) and self.split_up(state)\
                or self.snooze_pack(state)\
                or self.talon_trot(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.tall_jump(state) and self.split_up(state)\
                or self.snooze_pack(state)\
                or self.talon_trot(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.tall_jump(state) and self.split_up(state)\
                or self.snooze_pack(state)\
                or self.talon_trot(state)
    --]]
    
    if ( has("tjump") and has("splitup") or has_snoozePack() or has("ttrot") ) then
        logic = 0
    elseif ( has("wwing") ) then
        logic = 7
    end
    
    return convertLogic(logic, skip)
end

----- Signs

function signpost_TDL_insideMountainWithTRex(skip)
    local logic = 99
    --[[        signpost_trex
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.humbaTDL(state) and self.roar(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.humbaTDL(state) and self.roar(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.humbaTDL(state) and self.roar(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.humbaTDL(state) and self.roar(state) or self.clockwork_warp(state)
    --]]
    
    local humba = access_TDL_humba(true)
    
    if ( humba <= logictype.CurrentStage and has("roar") ) then
        logic = 0 -- Normal Logic
    elseif ( humba < 3 and has("roar") ) then
        logic = humba -- Sequence Breaking
    elseif ( can_clockworkWarp() ) then
        logic = 3 -- Normal Logic
    
    -- Sequence Breaking
    elseif ( has("roar") ) then
        logic = humba
    end
    
    return convertLogic(logic, skip)
end

function signpost_TDL_insideTopOfMountain(skip)
    local logic = 99
    --[[        signpost_mountain_top
    if self.world.options.logic_type == LogicType.option_intended:
        logic = (self.tall_jump(state) or self.grip_grab(state)) and self.flight_pad(state)\
                or state.can_reach_region(regionName.TLTOP, self.player)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.flight_pad(state) and (
                    self.tall_jump(state)\
                    or self.grip_grab(state)\
                    or self.beak_buster(state)\
                    or self.leg_spring(state) and self.glide(state)\
                    or state.can_reach_region(regionName.TLTOP, self.player) and self.split_up(state)           -- redundant, if you can reach top you don't need the fpad
                )\
                or state.can_reach_region(regionName.TLTOP, self.player)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.flight_pad(state) and (
                    self.tall_jump(state)\
                    or self.grip_grab(state)\
                    or self.beak_buster(state)\
                    or self.leg_spring(state) and self.glide(state)\
                    or state.can_reach_region(regionName.TLTOP, self.player) and self.split_up(state)
                )\
                or state.can_reach_region(regionName.TLTOP, self.player)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.flight_pad(state) and (
                    self.tall_jump(state)\
                    or self.grip_grab(state)\
                    or self.beak_buster(state)\
                    or self.leg_spring(state) and self.glide(state)\
                    or state.can_reach_region(regionName.TLTOP, self.player) and self.split_up(state)
                )\
                or state.can_reach_region(regionName.TLTOP, self.player)
    --]]
    
    local tdlTAccessibility = Tracker:FindObjectForCode("@Region: Terrydactyland - Top").AccessibilityLevel
    
    -- Normal Logic
    if ( (has("tjump") or has("ggrab")) and has("fpad") or tdlTAccessibility == AccessibilityLevel.Normal or tdlTAccessibility == AccessibilityLevel.Cleared ) then
        logic = 0
    elseif ( has("fpad") and (has("bbust") or has_legSpring() and has_glide()) ) then
        logic = 1
    
    -- Sequence Breaking
    elseif ( tdlTAccessibility > AccessibilityLevel.None ) then
        logic = logictype.CurrentStage + 1
    end
    
    return convertLogic(logic, skip)
end

function signpost_TDL_riverPassage(skip)
    local logic = 99
    --[[        signpost_river_passage
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.tall_jump(state) and self.grip_grab(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.tall_jump(state) and self.grip_grab(state)\
                or self.leg_spring(state) and self.glide(state)\
                or self.pack_whack(state) and self.grip_grab(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.tall_jump(state) and self.grip_grab(state)\
                or self.leg_spring(state) and self.glide(state)\
                or self.pack_whack(state) and self.grip_grab(state)\
                or self.sack_pack(state) and self.tall_jump(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.tall_jump(state) and self.grip_grab(state)\
                or self.leg_spring(state) and self.glide(state)\
                or self.pack_whack(state) and self.grip_grab(state)\
                or self.sack_pack(state) and self.tall_jump(state)
    --]]
    
    if ( has("tjump") and has("ggrab") ) then
        logic = 0
    elseif ( has_legSpring() and has_glide() or has_packWhack() and has("ggrab") ) then
        logic = 1
    elseif ( has_sackPack() and has("tjump") ) then
        logic = 2
    end
    
    return convertLogic(logic, skip)
end

----- Other - Jinjos

function jinjo_TDL_entrance(skip)
    local logic = 99
    --[[        jinjo_tdl_entrance
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.TDL_flight_pad(state) and (self.beak_bomb(state) or self.grenade_eggs(state) and self.egg_aim(state))
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.TDL_flight_pad(state) and (self.beak_bomb(state) or self.grenade_eggs(state))
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = (self.TDL_flight_pad(state) and self.beak_bomb(state)) or (self.grenade_eggs(state)\
                and (self.egg_aim(state) or self.long_jump(state) or self.TDL_flight_pad(state) or self.turbo_trainers(state) or self.split_up(state)))
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = (self.TDL_flight_pad(state) and self.beak_bomb(state)) or (self.grenade_eggs(state)\
                and (self.egg_aim(state) or self.long_jump(state) or self.TDL_flight_pad(state) or self.turbo_trainers(state) or self.split_up(state)))
    --]]
    
    local flightPad = access_TDL_flightPad(true)
    
    -- Normal Logic
    if ( flightPad <= logictype.CurrentStage and (has("bbomb") or can_shootEggs("geggs") and has("eggaim")) ) then
        logic = 0
    elseif ( flightPad <= logictype.CurrentStage and can_shootEggs("geggs") ) then
        logic = 1
    elseif ( flightPad < 2 and (has("bbomb") or can_shootEggs("geggs")) ) then
        logic = 1 -- Sequence Breaking
    elseif ( can_shootEggs("geggs") and (has("eggaim") or can_longJump() or has("ttrain") or has("splitup")) ) then
        logic = 2
    
    -- Sequence Breaking
    elseif ( has("bbomb") or can_shootEggs("geggs") ) then
        logic = flightPad
    end
    
    return convertLogic(logic, skip)
end

function jinjo_TDL_underwaterCage(skip)
    local logic = 99
    --[[
    self.talon_torpedo(state) and self.dive(state)
    --]]
    
    if ( has("dive") and has("ttorp") ) then
        logic = 0
    end
    
    return convertLogic(logic, skip)
end

function jinjo_TDL_wallWithHoles(skip)
    local logic = 99
    --[[
    self.clockwork_eggs(state)
    --]]
    
    -- Normal Logic
    if ( can_shootEggs("ceggs") ) then
        logic = 0
    end
    
    return convertLogic(logic, skip)
end

function jinjo_TDL_bigTRexSwitch(skip)
    local logic = 99
    --[[        jinjo_big_t_rex
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.mumboTDL(state) and self.humbaTDL(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.mumboTDL(state) and self.humbaTDL(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.mumboTDL(state) and self.humbaTDL(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = (self.mumboTDL(state) and self.humbaTDL(state)) or \
                self.clockwork_eggs(state)
    --]]
    
    local mumbo = access_TDL_mumbo(true)
    local humba = access_TDL_humba(true)
    
    -- Normal Logic
    if ( mumbo <= logictype.CurrentStage and humba <= logictype.CurrentStage ) then
        logic = 0
    elseif ( mumbo < 3 and humba < 3 ) then
        logic = math.max(mumbo, humba) -- Sequence Breaking
    elseif ( can_shootEggs("ceggs") ) then
        logic = 3
    
    -- Sequence Breaking
    else
        logic = math.max(mumbo, humba)
    end
    
    return convertLogic(logic, skip)
end

function jinjo_TDL_stompingPlains(skip)
    local logic = 99
    --[[        jinjo_stomping_plains
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.split_up(state) and self.tall_jump(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.split_up(state) and self.tall_jump(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.split_up(state) and self.tall_jump(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = (self.split_up(state) and self.tall_jump(state)\
                or self.egg_barge(state) and (self.tall_jump(state) or self.talon_trot(state) or self.springy_step_shoes(state) or self.turbo_trainers(state)))
    --]]
    
    if ( has("splitup") and has("tjump") ) then
        logic = 0
    elseif ( can_eggBarge() and (has("tjump") or has("ttrot") or has("springb") or has("ttrain")) ) then
        logic = 3
    end
    
    return convertLogic(logic, skip)
end

----- Other - Glowbos

function glowbo_TDL_openLedge(skip)
    local logic = 99
    --[[        glowbo_tdl
    if self.world.options.logic_type == LogicType.option_intended:
        logic = (self.small_elevation(state) or self.TDL_flight_pad(state))
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.small_elevation(state)\
                or self.TDL_flight_pad(state)\
                or self.humbaTDL(state)\
                or self.springy_step_shoes(state)\
                or self.turbo_trainers(state)\
                or self.beak_buster(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.small_elevation(state)\
                or self.TDL_flight_pad(state)\
                or self.humbaTDL(state)\
                or self.springy_step_shoes(state)\
                or self.turbo_trainers(state)\
                or self.clockwork_shot(state)\
                or self.beak_buster(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.small_elevation(state)\
                or self.TDL_flight_pad(state)\
                or self.humbaTDL(state)\
                or self.springy_step_shoes(state)\
                or self.turbo_trainers(state)\
                or self.clockwork_shot(state)\
                or self.beak_buster(state)
    --]]
    
    local flightPad = access_TDL_flightPad(true)
    local humba = access_TDL_humba(true)
    
    -- Normal Logic
    if ( can_reachSmallElevation() or flightPad <= logictype.CurrentStage ) then
        logic = 0
    elseif ( humba <= logictype.CurrentStage or has("springb") or has("ttrain") or has("bbust") ) then
        logic = 1
    elseif ( flightPad < 2 ) then
        logic = 1 -- Sequence Breaking
    elseif ( can_clockworkShot() ) then
        logic = 2
    elseif ( has("wwing") ) then
        logic = 7
    
    -- Sequence Breaking
    else
        logic = math.max(1, math.min(flightPad, humba))
    end
    
    return convertLogic(logic, skip)
end

function glowbo_TDL_mumbo(skip)
    local logic = 99
    --[[        glowbo_tdl_mumbo
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.stilt_stride(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = True
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = True
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = True
    --]]
    
    if ( has("sstride") ) then
        logic = 0
    else
        logic = 1
    end
    
    return convertLogic(logic, skip)
end

----- Other - Honeycombs

function honeycomb_TDL_lakeside(skip)
    local logic = 99
    --[[        honeycomb_lakeside
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.turbo_trainers(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.turbo_trainers(state) or self.TDL_flight_pad(state)\
            or (self.tall_jump(state) and self.veryLongJump(state) and self.grip_grab(state))\
            or self.split_up(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.turbo_trainers(state) or self.TDL_flight_pad(state) or self.clockwork_shot(state)\
            or (self.tall_jump(state) and self.veryLongJump(state) and self.grip_grab(state))\
            or self.split_up(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.turbo_trainers(state) or self.TDL_flight_pad(state) or self.clockwork_shot(state)\
            or (self.tall_jump(state) and self.veryLongJump(state) and self.grip_grab(state))\
            or self.split_up(state)
    --]]
    
    local flightPad = access_TDL_flightPad(true)
    
    -- Normal Logic
    if ( has("ttrain") ) then
        logic = 0
    elseif ( flightPad <= logictype.CurrentStage or has("splitup") or has("tjump") and has("ggrab") and can_veryLongJump() ) then
        logic = 1
    elseif ( can_clockworkShot() ) then
        logic = 2
    
    -- Sequence Breaking
    else
        logic = math.max(1, flightPad)
    end
    
    return convertLogic(logic, skip)
end

function honeycomb_TDL_styracosaurusCaveAlcove(skip)
    local logic = 99
    --[[        honeycomb_styracosaurus
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.bill_drill(state) and self.split_up(state) and self.spring_pad(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.bill_drill(state) and self.split_up(state) and self.spring_pad(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = (self.bill_drill(state) and self.split_up(state) and self.spring_pad(state)) or \
                (self.leg_spring(state) and self.wing_whack(state) and self.glide(state))\
                or self.clockwork_shot(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = (self.bill_drill(state) and self.split_up(state) and self.spring_pad(state)) or \
                (self.leg_spring(state) and self.wing_whack(state) and self.glide(state))\
                or self.clockwork_shot(state)
    --]]
    
    if ( has_billDrill() and has("splitup") and has("tjump") ) then
        logic = 0
    elseif ( can_clockworkShot() or has_legSpring() and has_wingWhack() and has_glide() ) then
        logic = 2
    end
    
    return convertLogic(logic, skip)
end

function honeycomb_TDL_riverPassage(skip)
    local logic = 99
    --[[        honeycomb_river
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.talon_trot(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.talon_trot(state) or self.split_up(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.talon_trot(state) or self.clockwork_shot(state) or self.humbaTDL(state) or self.split_up(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.talon_trot(state) or self.clockwork_shot(state) or self.humbaTDL(state) or self.split_up(state)
    --]]
    
    local humba = access_TDL_humba(true)
    
    -- Normal Logic
    if ( has("ttrot") ) then
        logic = 0
    elseif ( has("splitup") ) then
        logic = 1
    elseif ( can_clockworkShot() or humba <= logictype.CurrentStage ) then
        logic = 2
    
    -- Sequence Breaking
    else
        logic = humba
    end
    
    return convertLogic(logic, skip)
end

----- Other - Cheato Pages

function cheato_TDL_dippyPool(skip)
    local logic = 99
    --[[
    if self.world.options.logic_type == LogicType.option_intended:
        logic = state.can_reach_region(regionName.CC, self.player) and self.jiggy_dippy(state) and self.dive(state)\
            and ((self.small_elevation(state) and self.springy_step_shoes(state)) or self.TDL_flight_pad(state))
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = state.can_reach_region(regionName.CC, self.player) and self.jiggy_dippy(state) and self.dive(state)\
            and ((self.small_elevation(state) and self.springy_step_shoes(state)) or self.TDL_flight_pad(state))
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = state.can_reach_region(regionName.CC, self.player) and self.jiggy_dippy(state) and self.dive(state)\
            and ((self.small_elevation(state) and self.springy_step_shoes(state)) or self.TDL_flight_pad(state))
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = state.can_reach_region(regionName.CC, self.player) and self.jiggy_dippy(state) and self.dive(state)\
            and ((self.small_elevation(state) and self.springy_step_shoes(state)) or self.TDL_flight_pad(state))
    --]]
    
    local ccAccessibility = Tracker:FindObjectForCode("@Region: Cloud Cuckooland").AccessibilityLevel
    local dippyJiggy = jiggy_TDL_dippy(true)
    local flightPad = access_TDL_flightPad(true)
    
    -- Normal Logic
    if ( (ccAccessibility == AccessibilityLevel.Normal or ccAccessibility == AccessibilityLevel.Cleared) and dippyJiggy <= logictype.CurrentStage and has("dive") and (can_reachSmallElevation() and has("springb") or flightPad <= logictype.CurrentStage) ) then
        logic = 0
    
    -- Sequence Breaking
    elseif ( has("dive") ) then
        local byJumping = 99
        if ( can_reachSmallElevation() and has("springb") ) then
            byJumping = 0
        end
        
        if ( ccAccessibility == AccessibilityLevel.Normal or ccAccessibility == AccessibilityLevel.Cleared ) then
            logic = math.max(dippyJiggy, math.min(byJumping, flightPad))
        elseif ( ccAccessibility > AccessibilityLevel.None ) then
            logic = math.max(logictype.CurrentStage + 1, dippyJiggy, math.min(byJumping, flightPad))
        end
    end
    
    return convertLogic(logic, skip)
end

function cheato_TDL_insideMountainWithTRex(skip)
    local logic = 99
    --[[        cheato_trex
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.humbaTDL(state) and self.roar(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.humbaTDL(state) and self.roar(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.humbaTDL(state) and self.roar(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.humbaTDL(state) and self.roar(state) or self.clockwork_eggs(state)
    --]]
    
    local humba = access_TDL_humba(true)
    
    if ( humba <= logictype.CurrentStage and has("roar") ) then
        logic = 0 -- Normal Logic
    elseif ( humba < 3 and has("roar") ) then
        logic = humba -- Sequence Breaking
    elseif ( logictype.CurrentStage > 2 and can_shootEggs("ceggs") ) then
        logic = 3 -- Normal Logic
    
    -- Sequence Breaking
    elseif ( has("roar") ) then
        logic = humba
    end
    
    return convertLogic(logic, skip)
end

function cheato_TDL_boulderByMumbo(skip)
    local logic = 99
    --[[
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.bill_drill(state) and self.flap_flip(state) and self.grip_grab(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.bill_drill(state)\
                    and (self.TDL_flight_pad(state)\
                         or self.grip_grab(state) and (self.flap_flip(state) or (self.talon_trot(state) and self.flutter(state))))
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.bill_drill(state)\
                    and (self.TDL_flight_pad(state)\
                         or self.grip_grab(state) and (self.flap_flip(state) or (self.talon_trot(state) and self.flutter(state)))\
                         or state.can_reach_region(regionName.TLTOP, self.player) and self.talon_trot(state) and (self.flutter(state) or self.air_rat_a_tat_rap(state))
                    )
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = (self.bill_drill(state) or self.egg_barge(state))\
                    and (self.TDL_flight_pad(state)\
                         or self.grip_grab(state) and (self.flap_flip(state) or (self.talon_trot(state) and self.flutter(state)))\
                         or state.can_reach_region(regionName.TLTOP, self.player) and self.talon_trot(state) and (self.flutter(state) or self.air_rat_a_tat_rap(state))
                    )
    --]]
    
    local flightPad = access_TDL_flightPad(true)
    local tdltAccessibility = Tracker:FindObjectForCode("@Region: Terrydactyland - Top").AccessibilityLevel
    
    -- Normal Logic
    if ( has_billDrill() and has("fflip") and has("ggrab") ) then
        logic = 0
    elseif ( has_billDrill() and (flightPad <= logictype.CurrentStage or has("ggrab") and has("ttrot") and has("flutter")) ) then
        logic = 1
    elseif ( has_billDrill() and (tdltAccessibility == AccessibilityLevel.Normal or tdltAccessibility == AccessibilityLevel.Cleared) and has("ttrot") and (has("flutter") or has("arat")) ) then
        logic = 2
    elseif ( has_billDrill() and flightPad < 3 ) then
        logic = 2 -- Sequence Breaking
    elseif ( can_eggBarge() and (flightPad <= logictype.CurrentStage or has("ggrab") and (has("fflip") or has("ttrot") and has("flutter")) or (tdltAccessibility == AccessibilityLevel.Normal or tdltAccessibility == AccessibilityLevel.Cleared) and has("ttrot") and (has("flutter") or has("arat"))) ) then
        logic = 3
    
    -- Sequence Breaking
    elseif ( has_billDrill() or can_eggBarge() ) then
        local fromTop = 99
        if ( (tdltAccessibility == AccessibilityLevel.Normal or tdltAccessibility == AccessibilityLevel.Cleared) and has("ttrot") and (has("flutter") or has("arat")) ) then
            fromTop = 2
        elseif ( tdltAccessibility > AccessibilityLevel.None and has("ttrot") and (has("flutter") or has("arat")) ) then
            fromTop = logictype.CurrentStage + 1
        end
        
        logic = math.max(3, math.min(fromTop, flightPad))
    end
    
    return convertLogic(logic, skip)
end

----- Other

function trainSwitch_TDL(skip)
    local logic = 99
    --[[        tswitch_tdl
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.flap_flip(state)\
                or self.veryLongJump(state)\
                or self.TDL_flight_pad(state)\
                or self.tall_jump(state) and self.grip_grab(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.flap_flip(state)\
                or self.veryLongJump(state)\
                or self.TDL_flight_pad(state)\
                or self.split_up(state)\
                or self.springy_step_shoes(state)\
                or self.tall_jump(state) and self.air_rat_a_tat_rap(state)\
                or self.tall_jump(state) and self.grip_grab(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.flap_flip(state)\
                or self.veryLongJump(state)\
                or self.TDL_flight_pad(state)\
                or self.split_up(state)\
                or self.springy_step_shoes(state)\
                or self.tall_jump(state) and self.air_rat_a_tat_rap(state)\
                or self.tall_jump(state) and self.grip_grab(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.flap_flip(state)\
                or self.veryLongJump(state)\
                or self.TDL_flight_pad(state)\
                or self.split_up(state)\
                or self.springy_step_shoes(state)\
                or self.tall_jump(state) and self.air_rat_a_tat_rap(state)\
                or self.tall_jump(state) and self.grip_grab(state)
    --]]
    
    local flightPad = access_TDL_flightPad(true)
    
    -- Normal Logic
    if ( has("fflip") or can_veryLongJump() or has("tjump") and has("ggrab") or flightPad <= logictype.CurrentStage ) then
        logic = 0
    elseif ( has("splitup") or has("springb") or has("tjump") and has("arat") ) then
        logic = 1
    
    -- Sequence Breaking
    else
        logic = flightPad
    end
    
    return convertLogic(logic, skip)
end



--------------- Grunty Industries

----- Basic & Access functions

function basic_GI_canUseBattery()
    --[[
    self.pack_whack(state) and self.taxi_pack(state)
    --]]
    
    return has_packWhack() and has_taxiPack()
end

function basic_GI_elevatorDoor()
    --[[
    return self.beak_barge(state)\
            or self.grenade_eggs(state)\
            or self.ground_rat_a_tat_rap(state)\
            or self.air_rat_a_tat_rap(state)
    --]]
    
    return ( has("bbarge") or can_shootEggs("geggs") or has("grat") or has("arat") )
end

function access_GI_flightPadSwitch(skip)
    local logic = 99
    --[[        gi_flight_pad_switch
    if self.world.options.logic_type == LogicType.option_intended:
        logic = state.can_reach_region(regionName.GI4, self.player)\
                or self.humbaGI(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = state.can_reach_region(regionName.GI4, self.player)\
                or self.humbaGI(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = state.can_reach_region(regionName.GI4, self.player)\
                or self.humbaGI(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = state.can_reach_region(regionName.GI4, self.player)\
                or self.humbaGI(state)
    --]]
    
    local gi4Accessibility = Tracker:FindObjectForCode("@Region: Grunty Industries 4th Floor").AccessibilityLevel
    local humba = access_GI_humba(true)
    
    -- Normal Logic
    if ( gi4Accessibility == AccessibilityLevel.Normal or gi4Accessibility == AccessibilityLevel.Cleared or humba <= logictype.CurrentStage ) then
        logic = 0
    
    -- Sequence Breaking
    else
        local floor4 = 99
        if ( gi4Accessibility > AccessibilityLevel.None ) then
            floor4 = logictype.CurrentStage + 1
        end
        
        logic = math.min(humba, floor4)
    end
    
    return convertLogic(logic, skip)
end

function access_GI_floor2SplitUp(skip)
    local logic = 99
    --[[        floor_2_split_up
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.split_up(state) and\
                (self.climb(state) or self.has_explosives(state))
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.split_up(state) and\
                (self.climb(state) or self.has_explosives(state))
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.split_up(state) and\
                (self.climb(state) or self.has_explosives(state) or self.claw_clamber_boots(state) and self.extremelyLongJump(state))
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.split_up(state) and\
                (self.climb(state) or self.has_explosives(state) or self.claw_clamber_boots(state) and self.extremelyLongJump(state))
    --]]
    
    local explosives = can_shootExplosiveEggs(true)
    local extremelyLongJump = can_extremelyLongJump(true)
    
    if ( has("splitup") and (has("climb") or explosives <= logictype.CurrentStage) ) then
        logic = 0 -- Normal Logic
    elseif ( has("splitup") and explosives < 2 ) then
        logic = 1 -- Sequence Breaking
    elseif ( has("clawbts") and extremelyLongJump <= logictype.CurrentStage ) then
        logic = 2 -- Normal Logic
    
    -- Sequence Breaking
    elseif ( has("splitup") or has("clawbts") ) then
        local splitup = 99
        if ( has("splitup") ) then
            splitup = explosives
        end
        
        local clawbts = 99
        if ( has("splitup") ) then
            clawbts = extremelyLongJump
        end
        
        logic = math.min(splitup, clawbts)
    end
    
    return convertLogic(logic, skip)
end

function access_GI_floor3SplitUp(skip)
    local logic = 99
    --[[        floor_3_split_up
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.split_up(state) and self.small_elevation(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.split_up(state) and self.small_elevation(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.split_up(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.split_up(state)
     --]]
    
    if ( has("splitup") and can_reachSmallElevation() ) then
        logic = 0
    elseif ( has("splitup") ) then
        logic = 2
    end
    
    return convertLogic(logic, skip)
end

function access_GI_enterFloor3FromFireExit(skip)
    local logic = 99
    --[[        enter_floor_3_from_fire_exit
    return state.can_reach_region(regionName.GIOB, self.player) and self.outside_gi_back_to_floor_3(state)\
            or state.can_reach_region(regionName.GI4, self.player) and self.floor_4_to_floor_3(state)\
            or state.can_reach_region(regionName.GIR, self.player) and self.roof_to_upper_floors(state)
    --]]
    
    local giobAccessibility = Tracker:FindObjectForCode("@Region: Outside Grunty Industries - Behind the building").AccessibilityLevel
    local gi4Accessibility = Tracker:FindObjectForCode("@Region: Grunty Industries 4th Floor").AccessibilityLevel
    local girAccessibility = Tracker:FindObjectForCode("@Region: Grunty Industries Roof").AccessibilityLevel
    local giob = connector_GIOBack_to_GIF3(true)
    local gif4 = connector_GIF4_to_GIF3(true)
    local roof = connector_GIRoof_to_GIF3_or_GIF4(true)
    
    -- Normal Logic
    if ( (giobAccessibility == AccessibilityLevel.Normal or giobAccessibility == AccessibilityLevel.Cleared) and giob <= logictype.CurrentStage or (gi4Accessibility == AccessibilityLevel.Normal or gi4Accessibility == AccessibilityLevel.Cleared) and gif4 <= logictype.CurrentStage or (girAccessibility == AccessibilityLevel.Normal or girAccessibility == AccessibilityLevel.Cleared) and roof <= logictype.CurrentStage ) then
        logic = 0
    
    -- Sequence Breaking
    else
        local fromOB = 99
        if ( giobAccessibility == AccessibilityLevel.Normal or giobAccessibility == AccessibilityLevel.Cleared ) then
            fromOB = giob
        elseif ( giobAccessibility > AccessibilityLevel.None ) then
            fromOB = math.max(giob, logictype.CurrentStage + 1)
        end
        
        local fromF4 = 99
        if ( gi4Accessibility == AccessibilityLevel.Normal or gi4Accessibility == AccessibilityLevel.Cleared ) then
            fromF4 = gif4
        elseif ( gi4Accessibility > AccessibilityLevel.None ) then
            fromF4 = math.max(gif4, logictype.CurrentStage + 1)
        end
        
        local fromRoof = 99
        if ( girAccessibility == AccessibilityLevel.Normal or girAccessibility == AccessibilityLevel.Cleared ) then
            fromRoof = roof
        elseif ( girAccessibility > AccessibilityLevel.None ) then
            fromRoof = math.max(roof, logictype.CurrentStage + 1)
        end
        
        logic = math.min(fromOB, fromF4, fromRoof)
    end
    
    return convertLogic(logic, skip)
end

function access_GI_dropDownFromHigherFloorsOutside(skip)
    local logic = 99
    --[[        drop_down_from_higher_floors_outside
    if self.world.options.logic_type == LogicType.option_intended:
        logic = False
    elif self.world.options.logic_type == LogicType.option_easy_tricks : # normal
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

function access_GI_escapeFloor4(skip)
    local logic = 99
    --[[        escape_floor_4_bk
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.springy_step_shoes(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks : # normal
        logic = self.springy_step_shoes(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.springy_step_shoes(state) or self.flap_flip(state) and self.grip_grab(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.springy_step_shoes(state) or self.flap_flip(state) and self.grip_grab(state)
    --]]
    
    if ( has("springb") ) then
        logic = 0
    elseif ( has("fflip") and has("ggrab") ) then
        logic = 2
    end
    
    return convertLogic(logic, skip)
end

function access_GI_soloBanjoWasteDisposal(skip)
    local logic = 99
    --[[        solo_banjo_waste_disposal
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.grip_grab(state) and self.can_use_battery(state) and self.climb(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.can_use_battery(state) and (self.grip_grab(state) and self.climb(state) or self.tall_jump(state))
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.can_use_battery(state) and (self.grip_grab(state) and self.climb(state) or self.tall_jump(state))
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.can_use_battery(state) and (self.grip_grab(state) and self.climb(state) or self.tall_jump(state))
    --]]
    
    if ( has("ggrab") and has("climb") and basic_GI_canUseBattery() ) then
        logic = 0
    elseif ( basic_GI_canUseBattery() and has("tjump") ) then
        logic = 1
    end
    
    return convertLogic(logic, skip)
end

function access_GI_mumbo(skip)
    local logic = 99
    --[[        mumboGI
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.small_elevation(state) and state.has(itemName.MUMBOGI, self.player) and state.can_reach_region(regionName.GI3, self.player)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.small_elevation(state) and state.has(itemName.MUMBOGI, self.player) and state.can_reach_region(regionName.GI3, self.player)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = state.has(itemName.MUMBOGI, self.player) and state.can_reach_region(regionName.GI3, self.player) and \
                self.small_elevation(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = state.has(itemName.MUMBOGI, self.player) and state.can_reach_region(regionName.GI3, self.player) and \
                self.small_elevation(state)
    --]]
    
    if ( has("mumbogi") and can_reachSmallElevation() ) then
        local gi3Accessibility = Tracker:FindObjectForCode("@Region: Grunty Industries 3rd Floor").AccessibilityLevel
        
        -- Normal Logic
        if ( gi3Accessibility == AccessibilityLevel.Normal or gi3Accessibility == AccessibilityLevel.Cleared ) then
            logic = 0
        
        -- Sequence Breaking
        elseif ( gi3Accessibility > AccessibilityLevel.None ) then
            logic = logictype.CurrentStage + 1 -- was already converted once by the json
        end
    end
    
    return convertLogic(logic, skip)
end

function access_GI_humba(skip)
    local logic = 99
    --[[        humbaGI
    state.has(itemName.HUMBAGI, self.player) and state.can_reach_region(regionName.GI2, self.player)
    --]]
    
    if ( has("humbagi") ) then
        local gi2Accessibility = Tracker:FindObjectForCode("@Region: Grunty Industries 2nd Floor").AccessibilityLevel
        
        -- Normal Logic
        if ( gi2Accessibility == AccessibilityLevel.Normal or gi2Accessibility == AccessibilityLevel.Cleared ) then
            logic = 0
        
        -- Sequence Breaking
        elseif ( gi2Accessibility > AccessibilityLevel.None ) then
            logic = logictype.CurrentStage + 1
        end
    end
    
    return convertLogic(logic, skip)
end

function access_GI_canBeatWeldar(skip)
    local logic = 99
    --[[
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.can_use_battery(state) and self.mumboGI(state) and \
           self.humbaGI(state) and self.grenade_eggs(state) and \
           self.bill_drill(state) and self.climb(state) and self.flap_flip(state)\
            and self.grip_grab(state)\
            and state.has(itemName.WARPGI2, self.player) and state.has(itemName.WARPGI3, self.player)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.can_use_battery(state) and self.mumboGI(state) and \
           self.humbaGI(state) and self.grenade_eggs(state) and \
           self.bill_drill(state) and self.climb(state) and self.flap_flip(state) and\
           state.has(itemName.WARPGI2, self.player) and state.has(itemName.WARPGI3, self.player) and\
           (self.grip_grab(state) or (self.tall_jump(state) and (self.flutter(state) or self.air_rat_a_tat_rap(state))))
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.can_use_battery(state) and self.mumboGI(state) and \
           self.humbaGI(state) and self.grenade_eggs(state) and \
           self.bill_drill(state) and self.climb(state) and self.flap_flip(state) and\
           state.has(itemName.WARPGI2, self.player) and state.has(itemName.WARPGI3, self.player) and\
           ((self.grip_grab(state) or (self.tall_jump(state) and (self.flutter(state) or self.air_rat_a_tat_rap(state))))\
                or self.extremelyLongJump(state))
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.can_use_battery(state) and self.mumboGI(state) and \
           self.humbaGI(state) and self.grenade_eggs(state) and \
           self.bill_drill(state) and self.climb(state) and self.flap_flip(state) and\
           state.has(itemName.WARPGI2, self.player) and state.has(itemName.WARPGI3, self.player) and\
           ((self.grip_grab(state) or (self.tall_jump(state) and (self.flutter(state) or self.air_rat_a_tat_rap(state))))\
                or self.extremelyLongJump(state))
    --]]
    
    local mumbo = access_GI_mumbo(true)
    local humba = access_GI_humba(true)
    local extremelyLongJump = can_extremelyLongJump(true)
    
    -- Normal Logic
    if ( basic_GI_canUseBattery() and mumbo <= logictype.CurrentStage and humba <= logictype.CurrentStage and can_shootEggs("geggs") and has_billDrill() and has("climb") and has("fflip") and has("ggrab") and (has("warpgi2") and has("warpgi3") or has("randomizewarppads_off")) ) then
        logic = 0
    elseif ( basic_GI_canUseBattery() and mumbo <= logictype.CurrentStage and humba <= logictype.CurrentStage and can_shootEggs("geggs") and has_billDrill() and has("climb") and has("fflip") and (has("warpgi2") and has("warpgi3") or has("randomizewarppads_off")) and has("tjump") and (has("flutter") or has("arat")) ) then
        logic = 1
    elseif ( basic_GI_canUseBattery() and mumbo < 2 and humba < 2 and can_shootEggs("geggs") and has_billDrill() and has("climb") and has("fflip") and has("ggrab") and (has("warpgi2") and has("warpgi3") or has("randomizewarppads_off")) ) then
        logic = 1 -- Sequence Breaking
    elseif ( basic_GI_canUseBattery() and mumbo <= logictype.CurrentStage and humba <= logictype.CurrentStage and can_shootEggs("geggs") and has_billDrill() and has("climb") and has("fflip") and (has("warpgi2") and has("warpgi3") or has("randomizewarppads_off")) and extremelyLongJump <= logictype.CurrentStage ) then
        logic = 2
    
    -- Sequence Breaking
    elseif ( basic_GI_canUseBattery() and can_shootEggs("geggs") and has_billDrill() and has("climb") and has("fflip") and (has("warpgi2") and has("warpgi3") or has("randomizewarppads_off")) ) then
        local nonLongJump = 99
        if ( has("ggrab") or has("tjump") and (has("flutter") or has("arat")) ) then
            nonLongJump = 1
        end
        
        logic = math.max(2, mumbo, humba, math.min(nonLongJump, extremelyLongJump))
    end
    
    return convertLogic(logic, skip)
end

function access_GI_floor2SkivvySwitch(skip)
    local logic = 99
    --[[        floor_2_skivvy_switch
    if self.world.options.logic_type == LogicType.option_intended:
        logic = state.can_reach_region(regionName.GI2, self.player) and self.claw_clamber_boots(state) and self.flap_flip(state) and self.grip_grab(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = state.can_reach_region(regionName.GI2, self.player) and self.claw_clamber_boots(state)\
                    and ((self.flap_flip(state) and self.grip_grab(state))\
                         or self.talon_trot(state) and (self.flutter(state) or self.air_rat_a_tat_rap(state)))\
                or state.can_reach_region(regionName.GI2, self.player) and self.floor_2_split_up(state)\
                    and (self.leg_spring(state) or self.claw_clamber_boots(state) and (self.can_shoot_any_egg(state) or self.wing_whack(state)))\
                or state.can_reach_region(regionName.GI3, self.player) and\
                    (self.climb(state) and (self.veryLongJump(state) or (self.flap_flip(state) or self.tall_jump(state)) and self.grip_grab(state))\
                        or self.small_elevation(state) and self.split_up(state) and self.leg_spring(state))                                         -- leg spring requires split up, so checking for split up is redundant
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = state.can_reach_region(regionName.GI2, self.player) and self.claw_clamber_boots(state)\
                    and ((self.flap_flip(state) and self.grip_grab(state))\
                         or self.talon_trot(state) and (self.flutter(state) or self.air_rat_a_tat_rap(state)))\
                or state.can_reach_region(regionName.GI2, self.player) and self.floor_2_split_up(state)\
                    and (self.leg_spring(state) or self.claw_clamber_boots(state) and (self.can_shoot_any_egg(state) or self.wing_whack(state)))\
                or state.can_reach_region(regionName.GI3, self.player) and\
                    (self.climb(state) and (self.veryLongJump(state) or (self.flap_flip(state) or self.tall_jump(state)) and self.grip_grab(state))\
                        or self.small_elevation(state) and self.split_up(state) and self.leg_spring(state))
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = state.can_reach_region(regionName.GI2, self.player) and self.claw_clamber_boots(state)\
                    and ((self.flap_flip(state) and self.grip_grab(state))\
                         or self.talon_trot(state) and (self.flutter(state) or self.air_rat_a_tat_rap(state)))\
                or state.can_reach_region(regionName.GI2, self.player) and self.floor_2_split_up(state)\
                    and (self.leg_spring(state) or self.claw_clamber_boots(state) and (self.can_shoot_any_egg(state) or self.wing_whack(state)))\
                or state.can_reach_region(regionName.GI3, self.player) and\
                    (self.climb(state) and (self.veryLongJump(state) or (self.flap_flip(state) or self.tall_jump(state)) and self.grip_grab(state))\
                        or self.small_elevation(state) and self.split_up(state) and self.leg_spring(state))
     --]]
   
    local gi2Accessibility = Tracker:FindObjectForCode("@Region: Grunty Industries 2nd Floor").AccessibilityLevel
    local gi3Accessibility = Tracker:FindObjectForCode("@Region: Grunty Industries 3rd Floor").AccessibilityLevel
    local gi2Accessible = (gi2Accessibility == AccessibilityLevel.Normal or gi2Accessibility == AccessibilityLevel.Cleared)
    local gi3Accessible = (gi3Accessibility == AccessibilityLevel.Normal or gi3Accessibility == AccessibilityLevel.Cleared)
    local floor2SplitUp = access_GI_floor2SplitUp(true)
    
    -- Normal Logic
    if ( gi2Accessible and has("clawbts") and has("fflip") and has("ggrab") ) then
        logic = 0
    elseif ( gi2Accessible and has("clawbts") and has("ttrot") and (has("flutter") or has("arat")) or gi2Accessible and floor2SplitUp <= logictype.CurrentStage and (has_legSpring() or has("clawbts") and (can_shootEggs() or has_wingWhack())) or gi3Accessible and (has("climb") and (can_veryLongJump() or has("ggrab") and (has("fflip") or has("tjump"))) or can_reachSmallElevation() and has_legSpring()) ) then
        logic = 1
    
    -- Sequence Breaking
    elseif ( gi2Accessible and (has_legSpring() or has("clawbts") and (can_shootEggs() or has_wingWhack())) ) then
        logic = math.max(1, floor2SplitUp)
    else
        local f2 = 99
        if ( gi2Accessibility > AccessibilityLevel.None and (has_legSpring() or has("clawbts") and (can_shootEggs() or has_wingWhack())) ) then
            f2 = math.max(floor2SplitUp, logictype.CurrentStage + 1)
        end
        
        local f3 = 99
        if ( gi3Accessibility > AccessibilityLevel.None and (has("climb") and (can_veryLongJump() or has("ggrab") and (has("fflip") or has("tjump"))) or can_reachSmallElevation() and has_legSpring()) ) then
            f3 = logictype.CurrentStage + 1
        end
        
        logic = math.min(f2, f3)
    end
    
    return convertLogic(logic, skip)
end

function access_GI_warpPadF4(skip)
    local logic = 99
    --[[        warp_pad_floor_4
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.small_elevation(state)\
                or state.can_reach_region(regionName.GIWARP, self.player) and state.has(itemName.WARPGI4, self.player)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.small_elevation(state)\
                or state.can_reach_region(regionName.GIWARP, self.player) and state.has(itemName.WARPGI4, self.player)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = True
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = True
    --]]
    
    local giWAccessibility = Tracker:FindObjectForCode("@Grunty Industries Warps").AccessibilityLevel
    
    
    if ( can_reachSmallElevation() or has("warpgi4") and (giWAccessibility == AccessibilityLevel.Normal or giWAccessibility == AccessibilityLevel.Cleared) ) then
        logic = 0 -- Normal Logic
    elseif ( logictype.CurrentStage < 1 and has("warpgi4") and giWAccessibility > AccessibilityLevel.None ) then
        logic = 1 -- Sequence Breaking
    else
        logic = 2
    end
    
    return convertLogic(logic, skip)
end

----- Silos

function silo_GI_snoozePack(skip)
    local logic = 99
    --[[        silo_snooze
    self.check_notes(state, locationName.SNPACK) and self.solo_banjo_waste_disposal(state)
    --]]
    
    local soloBanjoWasteDisposal = access_GI_soloBanjoWasteDisposal(true)
    
    -- Normal Logic
    if ( snpack_count() and soloBanjoWasteDisposal <= logictype.CurrentStage ) then
        logic = 0
    
    -- Sequence Breaking
    elseif ( snpack_count() ) then
        logic = soloBanjoWasteDisposal
    end
    
    return convertLogic(logic, skip)
end

function silo_GI_legSpring(skip)
    local logic = 99
    --[[
    self.check_notes(state, locationName.LSPRING) and self.split_up(state)
    --]]
    
    if ( lspring_count() and has("splitup") ) then
        logic = 0
    end
    
    return convertLogic(logic, skip)
end

function silo_GI_clawClamberBoots(skip)
    local logic = 99
    --[[
    self.check_notes(state, locationName.CLAWBTS)
    --]]
    
    if ( clawbts_count() ) then
        logic = 0
    end
    
    return convertLogic(logic, skip)
end

----- Warp Pads

function warp_GI_floor1(skip)
    local logic = 99
    --[[        warp_pad_floor_1
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.split_up(state)\
                or state.can_reach_region(regionName.GIWARP, self.player) and state.has(itemName.WARPGI1, self.player)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.split_up(state)\
                or state.can_reach_region(regionName.GIWARP, self.player) and state.has(itemName.WARPGI1, self.player)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.split_up(state)\
                or state.can_reach_region(regionName.GIWARP, self.player) and state.has(itemName.WARPGI1, self.player)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.split_up(state)\
                or state.can_reach_region(regionName.GIWARP, self.player) and state.has(itemName.WARPGI1, self.player)\
                or state.can_reach_region(regionName.GIO, self.player) and self.clockwork_shot(state)
    --]]
    
    local giwAccessibility = Tracker:FindObjectForCode("@Grunty Industries Warps").AccessibilityLevel
    local gioAccessibility = Tracker:FindObjectForCode("@Region: Outside Grunty Industries").AccessibilityLevel
    
    if ( has("splitup") or has("warpgi1") and (giwAccessibility == AccessibilityLevel.Normal or giwAccessibility == AccessibilityLevel.Cleared) ) then
        logic = 0 -- Normal Logic
    elseif ( logictype.CurrentStage < 2 and has("warpgi1") and giwAccessibility > AccessibilityLevel.None ) then
        logic = logictype.CurrentStage + 1 -- Sequence Breaking
    elseif ( can_clockworkShot() and (gioAccessibility == AccessibilityLevel.Normal or gioAccessibility == AccessibilityLevel.Cleared) ) then
        logic = 3 -- Normal Logic
    
    -- Sequence Breaking
    elseif ( has("warpgi1") and giwAccessibility > AccessibilityLevel.None or can_clockworkShot() and gioAccessibility > AccessibilityLevel.None ) then
        logic = logictype.CurrentStage + 1
    end
    
    return convertLogic(logic, skip)
end

function warp_GI_floor4(skip)
    local logic = 99
    --[[        warp_pad_floor_4
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.small_elevation(state)\
                or state.can_reach_region(regionName.GIWARP, self.player) and state.has(itemName.WARPGI4, self.player)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.small_elevation(state)\
                or state.can_reach_region(regionName.GIWARP, self.player) and state.has(itemName.WARPGI4, self.player)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = True
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = True
    --]]
    
    local giwAccessibility = Tracker:FindObjectForCode("@Grunty Industries Warps").AccessibilityLevel
    
    if ( can_reachSmallElevation() or has("warpgi4") and (giwAccessibility == AccessibilityLevel.Normal or giwAccessibility == AccessibilityLevel.Cleared) ) then
        logic = 0 -- Normal Logic
    elseif ( logictype.CurrentStage == 0 and has("warpgi4") and giwAccessibility > AccessibilityLevel.None ) then
        logic = 1 -- Sequence Breaking
    else
        logic = 2 -- Normal Logic
    end
    
    return convertLogic(logic, skip)
end

----- Jiggies

function jiggy_GI_underwaterWasteDisposal(skip)
    local logic = 99
    --[[        jiggy_underwater_waste_disposal
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.can_beat_weldar(state) and self.shack_pack(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.can_beat_weldar(state) and self.shack_pack(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.can_beat_weldar(state) and self.shack_pack(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        # Getting the jiggy from waste disposal through the wall.
        logic = (self.can_beat_weldar(state) and (self.shack_pack(state) or self.leg_spring(state)))\
                or self.can_use_battery(state) and (
                    (self.climb(state) and self.flap_flip(state) and self.talon_torpedo(state)\
                     and self.dive(state) and self.wonderwing(state))
                     or (self.shack_pack(state) and self.climb(state) and self.grip_grab(state)))
    --]]
    
    local canBeatWeldar = access_GI_canBeatWeldar(true)
    
    if ( canBeatWeldar <= logictype.CurrentStage and has_shackPack() ) then
        logic = 0 -- Normal Logic
    elseif ( canBeatWeldar < 3 and has_shackPack() ) then
        logic = canBeatWeldar -- Sequence Breaking
    elseif ( canBeatWeldar <= logictype.CurrentStage and has_legSpring() or basic_GI_canUseBattery() and (has("climb") and has("fflip") and has("ttorp") and has("dive") and has("wwing") or has_shackPack() and has("climb") and has("ggrab")) ) then
        logic = 3
    
    -- Sequence Breaking
    elseif ( has_shackPack() or has_legSpring() ) then
        logic = math.max(3, canBeatWeldar)
    end
    
    return convertLogic(logic, skip)
end

function jiggy_GI_clinkers(skip)
    local logic = 99
    --[[        jiggy_clinkers
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.claw_clamber_boots(state) and self.breegull_blaster(state) and self.climb(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.claw_clamber_boots(state) and self.breegull_blaster(state) and self.climb(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.claw_clamber_boots(state) and self.breegull_blaster(state) and self.climb(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.claw_clamber_boots(state) and self.breegull_blaster(state)\
                and (self.precise_clockwork_warp(state) and (self.spring_pad(state) or self.flap_flip(state))\
                    or state.can_reach_region(regionName.GIES, self.player) and self.elevator_shaft_to_floor_4(state)\
                    or self.climb(state))
    --]]
    
    local giesAccessibility = Tracker:FindObjectForCode("@Region: Grunty Industries Elevator Shaft").AccessibilityLevel
    local elevatorShaftToF4 = connector_GIElevatorShaft_to_GIF4Back(true)
    
    -- Normal Logic
    if ( has("clawbts") and has("bblaster") and has("climb") ) then
        logic = 0
    elseif ( has("clawbts") and has("bblaster") and (can_preciseClockworkWarp() and (has("tjump") or has("fflip")) or (giesAccessibility == AccessibilityLevel.Normal or giesAccessibility == AccessibilityLevel.Cleared) and elevatorShaftToF4 <= logictype.CurrentStage) ) then
        logic = 3
        
    -- Sequence Breaking
    elseif ( has("clawbts") and has("bblaster") and (giesAccessibility == AccessibilityLevel.Normal or giesAccessibility == AccessibilityLevel.Cleared) ) then
        logic = math.max(3, elevatorShaftToF4)
    elseif ( has("clawbts") and has("bblaster") and giesAccessibility > AccessibilityLevel.None ) then
        logic = math.max(3, elevatorShaftToF4, logictype.CurrentStage + 1)
    end
    
    return convertLogic(logic, skip)
end

function jiggy_GI_skivvy(skip)
    local logic = 99
    --[[        jiggy_skivvy
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.skivvy_worker_quarters(state) and self.skivvy_worker_quarters(state) \
                    and self.skivvy_floor_1(state) and self.skivvy_floor_2(state) \
                    and self.skivvy_floor_3(state) and self.skivvy_floor_5(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.skivvy_worker_quarters(state) and self.skivvy_worker_quarters(state) \
                    and self.skivvy_floor_1(state) and self.skivvy_floor_2(state) \
                    and self.skivvy_floor_3(state) and self.skivvy_floor_5(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.skivvy_worker_quarters(state) and self.skivvy_worker_quarters(state) \
                    and self.skivvy_floor_1(state) and self.skivvy_floor_2(state) \
                    and self.skivvy_floor_3(state) and self.skivvy_floor_5(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.skivvy_worker_quarters(state) and self.skivvy_worker_quarters(state) \
                    and self.skivvy_floor_1(state) and self.skivvy_floor_2(state) \
                    and self.skivvy_floor_3(state) and self.skivvy_floor_5(state)
    --]]
    
    local skivvyWQ = other_GI_skivvyWorkersQuarters(true)
    local skivvyF1 = other_GI_skivvyFloor1(true)
    local skivvyF2 = other_GI_skivvyFloor2(true)
    local skivvyF3 = other_GI_skivvyFloor3(true)
    local skivvyF5 = other_GI_skivvyFloor5(true)
    local skivvyOU = other_GI_skivvyOutsideBack(true)
    
    -- Normal Logic
    if ( skivvyWQ <= logictype.CurrentStage and skivvyF1 <= logictype.CurrentStage and skivvyF2 <= logictype.CurrentStage and skivvyF3 <= logictype.CurrentStage and skivvyF5 <= logictype.CurrentStage and skivvyOU <= logictype.CurrentStage ) then
        logic = 0
    
    -- Sequence Breaking
    else
        logic = math.max(skivvyWQ, skivvyF1, skivvyF2, skivvyF3, skivvyF5, skivvyOU)
    end
    
    return convertLogic(logic, skip)
end

function jiggy_GI_floor5(skip)
    local logic = 99
    --[[        jiggy_floor5
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.split_up(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.split_up(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.split_up(state) or self.clockwork_shot(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.split_up(state) or self.clockwork_shot(state)
    --]]
    
    if ( has("splitup") ) then
        logic = 0
    elseif ( can_clockworkShot() ) then
        logic = 2
    end
    
    return convertLogic(logic, skip)
end

function jiggy_GI_qualityControl(skip)
    local logic = 99
    --[[        jiggy_quality_control
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.grenade_eggs(state) and \
                self.egg_aim(state) and \
                self.can_use_battery(state) and self.humbaGI(state)\
                and self.climb(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.grenade_eggs(state) and \
                ((self.egg_aim(state) and self.humbaGI(state) or \
                self.leg_spring(state))) and self.can_use_battery(state) and self.climb(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.grenade_eggs(state) and self.can_use_battery(state) and self.climb(state) and\
                (self.tall_jump(state)\
                    or self.leg_spring(state)\
                    or self.humbaGI(state) and self.egg_aim(state)\
                    or self.clockwork_shot(state))
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.grenade_eggs(state) and self.can_use_battery(state) and self.climb(state) and\
                (self.tall_jump(state)\
                    or self.leg_spring(state)\
                    or self.humbaGI(state) and self.egg_aim(state)\
                    or self.clockwork_shot(state)\
                    )\
                or self.precise_clockwork_warp(state)
    --]]
    
    local humba = access_GI_humba(true)
    
    -- Normal Logic
    if ( can_shootEggs("geggs") and has("eggaim") and basic_GI_canUseBattery() and humba <= logictype.CurrentStage and has("climb") ) then
        logic = 0
    elseif ( can_shootEggs("geggs") and has_legSpring() and basic_GI_canUseBattery() and has("climb") ) then
        logic = 1
    elseif ( can_shootEggs("geggs") and has("eggaim") and basic_GI_canUseBattery() and humba < 2 and has("climb") ) then
        logic = 1 -- Sequence Breaking
    elseif ( can_shootEggs("geggs") and basic_GI_canUseBattery() and has("climb") and (has("tjump") or can_clockworkShot()) ) then
        logic = 2
    elseif ( can_shootEggs("geggs") and has("eggaim") and basic_GI_canUseBattery() and humba < 3 and has("climb") ) then
        logic = 2 -- Sequence Breaking
    elseif ( can_preciseClockworkWarp() ) then
        logic = 3
    
    -- Sequence Breaking
    elseif ( can_shootEggs("geggs") and has("eggaim") and basic_GI_canUseBattery() and has("climb") ) then
        logic = humba
    end
    
    return convertLogic(logic, skip)
end

function jiggy_GI_guarded(skip)
    local logic = 99
    --[[        jiggy_guarded
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.split_up(state) and self.claw_clamber_boots(state) and self.egg_aim(state) and\
                (self.blue_eggs(state) or self.fire_eggs(state) or self.grenade_eggs(state))\
                and (self.spring_pad(state) or self.wing_whack(state) or self.glide(state))
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.split_up(state) and\
                ((self.claw_clamber_boots(state) or state.can_reach_region(regionName.GI2, self.player)) and self.spring_pad(state)\
                    or self.claw_clamber_boots(state) and (self.wing_whack(state) or self.glide(state)) and (self.egg_aim(state) or self.wing_whack(state))\
                    or self.leg_spring(state) and self.glide(state) and (self.egg_aim(state) or self.wing_whack(state)))\
                and (self.blue_eggs(state) or self.fire_eggs(state) or self.grenade_eggs(state))
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.split_up(state) and\
                ((self.claw_clamber_boots(state) or state.can_reach_region(regionName.GI2, self.player)) and self.spring_pad(state)\
                    or self.claw_clamber_boots(state) and (self.wing_whack(state) or self.glide(state)) and (self.egg_aim(state) or self.wing_whack(state))\
                    or self.leg_spring(state) and self.glide(state) and (self.egg_aim(state) or self.wing_whack(state)))\
                and (self.blue_eggs(state) or self.fire_eggs(state) or self.grenade_eggs(state))\
                or (self.claw_clamber_boots(state) or state.can_reach_region(regionName.GI2, self.player)) and (self.spring_pad(state) or self.leg_spring(state)) and self.clockwork_shot(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.split_up(state) and\
                ((self.claw_clamber_boots(state) or state.can_reach_region(regionName.GI2, self.player)) and self.spring_pad(state)\
                    or self.claw_clamber_boots(state) and (self.wing_whack(state) or self.glide(state)) and (self.egg_aim(state) or self.wing_whack(state))\
                    or self.leg_spring(state) and self.glide(state) and (self.egg_aim(state) or self.wing_whack(state)))\
                and (self.blue_eggs(state) or self.fire_eggs(state) or self.grenade_eggs(state))\
                or (self.claw_clamber_boots(state) or state.can_reach_region(regionName.GI2, self.player)) and (self.spring_pad(state) or self.leg_spring(state)) and self.clockwork_shot(state)
    --]]
    
    local gi2Accessibility = Tracker:FindObjectForCode("@Region: Grunty Industries 2nd Floor").AccessibilityLevel
    
    -- Normal Logic
    if ( has("splitup") and has("clawbts") and has("eggaim") and (can_shootEggs("begg") or can_shootEggs("feggs") or can_shootEggs("geggs")) and (has("tjump") or has_wingWhack() or has_glide()) ) then
        logic = 0
    elseif ( has("splitup") and (has("tjump") and (has("clawbts") or (gi2Accessibility == AccessibilityLevel.Normal or gi2Accessibility == AccessibilityLevel.Cleared)) or has("clawbts") and (has_wingWhack() or has_glide()) and (has("eggaim") or has_wingWhack())) and (can_shootEggs("begg") or can_shootEggs("feggs") or can_shootEggs("geggs")) ) then
        logic = 1
    elseif ( (has("clawbts") or (gi2Accessibility == AccessibilityLevel.Normal or gi2Accessibility == AccessibilityLevel.Cleared)) and (has("tjump") or has_legSpring()) and can_clockworkShot() ) then
        logic = 2
    
    -- Sequence Breaking
    elseif ( gi2Accessibility > AccessibilityLevel.None and (has("splitup") and (can_shootEggs("begg") or can_shootEggs("feggs") or can_shootEggs("geggs")) and has("tjump") or (has("tjump") or has_legSpring()) and can_clockworkShot()) ) then
        logic = math.max(2, logictype.CurrentStage + 1)
    end
    
    return convertLogic(logic, skip)
end

function jiggy_GI_trashCompactor(skip)
    local logic = 99
    --[[        jiggy_trash_compactor
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.snooze_pack(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.snooze_pack(state) or self.pack_whack(state) and self.tall_jump(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.snooze_pack(state) or self.pack_whack(state) and self.tall_jump(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.snooze_pack(state)\
                or self.pack_whack(state) and self.tall_jump(state)\
                or (self.egg_aim(state) and self.clockwork_eggs(state) and self.breegull_bash(state) and self.talon_trot(state))
    --]]
    
    if ( has_snoozePack() ) then
        logic = 0
    elseif ( has_packWhack() and has("tjump") ) then
        logic = 1
    elseif ( can_clockworkShot() and has_breegullBash() and has("ttrot") ) then
        logic = 3
    end
    
    return convertLogic(logic, skip)
end

function jiggy_GI_twinkly(skip)
    local logic = 99
    --[[        jiggy_twinkly
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.can_use_battery(state) and self.grip_grab(state) and self.turbo_trainers(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        #Banjo to Boiler Plant
        #Solo Kazooie to boiler plant, otherwise turbo trainers to do the minigame as BK
        logic = self.can_use_battery(state) and (self.tall_jump(state) or self.grip_grab(state))\
                and (self.leg_spring(state)\
                    or (self.glide(state) or self.wing_whack(state)) and self.tall_jump(state)
                    or state.can_reach_region(regionName.GIF, self.player) and self.flight_to_boiler_plant(state)
                    or self.turbo_trainers(state))
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = logic = self.can_use_battery(state) and (self.tall_jump(state) or self.grip_grab(state))\
                and (self.leg_spring(state)\
                    or (self.glide(state) or self.wing_whack(state)) and self.tall_jump(state)
                    or state.can_reach_region(regionName.GIF, self.player) and self.flight_to_boiler_plant(state)
                    or self.turbo_trainers(state))
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = logic = self.can_use_battery(state) and (self.tall_jump(state) or self.grip_grab(state))\
                and (self.leg_spring(state)\
                    or (self.glide(state) or self.wing_whack(state)) and self.tall_jump(state)
                    or state.can_reach_region(regionName.GIF, self.player) and self.flight_to_boiler_plant(state)
                    or self.turbo_trainers(state))
    --]]
    
    local gifAccessibility = Tracker:FindObjectForCode("@Region: Grunty Industries Flight").AccessibilityLevel
    local flightToBoilerPlant = connector_GIFlight_to_GIF3BoilerPlant(true)
    
    -- Normal Logic
    if ( basic_GI_canUseBattery() and has("ggrab") and has("ttrain") ) then
        logic = 0
    elseif ( basic_GI_canUseBattery() and (has("tjump") or has("ggrab")) and (has_legSpring() or has("tjump") and (has_glide() or has_wingWhack()) or has("ttrain") or (gi5Accessibility == AccessibilityLevel.Normal or gi5Accessibility == AccessibilityLevel.Cleared) and flightToBoilerPlant <= logictype.CurrentStage) ) then
        logic = 1
    
    -- Sequence Breaking
    elseif ( basic_GI_canUseBattery() and (has("tjump") or has("ggrab")) and (gi5Accessibility == AccessibilityLevel.Normal or gi5Accessibility == AccessibilityLevel.Cleared) ) then
        logic = math.max(1, flightToBoilerPlant)
    elseif ( basic_GI_canUseBattery() and (has("tjump") or has("ggrab")) and gi5Accessibility > AccessibilityLevel.None ) then
        logic = math.max(logictype.CurrentStage + 1, flightToBoilerPlant)
    end
    
    return convertLogic(logic, skip)
end

function jiggy_GI_wasteDisposalBox(skip)
    local logic = 99
    --[[        jiggy_waste_disposal_box
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.sack_pack(state) and self.solo_banjo_waste_disposal(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.solo_banjo_waste_disposal(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.solo_banjo_waste_disposal(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.solo_banjo_waste_disposal(state)
    --]]
    
    local soloBanjoWasteDisposal = access_GI_soloBanjoWasteDisposal(true)
    
    -- Normal Logic
    if ( has_sackPack() and soloBanjoWasteDisposal <= logictype.CurrentStage ) then
        logic = 0
    elseif ( soloBanjoWasteDisposal <= logictype.CurrentStage ) then
        logic = 1
    
    -- Sequence Breaking
    else
        logic = math.max(1, soloBanjoWasteDisposal)
    end
    
    return convertLogic(logic, skip)
end

----- Notes

function treble_GI(skip)
    local logic = 99
    --[[        treble_gi
    if self.world.options.logic_type == LogicType.option_intended:
        logic = state.can_reach_region(regionName.GI1, self.player) and self.split_up(state) and self.claw_clamber_boots(state)\
                or state.can_reach_region(regionName.GIF, self.player)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = state.can_reach_region(regionName.GI1, self.player) and (self.split_up(state) and self.claw_clamber_boots(state)\
                or self.leg_spring(state) and self.glide(state) and\
                    (self.wing_whack(state) or self.egg_aim(state)))\
                or state.can_reach_region(regionName.GIF, self.player)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = state.can_reach_region(regionName.GI1, self.player) and (self.split_up(state) and self.claw_clamber_boots(state)\
                    or self.leg_spring(state) and self.glide(state) and (self.wing_whack(state) or self.egg_aim(state)))\
                or state.can_reach_region(regionName.GIF, self.player)\
                or self.clockwork_shot(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = state.can_reach_region(regionName.GI1, self.player) and (self.split_up(state) and self.claw_clamber_boots(state)\
                    or self.leg_spring(state) and self.glide(state) and (self.wing_whack(state) or self.egg_aim(state)))\
                or state.can_reach_region(regionName.GIF, self.player)\
                or self.clockwork_shot(state)
    --]]
    
    local gi1Accessibility = Tracker:FindObjectForCode("@Region: Grunty Industries 1st Floor").AccessibilityLevel
    local gifAccessibility = Tracker:FindObjectForCode("@Region: Grunty Industries Flight").AccessibilityLevel
    
    -- Normal Logic
    if ( (gi1Accessibility == AccessibilityLevel.Normal or gi1Accessibility == AccessibilityLevel.Cleared) and has("splitup") and has("clawbts") or (gifAccessibility == AccessibilityLevel.Normal or gifAccessibility == AccessibilityLevel.Cleared) ) then
        logic = 0
    elseif ( (gi1Accessibility == AccessibilityLevel.Normal or gi1Accessibility == AccessibilityLevel.Cleared) and has_legSpring() and has_glide() and (has_wingWhack() or has("eggaim")) ) then
        logic = 1
    elseif ( logictype.CurrentStage == 0 and (gi1Accessibility > AccessibilityLevel.None and has("splitup") and has("clawbts") or gifAccessibility > AccessibilityLevel.None) ) then
        logic = 1 -- Sequence Breaking
    elseif ( can_clockworkShot() ) then
        logic = 2
    
    -- Sequence Breaking
    elseif ( gi1Accessibility > AccessibilityLevel.None and has("splitup") and has("clawbts") or gifAccessibility > AccessibilityLevel.None ) then
        logic = logictype.CurrentStage + 1
    end
    
    return convertLogic(logic, skip)
end

function notes_GI_trainStationHard(skip)
    local logic = 99
    --[[        notes_gi_train_station_hard
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.small_elevation(state) or self.leg_spring(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.small_elevation(state) or self.leg_spring(state) or self.beak_buster(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = True
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = True
    --]]
    
    if ( can_reachSmallElevation() or has_legSpring() ) then
        logic = 0
    elseif ( has("bbust") ) then
        logic = 1
    else
        logic = 2
    end
    
    return convertLogic(logic, skip)
end

function notes_GI_trainStationEasy(skip)
    local logic = 99
    --[[        notes_gi_train_station_easy
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.small_elevation(state) or self.leg_spring(state) or self.grip_grab(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.small_elevation(state) or self.leg_spring(state) or self.beak_buster(state) or self.grip_grab(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = True
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = True
    --]]
    
    if ( can_reachSmallElevation() or has_legSpring() or has("ggrab") ) then
        logic = 0
    elseif ( has("bbust") ) then
        logic = 1
    else
        logic = 2
    end
    
    return convertLogic(logic, skip)
end

function notes_GI_F1(skip)
    local logic = 99
    --[[        notes_gi_floor1
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.grip_grab(state) and self.climb(state) and self.flap_flip(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.F1_to_F2(state)\
            or (self.grip_grab(state) and self.climb(state) and self.flap_flip(state))
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.claw_clamber_boots(state)\
                or (self.grip_grab(state) and self.climb(state) and self.flap_flip(state))\
                or self.pack_whack(state) and self.tall_jump(state) and self.climb(state)\
                or self.leg_spring(state)\
                or self.clockwork_shot(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.claw_clamber_boots(state)\
                or (self.grip_grab(state) and self.climb(state) and self.flap_flip(state))\
                or self.pack_whack(state) and self.tall_jump(state) and self.climb(state)\
                or self.leg_spring(state)\
                or self.clockwork_shot(state)
    --]]
    
    local f1ToF2 = connector_GIF1_to_GIF2(true)
    
    -- Normal Logic
    if ( has("ggrab") and has("climb") and has("fflip") ) then
        logic = 0
    elseif ( f1ToF2 <= logictype.CurrentStage ) then
        logic = 1
    elseif ( has("clawbts") or has_packWhack() and has("tjump") and has("climb") or has_legSpring() or can_clockworkShot() ) then
        logic = 0
    
    -- Sequence Breaking
    else
        logic = math.max(1, f1ToF2)
    end
    
    return convertLogic(logic, skip)
end

function notes_GI_legSpringRoom(skip)
    local logic = 99
    --[[
    if self.world.options.logic_type == LogicType.option_intended:
        logic = (self.climb(state) or (self.has_explosives(state) and self.small_elevation(state)))
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = (self.climb(state) or (self.has_explosives(state) and self.small_elevation(state)))
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = (self.climb(state) or (self.has_explosives(state) and self.small_elevation(state)))\
                or self.clockwork_shot(state)\
                or self.claw_clamber_boots(state) and self.extremelyLongJump(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = (self.climb(state) or (self.has_explosives(state) and self.small_elevation(state)))\
                or self.clockwork_shot(state)\
                or self.claw_clamber_boots(state) and self.extremelyLongJump(state)
    --]]
    
    local explosives = can_shootExplosiveEggs(true)
    local extremelyLongJump = can_extremelyLongJump(true)
    
    if ( has("climb") or can_reachSmallElevation() and explosives <= logictype.CurrentStage ) then
        logic = 0 -- Normal Logic
    elseif ( can_reachSmallElevation() and explosives < 2 ) then
        logic = 1 -- Sequence Breaking
    elseif ( can_clockworkShot() or has("clawbts") and extremelyLongJump <= logictype.CurrentStage ) then
        logic = 2
    
    -- Sequence Breaking
    else
        local withExplosives = 99
        if ( can_reachSmallElevation() ) then
            withExplosives = math.max(1, explosives)
        end
        
        local withLongJump = 99
        if ( has("clawbts") ) then
            withLongJump = math.max(2, extremelyLongJump)
        end
        
        logic = math.min(withExplosives, withLongJump)
    end
    
    return convertLogic(logic, skip)
end

function notes_GI_boxRoomTallerStack(skip)
    local logic = 99
    --[[        notes_short_stack
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.small_elevation(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.small_elevation(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = True
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = True
    --]]
    
    if ( can_reachSmallElevation() ) then
        logic = 0
    else
        logic = 2
    end
    
    return convertLogic(logic, skip)
end

function notes_GI_wasteDisposal(skip)
    local logic = 99
    --[[        notes_waste_disposal
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.can_use_battery(state) and (self.grip_grab(state) and self.climb(state))
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.can_use_battery(state) and (self.grip_grab(state) and self.climb(state) or self.tall_jump(state))
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.can_use_battery(state) and (self.grip_grab(state) and self.climb(state) or self.tall_jump(state))
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = (self.can_use_battery(state) and (self.grip_grab(state) and self.climb(state) or self.tall_jump(state)))\
                or self.clockwork_shot(state) and self.flap_flip(state)
    --]]
    
    if ( basic_GI_canUseBattery() and has("ggrab") and has("climb") ) then
        logic = 0
    elseif ( basic_GI_canUseBattery() and has("tjump") ) then
        logic = 1
    elseif ( can_clockworkShot() and has("fflip") ) then
        logic = 3
    end
    
    return convertLogic(logic, skip)
end

function notes_GI_airConditioningPlantHard(skip)
    local logic = 99
    --[[        notes_aircon_hard
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.tall_jump(state) or self.split_up(state) or self.talon_trot(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = True
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = True
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = True
    --]]
    
    if ( has("tjump") or has("splitup") or has("ttrot") ) then
        logic = 0
    else
        logic = 1
    end
    
    return convertLogic(logic, skip)
end

function notes_GI_F3(skip)
    local logic = 99
    --[[        notes_floor_3
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.climb(state) and self.talon_trot(state) and self.flutter(state) and self.grip_grab(state)\
                or self.floor_3_split_up(state) and self.leg_spring(state)\
                or (self.grip_grab(state) and self.flap_flip(state) or self.split_up(state)) and self.spring_pad(state) and self.climb(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = ((self.grip_grab(state) and self.flap_flip(state) or self.split_up(state)) and self.spring_pad(state) and self.climb(state))\
                or (self.climb(state) or self.enter_floor_3_from_fire_exit(state)) and self.talon_trot(state) and self.flutter(state) and self.grip_grab(state)\
                or self.floor_3_split_up(state) and self.leg_spring(state)\

    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = ((self.grip_grab(state) and self.flap_flip(state) or self.split_up(state)) and self.spring_pad(state) and self.climb(state))\
                or (self.climb(state) or self.enter_floor_3_from_fire_exit(state))\
                    and self.talon_trot(state) and (
                        self.flutter(state) and self.grip_grab(state)\
                        or self.flutter(state) and self.beak_buster(state)\
                        or self.air_rat_a_tat_rap(state)
                    )\
                or self.clockwork_shot(state)\
                or self.small_elevation(state) and self.leg_spring(state)\                              -- small elevation is added here because floor 3 split up stops requireing it on hard tricks. this messes up the way I write the logic so I have to adjust for it
                or self.floor_3_split_up(state) and self.tall_jump(state) and (self.wing_whack(state) or self.glide(state))\
                or self.sack_pack(state) and self.floor_3_split_up(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = ((self.grip_grab(state) and self.flap_flip(state) or self.split_up(state)) and self.spring_pad(state) and self.climb(state))\
                or (self.climb(state) or self.enter_floor_3_from_fire_exit(state))\
                    and self.talon_trot(state) and (
                        self.flutter(state) and self.grip_grab(state)\
                        or self.flutter(state) and self.beak_buster(state)\
                        or self.air_rat_a_tat_rap(state)
                    )\
                or self.clockwork_shot(state)\
                or self.small_elevation(state) and self.leg_spring(state)\
                or self.floor_3_split_up(state) and self.tall_jump(state) and (self.wing_whack(state) or self.glide(state))\
                or self.sack_pack(state) and self.floor_3_split_up(state)
     --]]
     
    local floor3SplitUp = access_GI_floor3SplitUp(true)
    local f3FromFireExit = access_GI_enterFloor3FromFireExit(true)
    
    -- Normal Logic
    if ( has("climb") and has("ttrot") and has("flutter") and has("ggrab") or floor3SplitUp <= logictype.CurrentStage and can_reachSmallElevation() and has_legSpring() or has("climb") and has("tjump") and (has("ggrab") and has("fflip") or has("splitup")) ) then
        logic = 0
    elseif ( f3FromFireExit <= logictype.CurrentStage and has("ttrot") and has("flutter") and has("ggrab") ) then
        logic = 1
    elseif ( f3FromFireExit < 2 and has("ttrot") and has("flutter") and has("ggrab") or floor3SplitUp < 2 and can_reachSmallElevation() and has_legSpring() ) then
        logic = 1 -- Sequence Breaking
    elseif ( can_clockworkShot() or (has("climb") or f3FromFireExit <= logictype.CurrentStage) and has("ttrot") and (has("arat") or has("flutter") and has("bbust")) or can_reachSmallElevation() and has_legSpring() or floor3SplitUp <= logictype.CurrentStage and (has("tjump") and (has_wingWhack() or has_glide()) or has_sackPack()) ) then
        logic = 2
        
    -- Sequence Breaking
    else
        local fireExit = 99
        if ( has("ttrot") and (has("arat") or has("flutter") and (has("ggrab") or has("bbust"))) ) then
            fireExit = math.max(2, f3FromFireExit)
        end
        
        local f3SU = 99
        if ( has("tjump") and (has_wingWhack() or has_glide()) or has_sackPack() ) then
            f3SU = math.max(2, floor3SplitUp)
        end
        
        logic = math.min(fireExit, f3SU)
    end
    
    return convertLogic(logic, skip)
end

----- Nests

function nests_GI_outsideRight(skip)
    local logic = 99
    --[[        nest_gi_outside_right
    if self.world.options.logic_type == LogicType.option_intended:
        logic = state.can_reach_region(regionName.GIO, self.player) and self.outside_gi_to_outside_back(state)\
                or state.can_reach_region(regionName.GIOB, self.player) and self.climb(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = state.can_reach_region(regionName.GIO, self.player) and self.outside_gi_to_outside_back(state)\
                or state.can_reach_region(regionName.GIOB, self.player) and self.climb(state)\
                or state.can_reach_region(regionName.GI1, self.player) and (self.split_up(state) and self.tall_jump(state) or self.leg_spring(state))\
                or state.can_reach_region(regionName.GI2, self.player) and (self.floor_2_split_up(state) and (self.tall_jump(state) or self.leg_spring(state)))\
                or state.can_reach_region(regionName.GIF, self.player)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = state.can_reach_region(regionName.GIO, self.player) and self.outside_gi_to_outside_back(state)\
                or state.can_reach_region(regionName.GIOB, self.player) and self.climb(state)\
                or state.can_reach_region(regionName.GI1, self.player) and (self.split_up(state) and self.tall_jump(state) or self.leg_spring(state))\
                or state.can_reach_region(regionName.GI2, self.player) and (self.floor_2_split_up(state) and (self.tall_jump(state) or self.leg_spring(state)))\
                or state.can_reach_region(regionName.GIF, self.player)\
                or self.clockwork_shot(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = state.can_reach_region(regionName.GIO, self.player) and self.outside_gi_to_outside_back(state)\
                or state.can_reach_region(regionName.GIOB, self.player) and self.climb(state)\
                or state.can_reach_region(regionName.GI1, self.player) and (self.split_up(state) and self.tall_jump(state) or self.leg_spring(state))\
                or state.can_reach_region(regionName.GI2, self.player) and (self.floor_2_split_up(state) and (self.tall_jump(state) or self.leg_spring(state)))\
                or state.can_reach_region(regionName.GIF, self.player)\
                or self.clockwork_shot(state)
    --]]
    
    local gioAccessibility = Tracker:FindObjectForCode("@Region: Outside Grunty Industries").AccessibilityLevel
    local giobAccessibility = Tracker:FindObjectForCode("@Region: Outside Grunty Industries - Behind the building").AccessibilityLevel
    local gi1Accessibility = Tracker:FindObjectForCode("@Region: Grunty Industries 1st Floor").AccessibilityLevel
    local gi2Accessibility = Tracker:FindObjectForCode("@Region: Grunty Industries 2nd Floor").AccessibilityLevel
    local gifAccessibility = Tracker:FindObjectForCode("@Region: Grunty Industries Flight").AccessibilityLevel
    local outsideToBack = connector_GIO_to_GIOBack(true)
    local floor2SplitUp = access_GI_floor2SplitUp(true)
    
    -- Normal Logic
    if ( (gioAccessibility == AccessibilityLevel.Normal or gioAccessibility == AccessibilityLevel.Cleared) and outsideToBack <= logictype.CurrentStage or (giobAccessibility == AccessibilityLevel.Normal or giobAccessibility == AccessibilityLevel.Cleared) and has("climb") ) then
        logic = 0
    elseif ( (gi1Accessibility == AccessibilityLevel.Normal or gi1Accessibility == AccessibilityLevel.Cleared) and (has("splitup") and has("tjump") or has_legSpring()) or (gi2Accessibility == AccessibilityLevel.Normal or gi2Accessibility == AccessibilityLevel.Cleared) and floor2SplitUp <= logictype.CurrentStage and (has("tjump") or has_legSpring()) or (gifAccessibility == AccessibilityLevel.Normal or gifAccessibility == AccessibilityLevel.Cleared) ) then
        logic = 1
    elseif ( (gioAccessibility == AccessibilityLevel.Normal or gioAccessibility == AccessibilityLevel.Cleared) and outsideToBack < 2 or logictype.CurrentStage == 0 and gioAccessibility > AccessibilityLevel.None and outsideToBack <= logictype.CurrentStage or logictype.CurrentStage == 0 and giobAccessibility > AccessibilityLevel.None and has("climb") ) then
        logic = 1 -- Sequence Breaking
    elseif ( can_clockworkShot() ) then
        logic = 2
    
    -- Sequence Breaking
    else
        local outside = 99
        if ( gioAccessibility == AccessibilityLevel.Normal or gioAccessibility == AccessibilityLevel.Cleared ) then
            outside = outsideToBack
        elseif ( gioAccessibility > AccessibilityLevel.None ) then
            outside = math.max(outsideToBack, logictype.CurrentStage + 1)
        end
        
        local outsideBack = 99
        if ( giobAccessibility > AccessibilityLevel.None and has("climb") ) then
            outsideBack = logictype.CurrentStage + 1
        end
        
        local f1 = 99
        if ( gi1Accessibility > AccessibilityLevel.None and (has("splitup") and has("tjump") or has_legSpring()) ) then
            f1 = logictype.CurrentStage + 1
        end
        
        local f2 = 99
        if ( (gi2Accessibility == AccessibilityLevel.Normal or gi2Accessibility == AccessibilityLevel.Cleared) and (has("tjump") or has_legSpring()) ) then
            f2 = floor2SplitUp
        elseif ( gi2Accessibility > AccessibilityLevel.None and (has("tjump") or has_legSpring()) ) then
            f2 = math.max(floor2SplitUp, logictype.CurrentStage + 1)
        end
        
        local flight = 99
        if ( gifAccessibility > AccessibilityLevel.None ) then
            flight = logictype.CurrentStage + 1
        end
        
        logic = math.max(1, math.min(outside, outsideBack, f1, f2, flight))
    end
    
    return convertLogic(logic, skip)
end

function nests_GI_outsideLeft(skip)
    local logic = 99
    --[[        nest_gi_outside_left
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.climb(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.climb(state)\
                or state.can_reach_region(regionName.GI1, self.player) and self.leg_spring(state)\
                or state.can_reach_region(regionName.GI2, self.player) and self.floor_2_split_up(state) and self.leg_spring(state)\
                or state.can_reach_region(regionName.GIF, self.player)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.climb(state)\
                or state.can_reach_region(regionName.GIOB, self.player) and self.claw_clamber_boots(state)\
                or state.can_reach_region(regionName.GI1, self.player) and self.leg_spring(state)\
                or state.can_reach_region(regionName.GI2, self.player) and self.floor_2_split_up(state) and self.leg_spring(state)\
                or state.can_reach_region(regionName.GIF, self.player)\
                or self.clockwork_shot(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.climb(state)\
                or state.can_reach_region(regionName.GIOB, self.player) and self.claw_clamber_boots(state)\
                or state.can_reach_region(regionName.GI1, self.player) and self.leg_spring(state)\
                or state.can_reach_region(regionName.GI2, self.player) and self.floor_2_split_up(state) and self.leg_spring(state)\
                or state.can_reach_region(regionName.GIF, self.player)\
                or self.clockwork_shot(state)
    --]]
    
    local giobAccessibility = Tracker:FindObjectForCode("@Region: Outside Grunty Industries - Behind the building").AccessibilityLevel
    local gi1Accessibility = Tracker:FindObjectForCode("@Region: Grunty Industries 1st Floor").AccessibilityLevel
    local gi2Accessibility = Tracker:FindObjectForCode("@Region: Grunty Industries 2nd Floor").AccessibilityLevel
    local gifAccessibility = Tracker:FindObjectForCode("@Region: Grunty Industries Flight").AccessibilityLevel
    local outsideToBack = connector_GIO_to_GIOBack(true)
    local floor2SplitUp = access_GI_floor2SplitUp(true)
    
    -- Normal Logic
    if ( has("climb") ) then
        logic = 0
    elseif ( (gi1Accessibility == AccessibilityLevel.Normal or gi1Accessibility == AccessibilityLevel.Cleared) and has_legSpring() or (gi2Accessibility == AccessibilityLevel.Normal or gi2Accessibility == AccessibilityLevel.Cleared) and has_legSpring() and floor2SplitUp <= logictype.CurrentStage or (gifAccessibility == AccessibilityLevel.Normal or gifAccessibility == AccessibilityLevel.Cleared) ) then
        logic = 1
    elseif ( (giobAccessibility == AccessibilityLevel.Normal or giobAccessibility == AccessibilityLevel.Cleared) and has("clawbts") or can_clockworkShot() ) then
        logic = 2
    
    -- Sequence Breaking
    else
        local f1 = 99
        if ( gi1Accessibility > AccessibilityLevel.None and has_legSpring() ) then
            f1 = logictype.CurrentStage + 1
        end
        
        local f2 = 99
        if ( (gi2Accessibility == AccessibilityLevel.Normal or gi2Accessibility == AccessibilityLevel.Cleared) and has_legSpring() ) then
            f2 = floor2SplitUp
        elseif ( gi2Accessibility > AccessibilityLevel.None and has_legSpring() ) then
            f2 = math.max(floor2SplitUp, logictype.CurrentStage + 1)
        end
        
        local flight = 99
        if ( gifAccessibility > AccessibilityLevel.None ) then
            flight = logictype.CurrentStage + 1
        end
        
        local outsideBack = 99
        if ( giobAccessibility > AccessibilityLevel.None and has("clawbts") ) then
            outsideBack = logictype.CurrentStage + 1
        end
        
        logic = math.max(2, math.min(f1, f2, flight, outsideBack))
    end
    
    return convertLogic(logic, skip)
end

function nests_GI_floor1TopPipe(skip)
    local logic = 99
    --[[        nest_gi_floor1_top_pipe
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.split_up(state) and self.claw_clamber_boots(state) and (self.spring_pad(state) or self.wing_whack(state) or (self.egg_aim(state) and self.glide(state)))
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.split_up(state) and\
                ((self.claw_clamber_boots(state) or state.can_reach_region(regionName.GI2, self.player)) and self.spring_pad(state)\
                    or self.claw_clamber_boots(state) and (self.wing_whack(state) or self.glide(state)) and (self.egg_aim(state) or self.wing_whack(state)))
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.split_up(state) and\
                ((self.claw_clamber_boots(state) or state.can_reach_region(regionName.GI2, self.player)) and self.spring_pad(state)\
                    or self.claw_clamber_boots(state) and (self.wing_whack(state) or self.glide(state)) and (self.egg_aim(state) or self.wing_whack(state)))
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.split_up(state) and\
                ((self.claw_clamber_boots(state) or state.can_reach_region(regionName.GI2, self.player)) and self.spring_pad(state)\
                    or self.claw_clamber_boots(state) and (self.wing_whack(state) or self.glide(state)) and (self.egg_aim(state) or self.wing_whack(state)))
    --]]
    
    local gi2Accessibility = Tracker:FindObjectForCode("@Region: Grunty Industries 2nd Floor").AccessibilityLevel
    local outsideToBack = connector_GIO_to_GIOBack(true)
    local floor2SplitUp = access_GI_floor2SplitUp(true)
    
    -- Normal Logic
    if ( has("splitup") and has("clawbts") and (has("tjump") or has_wingWhack() or has("eggaim") and has_glide()) ) then
        logic = 0
    elseif ( has("splitup") and has("tjump") and (gi2Accessibility == AccessibilityLevel.Normal or gi2Accessibility == AccessibilityLevel.Cleared) ) then
        logic = 1
    
    -- Sequence Breaking
    elseif ( has("splitup") and has("tjump") and gi2Accessibility > AccessibilityLevel.None ) then
        logic = logictype.CurrentStage + 1
    end
    
    return convertLogic(logic, skip)
end

function nests_GI_floor1HighPipe(skip)
    local logic = 99
    --[[        nest_gi_floor1_high_pipe
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.claw_clamber_boots(state) and (self.leg_spring(state) or self.spring_pad(state))
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.claw_clamber_boots(state) and (self.leg_spring(state) or self.spring_pad(state))\
                or state.can_reach_region(regionName.GI2, self.player) and (self.floor_2_split_up(state) and self.leg_spring(state) or self.F2_to_F1(state) and self.spring_pad(state))\
                or self.claw_clamber_boots(state) and (self.wing_whack(state) or self.glide(state)) and (self.egg_aim(state) or self.wing_whack(state))
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.claw_clamber_boots(state) and (self.leg_spring(state) or self.spring_pad(state) or self.clockwork_shot(state))\
                or state.can_reach_region(regionName.GI2, self.player) and (self.floor_2_split_up(state) and self.leg_spring(state) or self.F2_to_F1(state) and (self.spring_pad(state) or self.clockwork_shot(state)))\
                or self.claw_clamber_boots(state) and (self.wing_whack(state) or self.glide(state)) and (self.egg_aim(state) or self.wing_whack(state))
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.claw_clamber_boots(state) and (self.leg_spring(state) or self.spring_pad(state) or self.clockwork_shot(state))\
                or state.can_reach_region(regionName.GI2, self.player) and (self.floor_2_split_up(state) and self.leg_spring(state) or self.F2_to_F1(state) and (self.spring_pad(state) or self.clockwork_shot(state)))\
                or self.claw_clamber_boots(state) and (self.wing_whack(state) or self.glide(state)) and (self.egg_aim(state) or self.wing_whack(state))
    --]]
    
    local gi2Accessibility = Tracker:FindObjectForCode("@Region: Grunty Industries 2nd Floor").AccessibilityLevel
    local f2tof1 = connector_GIF2_to_GIF1(true)
    local floor2SplitUp = access_GI_floor2SplitUp(true)
    
    -- Normal Logic
    if ( has("clawbts") and (has("tjump") or has_legSpring()) ) then
        logic = 0
    elseif ( (gi2Accessibility == AccessibilityLevel.Normal or gi2Accessibility == AccessibilityLevel.Cleared) and (floor2SplitUp <= logictype.CurrentStage and has_legSpring() or f2tof1 <= logictype.CurrentStage and has("tjump")) or has("clawbts") and (has_wingWhack() or has_glide() and has("eggaim")) ) then
        logic = 1
    
    -- Sequence Breaking
    elseif ( gi2Accessibility == AccessibilityLevel.Normal or gi2Accessibility == AccessibilityLevel.Cleared ) then
        local legSpring = 99
        if ( has_legSpring() ) then
            legSpring = floor2SplitUp
        end
        
        local springPad = 99
        if ( has("tjump") ) then
            springPad = f2tof1
        end
        
        logic = math.max(1, math.min(legSpring, springPad))
    elseif ( gi2Accessibility > AccessibilityLevel.None ) then
        local legSpring = 99
        if ( has_legSpring() ) then
            legSpring = floor2SplitUp
        end
        
        local springPad = 99
        if ( has("tjump") ) then
            springPad = f2tof1
        end
        
        logic = math.max(logictype.CurrentStage + 1, math.min(legSpring, springPad))
    end
    
    return convertLogic(logic, skip)
end

function nests_GI_outsideWasteDisposal(skip)
    local logic = 99
    --[[        nest_gi_outside_waste_disposal
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.slightly_elevated_ledge(state) or self.split_up(state) or self.flap_flip(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.slightly_elevated_ledge(state) or self.split_up(state) or self.flap_flip(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.slightly_elevated_ledge(state) or self.split_up(state) or self.clockwork_shot(state) or self.flap_flip(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.slightly_elevated_ledge(state) or self.split_up(state) or self.clockwork_shot(state) or self.flap_flip(state)
    --]]
    
    if ( can_reachSlightlyElevatedLedge() or has("splitup") or has("fflip") ) then
        logic = 0
    elseif ( can_clockworkShot() ) then
        logic = 1
    end
    
    return convertLogic(logic, skip)
end

function nests_GI_outsideTrashCompactor(skip)
    local logic = 99
    --[[        nest_outside_trash_compactor
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.snooze_pack(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = True # You have to get crushed anyway in the intended strat. Is it fair that doing it without snooze pack is in easy tricks?
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = True
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = True
    --]]
    
    if ( has_snoozePack() ) then
        logic = 0
    else
        logic = 1
    end
    
    return convertLogic(logic, skip)
end

function nests_GI_trainStationSmallBox(skip)
    local logic = 99
    --[[        nest_gi_train_station_small_box
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

function nests_GI_trainStationMediumBox(skip)
    local logic = 99
    --[[        nest_gi_train_station_medium_box
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.slightly_elevated_ledge(state)\
                or self.flap_flip(state)\
                or self.leg_spring(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.slightly_elevated_ledge(state)\
                or self.flap_flip(state)\
                or self.split_up(state)\
                or self.flutter(state)\
                or self.air_rat_a_tat_rap(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.slightly_elevated_ledge(state)\
                or self.flap_flip(state)\
                or self.split_up(state)\
                or self.flutter(state)\
                or self.air_rat_a_tat_rap(state)\
                or self.clockwork_shot(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.slightly_elevated_ledge(state)\
                or self.flap_flip(state)\
                or self.split_up(state)\
                or self.flutter(state)\
                or self.air_rat_a_tat_rap(state)\
                or self.clockwork_shot(state)
    --]]
    
    if ( can_reachSlightlyElevatedLedge() or has("fflip") or has_legSpring() ) then
        logic = 0
    elseif ( has("splitup") or has("flutter") or has("arat") ) then
        logic = 1
    elseif ( can_clockworkShot() ) then
        logic = 2
    end
    
    return convertLogic(logic, skip)
end

function nests_GI_trashCompactor(skip)
    local logic = 99
    --[[        nest_trash_compactor
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.snooze_pack(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.snooze_pack(state)\
                or self.split_up(state) and self.tall_jump(state)\
                or self.wing_whack(state)\
                or self.glide(state)\
                or self.leg_spring(state)\
                or self.flap_flip(state)\
                or self.clockwork_eggs(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.snooze_pack(state)\
                or self.split_up(state) and self.tall_jump(state)\
                or self.wing_whack(state)\
                or self.glide(state)\
                or self.leg_spring(state)\
                or self.clockwork_eggs(state)\
                or self.flap_flip(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.snooze_pack(state)\
                or self.split_up(state) and self.tall_jump(state)\
                or self.wing_whack(state)\
                or self.glide(state)\
                or self.leg_spring(state)\
                or self.clockwork_eggs(state)\
                or self.flap_flip(state)
    --]]
    
    if ( has_snoozePack() ) then
        logic = 0
    elseif ( has("splitup") and has("tjump") or has_wingWhack() or has_glide() or has_legSpring() or has("fflip") or can_shootEggs("ceggs") ) then
        logic = 1
    end
    
    return convertLogic(logic, skip)
end

function nests_GI_elevatorShaftF2(skip)
    local logic = 99
    --[[        nest_elevator_shaft_floor2
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.climb(state)\
                or state.can_reach_region(regionName.GI2EM, self.player) and self.floor_2_em_room_to_elevator_shaft(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.climb(state)\
                or state.can_reach_region(regionName.GI2EM, self.player) and self.floor_2_em_room_to_elevator_shaft(state)\
                or state.can_reach_region(regionName.GI3B, self.player) and self.boiler_plant_to_elevator_shaft(state) and self.beak_buster(state)\
                or state.can_reach_region(regionName.GI4B, self.player) and self.floor_4_back_to_elevator_shaft(state) and self.beak_buster(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.climb(state)\
                or state.can_reach_region(regionName.GI2EM, self.player) and self.floor_2_em_room_to_elevator_shaft(state)\
                or state.can_reach_region(regionName.GI3B, self.player) and self.boiler_plant_to_elevator_shaft(state)\
                or state.can_reach_region(regionName.GI4B, self.player) and (self.health_upgrades(state, 2) or self.beak_buster(state)) and self.floor_4_back_to_elevator_shaft(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.climb(state)\
                or state.can_reach_region(regionName.GI2EM, self.player) and self.floor_2_em_room_to_elevator_shaft(state)\
                or state.can_reach_region(regionName.GI3B, self.player) and self.boiler_plant_to_elevator_shaft(state)\
                or state.can_reach_region(regionName.GI4B, self.player) and (self.health_upgrades(state, 2) or self.beak_buster(state)) and self.floor_4_back_to_elevator_shaft(state)
     --]]
    
    local gi2emAccessibility = Tracker:FindObjectForCode("@Region: Grunty Industries 2nd Floor - Electromagnetic Chamber").AccessibilityLevel
    local gi3bpAccessibility = Tracker:FindObjectForCode("@Region: Grunty Industries 3rd Floor - Boiler Plant").AccessibilityLevel
    local gi4bAccessibility = Tracker:FindObjectForCode("@Region: Grunty Industries 4th Floor - Past the Crushers").AccessibilityLevel
    local f2emToES = connector_GIF2ElectromagneticChamber_to_GIElevatorShaft(true)
    local f3bpToES = connector_GIF3BoilerPlant_to_GIElevatorShaft(true)
    local f4bToES = connector_GIF4Back_to_GIElevatorShaft(true)
    local hp7 = health_canGet7(true)
    
    -- Normal Logic
    if ( has("climb") or (gi2emAccessibility == AccessibilityLevel.Normal or gi2emAccessibility == AccessibilityLevel.Cleared) and f2emToES <= logictype.CurrentStage ) then
        logic = 0
    elseif ( (gi3bpAccessibility == AccessibilityLevel.Normal or gi3bpAccessibility == AccessibilityLevel.Cleared) and has("bbust") and f3bpToES <= logictype.CurrentStage or (gi4bAccessibility == AccessibilityLevel.Normal or gi4bAccessibility == AccessibilityLevel.Cleared) and has("bbust") and f4bToES <= logictype.CurrentStage ) then
        logic = 1
    elseif ( (gi2emAccessibility == AccessibilityLevel.Normal or gi2emAccessibility == AccessibilityLevel.Cleared) and f2emToES < 2 or logictype.CurrentStage == 0 and gi2emAccessibility > AccessibilityLevel.None and f2emToES < 2 ) then
        logic = 1 -- Sequence Breaking
    elseif ( (gi3bpAccessibility == AccessibilityLevel.Normal or gi3bpAccessibility == AccessibilityLevel.Cleared) and f3bpToES <= logictype.CurrentStage or (gi4bAccessibility == AccessibilityLevel.Normal or gi4bAccessibility == AccessibilityLevel.Cleared) and hp7 <= logictype.CurrentStage and f4bToES <= logictype.CurrentStage ) then
        logic = 2
    
    -- Sequence Breaking
    else
        local f2 = 99
        if ( gi2emAccessibility == AccessibilityLevel.Normal or gi2emAccessibility == AccessibilityLevel.Cleared ) then
            f2 = f2emToES
        elseif ( gi2emAccessibility > AccessibilityLevel.None ) then
            f2 = math.max(logictype.CurrentStage + 1, f2emToES)
        end
        
        local f3 = 99
        if ( gi3bpAccessibility == AccessibilityLevel.Normal or gi3bpAccessibility == AccessibilityLevel.Cleared ) then
            f3 = math.max(2, f3bpToES)
        elseif ( gi3bpAccessibility > AccessibilityLevel.None ) then
            f3 = math.max(2, logictype.CurrentStage + 1, f3bpToES)
        end
        
        local f4bbust = 99
        if ( gi4bAccessibility == AccessibilityLevel.Normal or gi4bAccessibility == AccessibilityLevel.Cleared and has("bbust") ) then
            f4bbust = math.max(2, f4bToES)
        elseif ( gi4bAccessibility > AccessibilityLevel.None and has("bbust") ) then
            f4bbust = math.max(2, logictype.CurrentStage + 1, f4bToES)
        end
        
        local f4hp = 99
        if ( gi4bAccessibility == AccessibilityLevel.Normal or gi4bAccessibility == AccessibilityLevel.Cleared ) then
            f4hp = math.max(2, f4bToES, hp7)
        elseif ( gi4bAccessibility > AccessibilityLevel.None ) then
            f4hp = math.max(2, logictype.CurrentStage + 1, f4bToES, hp7)
        end
        
        logic = math.min(f2, f3, f4bbust, f4hp)
    end
    
    return convertLogic(logic, skip)
end

function nests_GI_elevatorShaftF3(skip)
    local logic = 99
    --[[        nest_elevator_shaft_floor3
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.climb(state)\
                or state.can_reach_region(regionName.GI3B, self.player) and self.boiler_plant_to_elevator_shaft(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.climb(state)\
                or state.can_reach_region(regionName.GI3B, self.player) and self.boiler_plant_to_elevator_shaft(state)\
                or state.can_reach_region(regionName.GI4B, self.player) and self.floor_4_back_to_elevator_shaft(state) and self.beak_buster(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.climb(state)\
                or state.can_reach_region(regionName.GI3B, self.player) and self.boiler_plant_to_elevator_shaft(state)\
                or state.can_reach_region(regionName.GI4B, self.player) and self.floor_4_back_to_elevator_shaft(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.climb(state)\
                or state.can_reach_region(regionName.GI3B, self.player) and self.boiler_plant_to_elevator_shaft(state)\
                or state.can_reach_region(regionName.GI4B, self.player) and self.floor_4_back_to_elevator_shaft(state)
    --]]
    
    local gi3bpAccessibility = Tracker:FindObjectForCode("@Region: Grunty Industries 3rd Floor - Boiler Plant").AccessibilityLevel
    local gi4bAccessibility = Tracker:FindObjectForCode("@Region: Grunty Industries 4th Floor - Past the Crushers").AccessibilityLevel
    local f3bpToES = connector_GIF3BoilerPlant_to_GIElevatorShaft(true)
    local f4bToES = connector_GIF4Back_to_GIElevatorShaft(true)
    
    -- Normal Logic
    if ( has("climb") or (gi3bpAccessibility == AccessibilityLevel.Normal or gi3bpAccessibility == AccessibilityLevel.Cleared) and f3bpToES <= logictype.CurrentStage ) then
        logic = 0
    elseif ( (gi4bAccessibility == AccessibilityLevel.Normal or gi4bAccessibility == AccessibilityLevel.Cleared) and has("bbust") and f4bToES <= logictype.CurrentStage ) then
        logic = 1
    elseif ( (gi3bpAccessibility == AccessibilityLevel.Normal or gi3bpAccessibility == AccessibilityLevel.Cleared) and f3bpToES < 2 or logictype.CurrentStage == 0 and gi3bpAccessibility > AccessibilityLevel.None and f3bpToES < 2 ) then
        logic = 1 -- Sequence Breaking
    elseif ( (gi4bAccessibility == AccessibilityLevel.Normal or gi4bAccessibility == AccessibilityLevel.Cleared) and f4bToES <= logictype.CurrentStage ) then
        logic = 2
    
    -- Sequence Breaking
    else        
        local f3 = 99
        if ( gi3bpAccessibility == AccessibilityLevel.Normal or gi3bpAccessibility == AccessibilityLevel.Cleared ) then
            f3 = f3bpToES
        elseif ( gi3bpAccessibility > AccessibilityLevel.None ) then
            f3 = math.max(logictype.CurrentStage + 1, f3bpToES)
        end
        
        local f4 = 99
        if ( gi4bAccessibility == AccessibilityLevel.Normal or gi4bAccessibility == AccessibilityLevel.Cleared ) then
            f4 = math.max(2, f4bToES)
        elseif ( gi4bAccessibility > AccessibilityLevel.None ) then
            f4 = math.max(2, logictype.CurrentStage + 1, f4bToES)
        end
        
        logic = math.min(f3, f4)
    end
    
    return convertLogic(logic, skip)
end

function nests_GI_elevatorShaftF4(skip)
    local logic = 99
    --[[        nest_elevator_shaft_floor4
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.climb(state)\
                or state.can_reach_region(regionName.GI4B, self.player) and self.floor_4_back_to_elevator_shaft(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.climb(state)\
                or state.can_reach_region(regionName.GI4B, self.player) and self.floor_4_back_to_elevator_shaft(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.climb(state)\
                or state.can_reach_region(regionName.GI4B, self.player) and self.floor_4_back_to_elevator_shaft(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.climb(state)\
                or state.can_reach_region(regionName.GI4B, self.player) and self.floor_4_back_to_elevator_shaft(state)
    --]]
    
    local gi4bAccessibility = Tracker:FindObjectForCode("@Region: Grunty Industries 4th Floor - Past the Crushers").AccessibilityLevel
    local f4bToES = connector_GIF4Back_to_GIElevatorShaft(true)
    
    -- Normal Logic
    if ( has("climb") or (gi4bAccessibility == AccessibilityLevel.Normal or gi4bAccessibility == AccessibilityLevel.Cleared) and f4bToES <= logictype.CurrentStage ) then
        logic = 0
    
    -- Sequence Breaking
    elseif ( gi4bAccessibility == AccessibilityLevel.Normal or gi4bAccessibility == AccessibilityLevel.Cleared ) then
        logic = f4bToES
    elseif ( gi4bAccessibility > AccessibilityLevel.None ) then
        logic = math.max(logictype.CurrentStage + 1, f4bToES)
    end
    
    return convertLogic(logic, skip)
end

function nests_GI_floor2OnScaffolding(skip)
    local logic = 99
    --[[        nest_funny_platform
    if self.world.options.logic_type == LogicType.option_intended:
        logic = state.can_reach_region(regionName.GI2, self.player) and self.claw_clamber_boots(state) and self.flap_flip(state) and self.grip_grab(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = state.can_reach_region(regionName.GI2, self.player) and self.claw_clamber_boots(state) and (self.flap_flip(state) and self.grip_grab(state))\
                or state.can_reach_region(regionName.GI2, self.player) and self.floor_2_split_up(state)\
                    and (self.leg_spring(state) or self.claw_clamber_boots(state) and (self.can_shoot_any_egg(state) or self.wing_whack(state)))\
                    and self.glide(state)\
                or state.can_reach_region(regionName.GI3, self.player) and\
                    self.climb(state) and (self.veryLongJump(state) or self.flap_flip(state) or self.tall_jump(state)) and self.grip_grab(state)\
                or state.can_reach_region(regionName.GI3, self.player) and self.small_elevation(state)\
                    and self.split_up(state) and self.leg_spring(state) and self.glide(state)                                               -- checking for split up is redundant
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = state.can_reach_region(regionName.GI2, self.player) and self.claw_clamber_boots(state)\
                    and ((self.flap_flip(state) and self.grip_grab(state))\
                         or self.talon_trot(state) and (self.flutter(state) or self.air_rat_a_tat_rap(state)))\
                or state.can_reach_region(regionName.GI2, self.player) and self.floor_2_split_up(state)\
                    and (self.leg_spring(state) or self.claw_clamber_boots(state) and (self.can_shoot_any_egg(state) or self.wing_whack(state)))\
                    and self.glide(state)\
                or state.can_reach_region(regionName.GI3, self.player) and\
                    self.climb(state) and (self.veryLongJump(state) or self.flap_flip(state) or self.tall_jump(state)) and self.grip_grab(state)\
                or state.can_reach_region(regionName.GI3, self.player) and self.small_elevation(state)\
                    and self.split_up(state) and self.leg_spring(state) and self.glide(state)\
                or self.clockwork_shot(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = state.can_reach_region(regionName.GI2, self.player) and self.claw_clamber_boots(state)\
                    and ((self.flap_flip(state) and self.grip_grab(state))\
                         or self.talon_trot(state) and (self.flutter(state) or self.air_rat_a_tat_rap(state)))\
                or state.can_reach_region(regionName.GI2, self.player) and self.floor_2_split_up(state)\
                    and (self.leg_spring(state) or self.claw_clamber_boots(state) and (self.can_shoot_any_egg(state) or self.wing_whack(state)))\
                    and self.glide(state)\
                or state.can_reach_region(regionName.GI3, self.player) and\
                    self.climb(state) and (self.veryLongJump(state) or self.flap_flip(state) or self.tall_jump(state)) and self.grip_grab(state)\
                or state.can_reach_region(regionName.GI3, self.player) and self.small_elevation(state)\
                    and self.split_up(state) and self.leg_spring(state) and self.glide(state)\
                or self.clockwork_shot(state)
    --]]
    
    local gi2Accessibility = Tracker:FindObjectForCode("@Region: Grunty Industries 2nd Floor").AccessibilityLevel
    local gi3Accessibility = Tracker:FindObjectForCode("@Region: Grunty Industries 3rd Floor").AccessibilityLevel
    local floor2SplitUp = access_GI_floor2SplitUp(true)
    
    -- Normal Logic
    if ( (gi2Accessibility == AccessibilityLevel.Normal or gi2Accessibility == AccessibilityLevel.Cleared) and has("clawbts") and has("fflip") and has("ggrab") ) then
        logic = 0
    elseif ( (gi2Accessibility == AccessibilityLevel.Normal or gi2Accessibility == AccessibilityLevel.Cleared) and floor2SplitUp <= logictype.CurrentStage and has_glide() and (has_legSpring() or has("clawbts") and (can_shootEggs() or has_wingWhack())) or (gi3Accessibility == AccessibilityLevel.Normal or gi3Accessibility == AccessibilityLevel.Cleared) and (has("climb") and (can_veryLongJump() or has("fflip") or has("tjump")and has("ggrab")) or can_reachSmallElevation() and has_legSpring() and has_glide()) ) then
        logic = 1
    elseif ( logictype.CurrentStage == 0 and gi2Accessibility > AccessibilityLevel.None and has("clawbts") and has("fflip") and has("ggrab") ) then
        logic = 1 -- Sequence Breaking
    elseif ( (gi2Accessibility == AccessibilityLevel.Normal or gi2Accessibility == AccessibilityLevel.Cleared) and has("clawbts") and has("ttrot") and (has("flutter") or has("arat")) or can_clockworkShot() ) then
        logic = 2
    
    -- Sequence Breaking
    else
        local f2AsPair = 99
        local f2AsKazooie = 99
        if ( (gi2Accessibility == AccessibilityLevel.Normal or gi2Accessibility == AccessibilityLevel.Cleared) and has_glide() and (has_legSpring() or has("clawbts") and (can_shootEggs() or has_wingWhack())) ) then
            f2AsKazooie = math.max(2, floor2SplitUp)
        elseif ( gi2Accessibility > AccessibilityLevel.None ) then
            if ( has("clawbts") and (has("fflip") and has("ggrab") or has("ttrot") and (has("flutter") or has("arat"))) ) then
                f2AsPair = logictype.CurrentStage + 1
            end
            
            if ( has_glide() and (has_legSpring() or has("clawbts") and (can_shootEggs() or has_wingWhack())) ) then
                f2AsKazooie = math.max(2, logictype.CurrentStage + 1, floor2SplitUp)
            end
        end
        
        local f3 = 99
        if ( gi3Accessibility > AccessibilityLevel.None and (has("climb") and (can_veryLongJump() or has("fflip") or has("tjump")and has("ggrab")) or can_reachSmallElevation() and has_legSpring() and has_glide()) ) then
            f3 = logictype.CurrentStage + 1
        end
        
        logic = math.min(f2AsPair, f2AsKazooie, f3)
    end
    
    return convertLogic(logic, skip)
end

function nests_GI_floor2ButFromFlight(skip)
    local logic = 99
    --[[
    self.egg_aim(state) or self.airborne_egg_aiming(state) or self.beak_bomb(state)
    --]]
    
    if ( has("eggaim") or has("aireaim") or has("bbomb") ) then
        logic = 0
    end
    
    return convertLogic(logic, skip)
end

function nests_GI_floor2emChamber(skip)
    local logic = 99
    --[[        nest_magnet
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.tall_jump(state)\
                or self.talon_trot(state)\
                or self.flutter(state)\
                or self.air_rat_a_tat_rap(state)\
                or state.can_reach_region(regionName.GI2, self.player) and self.floor_2_to_em_room(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.tall_jump(state)\
                or self.talon_trot(state)\
                or self.flutter(state)\
                or self.air_rat_a_tat_rap(state)\
                or state.can_reach_region(regionName.GI2, self.player) and self.floor_2_to_em_room(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.tall_jump(state)\
                or self.talon_trot(state)\
                or self.flutter(state)\
                or self.air_rat_a_tat_rap(state)\
                or state.can_reach_region(regionName.GI2, self.player) and self.floor_2_to_em_room(state)\
                or self.clockwork_shot(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.tall_jump(state)\
                or self.talon_trot(state)\
                or self.flutter(state)\
                or self.air_rat_a_tat_rap(state)\
                or state.can_reach_region(regionName.GI2, self.player) and self.floor_2_to_em_room(state)\
                or self.clockwork_shot(state)
    --]]
    
    local gi2Accessibility = Tracker:FindObjectForCode("@Region: Grunty Industries 2nd Floor").AccessibilityLevel
    local f2ToEM = connector_GIF2_to_GIF2ElectromagneticChamber(true)
    
    -- Normal Logic
    if ( has("tjump") or has("ttrot") or has("flutter") or has("arat") or (gi2Accessibility == AccessibilityLevel.Normal or gi2Accessibility == AccessibilityLevel.Cleared) and f2ToEM <= logictype.CurrentStage ) then
        logic = 0
    elseif ( (gi2Accessibility == AccessibilityLevel.Normal or gi2Accessibility == AccessibilityLevel.Cleared) and f2ToEM < 2 ) then
        logic = 1 -- Sequence Breaking
    elseif ( logictype.CurrentStage == 0 and gi2Accessibility > AccessibilityLevel.None and f2ToEM < 2 ) then
        logic = 1 -- Sequence Breaking
    elseif ( can_clockworkShot() ) then
        logic = 2
    
    -- Sequence Breaking
    elseif ( (gi2Accessibility == AccessibilityLevel.Normal or gi2Accessibility == AccessibilityLevel.Cleared) ) then
        logic = f2ToEM
    elseif ( gi2Accessibility > AccessibilityLevel.None ) then
        logic = math.max(logictype.CurrentStage + 1, f2ToEM)
    end
    
    return convertLogic(logic, skip)
end

function nests_GI_floor3HighBox(skip)
    local logic = 99
    --[[        nest_floor3_high_box
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.flap_flip(state) and self.grip_grab(state)\
                or self.climb(state) and (
                    self.tall_jump(state) and self.grip_grab(state)\
                    or self.talon_trot(state) and self.flutter(state) and self.grip_grab(state)
                )\
                or self.floor_3_split_up(state) and self.leg_spring(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.flap_flip(state) and (self.grip_grab(state) or self.beak_buster(state))\
                or self.climb(state) and (
                    self.tall_jump(state) and self.grip_grab(state)\
                    or self.talon_trot(state) and self.flutter(state) and self.grip_grab(state)
                )\
                or self.pack_whack(state) and self.floor_3_split_up(state) and self.tall_jump(state)\
                or self.floor_3_split_up(state) and self.leg_spring(state)

    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.flap_flip(state) and (self.grip_grab(state) or self.beak_buster(state))\
                or self.climb(state) and (
                    self.tall_jump(state) and self.grip_grab(state)\
                    or self.talon_trot(state) and self.flutter(state) and self.grip_grab(state)
                )\
                or self.pack_whack(state) and self.floor_3_split_up(state) and self.tall_jump(state)\
                or self.floor_3_split_up(state) and self.leg_spring(state)\
                or self.floor_3_split_up(state) and self.tall_jump(state) and (self.wing_whack(state) or self.glide(state))\
                or self.clockwork_shot(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.flap_flip(state) and (self.grip_grab(state) or self.beak_buster(state))\
                or self.climb(state) and (
                    self.tall_jump(state) and self.grip_grab(state)\
                    or self.talon_trot(state) and self.flutter(state) and self.grip_grab(state)
                )\
                or self.pack_whack(state) and self.floor_3_split_up(state) and self.tall_jump(state)\
                or self.floor_3_split_up(state) and self.leg_spring(state)\
                or self.floor_3_split_up(state) and self.tall_jump(state) and (self.wing_whack(state) or self.glide(state))\
                or self.clockwork_shot(state)
     --]]
    
    local floor3SplitUp = access_GI_floor3SplitUp(true)
    
    -- Normal Logic
    if ( has("ggrab") and (has("fflip") or has("climb") and (has("tjump") or has("ttrot") and has("flutter"))) or floor3SplitUp <= logictype.CurrentStage and has_legSpring() ) then
        logic = 0
    elseif ( has("fflip") and has("bbust") or floor3SplitUp <= logictype.CurrentStage and has_packWhack() and has("tjump") ) then
        logic = 1
    elseif ( floor3SplitUp < 2 and (has_legSpring() or has_packWhack() and has("tjump")) ) then
        logic = 1 -- Sequence Breaking
    elseif ( can_clockworkShot() or floor3SplitUp <= logictype.CurrentStage and (has_wingWhack() or has_glide()) and has("tjump") ) then
        logic = 2
    
    -- Sequence Breaking
    elseif ( has_legSpring() or has("tjump") and (has_packWhack() or has_wingWhack() or has_glide()) ) then
        logic = math.max(2, floor3SplitUp)
    end
    
    return convertLogic(logic, skip)
end

function nests_GI_floor3BoxUnderNotes(skip)
    local logic = 99
    --[[        nest_floor3_under_notes_boxes
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.climb(state)\
                or self.floor_3_split_up(state) and self.leg_spring(state)\
                or self.flap_flip(state)\
                or self.slightly_elevated_ledge(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.climb(state)\
                or self.enter_floor_3_from_fire_exit(state)\
                or self.flap_flip(state)\
                or self.slightly_elevated_ledge(state)\
                or self.floor_3_split_up(state) and self.leg_spring(state)\
                or self.floor_3_split_up(state) and self.pack_whack(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.climb(state)\
                or self.enter_floor_3_from_fire_exit(state)\
                or self.flap_flip(state)\
                or self.slightly_elevated_ledge(state)\
                or self.floor_3_split_up(state) and self.leg_spring(state)\
                or self.floor_3_split_up(state) and self.pack_whack(state)\
                or self.floor_3_split_up(state) and self.sack_pack(state)\
                or self.floor_3_split_up(state) and self.tall_jump(state) and (self.wing_whack(state) or self.glide(state))\
                or self.clockwork_shot(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.climb(state)\
                or self.enter_floor_3_from_fire_exit(state)\
                or self.flap_flip(state)\
                or self.slightly_elevated_ledge(state)\
                or self.floor_3_split_up(state) and self.leg_spring(state)\
                or self.floor_3_split_up(state) and self.pack_whack(state)\
                or self.floor_3_split_up(state) and self.sack_pack(state)\
                or self.floor_3_split_up(state) and self.tall_jump(state) and (self.wing_whack(state) or self.glide(state))\
                or self.clockwork_shot(state)
     --]]
    
    local floor3SplitUp = access_GI_floor3SplitUp(true)
    local f3FromFireExit = access_GI_enterFloor3FromFireExit(true)
    
    -- Normal Logic
    if ( has("climb") or floor3SplitUp <= logictype.CurrentStage and has_legSpring() or has("fflip") or can_reachSlightlyElevatedLedge() ) then
        logic = 0
    elseif ( f3FromFireExit <= logictype.CurrentStage or floor3SplitUp <= logictype.CurrentStage and has_packWhack() ) then
        logic = 1
    elseif ( floor3SplitUp < 2 and (has_legSpring() or has_packWhack()) or f3FromFireExit < 2 ) then
        logic = 1 -- Sequence Breaking
    elseif ( can_clockworkShot() or floor3SplitUp <= logictype.CurrentStage and (has_sackPack() or has("tjump") and (has_wingWhack() or has_glide())) ) then
        logic = 2 -- Normal Logic
    
    -- Sequence Breaking
    else
        local f3SU = 99
        if ( has_legSpring() or has_packWhack() or has_sackPack() or has("tjump") and (has_wingWhack() or has_glide()) ) then
            f3SU = math.max(2, floor3SplitUp)
        end
    
        logic = math.max(1, math.min(f3SU, f3FromFireExit))
    end
    
    return convertLogic(logic, skip)
end

function nests_GI_floor3cornerBox(skip) -- nests_GI_floor3featherNests
    local logic = 99
    --[[        nests_GI_floor3cornerBox
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.floor_3_split_up(state)\
                or self.small_elevation(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.floor_3_split_up(state)\
                or self.small_elevation(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.floor_3_split_up(state)\
                or self.small_elevation(state)\
                or self.clockwork_shot(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.floor_3_split_up(state)\
                or self.small_elevation(state)\
                or self.clockwork_shot(state)
     --]]
    
    local floor3SplitUp = access_GI_floor3SplitUp(true)
    
    if ( floor3SplitUp <= logictype.CurrentStage or can_reachSmallElevation() ) then
        logic = 0 -- Normal Logic
    elseif ( floor3SplitUp < 2 ) then
        logic = 1 -- Sequence Breaking
    elseif ( can_clockworkShot() ) then
        logic = 2 -- Normal Logic
    
    -- Sequence Breaking
    else
        logic = floor3SplitUp
    end
    
    return convertLogic(logic, skip)
end

function nests_GI_floor3featherNests(skip)
    local logic = 99
    --[[        nests_GI_floor3cornerBox
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.floor_3_split_up(state)\
                or self.small_elevation(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.floor_3_split_up(state)\
                or self.small_elevation(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.floor_3_split_up(state)\
                or self.small_elevation(state)\
                or self.clockwork_shot(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.floor_3_split_up(state)\
                or self.small_elevation(state)\
                or self.clockwork_shot(state)
     --]]
    
    local floor3SplitUp = access_GI_floor3SplitUp(true)
    
    if ( floor3SplitUp <= logictype.CurrentStage or can_reachSmallElevation() ) then
        logic = 0 -- Normal Logic
    elseif ( floor3SplitUp < 2 ) then
        logic = 1 -- Sequence Breaking
    elseif ( can_clockworkShot() ) then
        logic = 2 -- Normal Logic
    
    -- Sequence Breaking
    else
        logic = floor3SplitUp
    end
    
    return convertLogic(logic, skip)
end

function nests_GI_floor3nearMumbo(skip)
    local logic = 99
    --[[        nest_floor3_shortcut
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.floor_3_split_up(state)\
                or self.small_elevation(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.floor_3_split_up(state)\
                or self.small_elevation(state)\
                or self.beak_buster(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.floor_3_split_up(state)\
                or self.small_elevation(state)\
                or self.beak_buster(state)\
                or self.clockwork_shot(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.floor_3_split_up(state)\
                or self.small_elevation(state)\
                or self.beak_buster(state)\
                or self.clockwork_shot(state)
     --]]
     
    local floor3SplitUp = access_GI_floor3SplitUp(true)
    
    -- Normal Logic
    if ( can_reachSmallElevation() or floor3SplitUp <= logictype.CurrentStage ) then
        logic = 0
    elseif ( has("bbust") ) then
        logic = 1
    elseif ( floor3SplitUp < 2 ) then
        logic = 1 -- Sequence Breaking
    elseif ( can_clockworkShot() ) then
        logic = 2
    
    -- Sequence Breaking
    else
        logic = floor3SplitUp
    end
    
    return convertLogic(logic, skip)
end

function nests_GI_floor4nearFireEscape(skip)
    local logic = 99
    --[[        nest_floor4_front
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.small_elevation(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.small_elevation(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.small_elevation(state) or self.clockwork_shot(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.small_elevation(state) or self.clockwork_shot(state)
    --]]
    
    if ( can_reachSmallElevation() ) then
        logic = 0
    elseif ( can_clockworkShot() ) then
        logic = 2
    elseif ( has("arat") ) then
        logic = 7 -- FIXIT you can get these without tall jump if you have arat
    end
    
    return convertLogic(logic, skip)
end

function nests_GI_floor4front(skip)
    local logic = 99
    --[[        nest_floor4_front
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.small_elevation(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.small_elevation(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.small_elevation(state) or self.clockwork_shot(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.small_elevation(state) or self.clockwork_shot(state)
    --]]
    
    if ( can_reachSmallElevation() ) then
        logic = 0
    elseif ( can_clockworkShot() ) then
        logic = 2
    end
    
    return convertLogic(logic, skip)
end

function nests_GI_floor4outsideQC(skip)
    local logic = 99
    --[[        nest_outside_QC
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.climb(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.climb(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.climb(state)\
                or self.pack_whack(state) and self.tall_jump(state)\
                or self.split_up(state) and (self.leg_spring(state) or self.spring_pad(state))
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.climb(state)\
                or self.pack_whack(state) and self.tall_jump(state)\
                or self.split_up(state) and (self.leg_spring(state) or self.spring_pad(state))\
                or self.precise_clockwork_warp(state) and (self.spring_pad(state) or self.flap_flip(state))\
                or state.can_reach_region(regionName.GIES, self.player) and self.elevator_shaft_to_floor_4(state)
    --]]
    
    local giesAccessibility = Tracker:FindObjectForCode("@Region: Grunty Industries Elevator Shaft").AccessibilityLevel
    local esToF4B = connector_GIElevatorShaft_to_GIF4Back(true)
    
    -- Normal Logic
    if ( has("climb") ) then
        logic = 0
    elseif ( has_packWhack() and has("tjump") or has("splitup") and (has_legSpring() or has("tjump")) ) then
        logic = 2
    elseif ( can_preciseClockworkWarp() and (has("tjump") or has("fflip")) or (giesAccessibility == AccessibilityLevel.Normal or giesAccessibility == AccessibilityLevel.Cleared) and esToF4B <= logictype.CurrentStage ) then
        logic = 3
    
    -- Sequence Breaking
    elseif ( giesAccessibility == AccessibilityLevel.Normal or giesAccessibility == AccessibilityLevel.Cleared ) then
        logic = math.max(3, esToF4B)
    elseif ( giesAccessibility > AccessibilityLevel.None ) then
        logic = math.max(3, logictype.CurrentStage + 1, esToF4B)
    end
    
    return convertLogic(logic, skip)
end

function nests_GI_qualityControl(skip)
    local logic = 99
    --[[        nest_quality_control
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.can_use_battery(state) and self.climb(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.can_use_battery(state) and self.climb(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.can_use_battery(state) and self.climb(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.can_use_battery(state) and self.climb(state)\
                or self.precise_clockwork_warp(state) and (self.spring_pad(state) or self.flap_flip(state))
    --]]
    
    if ( basic_GI_canUseBattery() and has("climb") ) then
        logic = 0
    elseif ( can_preciseClockworkWarp() and (has("tjump") or has("fflip")) ) then
        logic = 3
    end
    
    return convertLogic(logic, skip)
end

function nests_GI_floor5smallStack(skip)
    local logic = 99
    --[[        nest_floor5_small_stack
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.small_elevation(state)\
                or self.split_up(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.small_elevation(state)\
                or self.split_up(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.small_elevation(state)\
                or self.split_up(state)\
                or self.clockwork_shot(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.small_elevation(state)\
                or self.split_up(state)\
                or self.clockwork_shot(state)
    --]]
    
    if ( can_reachSmallElevation() and has("splitup") ) then
        logic = 0
    elseif ( can_clockworkShot() ) then
        logic = 2
    end
    
    return convertLogic(logic, skip)
end

function nests_GI_outsideRepairDepot(skip)
    local logic = 99
    --[[        nest_outside_repair_depot
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.flap_flip(state) and self.climb(state) and self.grip_grab(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.flap_flip(state) and self.climb(state) and (self.grip_grab(state)\
                    or (self.tall_jump(state) and (self.flutter(state) or self.air_rat_a_tat_rap(state))))
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.flap_flip(state) and self.climb(state) and (self.grip_grab(state)\
                    or (self.tall_jump(state) and (self.flutter(state) or self.air_rat_a_tat_rap(state))))\
                or self.leg_spring(state) and (self.glide(state) or self.wing_whack(state))\
                or self.clockwork_shot(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.flap_flip(state) and self.climb(state) and (self.grip_grab(state)\
                    or (self.tall_jump(state) and (self.flutter(state) or self.air_rat_a_tat_rap(state))))\
                or self.leg_spring(state) and (self.glide(state) or self.wing_whack(state))\
                or self.clockwork_shot(state)
    --]]
    
    if ( has("fflip") and has("climb") and has("ggrab") ) then
        logic = 0
    elseif ( has("fflip") and has("climb") and has("tjump") and (has("flutter") or has("arat")) ) then
        logic = 1
    elseif ( can_clockworkShot() or has_legSpring() and (has_glide() or has_wingWhack()) ) then
        logic = 2
    end
    
    return convertLogic(logic, skip)
end

function nests_GI_fanEasy(skip)
    local logic = 99
    --[[        nest_egg_fan_easy
    if self.world.options.logic_type == LogicType.option_intended:
        logic = (self.tall_jump(state) or self.flutter(state) or self.air_rat_a_tat_rap(state)) and self.climb(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.climb(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.climb(state)\
                or self.leg_spring(state) and (self.wing_whack(state) or self.glide(state))
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.climb(state)\
                or self.leg_spring(state) and (self.wing_whack(state) or self.glide(state))
    --]]
    
    if ( has("climb") and (has("tjump") or has("flutter") or has("arat")) ) then
        logic = 0
    elseif ( has("climb") ) then
        logic = 1
    elseif ( has_legSpring() and (has_glide() or has_wingWhack()) ) then
        logic = 2
    end
    
    return convertLogic(logic, skip)
end

function nests_GI_fanHard(skip)
    local logic = 99
    --[[        nest_egg_fan_hard
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.can_beat_weldar(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.can_beat_weldar(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.can_beat_weldar(state)\
                or (self.climb(state) or self.leg_spring(state) and (self.wing_whack(state) or self.glide(state))) and self.clockwork_shot(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.can_beat_weldar(state)\
                or (self.climb(state) or self.leg_spring(state) and (self.wing_whack(state) or self.glide(state))) and self.clockwork_shot(state)
    --]]
    
    local canBeatWeldar = access_GI_canBeatWeldar(true)
    
    if ( canBeatWeldar <= logictype.CurrentStage ) then
        logic = 0 -- Normal Logic
    elseif ( canBeatWeldar < 2 ) then
        logic = 1 -- Sequence Breaking
    elseif ( has("climb") or has_legSpring() and (has_wingWhack() or has_glide()) and can_clockworkShot() ) then
        logic = 2 -- Normal Logic
    
    -- Sequence Breaking
    else
        logic = canBeatWeldar
    end
    
    return convertLogic(logic, skip)
end

function nests_GI_wasteDisposalWaterPump(skip)
    local logic = 99
    --[[        nest_waste_disposal_water_pump
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.jrl_waste_disposal(state) and self.flap_flip(state) and self.climb(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.jrl_waste_disposal(state) and self.flap_flip(state) and self.climb(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        #If someone finds a setup for a clockwork shot for these nests, I'll add it to the logic.
        logic = self.jrl_waste_disposal(state) and self.climb(state)\
                 and (self.flap_flip(state)\
                    or self.tall_jump(state) and self.flutter(state)\
                    or self.extremelyLongJump(state)\
                    or self.tall_jump(state) and self.beak_buster(state)\
                    or self.talon_trot(state) and self.flutter(state) and self.beak_buster(state)\
                )
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.jrl_waste_disposal(state) and self.climb(state)\
                 and (self.flap_flip(state)\
                    or self.tall_jump(state) and self.flutter(state)\
                    or self.extremelyLongJump(state)\
                    or self.tall_jump(state) and self.beak_buster(state)\
                    or self.talon_trot(state) and self.flutter(state) and self.beak_buster(state)\
                )
    --]]
    
    local jrlWasteDisposal = access_JRL_canEnterGIWasteDisposal(true)
    local extremelyLongJump = can_extremelyLongJump(true)
    
    if ( jrlWasteDisposal <= logictype.CurrentStage and has("fflip") and has("climb") ) then
        logic = 0 -- Normal Logic
    elseif ( jrlWasteDisposal < 2 and has("fflip") and has("climb") ) then
        logic = 1 -- Sequence Breaking
    elseif ( jrlWasteDisposal <= logictype.CurrentStage and has("climb") and (has("tjump") and has("flutter") or extremelyLongJump() <= logictype.CurrentStage or has("tjump") and has("bbust") or has("ttrot") and has("flutter") and has("bbust")) ) then
        logic = 2 -- Normal Logic
    
    -- Sequence Breaking
    elseif ( has("climb") ) then
        local normalJump = 99
        if ( has("fflip") or has("tjump") and has("flutter") or has("tjump") and has("bbust") or has("ttrot") and has("flutter") and has("bbust") ) then
            normalJump = 2
        end
        
        logic = math.max(2, jrlWasteDisposal, math.min(normalJump, extremelyLongJump))
    end
    
    return convertLogic(logic, skip)
end

function nests_GI_sewerEntrance(skip)
    local logic = 99
    --[[        nest_clinkers_lobby
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.claw_clamber_boots(state) and self.climb(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.claw_clamber_boots(state) and self.climb(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.claw_clamber_boots(state) and self.climb(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.claw_clamber_boots(state)\
            and (self.clockwork_warp(state) and (self.spring_pad(state) or self.flap_flip(state))\
                or state.can_reach_region(regionName.GIES, self.player) and self.elevator_shaft_to_floor_4(state)\
                or self.climb(state))
    --]]
    
    local giesAccessibility = Tracker:FindObjectForCode("@Region: Grunty Industries Elevator Shaft").AccessibilityLevel
    local esToF4B = connector_GIElevatorShaft_to_GIF4Back(true)
    
    -- Normal Logic
    if ( has("clawbts") and has("climb") ) then
        logic = 0
    elseif ( has("clawbts") and (can_clockworkWarp() and (has("tjump") or has("fflip")) or (giesAccessibility == AccessibilityLevel.Normal or giesAccessibility == AccessibilityLevel.Cleared) and esToF4B <= logictype.CurrentStage) ) then
        logic = 3
    
    -- Sequence Breaking
    elseif ( giesAccessibility == AccessibilityLevel.Normal or giesAccessibility == AccessibilityLevel.Cleared ) then
        logic = math.max(3, esToF4B)
    elseif ( giesAccessibility > AccessibilityLevel.None ) then
        logic = math.max(3, logictype.CurrentStage + 1, esToF4B)
    end
    
    return convertLogic(logic, skip)
end

----- Signs

function signs_GI_outside(skip)
    local logic = 99
    --[[        signpost_gi_outside
    if self.world.options.logic_type == LogicType.option_intended:
        logic = state.can_reach_region(regionName.GIO, self.player) and self.outside_gi_to_outside_back(state)\
                or state.can_reach_region(regionName.GIOB, self.player) and self.climb(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = state.can_reach_region(regionName.GIO, self.player) and self.outside_gi_to_outside_back(state)\
                or state.can_reach_region(regionName.GIOB, self.player) and self.climb(state)\
                or state.can_reach_region(regionName.GI1, self.player) and (self.split_up(state) and self.tall_jump(state) or self.leg_spring(state))\
                or state.can_reach_region(regionName.GI2, self.player) and (self.floor_2_split_up(state) and (self.tall_jump(state) or self.leg_spring(state)))\
                or state.can_reach_region(regionName.GIF, self.player)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = state.can_reach_region(regionName.GIO, self.player) and self.outside_gi_to_outside_back(state)\
                or state.can_reach_region(regionName.GIOB, self.player) and self.climb(state)\
                or state.can_reach_region(regionName.GI1, self.player) and (self.split_up(state) and self.tall_jump(state) or self.leg_spring(state))\
                or state.can_reach_region(regionName.GI2, self.player) and (self.floor_2_split_up(state) and (self.tall_jump(state) or self.leg_spring(state)))\
                or state.can_reach_region(regionName.GIF, self.player)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = state.can_reach_region(regionName.GIO, self.player) and self.outside_gi_to_outside_back(state)\
                or state.can_reach_region(regionName.GIOB, self.player) and self.climb(state)\
                or state.can_reach_region(regionName.GI1, self.player) and (self.split_up(state) and self.tall_jump(state) or self.leg_spring(state))\
                or state.can_reach_region(regionName.GI2, self.player) and (self.floor_2_split_up(state) and (self.tall_jump(state) or self.leg_spring(state)))\
                or state.can_reach_region(regionName.GIF, self.player)
    --]]
    
    local gioAccessibility = Tracker:FindObjectForCode("@Region: Outside Grunty Industries").AccessibilityLevel
    local giobAccessibility = Tracker:FindObjectForCode("@Region: Outside Grunty Industries - Behind the building").AccessibilityLevel
    local gi1Accessibility = Tracker:FindObjectForCode("@Region: Grunty Industries 1st Floor").AccessibilityLevel
    local gi2Accessibility = Tracker:FindObjectForCode("@Region: Grunty Industries 2nd Floor").AccessibilityLevel
    local gifAccessibility = Tracker:FindObjectForCode("@Region: Grunty Industries Flight").AccessibilityLevel
    local outsideToBack = connector_GIO_to_GIOBack(true)
    local floor2SplitUp = access_GI_floor2SplitUp(true)
    
    -- Normal Logic
    if ( (gioAccessibility == AccessibilityLevel.Normal or gioAccessibility == AccessibilityLevel.Cleared) and outsideToBack <= logictype.CurrentStage or (giobAccessibility == AccessibilityLevel.Normal or giobAccessibility == AccessibilityLevel.Cleared) and has("climb") ) then
        logic = 0
    elseif ( (gi1Accessibility == AccessibilityLevel.Normal or gi1Accessibility == AccessibilityLevel.Cleared) and (has("splitup") and has("tjump") or has_legSpring()) or (gi2Accessibility == AccessibilityLevel.Normal or gi2Accessibility == AccessibilityLevel.Cleared) and floor2SplitUp <= logictype.CurrentStage and (has("tjump") or has_legSpring()) or (gifAccessibility == AccessibilityLevel.Normal or gifAccessibility == AccessibilityLevel.Cleared) ) then
        logic = 1
    
    -- Sequence Breaking
    else
        local outside = 99
        if ( gioAccessibility == AccessibilityLevel.Normal or gioAccessibility == AccessibilityLevel.Cleared ) then
            outside = outsideToBack
        elseif ( gioAccessibility > AccessibilityLevel.None ) then
            outside = math.max(outsideToBack, logictype.CurrentStage + 1)
        end
        
        local outsideBack = 99
        if ( giobAccessibility > AccessibilityLevel.None and has("climb") ) then
            outsideBack = logictype.CurrentStage + 1
        end
        
        local f1 = 99
        if ( gi1Accessibility > AccessibilityLevel.None and (has("splitup") and has("tjump") or has_legSpring()) ) then
            f1 = logictype.CurrentStage + 1
        end
        
        local f2 = 99
        if ( (gi2Accessibility == AccessibilityLevel.Normal or gi2Accessibility == AccessibilityLevel.Cleared) and (has("tjump") or has_legSpring()) ) then
            f2 = floor2SplitUp
        elseif ( gi2Accessibility > AccessibilityLevel.None and (has("tjump") or has_legSpring()) ) then
            f2 = math.max(floor2SplitUp, logictype.CurrentStage + 1)
        end
        
        local flight = 99
        if ( gifAccessibility > AccessibilityLevel.None ) then
            flight = logictype.CurrentStage + 1
        end
        
        logic = math.max(1, math.min(outside, outsideBack, f1, f2, flight))
    end
    
    return convertLogic(logic, skip)
end

function signs_GI_elevatorShaft(skip)
    local logic = 99
    --[[        signpost_elevator_shaft
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.climb(state) and self.tall_jump(state) and (self.flutter(state) or self.air_rat_a_tat_rap(state))
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.climb(state) and (
                    self.flutter(state)\
                    or self.air_rat_a_tat_rap(state)\
                    or self.tall_jump(state) and self.beak_buster(state)
                )
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.climb(state) and (
                    self.flutter(state)\
                    or self.air_rat_a_tat_rap(state)\
                    or self.tall_jump(state) and self.beak_buster(state)
                )
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.climb(state) and (
                    self.flutter(state)\
                    or self.air_rat_a_tat_rap(state)\
                    or self.tall_jump(state) and self.beak_buster(state)
                )
    --]]
    
    if ( has("climb") and has("tjump") and (has("flutter") or has("arat")) ) then
        logic = 0
    elseif ( has("climb") and (has("flutter") or has("arat") or has("tjump") and has("bbust")) ) then
        logic = 1
    end
    
    return convertLogic(logic, skip)
end

----- Other - Jinjos

function jinjo_GI_legSpring(skip)
    local logic = 99
    --[[        jinjo_legspring
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.leg_spring(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.leg_spring(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.leg_spring(state) or self.clockwork_shot(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.leg_spring(state) or self.clockwork_shot(state)
    --]]
    
    if ( has_legSpring() ) then
        logic = 0
    elseif ( can_clockworkShot() ) then
        logic = 2
    end
    
    return convertLogic(logic, skip)
end

function jinjo_GI_wasteDisposalPlant(skip)
    local logic = 99
    --[[        jinjo_waste_disposal
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.talon_torpedo(state) and self.ice_eggs_item(state)\
                and self.check_mumbo_magic(state, itemName.MUMBOJR) and self.sub_aqua_egg_aiming(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.talon_torpedo(state) and self.ice_eggs_item(state)\
                and (self.check_mumbo_magic(state, itemName.MUMBOJR) or self.doubleAir(state)) and self.sub_aqua_egg_aiming(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.ice_eggs_item(state) and self.sub_aqua_egg_aiming(state) and \
                self.talon_torpedo(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.ice_eggs_item(state) and self.sub_aqua_egg_aiming(state) and \
                self.talon_torpedo(state)
    --]]
    
    if ( has("ttorp") and has("ieggs") and has("mumbojr") and has("auqaim") ) then
        logic = 0
    elseif ( has("ttorp") and has("ieggs") and has("dair") and has("auqaim") ) then
        logic = 1
    elseif ( has("ttorp") and has("ieggs") and has("auqaim") ) then
        logic = 2
    end
    
    return convertLogic(logic, skip)
end

function jinjo_GI_boiler(skip)
    local logic = 99
    --[[        jinjo_boiler
    if self.world.options.logic_type == LogicType.option_intended:
        logic = state.can_reach_region(regionName.GIF, self.player) and self.flight_to_boiler_plant(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = state.can_reach_region(regionName.GIF, self.player) and self.flight_to_boiler_plant(state)\
                or state.can_reach_region(regionName.GI3, self.player) and self.small_elevation(state) and self.leg_spring(state) and self.glide(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = state.can_reach_region(regionName.GIF, self.player) and self.flight_to_boiler_plant(state)\
                or state.can_reach_region(regionName.GI3, self.player) and self.small_elevation(state) and self.leg_spring(state) and self.glide(state)\
                or self.clockwork_shot(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = state.can_reach_region(regionName.GIF, self.player) and self.flight_to_boiler_plant(state)\
                or state.can_reach_region(regionName.GI3, self.player) and self.small_elevation(state) and self.leg_spring(state) and self.glide(state)\
                or self.clockwork_shot(state)
    --]]
    
    local gifAccessibility = Tracker:FindObjectForCode("@Region: Grunty Industries Flight").AccessibilityLevel
    local flightToBoilerPlant = connector_GIFlight_to_GIF3BoilerPlant(true)
    
    -- Normal Logic
    if ( (gifAccessibility == AccessibilityLevel.Normal or gifAccessibility == AccessibilityLevel.Cleared) and flightToBoilerPlant <= logictype.CurrentStage ) then
        logic = 0
    elseif ( can_reachSmallElevation() and has_legSpring() and has_glide() ) then
        logic = 1
    elseif ( (gifAccessibility == AccessibilityLevel.Normal or gifAccessibility == AccessibilityLevel.Cleared or logictype.CurrentStage == 0 and gifAccessibility > AccessibilityLevel.None) and flightToBoilerPlant < 2 ) then
        logic = 1 -- Sequence Breaking
    elseif ( can_clockworkShot() ) then
        logic = 2
    
    -- Sequence Breaking
    else
        local flight = 99
        if ( gifAccessibility == AccessibilityLevel.Normal or gifAccessibility == AccessibilityLevel.Cleared ) then
            flight = flightToBoilerPlant
        elseif ( gifAccessibility > AccessibilityLevel.None ) then
            flight = math.max(flightToBoilerPlant, logictype.CurrentStage + 1)
        end
        
        logic = math.max(1, flight)
    end
    
    return convertLogic(logic, skip)
end

function jinjo_GI_outside(skip)
    local logic = 99
    --[[        jinjo_gi_outside
    if self.world.options.logic_type == LogicType.option_intended:
        logic = state.can_reach_region(regionName.GI2, self.player) and self.floor_2_split_up(state)\
                and self.pack_whack(state) and (self.wing_whack(state) or self.can_shoot_any_egg(state)) and self.claw_clamber_boots(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = state.can_reach_region(regionName.GI2, self.player) and self.floor_2_split_up(state)\
                    and self.pack_whack(state) and (self.wing_whack(state) or self.can_shoot_any_egg(state)) and self.claw_clamber_boots(state)\
                or state.can_reach_region(regionName.GIR, self.player) and self.split_up(state) and (self.wing_whack(state) or self.can_shoot_any_egg(state)) # Both characters drop from the roof, Banjo gets the jinjo.
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = state.can_reach_region(regionName.GI2, self.player) and self.floor_2_split_up(state)\
                    and self.pack_whack(state) and (self.wing_whack(state) or self.can_shoot_any_egg(state)) and self.claw_clamber_boots(state)\
                or state.can_reach_region(regionName.GIR, self.player) and self.split_up(state) and (self.wing_whack(state) or self.can_shoot_any_egg(state))
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = state.can_reach_region(regionName.GI2, self.player) and self.floor_2_split_up(state)\
                    and self.pack_whack(state) and (self.wing_whack(state) or self.can_shoot_any_egg(state)) and self.claw_clamber_boots(state)\
                or state.can_reach_region(regionName.GIR, self.player) and self.split_up(state) and (self.wing_whack(state) or self.can_shoot_any_egg(state))\
                or state.can_reach_region(regionName.GIR, self.player) and self.taxi_pack(state)\
                or (state.can_reach_region(regionName.GIOB, self.player) and self.claw_clamber_boots(state) or state.can_reach_region(regionName.GIR, self.player)) and self.egg_barge(state)
     --]]
    
    local gi2Accessibility = Tracker:FindObjectForCode("@Region: Grunty Industries 2nd Floor").AccessibilityLevel
    local girAccessibility = Tracker:FindObjectForCode("@Region: Grunty Industries Roof").AccessibilityLevel
    local giobAccessibility = Tracker:FindObjectForCode("@Region: Outside Grunty Industries - Behind the building").AccessibilityLevel
    local floor2SplitUp = access_GI_floor2SplitUp(true)
    
    -- Normal Logic
    if ( (gi2Accessibility == AccessibilityLevel.Normal or gi2Accessibility == AccessibilityLevel.Cleared) and floor2SplitUp <= logictype.CurrentStage and has_packWhack() and has("clawbts") and (has_wingWhack() or can_shootEggs()) ) then
        logic = 0
    elseif ( (girAccessibility == AccessibilityLevel.Normal or girAccessibility == AccessibilityLevel.Cleared) and has("splitup") and (has_wingWhack() or can_shootEggs()) ) then
        logic = 1
    elseif ( (gi2Accessibility == AccessibilityLevel.Normal or gi2Accessibility == AccessibilityLevel.Cleared or logictype.CurrentStage == 0 and gi2Accessibility > AccessibilityLevel.None) and floor2SplitUp < 2 and has_packWhack() and has("clawbts") and (has_wingWhack() or can_shootEggs()) ) then
        logic = 1 -- Sequence Breaking
    elseif ( (gi2Accessibility == AccessibilityLevel.Normal or gi2Accessibility == AccessibilityLevel.Cleared or logictype.CurrentStage == 1 and gi2Accessibility > AccessibilityLevel.None) and floor2SplitUp < 3 and has_packWhack() and has("clawbts") and (has_wingWhack() or can_shootEggs()) ) then
        logic = 2 -- Sequence Breaking
    elseif ( (girAccessibility == AccessibilityLevel.Normal or girAccessibility == AccessibilityLevel.Cleared) and (has_taxiPack() or can_eggBarge()) or (giobAccessibility == AccessibilityLevel.Normal or giobAccessibility == AccessibilityLevel.Cleared) and has("clawbts") ) then
        logic = 3
    
    -- Sequence Breaking
    else
        local f2 = 99
        if ( (gi2Accessibility == AccessibilityLevel.Normal or gi2Accessibility == AccessibilityLevel.Cleared) and has_packWhack() and has("clawbts") and (has_wingWhack() or can_shootEggs()) ) then
            f2 = floor2SplitUp
        elseif ( gi2Accessibility > AccessibilityLevel.None and has_packWhack() and has("clawbts") and (has_wingWhack() or can_shootEggs()) ) then
            f2 = math.max(floor2SplitUp, logictype.CurrentStage + 1)
        end
        
        local roofSolo = 99
        if ( girAccessibility > AccessibilityLevel.None and has("splitup") and (has_wingWhack() or can_shootEggs()) ) then
            roofSolo = logictype.CurrentStage + 1
        end
        
        local roofOther = 99
        if ( girAccessibility > AccessibilityLevel.None and (has_taxiPack() or can_eggBarge()) ) then
            roofOther = math.max(3, logictype.CurrentStage + 1)
        end
        
        local outsideBack = 99
        if ( giobAccessibility > AccessibilityLevel.None and has("clawbts") ) then
            outsideBack = math.max(3, logictype.CurrentStage + 1)
        end
        
        logic = math.min(f2, roofSolo, roofOther, outsideBack)
    end
    
    return convertLogic(logic, skip)
end

----- Other - Glowbos

function glowbo_GI_floor3(skip)
    local logic = 99
    --[[        glowbo_floor_3
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.flap_flip(state) and self.grip_grab(state)\
                or self.climb(state) and (
                    self.tall_jump(state) and self.grip_grab(state)\
                    or self.talon_trot(state) and self.flutter(state) and self.grip_grab(state)
                )\
                or self.floor_3_split_up(state) and self.leg_spring(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.flap_flip(state) and (self.grip_grab(state) or self.beak_buster(state))\
                or self.climb(state) and (
                    self.tall_jump(state) and self.grip_grab(state)\
                    or self.talon_trot(state) and self.flutter(state) and self.grip_grab(state)
                )\
                or self.floor_3_split_up(state) and self.leg_spring(state)\
                or self.pack_whack(state) and self.floor_3_split_up(state) and self.tall_jump(state)\
                or state.can_reach_region(regionName.GI3B, self.player)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.flap_flip(state) and (self.grip_grab(state) or self.beak_buster(state))\
                or self.climb(state) and (
                    self.tall_jump(state) and self.grip_grab(state)\
                    or self.talon_trot(state) and self.flutter(state) and self.grip_grab(state)
                )\
                or self.floor_3_split_up(state) and self.leg_spring(state)\
                or self.pack_whack(state) and self.floor_3_split_up(state) and self.tall_jump(state)\
                or state.can_reach_region(regionName.GI3B, self.player)\
                or self.clockwork_shot(state)\
                or self.sack_pack(state)\
                or self.tall_jump(state) and (self.wing_whack(state) or self.glide(state))
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.flap_flip(state) and (self.grip_grab(state) or self.beak_buster(state))\
                or self.climb(state) and (
                    self.tall_jump(state) and self.grip_grab(state)\
                    or self.talon_trot(state) and self.flutter(state) and self.grip_grab(state)
                )\
                or self.floor_3_split_up(state) and self.leg_spring(state)\
                or self.pack_whack(state) and self.floor_3_split_up(state) and self.tall_jump(state)\
                or state.can_reach_region(regionName.GI3B, self.player)\
                or self.clockwork_shot(state)\
                or self.sack_pack(state)\
                or self.tall_jump(state) and (self.wing_whack(state) or self.glide(state))
     --]]
     
    local gi3bpAccessibility = Tracker:FindObjectForCode("@Region: Grunty Industries 3rd Floor - Boiler Plant").AccessibilityLevel
    local floor3SplitUp = access_GI_floor3SplitUp(true)
    
    -- Normal Logic
    if ( has("fflip") and has("ggrab") or has("climb") and has("ggrab") and (has("tjump") or has("ttrot") and has("flutter")) or floor3SplitUp <= logictype.CurrentStage and has_legSpring() ) then
        logic = 0
    elseif ( has("fflip") and has("bbust") or floor3SplitUp <= logictype.CurrentStage and has_packWhack() and has("tjump") or (gi3bpAccessibility == AccessibilityLevel.Normal or gi3bpAccessibility == AccessibilityLevel.Cleared) ) then
        logic = 1
    elseif ( floor3SplitUp < 2 and has_legSpring() ) then
        logic = 1 -- Sequence Breaking
    elseif ( can_clockworkShot() or has_sackPack() or has("tjump") and (has_wingWhack() or has_glide()) ) then
        logic = 2
    
    -- Sequence Breaking
    else
        local f3SU = 99
        if ( has_legSpring() or has_packWhack() and has("tjump") ) then
            f3SU = math.max(1, floor3SplitUp)
        end
        
        local gi3bp = 99
        if ( gi3bpAccessibility > AccessibilityLevel.None ) then
            gi3bp = logictype.CurrentStage + 1
        end
        
        logic = math.min(f3SU, gi3bp)
    end
    
    return convertLogic(logic, skip)
end

----- Other - Honeycombs

function honeycomb_GI_floor3(skip)
    local logic = 99
    --[[        honeycomb_floor3
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.flap_flip(state) and self.grip_grab(state) and self.spring_pad(state)\
                or self.climb(state) and self.spring_pad(state) and (
                    self.tall_jump(state) and self.grip_grab(state)\
                    or self.talon_trot(state) and self.flutter(state) and self.grip_grab(state)                     -- this is redundant; both sides need grip grab and tall jump is already a requirement for spring pad
                )\
                or self.floor_3_split_up(state) and self.leg_spring(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.flap_flip(state) and (self.grip_grab(state) or self.beak_buster(state)) and self.spring_pad(state)\
                or self.climb(state) and self.spring_pad(state) and (
                    self.tall_jump(state) and self.grip_grab(state)\
                    or self.talon_trot(state) and self.flutter(state) and self.grip_grab(state)
                )\
                or self.pack_whack(state) and self.floor_3_split_up(state) and self.tall_jump(state)\
                or self.floor_3_split_up(state) and self.leg_spring(state)

    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.flap_flip(state) and (self.grip_grab(state) or self.beak_buster(state)) and self.spring_pad(state)\
                or self.climb(state) and self.spring_pad(state) and (
                    self.tall_jump(state) and self.grip_grab(state)\
                    or self.talon_trot(state) and self.flutter(state) and self.grip_grab(state)
                )\
                or self.pack_whack(state) and self.floor_3_split_up(state) and self.tall_jump(state)\
                or self.floor_3_split_up(state) and self.leg_spring(state)\
                or self.floor_3_split_up(state) and self.tall_jump(state) and (self.wing_whack(state) or self.glide(state))\
                or self.clockwork_shot(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.flap_flip(state) and (self.grip_grab(state) or self.beak_buster(state)) and self.spring_pad(state)\
                or self.climb(state) and self.spring_pad(state) and (
                    self.tall_jump(state) and self.grip_grab(state)\
                    or self.talon_trot(state) and self.flutter(state) and self.grip_grab(state)
                )\
                or self.pack_whack(state) and self.floor_3_split_up(state) and self.tall_jump(state)\
                or self.floor_3_split_up(state) and self.leg_spring(state)\
                or self.floor_3_split_up(state) and self.tall_jump(state) and (self.wing_whack(state) or self.glide(state))\
                or self.clockwork_shot(state)
     --]]
     
    local floor3SplitUp = access_GI_floor3SplitUp(true)
    
    -- Normal Logic
    if ( has("tjump") and has("ggrab") and (has("fflip") or has("climb")) or floor3SplitUp <= logictype.CurrentStage and has_legSpring() ) then
        logic = 0
    elseif ( has("tjump") and has("bbust") and has("fflip") or floor3SplitUp <= logictype.CurrentStage and has_packWhack() and has("tjump") ) then
        logic = 1
    elseif ( floor3SplitUp < 2 and (has_legSpring() or has_packWhack() and has("tjump")) ) then
        logic = 1 -- Sequence Breaking
    elseif ( can_clockworkShot() or floor3SplitUp <= logictype.CurrentStage and (has_wingWhack() or has_glide()) and has("tjump") ) then
        logic = 2
        
    -- Sequence Breaking
    elseif ( has_legSpring() or has("tjump") and (has_packWhack() or has_wingWhack() or has_glide()) ) then
        logic = math.max(2, floor3SplitUp)
    end
    
    return convertLogic(logic, skip)
end

function honeycomb_GI_trainStation(skip)
    local logic = 99
    --[[        honeycomb_gi_station
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.grip_grab(state) and self.ground_attack(state) and self.spring_pad(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.ground_attack(state) and self.spring_pad(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = (self.ground_attack(state) and self.spring_pad(state)) or self.clockwork_shot(state) or self.leg_spring(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = (self.ground_attack(state) and self.spring_pad(state)) or self.clockwork_shot(state) or self.leg_spring(state)
    --]]
    
    if ( has("ggrab") and can_groundAttack() and has("tjump") ) then
        logic = 0
    elseif ( can_groundAttack() and has("tjump") ) then
        logic = 1
    elseif ( can_clockworkShot() or has_legSpring() ) then
        logic = 2
    end
    
    return convertLogic(logic, skip)
end

----- Other - Cheato Pages

function cheato_GI_loggo(skip)
    local logic = 99
    --[[        cheato_loggo
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.has_explosives(state) and self.bill_drill(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.has_explosives(state) and\
                (self.grenade_eggs(state)\
                 or self.bill_drill(state)\
                 or self.breegull_bash(state)\
                 or self.beak_barge(state)\
                 or self.pack_whack(state))
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.has_explosives(state) and\
                (self.grenade_eggs(state)\
                 or self.bill_drill(state)\
                 or self.breegull_bash(state)\
                 or self.beak_barge(state)\
                 or self.pack_whack(state))
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.has_explosives(state) and\
                (self.grenade_eggs(state)\
                 or self.bill_drill(state)\
                 or self.breegull_bash(state)\
                 or self.beak_barge(state)\
                 or self.pack_whack(state))
    --]]
    
    local explosives = can_shootExplosiveEggs(true)
    
    -- Normal Logic
    if ( explosives <= logictype.CurrentStage and has_billDrill() ) then
        logic = 0
    elseif ( explosives <= logictype.CurrentStage and (can_shootEggs("geggs") or has_breegullBash() or has("bbarge") or has_packWhack()) ) then
        logic = 1
        
    -- Sequence Breaking
    elseif ( has_billDrill() or has_breegullBash() or has("bbarge") or has_packWhack() ) then
        logic = math.max(1, explosives)
    end
    
    return convertLogic(logic, skip)
end

function cheato_GI_window(skip)
    local logic = 99
    --[[        cheato_window
    if self.world.options.logic_type == LogicType.option_intended:
        logic = state.can_reach_region(regionName.GIF, self.player) and (self.egg_aim(state) or self.airborne_egg_aiming(state) or self.beak_bomb(state))
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = state.can_reach_region(regionName.GIF, self.player) and (self.egg_aim(state) or self.airborne_egg_aiming(state) or self.beak_bomb(state))\
                or state.can_reach_region(regionName.GI1, self.player) and self.leg_spring(state) and self.claw_clamber_boots(state) and self.wing_whack(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = state.can_reach_region(regionName.GIF, self.player) and (self.egg_aim(state) or self.airborne_egg_aiming(state) or self.beak_bomb(state))\
                or state.can_reach_region(regionName.GI1, self.player) and self.leg_spring(state) and self.claw_clamber_boots(state) and self.wing_whack(state)\
                or self.clockwork_shot(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = state.can_reach_region(regionName.GIF, self.player) and (self.egg_aim(state) or self.airborne_egg_aiming(state) or self.beak_bomb(state))\
                or state.can_reach_region(regionName.GI1, self.player) and self.leg_spring(state) and self.claw_clamber_boots(state) and self.wing_whack(state)\
                or state.can_reach_region(regionName.GI2, self.player) and self.clockwork_shot(state) and self.floor_2_split_up(state)\                          -- this is redundant since a clockwork shot alone is enough
                or self.clockwork_shot(state)
    --]]
    
    local gifAccessibility = Tracker:FindObjectForCode("@Region: Grunty Industries Flight").AccessibilityLevel
    local gi1Accessibility = Tracker:FindObjectForCode("@Region: Grunty Industries 1st Floor").AccessibilityLevel
    
    -- Normal Logic
    if ( (gifAccessibility == AccessibilityLevel.Normal or gifAccessibility == AccessibilityLevel.Cleared) and (has("eggaim") or has("aireaim") or has("bbomb")) ) then
        logic = 0
    elseif ( (gi1Accessibility == AccessibilityLevel.Normal or gi1Accessibility == AccessibilityLevel.Cleared) and has_legSpring() and has("clawbts") and has_wingWhack() ) then
        logic = 1
    elseif ( logictype.CurrentStage == 0 and gifAccessibility > AccessibilityLevel.None and (has("eggaim") or has("aireaim") or has("bbomb")) ) then
        logic = 1 -- Sequence Breaking
    elseif ( can_clockworkShot() ) then
        logic = 2
    
    -- Sequence Breaking
    else
        local flight = 99
        if ( gifAccessibility > AccessibilityLevel.None and (has("eggaim") or has("aireaim") or has("bbomb")) ) then
            flight = logictype.CurrentStage + 1
        end
        
        local f1 = 99
        if ( gi1Accessibility > AccessibilityLevel.None and has_legSpring() and has("clawbts") and has_wingWhack() ) then
            f1 = math.max(2, logictype.CurrentStage + 1)
        end
        
        logic = math.min(f1, flight)
    end
    
    return convertLogic(logic, skip)
end

----- Other

function other_GI_skivvyWorkersQuarters(skip)
    local logic = 99
    --[[        skivvy_worker_quarters
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.humbaGI(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.humbaGI(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.humbaGI(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.humbaGI(state)
    --]]
    
    logic = access_GI_humba(true)
    
    return convertLogic(logic, skip)
end

function other_GI_skivvyFloor1(skip)
    local logic = 99
    --[[        skivvy_floor_1
     if self.world.options.logic_type == LogicType.option_intended:
        logic = self.humbaGI(state) and self.bill_drill(state)\
                and state.can_reach_region(regionName.GIF, self.player) and (self.airborne_egg_aiming(state) or self.beak_bomb(state))
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.humbaGI(state) and self.bill_drill(state)\
                and state.can_reach_region(regionName.GIF, self.player) and (self.airborne_egg_aiming(state) or self.beak_bomb(state) \
                    or self.egg_aim(state))
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.humbaGI(state) and self.bill_drill(state)\
                and state.can_reach_region(regionName.GIF, self.player) and (self.airborne_egg_aiming(state) or self.beak_bomb(state) \
                    or self.egg_aim(state))
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.humbaGI(state) and self.bill_drill(state)\
                and state.can_reach_region(regionName.GIF, self.player) and (self.airborne_egg_aiming(state) or self.beak_bomb(state) \
                    or self.egg_aim(state))
    --]]
    
    local gifAccessibility = Tracker:FindObjectForCode("@Region: Grunty Industries Flight").AccessibilityLevel
    local humba = access_GI_humba(true)
    local skivvySwitch = access_GI_floor2SkivvySwitch(true)
    
    -- Normal Logic
    if ( humba <= logictype.CurrentStage and has_billDrill() and (gifAccessibility == AccessibilityLevel.Normal or gifAccessibility == AccessibilityLevel.Cleared) and (has("aireaim") or has("bbomb")) ) then
        logic = 0
    elseif ( humba <= logictype.CurrentStage and has_billDrill() and (gifAccessibility == AccessibilityLevel.Normal or gifAccessibility == AccessibilityLevel.Cleared) and has("eggaim") ) then
        logic = 1
    
    -- Sequence Breaking
    elseif ( has_billDrill() and (gifAccessibility == AccessibilityLevel.Normal or gifAccessibility == AccessibilityLevel.Cleared) and (has("aireaim") or has("bbomb") or has("eggaim")) ) then
        logic = math.max(1, humba)
    elseif ( has_billDrill() and gifAccessibility > AccessibilityLevel.None and (has("aireaim") or has("bbomb")) ) then
        logic = math.max(logictype.CurrentStage + 1, humba)
    end
    
    return convertLogic(logic, skip)
end

function other_GI_skivvyFloor2(skip)
    local logic = 99
    --[[        skivvy_floor_2
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.humbaGI(state) and self.floor_2_skivvy_switch(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.humbaGI(state) and self.floor_2_skivvy_switch(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.humbaGI(state) and self.floor_2_skivvy_switch(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.humbaGI(state) and self.floor_2_skivvy_switch(state)
    --]]
    
    local humba = access_GI_humba(true)
    local skivvySwitch = access_GI_floor2SkivvySwitch(true)
    
    -- Normal Logic
    if ( humba <= logictype.CurrentStage and skivvySwitch <= logictype.CurrentStage ) then
        logic = 0
    
    -- Sequence Breaking
    else
        logic = math.max(humba, skivvySwitch)
    end
    
    return convertLogic(logic, skip)
end

function other_GI_skivvyFloor3(skip)
    local logic = 99
    --[[        skivvy_floor_3
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.humbaGI(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.humbaGI(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.humbaGI(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.humbaGI(state)
    --]]
    
    logic = access_GI_humba(true)
    
    return convertLogic(logic, skip)
end

function other_GI_skivvyFloor5(skip)
    local logic = 99
    --[[        skivvy_floor_5
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.humbaGI(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.humbaGI(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.humbaGI(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.humbaGI(state)
    --]]
    
    logic = access_GI_humba(true)
    
    return convertLogic(logic, skip)
end

function other_GI_skivvyOutsideBack(skip)
    local logic = 99
    --[[        skivvy_outside
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.humbaGI(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.humbaGI(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.humbaGI(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.humbaGI(state)
    --]]
    
    logic = access_GI_humba(true)
    
    return convertLogic(logic, skip)
end



--------------- Hailfire Peaks

----- Basic & Access functions

function access_HFP_canCoolHotWater(skip)
    local logic = 99
    --[[        HFP_hot_water_cooled
    if self.world.options.backdoors:
        return state.can_reach_region(regionName.HP, self.player) and\
           self.split_up(state) and\
           (self.dive(state) or self.shack_pack(state))
    else:
        return state.can_reach_region(regionName.HP, self.player) and\
           state.can_reach_region(regionName.CC, self.player) and \
           self.split_up(state) and\
           self.ground_attack(state) and\
           (self.dive(state) or self.shack_pack(state))
    --]]
    
    if ( has("splitup") and (has("dive") or has_shackPack()) ) then
        local hfpAccessibility = Tracker:FindObjectForCode("@Region: Hailfire Peaks - Lava Side").AccessibilityLevel
        
        if ( has("backdoorsopen_on") ) then
            -- Normal Logic
            if ( hfpAccessibility == AccessibilityLevel.Normal or hfpAccessibility == AccessibilityLevel.Cleared ) then
                logic = 0
                
            -- Sequence Breaking
            elseif ( hfpAccessibility > AccessibilityLevel.None ) then
                logic = logictype.CurrentStage + 1 -- was already converted once by the json
            end
        else
            local ccAccessibility = Tracker:FindObjectForCode("@Region: Cloud Cuckooland").AccessibilityLevel
            
            -- Normal Logic
            if ( (hfpAccessibility == AccessibilityLevel.Normal or hfpAccessibility == AccessibilityLevel.Cleared) and (ccAccessibility == AccessibilityLevel.Normal or ccAccessibility == AccessibilityLevel.Cleared) ) then
                logic = 0
                
            -- Sequence Breaking
            elseif ( hfpAccessibility > AccessibilityLevel.None and ccAccessibility > AccessibilityLevel.None ) then
                logic = logictype.CurrentStage + 1 -- was already converted once by the json
            end
        end
    end
    
    return convertLogic(logic, skip)
end

function access_HFP_lavaSideTop(skip)
    local logic = 99
    --[[        hfp_top
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.small_elevation(state)\
            or self.flight_pad(state)\
            or (state.can_reach_region(regionName.CHUFFY, self.player) and state.has(itemName.TRAINSWHP1, self.player))\
            or self.has_explosives(state)\
            or self.warp_to_hfp_top(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.small_elevation(state)\
            or self.flight_pad(state)\
            or state.can_reach_region(regionName.CHUFFY, self.player) and state.has(itemName.TRAINSWHP1, self.player)\
            or self.has_explosives(state)\
            or state.has(itemName.MUMBOHP, self.player)\
            or self.dragon_kazooie(state)\
            or self.warp_to_hfp_top(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.small_elevation(state)\
            or self.flight_pad(state)\
            or self.split_up(state)\
            or state.can_reach_region(regionName.CHUFFY, self.player) and state.has(itemName.TRAINSWHP1, self.player)\
            or self.has_explosives(state)\
            or state.has(itemName.MUMBOHP, self.player)\
            or self.dragon_kazooie(state)\
            or self.warp_to_hfp_top(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.small_elevation(state)\
            or self.flight_pad(state)\
            or self.split_up(state)\
            or state.can_reach_region(regionName.CHUFFY, self.player) and state.has(itemName.TRAINSWHP1, self.player)\
            or self.has_explosives(state)\
            or state.has(itemName.MUMBOHP, self.player)\
            or self.dragon_kazooie(state)\
            or self.warp_to_hfp_top(state)
            
    state.has(itemName.WARPHP1, self.player) and (
            state.has(itemName.WARPHP2, self.player)\
            or state.has(itemName.WARPHP3, self.player)\
            or state.has(itemName.WARPHP4, self.player)\
            or state.has(itemName.WARPHP5, self.player)\
        )
    --]]
    
    local chuffyAccessibility = Tracker:FindObjectForCode("@Region: Inside Chuffy").AccessibilityLevel
    local explosives = can_shootExplosiveEggs(true)
    local dragonKazooie = can_getDragonKazooie(true)
    
    -- Normal Logic
    if ( can_reachSmallElevation() or has("fpad") or (chuffyAccessibility == AccessibilityLevel.Normal or chuffyAccessibility == AccessibilityLevel.Cleared) and has("trainswhp1") or explosives <= logictype.CurrentStage or has("warphp1") and (has("warphp2") or has("warphp3") or has("warphp4") or has("warphp5")) ) then
        logic = 0
    elseif ( has("mumbohp") or dragonKazooie <= logictype.CurrentStage ) then
        logic = 1
    elseif ( logictype.CurrentStage == 0 and chuffyAccessibility > AccessibilityLevel.None and has("trainswhp1") or explosives < 2 ) then
        logic = 1 -- Sequence Breaking
    elseif ( has("splitup") ) then
        logic = 2
    
    -- Sequence Breaking
    else
        local chuffy = 99
        if ( chuffyAccessibility > AccessibilityLevel.None ) then
            chuffy = logictype.CurrentStage + 1
        end
        
        logic = math.max(1, math.min(chuffy, explosives, dragonKazooie))
    end
    
    return convertLogic(logic, skip)
end

function access_HFP_humba(skip)
    local logic = 99
    --[[
    self.hfp_top(state) and state.has(itemName.HUMBAHP, self.player)
    --]]
    
    local top = access_HFP_lavaSideTop(true)
    
    -- Normal Logic
    if ( has("humbahp") and top <= logictype.CurrentStage ) then
        logic = 0
    
    -- Sequence Breaking
    elseif ( has("humbahp") ) then
        logic = top
    end
    
    return convertLogic(logic, skip)
end

function access_HFP_canBreakIceCubesAsSoloKazooie(skip)
    local logic = 99
    --[[
    self.split_up(state) and (self.has_explosives(state) or self.fire_eggs(state) or self.blue_eggs(state) or self.wing_whack(state))
    --]]
    
    local explosives = can_shootExplosiveEggs(true)
    
    -- Normal Logic
    if ( has("splitup") and (explosives <= logictype.CurrentStage or can_shootEggs("feggs") or can_shootEggs("begg") or has_wingWhack()) ) then
        logic = 0
    
    -- Sequence Breaking
    elseif ( has("splitup") ) then
        logic = explosives
    end
    
    return convertLogic(logic, skip)
end

function access_HFP_canBreakIceCubesAsPair(skip)
    local logic = 99
    --[[
    self.blue_eggs(state) or self.fire_eggs(state) or self.has_explosives(state) or self.beak_barge(state) or self.roll(state)\
            or self.air_rat_a_tat_rap(state) or self.ground_rat_a_tat_rap(state) or self.beak_buster(state) or self.breegull_bash(state) or self.wonderwing(state)          -- checking for breegull bash is redundant
    --]]
    
    local explosives = can_shootExplosiveEggs(true)
    
    -- Normal Logic
    if ( can_shootEggs("begg") or can_shootEggs("feggs") or explosives <= logictype.CurrentStage or has("bbarge") or has("roll") or has("arat") or has("grat") or has("bbust") or has("wwing") ) then
        logic = 0
    
    -- Sequence Breaking
    else
        logic = explosives
    end
    
    return convertLogic(logic, skip)
end

function access_HFP_icySideTrainStation(skip)
    local logic = 99
    --[[        access_ice_train_station
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.can_beat_king_coal(state) and self.grenade_eggs(state) and \
                state.has(itemName.TRAINSWHP1, self.player) and state.has(itemName.TRAINSWHP2, self.player) and \
                self.egg_aim(state) and state.can_reach_region(regionName.WW, self.player)\
                and self.beak_buster(state)\
                and (self.claw_clamber_boots(state) or self.flight_pad(state))
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.can_beat_king_coal(state) and self.grenade_eggs(state) and \
                state.has(itemName.TRAINSWHP1, self.player) and state.has(itemName.TRAINSWHP2, self.player) and \
                state.can_reach_region(regionName.WW, self.player) and self.beak_buster(state)\
                and (self.claw_clamber_boots(state) or self.flight_pad(state))
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.can_beat_king_coal(state) and self.grenade_eggs(state) and \
                state.has(itemName.TRAINSWHP1, self.player) and state.has(itemName.TRAINSWHP2, self.player) and \
                state.can_reach_region(regionName.WW, self.player) and self.beak_buster(state)\
                and (self.claw_clamber_boots(state) or self.flight_pad(state))
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.can_beat_king_coal(state) and self.grenade_eggs(state) and \
                state.has(itemName.TRAINSWHP1, self.player) and state.has(itemName.TRAINSWHP2, self.player) and \
                state.can_reach_region(regionName.WW, self.player) and self.beak_buster(state)\
                and (self.claw_clamber_boots(state) or self.flight_pad(state))
     --]]
    
    local wwAccessibility = Tracker:FindObjectForCode("@Region: Witchyworld - Main Area").AccessibilityLevel
    local canBeatKingCoal = chuffy_canBeatKingCoal(true)
    
    -- Normal Logic
    if ( canBeatKingCoal <= logictype.CurrentStage and can_shootEggs("geggs") and has("trainswhp1") and has("trainswhp2") and has("eggaim") and (wwAccessibility == AccessibilityLevel.Normal or wwAccessibility == AccessibilityLevel.Cleared) and has("bbust") and (has("clawbts") or has("fpad")) ) then
        logic = 0
    elseif ( canBeatKingCoal <= logictype.CurrentStage and can_shootEggs("geggs") and has("trainswhp1") and has("trainswhp2") and (wwAccessibility == AccessibilityLevel.Normal or wwAccessibility == AccessibilityLevel.Cleared) and has("bbust") and (has("clawbts") or has("fpad")) ) then
        logic = 1
    
    -- Sequence Breaking
    elseif ( can_shootEggs("geggs") and has("trainswhp1") and has("trainswhp2") and (wwAccessibility == AccessibilityLevel.Normal or wwAccessibility == AccessibilityLevel.Cleared) and has("bbust") and (has("clawbts") or has("fpad")) ) then
        logic = math.max(1, canBeatKingCoal)
    elseif ( can_shootEggs("geggs") and has("trainswhp1") and has("trainswhp2") and wwAccessibility > AccessibilityLevel.None and has("bbust") and (has("clawbts") or has("fpad")) ) then
        logic = math.max(logictype.CurrentStage + 1, canBeatKingCoal)
    end
    
    return convertLogic(logic, skip)
end

----- Silos

function silo_HFP_shackPack(skip)
    local logic = 99
    --[[
    self.split_up(state) and self.check_notes(state, locationName.SHPACK)
    --]]
    
    if ( shpack_count() and has("splitup") ) then
        logic = 0
    end
    
    return convertLogic(logic, skip)
end

function silo_HFP_glide(skip)
    local logic = 99
    --[[
    self.can_access_glide_silo(state) and self.check_notes(state, locationName.GLIDE)
    
    if self.world.options.logic_type == LogicType.option_intended:
        # Through icicle grotto
        logic = self.hfp_top(state) and self.split_up(state) and self.grenade_eggs(state) and self.egg_aim(state) and self.spring_pad(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.split_up(state) and (self.tall_jump(state) or self.wing_whack(state) or self.glide(state) or self.leg_spring(state))
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.split_up(state) and (self.tall_jump(state) or self.wing_whack(state) or self.glide(state) or self.leg_spring(state))
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.split_up(state) and (self.tall_jump(state) or self.wing_whack(state) or self.glide(state) or self.leg_spring(state))
    --]]
    
    local top = access_HFP_lavaSideTop(true)
    
    if ( glide_count() and has("splitup") ) then
        -- Normal Logic
        if ( top <= logictype.CurrentStage and has("geggs") and has("eggaim") and has("tjump") ) then
            logic = 0
        elseif ( has("tjump") or has_wingWhack() or has_glide() or has_legSpring() ) then
            logic = 1
        
        -- Sequence Breaking
        elseif ( has("geggs") and has("eggaim") and has("tjump") ) then
            logic = top
        end
    end
    
    return convertLogic(logic, skip)
end

----- Warp Pads

function warp_HFP_icicleGrotto(skip)
    local logic = 99
    --[[        warp_pad_icicle_grotto
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.hfp_top(state) and self.spring_pad(state) and self.talon_trot(state)\
                or self.hfp_top(state) and self.spring_pad(state) and self.split_up(state)\
                or self.warp_to_icicle_grotto(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.split_up(state) and (self.tall_jump(state) or self.wing_whack(state) or self.glide(state) or self.leg_spring(state))\
                or self.hfp_top(state) and self.spring_pad(state) and self.talon_trot(state)\
                or self.warp_to_icicle_grotto(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.split_up(state) and (self.tall_jump(state) or self.wing_whack(state) or self.glide(state) or self.leg_spring(state))\
                or self.hfp_top(state) and self.spring_pad(state) and self.talon_trot(state)\
                or (self.extremelyLongJump(state) and self.clockwork_shot(state))\
                or self.warp_to_icicle_grotto(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.split_up(state) and (self.tall_jump(state) or self.wing_whack(state) or self.glide(state) or self.leg_spring(state))\
                or self.hfp_top(state) and self.spring_pad(state) and self.talon_trot(state)\
                or (self.extremelyLongJump(state) and self.clockwork_shot(state))\
                or self.warp_to_icicle_grotto(state)
                
    return state.has(itemName.WARPHP5, self.player) and (
            state.has(itemName.WARPHP1, self.player)\
            or state.has(itemName.WARPHP2, self.player) and self.hfp_top(state)\
            or state.has(itemName.WARPHP3, self.player) and self.hfp_top(state)\
            or state.has(itemName.WARPHP4, self.player) and self.hfp_top(state)\
        )
    --]]
    
    local top = access_HFP_lavaSideTop(true)
    local extremelyLongJump = can_extremelyLongJump(true)
    
    -- Normal Logic
    if ( top <= logictype.CurrentStage and (has("tjump") and has("ttrot") or has("tjump") and has("splitup") or has("warphp5") and (has("warphp2") or has("warphp3") or has("warphp4"))) or has("warphp5") and has("warphp1") ) then
        logic = 0
    elseif ( has("splitup") and (has("tjump") and has("ttrot") or has("tjump") and has("splitup") or has("warphp5") and (has("warphp2") or has("warphp3") or has("warphp4"))) ) then
        logic = 1
    elseif ( top < 2 and (has("tjump") and has("ttrot") or has("tjump") and has("splitup")) ) then
        logic = 1 -- Sequence Breaking
    elseif ( extremelyLongJump <= logictype.CurrentStage and can_clockworkShot() ) then
        logic = 2
    
    -- Sequence Breaking
    else
        local fromTop = 99
        if ( has("tjump") and has("ttrot") or has("tjump") and has("splitup") or has("warphp5") and (has("warphp2") or has("warphp3") or has("warphp4")) ) then
            fromTop = top
        end
        
        local clockwork = 99
        if ( can_clockworkShot() ) then
            clockwork = math.max(2, extremelyLongJump)
        end
        
        logic = math.min(fromTop, clockwork)
    end
    
    return convertLogic(logic, skip)
end

----- Jiggies

function jiggy_HFP_dragonBrothers(skip)
    local logic = 99
    --[[        jiggy_dragons_bros
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.fire_eggs(state) and self.ice_eggs(state) and \
                self.claw_clamber_boots(state) and self.flight_pad(state) and self.third_person_egg_shooting(state)\
                and (self.tall_jump(state) or self.talon_trot(state))\
                and self.climb(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.fire_eggs(state) and self.ice_eggs(state) and \
                self.claw_clamber_boots(state) and self.flight_pad(state) and self.third_person_egg_shooting(state)\
                and (self.tall_jump(state) or self.talon_trot(state))\
                and (self.climb(state)\
                    or self.flap_flip(state)\
                    or self.tall_jump(state) and self.grip_grab(state)\
                    or self.talon_trot(state) and self.grip_grab(state))
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        # In case people go for the damage boost for Chilly Willy then die before getting the jiggy, we also require Pack Whack to prevent softlocks.
        logic = self.fire_eggs(state) and self.ice_eggs(state) and self.flight_pad(state) and self.third_person_egg_shooting(state)\
                and self.pack_whack(state)\
                and (self.claw_clamber_boots(state)\
                    or ((self.tall_jump(state) and self.roll(state) or self.talon_trot(state))\
                        and (self.flutter(state) or self.air_rat_a_tat_rap(state))\
                        and self.grip_grab(state)
                    )
                )\
                and (self.tall_jump(state) or self.talon_trot(state))\
                and (self.climb(state)\
                    or self.flap_flip(state)\
                    or self.tall_jump(state) and self.grip_grab(state)\
                    or self.talon_trot(state) and self.grip_grab(state)
                )
    elif self.world.options.logic_type == LogicType.option_glitches:
        # In case people go for the damage boost for Chilly Willy then die before getting the jiggy, we also require Pack Whack to prevent softlocks.
        logic = self.fire_eggs(state) and self.ice_eggs(state) and self.flight_pad(state) and self.third_person_egg_shooting(state)\
                and self.pack_whack(state)\
                and (self.claw_clamber_boots(state)\
                    or ((self.tall_jump(state) and self.roll(state) or self.talon_trot(state))\
                        and (self.flutter(state) or self.air_rat_a_tat_rap(state))\
                        and self.grip_grab(state)
                    )
                )\
                and (self.tall_jump(state) or self.talon_trot(state))\
                and (self.climb(state)\
                    or self.flap_flip(state)\
                    or self.tall_jump(state) and self.grip_grab(state)\
                    or self.talon_trot(state) and self.grip_grab(state)
                )
    --]]
    
    -- Logic is a little weird on this one because as it states, pack whack is required on hard tricks or harder in order to prevent softlocks. I'll make sure that's reflected here
    
    if ( has("feggs") and has("ieggs") and has("clawbts") and has("fpad") and has("eggshoot") and has("climb") and (has("tjump") or has("ttrot")) ) then
        logic = 0
    elseif ( has("feggs") and has("ieggs") and has("clawbts") and has("fpad") and has("eggshoot") and (has("tjump") or has("ttrot")) and (has("climb") or has("fflip") or has("tjump") and has("ggrab") or has("ttrot") and has("ggrab")) ) then
        logic = 1
    elseif ( has_packWhack() and has("feggs") and has("ieggs") and has("fpad") and has("eggshoot") and (has("clawbts") or (has("tjump") and has("roll") or has("ttrot")) and (has("flutter") or has("arat")) and has("ggrab")) and (has("tjump") or has("ttrot")) and (has("climb") or has("fflip") or has("tjump") and has("ggrab") or has("ttrot") and has("ggrab")) ) then
        logic = 2
    end
    
    return convertLogic(logic, skip)
end

function jiggy_HFP_volcano(skip)
    local logic = 99
    --[[        jiggy_volcano
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.long_jump(state) and self.hfp_top(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.long_jump(state) and self.hfp_top(state) or self.split_up(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.long_jump(state) and self.hfp_top(state) or self.split_up(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.long_jump(state) and self.hfp_top(state) or self.split_up(state)
    --]]
    
    local top = access_HFP_lavaSideTop(true)
    
    -- Normal Logic
    if ( can_longJump() and top <= logictype.CurrentStage ) then
        logic = 0
    elseif ( has("splitup") ) then
        logic = 1
    
    -- Sequence Breaking
    elseif ( can_longJump() ) then
        logic = top
    end
    
    return convertLogic(logic, skip)
end

function jiggy_HFP_sabreman(skip)
    local logic = 99
    --[[        jiggy_sabreman
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.check_mumbo_magic(state, itemName.MUMBOHP) and self.fire_eggs(state) and \
                self.taxi_pack(state) and self.tall_jump(state) and self.hfp_top(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.check_mumbo_magic(state, itemName.MUMBOHP) and self.has_fire(state) and \
                self.taxi_pack(state) and self.tall_jump(state) and self.hfp_top(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.check_mumbo_magic(state, itemName.MUMBOHP) and self.has_fire(state) and \
                self.taxi_pack(state) and self.tall_jump(state) and self.hfp_top(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.check_mumbo_magic(state, itemName.MUMBOHP) and self.has_fire(state) and \
                self.taxi_pack(state) and self.tall_jump(state) and self.hfp_top(state)
    --]]
    
    local top = access_HFP_lavaSideTop(true)
    local hasFire = can_useFire(true)
    
    -- Normal Logic
    if ( has("mumbohp") and can_shootEggs("feggs") and has_taxiPack() and has("tjump") and top <= logictype.CurrentStage ) then
        logic = 0
    elseif ( has("mumbohp") and hasFire <= logictype.CurrentStage and has_taxiPack() and has("tjump") and top <= logictype.CurrentStage ) then
        logic = 1
    
    -- Sequence Breaking
    elseif ( has("mumbohp") and has_taxiPack() and has("tjump") ) then
        logic = math.max(1, hasFire, top)
    end
    
    return convertLogic(logic, skip)
end

function jiggy_HFP_boggy(skip)
    local logic = 99
    --[[        jiggy_boggy
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.hfp_top(state) and self.shack_pack(state) and self.small_elevation(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.hfp_top(state) and self.shack_pack(state) and self.small_elevation(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.hfp_top(state) and self.shack_pack(state) and self.small_elevation(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.hfp_top(state) and \
                (self.shack_pack(state)\
                 or (self.clockwork_eggs(state) and self.third_person_egg_shooting(state) and (self.talon_trot(state) or self.flap_flip(state) or self.dive(state) and self.tall_jump(state)))\
                 or self.leg_spring(state))
    --]]
    
    local top = access_HFP_lavaSideTop(true)
    
    if ( top <= logictype.CurrentStage and has_shackPack() and can_reachSmallElevation() ) then
        logic = 0 -- Normal Logic
    elseif ( top < 3 and has_shackPack() and can_reachSmallElevation() ) then
        logic = top -- Sequence Breaking
    elseif ( top <= logictype.CurrentStage and (has_shackPack() or has_legSpring() or can_shootEggs("ceggs") and has("eggshoot") and (has("ttrot") or has("fflip") or has("dive") and has("tjump"))) ) then
        logic = 3 -- Normal Logic
    
    -- Sequence Breaking
    elseif ( has_shackPack() or has_legSpring() or can_shootEggs("ceggs") and has("eggshoot") and (has("ttrot") or has("fflip") or has("dive") and has("tjump")) ) then
        logic = math.max(3, top)
    end
    
    return convertLogic(logic, skip)
end

function jiggy_HFP_iceSideTrainStation(skip)
    local logic = 99
    --[[        jiggy_ice_station
     if self.world.options.logic_type == LogicType.option_intended:
        logic = self.access_ice_train_station(state) and self.climb(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.access_ice_train_station(state) and self.climb(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.access_ice_train_station(state) and self.climb(state)\
                    and (self.climb(state) or self.clockwork_shot(state))           -- Checking for climb here is redundant. is that an error? -- FIXIT
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.access_ice_train_station(state) and self.climb(state)\
                    and (self.climb(state) or self.clockwork_shot(state))\
                or (self.clockwork_shot(state) and self.small_elevation(state))
     --]]
    
    local canReachIcyTrainStation = access_HFP_icySideTrainStation(true)
    
    if ( canReachIcyTrainStation <= logictype.CurrentStage and has("climb") ) then
        logic = 0 -- Normal Logic
    elseif ( canReachIcyTrainStation < 3 and has("climb") ) then
        logic = canReachIcyTrainStation -- Sequence Breaking
    elseif ( can_clockworkShot() and can_reachSmallElevation() ) then
        logic = 3 -- Normal Logic
    
    -- Sequence Breaking
    elseif ( has("climb") ) then
        logic = canReachIcyTrainStation
    end
    
    return convertLogic(logic, skip)
end

function jiggy_HFP_oilDrill(skip)
    local logic = 99
    --[[        jiggy_oil_drill
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.humbaHFP(state) and \
                self.shack_pack(state) and self.grip_grab(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.humbaHFP(state) and self.shack_pack(state) and \
                (self.pack_whack(state) and self.tall_jump(state) or self.grip_grab(state))
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.humbaHFP(state) and self.shack_pack(state) and \
                (self.pack_whack(state) and self.tall_jump(state) or self.grip_grab(state))
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.humbaHFP(state) and self.shack_pack(state) and \
                (self.pack_whack(state) or self.grip_grab(state))
    --]]
    
    local humba = access_HFP_humba(true)
    
    -- Normal Logic
    if ( humba <= logictype.CurrentStage and has_shackPack() and has("ggrab") ) then
        logic = 0
    elseif ( humba <= logictype.CurrentStage and has_shackPack() and has_packWhack() and has("tjump") ) then
        logic = 1
    elseif ( humba < 3 and has_shackPack() and (has("ggrab") or has_packWhack() and has("tjump")) ) then
        logic = math.max(1, humba) -- Sequence Breaking
    elseif ( humba <= logictype.CurrentStage and has_shackPack() and has_packWhack() ) then
        logic = 3
    
    -- Sequence Breaking
    elseif ( has_shackPack() and (has_packWhack() or has("ggrab")) ) then
        logic = math.max(3, humba)
    end
    
    return convertLogic(logic, skip)
end

function jiggy_HFP_fromStompingPlains(skip)
    local logic = 99
    --[[        jiggy_hfp_stomping
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.snooze_pack(state) and self.tall_jump(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.snooze_pack(state) and self.tall_jump(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.tall_jump(state) and self.split_up(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.tall_jump(state) and self.split_up(state)\
                or (state.can_reach_region(regionName.HP, self.player) and self.clockwork_shot(state)\
                    and (self.talon_trot(state)\
                        or self.split_up(state)\
                        or self.leg_spring(state)\          -- redundant since it requires split up
                        or self.flap_flip(state)))
    --]]
    
    local hfpAccessibility = Tracker:FindObjectForCode("@Region: Hailfire Peaks - Lava Side").AccessibilityLevel
    
    -- Normal Logic
    if ( has_snoozePack() and has("tjump") ) then
        logic = 0
    elseif ( has("splitup") and has("tjump") ) then
        logic = 2
    elseif ( (hfpAccessibility == AccessibilityLevel.Normal or hfpAccessibility == AccessibilityLevel.Cleared) and can_clockworkShot() and (has("ttrot") or has("splitup") or has("fflip")) ) then
        logic = 3
    
    -- Sequence Breaking
    elseif ( hfpAccessibility > AccessibilityLevel.None and can_clockworkShot() and (has("ttrot") or has("splitup") or has("fflip")) ) then
        logic = math.max(3, logictype.CurrentStage + 1)
    end
    
    return convertLogic(logic, skip)
end

function jiggy_HFP_kickball(skip)
    local logic = 99
    --[[        jiggy_hfp_kickball
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.humbaMT(state) and self.has_explosives(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.humbaMT(state) and \
                (self.has_explosives(state) or \
                self.check_mumbo_magic(state, itemName.MUMBOHP))
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.humbaMT(state) and \
                (self.has_explosives(state) or self.check_mumbo_magic(state, itemName.MUMBOHP))
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.humbaMT(state) and \
                (self.has_explosives(state) or self.check_mumbo_magic(state, itemName.MUMBOHP))
    --]]
    
    local humbaMT = access_MT_humba(true)
    local explosives = can_shootExplosiveEggs(true)
    
    -- Normal Logic
    if ( humbaMT <= logictype.CurrentStage and explosives <= logictype.CurrentStage ) then
        logic = 0
    elseif ( humbaMT <= logictype.CurrentStage and has("mumbohp") ) then
        logic = 1
        
    -- Sequence Breaking
    else
        local mumbo = 99
        if ( has("mumbohp") ) then
            mumbo = 1
        end
        
        logic = math.max(humba, math.min(mumbo, explosives))
    end
    
    return convertLogic(logic, skip)
end

function jiggy_HFP_aliens(skip)
    local logic = 99
    --[[        jiggy_aliens
     if self.world.options.logic_type == LogicType.option_intended:
          logic = self.alphette(state) and self.betette(state) and self.gamette(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.alphette(state) and self.betette(state) and self.gamette(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.alphette(state) and self.betette(state) and self.gamette(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.alphette(state) and self.betette(state) and self.gamette(state)
    --]]
    
    local alphette = other_HFP_alphette(true)
    local betette = other_HFP_betette(true)
    local gamette = other_HFP_gamette(true)
    
    -- Normal Logic
    if ( alphette <= logictype.CurrentStage and betette <= logictype.CurrentStage and gamette <= logictype.CurrentStage ) then
        logic = 0
    
    -- Sequence Breaking
    else
        logic = math.max(alphette, betette, gamette)
    end
    
    return convertLogic(logic, skip)
end

function jiggy_HFP_colosseumSplitUp(skip)
    local logic = 99
    --[[        jiggy_colosseum_split
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.split_up(state) and self.grip_grab(state) and self.climb(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.split_up(state) and self.grip_grab(state)\
            and (self.climb(state) or (self.pack_whack(state) and self.tall_jump(state)))
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.split_up(state) and self.grip_grab(state)\
            and (self.climb(state) or (self.pack_whack(state) and self.tall_jump(state)))
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = (self.split_up(state) and self.grip_grab(state)\
            and (self.climb(state) or (self.pack_whack(state) and self.tall_jump(state))))\
                or (self.clockwork_eggs(state) and (self.split_up(state) and self.third_person_egg_shooting(state)))
    --]]
    
    if ( has("splitup") and has("ggrab") and has("climb") ) then
        logic = 0
    elseif ( has("splitup") and has("ggrab") and has_packWhack() and has("tjump") ) then
        logic = 1
    elseif ( can_shootEggs("ceggs") and has("splitup") and has("eggshoot") ) then
        logic = 3
    end
    
    return convertLogic(logic, skip)
end

----- Notes

function treble_HFP(skip)
    local logic = 99
    --[[        treble_hfp
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.hfp_top(state) and self.grenade_eggs(state) and self.egg_aim(state) and self.spring_pad(state) and (self.talon_trot(state) or self.split_up(state))
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = (self.split_up(state) and self.ice_cube_kazooie(state) and (self.tall_jump(state) or self.wing_whack(state) or self.glide(state) or self.leg_spring(state)))\           -- checking for split up is redundant when ice_cube_kazooie requires it
                or (self.hfp_top(state) and self.grenade_eggs(state) and self.egg_aim(state) and self.spring_pad(state) and (self.talon_trot(state) or self.split_up(state)))\
                or self.claw_clamber_boots(state) and self.grenade_eggs(state) and self.egg_aim(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = (self.split_up(state) and self.ice_cube_kazooie(state) and (self.tall_jump(state) or self.wing_whack(state) or self.glide(state) or self.leg_spring(state)))\
                or (self.hfp_top(state) and (self.grenade_eggs(state) or self.clockwork_shot(state))\
                    and self.egg_aim(state) and self.spring_pad(state) and (self.talon_trot(state) or self.split_up(state)))\
                or (self.extremelyLongJump(state) and self.clockwork_shot(state))\
                or self.claw_clamber_boots(state) and self.grenade_eggs(state) and self.egg_aim(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = (self.split_up(state) and self.ice_cube_kazooie(state) and (self.tall_jump(state) or self.wing_whack(state) or self.glide(state) or self.leg_spring(state)))\
                or (self.hfp_top(state) and (self.grenade_eggs(state) or self.clockwork_shot(state))\
                    and self.egg_aim(state) and self.spring_pad(state) and (self.talon_trot(state) or self.split_up(state)))\
                or (self.extremelyLongJump(state) and self.clockwork_shot(state))\
                or self.claw_clamber_boots(state) and self.grenade_eggs(state) and self.egg_aim(state)
     --]]
    
    local top = access_HFP_lavaSideTop(true)
    local soloKazooieCube = access_HFP_canBreakIceCubesAsSoloKazooie(true)
    local extremelyLongJump = can_extremelyLongJump(true)
    
    -- Normal Logic
    if ( top <= logictype.CurrentStage and can_shootEggs("geggs") and has("eggaim") and has("tjump") and (has("ttrot") or has("splitup")) ) then
        logic = 0
    elseif ( soloKazooieCube <= logictype.CurrentStage and (has("tjump") or has_wingWhack() or has_glide() or has_legSpring()) or has("clawbts") and can_shootEggs("geggs") and has("eggaim") ) then
        logic = 1
    elseif ( top < 2 and can_shootEggs("geggs") and has("eggaim") and has("tjump") and (has("ttrot") or has("splitup")) ) then
        logic = 1 -- Sequence Breaking
    elseif ( top <= logictype.CurrentStage and can_clockworkShot() and has("tjump") and (has("ttrot") or has("splitup")) or extremelyLongJump <= logictype.CurrentStage and can_clockworkShot() ) then
        logic = 2
    
    -- Sequence Breaking
    else
        local fromTop = 99
        if ( (can_shootEggs("geggs") and has("eggaim") or can_clockworkShot()) and has("tjump") and (has("ttrot") or has("splitup")) ) then
            fromTop = math.max(2, top)
        end
        
        local clockworkJump = 99
        if ( can_clockworkShot() ) then
            clockworkJump = math.max(2, extremelyLongJump)
        end
        
        local soloKazooie = 99
        if ( has("tjump") or has_wingWhack() or has_glide() or has_legSpring() ) then
            soloKazooie = math.max(1, soloKazooieCube)
        end
        
        local newTrick = 99
        if ( can_clockworkShot() and has("clawbts") ) then
            newTrick = 7 -- FIXIT you can use the claw clamber boots strategy and then just clockwork shot the treble
        end
        
        logic = math.min(fromTop, clockworkJump, soloKazooie, newTrick)
    end
    
    return convertLogic(logic, skip)
end

function notes_HFP_lavaSideLadder(skip)
    local logic = 99
    --[[        notes_ladder
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.hfp_top(state) or self.split_up(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.hfp_top(state) or self.split_up(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.hfp_top(state)                                 -- in a vacuum, this looks more restrictive at higher difficulties. split up completes hfp_top on hard tricks and higher, however, so I'll ignore this
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.hfp_top(state)
    --]]
    
    local top = access_HFP_lavaSideTop(true)
    
    -- Normal Logic
    if ( top <= logictype.CurrentStage or has("splitup") ) then
        logic = 0
    
    -- Sequence Breaking
    else
        logic = top
    end
    
    return convertLogic(logic, skip)
end

function notes_HFP_icySideOilDrill(skip)
    local logic = 99
    --[[        notes_oil_drill
    if self.world.options.logic_type == LogicType.option_intended:
        logic =  self.hfp_top(state) and (self.flap_flip(state) or self.talon_trot(state)) and self.ice_cube_BK(state)\
                or self.hfp_top(state) and self.split_up(state) and self.grip_grab(state) and self.pack_whack(state)\           -- checking for split up here is redundant
                or self.hfp_top(state) and self.split_up(state) and self.ice_cube_kazooie(state)                            -- checking for split up here is redundant
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.hfp_top(state) and (self.flap_flip(state) or self.talon_trot(state) or self.flight_pad(state)) and self.ice_cube_BK(state)\
                or self.hfp_top(state) and self.split_up(state) and (self.grip_grab(state) or self.tall_jump(state)) and self.pack_whack(state)\
                or self.hfp_top(state) and self.split_up(state) and self.ice_cube_kazooie(state)\
                or self.humbaHFP(state)\
                or self.hfp_top(state) and self.claw_clamber_boots(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.hfp_top(state) and (self.flap_flip(state) or self.talon_trot(state) or self.flight_pad(state)) and self.ice_cube_BK(state)\
                or self.hfp_top(state) and self.split_up(state) and (self.grip_grab(state) or self.tall_jump(state)) and self.pack_whack(state)\
                or self.hfp_top(state) and self.split_up(state) and self.ice_cube_kazooie(state)\
                or self.humbaHFP(state)\
                or self.hfp_top(state) and self.clockwork_shot(state)\
                or self.hfp_top(state) and self.claw_clamber_boots(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.hfp_top(state) and (self.flap_flip(state) or self.talon_trot(state) or self.flight_pad(state)) and self.ice_cube_BK(state)\
                or self.hfp_top(state) and self.split_up(state) and (self.grip_grab(state) or self.tall_jump(state)) and self.pack_whack(state)\
                or self.hfp_top(state) and self.split_up(state) and self.ice_cube_kazooie(state)\
                or self.humbaHFP(state)\
                or self.hfp_top(state) and self.clockwork_shot(state)\
                or self.hfp_top(state) and self.claw_clamber_boots(state)
    --]]
    
    local top = access_HFP_lavaSideTop(true)
    local pairCube = access_HFP_canBreakIceCubesAsPair(true)
    local soloKazooieCube = access_HFP_canBreakIceCubesAsSoloKazooie(true)
    local humba = access_HFP_humba(true)
    
    -- Normal Logic
    if ( top <= logictype.CurrentStage and ((has("fflip") or has("ttrot")) and pairCube <= logictype.CurrentStage or has("ggrab") and has_packWhack() or soloKazooieCube <= logictype.CurrentStage) ) then
        logic = 0
    elseif ( top <= logictype.CurrentStage and (has("fpad") and pairCube <= logictype.CurrentStage or has("tjump") and has_packWhack() or has("clawbts")) or humba <= logictype.CurrentStage ) then
        logic = 1
    elseif ( top < 2 and ((has("fflip") or has("ttrot") or has("fpad")) and pairCube < 2 or soloKazooieCube < 2) ) then
        logic = 1 -- Sequence Breaking
    elseif ( top <= logictype.CurrentStage and can_clockworkShot() ) then
        logic = 2
    
    -- Sequence Breaking
    else
        local topPair = 99
        if ( has("fflip") or has("ttrot") or has("fpad") ) then
            topPair = math.max(1, top, pairCube)
        end
        
        local justBanjo = 99
        if ( (has("ggrab") or has("tjump")) and has_packWhack() ) then
            justBanjo = math.max(1, top)
        end
        
        local justTop = 99
        if ( has("clawbts") or can_clockworkShot() ) then
            justTop = 2
        end
        
        logic = math.min(topPair, justBanjo, math.max(top, soloKazooieCube), math.max(1, humba), justTop)
    end
    
    return convertLogic(logic, skip)
end

function notes_HFP_icySide(skip)
    local logic = 99
    --[[        notes_upper_icy_side
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.ice_cube_BK(state) and self.hfp_top(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.hfp_top(state)\
                and (self.ice_cube_BK(state)\
                     or self.split_up(state) and self.ice_cube_kazooie(state)\
                     or state.has(itemName.MUMBOHP, self.player)\
                     or self.pack_whack(state)\
                     or self.humbaHFP(state)
                     )
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.hfp_top(state)\
                and (self.ice_cube_BK(state)\
                     or self.split_up(state) and self.ice_cube_kazooie(state)\
                     or state.has(itemName.MUMBOHP, self.player)\
                     or self.pack_whack(state)\
                     or self.humbaHFP(state)
                     )
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.hfp_top(state)\
                and (self.ice_cube_BK(state)\
                     or self.split_up(state) and self.ice_cube_kazooie(state)\
                     or state.has(itemName.MUMBOHP, self.player)\
                     or self.pack_whack(state)\
                     or self.humbaHFP(state)
                     )
    --]]
    
    local pairCube = access_HFP_canBreakIceCubesAsPair(true)
    local top = access_HFP_lavaSideTop(true)
    local soloKazooieCube = access_HFP_canBreakIceCubesAsSoloKazooie(true)
    local humba = access_HFP_humba(true)
    
    -- Normal Logic
    if ( pairCube <= logictype.CurrentStage and top <= logictype.CurrentStage ) then
        logic = 0
    elseif ( top <= logictype.CurrentStage and (soloKazooieCube <= logictype.CurrentStage or has("mumbohp") or has_packWhack() or humba <= logictype.CurrentStage) ) then
        logic = 1
    
    -- Sequence Breaking
    else
        local banjoOrMumbo = 99
        if ( has("mumbohp") or has_packWhack() ) then
            banjoOrMumbo = 1
        end
        
        logic = math.max(1, top, math.min(banjoOrMumbo, soloKazooieCube, humba))
    end
    
    return convertLogic(logic, skip)
end

function notes_HFP_icySideBoggy(skip)
    local logic = 99
    --[[        notes_boggy
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.ice_cube_BK(state) and self.hfp_top(state) and self.small_elevation(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.hfp_top(state)\
                and (self.ice_cube_BK(state) and (self.small_elevation(state) or self.beak_buster(state))\
                     or self.split_up(state) and (self.leg_spring(state) or self.tall_jump(state)) and self.ice_cube_kazooie(state)\
                     or self.tall_jump(state) and state.has(itemName.MUMBOHP, self.player)\
                     or self.pack_whack(state)\
                     or self.humbaHFP(state)
                     )
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.hfp_top(state)\
                and (self.ice_cube_BK(state) and (self.small_elevation(state) or self.beak_buster(state))\
                     or self.split_up(state) and (self.leg_spring(state) or self.tall_jump(state)) and self.ice_cube_kazooie(state)\
                     or self.tall_jump(state) and state.has(itemName.MUMBOHP, self.player)\
                     or self.pack_whack(state)\
                     or self.clockwork_shot(state)\
                     or self.humbaHFP(state)
                     )
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.hfp_top(state)\
                and (self.ice_cube_BK(state) and (self.small_elevation(state) or self.beak_buster(state))\
                     or self.split_up(state) and (self.leg_spring(state) or self.tall_jump(state)) and self.ice_cube_kazooie(state)\
                     or self.tall_jump(state) and state.has(itemName.MUMBOHP, self.player)\
                     or self.pack_whack(state)\
                     or self.clockwork_shot(state)\
                     or self.humbaHFP(state)
                     )
    --]]
    
    local pairCube = access_HFP_canBreakIceCubesAsPair(true)
    local top = access_HFP_lavaSideTop(true)
    local soloKazooieCube = access_HFP_canBreakIceCubesAsSoloKazooie(true)
    local humba = access_HFP_humba(true)
    
    -- Normal Logic
    if ( pairCube <= logictype.CurrentStage and top <= logictype.CurrentStage and can_reachSmallElevation() ) then
        logic = 0
    elseif ( top <= logictype.CurrentStage and (pairCube <= logictype.CurrentStage and has("bbust") or soloKazooieCube <= logictype.CurrentStage and (has_legSpring() or has("tjump")) or has("mumbohp") and has("tjump") or has_packWhack() or humba <= logictype.CurrentStage) ) then
        logic = 1
    elseif ( has("wwing") ) then
        logic = 7
    
    -- Sequence Breaking
    else
        local pair = 99
        if ( can_reachSmallElevation() or has("bbust") ) then
            pair = 1
        end
        
        local kazooie = 99
        if ( has_legSpring() or has("tjump") ) then
            kazooie = soloKazooieCube
        end
    
        local banjoOrMumbo = 99
        if ( has("mumbohp") and has("tjump") or has_packWhack() ) then
            banjoOrMumbo = 1
        end
        
        logic = math.max(1, top, math.min(pair, kazooie, banjoOrMumbo, humba))
    end
    
    return convertLogic(logic, skip)
end

function notes_HFP_icicleGrottoTop(skip)
    local logic = 99
    --[[        nest_icicle_grotto_top
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.hfp_top(state) and self.grenade_eggs(state) and self.egg_aim(state) and self.spring_pad(state) and (self.talon_trot(state) or self.split_up(state))
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = (self.split_up(state) and self.ice_cube_kazooie(state) and (self.tall_jump(state) or self.wing_whack(state) or self.glide(state) or self.leg_spring(state)))\           -- checking for split up is redundant when ice_cube_kazooie requires it
                or (self.hfp_top(state) and self.grenade_eggs(state) and self.egg_aim(state) and self.spring_pad(state) and (self.talon_trot(state) or self.split_up(state)))\
                or self.claw_clamber_boots(state) and self.grenade_eggs(state) and self.egg_aim(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = (self.split_up(state) and self.ice_cube_kazooie(state) and (self.tall_jump(state) or self.wing_whack(state) or self.glide(state) or self.leg_spring(state)))\
                or (self.hfp_top(state) and (self.grenade_eggs(state) or self.clockwork_shot(state))\
                    and self.egg_aim(state) and self.spring_pad(state) and (self.talon_trot(state) or self.split_up(state)))\
                or (self.extremelyLongJump(state) and self.clockwork_shot(state))\
                or self.claw_clamber_boots(state) and self.ice_cube_BK(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = (self.split_up(state) and self.ice_cube_kazooie(state) and (self.tall_jump(state) or self.wing_whack(state) or self.glide(state) or self.leg_spring(state)))\
                or (self.hfp_top(state) and (self.grenade_eggs(state) or self.clockwork_shot(state))\
                    and self.egg_aim(state) and self.spring_pad(state) and (self.talon_trot(state) or self.split_up(state)))\
                or (self.extremelyLongJump(state) and self.clockwork_shot(state))\
                or self.claw_clamber_boots(state) and self.ice_cube_BK(state)
     --]]
    
    local top = access_HFP_lavaSideTop(true)
    local soloKazooieCube = access_HFP_canBreakIceCubesAsSoloKazooie(true)
    local extremelyLongJump = can_extremelyLongJump(true)
    local pairCube = access_HFP_canBreakIceCubesAsPair(true)
    
    -- Normal Logic
    if ( top <= logictype.CurrentStage and can_shootEggs("geggs") and has("eggaim") and has("tjump") and (has("ttrot") or has("splitup")) ) then
        logic = 0
    elseif ( soloKazooieCube <= logictype.CurrentStage and (has("tjump") or has_wingWhack() or has_glide() or has_legSpring()) or has("clawbts") and can_shootEggs("geggs") and has("eggaim") ) then
        logic = 1
    elseif ( top < 2 and can_shootEggs("geggs") and has("eggaim") and has("tjump") and (has("ttrot") or has("splitup")) ) then
        logic = 1 -- Sequence Breaking
    elseif ( top <= logictype.CurrentStage and can_clockworkShot() and has("tjump") and (has("ttrot") or has("splitup")) or extremelyLongJump <= logictype.CurrentStage and can_clockworkShot() or has("clawbts") and pairCube <= logictype.CurrentStage ) then
        logic = 2
    
    -- Sequence Breaking
    else
        local fromTop = 99
        if ( (can_shootEggs("geggs") and has("eggaim") or can_clockworkShot()) and has("tjump") and (has("ttrot") or has("splitup")) ) then
            fromTop = math.max(2, top)
        end
        
        local clockworkJump = 99
        if ( can_clockworkShot() ) then
            clockworkJump = math.max(2, extremelyLongJump)
        end
        
        local soloKazooie = 99
        if ( has("tjump") or has_wingWhack() or has_glide() or has_legSpring() ) then
            soloKazooie = math.max(1, soloKazooieCube)
        end
        
        local clawbts = 99
        if ( has("clawbts") ) then
            clawbts = math.max(2, pairCube)
        end
        
        logic = math.min(fromTop, clockworkJump, soloKazooie, clawbts)
    end
    
    return convertLogic(logic, skip)
end

----- Nests

function nests_HFP_lavaSideOnShelterAtEntrance(skip)
    local logic = 99
    --[[        nest_hfp_entrance_shelter
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.flight_pad(state) or self.leg_spring(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.flight_pad(state)\
                or self.leg_spring(state)\
                or self.glide(state)\
                or self.tall_jump(state) and self.wing_whack(state)\
                or self.flap_flip(state) and (self.grip_grab(state) or self.beak_buster(state))
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.flight_pad(state)\
                or self.leg_spring(state)\
                or self.glide(state)\
                or self.clockwork_shot(state)\
                or self.tall_jump(state) and self.wing_whack(state)\
                or self.flap_flip(state) and (self.grip_grab(state) or self.beak_buster(state))
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.flight_pad(state)\
                or self.leg_spring(state)\
                or self.glide(state)\
                or self.clockwork_shot(state)\
                or self.tall_jump(state) and self.wing_whack(state)\
                or self.flap_flip(state) and (self.grip_grab(state) or self.beak_buster(state))
    --]]
    
    if ( has("fpad") or has_legSpring() ) then
        logic = 0
    elseif ( has_glide() or has("tjump") and has_wingWhack() or has("fflip") and (has("ggrab") or has("bbust")) ) then
        logic = 1
    elseif ( can_clockworkShot() ) then
        logic = 2
    end
    
    return convertLogic(logic, skip)
end

function nests_HFP_icySideTrainStationHard(skip)
    local logic = 99
    --[[        nest_icy_side_train_station_hard
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.access_ice_train_station(state) and self.dive(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.access_ice_train_station(state) and (self.beak_buster(state) or self.dive(state))
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.access_ice_train_station(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.access_ice_train_station(state)
     --]]
    
    local accessIcyTrainStation = access_HFP_icySideTrainStation(true)
    
    -- Normal Logic
    if ( accessIcyTrainStation <= logictype.CurrentStage and has("dive") ) then
        logic = 0
    elseif ( accessIcyTrainStation <= logictype.CurrentStage and has("bbust") ) then
        logic = 1
    elseif ( accessIcyTrainStation < 2 and (has("dive") or has("bbust")) ) then
        logic = 1 -- Sequence Breaking
    elseif ( accessIcyTrainStation <= logictype.CurrentStage ) then
        logic = 2
    
    -- Sequence Breaking
    else
        logic = accessIcyTrainStation
    end
    
    return convertLogic(logic, skip)
end

function nests_HFP_lavaSideChillyBilli(skip)
    local logic = 99
    --[[
    self.flight_pad(state) and self.ice_eggs_item(state)
    --]]
    
    if ( has("fpad") and has("ieggs") ) then
        logic = 0
    end
    
    return convertLogic(logic, skip)
end

function nests_HFP_icySideChillyWilly(skip)
    local logic = 99
    --[[
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.fire_eggs(state) and self.claw_clamber_boots(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.fire_eggs(state) and self.claw_clamber_boots(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        # In case people go for the damage boost for Chilly Willy then die before getting the jiggy, we also require Pack Whack to prevent softlocks.
        logic = self.claw_clamber_boots(state)\
                 or (self.pack_whack(state) and self.tall_jump(state) and self.flutter(state) and \
                     (self.talon_trot(state) or self.flap_flip(state)))
    elif self.world.options.logic_type == LogicType.option_glitches:
        # In case people go for the damage boost for Chilly Willy then die before getting the jiggy, we also require Pack Whack to prevent softlocks.
        logic = self.claw_clamber_boots(state)\
                 or (self.pack_whack(state) and self.tall_jump(state) and self.flutter(state) and \
                     (self.talon_trot(state) or self.flap_flip(state)))
    --]]
    
    -- Normal Logic
    if ( can_shootEggs("feggs") and has("clawbts") ) then
        logic = 0
    elseif ( has("clawbts") or has_packWhack() and has("tjump") and has("flutter") and (has("ttrot") or has("fflip")) ) then
        logic = 2
        
    -- Sequence Breaking
        
    end
    
    return convertLogic(logic, skip)
end

function nests_HFP_lavaSideKickballEggNests(skip)
    local logic = 99
    --[[        nest_hfp_kickball_egg
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.long_jump(state) and self.small_elevation(state) and self.has_explosives(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.long_jump(state) and self.small_elevation(state) and self.has_explosives(state)\
                or state.has(itemName.MUMBOHP, self.player) and self.tall_jump(state)\
                or self.long_jump(state) and self.dragon_kazooie(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.has_explosives(state) or state.has(itemName.MUMBOHP, self.player)\
                or self.dragon_kazooie(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.has_explosives(state) or state.has(itemName.MUMBOHP, self.player)\
                or self.dragon_kazooie(state)
    --]]
    
    local explosives = can_shootExplosiveEggs(true)
    local dragonKazooie = can_getDragonKazooie(true)
    
    -- Normal Logic
    if ( can_longJump() and can_reachSmallElevation() and explosives <= logictype.CurrentStage ) then
        logic = 0
    elseif ( has("mumbohp") and has("tjump") or can_longJump() and dragonKazooie <= logictype.CurrentStage ) then
        logic = 1
    elseif ( can_longJump() and can_reachSmallElevation() and explosives < 2 ) then
        logic = 1 -- Sequence Breaking
    elseif ( explosives <= logictype.CurrentStage or has("mumbohp") or dragonKazooie <= logictype.CurrentStage ) then
        logic = 2
    
    -- Sequence Breaking
    else
        logic = math.max(2, math.min(explosives, dragonKazooie))
    end
    
    return convertLogic(logic, skip)
end

function nests_HFP_lavaSideKickballFeatherNests(skip)
    local logic = 99
    --[[        nest_hfp_kickball_feather
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.long_jump(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.long_jump(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = True
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = True
    --]]
    
    if ( can_longJump() ) then
        logic = 0
    else
        logic = 2
    end
    
    return convertLogic(logic, skip)
end

function nests_HFP_icicleGrottoSpringPad(skip)
    local logic = 99
    --[[        nest_hfp_spring_pad
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.hfp_top(state) and self.spring_pad(state) and self.talon_trot(state) and self.ice_cube_BK(state)\
                or self.hfp_top(state) and self.spring_pad(state) and self.split_up(state) and self.ice_cube_kazooie(state)         -- checking for split up is redundant here
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = (self.split_up(state) and self.ice_cube_kazooie(state) and (self.tall_jump(state) or self.wing_whack(state) or self.glide(state) or self.leg_spring(state)))\
                or (self.hfp_top(state) and self.spring_pad(state) and self.talon_trot(state) and self.ice_cube_BK(state))
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = (self.split_up(state) and self.ice_cube_kazooie(state) and (self.tall_jump(state) or self.wing_whack(state) or self.glide(state) or self.leg_spring(state)))\
                or (self.hfp_top(state) and (self.spring_pad(state) and self.ice_cube_BK(state) or self.clockwork_shot(state)) and self.talon_trot(state))\
                or (self.extremelyLongJump(state) and self.clockwork_shot(state))
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = (self.split_up(state) and self.ice_cube_kazooie(state) and (self.tall_jump(state) or self.wing_whack(state) or self.glide(state) or self.leg_spring(state)))\
                or (self.hfp_top(state) and (self.spring_pad(state) and self.ice_cube_BK(state) or self.clockwork_shot(state)) and self.talon_trot(state))\
                or (self.extremelyLongJump(state) and self.clockwork_shot(state))
    --]]
    
    local top = access_HFP_lavaSideTop(true)
    local pairCube = access_HFP_canBreakIceCubesAsPair(true)
    local kazooieCube = access_HFP_canBreakIceCubesAsSoloKazooie(true)
    local extremelyLongJump = can_extremelyLongJump(true)
    
    -- Normal Logic
    if ( top <= logictype.CurrentStage and has("tjump") and (has("ttrot") and pairCube <= logictype.CurrentStage or kazooieCube <= logictype.CurrentStage) ) then
        logic = 0
    elseif ( kazooieCube <= logictype.CurrentStage and (has("tjump") or has_wingWhack() or has_glide() or has_legSpring()) ) then
        logic = 1
    elseif ( top < 2 and has("tjump") and (has("ttrot") and pairCube < 2 or kazooieCube < 2) ) then
        logic = 1 -- Sequence Breaking
    elseif ( can_clockworkShot() and (top <= logictype.CurrentStage and has("ttrot") or extremelyLongJump <= logictype.CurrentStage) ) then
        logic = 2
    
    -- Sequence Breaking
    else
        local topKazooie = 99
        if ( has("tjump") ) then
            topKazooie = math.max(top, kazooieCube)
        end
    
        local soloKazooie = 99
        if ( has("tjump") or has_wingWhack() or has_glide() or has_legSpring() ) then
            soloKazooie = math.max(1, kazooieCube)
        end
        
        local pair = 99
        if ( has("tjump") and has("ttrot") ) then
            pair = math.max(top, pairCube)
        end
        
        local clockworkTop = 99
        if ( can_clockworkShot() and has("ttrot") ) then
            clockworkTop = math.max(2, top)
        end
        
        local clockworkJump = 99
        if ( can_clockworkShot() ) then
            clockworkJump = math.max(2, extremelyLongJump)
        end
        
        logic = math.max(topKazooie, soloKazooie, pair, clockworkTop, clockworkJump)
    end
    
    return convertLogic(logic, skip)
end

----- Signs

----- Other - Jinjos

function jinjo_HFP_colosseumHotWaterfall(skip)
    local logic = 99
    --[[        jinjo_hot_waterfall
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.wonderwing(state) and self.flap_flip(state) and self.long_jump(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.wonderwing(state) and self.flap_flip(state) and self.long_jump(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = True
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = True
    --]]
    
    if ( has("wwing") and has("fflip") and can_longJump() ) then
        logic = 0
    else
        logic = 2
    end
    
    return convertLogic(logic, skip)
end

function jinjo_HFP_hotPool(skip)
    local logic = 99
    --[[        jinjo_hot_pool
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.shack_pack(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.shack_pack(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.shack_pack(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.shack_pack(state) or self.dive(state) and self.tall_jump(state) and self.clockwork_eggs(state) and self.third_person_egg_shooting(state)
    --]]
    
    if ( has_shackPack() ) then
        logic = 0
    elseif ( has("dive") and has("tjump") and can_shootEggs("ceggs") and has("eggshoot") ) then
        logic = 3
    end
    
    return convertLogic(logic, skip)
end

function jinjo_HFP_windTunnel(skip)
    local logic = 99
    --[[        jinjo_wind_tunnel
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.humbaHFP(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.humbaHFP(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.humbaHFP(state) or self.clockwork_shot(state) and self.hfp_top(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.humbaHFP(state) or self.clockwork_shot(state) and self.hfp_top(state)
    --]]
    
    local humba = access_HFP_humba(true)
    local top = access_HFP_lavaSideTop(true)
    
    -- Normal Logic
    if ( humba < 2 ) then
        logic = humba
    elseif ( top <= logictype.CurrentStage and can_clockworkShot() ) then
        logic = 2
        
    -- Sequence Breaking
    else
        local clockworkTop = 99
        if ( can_clockworkShot() ) then
            clockworkTop = math.max(2, top)
        end
        
        logic = math.min(humba, clockworkTop)
    end
    
    return convertLogic(logic, skip)
end

function jinjo_HFP_icicleGrotto(skip)
    local logic = 99
    --[[        jinjo_icicle_grotto
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.glide(state) and self.grenade_eggs(state) and \
                self.egg_aim(state) and self.tall_jump(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.glide(state) or (self.leg_spring(state) and
                self.wing_whack(state))
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.glide(state) or self.leg_spring(state)\
                or self.clockwork_shot(state) and (self.tall_jump(state) and (self.split_up(state) or self.talon_trot(state)))
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.glide(state) or self.leg_spring(state)\
                or self.clockwork_shot(state) and (self.tall_jump(state) and (self.split_up(state) or self.talon_trot(state)))
    --]]
    
    if ( has_glide() and can_shootEggs("geggs") and has("eggaim") and has("tjump") ) then
        logic = 0
    elseif ( has_glide() or has_legSpring() and has_wingWhack() ) then
        logic = 1
    elseif ( has_legSpring() or can_clockworkShot() and has("tjump") and (has("splitup") or has("ttrot")) ) then
        logic = 2
    end
    
    return convertLogic(logic, skip)
end

function jinjo_HFP_inMildred(skip)
    local logic = 99
    --[[        jinjo_mildred
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.hfp_top(state) and self.small_elevation(state) and (self.fire_eggs(state) or self.has_explosives(state) or \
                self.bill_drill(state) or self.dragon_kazooie(state))
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.hfp_top(state) and (
            (self.small_elevation(state) or self.beak_buster(state)) and (self.fire_eggs(state) or self.has_explosives(state) or self.bill_drill(state) or self.dragon_kazooie(state))\
            or (self.check_mumbo_magic(state, itemName.MUMBOHP) and self.tall_jump(state))\
            or self.split_up(state) and (self.tall_jump(state) and  self.leg_spring(state)) and (self.fire_eggs(state) or self.has_explosives(state)))          -- redundant because it requires tjump and either fire eggs or explosives, which alone passes the earlier condition
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.hfp_top(state) and (
            (self.small_elevation(state) or self.beak_buster(state)) and (self.fire_eggs(state) or self.has_explosives(state) or self.bill_drill(state) or self.dragon_kazooie(state))\
            or (self.check_mumbo_magic(state, itemName.MUMBOHP) and self.tall_jump(state))\
            or self.split_up(state) and (self.tall_jump(state) and self.leg_spring(state)) and (self.fire_eggs(state) or self.has_explosives(state))\
            or self.clockwork_shot(state))
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.hfp_top(state) and (
            (self.small_elevation(state) or self.beak_buster(state)) and (self.fire_eggs(state) or self.has_explosives(state) or self.bill_drill(state) or self.dragon_kazooie(state))\
            or (self.check_mumbo_magic(state, itemName.MUMBOHP) and self.tall_jump(state))\
            or self.split_up(state) and (self.tall_jump(state) and self.leg_spring(state)) and (self.fire_eggs(state) or self.has_explosives(state))\
            or self.clockwork_shot(state))
    --]]
    
    local top = access_HFP_lavaSideTop(true)
    local explosives = can_shootExplosiveEggs(true)
    local dragonKazooie = can_getDragonKazooie(true)
    
    -- Normal Logic
    if ( top <= logictype.CurrentStage and can_reachSmallElevation() and (can_shootEggs("feggs") or explosives <= logictype.CurrentStage or has_billDrill() or dragonKazooie <= logictype.CurrentStage) ) then
        logic = 0
    elseif ( top <= logictype.CurrentStage and ((can_reachSmallElevation() or has("bbust")) and (can_shootEggs("feggs") or explosives <= logictype.CurrentStage or has_billDrill() or dragonKazooie <= logictype.CurrentStage) or has("mumbohp") and has("tjump")) ) then
        logic = 1
    elseif ( top < 2 and (can_shootEggs("feggs") or explosives < 2 or has_billDrill() or dragonKazooie < 2) ) then
        logic = 1 -- Sequence Breaking
    elseif ( top <= logictype.CurrentStage and can_clockworkShot() ) then
        logic = 2
        
    -- Sequence Breaking
    else
        local simple = 99
        if ( (can_reachSmallElevation() or has("bbust")) and (can_shootEggs("feggs") or has_billDrill()) or has("mumbohp") and has("tjump") ) then
            simple = 1
        end
        
        local withExplosives = 99
        if ( can_reachSmallElevation() or has("bbust") ) then
            withExplosives = math.max(1, explosives)
        end
        
        local withDragon = 99
        if ( can_reachSmallElevation() or has("bbust") ) then
            withDragon = math.max(1, dragonKazooie)
        end
        
        local withClockworks = 99
        if ( can_clockworkShot() ) then
            withClockworks = 2
        end
        
        logic = math.max(top, math.min(simple, withExplosives, withDragon, withClockworks))
    end
    
    return convertLogic(logic, skip)
end

----- Other - Glowbos

function glowbo_HFP_icySide(skip)
    local logic = 99
    --[[        glowbo_icy_side
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.hfp_top(state)\
                and (self.long_jump(state)\
                or self.flap_flip(state) and self.grip_grab(state))
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.hfp_top(state)\
                and (self.long_jump(state)\
                or self.flap_flip(state) and self.grip_grab(state))
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.hfp_top(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.hfp_top(state)
     --]]
     
    local hfpTop = access_HFP_lavaSideTop(true)
    
    -- Normal Logic
    if ( hfpTop <= logictype.CurrentStage and (can_longJump() or has("fflip") and has("ggrab")) ) then
        logic = 0
    elseif ( hfpTop <= logictype.CurrentStage ) then
        logic = 2
    elseif ( has("wwing") ) then
        logic = 7
        
    -- Sequence Breaking
    else
        logic = math.max(2, hfpTop)
    end
    
    return convertLogic(logic, skip)
end

function glowbo_HFP_megaGlowbo(skip)
    local logic = 99
    --[[        mega_glowbo
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.talon_torpedo(state) and state.has(itemName.IKEY, self.player)\
                and self.dive(state) and self.tall_jump(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.talon_torpedo(state) and state.has(itemName.IKEY, self.player)\
                and self.dive(state) and\
                (self.tall_jump(state) or self.beak_buster(state) or self.flutter(state) or self.air_rat_a_tat_rap(state))
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.talon_torpedo(state) and state.has(itemName.IKEY, self.player)\
                and self.dive(state) and\
                (self.tall_jump(state) or self.beak_buster(state) or self.clockwork_shot(state) or self.flutter(state) or self.air_rat_a_tat_rap(state))
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.talon_torpedo(state) and state.has(itemName.IKEY, self.player)\
                    and self.dive(state) and\
                    (self.tall_jump(state) or self.beak_buster(state) or self.clockwork_shot(state) or self.flutter(state) or self.air_rat_a_tat_rap(state))
    --]]
    
    if ( has("ttorp") and has("ikey") and has("dive") and has("tjump") ) then
        logic = 0
    elseif ( has("ttorp") and has("ikey") and has("dive") and (has("bbust") or has("flutter") or has("arat")) ) then
        logic = 1
    elseif ( has("ttorp") and has("ikey") and has("dive") and can_clockworkShot() ) then
        logic = 2
    end
    
    return convertLogic(logic, skip)
end

----- Other - Honeycombs

function honeycomb_HFP_volcano(skip)
    local logic = 99
    --[[        honeycomb_volcano
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.hfp_top(state) and self.grenade_eggs(state) and self.egg_aim(state) and self.spring_pad(state) and (self.talon_trot(state) or self.split_up(state))
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.split_up(state) and (self.tall_jump(state) or self.wing_whack(state) or self.glide(state) or self.leg_spring(state))\
                or self.hfp_top(state) and self.grenade_eggs(state) and self.egg_aim(state) and self.spring_pad(state) and self.talon_trot(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.split_up(state) and (self.tall_jump(state) or self.wing_whack(state) or self.glide(state) or self.leg_spring(state))\
                or self.hfp_top(state) and self.grenade_eggs(state) and self.egg_aim(state) and self.spring_pad(state) and self.talon_trot(state)\
                or self.extremelyLongJump(state)\
                or self.hfp_top(state) and self.clockwork_shot(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.split_up(state) and (self.tall_jump(state) or self.wing_whack(state) or self.glide(state) or self.leg_spring(state))\
                or self.hfp_top(state) and self.grenade_eggs(state) and self.egg_aim(state) and self.spring_pad(state) and self.talon_trot(state)\
                or self.extremelyLongJump(state) \
                or self.hfp_top(state) and self.clockwork_shot(state)
    --]]
    
    local top = access_HFP_lavaSideTop(true)
    local extremelyLongJump = can_extremelyLongJump(true)
    
    -- Normal Logic
    if ( top <= logictype.CurrentStage and can_shootEggs("geggs") and has("eggaim") and has("tjump") and (has("ttrot") or has("splitup")) ) then
        logic = 0
    elseif ( has("splitup") and (has("tjump") or has_wingWhack() or has_glide() or has_legSpring()) or top <= logictype.CurrentStage and can_shootEggs("geggs") and has("eggaim") and has("springpad") and has("ttrot") ) then
        logic = 1
    elseif ( top < 2 and can_shootEggs("geggs") and has("eggaim") and has("tjump") and (has("ttrot") or has("splitup")) ) then
        logic = 1 -- Sequence Breaking
    elseif ( top <= logictype.CurrentStage and can_clockworkShot() or extremelyLongJump <= logictype.CurrentStage ) then
        logic = 2
        
    -- Sequence Breaking
    else
        local simple = 99
        if ( can_shootEggs("geggs") and has("eggaim") and has("springpad") and has("ttrot") ) then
            simple = top
        end
        
        local clockworks = 99
        if ( can_clockworkShot() ) then
            clockworks = 2
        end
        
        logic = math.min(simple, clockworks, math.max(2, extremelyLongJump))
    end
    
    return convertLogic(logic, skip)
end

function honeycomb_HFP_lavaSideStation(skip)
    local logic = 99
    --[[        honeycomb_hfp_station
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.grip_grab(state) and\
              (self.talon_trot(state) or self.tall_jump(state)) and\
              (self.flutter(state) or self.air_rat_a_tat_rap(state))
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = (self.grip_grab(state) and\
              (self.talon_trot(state) or self.tall_jump(state)) and\
              (self.flutter(state) or self.air_rat_a_tat_rap(state)))\
                or self.leg_spring(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = (self.grip_grab(state) and\
              (self.talon_trot(state) or self.tall_jump(state)) and\
              (self.flutter(state) or self.air_rat_a_tat_rap(state)))\
                or self.leg_spring(state)\
                 or self.clockwork_shot(state) and self.hfp_top(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = (self.grip_grab(state) and\
              (self.talon_trot(state) or self.tall_jump(state)) and\
              (self.flutter(state) or self.air_rat_a_tat_rap(state)))\
                or self.leg_spring(state)\
                 or self.clockwork_shot(state) and self.hfp_top(state)
    --]]
    
    local top = access_HFP_lavaSideTop(true)
    
    -- Normal Logic
    if ( has("ggrab") and (has("ttrot") or has("tjump")) and (has("flutter") or has("arat")) ) then
        logic = 0
    elseif ( has_legSpring() ) then
        logic = 1
    elseif ( top <= logictype.CurrentStage and can_clockworkShot() ) then
        logic = 2
        
    -- Sequence Breaking
    elseif ( can_clockworkShot() ) then
        logic = math.max(2, top)
    end
    
    return convertLogic(logic, skip)
end

function honeycomb_HFP_lavaSideAboveHotPool(skip)
    local logic = 99
    --[[        honeycomb_lava_side
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.grip_grab(state) and self.flap_flip(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.grip_grab(state) and self.flap_flip(state) or self.flight_pad(state)\
                or self.leg_spring(state) and (self.wing_whack(state) or self.glide(state))
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.grip_grab(state) and self.flap_flip(state)\
                or self.flight_pad(state)\
                or self.leg_spring(state) and (self.wing_whack(state) or self.glide(state))\
                or self.hfp_top(state) and self.clockwork_shot(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.grip_grab(state) and self.flap_flip(state) or self.flight_pad(state)\
                or self.leg_spring(state) and (self.wing_whack(state) or self.glide(state))\
                or self.hfp_top(state) and self.clockwork_shot(state)
    --]]
    
    local top = access_HFP_lavaSideTop(true)
    
    -- Normal Logic
    if ( has("ggrab") and has("fflip") ) then
        logic = 0
    elseif ( has("fpad") or has_legSpring() and (has_wingWhack() or has_glide()) ) then
        logic = 1
    elseif ( top <= logictype.CurrentStage and can_clockworkShot() ) then
        logic = 2
        
    -- Sequence Breaking
    elseif ( can_clockworkShot() ) then
        logic = math.max(2, top)
    end
    
    return convertLogic(logic, skip)
end

----- Other - Cheato Pages

function cheato_HFP_lavaSideAboveHotPool(skip)
    local logic = 99
    --[[        cheato_colosseum
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.long_jump(state) and self.claw_clamber_boots(state) and (self.has_explosives(state) or self.dragon_kazooie(state))
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.long_jump(state) and  self.claw_clamber_boots(state) and (
                    self.has_explosives(state)\
                    or self.check_mumbo_magic(state, itemName.MUMBOHP)\
                    or self.dragon_kazooie(state)
                )
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.claw_clamber_boots(state) and \
                (self.has_explosives(state) or
                self.check_mumbo_magic(state, itemName.MUMBOHP)\
                or self.dragon_kazooie(state))
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = (self.claw_clamber_boots(state) and \
                    (self.has_explosives(state) or
                    self.check_mumbo_magic(state, itemName.MUMBOHP)\
                    or self.dragon_kazooie(state)))\
                or self.hfp_top(state) and self.third_person_egg_shooting(state)
    --]]
    
    local explosives = can_shootExplosiveEggs(true)
    local dragonKazooie = can_getDragonKazooie(true)
    local top = access_HFP_lavaSideTop(true)
    
    -- Normal Logic
    if ( can_longJump() and has("clawbts") and (explosives <= logictype.CurrentStage or dragonKazooie <= logictype.CurrentStage) ) then
        logic = 0
    elseif ( can_longJump() and has("clawbts") and has("mumbohp") ) then
        logic = 1
    elseif ( can_longJump() and has("clawbts") and (explosives < 2 or dragonKazooie < 2) ) then
        logic = 1 -- Sequence Breaking
    elseif ( has("clawbts") and (explosives <= logictype.CurrentStage or dragonKazooie <= logictype.CurrentStage or has("mumbohp")) ) then
        logic = 2
    elseif ( has("clawbts") and (explosives < 3 or dragonKazooie < 3) ) then
        logic = 2 -- Sequence Breaking
    elseif ( top <= logictype.CurrentStage and has("eggshoot") ) then
        logic = 3
        
    -- Sequence Breaking
    else
        local glitch = 99
        if ( has("eggshoot") ) then
            glitch = math.max(3, top)
        end
        
        local clawbts = 99
        if ( has("clawbts") ) then
            clawbts = math.max(2, math.min(explosives, dragonKazooie))
        end
        
        logic = math.min(glitch, clawbts)
    end
    
    return convertLogic(logic, skip)
end

function cheato_HFP_icicleGrotto(skip)
    local logic = 99
    --[[        cheato_icicle_grotto
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.climb(state) and (self.clockwork_eggs(state) or self.shack_pack(state))
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.climb(state) and self.shack_pack(state)\
                or ((self.leg_spring(state) or self.climb(state)) and self.clockwork_eggs(state))
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.hfp_top(state) and\
                (self.climb(state) and self.shack_pack(state)\
                or ((self.leg_spring(state) or self.climb(state)) and self.clockwork_eggs(state)))
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.hfp_top(state) and\
                (self.climb(state) and self.shack_pack(state)\
                or ((self.leg_spring(state) or self.climb(state)) and self.clockwork_eggs(state)))\
                or ((self.talon_trot(state) or self.split_up(state)) and self.clockwork_shot(state))
    --]]
    
    -- this function is weird about hfp_top only being a requirement for hard tricks and above due to the way the function works. going to make it a requirement for all, and if that ever causes errors then that's indicative of a logic problem
    
    local top = access_HFP_lavaSideTop(true)
    
    -- Normal Logic
    if ( top <= logictype.CurrentStage and (has("climb") and (can_shootEggs("ceggs") or has_shackPack())) ) then
        logic = 0
    elseif ( top <= logictype.CurrentStage and (has_legSpring() and can_shootEggs("ceggs")) ) then
        logic = 1
        
    -- Sequence Breaking
    elseif ( has("climb") and (can_shootEggs("ceggs") or has_shackPack()) or has_legSpring() and can_shootEggs("ceggs") ) then
        logic = math.max(1, top)
    end
    
    return convertLogic(logic, skip)
end

function cheato_HFP_icySideOnPillar(skip)
    local logic = 99
    --[[        cheato_icy_pillar
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.hfp_top(state) and self.grenade_eggs(state) and self.egg_aim(state) and self.spring_pad(state) and self.split_up(state) and self.glide(state)\
                or self.leg_spring(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.split_up(state) and (self.tall_jump(state) or self.wing_whack(state) or self.glide(state))\
                or self.leg_spring(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = ((self.split_up(state) and (self.tall_jump(state) or self.wing_whack(state) or self.glide(state))))\
                or self.leg_spring(state)\
                or (self.grenade_eggs(state) and self.clockwork_shot(state) and self.small_elevation(state) and self.spring_pad(state) and self.talon_trot(state))      -- small elevation is redundant because we're making sure we have tall jump
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = ((self.split_up(state) and (self.tall_jump(state) or self.wing_whack(state) or self.glide(state))))\
                or self.leg_spring(state)\
                or (self.grenade_eggs(state) and self.clockwork_shot(state) and self.small_elevation(state) and self.spring_pad(state) and self.talon_trot(state))
    --]]
    
    local top = access_HFP_lavaSideTop(true)
    
    -- Normal Logic
    if ( top <= logictype.CurrentStage and can_shootEggs("geggs") and has("eggaim") and has("tjump") and has_glide() or has_legSpring() ) then
        logic = 0
    elseif ( has("splitup") and (has("tjump") or has_wingWhack() or has_glide()) ) then
        logic = 1
    elseif ( top < 2 and can_shootEggs("geggs") and has("eggaim") and has("tjump") and has_glide() ) then
        logic = 1 -- Sequence Breaking
    elseif ( can_shootEggs("geggs") and can_clockworkShot() and has("tjump") and has("ttrot") ) then
        logic = 2
        
    -- Sequence Breaking
    elseif ( can_shootEggs("geggs") and has("eggaim") and has("tjump") and has_glide() ) then
        logic = top
    end
    
    return convertLogic(logic, skip)
end

----- Other

function trainSwitch_HFP_lava(skip)
    local logic = 99
    --[[        tswitch_lavaside
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.grip_grab(state)\
                and (self.tall_jump(state) or self.talon_trot(state))\
                and (self.flutter(state) or self.air_rat_a_tat_rap(state))
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.grip_grab(state)\
                    and (self.tall_jump(state) or self.talon_trot(state))\
                    and (self.flutter(state) or self.air_rat_a_tat_rap(state))\
                or self.flight_pad(state)\
                or self.leg_spring(state)\
                or self.split_up(state) and self.tall_jump(state)\
             or self.talon_trot(state) and self.flutter(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.grip_grab(state)\
                    and (self.tall_jump(state) or self.talon_trot(state))\
                    and (self.flutter(state) or self.air_rat_a_tat_rap(state))\
                or self.flight_pad(state)\
                or self.leg_spring(state)\
                or self.split_up(state) and self.tall_jump(state)\
             or self.talon_trot(state) and self.flutter(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.grip_grab(state)\
                    and (self.tall_jump(state) or self.talon_trot(state))\
                    and (self.flutter(state) or self.air_rat_a_tat_rap(state))\
                or self.flight_pad(state)\
                or self.leg_spring(state)\
                or self.split_up(state) and self.tall_jump(state)\
             or self.talon_trot(state) and self.flutter(state)
    --]]
    
    if ( has("ggrab") and (has("tjump") or has("ttrot")) and (has("flutter") or has("arat")) ) then
        logic = 0
    elseif ( has("fpad") or has_legSpring() or has("splitup") and has("tjump") or has("ttrot") and has("flutter") ) then
        logic = 1
    end
    
    return convertLogic(logic, skip)
end

function other_HFP_alphette(skip)
    local logic = 99
    --[[        alphette
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.jiggy_ufo(state) and self.bill_drill(state) and self.check_mumbo_magic(state, itemName.MUMBOHP)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.jiggy_ufo(state) and self.bill_drill(state) and self.check_mumbo_magic(state, itemName.MUMBOHP)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.jiggy_ufo(state) and self.bill_drill(state) and self.check_mumbo_magic(state, itemName.MUMBOHP)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.jiggy_ufo(state) and self.bill_drill(state) and self.check_mumbo_magic(state, itemName.MUMBOHP)
    --]]
    
    local jrlUFO = jiggy_JRL_ufo(true)
    
    -- Normal Logic
    if ( jrlUFO <= logictype.CurrentStage and has_billDrill() and has("mumbohp") ) then
        logic = 0
        
    -- Sequence Breaking
    elseif ( has_billDrill() and has("mumbohp") ) then
        logic = jrlUFO
    end
    
    return convertLogic(logic, skip)
end

function other_HFP_betette(skip)
    local logic = 99
    --[[        betette
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.jiggy_ufo(state) and self.bill_drill(state) and self.check_mumbo_magic(state, itemName.MUMBOHP)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.jiggy_ufo(state) and self.bill_drill(state) and self.check_mumbo_magic(state, itemName.MUMBOHP)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.jiggy_ufo(state) and self.bill_drill(state) and self.check_mumbo_magic(state, itemName.MUMBOHP)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.jiggy_ufo(state) and self.bill_drill(state) and self.check_mumbo_magic(state, itemName.MUMBOHP)
    --]]
    
    local jrlUFO = jiggy_JRL_ufo(true)
    
    -- Normal Logic
    if ( jrlUFO <= logictype.CurrentStage and has_billDrill() and has("mumbohp") ) then
        logic = 0
        
    -- Sequence Breaking
    elseif ( has_billDrill() and has("mumbohp") ) then
        logic = jrlUFO
    end
    
    return convertLogic(logic, skip)
end

function other_HFP_gamette(skip)
    local logic = 99
    --[[
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.jiggy_ufo(state) and self.hatch(state) and self.glide(state) and self.check_mumbo_magic(state, itemName.MUMBOHP)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.jiggy_ufo(state) and self.check_mumbo_magic(state, itemName.MUMBOHP) and \
                self.hatch(state) and ((self.wing_whack(state) and self.tall_jump(state)) or self.glide(state))
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.jiggy_ufo(state) and self.check_mumbo_magic(state, itemName.MUMBOHP) and \
                 self.hatch(state) and (self.wing_whack(state) or self.tall_jump(state) or self.glide(state))
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.jiggy_ufo(state) and self.check_mumbo_magic(state, itemName.MUMBOHP) and \
                self.hatch(state) and (self.wing_whack(state) or self.tall_jump(state) or self.glide(state))
    --]]
    
    local jrlUFO = jiggy_JRL_ufo(true)
    
    -- Normal Logic
    if ( jrlUFO <= logictype.CurrentStage and has_hatch() and has_glide() and has("mumbohp") ) then
        logic = 0
    elseif ( jrlUFO <= logictype.CurrentStage and has_hatch() and has_wingWhack() and has("tjump") and has("mumbohp") ) then
        logic = 1
        
    -- Sequence Breaking
    elseif ( has_hatch() and has("mumbohp") and (has_glide() or has_wingWhack() and has("tjump")) ) then
        logic = math.max(1, jrlUFO)
    end
    
    return convertLogic(logic, skip)
end



--------------- Cloud Cuckooland

----- Basic & Access functions

function basic_CCL_mumbo()
    return has("mumbocc") and has("tjump")
end

function basic_CCL_canGrowBeanstalk()
    return has_billDrill() and basic_CCL_mumbo() and has("fpad") and has("climb")
end

function basic_CCL_canUseFloatus()
    return has_taxiPack() and has_hatch()
end

----- Silos

function silo_CCL_sackPack(skip)
    local logic = 99
    --[[
    self.can_access_sack_pack_silo(state) and self.check_notes(state, locationName.SAPACK)
    --]]
    
    local signAtSackPack = signs_CCL_sackPackSilo(true)
    
    -- Normal Logic
    if ( signAtSackPack <= logictype.CurrentStage and sapack_count() ) then
        logic = 0
        
    -- Sequence Breaking
    elseif ( sapack_count() ) then
        logic = signAtSackPack
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
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.shack_pack(state) and (
                state.has(itemName.WARPCC1, self.player) and state.has(itemName.WARPCC2, self.player)\
                or self.can_use_floatus(state)
            )
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.shack_pack(state) and (
                state.has(itemName.WARPCC1, self.player) and state.has(itemName.WARPCC2, self.player)\
                or self.can_use_floatus(state)
            )\
            or self.clockwork_eggs(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.shack_pack(state) and (
                state.has(itemName.WARPCC1, self.player) and state.has(itemName.WARPCC2, self.player)\
                or self.can_use_floatus(state)
            )\
            or self.clockwork_eggs(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.shack_pack(state) and (
                state.has(itemName.WARPCC1, self.player) and state.has(itemName.WARPCC2, self.player)\
                or self.can_use_floatus(state)
            )\
            or self.clockwork_eggs(state)
    --]]
    
    if ( has_shackPack() and (basic_CCL_canUseFloatus() or has("randomizewarppads_off") or has("warpcc1") and has("warpcc2")) ) then
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
        logic = self.dive(state) or self.shack_pack(state) or self.beak_buster(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = True
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = True
    --]]
    
    if ( has("dive") ) then
        logic = 0
    elseif ( has("bbust") or has_shackPack() ) then
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
                or self.claw_clamber_boots and self.glide(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.flight_pad(state)\
                or self.climb(state) and (self.long_jump(state) or self.grip_grab(state) or self.pack_whack(state) or self.sack_pack(state))\
                or self.leg_spring(state) and (self.glide(state) or self.wing_whack(state))\
                or state.has(itemName.HUMBACC, self.player)\
                or self.claw_clamber_boots and self.glide(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.flight_pad(state)\
                or self.climb(state) and (self.long_jump(state) or self.grip_grab(state) or self.pack_whack(state) or self.sack_pack(state))\
                or self.leg_spring(state) and (self.glide(state) or self.wing_whack(state))\
                or state.has(itemName.HUMBACC, self.player)\
                or self.claw_clamber_boots and self.glide(state)
    --]]
    
    if ( has("fpad") or can_longJump() and has("climb") or has("humbacc") ) then
        logic = 0
    elseif ( has("climb") and (has("ggrab") or has_packWhack() or has_sackPack()) or has("clawbts") and has_glide() ) then
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

function signs_CCL_sackPackSilo(skip)
    local logic = 99
    --[[        can_access_sack_pack_silo
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.shack_pack(state) and (
                state.has(itemName.WARPCC1, self.player) and state.has(itemName.WARPCC2, self.player)\
                or self.can_use_floatus(state)
            )
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = self.shack_pack(state) and (
                state.has(itemName.WARPCC1, self.player) and state.has(itemName.WARPCC2, self.player)\
                or self.can_use_floatus(state)
            )
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = self.shack_pack(state) and (
                state.has(itemName.WARPCC1, self.player) and state.has(itemName.WARPCC2, self.player)\
                or self.can_use_floatus(state)
            )
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.shack_pack(state) and (
                state.has(itemName.WARPCC1, self.player) and state.has(itemName.WARPCC2, self.player)\
                or self.can_use_floatus(state)
            )
    --]]
    
    if ( has_shackPack() and (basic_CCL_canUseFloatus() or has("randomizewarppads_off") or has("warpcc1") and has("warpcc2")) ) then
        logic = 0
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
                or self.leg_spring(state)\
                or state.has(itemName.HUMBACC, self.player)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = self.split_up(state) and (self.spring_pad(state) or self.flight_pad(state))\
                or self.clockwork_shot(state)\
                or self.springy_step_shoes(state) and (self.flutter(state) or self.air_rat_a_tat_rap(state) or self.split_up(state))\
                or self.leg_spring(state)\
                or state.has(itemName.HUMBACC, self.player)
    --]]
    
    if ( has("splitup") and has("tjump") or has("humbacc") ) then
        logic = 0
    elseif ( has("splitup") and has("fpad") or has("springb") and has_billDrill() and (has("flutter") or has("arat") or has("splitup")) or has_legSpring() ) then
        logic = 1
    elseif ( can_clockworkShot() or has("springb") and (has("flutter") or has("arat") or has("splitup")) ) then
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
    if self.world.options.logic_type == LogicType.option_intended:
        logic = self.springy_step_shoes(state) and self.bill_drill(state)
    elif self.world.options.logic_type == LogicType.option_easy_tricks:
        logic = (self.springy_step_shoes(state) and self.bill_drill(state)) or self.flight_pad(state)
    elif self.world.options.logic_type == LogicType.option_hard_tricks:
        logic = (self.springy_step_shoes(state) and self.bill_drill(state)) or self.flight_pad(state) or self.clockwork_shot(state)
    elif self.world.options.logic_type == LogicType.option_glitches:
        logic = (self.springy_step_shoes(state) and self.bill_drill(state)) or self.flight_pad(state) or self.clockwork_shot(state)
    --]]
    
    if ( has("springb") and has_billDrill() ) then
        logic = 0
    elseif ( has("fpad") ) then
        logic = 1
    elseif ( can_clockworkShot() ) then
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



---------------------------------------- 

ScriptHost:AddWatchForCode("bkmovewatch", "randomizebkmoves", toggleBKMoves)
ScriptHost:AddWatchForCode("peggswatch", "peggs", togglePEggs)
ScriptHost:AddWatchForCode("pbbustwatch", "pbbust", togglePBBust)
ScriptHost:AddWatchForCode("pshoeswatch", "pshoes", togglePShoes)
ScriptHost:AddWatchForCode("pswimwatch", "pswim", togglePSwim)
ScriptHost:AddWatchForCode("paswimwatch", "paswim", togglePASwim)
ScriptHost:AddWatchForCode("pbashwatch", "pbash", togglePBash)
ScriptHost:AddWatchForCode("pflightwatch", "pflight", togglePFlight)
ScriptHost:AddWatchForCode("peggaimwatch", "peggaim", togglePEggAim)
ScriptHost:AddWatchForCode("paeggaimwatch", "paeggaim", togglePAEggAim)
ScriptHost:AddWatchForCode("notewatch", "note", totalNotes)
ScriptHost:AddWatchForCode("basswatch", "bass", totalNotes)
ScriptHost:AddWatchForCode("treblewatch", "treble", totalNotes)

----- Not sure how to do this in one line, so we've got a line for each for now
ScriptHost:AddWatchForCode("warpswatch1", "warpmt1", toggleWarps)
ScriptHost:AddWatchForCode("warpswatch2", "warpmt2", toggleWarps)
ScriptHost:AddWatchForCode("warpswatch3", "warpmt3", toggleWarps)
ScriptHost:AddWatchForCode("warpswatch4", "warpmt4", toggleWarps)
ScriptHost:AddWatchForCode("warpswatch5", "warpmt5", toggleWarps)
ScriptHost:AddWatchForCode("warpswatch6", "warpgm1", toggleWarps)
ScriptHost:AddWatchForCode("warpswatch7", "warpgm2", toggleWarps)
ScriptHost:AddWatchForCode("warpswatch8", "warpgm3", toggleWarps)
ScriptHost:AddWatchForCode("warpswatch9", "warpgm4", toggleWarps)
ScriptHost:AddWatchForCode("warpswatch10", "warpgm5", toggleWarps)
ScriptHost:AddWatchForCode("warpswatch11", "warpww1", toggleWarps)
ScriptHost:AddWatchForCode("warpswatch12", "warpww2", toggleWarps)
ScriptHost:AddWatchForCode("warpswatch13", "warpww3", toggleWarps)
ScriptHost:AddWatchForCode("warpswatch14", "warpww4", toggleWarps)
ScriptHost:AddWatchForCode("warpswatch15", "warpww5", toggleWarps)
ScriptHost:AddWatchForCode("warpswatch16", "warpjr1", toggleWarps)
ScriptHost:AddWatchForCode("warpswatch17", "warpjr2", toggleWarps)
ScriptHost:AddWatchForCode("warpswatch18", "warpjr3", toggleWarps)
ScriptHost:AddWatchForCode("warpswatch19", "warpjr4", toggleWarps)
ScriptHost:AddWatchForCode("warpswatch20", "warpjr5", toggleWarps)
ScriptHost:AddWatchForCode("warpswatch21", "warptl1", toggleWarps)
ScriptHost:AddWatchForCode("warpswatch22", "warptl2", toggleWarps)
ScriptHost:AddWatchForCode("warpswatch23", "warptl3", toggleWarps)
ScriptHost:AddWatchForCode("warpswatch24", "warptl4", toggleWarps)
ScriptHost:AddWatchForCode("warpswatch25", "warptl5", toggleWarps)
ScriptHost:AddWatchForCode("warpswatch26", "warpgi1", toggleWarps)
ScriptHost:AddWatchForCode("warpswatch27", "warpgi2", toggleWarps)
ScriptHost:AddWatchForCode("warpswatch28", "warpgi3", toggleWarps)
ScriptHost:AddWatchForCode("warpswatch29", "warpgi4", toggleWarps)
ScriptHost:AddWatchForCode("warpswatch30", "warpgi5", toggleWarps)
ScriptHost:AddWatchForCode("warpswatch31", "warphp1", toggleWarps)
ScriptHost:AddWatchForCode("warpswatch32", "warphp2", toggleWarps)
ScriptHost:AddWatchForCode("warpswatch33", "warphp3", toggleWarps)
ScriptHost:AddWatchForCode("warpswatch34", "warphp4", toggleWarps)
ScriptHost:AddWatchForCode("warpswatch35", "warphp5", toggleWarps)
ScriptHost:AddWatchForCode("warpswatch36", "warpcc1", toggleWarps)
ScriptHost:AddWatchForCode("warpswatch37", "warpcc2", toggleWarps)
ScriptHost:AddWatchForCode("warpswatch38", "warpck1", toggleWarps)
ScriptHost:AddWatchForCode("warpswatch39", "warpck2", toggleWarps)

-- mousepace stuff
ScriptHost:AddWatchForCode("bosswatch1", "eggshoot", toggleBossMoves)
ScriptHost:AddWatchForCode("bosswatch2", "amazeogaze", toggleBossMoves)
ScriptHost:AddWatchForCode("bosswatch3", "eggaim", toggleBossMoves)
ScriptHost:AddWatchForCode("bosswatch4", "bblaster", toggleBossMoves)
ScriptHost:AddWatchForCode("bosswatch5", "fpad", toggleBossMoves)
ScriptHost:AddWatchForCode("bosswatch6", "aireaim", toggleBossMoves)
ScriptHost:AddWatchForCode("bosswatch7", "geggs", toggleBossMoves)
ScriptHost:AddWatchForCode("bosswatch8", "dive", toggleBossMoves)
ScriptHost:AddWatchForCode("bosswatch9", "humbajr", toggleBossMoves)
ScriptHost:AddWatchForCode("bosswatch10", "auqaim", toggleBossMoves)
ScriptHost:AddWatchForCode("bosswatch11", "springb", toggleBossMoves)
ScriptHost:AddWatchForCode("bosswatch12", "clawbts", toggleBossMoves)
ScriptHost:AddWatchForCode("bosswatch13", "ieggs", toggleBossMoves)
ScriptHost:AddWatchForCode("bosswatch14", "feggs", toggleBossMoves)
ScriptHost:AddWatchForCode("bosswatch15", "cca", toggleBossMoves)

-- layout override stuff
ScriptHost:AddWatchForCode("layoutoverride1", "entrancerando", overrideLayouts)
ScriptHost:AddWatchForCode("layoutoverride2", "randomizewarppads", overrideLayouts)

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

-- FIXIT list
-- JRL "underwater - here" section has a seemee that should be in the smuggler's cavern areas instead

--[[

Mia's List of Known Bugs in the AP Logic:

- [Mayahem Temple] In both the Prison Compound and Jade Snake Grove, if you can warp to those areas, the basic checks there are not in logic (the connectors don't account for warping, only the harder to acquire checks do)
- [Glitter Gulch Mine - Most Boulders] All boulders logic require the ability to get up a small elevation in order to bill drill them. However, every boulder in the toxic cave, plus the boulder near mumbo's, plus every boulder in the power hut area, can all be broken with just bill drill alone
- [Glitter Gulch Mine - Anything that requires small elevation] There are a lot of checks that require small elevation, but the function for that does not account for smuggling talon trot (this includes entering Chuffy!)
- [Glitter Gulch Mine - Mumbo anything] Checks for small elevation but does not account for the fact that you can smuggle talon trot for that elevation on any difficulty
- [Witchyworld - Pump Room Entrance Honeycomb] You don't need small elevation; you can jump up the barrel and then into the room without tall jump
- [Terrydactyland - Taxi Pack Silo] erroneously has tall jump outside of the function brackets, accidentally making all tricks require it instead of only some
- [Grunty Industries - Connector between outside back and floor 4] You don't need tall jump to make the jumps if you have arat
- [Grunty Industries - egg nests by floor 4 fire escape] You can collect them with just arat
- [Hailfire Peaks - Treble] you can get it with clockworks instead of grenade eggs for the clawbts strategy

--]]