local components = data and data.components

if not components then
    print("[MimiBuff-components.lua] ERROR: components not found")
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
for _, component in pairs(components) do
    local recipe = component.production_recipe
    if recipe then
        -- Handle Production Speed
        if DO_TICKS and recipe.producers then
            for p_id, ticks in pairs(recipe.producers) do
                recipe.producers[p_id] = ticks / TIME_DIV
                print(string.format("[MimiBuff-components.lua] Divided production time for component '%s' by %d", p_id, TIME_DIV))
            end
        end

        -- Handle Item Multipliers
        if DO_ITEMS and recipe.ingredients then
            for ing_id, count in pairs(recipe.ingredients) do
                recipe.ingredients[ing_id] = math.max(1, math.floor(count * ITEM_MULT))
        print(string.format("[MimiBuff-components.lua] Multiplied ingredients for component '%s' by %d", ing_id, ITEM_MULT))
            end
        end
    end
end


---------------------------------------------------------
-- 2. INTEGRATED COMPONENTS
---------------------------------------------------------
-- Robot Factory
-- c_carrier_factory no changes

-- Particle Forge
components["c_particle_forge"].power = -15000 -- default -3000

-- Integrated Cell
components["c_integrated_cell"].power = 80 -- default 40
components["c_integrated_cell"].transfer_radius = 15 -- default 8

-- Integrated Power Cell
components["c_integrated_power_cell"].power = 400 -- default 200
components["c_integrated_power_cell"].transfer_radius = 20 -- default 12

-- Fusion Reactor
-- c_fusion_reactor no changes

-- Integrated Capacitor
-- c_integrated_capcitor no changes, is affeced by changes to parent component c_capacitor

-- Hi-Grade Capacitor
components["c_higrade_capacitor"].power_storage = 50000 -- default 10000
components["c_higrade_capacitor"].drain_rate = 500 -- default 50
components["c_higrade_capacitor"].charge_Rate = 2000 -- default 400

-- Integrated Behavior Controller
-- c_integrated_behavior no changes, is affected by changes to parent component c_behavior

-- Deployment
-- c_deployment no changes

-- Item Transporter
-- no changes, affected by integrated frame Beacon

-- Item Transporter
-- no changes, affected by integrated frame Large Beacon

-- Re-Simulator Core
components["c_resimulator"].power = -2000 -- default -400

-- Satellite System
components["c_satellite"].power = -500 -- default 0

-- Satellite Launcher
components["c_satellite_launcher"].power = -1000 -- default -20

-- Space Launcher
-- c_space_launcher no changes, is affected by changes to parent component c_satellite_launcher

-- Human Factory
components["c_human_factory"].power = -6000 -- default 0

-- Human Vehicle Factory
components["c_human_vehiclefactory"].power = -6000 -- default -1200

-- Blight Analyzer
components["c_human_datacomplex"].power = -10000 -- default -2000

-- Multimodal AI Center
components["c_human_aicenter"].power = -1000 -- default -100

-- Human Refinery
components["c_human_refinery"].power = -6000 -- default -600

-- Human Command Center
components["c_human_commandcenter"].power = -1000 -- default -100

-- Human Barracks
components["c_human_barracks"].power = -10000 -- default -1000

-- Human Spaceport
components["c_human_spaceport"].power = -10000 -- default -1000

-- Human Miner
components["c_human_miner"].miner_range = 5 -- default 1
components["c_human_miner"].power = -100 -- default -20

-- Mini Fission Plant
components["c_fission_reactor"].power = 200 -- default 20

-- Fusion Reactor
components["c_fusion_reactor"].power = 100 -- default 10
components["c_fusion_reactor"].power_storage = 1200000 -- default 60000
components["c_fusion_reactor"].drain_Rate = 100000 -- default 10000
components["c_fusion_reactor"].transfer_Radius = 40 -- default 20

-- Small Fusion Reactor
components["c_small_fusion_reactor"].power = 1000 -- default 200
components["c_small_fusion_reactor"].transfer_radisu = 40 -- default 20

-- Power Plant Transmitter
components["c_internal_transmitter"].bandwidth = 1000 -- default 100

-- Item Transporter
-- no changes, affected by integrated frame Human Warehouse

-- Autocannons
components["c_human_autocannons"].power = -200 -- default -20
components["c_human_autocannons"].trigger_radius = 10 -- default 6
components["c_human_autocannons"].trigger_radius = 10 -- default 6
components["c_human_autocannons"].damage = 25 -- default 12
components["c_human_autocannons"].damage_air_bonus = 2.0 -- default 1.5

-- Defense Drone Turret
-- c_defense_drone_turret no changes, is affected by changes to parent component c_turret

-- Support Launcher
components["c_human_supportlauncher"].trigger_radius = 10 --default 7
components["c_human_supportlauncher"].attack_radius = 10 --default 7
components["c_human_supportlauncher"].minimum_range = 2 -- default 1
components["c_human_supportlauncher"].damage = 200 -- default 90
components["c_human_supportlauncher"].duration = 15 -- default 30
components["c_human_supportlauncher"].blast = 3 -- default 1

-- HQ Deployment
-- c_human_deployment no changes

-- Human Science
components["c_human_science"].power = -5000 -- default -500
components["c_human_science"].uplink_rate = 0.8 -- default 0.2

-- Radar Array
components["c_radar_array"].power = -1500 -- default -100
components["c_radar_array"].range = 160 -- default 80

-- Radar Suite
components["c_radar_suite"].power = -150 -- default -20
components["c_radar_suite"].range = 65 -- default 30

-- Catchment and Connection
-- no changes, affected by integrated frame Human AI Exporer

