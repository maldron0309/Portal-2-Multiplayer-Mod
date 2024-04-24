//---------------------------------------------------
//         *****!Do not edit this file!*****
//---------------------------------------------------
// Purpose: Verifies valid options in config.nut
//           and compensates for each variable.
//---------------------------------------------------

// Can't create a function to redefine existing variables, so do it one by one :D

local ConfigValueError = function(invalidorundefined, command) {
    printlP2MM(invalidorundefined + " value provided for " + command + "! Treating as default value. Verify valid options for this in config.nut")
}

try {
    if (typeof(Config_DevMode) != "bool") {
        Config_DevMode <- false
        ConfigValueError("Invalid", "Config_DevMode")
    }
} catch (exception) {
    Config_DevMode <- false
    ConfigValueError("Undefined", "Config_DevMode")
}

try {
    if (typeof(Config_VScriptDebug) != "bool") {
        Config_VScriptDebug <- false
        ConfigValueError("Invalid", "Config_VScriptDebug")
    }
} catch (exception) {
    Config_VScriptDebug <- false
    ConfigValueError("Undefined", "Config_VScriptDebug")
}

try {
    if (typeof(Config_VisualDebug) != "bool") {
        Config_VisualDebug <- false
        ConfigValueError("Invalid", "Config_VisualDebug")
    }
} catch (exception) {
    Config_VisualDebug <- false
    ConfigValueError("Undefined", "Config_VisualDebug")
}

try {
    if (typeof(Config_UseCustomDevModels) != "bool") {
        Config_UseCustomDevModels <- false
        ConfigValueError("Invalid", "Config_UseCustomDevModels")
    }
} catch (exception) {
    Config_UseCustomDevModels <- false
    ConfigValueError("Undefined", "Config_UseCustomDevModels")
}

try {
    if (typeof(Config_GameMode) != "integer") {
        Config_GameMode <- 0
        ConfigValueError("Invalid", "Config_GameMode")
    }
} catch (exception) {
    Config_GameMode <- 0
    ConfigValueError("Undefined", "Config_GameMode")
}

try {
    if (typeof(Config_RandomTurret) != "bool") {
        Config_RandomTurret <- false
        ConfigValueError("Invalid", "Config_RandomTurret")
    }
} catch (exception) {
    Config_RandomTurret <- false
    ConfigValueError("Undefined", "Config_RandomTurret")
}

try {
    if (typeof(Config_RandomTurretLoop) != "bool") {
        Config_RandomTurretLoop <- false
        ConfigValueError("Invalid", "Config_RandomTurretLoop")
    }
} catch (exception) {
    Config_RandomTurretLoop <- false
    ConfigValueError("Undefined", "Config_RandomTurretLoop")
}

try {
    if (typeof(Config_RandomPortalSize) != "bool") {
        Config_RandomPortalSize <- false
        ConfigValueError("Invalid", "Config_RandomPortalSize")
    }
} catch (exception) {
    Config_RandomPortalSize <- false
    ConfigValueError("Undefined", "Config_RandomPortalSize")
}

try {
    if (typeof(Config_UseColorIndicator) != "bool") {
        Config_UseColorIndicator <- true
        ConfigValueError("Invalid", "Config_UseColorIndicator")
    }
} catch (exception) {
    Config_UseColorIndicator <- true
    ConfigValueError("Undefined", "Config_UseColorIndicator")
}

try {
    if (typeof(Config_UseJoinIndicator) != "bool") {
        Config_UseJoinIndicator <- true
        ConfigValueError("Invalid", "Config_UseJoinIndicator")
    }
} catch (exception) {
    Config_UseJoinIndicator <- true
    ConfigValueError("Undefined", "Config_UseJoinIndicator")
}

try {
    if (typeof(Config_UseNametags) != "bool") {
        Config_UseNametags <- true
        ConfigValueError("Invalid", "Config_UseNametags")
    }
} catch (exception) {
    Config_UseNametags <- true
    ConfigValueError("Undefined", "Config_UseNametags")
}

