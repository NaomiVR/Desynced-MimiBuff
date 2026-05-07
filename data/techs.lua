local techs = data and data.techs

if not techs then
    print("[MimiBuff-techs.lua] ERROR: techs not found")
end


if not MimiBuffGetOptionValue("mimibuff", "enable_research") then return end


---------------------------------------------------------
-- 1. HUMAN
---------------------------------------------------------
-- Human Intel
techs.t_human_intel.uplink_recipe = CreateUplinkRecipe({ transformer = 1 }, 1000) -- default ({ transformer = 1 }, 1000)
techs.t_human_intel.progress_count = 400 -- default 40

---------------------------------------------------------
-- 2. VIRUS
---------------------------------------------------------
-- Virus Research
techs.t_robots_virus.uplink_recipe = CreateUplinkRecipe({ infected_circuit_board = 1 }, 1000) -- default ({ infected_circuit_board = 1 }, 1000)
techs.t_robots_virus.progress_count = 100 -- default 10

---------------------------------------------------------
-- 3. ALIEN
---------------------------------------------------------
-- Alien Technology
techs.t_robots_alien_research.uplink_recipe = CreateUplinkRecipe({ obsidian_brick = 1 }, 500) -- default ({ obsidian_brick = 1 }, 500)
techs.t_robots_alien_research.progress_count = 600 -- default 60

---------------------------------------------------------
-- 4. BLIGHT
---------------------------------------------------------
-- Blight Research
techs.t_blight_research.uplink_recipe = CreateUplinkRecipe({ blight_extraction = 5 }, 500) -- default ({ blight_extraction = 5 }, 500)
techs.t_blight_research.progress_count = 300 -- default 30