-- Auto Repair Module
components["c_alien_heart_repair"].power = -500 -- default -5
components["c_alien_heart_repair"].range = 5 -- default 3
components["c_alien_heart_repair"].repair = 15 -- default 8

-- Malika
components["c_trilobyte_attack2"].damage = 200 -- default 35
components["c_trilobyte_attack2"].duration = 3 -- default 7
components["c_trilobyte_attack2"].attack_radius = 8 -- default 4

-- Bite
components["c_trilobyte_attack3"].damage = 170 -- default 49
components["c_trilobyte_attack3"].duration = 3 -- default 7

-- Claws
-- c_virus_claws no changes, is affected by changes to parent component c_miner

-- Virus Infector
-- c_ravager_virus_converter no changes

-- Hive Spawner
-- c_hive_spawner no changes

-- Bug Wave Spawner
-- c_bug_Wave_spawner no changes

-- Phase Transporter
-- c_alien_crane2 no changes

-- Resource Manipulator
-- c_alien_converter no changes

-- Alien Power Nova
components["c_alien_powergenerator"].power_storage = 1000000 -- default 100000
components["c_alien_powergenerator"].drain_rate = 50000 -- default 500
components["c_alien_powergenerator"].transfer_radius = 20 -- default 12

-- Integrated Ripper
components["c_alien_ripper"].trigger_radius = 15 -- default 7
components["c_alien_ripper"].attack_radius = 15 -- default 7
components["c_alien_ripper"].damage = 100 -- default 30
components["c_alien_ripper"].damage_air_bonus = 2.0 -- default 1.5
components["c_alien_ripper"].dotdps = 40 -- default 10
components["c_alien_ripper"].dothits = 5 -- default 3
components["c_alien_ripper"].extra_stat = {
    { "icon_tiny_damage", 40, "DoT Damage" },
    { "icon_tiny_damage", "3s", "DoT Duration" },
}

-- Alien Research
components["c_alien_research"].uplink_rate = 0.8 -- default 0.2

-- Alien Miner
components["c_alien_miner"].miner_range = 3 -- default 1

-- Plasma Bloom
-- c_alien_feeder no changes

-- Pylon
-- c_alien_droneport no changes

-- Phase Transporter
-- c_alien_crane3 no changes

-- Formation Crucible
-- c_alien_factory no changes

-- Alien Sensors
components["c_alien_sensor"].power = -300 -- default -10
components["c_alien_sensor"].range = 40 -- default 10

-- Stealth Ability
components["c_integrated_stealth"].power = -100 -- default -10
components["c_integrated_stealth"].charge_time = 15 -- default 30

-- Plasma Slicer
components["c_alien_mini_turret"].trigger_radius = 15 -- default 7
components["c_alien_mini_turret"].attack_radius = 15 -- default 7
components["c_alien_mini_turret"].damage = 150 -- default 70
components["c_alien_mini_turret"].duration = 3 -- default 7
components["c_alien_mini_turret"].dotdps = 50 -- default 10
components["c_alien_mini_turret"].dothits = 5 -- default 3
components["c_alien_mini_turret"].extra_stat = {
    { "icon_tiny_damage", 50, "DoT Damage" },
    { "icon_tiny_damage", "3s", "DoT Duration" },
}

-- Displace Ability
-- c_integrated_teleporter no changes

-- Plasma Blast
components["c_plasma_shot"].trigger_radius = 10 -- default 6
components["c_plasma_shot"].attack_radius = 10 -- default 6
components["c_plasma_shot"].damage = 120 -- default 84
components["c_plasma_shot"].duration = 3 -- default 7
components["c_plasma_shot"].blast = 3 -- default 1

-- Pulse Ripper
components["c_alien_attack"].trigger_radius = 20 -- default 10
components["c_alien_attack"].attack_radius = 20 -- default 10
components["c_alien_attack"].damage = 70 -- default 20
components["c_alien_attack"].damage_air_bonus = 2.0 -- default 1.5

-- Sentinel Ion Lance
components["c_sentinel_lance"].trigger_radius = 25 -- default 12
components["c_sentinel_lance"].attack_radius = 25 -- default 12
components["c_sentinel_lance"].damage = 120 -- default 56
components["c_sentinel_lance"].duration = 2 -- default 4
components["c_sentinel_lance"].beam_range = 25 -- default 12

-- Alien Deconstructor
components["c_alien_deconstructor"].deconstruct_time = 20 -- default 40

-- Fusion Bolt
components["c_fusion_bolt"].trigger_radius = 15 -- default 8
components["c_fusion_bolt"].attack_radius = 15 -- default 8
components["c_fusion_bolt"].damage = 180 -- default 144
components["c_fusion_bolt"].duration = 3 -- default 6

-- Monolith Lightning
components["c_monolith_lightning"].trigger_radius = 40 -- default 20
components["c_monolith_lightning"].attack_radius = 40 -- default 20
components["c_monolith_lightning"].damage = 600 -- default 252
components["c_monolith_lightning"].duration = 3 -- default 7
components["c_monolith_lightning"].beam_range = 40 -- default 20
components["c_monolith_lightning"].damage_air_bonus = 1.0 -- default 0.5
components["c_monolith_lightning"].dotdps = 40 -- default 10
components["c_monolith_lightning"].dothits = 5 -- default 3
components["c_monolith_lightning"].extra_stat = {
    { "icon_tiny_damage", 40, "DoT Damage" },
    { "icon_tiny_damage", "3s", "DoT Duration" },
}

-- Reforming Pool
-- c_reforming_pool no changes

-- Reformation Synthesizer
components["c_synthesis_pool"].power = -1000 -- default -100

-- Alien Broad Sensors
components["c_alien_sensor_wide"].power = -100 -- default -10
components["c_alien_sensor_wide"].range = 70 -- default 25

