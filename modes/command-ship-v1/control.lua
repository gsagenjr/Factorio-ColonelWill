local modeFilePath = "modes/command-ship-v1"
local Commands = require("utility/commands")
local Utils = require("utility/utils")
local Constants = require("constants")
local Gui = require(modeFilePath .. "/gui.lua")

if settings.startup["colonelwill_mode"].value ~= "command-ship-v1" then
    return
end

local function EscapePodAddPart(command)
    local rawValue = command.parameter
    local value = tonumber(rawValue)
    if type(value) ~= "number" then
        game.print("command_ship_add_level value '" .. rawValue .. "' not a valid number")
        return
    end
    game.print("command_ship_add_level added " .. value .. " levels")
    global.Mod.escapeTechLevelsRequired = global.Mod.escapeTechLevelsRequired + value
    global.Mod.escapeTechLevelsAdded = global.Mod.escapeTechLevelsAdded + value
    Gui.RefreshAll()
end

local function OnRocketLaunched(event)
    local rocket = event.rocket
    if rocket == nil or not rocket.valid then
        return
    end
    for name, count in pairs(rocket.get_inventory(defines.inventory.rocket).get_contents()) do
        if name == "command-ship" and count > 0 and not global.Mod.gameFinished then
            global.Mod.gameFinished = true
            game.set_game_state {game_finished = true, player_won = true, can_continue = true, victorious_force = rocket.force}
        end
    end
end

local function OnResearchFinished(event)
    local technology = event.research
    if technology.name == "recruit-workforce-member" then
        global.Mod.recruitedWorkforceCount = technology.level - 1
        Gui.RefreshAll()
    elseif string.find(technology.name, "command-ship", 0, true) and not global.Mod.escapeTechCompleted then
        global.Mod.escapeTechLevelsDone = global.Mod.escapeTechLevelsDone + (technology.research_unit_count / 1000)
        local force = technology.force
        if global.Mod.escapeTechLevelsDone == global.Mod.escapeTechLevelsRequired then
            force.recipes["command-ship"].enabled = true
            technology.enabled = false
            game.print("Command Ship Unlocked", Constants.Color.green)
            global.Mod.escapeTechCompleted = true
        elseif technology.name == "command-ship-5" then
            local alreadyQueued = false
            for _, queuedResearch in pairs(force.research_queue) do
                if queuedResearch.name == technology.name then
                    alreadyQueued = true
                    break
                end
            end
            if not alreadyQueued then
                force.add_research(technology.name)
            end
        end
        Gui.RefreshAll()
    end
end

local function PlayersChanged()
    Gui.RefreshAll()
end

local function CreateGlobals()
    global.Mod = global.Mod or {}
    global.Mod.gameFinished = global.Mod.gameFinished or false
    global.Mod.recruitedWorkforceCount = global.Mod.recruitedWorkforceCount or 0
    global.Mod.escapeTechLevelsRequired = global.Mod.escapeTechLevelsRequired or 20
    global.Mod.escapeTechLevelsDone = global.Mod.escapeTechLevelsDone or 0
    global.Mod.escapeTechLevelsAdded = global.Mod.escapeTechLevelsAdded or 0
    global.Mod.escapeTechCompleted = global.Mod.escapeTechCompleted or false
end

local function OnLoad()
    Commands.Register("command_ship_add_level", {"api-description.command_ship_add_level"}, EscapePodAddPart, true)
    Utils.DisableSiloScript()
end

local function OnStartup()
    CreateGlobals()
    OnLoad()
end

script.on_init(OnStartup)
script.on_load(OnLoad)
script.on_configuration_changed(OnStartup)
script.on_event(defines.events.on_rocket_launched, OnRocketLaunched)
script.on_event(defines.events.on_research_finished, OnResearchFinished)
script.on_event(defines.events.on_player_joined_game, PlayersChanged)
script.on_event(defines.events.on_player_left_game, PlayersChanged)
