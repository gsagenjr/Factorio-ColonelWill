local Constants = require("constants")
local modeFilePath = "modes/command-ship-v2"
local Utils = require("utility/utils")

if settings.startup["colonelwill_mode"].value ~= "command-ship-v2" then
    return
end

data:extend(
    {
        {
            type = "item",
            name = "command-ship-v2",
            icon = "__base__/graphics/technology/demo/analyse-ship.png",
            icon_size = 128,
            subgroup = "intermediate-product",
            order = "m[satellite]a",
            place_result = "command-ship-v2",
            stack_size = 1
        },
        {
            type = "item",
            name = "power-generator",
            icon = Constants.AssetModName .. "/" .. modeFilePath .. "/graphics/technology/power-generator.png",
            icon_size = 32,
            subgroup = "intermediate-product",
            order = "zzz",
            stack_size = 1
        },
        {
            type = "recipe",
            name = "power-generator",
            energy_required = 10,
            enabled = true,
            category = "crafting",
            ingredients = {
                {"fusion-reactor-equipment", 5},
                {"copper-cable", 1000},
                {"nuclear-fuel", 200}
            },
            result = "power-generator",
            requester_paste_multiplier = 1
        },
        {
            type = "item",
            name = "energy-shield",
            icon = Constants.AssetModName .. "/" .. modeFilePath .. "/graphics/technology/energy-shield.png",
            icon_size = 32,
            subgroup = "intermediate-product",
            order = "zzz",
            stack_size = 1
        },
        {
            type = "recipe",
            name = "energy-shield",
            energy_required = 10,
            enabled = true,
            category = "crafting",
            ingredients = {
                {"energy-shield-mk2-equipment", 5},
                {"steel-plate", 200},
            },
            result = "energy-shield",
            requester_paste_multiplier = 1
        },
        {
            type = "recipe",
            name = "command-ship-v2",
            energy_required = 5,
            enabled = false,
            category = "crafting",
            ingredients = {
                {"low-density-structure", 100},
                {"solar-panel", 100},
                {"accumulator", 100},
                {"radar", 5},
                {"processing-unit", 100},
                {"rocket-fuel", 50},
                {"raw-fish", 1}
            },
            result = "command-ship-v2",
            requester_paste_multiplier = 1
        },
        {
            type = "car",
            name = "command-ship-v2",
            icon = "__base__/graphics/technology/demo/analyse-ship.png",
            icon_size = 128,
            flags = {"hide-alt-info"},
            collision_box = {{-1, -1}, {1, 1}},
            collision_mask = {"ground-tile", "water-tile"},
            weight = 1,
            braking_force = 1,
            friction = 1,
            energy_per_hit_point = 1,
            animation = {
                width = 1,
                height = 1,
                frame_count = 1,
                direction_count = 1,
                filename = "__core__/graphics/empty.png"
            },
            effectivity = 0.6,
            consumption = "0kW",
            rotation_speed = 0,
            energy_source = {
                type = "void"
            },
            inventory_size = 0
        },
        {
            type = "technology",
            name = "command-ship-v2-1",
            icon_size = 128,
            icon = "__base__/graphics/technology/demo/analyse-ship.png",
            localised_name = {"technology-name.command-ship-v2"},
            localised_description = {"technology-description.command-ship-v2"},
            enabled = false,
            effects = {
                {
                    type = "nothing",
                    effect_description = {"technology-modifier.espace-pod-v2"}
                }
            },
            prerequisites = {"logistic-science-pack"},
            unit = {
                count = "1000",
                ingredients = {
                    {"automation-science-pack", 1},
                    {"logistic-science-pack", 1}
                },
                time = 60
            },
            upgrade = true,
            max_level = 5,
            order = "zzz"
        },
        {
            type = "technology",
            name = "command-ship-v2-6",
            icon_size = 128,
            icon = "__base__/graphics/technology/demo/analyse-ship.png",
            localised_name = {"technology-name.command-ship-v2"},
            localised_description = {"technology-description.command-ship-v2"},
            enabled = false,
            effects = {
                {
                    type = "nothing",
                    effect_description = {"technology-modifier.espace-pod"}
                }
            },
            prerequisites = {"command-ship-v2-1", "chemical-science-pack", "military-science-pack"},
            unit = {
                count = 1000,
                ingredients = {
                    {"automation-science-pack", 1},
                    {"logistic-science-pack", 1},
                    {"military-science-pack", 1},
                    {"chemical-science-pack", 1}
                },
                time = 60
            },
            upgrade = true,
            max_level = 10,
            order = "zzz"
        },
        {
            type = "technology",
            name = "command-ship-v2-11",
            icon_size = 128,
            icon = "__base__/graphics/technology/demo/analyse-ship.png",
            localised_name = {"technology-name.command-ship-v2"},
            localised_description = {"technology-description.command-ship-v2"},
            enabled = false,
            effects = {
                {
                    type = "nothing",
                    effect_description = {"technology-modifier.espace-pod"}
                }
            },
            prerequisites = {"command-ship-v2-6", "production-science-pack"},
            unit = {
                count = 1000,
                ingredients = {
                    {"automation-science-pack", 1},
                    {"logistic-science-pack", 1},
                    {"military-science-pack", 1},
                    {"chemical-science-pack", 1},
                    {"production-science-pack", 1}
                },
                time = 60
            },
            upgrade = true,
            max_level = 15,
            order = "zzz"
        },
        {
            type = "technology",
            name = "command-ship-v2-16",
            icon_size = 128,
            icon = "__base__/graphics/technology/demo/analyse-ship.png",
            localised_name = {"technology-name.command-ship-v2"},
            localised_description = {"technology-description.command-ship-v2"},
            enabled = false,
            effects = {
                {
                    type = "nothing",
                    effect_description = {"technology-modifier.espace-pod"}
                }
            },
            prerequisites = {"command-ship-v2-11", "utility-science-pack"},
            unit = {
                count = 1000,
                ingredients = {
                    {"automation-science-pack", 1},
                    {"logistic-science-pack", 1},
                    {"military-science-pack", 1},
                    {"chemical-science-pack", 1},
                    {"production-science-pack", 1},
                    {"utility-science-pack", 1}
                },
                time = 60
            },
            upgrade = true,
            max_level = 20,
            order = "zzz"
        },
        {
            type = "technology",
            name = "command-ship-v2-21",
            icon_size = 128,
            icon = "__base__/graphics/technology/demo/analyse-ship.png",
            localised_name = {"technology-name.command-ship-v2"},
            localised_description = {"technology-description.command-ship-v2"},
            enabled = false,
            effects = {
                {
                    type = "nothing",
                    effect_description = {"technology-modifier.espace-pod"}
                }
            },
            prerequisites = {"command-ship-v2-16", "space-science-pack"},
            unit = {
                count = 1000,
                ingredients = {
                    {"automation-science-pack", 1},
                    {"logistic-science-pack", 1},
                    {"military-science-pack", 1},
                    {"chemical-science-pack", 1},
                    {"production-science-pack", 1},
                    {"utility-science-pack", 1},
                    {"space-science-pack", 1}
                },
                time = 60
            },
            upgrade = true,
            max_level = "infinite",
            order = "zzz"
        },
        {
            type = "technology",
            name = "recruit-workforce-member-v2-1",
            icon_size = 114,
            icon = Constants.AssetModName .. "/" .. modeFilePath .. "/graphics/technology/recruit-workforce-member.png",
            prerequisites = {"logistic-science-pack"},
            unit = {
                count_formula = "5000",
                ingredients = {
                    {"automation-science-pack", 1},
                    {"logistic-science-pack", 1}
                },
                time = 60
            },
            upgrade = true,
            max_level = 1,
            order = "zzz"
        },
        {
            type = "technology",
            name = "recruit-workforce-member-v2-2",
            icon_size = 114,
            icon = Constants.AssetModName .. "/" .. modeFilePath .. "/graphics/technology/recruit-workforce-member.png",
            prerequisites = {"recruit-workforce-member-v2-1", "chemical-science-pack", "military-science-pack"},
            unit = {
                count_formula = "5000",
                ingredients = {
                    {"automation-science-pack", 1},
                    {"logistic-science-pack", 1},
                    {"military-science-pack", 1},
                    {"chemical-science-pack", 1}
                },
                time = 60
            },
            upgrade = true,
            max_level = 2,
            order = "zzz"
        },
        {
            type = "technology",
            name = "recruit-workforce-member-v2-3",
            icon_size = 114,
            icon = Constants.AssetModName .. "/" .. modeFilePath .. "/graphics/technology/recruit-workforce-member.png",
            prerequisites = {"recruit-workforce-member-v2-2", "production-science-pack"},
            unit = {
                count_formula = "5000",
                ingredients = {
                    {"automation-science-pack", 1},
                    {"logistic-science-pack", 1},
                    {"military-science-pack", 1},
                    {"chemical-science-pack", 1},
                    {"production-science-pack", 1}
                },
                time = 60
            },
            upgrade = true,
            max_level = 3,
            order = "zzz"
        },
        {
            type = "technology",
            name = "recruit-workforce-member-v2-4",
            icon_size = 114,
            icon = Constants.AssetModName .. "/" .. modeFilePath .. "/graphics/technology/recruit-workforce-member.png",
            prerequisites = {"recruit-workforce-member-v2-3", "utility-science-pack"},
            unit = {
                count_formula = "5000",
                ingredients = {
                    {"automation-science-pack", 1},
                    {"logistic-science-pack", 1},
                    {"military-science-pack", 1},
                    {"chemical-science-pack", 1},
                    {"production-science-pack", 1},
                    {"utility-science-pack", 1}
                },
                time = 60
            },
            upgrade = true,
            max_level = 4,
            order = "zzz"
        },
        {
            type = "technology",
            name = "recruit-workforce-member-v2-5",
            icon_size = 114,
            icon = Constants.AssetModName .. "/" .. modeFilePath .. "/graphics/technology/recruit-workforce-member.png",
            prerequisites = {"recruit-workforce-member-v2-4", "space-science-pack"},
            unit = {
                count_formula = "2^(L-4)*2500",
                ingredients = {
                    {"automation-science-pack", 1},
                    {"logistic-science-pack", 1},
                    {"military-science-pack", 1},
                    {"chemical-science-pack", 1},
                    {"production-science-pack", 1},
                    {"utility-science-pack", 1},
                    {"space-science-pack", 1}
                },
                time = 60
            },
            upgrade = true,
            max_level = "10",
            order = "zzz"
        }
    }
)