-- Alien Teleporter
-- c_alien_teleporter no changes

-- Observer Eye
-- c_observer_eye no changes

-- Item Transference
-- c_time_egg_transference no changes

-- Heart Shard
-- c_heart_factory no changes

-- Console
-- c_admin_shell no changes

-- Bloom Producer
components["c_bloom_producer"].power = -400 -- default -30

---------------------------------------------------------
-- 3. INTERNAL COMPONENTS
---------------------------------------------------------
-- Power Cell
components["c_power_cell"].desc = "Transmits <hl>5000</> power per second over a medium area" -- default "Transmits <hl>500</> power per second over a small area"
components["c_power_cell"].power = 1000 -- default 100
components["c_power_cell"].transfer_radius = 25 -- default 10

-- Portable Power Field
components["c_portable_relay"].transfer_radius = 5 -- default 3

-- Capacitor
components["c_capacitor"].power_storage = 10000 -- default 4000
components["c_capacitor"].drain_rate = 50 -- default 20
components["c_capacitor"].charge_rate = 500 -- default 160

-- Internal Storage
components["c_internal_storage"].slots = { storage = 2 } -- default 1

-- Shared Storage
-- c_shared_storage no changes

-- Portable Transporter
components["c_portablecrane"].range = 3 -- default 1

-- Portable Shield Generator
components["c_shield_generator"].desc = "Energy shield - Uses power to charge a shield that mitigates up to <hl>120</> damage" -- default "Energy shield - Uses power to charge a shield that mitigates up to <hl>60</> damage"
components["c_shield_generator"].shield = 120 -- default 60

-- Shield Generator
components["c_shield_generator2"].desc = "Energy shield - Uses power to charge a shield that mitigates up to <hl>200</> damage" -- default "Energy shield - Uses power to charge a shield that mitigates up to <hl>100</> damage"
components["c_shield_generator2"].shield = 200 -- default 100

-- Portable Radar
components["c_portable_radar"].range = 50 -- default 30
components["c_portable_radar"].charge_time = 0.5 -- default 2

-- Scout Radar
-- c_scout_radar no changes

-- Repair Kit
components["c_repairkit"].repair = 2 -- default 0.5

-- Behavior Controller
-- c_behavior no changes

-- Deployer
-- c_deployer no changes

-- Sign Post
-- c_signpost no changes

-- Signal Reader
-- c_signal reader no changes

-- Radio Transmitter
-- c_radio_transmitter no changes

-- Radio Receiver
-- c_radio_receiver no changes

-- Internal Overclock Module
components["c_moduleefficiency"].boost = 100 -- default 20
components["c_moduleefficiency"].desc = "Overclock component by 100%" -- default "Overclock component by 20%"

-- Internal Health Module
components["c_modulehealth"].boost = 400 -- default 200
components["c_modulehealth"].desc = "Increased structural integrity, adds 400 durability" -- default "Increased structural integrity, adds 200 durability"

-- Internal Movement Speed Module
components["c_modulespeed"].boost = 100 -- default 20
components["c_modulespeed"].desc = "Increase unit movement speed by 100%" -- default "Increase unit movement speed by 20%"

-- Internal Visibility Module
components["c_modulevisibility"].boost = 10 -- default 5
components["c_modulevisibility"].desc = "Increase visibility range by 10" -- default "Increase visibility range by 5"

-- Resimulator Core
-- c_resimulator_core no changes

-- Blight Simulation Core
components["c_blight_ac"].power = -10000 -- default -100

-- Human Simulation Core
components["c_human_ac"].power = -10000 -- default 0

-- Virus Simulation Core
components["c_virus_ac"].power = -10000 -- default 0

-- Alien Simulation Core
components["c_alien_ac"].power = -10000 -- default -100

-- Reformation Core
components["c_alien_sc"].power = -10000 -- default -100

-- Blight Charger
-- c_blight_shield no changes

-- Internal Blight Container
components["c_blight_container_i"].power = -100 -- default 0
components["c_blight_container_i"].slots = { gas = 3 } -- default 1

-- Hyper Shield Generator
components["c_shield_generator3"].desc =  "Energy shield - Uses power to charge a shield that mitigates up to <hl>300</> damage" -- default "Energy shield - Uses power to charge a shield that mitigates up to <hl>150</> damage"
components["c_shield_generator3"].shield = 300 -- default 150

-- Purifying Terraformer
components["c_terraformer"].power = -20000 -- default -200
components["c_terraformer"].terraforming_range = 50 -- default 10
components["c_terraformer"].terraforming_rate = -0.1 -- default -0.001

-- Alien Terraformer
components["c_blight_terraformer"].power = -20000 -- default -50
components["c_blight_terraformer"].terraforming_range = 50 -- default 10
components["c_blight_terraformer"].terraforming_rate = 0.1 -- default 0.001

-- Micro Reactor
components["c_micro_reactor"].power_storage = 500000 -- default 150000
components["c_micro_reactor"].drain_rate = 50000  -- default 2000

-- Drone Component
components["c_drone_comp"].slots = { drone = 2 } -- default 1

-- Virus Protection
-- c_virus_protection no changes

-- Internal Virus Containment
components["c_virus_container_i"].power = -100 -- default 0

-- Virus Infector
-- c_virus_converter no changes

-- Warp Anchor
-- c_warp_anchor no changes

-- Virus Cure
components["c_virus_cure"].trigger_radius = 15 -- default 3

-- Internal Anomaly Containment
components["c_anomaly_container_i"].power = -100 -- default 0

-- Anomaly Lattice
-- c_anomaly_lattice no changes

