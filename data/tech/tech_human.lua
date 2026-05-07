local techs = data and data.techs

if not techs then
    print("[MimiBuff-tech_human.lua] ERROR: techs not found")
end


if not MimiBuffGetOptionValue("mimibuff", "enable_research") then return end



---------------------------------------------------------
-- 1. HUMAN-BOT HYBRID TIER ONE
---------------------------------------------------------
-- Extraction
techs.t_extractor.uplink_recipe = CreateUplinkRecipe({ transformer = 1 }, 800) -- default ({ transformer = 1 }, 800)
techs.t_extractor.progress_count = 200 -- default 20

-- Production
techs.t_humanproduction.uplink_recipe = CreateUplinkRecipe({ smallreactor = 1 }, 800) -- default ({ smallreactor = 1 }, 800)
techs.t_humanproduction.progress_count = 200 -- default 20

-- Advanced Drones
techs.t_adv_drones.uplink_recipe = CreateUplinkRecipe({ engine = 1 }, 800) -- default ({ engine = 1 }, 800)
techs.t_adv_drones.progress_count = 200 -- default 20

---------------------------------------------------------
-- 2. HUMAN-BOT HYBRID TIER TWO
---------------------------------------------------------
-- Matrix Frames
techs.t_ldframe.uplink_recipe = CreateUplinkRecipe({ human_datacube = 1, transformer = 1 }, 1000) -- default ({ human_datacube = 1, transformer = 1 }, 1000)
techs.t_ldframe.progress_count = 400 -- default 40

-- Power Units
techs.t_power_units.uplink_recipe = CreateUplinkRecipe({ human_datacube = 1, smallreactor = 1 }, 1000) -- default ({ human_datacube = 1, smallreactor = 1 }, 1000)
techs.t_power_units.progress_count = 400 -- default 40

-- Flyers
techs.t_shuttles.uplink_recipe = CreateUplinkRecipe({ human_datacube = 1, engine = 1, ldframe = 1 }, 1000) -- default ({ human_datacube = 1, engine = 1, ldframe = 1 }, 1000)
techs.t_shuttles.progress_count = 400 -- default 40

---------------------------------------------------------
-- 3. HUMAN-BOT HYBRID TIER THREE
---------------------------------------------------------
-- Hacking
techs.t_hacking_tool.uplink_recipe = CreateUplinkRecipe({ smallreactor = 2, human_research = 2 }, 3000) -- default ({ smallreactor = 2, human_research = 2 }, 3000)
techs.t_hacking_tool.progress_count = 400 -- default 40

-- Human Science
techs.t_power_cores.uplink_recipe = CreateUplinkRecipe({ microscope = 1, human_research = 3 }, 2000) -- default ({ microscope = 1, human_research = 3 }, 2000)
techs.t_power_cores.progress_count = 300 -- default 30

-- Satellites
techs.t_satellites.uplink_recipe = CreateUplinkRecipe({ human_research = 4, engine = 4, ldframe = 2 }, 3000) -- default ({ human_research = 4, engine = 4, ldframe = 2 }, 3000)
techs.t_satellites.progress_count = 200 -- default 20

---------------------------------------------------------
-- 4. HYBRID FINAL TECH
---------------------------------------------------------
-- Human Technology
techs.t_human_technology.uplink_recipe = CreateUplinkRecipe({ human_research = 3 }, 2500) -- default ({ human_research = 3 }, 2500)
techs.t_human_technology.progress_count = 400 -- default 40

---------------------------------------------------------
-- 5. PURE HUMAN TIER ONE
---------------------------------------------------------
-- Mass Storage (Industry 1)
techs.t_human_industry1.uplink_recipe = CreateUplinkRecipe({ concreteslab = 1 }, 300) -- default ({ concreteslab = 1 }, 300)
techs.t_human_industry1.progress_count = 500 -- default 50

-- Human Communications (Comm 1)
techs.t_human_comm1.uplink_recipe = CreateUplinkRecipe({ concreteslab = 1 }, 300) -- default ({ concreteslab = 1 }, 300)
techs.t_human_comm1.progress_count = 500 -- default 50

-- Human Infantry (Defense 1)
techs.t_human_defense1.uplink_recipe = CreateUplinkRecipe({ concreteslab = 1 }, 300) -- default ({ concreteslab = 1 }, 300)
techs.t_human_defense1.progress_count = 500 -- default 50

---------------------------------------------------------
-- 6. PURE HUMAN TIER TWO
---------------------------------------------------------
-- Human Production (Industry 2)
techs.t_human_industry2.uplink_recipe = CreateUplinkRecipe({ steelblock = 2 }, 600) -- default ({ steelblock = 2 }, 600)
techs.t_human_industry2.progress_count = 300 -- default 30

-- Human Data (Comm 2)
techs.t_human_comm2.uplink_recipe = CreateUplinkRecipe({ empty_databank = 1 }, 600) -- default ({ empty_databank = 1 }, 600)
techs.t_human_comm2.progress_count = 400 -- default 40

-- Human Armour (Defense 2)
techs.t_human_defense2.uplink_recipe = CreateUplinkRecipe({ empty_databank = 1 }, 600) -- default ({ empty_databank = 1 }, 600)
techs.t_human_defense2.progress_count = 200 -- default 20

---------------------------------------------------------
-- 7. PURE HUMAN TIER THREE (+ Electronics)
---------------------------------------------------------
-- Human Industrial (Industry 3)
techs.t_human_industry3.uplink_recipe = CreateUplinkRecipe({ human_databank = 1, polymer = 3 }, 600) -- default ({ human_databank = 1, polymer = 3 }, 600)
techs.t_human_industry3.progress_count = 300 -- default 30

-- Human Aerospace (Comm 3)
techs.t_human_comm3.uplink_recipe = CreateUplinkRecipe({ human_databank = 1, polymer = 2 }, 750) -- default ({ human_databank = 1, polymer = 2 }, 750)
techs.t_human_comm3.progress_count = 400 -- default 40

-- Human Power (Defense 3)
techs.t_human_defense3.uplink_recipe = CreateUplinkRecipe({ human_databank = 1, polymer = 2 }, 750) -- default ({ human_databank = 1, polymer = 2 }, 750)
techs.t_human_defense3.progress_count = 400 -- default 40

-- Electronic Circuits
techs.t_human_electronics.uplink_recipe = CreateUplinkRecipe({ circuit_board = 1 }, 750) -- default ({ circuit_board = 1 }, 750)
techs.t_human_electronics.progress_count = 400 -- default 40