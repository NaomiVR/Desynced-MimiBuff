local techs = data and data.techs

if not techs then
    print("[MimiBuff-tech_robots.lua] ERROR: techs not found")
end


if not MimiBuffGetOptionValue("mimibuff", "enable_research") then return end



---------------------------------------------------------
-- 1. BASIC TREE (TIER 0 & ONE)
---------------------------------------------------------

-- New Starter Tech
-- Don't change

-- Basic Signals
techs.t_signals1.uplink_recipe = CreateUplinkRecipe({ circuit_board = 1 }, 30) -- default ({ circuit_board = 1 }, 30)
techs.t_signals1.progress_count = 50 -- default 5

-- Basic Structures
techs.t_structures1.uplink_recipe = CreateUplinkRecipe({ metalplate = 3 }, 15) -- default ({ metalplate = 3 }, 15)
techs.t_structures1.progress_count = 100 -- default 10

-- Basic Power
techs.t_power0.uplink_recipe = CreateUplinkRecipe({ crystal = 3 }, 15) -- default ({ crystal = 3 }, 15)
techs.t_power0.progress_count = 100 -- default 10

---------------------------------------------------------
-- 2. BASIC TIER TWO
---------------------------------------------------------

-- Behaviors
techs.t_signals2.uplink_recipe = CreateUplinkRecipe({ reinforced_plate = 1, circuit_board = 1 }, 100) -- default ({ reinforced_plate = 1, circuit_board = 1 }, 100)
techs.t_signals2.progress_count = 100 -- default 10

-- Basic Robotics
techs.t_robotics10.uplink_recipe = CreateUplinkRecipe({ crystal = 1, reinforced_plate = 2 }, 50) -- default ({ crystal = 1, reinforced_plate = 2 }, 50)
techs.t_robotics10.progress_count = 100 -- default 10

-- Power Transduction
techs.t_power10.uplink_recipe = CreateUplinkRecipe({ crystal = 2, reinforced_plate = 1 }, 150) -- default ({ crystal = 2, reinforced_plate = 1 }, 150)
techs.t_power10.progress_count = 100 -- default 10

---------------------------------------------------------
-- 3. BASIC TIER THREE
---------------------------------------------------------

-- Nanobots
techs.t_signals3.uplink_recipe = CreateUplinkRecipe({ energized_plate = 1, circuit_board = 5 }, 150) -- default ({ energized_plate = 1, circuit_board = 5 }, 150)
techs.t_signals3.progress_count = 50 -- default 5

-- Robotics Production
techs.t_robotics0.uplink_recipe = CreateUplinkRecipe({ silicon = 2, energized_plate = 2 }, 100) -- default ({ silicon = 2, energized_plate = 2 }, 100)
techs.t_robotics0.progress_count = 100 -- default 10

-- Expanded Power
techs.t_power1.uplink_recipe = CreateUplinkRecipe({ crystal = 5, energized_plate = 1 }, 100) -- default ({ crystal = 5, energized_plate = 1 }, 100)
techs.t_power1.progress_count = 100 -- default 10

---------------------------------------------------------
-- 4. BASIC FINAL TECH
---------------------------------------------------------

-- Gateway Technology
techs.t_research1.uplink_recipe = CreateUplinkRecipe({ robot_datacube = 1, wire = 6, energized_plate = 4 }, 400) -- default ({ robot_datacube = 1, wire = 6, energized_plate = 4 }, 400)
techs.t_research1.progress_count = 50 -- default 5

---------------------------------------------------------
-- 5. ADVANCED TIER 1
---------------------------------------------------------

-- Advanced Logistics
techs.t_storage1.uplink_recipe = CreateUplinkRecipe({ wire = 2, crystal_powder = 4 }, 250) -- default ({ wire = 2, crystal_powder = 4 }, 250)
techs.t_storage1.progress_count = 200 -- default 20

-- Advanced Materials
techs.t_structures2.uplink_recipe = CreateUplinkRecipe({ wire = 3, hdframe = 3 }, 400) -- default ({ wire = 3, hdframe = 3 }, 400)
techs.t_structures2.progress_count = 200 -- default 20

-- Power Upgrade
techs.t_power11.uplink_recipe = CreateUplinkRecipe({ hdframe = 1, crystal_powder = 2 }, 500) -- default ({ hdframe = 1, crystal_powder = 2 }, 500)
techs.t_power11.progress_count = 200 -- default 20

---------------------------------------------------------
-- 6. ADVANCED TIER 2
---------------------------------------------------------

-- Drone Storage
techs.t_storage4.uplink_recipe = CreateUplinkRecipe({ cable = 3, circuit_board = 1, refined_crystal = 1 }, 1000) -- default ({ cable = 3, circuit_board = 1, refined_crystal = 1 }, 1000)
techs.t_storage4.progress_count = 100 -- default 10

-- Advanced Structures
techs.t_structures4.uplink_recipe = CreateUplinkRecipe({ robot_datacube = 3, circuit_board = 1, refined_crystal = 1 }, 500) -- default ({ robot_datacube = 3, circuit_board = 1, refined_crystal = 1 }, 500)
techs.t_structures4.progress_count = 200 -- default 20