-- Alien Stealth Module
components["c_alien_stealth"].power = -100 -- default -50
components["c_alien_stealth"].charge_time = 15 -- default 30

-- Unit Displacer
components["c_portable_teleporter"].power = -500 -- default -20

-- AI Behavior Controller
-- c_autobase no changes

-- Alien Decryption Key
-- c_alien_key no changes

---------------------------------------------------------
-- 4. SMALL COMPONENTS
---------------------------------------------------------
-- Fabrictor
components["c_fabricator"].power = -75 -- default -5

-- Miner
components["c_miner"].miner_range = 3 -- default 1

-- Laser Mining Tool
components["c_adv_miner"].miner_range = 5 -- default 1

-- Deconstructor
components["c_deconstructor"].power = -500 -- default -100
components["c_deconstructor"].range = 10 -- default 5
components["c_deconstructor"].duration = 5 -- default 10

-- Crystal Power
components["c_crystal_power"].drain_rate = 60 -- default 30, multiplies by tick rate of 5 so equals 150 power per second
components["c_crystal_power"].desc = "Charges itself by consuming crystals, storing energy and supplies <hl>300</> power to your logistics network every second, but only when required" -- default "Charges itself by consuming crystals, storing energy and supplies <hl>150</> power to your logistics network every second, but only when required"

-- Solar Cell
components["c_solar_cell"].solar_power_generated = 20 -- default 10, multiplies by tick rate of 5 so equals 50 power per second
components["c_solar_cell"].solar_power_summer = 10 -- default 5
components["c_solar_cell"].desc = "Photovoltaic cell that supplies <hl>100</> power to your grid during daylight, with increased output throughout summer" -- default "Photovoltaic cell that supplies <hl>50</> power to your grid during daylight, with increased output throughout summer"

-- Small Power Field
components["c_small_relay"].transfer_radius = 15 -- default 8

-- Small Battery
components["c_small_battery"].power_storage = 60000 -- default 30000

-- Small Storage
components["c_small_storage"].slots = { storage = 6 } -- default 4

-- Drone Port
components["c_drone_port"].slots = { drone = 5 } -- default 2

-- Small Turret
components["c_portable_turret"].trigger_radius = 10 -- default 7
components["c_portable_turret"].attack_radius = 10 -- default 7
components["c_portable_turret"].damage = 15 -- default 8
components["c_portable_turret"].duration = 2.5 -- default 5, charge duration is 1 second as 5 ticks per second

-- Small Advanced Turret
components["c_adv_portable_turret"].trigger_radius = 10 -- default 7
components["c_adv_portable_turret"].attack_radius = 10 -- default 7
components["c_adv_portable_turret"].damage = 25 -- default 18
components["c_adv_portable_turret"].duration = 3 -- default 6, charge duration is 1.2 seconds as 5 ticks per second

-- Melee Pulse Attack
components["c_melee_pulse"].trigger_radius = 2 -- default 1
components["c_melee_pulse"].attack_radius = 2 -- default 1
components["c_melee_pulse"].damage = 100 -- default 64
components["c_melee_pulse"].duration = 4 -- default 8
components["c_melee_pulse"].shield_charge = 50 -- default 20
components["c_melee_pulse"].extra_stat = {
    { "icon_tiny_damage", 50, "Shield Recharge" }
}

-- Small Radar
components["c_small_radar"].range = 60 -- default 40

-- Intel Scanner
components["c_small_scanner"].power = -200 -- default -10

-- Small AOE Repair Component
components["c_repairer_small_aoe"].repair = 4 -- default 2

-- Light
-- c_light no changes

-- Light RGB
-- c_light_rgb no changes

-- Small Overclocking Module
components["c_moduleefficiency_s"].boost = 150 -- default 50
components["c_moduleefficiency_s"].desc = "Overclock component by 150%" -- default "Overclock component by 50%"

-- Small Health Module
components["c_modulehealth_s"].boost = 800 -- default 400
components["c_modulehealth_s"].desc = "Increased structural integrity, adds 800 durability" -- default "Increased structural integrity, adds 400 durability"

-- Small Movement Speed Module
components["c_modulespeed_s"].boost = 150 -- default 50
components["c_modulespeed_s"].desc = "Increase unit movement speed by 150%" -- default "Increase unit movement speed by 50%"

-- Small Visibility Module
components["c_modulevisibility_s"].boost = 20 -- default 10
components["c_modulevisibility_s"].desc = "Increase visibility range by 20" -- default "Increase visibility range by 10"

-- Blight Extractor
components["c_blight_extractor"].slots = { gas = 2 } -- default 1
components["c_blight_extractor"].extraction_time = 25 -- default 75, divides by tick rate of 5 so equals 15 seconds extraction time

-- Blight Container Small
components["c_blight_container_s"].power = -500 -- default 0
components["c_blight_container_s"].slots = { gas = 5 } -- default 3

-- Blight Turret
components["c_portable_turret_red"].trigger_radius = 10 -- default 7
components["c_portable_turret_red"].attack_radius = 10 -- default 7
components["c_portable_turret_red"].damage = 90 -- default 44
components["c_portable_turret_red"].duration = 3 -- default 6, charge duration is 1.2 seconds as 5 ticks per second
components["c_portable_turret_red"].dotdps = 30 -- default 20
components["c_portable_turret_red"].dothits = 4 -- default 3
components["c_portable_turret_red"].extra_stat = {
    { "icon_tiny_damage", 30, "DoT Damage" },
    { "icon_tiny_damage", "4s", "DoT Duration" },
}

