-- Note, Page, Jinjo Count

function totalNotes()
    Tracker:FindObjectForCode('totalnote').AcquiredCount = Tracker:FindObjectForCode('note').AcquiredCount + Tracker:FindObjectForCode('bass').AcquiredCount + Tracker:FindObjectForCode('treble').AcquiredCount
    
    updateSilos()
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
        --[[Tracker:FindObjectForCode('dive').Active = false
        Tracker:FindObjectForCode('fpad').Active = false
        Tracker:FindObjectForCode('fflip').Active = false
        Tracker:FindObjectForCode('eggshoot').Active = false
        Tracker:FindObjectForCode('roll').Active = false--]]
        Tracker:FindObjectForCode('ttrot').Active = true
        Tracker:FindObjectForCode('tjump').Active = true
        --[[Tracker:FindObjectForCode('climb').Active = false
        Tracker:FindObjectForCode('flutter').Active = false
        Tracker:FindObjectForCode('wwing').Active = false
        Tracker:FindObjectForCode('grat').Active = false
        Tracker:FindObjectForCode('arat').Active = false
        Tracker:FindObjectForCode('bbarge').Active = false
        Tracker:FindObjectForCode('begg').Active = false
        Tracker:FindObjectForCode('bbust').Active = false
        Tracker:FindObjectForCode('sstride').Active = false
        Tracker:FindObjectForCode('ttrain').Active = false
        Tracker:FindObjectForCode('bbomb').Active = false--]]
    elseif Tracker:FindObjectForCode('randomizebkmoves').CurrentStage == 2 then
        --[[Tracker:FindObjectForCode('dive').Active = false
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
        Tracker:FindObjectForCode('bbomb').Active = false--]]
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
	
	-- Area accessibility
    local mtAccessibility = Tracker:FindObjectForCode("@Region: Mayahem Temple - Main Area").AccessibilityLevel
    local chuffyAccessibility = Tracker:FindObjectForCode("@Region: Inside Chuffy").AccessibilityLevel
    local wwAccessibility = Tracker:FindObjectForCode("@Region: Witchyworld - Main Area").AccessibilityLevel
    local jrlAccessibility = Tracker:FindObjectForCode("@Region: Jolly Roger's Lagoon - Main Area").AccessibilityLevel
    local tdlAccessibility = Tracker:FindObjectForCode("@Region: Terrydactyland - Main Area").AccessibilityLevel
    local hfpAccessibility = Tracker:FindObjectForCode("@Region: Hailfire Peaks - Lava Side").AccessibilityLevel
    
	-- Broadcast tracker moves
    local mp_mta = Tracker:FindObjectForCode('mp_mta')
    if ( mtAccessibility == AccessibilityLevel.Normal or mtAccessibility == AccessibilityLevel.Cleared ) then
        mp_mta.Active = true
    else
        mp_mta.Active = false
    end
    local mp_eggshoot = Tracker:FindObjectForCode('mp_eggshoot')
	if ( has("eggshoot") ) then
        mp_eggshoot.Active = true
    else
        mp_eggshoot.Active = false
    end
    local mp_targitzaneggs = Tracker:FindObjectForCode('mp_targitzaneggs')
	if ( has("begg") or has("feggs") or has("geggs") ) then
        mp_targitzaneggs.Active = true
    else
        mp_targitzaneggs.Active = false
    end
    local mp_bblast = Tracker:FindObjectForCode('mp_bblast')
	if ( has("bblaster") ) then
        mp_bblast.Active = true
    else
        mp_bblast.Active = false
    end
	
    local mp_chuffy = Tracker:FindObjectForCode('mp_chuffy')
	if ( has("chuffy") ) then
        mp_chuffy.Active = true
    else
        mp_chuffy.Active = false
    end
    local mp_trainaccess = Tracker:FindObjectForCode('mp_trainaccess')
    if ( chuffyAccessibility == AccessibilityLevel.Normal or chuffyAccessibility == AccessibilityLevel.Cleared ) then
        mp_trainaccess.Active = true
    else
        mp_trainaccess.Active = false
    end
    local mp_chuffyattack = Tracker:FindObjectForCode('mp_chuffyattack')
	if ( has("eggshoot") and (has("begg") or has("ieggs") or has("geggs")) or has("arat") or has("roll") ) then
        mp_chuffyattack.Active = true
    else
        mp_chuffyattack.Active = false
    end
	
    local mp_wwa = Tracker:FindObjectForCode('mp_wwa')
    if ( wwAccessibility == AccessibilityLevel.Normal or wwAccessibility == AccessibilityLevel.Cleared ) then
        mp_wwa.Active = true
    else
        mp_wwa.Active = false
    end
    local mp_flight = Tracker:FindObjectForCode('mp_flight')
	if ( has("fpad") ) then
        mp_flight.Active = true
    else
        mp_flight.Active = false
    end
    local mp_aireaim = Tracker:FindObjectForCode('mp_aireaim')
	if ( has("eggaim") and has("aireaim") ) then
        mp_aireaim.Active = true
    else
        mp_aireaim.Active = false
    end
    local mp_geggs = Tracker:FindObjectForCode('mp_geggs')
	if ( has("geggs") ) then
        mp_geggs.Active = true
    else
        mp_geggs.Active = false
    end
	
    local mp_jra = Tracker:FindObjectForCode('mp_jra')
    if ( jrlAccessibility == AccessibilityLevel.Normal or jrlAccessibility == AccessibilityLevel.Cleared ) then
        mp_jra.Active = true
    else
        mp_jra.Active = false
    end
    local mp_diveauqaim = Tracker:FindObjectForCode('mp_diveauqaim')
	if ( has("dive") and has("auqaim") ) then
        mp_diveauqaim.Active = true
    else
        mp_diveauqaim.Active = false
    end
    local mp_sub = Tracker:FindObjectForCode('mp_sub')
	if ( has("humbajr") ) then
        mp_sub.Active = true
    else
        mp_sub.Active = false
    end
	
    local mp_tda = Tracker:FindObjectForCode('mp_tda')
    if ( tdlAccessibility == AccessibilityLevel.Normal or tdlAccessibility == AccessibilityLevel.Cleared ) then
        mp_tda.Active = true
    else
        mp_tda.Active = false
    end
    local mp_springb = Tracker:FindObjectForCode('mp_springb')
	if ( has("springb") ) then
        mp_springb.Active = true
    else
        mp_springb.Active = false
    end
    local mp_eggaim = Tracker:FindObjectForCode('mp_eggaim')
	if ( has("eggaim") ) then
        mp_eggaim.Active = true
    else
        mp_eggaim.Active = false
    end
    local mp_terryeggs = Tracker:FindObjectForCode('mp_terryeggs')
	if ( has("ieggs") or has("geggs") ) then
        mp_terryeggs.Active = true
    else
        mp_terryeggs.Active = false
    end
	
    local mp_hfa = Tracker:FindObjectForCode('mp_hfa')
    if ( hfpAccessibility == AccessibilityLevel.Normal or hfpAccessibility == AccessibilityLevel.Cleared ) then
        mp_hfa.Active = true
    else
        mp_hfa.Active = false
    end
    local mp_fpadclawb = Tracker:FindObjectForCode('mp_fpadclawb')
	if ( has("fpad") and has("clawbts") ) then
        mp_fpadclawb.Active = true
    else
        mp_fpadclawb.Active = false
    end
    local mp_ttrot = Tracker:FindObjectForCode('mp_ttrot')
	if ( has("ttrot") ) then
        mp_ttrot.Active = true
    else
        mp_ttrot.Active = false
    end
    local mp_dragoneggs = Tracker:FindObjectForCode('mp_dragoneggs')
	if ( has("ieggs") and has("feggs") and has("eggshoot") ) then
        mp_dragoneggs.Active = true
    else
        mp_dragoneggs.Active = false
    end
	
    local mp_cca = Tracker:FindObjectForCode('mp_cca')
	if ( has("cca") ) then
        mp_cca.Active = true
    else
        mp_cca.Active = false
    end
    local mp_mingyjongoattack = Tracker:FindObjectForCode('mp_mingyjongoattack')
	if ( has("arat") or has("eggshoot") and has("geggs") ) then
        mp_mingyjongoattack.Active = true
    else
        mp_mingyjongoattack.Active = false
    end
	
	-- Broadcast tracker bosses
    if ( has("mp_mta") and has("mp_eggshoot") and has("mp_targitzaneggs") and has("mp_bblast") ) then
        targitzanMoves.Active = true
    else
        targitzanMoves.Active = false
    end
    
    if ( has("mp_chuffy") and has("mp_trainaccess") and has("mp_chuffyattack") ) then
        oldKingCoalMoves.Active = true
    else
        oldKingCoalMoves.Active = false
    end
    
    if ( has("mp_wwa") and has("mp_flight") and has("mp_aireaim") and has("mp_geggs") ) then
        mrPatchMoves.Active = true
    else
        mrPatchMoves.Active = false
    end
    
    if ( has("mp_jra") and has("mp_diveauqaim") and has("mp_sub") and has("mp_geggs") ) then
        lordWooFakFakMoves.Active = true
    else
        lordWooFakFakMoves.Active = false
    end
    
    if ( has("mp_tda") and has("mp_springb") and has("mp_eggaim") and has("mp_terryeggs") ) then
        terryMoves.Active = true
    else
        terryMoves.Active = false
    end
    
    if ( has("mp_hfa") and has("mp_fpadclawb") and has("mp_ttrot") and has("mp_dragoneggs") ) then
        dragonBrothersMoves.Active = true
    else
        dragonBrothersMoves.Active = false
    end
    
    if ( has("mp_cca") and has("mp_mingyjongoattack") ) then
        mingyJongoMoves.Active = true
    else
        mingyJongoMoves.Active = false
    end
