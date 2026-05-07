local techs = data and data.techs

if not techs then
    print("[MimiBuff-tech_alien.lua] ERROR: techs not found")
end


if not MimiBuffGetOptionValue("mimibuff", "enable_research") then return end


---------------------------------------------------------
-- 1. ALIEN TIER ONE
---------------------------------------------------------
-- Phasing
techs.t_phase.uplink_recipe = CreateUplinkRecipe({ phase_leaf = 1, anomaly_cluster = 1 }, 600) -- default ({ phase_leaf = 1, anomaly_cluster = 1 }, 600)
techs.t_phase.progress_count = 200 -- default 20

-- Energy Form
techs.t_energy_form.uplink_recipe = CreateUplinkRecipe({ anomaly_particle = 1 }, 600) -- default ({ anomaly_particle = 1 }, 600)
techs.t_energy_form.progress_count = 400 -- default 40

-- Energy Folding
techs.t_energy_folding.uplink_recipe = CreateUplinkRecipe({ power_petal = 1, anomaly_cluster = 1 }, 1200) -- default ({ power_petal = 1, anomaly_cluster = 1 }, 1200)
techs.t_energy_folding.progress_count = 100 -- default 10

---------------------------------------------------------
-- 2. ALIEN TIER TWO
---------------------------------------------------------
-- Teleportation
techs.t_teleportation.uplink_recipe = CreateUplinkRecipe({ alien_datacube = 4, cpu = 1 }, 3000) -- default ({ alien_datacube = 4, cpu = 1 }, 3000)
techs.t_teleportation.progress_count = 100 -- default 10

-- Anomaly Heart
techs.t_anomaly_heart.uplink_recipe = CreateUplinkRecipe({ obsidian_brick = 2, alien_datacube = 2 }, 1000) -- default ({ obsidian_brick = 2, alien_datacube = 2 }, 1000)
techs.t_anomaly_heart.progress_count = 500 -- default 50

-- Obsidian Manipulation
techs.t_obsidian_maniputalion.uplink_recipe = CreateUplinkRecipe({ unstable_matter = 1, alien_datacube = 1 }, 1000) -- default ({ unstable_matter = 1, alien_datacube = 1 }, 1000)
techs.t_obsidian_maniputalion.progress_count = 500 -- default 50

---------------------------------------------------------
-- 3. ALIEN TIER THREE
---------------------------------------------------------
-- Reformation
techs.t_resim_tech.uplink_recipe = CreateUplinkRecipe({ alien_research = 2 }, 1000) -- default ({ alien_research = 2 }, 1000)
techs.t_resim_tech.progress_count = 400 -- default 40

-- Energy Manipulation
techs.t_energy_manipulation.uplink_recipe = CreateUplinkRecipe({ alien_research = 3 }, 1000) -- default ({ alien_research = 3 }, 1000)
techs.t_energy_manipulation.progress_count = 300 -- default 30

-- Exoskeletons
techs.t_exoskeletons.uplink_recipe = CreateUplinkRecipe({ alien_research = 2 }, 1000) -- default ({ alien_research = 2 }, 1000)
techs.t_exoskeletons.progress_count = 400 -- default 40

---------------------------------------------------------
-- 4. ALIEN FINAL TECH
---------------------------------------------------------
-- Anomaly Technology
techs.t_anomaly_technology.uplink_recipe = CreateUplinkRecipe({ alien_research = 3 }, 1000) -- default ({ alien_research = 3 }, 1000)
techs.t_anomaly_technology.progress_count = 400 -- default 40

---------------------------------------------------------
-- 5. ENERGETICS TIER ONE
---------------------------------------------------------
-- Plasma Wellspring (Producer)
techs.t_alien_producer.uplink_recipe = CreateUplinkRecipe({ alien_artifact = 1, blight_plasma = 1 }, 800) -- default ({ alien_artifact = 1, blight_plasma = 1 }, 800)
techs.t_alien_producer.progress_count = 200 -- default 20

-- The Nexasphere (Feeder)
techs.t_alien_feeder.uplink_recipe = CreateUplinkRecipe({ alien_artifact = 3 }, 2000) -- default ({ alien_artifact = 3 }, 2000)
techs.t_alien_feeder.progress_count = 100 -- default 10

-- Paragenic Crucible (Extractor)
techs.t_alien_extractor.uplink_recipe = CreateUplinkRecipe({ alien_artifact = 1, plasma_crystal = 2 }, 800) -- default ({ alien_artifact = 1, plasma_crystal = 2 }, 800)
techs.t_alien_extractor.progress_count = 200 -- default 20

---------------------------------------------------------
-- 6. ENERGETICS TIER TWO
---------------------------------------------------------
-- Transmorphic Channeling
techs.t_alien_production2.uplink_recipe = CreateUplinkRecipe({ empty_artifact_research = 2, anomaly_cluster = 1 }, 1200) -- default ({ empty_artifact_research = 2, anomaly_cluster = 1 }, 1200)
techs.t_alien_production2.progress_count = 200 -- default 20

-- The Nexus Web
techs.t_alien_command2.uplink_recipe = CreateUplinkRecipe({ empty_artifact_research = 2 }, 750) -- default ({ empty_artifact_research = 2 }, 750)
techs.t_alien_command2.progress_count = 400 -- default 40

-- Ion Forge
techs.t_alien_energetics2.uplink_recipe = CreateUplinkRecipe({ empty_artifact_research = 2, plasma_crystal = 2 }, 1000) -- default ({ empty_artifact_research = 2, plasma_crystal = 2 }, 1000)
techs.t_alien_energetics2.progress_count = 200 -- default 20

---------------------------------------------------------
-- 7. ENERGETICS TIER THREE
---------------------------------------------------------
-- Metamorphism
techs.t_alien_production3.uplink_recipe = CreateUplinkRecipe({ alien_artifact_research = 2, crystalized_obsidian = 2 }, 1500) -- default ({ alien_artifact_research = 2, crystalized_obsidian = 2 }, 1500)
techs.t_alien_production3.progress_count = 200 -- default 20

-- Vortex of Voices
techs.t_alien_command3.uplink_recipe = CreateUplinkRecipe({ alien_artifact_research = 2, crystalized_obsidian = 1 }, 1200) -- default ({ alien_artifact_research = 2, crystalized_obsidian = 1 }, 1200)
techs.t_alien_command3.progress_count = 300 -- default 30

-- Aurora Storm
techs.t_alien_energetics3.uplink_recipe = CreateUplinkRecipe({ crystalized_obsidian = 1, alien_artifact_research = 2 }, 1500) -- default ({ crystalized_obsidian = 1, alien_artifact_research = 2 }, 1500)
techs.t_alien_energetics3.progress_count = 200 -- default 20