-- Plasma Turret
components["c_plasma_turret"].trigger_radius = 10 -- default 7
components["c_plasma_turret"].attack_radius = 10 -- default 7
components["c_plasma_turret"].damage = 70 -- default 33
components["c_plasma_turret"].duration = 1 -- default 3
components["c_plasma_turret"].dotdps = 50 -- default 25
components["c_plasma_turret"].dothits = 5 -- default 3
components["c_plasma_turret"].extra_stats = {
    { "icon_tiny_damage", 50, "DoT Damage" },
    { "icon_tiny_damage", "3s", "DoT Duration" },
}

-- Power Unit
components["c_power_unit"].power = 400 -- default 200, multiplies by tick rate of 5 so equals 1000 power per second

-- Twin Autocannons
components["c_twin_autocannons"].trigger_radius = 10 -- default 6
components["c_twin_autocannons"].attack_radius = 10 -- default 6
components["c_twin_autocannons"].damage = 20 -- default 10
components["c_twin_autocannons"].damage_air_bonus = 2.0 -- default 1.5

-- Recoilless Rifle
components["c_light_cannon"].trigger_radius = 12 -- default 8
components["c_light_cannon"].attack_radius = 12 -- default 8
components["c_light_cannon"].damage = 60 -- default 30
components["c_light_cannon"].duration = 1 -- default 3

-- Hacking Tool
-- c_hacking_tool no changes

-- Viral Turret
components["c_portable_turret_green"].trigger_radius = 10 -- default 7
components["c_portable_turret_green"].attack_radius = 10 -- default 7
components["c_portable_turret_green"].damage = 45 -- default 32
components["c_portable_turret_green"].duration = 5 -- default 8, charge duration is 1.6 seconds as 5 ticks per second

-- Viral Pulse Attack
components["c_viral_pulse"].trigger_radius = 2 -- default 1
components["c_viral_pulse"].attack_radius = 2 -- default 1
components["c_viral_pulse"].damage = 240 -- default 112
components["c_viral_pulse"].duration = 5 -- default 8

-- Drain Turret
components["c_turret_powerflower"].trigger_radius = 12 -- default 8
components["c_turret_powerflower"].attack_radius = 12 -- default 8
components["c_turret_powerflower"].damage = 70 -- default 30
components["c_turret_powerflower"].duration = 3 -- default 5

-- Particle Ripper
components["c_particle_ripper"].trigger_raidus = 10 -- default 7
components["c_particle_ripper"].attack_radius = 10 -- default 7
components["c_particle_ripper"].damage = 60 -- default 30
components["c_particle_ripper"].damage_air_bonus = 2.0 -- default 1.5
components["c_particle_ripper"].dotdps = 25 -- default 10
components["c_particle_ripper"].dothits = 4 -- default 3
components["c_particle_ripper"].extra_stat = {
    { "icon_tiny_damage", 25, "DoT Damage" },
    { "icon_tiny_damage", "3s", "DoT Duration" },
}

--------------------------------------------------------
-- 5. MEDIUM COMPONENTS
--------------------------------------------------------
-- Assembler
components["c_assembler"].power = -150 -- default -10

-- Robotics Assembler
components["c_robotics_factory"].power = -450 -- default -30

-- Refinery
components["c_refinery"].power = -550 -- default -50

-- Advanced Refinery
components["c_advanced_refinery"].power = -1500 -- default -400

-- Wind Turbine
components["c_wind_turbine"].max_power = 20 -- default 10, multiplies by tick rate of 5 so equals 50 power per second
components["c_wind_turbine"].desc = "Constant <hl>100</> power generation per second, <hl>200</> when located on the plateau" -- default "Constant <hl>50</> power generation per second, <hl>100</> when located on the plateau"

-- Solar Panel
components["c_solar_panel"].solar_power_generated = 80 -- default 40, multiplies by tick rate of 5 so equals 200 power per second
components["c_solar_panel"].solar_power_summer = 60 -- default 30
components["c_solar_panel"].power = 40 -- default 20, multiplies by tick rate of 5 so equals 100 power per second
components["c_solar_panel"].desc = "Solar Panel that generates <hl>600</> power throughout the day and <hl>200</> during the night, with increased output during summer" -- default "Solar Panel that generates <hl>300</> power throughout the day and <hl>100</> during the night, with increased output during summer"

-- Power Field
components["c_power_relay"].transfer_radius = 35 -- default 15

-- Power Transmitter
components["c_power_transmitter"].bandwidth = 100 -- default 20, multiplies by tick rate of 5 so equals 100 power transfer per second

-- Medium Capacitor
components["c_medium_capacitor"].power_storage = 100000 -- default 50000
components["c_medium_capacitor"].drain_rate = 500 -- default 250, multiplies by tick rate of 5 so equals 1250 power per second
components["c_medium_capacitor"].charge_rate = 4000 -- default 2000, multiplies by tick rate of 5 so equals 10000 power per second

-- Medium Battery
components["c_battery"].power_storage = 500000 -- default 100000
components["c_battery"].drain_rate = 10000 -- default 100
components["c_battery"].charge_rate = 10000 -- default 100

-- Medium Storage
components["c_medium_storage"].slots = { storage = 15 } -- default 9

-- Item Transporter
components["c_crane"].range = 5 -- default 3

local c_crane = components["c_crane"]


function c_crane:on_add(comp)
	local owner = comp.owner
	owner.crane_range = math.max(owner.crane_range, self.range)
	owner.transfer_boost = owner.transfer_boost + 10
end


function c_crane:on_remove(comp)
	local owner = comp.owner
	local owner_def = owner.def
	local new_range, new_boost = (owner_def.crane_range or 0), (owner_def.transfer_boost or 0)
	for i=1,999 do
		local crane_comp = owner:FindComponent("c_crane", true, i)
		if not crane_comp then break end
		if crane_comp ~= comp then
			new_range = math.max(new_range, crane_comp.def.range)
			new_boost = new_boost + 10
		end
	end
	owner.crane_range = new_range
	owner.transfer_boost = new_boost