end

function overrideLayouts()
    if ( has("entrancerando_off") and has("randomizewarppads_off") and has("randomizebossentrances_off") ) then
        Tracker:AddLayouts("tracker_variants/var_warpsanity_off/layouts/tracker.json")
    elseif ( has("entrancerando_off") and has("randomizewarppads_on") and has("randomizebossentrances_off") ) then
        Tracker:AddLayouts("layouts/tracker.json")
    elseif ( has("entrancerando_on") and has("randomizewarppads_on") and has("randomizebossentrances_off") ) then
        Tracker:AddLayouts("tracker_variants/var_entrancerando_warpsanity/layouts/tracker.json")
    elseif ( has("entrancerando_on") and has("randomizewarppads_off") and has("randomizebossentrances_off") ) then
        Tracker:AddLayouts("tracker_variants/var_entrancerando/layouts/tracker.json")
    elseif ( has("entrancerando_off") and has("randomizewarppads_off") and has("randomizebossentrances_on") ) then
        Tracker:AddLayouts("tracker_variants/var_bossentrancerando/layouts/tracker.json")
    elseif ( has("entrancerando_off") and has("randomizewarppads_on") and has("randomizebossentrances_on") ) then
        Tracker:AddLayouts("tracker_variants/var_bossentrancerando_warpsanity/layouts/tracker.json")
    elseif ( has("entrancerando_on") and has("randomizewarppads_on") and has("randomizebossentrances_on") ) then
        Tracker:AddLayouts("tracker_variants/var_bossentrancerando_entrancerando_warpsanity/layouts/tracker.json")
    elseif ( has("entrancerando_on") and has("randomizewarppads_off") and has("randomizebossentrances_on") ) then
        Tracker:AddLayouts("tracker_variants/var_bossentrancerando_entrancerando/layouts/tracker.json")
    end
    
    if ( has("mousepace_on") ) then
        Tracker:AddLayouts("layouts/broadcast - mousepace2.json")
    elseif ( has("entrancerando_off") and has("randomizewarppads_off") and has("randomizebossentrances_off") ) then
        Tracker:AddLayouts("tracker_variants/var_warpsanity_off/layouts/broadcast.json")
    elseif ( has("entrancerando_off") and has("randomizewarppads_on") and has("randomizebossentrances_off") ) then
        Tracker:AddLayouts("layouts/broadcast.json")
    elseif ( has("entrancerando_on") and has("randomizewarppads_on") and has("randomizebossentrances_off") ) then
        Tracker:AddLayouts("tracker_variants/var_entrancerando_warpsanity/layouts/broadcast.json")
    elseif ( has("entrancerando_on") and has("randomizewarppads_off") and has("randomizebossentrances_off") ) then
        Tracker:AddLayouts("tracker_variants/var_entrancerando/layouts/broadcast.json")
    elseif ( has("entrancerando_off") and has("randomizewarppads_off") and has("randomizebossentrances_on") ) then
        Tracker:AddLayouts("tracker_variants/var_bossentrancerando/layouts/broadcast.json")
    elseif ( has("entrancerando_off") and has("randomizewarppads_on") and has("randomizebossentrances_on") ) then
        Tracker:AddLayouts("tracker_variants/var_bossentrancerando_warpsanity/broadcast.json")
    elseif ( has("entrancerando_on") and has("randomizewarppads_on") and has("randomizebossentrances_on") ) then
        Tracker:AddLayouts("tracker_variants/var_bossentrancerando_entrancerando_warpsanity/layouts/broadcast.json")
    elseif ( has("entrancerando_on") and has("randomizewarppads_off") and has("randomizebossentrances_on") ) then
        Tracker:AddLayouts("tracker_variants/var_bossentrancerando_entrancerando/layouts/broadcast.json")
    end