-- Power Field
techs.t_power12.uplink_recipe = CreateUplinkRecipe({ hdframe = 2, circuit_board = 1, refined_crystal = 1 }, 500) -- default ({ hdframe = 2, circuit_board = 1, refined_crystal = 1 }, 500)
techs.t_power12.progress_count = 300 -- default 30

---------------------------------------------------------
-- 7. ADVANCED TIER 3
---------------------------------------------------------

-- Scanner Tech
techs.t_defense2.uplink_recipe = CreateUplinkRecipe({ refined_crystal = 2, icchip = 1, robot_datacube = 4 }, 750) -- default ({ refined_crystal = 2, icchip = 1, robot_datacube = 4 }, 750)
techs.t_defense2.progress_count = 200 -- default 20

-- Matrix Technology
techs.t_robotics2.uplink_recipe = CreateUplinkRecipe({ robot_datacube = 4, refined_crystal = 1, icchip = 1 }, 750) -- default ({ robot_datacube = 4, refined_crystal = 1, icchip = 1 }, 750)
techs.t_robotics2.progress_count = 200 -- default 20

-- Power Storage
techs.t_power2.uplink_recipe = CreateUplinkRecipe({ robot_datacube = 4, refined_crystal = 2, icchip = 1 }, 750) -- default ({ robot_datacube = 4, refined_crystal = 2, icchip = 1 }, 750)
techs.t_power2.progress_count = 200 -- default 20

---------------------------------------------------------
-- 8. ADVANCED FINAL TECH
---------------------------------------------------------

-- Supercomputing
techs.t_research2.uplink_recipe = CreateUplinkRecipe({ robot_datacube = 5, datacube_matrix = 1, icchip = 2 }, 1000) -- default ({ robot_datacube = 5, datacube_matrix = 1, icchip = 2 }, 1000)
techs.t_research2.progress_count = 200 -- default 20

---------------------------------------------------------
-- 9. HYBRID TIER ONE
---------------------------------------------------------

-- Hybrid Automation
techs.t_storage2.uplink_recipe = CreateUplinkRecipe({ robot_research = 1, human_research = 1 }, 1500) -- default ({ robot_research = 1, human_research = 1 }, 1500)
techs.t_storage2.progress_count = 300 -- default 30

-- Epic Structures
techs.t_structures5.uplink_recipe = CreateUplinkRecipe({ robot_research = 1, optic_cable = 1 }, 1000) -- default ({ robot_research = 1, optic_cable = 1 }, 1000)
techs.t_structures5.progress_count = 300 -- default 30

-- Hybrid Tech
techs.t_power5.uplink_recipe = CreateUplinkRecipe({ robot_research = 1, blight_research = 1 }, 1500) -- default ({ robot_research = 1, blight_research = 1 }, 1500)
techs.t_power5.progress_count = 300 -- default 30

---------------------------------------------------------
-- 10. HYBRID TIER TWO
---------------------------------------------------------

-- Hybrid Power
techs.t_storage3.uplink_recipe = CreateUplinkRecipe({ robot_research = 2, human_research = 1, virus_research = 1 }, 1500) -- default ({ robot_research = 2, human_research = 1, virus_research = 1 }, 1500)
techs.t_storage3.progress_count = 200 -- default 20

-- Ultra-Tech Framework
techs.t_robotics3.uplink_recipe = CreateUplinkRecipe({ robot_research = 3, fused_electrodes = 3 }, 1500) -- default ({ robot_research = 3, fused_electrodes = 3 }, 1500)
techs.t_robotics3.progress_count = 200 -- default 20

-- Advanced Hybridization
techs.t_power21.uplink_recipe = CreateUplinkRecipe({ rainbow_research = 2, anomaly_heart = 1 }, 1500) -- default ({ rainbow_research = 2, anomaly_heart = 1 }, 1500)
techs.t_power21.progress_count = 400 -- default 40

---------------------------------------------------------
-- 11. HYBRID TIER THREE
---------------------------------------------------------

-- Anomaly Transformation (Particle Forge)
techs.t_particle_forge.uplink_recipe = CreateUplinkRecipe({ rainbow_research = 1, unstable_matter = 1 }, 1500) -- default ({ rainbow_research = 1, unstable_matter = 1 }, 1500)
techs.t_particle_forge.progress_count = 200 -- default 20

-- Quantum Robotics
techs.t_robotics4.uplink_recipe = CreateUplinkRecipe({ robot_research = 5, uframe = 5 }, 1500) -- default ({ robot_research = 5, uframe = 5 }, 1500)
techs.t_robotics4.progress_count = 200 -- default 20

-- Fusion Power
techs.t_fusion_generator.uplink_recipe = CreateUplinkRecipe({ rainbow_research = 5 }, 2000) -- default ({ rainbow_research = 5 }, 2000)
techs.t_fusion_generator.progress_count = 200 -- default 20