end

-- Turret
components["c_turret"].trigger_radius = 12 -- default 7
components["c_turret"].attack_radius = 12 -- default 7
components["c_turret"].damage = 100 -- default 72
components["c_turret"].duration = 3 -- default 6, charge duration is 1.2 seconds as 5 ticks per second

-- Laser Turret
components["c_laser_turret"].trigger_radius = 12 -- default 7
components["c_laser_turret"].attack_radius = 12 -- default 7
components["c_laser_turret"].damage = 180 -- default 128
components["c_laser_turret"].duration = 3 -- default 6, charge duration is 1.2 second as 5 ticks per second

-- Photon Beam
components["c_photon_beam"].trigger_radius = 15 -- default 8
components["c_photon_beam"].attack_radius = 15 -- default 8
components["c_photon_beam"].damage = 170 -- default 120
components["c_photon_beam"].duration = 5 -- default 10, charge duration is 2 seconds as 5 ticks per second
components["c_photon_beam"].beam_range = 15 -- default 8
components["c_photon_beam"].damage_air_bonus = 1.0 -- default 0.5

-- Pohoton Cannon
components["c_photon_cannon"].trigger_radius = 15 -- default 10
components["c_photon_cannon"].attack_radius = 15 -- default 10
components["c_photon_cannon"].damage = 250 -- default 180
components["c_photon_cannon"].duration = 10 -- default 20, charge duration is 4 seconds as 5 ticks per second

-- Pulse Disruptor Attack
components["c_pulse_disrupter"].trigger_radius = 2 -- default 1
components["c_pulse_disrupter"].attack_radius = 2 -- default 1
components["c_pulse_disrupter"].damage = 180 -- default 96
components["c_pulse_disrupter"].duration = 5 -- default 8

-- Pulse Lasers
components["c_pulselasers"].trigger_radius = 10 -- default 6
components["c_pulselasers"].attack_radius = 10 -- default 6
components["c_pulselasers"].damage = 15 -- default 8

-- Uplink
components["c_uplink"].power = -500 -- default -20
components["c_uplink"].uplin_rate = 2 -- default 1

-- Reapir Component
components["c_repairer"].repair = 5 -- default 1

-- AOE Repair Component
components["c_repairer_aoe"].repair = 6 -- default 3

-- Medium Overclocking Module
components["c_moduleefficiency_m"].boost = 200 -- default 100
components["c_moduleefficiency_m"].desc = "Overclock component by 200%" -- default "Overclock component by 100%"

-- Medium Health Module
components["c_modulehealth_m"].boost = 1200 -- default 600
components["c_modulehealth_m"].desc = "Increased structural integrity, adds 1200 durability" -- default "Increased structural integrity, adds 600 durability"

-- Medium Movement Speed Module
components["c_modulespeed_m"].boost = 200 -- default 80
components["c_modulespeed_m"].desc = "Increase unit movement speed by 200%" -- default "Increase unit movement speed by 80%"

-- Medium Visibility Module
components["c_modulevisibility_m"].boost = 30 -- default 15
components["c_modulevisibility_m"].desc = "Increase visibility range by 30" -- default "Increase visibility range by 15"

-- Blight Magnifier
components["c_blight_magnifier"].range = 10 -- default 2
components["c_blight_magnifier"].power = -500 -- default -100
components["c_blight_magnifier"].magnify_time = 40 -- default 200, divides by tick rate of 5 so equals 40 seconds magnification time

local c_blight_magnifier = components["c_blight_magnifier"]

function c_blight_magnifier:on_update(comp, cause)
	local owner = comp.owner
	if owner.powered_down or not owner.is_placed then
		comp:StopEffects()
		return comp:SetStateSleep(50)
	end
	local is_finished_working = (cause & CC_FINISH_WORK == CC_FINISH_WORK)
	if is_finished_working then
		local reward = 5 -- default 1
		local slot = owner:FindSlot("anomaly_particle", 1)
		if slot then
			slot:RemoveStack(1, true)
			reward = 15 -- default 3
		end

		Map.FindClosestEntity(owner, self.range, function(e)
			if AddResourceHarvestItemAmount(e, reward, 10000) then
				e:SetRegisterNum(FRAMEREG_STORE, 1)
			end
		end, FF_RESOURCE)
	end
	comp:PlayWorkEffect("fx_alien_liquid")
	return comp:SetStateStartWork(self.magnify_time, false)
end

-- Resource Converter
-- c_blight_converter no changes

-- Blight Power Generator
components["c_blight_power"].power = 1000 -- default 0, base only has extra_power in c_blight_power:on_update(comp, cause)

-- Blight Crystal Power
components["c_blightcrystal_power"].power_storage = 200000 -- default 20000
components["c_blightcrystal_power"].drain_rate = 10000 -- default 100

-- Blight Container Medium
components["c_blight_container_m"].power = -5000 -- default 0
components["c_blight_container_m"].slots = { gas = 10 } -- default 6

-- Plasma Cannon
components["c_plasma_cannon"].trigger_radisus = 25 -- default 15
components["c_plasma_cannon"].attack_radius = 25 -- default 15
components["c_plasma_cannon"].minimum_range = 8 -- default 3
components["c_plasma_cannon"].damage = 600 -- default 250
components["c_plasma_cannon"].duration = 12 --default 25
components["c_plasma_cannon"].blast = 5 -- default 2
components["c_plasma_cannon"].dotdps = 25 -- default 10
components["c_plasma_cannon"].dothits = 5 -- default 3
components["c_plasma_cannon"].extra_stat = {
    { "icon_tiny_damage", 25, "DoT Damage" },
	{ "icon_tiny_damage", "3s", "DoT Duration" },
}

