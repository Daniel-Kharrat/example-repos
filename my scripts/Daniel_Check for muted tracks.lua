function are_tracks_muted()
    local track_count = reaper.CountTracks(0)
    for i = 0, track_count - 1 do
        local track = reaper.GetTrack(0, i)
        local is_muted = reaper.GetMediaTrackInfo_Value(track, "B_MUTE")
        if is_muted == 1 then
            return true
        end
    end
    return false
end

function is_master_muted()
    local masterMuteSoloFlags = reaper.GetMasterMuteSoloFlags()
    local isMuted = masterMuteSoloFlags & 1
    if isMuted == 1 then
      return true
    else
      return false
    end
end

function update_toolbar_button()

    local command_id = reaper.NamedCommandLookup("_RSd2e825ef5e1c0848a2a346dc027f8a3a452bb1b2")

    if are_tracks_muted() or is_master_muted() then
        reaper.SetToggleCommandState(0, command_id, 1)
    else
        reaper.SetToggleCommandState(0, command_id, 0)
    end

    reaper.RefreshToolbar2(0, command_id)

    reaper.defer(update_toolbar_button)
end

update_toolbar_button()