local function DuplicateEscapePodTechnologyForWorkforceTechLevel(technologyLevel, workforceLevel)
    local baseName = "command-ship-v2"
    local techNameToClone = baseName .. "-" .. technologyLevel
    local newTech = Utils.DeepCopy(data.raw["technology"][techNameToClone])
    newTech.name = baseName .. "-w" .. workforceLevel .. "-" .. technologyLevel
    for i, preReq in pairs(newTech.prerequisites) do
        local s, e = string.find(preReq, baseName, 0, true)
        if s ~= nil then
            local preReqLevel = string.sub(preReq, e + 2)
            newTech.prerequisites[i] = baseName .. "-w" .. workforceLevel .. "-" .. preReqLevel
        end
    end
    newTech.unit.count = newTech.unit.count + (newTech.unit.count * workforceLevel)
    data:extend({newTech})
end
local function DuplicateEscapePodTechnologiesForWorkforceTechLevel(workforceLevel)
    DuplicateEscapePodTechnologyForWorkforceTechLevel(1, workforceLevel)
    DuplicateEscapePodTechnologyForWorkforceTechLevel(6, workforceLevel)
    DuplicateEscapePodTechnologyForWorkforceTechLevel(11, workforceLevel)
    DuplicateEscapePodTechnologyForWorkforceTechLevel(16, workforceLevel)
    DuplicateEscapePodTechnologyForWorkforceTechLevel(21, workforceLevel)
end
for i = 0, 10 do
    DuplicateEscapePodTechnologiesForWorkforceTechLevel(i)
end