try {
    if (typeof(Config_SafeGuard) != "bool") {
        Config_SafeGuard <- false
        ConfigValueError("Invalid", "Config_SafeGuard")
    }
} catch (exception) {
    Config_SafeGuard <- false
    ConfigValueError("Undefined", "Config_SafeGuard")
}

try {
    if (typeof(Config_SetPlayerElasticity) != "integer") {
        Config_SetPlayerElasticity <- 0
        ConfigValueError("Invalid", "Config_SetPlayerElasticity")
    }
} catch (exception) {
    Config_SetPlayerElasticity <- 0
    ConfigValueError("Undefined", "Config_SetPlayerElasticity")
}

try {
    if (typeof(Config_UseChatCommands) != "bool") {
        Config_UseChatCommands <- true
        ConfigValueError("Invalid", "Config_UseChatCommands")
    }
} catch (exception) {
    Config_UseChatCommands <- true
    ConfigValueError("Undefined", "Config_UseChatCommands")
}

local SetDefaultAdminList = function() {
    Admins <- []
}

try {
    if (typeof(Admins) != "array") {
        SetDefaultAdminList()
        ConfigValueError("Invalid", "Admins")
    } else {
        foreach (admin in Admins) {
            local level = split(admin, "[]")[0]
            local SteamID = split(admin, "]")[1]

            if (typeof(level.tointeger()) != "integer" || typeof(SteamID.tointeger()) != "integer") {
                SetDefaultAdminList()
                ConfigValueError("Invalid", "Admins")
                return
            }
        }
    }
} catch (exception) {
    SetDefaultAdminList()
    ConfigValueError("Undefined", "Admins")
}

try {
    if (typeof(Config_musicEnable) != "bool") {
        Config_musicEnable <- true
        ConfigValueError("Invalid", "Config_musicEnable")
    }
} catch (exception) {
    Config_musicEnable <- true
    ConfigValueError("Undefined", "Config_musicEnable")
}

try {
    if (typeof(Config_musicDefault) != "integer" || Config_musicDefault < -1) {
        Config_musicDefault <- 0
        ConfigValueError("Invalid", "Config_musicDefault")
    }
} catch (exception) {
    Config_musicDefault <- 0
    ConfigValueError("Undefined", "Config_musicDefault")
}

local SetDefaultMusicTracksArray = function() {
    Config_musicTracks <- [
        "music/mp_coop_lobby_2_c1.wav" //0 index, 1/16
        "music/mp_coop_lobby_2_c2.wav" //1 index, 2/16
        "music/mp_coop_lobby_2_c4.wav" //2 index, 3/16
        "music/mp_coop_lobby_2_c5.wav" //3 index, 4/16
        "music/mp_coop_lobby_2_c6.wav" //4 index, 5/16
        "music/mp_coop_lobby_2_c7.wav" //5 index, 6/16
        "music/mp_coop_hallway_c4.wav" //6 index, 7/16
        "music/sp_a1_wakeup_b1.wav" //7 index, 8/16
        "music/sp_a2_bts1_b1.wav" //8 index, 9/16
        "music/sp_a4_tb_catch_b1a.wav" //9 index, 10/16
        "music/sp_a4_finale1_b2p2.wav" //10 index, 11/16
        "music/portal2_want_you_gone.wav" //11 index, 12/16
        "music/portal2_robots_ftw.wav" //12 index, 13/16
        "ambient/music/looping_radio_mix.wav" //13 index, 14/16
        "music/sp_a2_dual_lasers_r1.wav" // Doesn't loop  //14 index, 15/16
        "music/sp_a2_laser_vs_turret_r1.wav" // Doesn't loop  //15 index, 16/16
    ]
}

try {
    if (typeof(Config_musicTracks) != "array") {
        SetDefaultMusicTracksArray()
        ConfigValueError("Invalid", "Config_musicTracks")
    } else {
        foreach (track in Config_musicTracks) {
            if (typeof(track) != "string") {
                SetDefaultMusicTracksArray()
                ConfigValueError("Invalid", "Config_musicTracks")
                return
            }
        }
    }
} catch (exception) {
    SetDefaultMusicTracksArray()
    ConfigValueError("Undefined", "Config_musicTracks")
}