end



---------------------------------------- 

-- ScriptHost:AddWatchForCode("bkmovewatch", "randomizebkmoves", toggleBKMoves)
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
ScriptHost:AddWatchForCode("bosswatch16", "peggs", toggleBossMoves)
ScriptHost:AddWatchForCode("bosswatch17", "mta", toggleBossMoves)
ScriptHost:AddWatchForCode("bosswatch18", "chuffy", toggleBossMoves)
ScriptHost:AddWatchForCode("bosswatch19", "gga", toggleBossMoves)
ScriptHost:AddWatchForCode("bosswatch20", "trainswww", toggleBossMoves)
ScriptHost:AddWatchForCode("bosswatch21", "trainswtd", toggleBossMoves)
ScriptHost:AddWatchForCode("bosswatch22", "trainswgi", toggleBossMoves)
ScriptHost:AddWatchForCode("bosswatch23", "trainswih", toggleBossMoves)
ScriptHost:AddWatchForCode("bosswatch24", "trainswhp1", toggleBossMoves)
ScriptHost:AddWatchForCode("bosswatch25", "arat", toggleBossMoves)
ScriptHost:AddWatchForCode("bosswatch26", "begg", toggleBossMoves)
ScriptHost:AddWatchForCode("bosswatch27", "wwa", toggleBossMoves)
ScriptHost:AddWatchForCode("bosswatch28", "jra", toggleBossMoves)
ScriptHost:AddWatchForCode("bosswatch29", "tda", toggleBossMoves)
ScriptHost:AddWatchForCode("bosswatch30", "hpa", toggleBossMoves)
ScriptHost:AddWatchForCode("bosswatch31", "ttrot", toggleBossMoves)
ScriptHost:AddWatchForCode("bosswatch32", "ceggs", toggleBossMoves)
ScriptHost:AddWatchForCode("bosswatch33", "mumbohp", toggleBossMoves)
ScriptHost:AddWatchForCode("bosswatch34", "humbagm", toggleBossMoves)
ScriptHost:AddWatchForCode("bosswatch35", "humbatd", toggleBossMoves)
ScriptHost:AddWatchForCode("bosswatch36", "mumbotd", toggleBossMoves)
ScriptHost:AddWatchForCode("bosswatch37", "splitup", toggleBossMoves)
ScriptHost:AddWatchForCode("bosswatch38", "mumbomt", toggleBossMoves)
ScriptHost:AddWatchForCode("bosswatch39", "humbamt", toggleBossMoves)
ScriptHost:AddWatchForCode("bosswatch40", "pbbust", toggleBossMoves)
ScriptHost:AddWatchForCode("bosswatch41", "gia", toggleBossMoves)

-- layout override stuff
ScriptHost:AddWatchForCode("layoutoverride1", "entrancerando", overrideLayouts)
ScriptHost:AddWatchForCode("layoutoverride2", "randomizewarppads", overrideLayouts)
ScriptHost:AddWatchForCode("layoutoverride3", "randomizebossentrances", overrideLayouts)
ScriptHost:AddWatchForCode("layoutoverride4", "mousepace_on", overrideLayouts)