-- Laser Extractor
components["c_extractor"].power = -200 -- default -20

-- Drone Launcher
components["c_drone_launcher"].slots = { drone = 10 } -- default 6

-- Repair Garage
components["c_repairport"].power = -500 -- default -2
components["c_repairport"].slots = { garage = 5 } -- default 1
components["c_repairport"].repair_amount = 100 -- default 10
components["c_repairport"].repair_time = 5 -- default  20

-- Railgun
components["c_railgun"].trigger_radius = 15 -- default 10
components["c_railgun"].attack_radius = 15 -- default 10
components["c_railgun"].damage = 300 -- default 168
components["c_railgun"].duration = 5 -- default 10, charge duration is 2 seconds as 5 ticks per second
components["c_railgun"].damage_air_bonus = 1.0 -- default 0.5

-- Tank Turret
components["c_human_tank_turret"].trigger_radius = 10 -- default 6
components["c_human_tank_turret"].attack_radius = 10 -- default 6
components["c_human_tank_turret"].damage = 250 -- default 180
components["c_human_tank_turret"].duration = 5 -- default 9

-- Long-Range Radar
components["c_radar"].range = 100 -- default 50
components["c_radar"].radar_show_range = 20 -- default 10

-- Virus Ray
components["c_virus_jamming"].trigger_radius = 10 -- default 5
components["c_virus_jamming"].attack_radius = 10 -- default 5

-- Virus Possessor
-- c_virus_entity_holder no changes

-- Virus Destabilizer
components["c_virus_destabilizer"].power = -100 -- default -5

-- Crypto BitLock
components["c_virus_bitlock"].trigger_radius = 10 -- default 5
components["c_virus_bitlock"].attack_radius = 10 -- default 5

-- Component Recycler
components["c_virus_recycler"].power = -1000 -- default 0
components["c_virus_recycler"].recycle_time = 10 -- default 50

-- Warp Bridge
components["c_warp_bridge"].power = -2000 -- default -200
components["c_warp_bridge"].slots = { virus = 3 } -- default 1

-- Virus Duplicator
components["c_virus_duplicator"].power = -20000 -- default -200

-- Hybrid Beam Cannon
components["c_hybrid_beam_cannon"].trigger_radius = 25 -- default 15
components["c_hybrid_beam_cannon"].attack_radius = 25 -- default 15
components["c_hybrid_beam_cannon"].damage = 900 -- default 300
components["c_hybrid_beam_cannon"].duration = 25 -- default 15
components["c_hybrid_beam_cannon"].beam_range = 25 -- default 15
components["c_hybrid_beam_cannon"].damage_air_bonus = 1.0 -- default 0.5
components["c_hybrid_beam_cannon"].dotdps = 50 -- default 10
components["c_hybrid_beam_cannon"].dothits = 5 -- default 3
components["c_hybrid_beam_cannon"].extra_stat = {
    { "icon_tiny_damage", 50, "DoT Damage" },
    { "icon_tiny_damage", "3s", "DoT Duration" },
}

-- Phase Turret
components["c_turret_phaseflower"].trigger_radius = 10 -- default 5
components["c_turret_phaseflower"].attack_radius = 10 -- default 5
components["c_turret_phaseflower"].duration = 10 -- default 16

-- Ion Lance
components["c_alien_ion_lance"].trigger_radius = 20 -- default 12
components["c_alien_ion_lance"].attack_radius = 20 -- default 12
components["c_alien_ion_lance"].damage = 150 -- default 72
components["c_alien_ion_lance"].duratuon = 2 -- default 4
components["c_alien_ion_lance"].beam_range = 20 -- default 12
components["c_alien_ion_lance"].damage_air_bonus = 1.0 -- default 0.5
components["c_alien_ion_lance"].dotdps = 40 -- default 10
components["c_alien_ion_lance"].dothits = 5 -- default 3
components["c_alien_ion_lance"].extra_stat = {
    { "icon_tiny_damage", 40, "DoT Damage" },
    { "icon_tiny_damage", "3s", "DoT Duration" },
}

--------------------------------------------------------
-- 6. LARGE COMPONENTS
--------------------------------------------------------
-- Advanced Assembler
components["c_advanced_assembler"].power = -6000 -- default -350

-- Data Analyzer
components["c_data_analyzer"].power = -2000 -- default -200

-- Large Wind Turbine
components["c_wind_turbine_l"].max_power = 80 -- default 40, multiplies by tick rate of 5 so equals 200 power per second
components["c_wind_turbine_l"].desc = "Constant <hl>400</> power generation per second, <hl>800</> when located on the plateau" -- default "Constant <hl>200</> power generation per second, <hl>400</> when located on the plateau"

-- Power Core
components["c_power_core"].power = 4000 -- default 400
components["c_power_core"].transfer_radius = 25 -- default 15

-- Large Storage
components["c_large_storage"].desc = "A large storage component with <hl>40 slots</>" -- default "A larger storage component with <hl>20 slots</>"
components["c_large_storage"].slots = { storage = 40 } -- default 20

-- Large Overclocking Module
components["c_moduleefficiency_l"].boost = 300 -- default 150
components["c_moduleefficiency_l"].desc = "Overclock component by 300%" -- default "Overclock component by 150%"

-- Large Health Module
components["c_modulehealth_l"].boost = 2000 -- default 1000
components["c_modulehealth_l"].desc = "Increased structural integrity, adds 2000 durability" -- default "Increased structural integrity, adds 1000 durability"

