local techs = data and data.techs

if not techs then
    print("[MimiBuff-tech_virus.lua] ERROR: techs not found")
end


if not MimiBuffGetOptionValue("mimibuff", "enable_research") then return end



---------------------------------------------------------
-- 1. VIRUS TIER ONE
---------------------------------------------------------
-- Virus Crypto
techs.t_robots_virus_cryto.uplink_recipe = CreateUplinkRecipe({ infected_circuit_board = 1 }, 800) -- default ({ infected_circuit_board = 1 }, 800)
techs.t_robots_virus_cryto.progress_count = 200 -- default 20

-- Virus Cure
techs.t_robots_virus_cure.uplink_recipe = CreateUplinkRecipe({ infected_circuit_board = 2 }, 500) -- default ({ infected_circuit_board = 2 }, 500)
techs.t_robots_virus_cure.progress_count = 250 -- default 25

-- Hive
techs.t_robots_recycling.uplink_recipe = CreateUplinkRecipe({ infected_circuit_board = 1 }, 800) -- default ({ infected_circuit_board = 1 }, 800)
techs.t_robots_recycling.progress_count = 200 -- default 20

---------------------------------------------------------
-- 2. VIRUS TIER TWO
---------------------------------------------------------
-- Virus Protection
techs.t_robots_virus_vaccine.uplink_recipe = CreateUplinkRecipe({ virus_research_data = 2 }, 800) -- default ({ virus_research_data = 2 }, 800)
techs.t_robots_virus_vaccine.progress_count = 250 -- default 25

-- Virus Infection
techs.t_robots_virus_jamming.uplink_recipe = CreateUplinkRecipe({ virus_research_data = 1 }, 1000) -- default ({ virus_research_data = 1 }, 1000)
techs.t_robots_virus_jamming.progress_count = 200 -- default 20

-- Virus Waveform
techs.t_robots_virus_bugs.uplink_recipe = CreateUplinkRecipe({ virus_research_data = 1 }, 1000) -- default ({ virus_research_data = 1 }, 1000)
techs.t_robots_virus_bugs.progress_count = 200 -- default 20

---------------------------------------------------------
-- 3. VIRUS TIER THREE
---------------------------------------------------------
-- Anti-Virus
techs.t_robots_antivirus.uplink_recipe = CreateUplinkRecipe({ virus_research = 3 }, 2000) -- default ({ virus_research = 3 }, 2000)
techs.t_robots_antivirus.progress_count = 300 -- default 30

-- Bug Possession
techs.t_robots_virus_possession.uplink_recipe = CreateUplinkRecipe({ virus_research = 4 }, 1500) -- default ({ virus_research = 4 }, 1500)
techs.t_robots_virus_possession.progress_count = 200 -- default 20

-- Bug Attacks
techs.t_robots_virus_bug_attacks.uplink_recipe = CreateUplinkRecipe({ virus_research = 4 }, 1500) -- default ({ virus_research = 4 }, 1500)
techs.t_robots_virus_bug_attacks.progress_count = 200 -- default 20