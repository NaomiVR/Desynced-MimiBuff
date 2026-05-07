local package = ...

MimiBuffAddonOrder = {"mimibuff", "additions"}
MimiBuffAddons = {
    mimibuff = {
        options = {
            {id = "enable_research", type = "button", value = true, text = "Enable Research Changes"},
            {id = "enable_recipe_items", type = "button", value = true, text = "Enable Recipe Item Multipliers"},
            {id = "enable_recipe_ticks", type = "button", value = true, text = "Enable Production Speed Changes"},
            {type = "separator"},
            {id = "time_divisor", type = "slider", min = 1, max = 10, value = 2, step = 1, text = "Production Time Divisor"},
            {id = "item_multiplier", type = "slider", min = 1, max = 10, value = 3, step = 1, text = "Ingredient Multiplier"},
        }
    },
    additions = {
        options = {
            {id = "WIP", type = "button", value = true, text = "This section is WIP"}
        }
    }
}


for k, v in pairs(MimiBuffAddons) do
    v.id = k
    v.name = "mimiiii." .. v.id
    v.tooltip = v.name .. "t"
    for _, x in pairs (MimiBuffAddons[k].options) do
        if x.type == "button" or x.type == "combo" then
            x.text = v.name .. "." .. x.id
            x.tooltip = x.text .. "t"
            if x.type == "combo" then
                for _, y in pairs(x.texts) do
                    x.text[_] = x.text .. "c" .. _
                end
            end
        elseif x.type == "slider" then
            x.text = v.name .. "." .. x.id
            x.tooltip = v.name .. "." .. x.id .. "t"
        end
    end
    v.options[#v.options + 1] = {id = "hidden", type = "hidden", value = false}
end


function MimiBuffAddonSetup(id, data)
    MimiBuffAddonOrder[#MimiBuffAddonOrder + 1] = id
    MimiBuffAddons[id] = data
end


function FactionAction.SetOptionValue(faction, arg)
    local settings = Map.GetSettings().mimibuff or {}
    if settings[arg.addon_id] == nil then settings[arg.addon_id] = {} end
    settings[arg.addon_id][arg.option_id] = arg.value
    Map.ModifySettings("mimibuff", settings)
    faction:RunUI(function() Game.OfflinePause(true) end)
end


function MimiBuffGetOptionValue(id, key)
    local key = key or "enabled"

    if Map.GetSettings().mimibuff == nil or
        Map.GetSettings().mimibuff[id] == nil or
            Map.GetSettings().mimibuff[id][key] == nil then
                for k, v in pairs(MimiBuffAddons[id].options) do
                    if v.id == key then
                        return MimiBuffAddons[id].options[k].value
                    end
                end
    end
    return Map.GetSettings().mimibuff[id][key]
end


package.includes = {
    "ui.lua",
    "data/items.lua",
    "data/components.lua",
    "data/frames.lua",
    "data/techs.lua",
    "data/tech/tech_alien.lua",
    "data/tech/tech_blight.lua",
    "data/tech/tech_human.lua",
    "data/tech/tech_robots.lua",
    "data/tech/tech_virus.lua",
}