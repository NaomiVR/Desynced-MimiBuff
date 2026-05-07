local items = data and data.items

if not items then
    print("[MimiBuff-items.lua] ERROR: items not found")
end


---------------------------------------------------------
-- Local Variables
---------------------------------------------------------
local TIME_DIV = MimiBuffGetOptionValue("mimibuff", "time_divisor")
local ITEM_MULT = MimiBuffGetOptionValue("mimibuff", "item_multiplier")
local DO_TICKS = MimiBuffGetOptionValue("mimibuff", "enable_recipe_ticks")
local DO_ITEMS = MimiBuffGetOptionValue("mimibuff", "enable_recipe_items")

-- Exclude any item ids that make the game too hard when the recipes are increased
local exclude_multiply = {
    ["metalbar"] = true,
    ["energized_plate"] = true,
    ["hdframe"] = true
}

---------------------------------------------------------
-- 1. RECIPE TIME CAP, MAX STACK SIZE & RECIPE MULTIPLIER
---------------------------------------------------------
for id, item in pairs(items) do
    local recipe = item.production_recipe
    if recipe then
        -- Handle Production Speed
        if DO_TICKS and recipe.producers then
            for p_id, ticks in pairs(recipe.producers) do
                recipe.producers[p_id] = ticks / TIME_DIV
                print(string.format("[MimiBuff-items.lua] Divided production time for item '%s' by %d", p_id, TIME_DIV))
            end
        end

        -- Handle Item Multipliers
        if not exclude_multiply[id] then
            if DO_ITEMS and recipe.ingredients then
                for ing_id, count in pairs(recipe.ingredients) do
                    recipe.ingredients[ing_id] = math.max(1, math.floor(count * ITEM_MULT))
            print(string.format("[MimiBuff-items.lua] Multiplied ingredients for item '%s' by %d", ing_id, ITEM_MULT))
                end
            end
        else
            print(string.format("[MimiBuff-items.lua] Skipping ingredient multiplier for excluded item: '%s'", ing_id))
        end
    end

    item.stack = 100
    item.max_stack = 100
    item.stack_size = 100
    print(string.format("[MimiBuff-items.lua] Set stacks for '%s' -> 100", id))
end

---------------------------------------------------------
-- 2. Resource
---------------------------------------------------------
-- Metal Ore
items.metalore.mining_recipe = CreateMiningRecipe({
    c_miner = 15, -- default 30
    c_adv_miner = 5, -- default 15
    c_human_miner = 10, -- default 20
    c_alien_miner = 15, -- default 30
})

-- Crystal Chunk
items.crystal.mining_recipe = CreateMiningRecipe({
    c_miner = 15, -- default 25
    c_adv_miner = 5, -- default 12
    c_human_miner = 10, -- default 20
    c_alien_miner = 15, -- default 25
})

-- Silica Sand
items.silica.mining_recipe = CreateMiningRecipe({
    c_miner = 15, -- default 30
    c_adv_miner = 5, -- default 15
    c_human_miner = 10, -- default 20
    c_alien_miner = 15, -- default 30
})

-- Laterite Ore
items.laterite.mining_recipe = CreateMiningRecipe({
    c_extractor = 15, -- default 30
    c_human_miner = 15, -- default 30
    c_alien_miner = 15, -- default 30
})

-- Blight Crystal
items.blight_crystal.mining_recipe = CreateMiningRecipe({
    c_miner = 25, -- default 50
    c_adv_miner = 10, -- default 25
    c_human_miner = 15, -- default 30
    c_alien_miner = 15, -- default 30
})

-- Obsidian Ore
items.obsidian.mining_recipe = CreateMiningRecipe({
    c_extractor = 25, -- default 50
    c_human_miner = 15, -- default 30
    c_alien_miner = 25, -- default 50
    c_virus_claws = 25, -- default 50
})

-- Bug Chitin
-- bug_carapace no changes

-- Blight Gas
-- blight_extraction changed in components.lua under Blight Extractor

-- Infected Obsidian Chunk
-- obsidian_infected no changes

-- Plasma Crystal
-- plasma_crystal no changes

---------------------------------------------------------
-- 3. SIMPLE MATERIAL
---------------------------------------------------------
-- Metal Bar
-- Metal Plate
-- Silicon
-- Wire
-- Blight Bar
-- Foundation Plate
-- Blight Plasma
-- Aluminum Rod
-- Aluminum Sheet
-- Obsidian Brick


---------------------------------------------------------
-- 4. ADVANCED MATERIAL
---------------------------------------------------------
-- Reinforced Plate
-- Circuit Board
-- Infected Circuit Board
-- Beacon Kit
-- Energized Plate
-- Crystal Powder
-- Refined Crystal
-- Cable
-- Transformer
-- Small Modular Reactor
-- Microscope
-- Engine
-- Concrete Slab
-- Steel Block
-- Gear Box
-- Anomaly Heart
-- Alien Artifact
-- Shaped Obsidian
-- Energized Artifact
-- Crystalized Obsidian


---------------------------------------------------------
-- 5. HI-TECH MATERIAL
---------------------------------------------------------
-- High-Density Frame
-- IC Chip
-- Optic Cable
-- Fused Electrodes
-- Ultra Frame
-- Microprocessor
-- Low-Density Frame
-- Reactor Fuel Rods
-- Ceramic Tiles
-- Composite Mesh
-- Enriched Reactor Fuel Rods
-- Virus Source Code
-- CPU
-- Phase Leaf
-- Dense Anomaly Cluster
-- Power Petal
-- Anomaly Particle


---------------------------------------------------------
-- 6. RESEARCH DATA
---------------------------------------------------------
-- Robotics Datacube
-- Blight Datacube
-- Human Datacube
-- Virus Datacube
-- Alien Datacube
-- Datacube Matrix
-- Robotics Research
-- Blight Research
-- Human Research
-- Virus Research
-- Alien Research
-- MultiCube
-- Multi-Frame
-- Blank Datakey
-- Robot Datakey
-- Blight Datakey
-- Human Datakey
-- Virus Datakey
-- ALien Datakey
-- Multi-Key
-- Empty Data Bank
-- Human Data Bank
-- Empty Research Artifact
-- Research Artifact