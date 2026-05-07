local frames = data and data.frames

if not frames then
    print("[MimiBuff-frames.lua] ERROR: frames not found")
end

---------------------------------------------------------
-- Local Variables
---------------------------------------------------------
local TIME_DIV = MimiBuffGetOptionValue("mimibuff", "time_divisor")
local ITEM_MULT = MimiBuffGetOptionValue("mimibuff", "item_multiplier")
local DO_TICKS = MimiBuffGetOptionValue("mimibuff", "enable_recipe_ticks")
local DO_ITEMS = MimiBuffGetOptionValue("mimibuff", "enable_recipe_items")


---------------------------------------------------------
-- 1. RECIPE TIME CAP & RECIPE MULTIPLIER
---------------------------------------------------------
for _, frame in pairs(frames) do
    local recipe = frame.production_recipe
    if recipe then
        -- Handle Production Speed
        if DO_TICKS and recipe.producers then
            for p_id, ticks in pairs(recipe.producers) do
                recipe.producers[p_id] = ticks / TIME_DIV
                print(string.format("[MimiBuff-frames.lua] Divided production time for frame '%s' by %d", p_id, TIME_DIV))
            end
        end

        -- Handle Item Multipliers
        if DO_ITEMS and recipe.ingredients then
            for ing_id, count in pairs(recipe.ingredients) do
                recipe.ingredients[ing_id] = math.max(1, math.floor(count * ITEM_MULT))
        print(string.format("[MimiBuff-frames.lua] Multiplied ingredients for frame '%s' by %d", ing_id, ITEM_MULT))
            end
        end
    end
end


---------------------------------------------------------
-- 2. UNIT
---------------------------------------------------------

-- Runner
frames["f_carrier_bot"].visibility_range = 10 -- default 5
frames["f_carrier_bot"].slots = { storage = 2 } -- default 1
frames["f_carrier_bot"].movement_speed = 6 -- default 3

-- Worker
frames["f_bot_1s_a"].visibility_range = 20 -- default 10
frames["f_bot_1s_a"].slots = { storage = 2 } -- default 1
frames["f_bot_1s_a"].movement_speed = 4 -- default 2

-- Dashbot
frames["f_bot_1s_b"].visibility_range = 20 -- default 10
frames["f_bot_1s_b"].slots = { storage = 4 } -- default 2
frames["f_bot_1s_b"].movement_speed = 8 -- default 4

-- Twinbot
frames["f_bot_2s"].visibility_range = 20 -- default 10
frames["f_bot_2s"].slots = { storage = 6 } -- default 4
frames["f_bot_2s"].movement_speed = 6 -- default 3

-- Cub
frames["f_bot_1m_a"].visibility_range = 25 -- default 15
frames["f_bot_1m_a"].slots = { storage = 4 } -- default 2
frames["f_bot_1m_a"].movement_speed = 4 -- default 2

-- Hauler
frames["f_bot_1m_b"].visibility_range = 25 -- default Cub
frames["f_bot_1m_b"].slots = { storage = 6 } -- default 4
frames["f_bot_1m_b"].movement_speed = 8 -- default 4

-- Hound
frames["f_bot_1m1s"].visibility_range = 25 -- default 15
frames["f_bot_1m1s"].slots = { storage = 6 } -- default 4
frames["f_bot_1m1s"].movement_speed = 8 -- default 4

-- Transport Bot
frames["f_transport_bot"].visibility_range = 20 -- default 10
frames["f_transport_bot"].slots = { storage = 16 } -- default 12
frames["f_transport_bot"].movement_speed = 10 -- default 6

-- Rock
frames["f_bot_1l_a"].visibility_range = 25 -- default 15
frames["f_bot_1l_a"].slots = { storage = 14 } -- default 8
frames["f_bot_1l_a"].movement_speed = 4 -- default 2

-- Mark V
frames["f_bot_1m_c"].visibility_range = 25 -- default Cub
frames["f_bot_1m_c"].slots = { storage = 8 } -- default 4
frames["f_bot_1m_c"].movement_speed = 8 -- default 5

-- Engineer
frames["f_bot_1s_adw"].visibility_range = 14 -- default 7
frames["f_bot_1s_adw"].slots = { storage = 4 } -- default 2
frames["f_bot_1s_adw"].movement_speed = 4 -- default 2

-- Scout
frames["f_bot_1s_as"].visibility_range = 20 -- default 10
frames["f_bot_1s_as"].slots = { storage = 8 } -- default 4
frames["f_bot_1s_as"].movement_speed = 8 -- default 4

-- Command Center
frames["f_bot_2m_as"].visibility_range = 40 -- default 20
frames["f_bot_2m_as"].slots = { storage = 16 } -- default 8
frames["f_bot_2m_as"].movement_speed = 8 -- default 4

-- Shuttle Bot
frames["f_flyer_bot"].visibilty_range = 25 -- default 15
frames["f_flyer_bot"].slots = { storage = 3 } -- default 1
frames["f_flyer_bot"].movement_speed = 8 -- default 4

-- Miner Mech
-- Light Frame
-- Infantry Mech
-- Human AI Exploer
-- Human Transporter
-- Tank Frame
-- Human Rover
-- Human Carrier
-- Human Shuttle
-- Large Tank Frame
-- Human Lander
-- Hybrid Worker
-- Hybrid Obsidian Soldier
-- Small Obsidian Tank Frame
-- Drill Spike
-- Alien Transport
-- Alien Worker
-- Alien Scout
-- Alien Pincer
-- Obsidian Soldier
-- Sentinel Tower
-- Obisidian Tank Frame
-- Heavy Obsidian Soldier