-- Large Movement Speed Module
components["c_modulespeed_l"].boost = 300 -- default 120
components["c_modulespeed_l"].desc = "Increase unit movement speed by 300%" -- default "Increase unit movement speed by 120%"

-- Large Visibility Module
components["c_modulevisibility_l"].boost = 50 -- default 20
components["c_modulevisibility_l"].desc = "Increase visibility range by 50" -- default "Increase visibility range by 20"

-- Robot Re-Simulation Component
-- c_resimulator_large no changes

-- Hyrbid Human Factory
components["c_human_factory_robots"].power = -2000 --default -200

-- Human Science Analyzer
components["c_human_science_analyzer_robots"].power = -4000 -- default -400

-- Large Power Field
components["c_large_power_relay"].transfer_radius = 50 -- default 20

-- Large Power Transmitter
components["c_large_power_transmitter"].desc = "Transmits <hl>1000</> power to a remote target" -- default "Transmits <hl>500</> power to a remote target"
components["c_large_power_transmitter"].bandwidth = 1000 -- default 100

-- Large Battery
components["c_large_battery"].power_storage = 2000000 -- default 1000000
components["c_large_battery"].drain_rate = 2000 -- default 1000, multiplies by tick rate of 5 so equals 5000 power per second
components["c_large_battery"].charge_rate = 2000 -- default 1000, multiplies by tick rate of 5 so equals 5000 power per second

-- Missle Launcher
components["c_missile_turret"].trigger_radius = 20 -- default 16
components["c_missile_turret"].attack_radius = 20 -- default 16
components["c_missile_turret"].minimum_range = 3 -- default 4
components["c_missile_turret"].damage = 1000 -- default 600
components["c_missile_turret"].duration = 15 -- default 30, charge duration is 3 seconds as 6 ticks per second
components["c_missile_turret"].burst = 5 -- default 2

-- Heavy Rocket Launcher
components["c_human_missilelauncher"].trigger_radius = 40 -- default 20
components["c_human_missilelauncher"].attack_radius = 40 -- default 20
components["c_human_missilelauncher"].minimum_range = 5 -- default 4
components["c_human_missilelauncher"].damage = 300 -- default 162
components["c_human_missilelauncher"].duration = 20 -- default 18
components["c_human_missilelauncher"].blast = 7 -- default 2

-- Landing Pad
components["c_landing_pad"].slots = { flyer = 5 } -- default 3

-- Robot Hive
components["c_virus_decomposer"].power = -200 -- default -70

-- Alien Factory
components["c_alien_factory_robots"].power = -2500 -- default -500
components["c_alien_factory_robots"].slots = { anomaly = 3 } -- default 2

-- Reforming Pool Component
components["c_reforming_pool_comp"].power = -500 -- default -40

-- Formation Crucible Component
components["c_alien_factory_comp"].power = -500 -- default 0

-- Advanced Alien Factory
components["c_adv_alien_factory"].power = -4000 -- default -400

-- Plasma Bloom Component
components["c_plasma_bloom_comp"].power = -500 -- default -30
components["c_plasma_bloom_comp"].extraction_time = 25 -- default 50

-- Alien Power Nova Component
components["c_alien_powergenerator_comp"].transfer_radius = 10 -- default 6
components["c_alien_powergenerator_comp"].power_storage = 100000 -- default 50000
components["c_alien_powergenerator_comp"].drain_rate = 1000 -- default 259

-- Long Range Phase Transporter
components["c_phase_transporter5"].power = -5000 -- default -50
components["c_phase_transporter5"].range = 15 --default 5

-- Sentinel Ion Lance Turret
components["c_sentinel_lance_comp"].trigger_radius = 20 -- default 10
components["c_sentinel_lance_comp"].attack_radius = 20 -- default 10
components["c_sentinel_lance_comp"].damage = 90 -- default 42
components["c_sentinel_lance_comp"].duration = 2 -- default 4
components["c_sentinel_lance_comp"].beam_range = 20 -- default 10
components["c_sentinel_lance_comp"].dotdps = 60 -- default 30
components["c_sentinel_lance_comp"].dothits = 7 -- default 5
components["c_sentinel_lance_comp"].extra_stat = {
    { "icon_tiny_damage", 60, "DoT Damage" },
    { "icon_tiny_damage", "5s", "DoT Duration" },
}

-- Monolith Lightning Component
components["c_monolith_lightning_comp"].power = -1000 -- default -100
components["c_monolith_lightning_comp"].trigger_radius = 25 -- default 15
components["c_monolith_lightning_comp"].attack_radius = 25 -- default 15
components["c_monolith_lightning_comp"].damage = 400 -- default 170
components["c_monolith_lightning_comp"].duration = 5 -- default 7
components["c_monolith_lightning_comp"].beam_range = 25 -- default 15
components["c_monolith_lightning_comp"].dotdps = 30 -- default 10
components["c_monolith_lightning_comp"].dothits = 5 -- default 3
components["c_monolith_lightning_comp"].extra_stat = {
    { "icon_tiny_damage", 30, "DoT Damage" },
    { "icon_tiny_damage", "5s", "DoT Duration" },
}

-- Unit Teleporter
components["c_unit_teleport"].power = -3000 -- default -30
components["c_unit_teleport"].teleport_cost = 150000 -- default 0
components["c_unit_teleport"].slots = { garage = 2 } -- default 1

-- Nexaspire Component
components["c_alien_research_comp"].power = -1000 -- default -100

-- Sensor Spike Component
components["c_sensor_spike_comp"].power = -1000 -- default -100
components["c_sensor_spike_comp"].range = 40 -- default 20

-- Time Egg Component
components["c_time_egg_transference_comp"].power = -1500 -- defaualt -50

-- The Simulator
-- c_the_simulator no changes