----------------------------------------------------------
-- 3. DRONE
----------------------------------------------------------
-- Drone
frames["f_drone_transfer_a"].visibility_range = 6 -- default 3
frames["f_drone_transfer_a"].slots = { storage = 2 } -- default 1
frames["f_drone_transfer_a"].movement_speed = 8 -- default 4
frames["f_drone_transfer_a"].drone_range = 25 -- default 10

-- Satellite


-- Transfer Drone
frames["f_drone_transfer_a2"].visibility_range = 10 -- default 5
frames["f_drone_transfer_a2"].slots = { storage = 2 } -- default 1
frames["f_drone_transfer_a2"].movement_speed = 12 -- default 6
frames["f_drone_transfer_a2"].dronge_range = 50 -- default 20

-- Miner Drone
frames["f_drone_miner_a"].dronge_range = 15 -- default 6

-- Advanced Miner Drone
frames["f_drone_adv_miner"].drone_range = 15 -- default 6

-- Defense Drone


-- Flyer
frames["f_flyer_m"].visibility_range = 40 -- default 20
frames["f_flyer_m"].slots = { storage = 4 } -- default 2
frames["f_flyer_m"].movement_speed = 14 -- default 7

-- Small Satellite


-- Nexus Probe


----------------------------------------------------------
-- 4. SMALL BUILDING
----------------------------------------------------------
-- Building 1x1 (1S)
-- Building 1x1 (2S)
-- Storage Block (8)
-- Storage Block (16)
-- Storage Block (24)

-----------------------------------------------------------
-- 5. MEDIUM BUILDING
-----------------------------------------------------------
-- Building 1x1 (1M)
-- Defense Block
-- Building 2x1 (1M)
-- Building 2x1 (1M1S)
-- Building 2x1 (2M)
-- Building 2x1 (2M)
-- Building 2x1 (2S1M)
-- Building 2x1 (1M)
-- Building 2x2 (2M)
-- Building 2x2 (1M3S)
-- Building 2x2 (3M)
-- Building 3x2 (2M2S)

-----------------------------------------------------------
-- 6. LARGE BUILDING
-----------------------------------------------------------
-- Building 1x1 (1L)
-- Building 2x1 (1M1L)
-- Building 2x2 (2M1L)
-- Building 2x2 (2M1L)
-- Building 2x2 (2M1L)
-- Building 3x2 (1L3M)

-----------------------------------------------------------
-- 7. SPECIAL BUILDING
-----------------------------------------------------------
-- Re-Simulator
-- AMAC
-- Fusion Generator
-- Particle Forge

-----------------------------------------------------------
-- 8. FOUNDATIONS
-----------------------------------------------------------
-- Foundation
-- f_foundation no changes

-- Foundation (Basic)
frames["f_foundation_basic"].construction_recipe = CreateConstructionRecipe({ foundationplate = 2 }, 5) -- default ({ foundationplate = 2, reinforced_plate = 1,  }, 5)

-- Foundation (Advanced)
frames["f_foundation_adv"].construction_recipe = CreateConstructionRecipe({ foundationplate = 5 }, 5) -- default ({ foundationplate = 5, energized_plate = 1,  }, 5)

-- Hex Foundation
frames["f_human_foundation9"].construction_recipe = CreateConstructionRecipe({ foundationplate = 5 }, 5) -- default ({ foundationplate = 5, hdframe = 1,  }, 5)

-- Logo Foundation
frames["f_human_foundation8"].construction_recipe = CreateConstructionRecipe({ foundationplate = 5 }, 5) -- default ({ foundationplate = 5, hdframe = 1,  }, 5)

-- Pavement
-- Basic Human Foundation
-- Human Foundation
-- Advanced Human Foundation
-- White Markings
-- Yellow Markings
-- Red Markings
-- Green Markings
-- Purple Markings
-- Blue Markings

-----------------------------------------------------------
-- 9. WALLS
-----------------------------------------------------------
-- Gate
-- Wall
-- Blight Wall
-- Virus Wall

-----------------------------------------------------------
-- 10. OTHER CONSTRUCTIONS
-----------------------------------------------------------
-- Command Center
frames["f_landingpod"].visibility_range = 60 -- default 30
frames["f_landingpod"].slots = { storage = 24 } -- default 12

-- Beacon
-- Large Beacon

-----------------------------------------------------------
-- 11. RESOURCE
-----------------------------------------------------------
-- Metal Ore Deposit
-- Crystal Chunk Deposit
-- Silica Sand Deposit
-- Silica Tree
-- Laterite Ore Deposit
-- Blight Crystal Chunk Deposit
-- Obsidian Chunk Deposit

-----------------------------------------------------------
-- 12. HUMAN BUILDING
-----------------------------------------------------------
-- Human Science Lab
-- Human Warehouse
-- Human Refinery
-- Human Barracks
-- Bunker
-- Multimodal AI Center
-- Blight Complex
-- Human Factory
-- Vehicle Factory
-- Heavy Bunker
-- Human Spaceport
-- Human Command HQ
-- Human Power Plant

-----------------------------------------------------------
-- 13. ALIEN BUILDING
-----------------------------------------------------------
-- Soulweaver
-- Nexaspire
-- Plasma Bloom
-- Pylon
-- Formation Crucible
-- Storage Pods
-- Reforming Pool
-- Sensor Spike
-- Nexus Warp
-- Symbiotech
-- Alien Observer
-- Time Egg
-- Heart Shard
-- Console
-- Monolith

-----------------------------------------------------------
-- 14. VIRUS
-----------------------------------------------------------
-- Trilobyte
-- Scale Worm
-- Shield Worm
-- Malika
-- Mothika
-- Scyther Egg
-- Wasp
-- Ravager
-- Malacostra
-- Larva
-- Mortako
-- Viper Worm

-----------------------------------------------------------
-- 15. HIVE
-----------------------------------------------------------
-- Large Bug Hive