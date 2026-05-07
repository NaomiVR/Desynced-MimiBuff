local techs = data and data.techs

if not techs then
    print("[MimiBuff-tech_blight.lua] ERROR: techs not found")
end


if not MimiBuffGetOptionValue("mimibuff", "enable_research") then return end



---------------------------------------------------------
-- 1. BLIGHT TIER ONE
---------------------------------------------------------
-- Blight Shield
techs.t_blight_shield.uplink_recipe = CreateUplinkRecipe({ blight_plasma = 1 }, 700) -- default ({ blight_plasma = 1 }, 700)
techs.t_blight_shield.progress_count = 300 -- default 30

-- Plasma Concentration
techs.t_blight_plasma.uplink_recipe = CreateUplinkRecipe({ blight_plasma = 3, blight_extraction = 2 }, 500) -- default ({ blight_plasma = 3, blight_extraction = 2 }, 500)
techs.t_blight_plasma.progress_count = 200 -- default 20

-- Blight Visibility
techs.t_blight_visibility.uplink_recipe = CreateUplinkRecipe({ blight_plasma = 1, blight_extraction = 1 }, 700) -- default ({ blight_plasma = 1, blight_extraction = 1 }, 700)
techs.t_blight_visibility.progress_count = 400 -- default 40

---------------------------------------------------------
-- 2. BLIGHT TIER TWO
---------------------------------------------------------
-- Blight Stability
techs.t_blight_protection.uplink_recipe = CreateUplinkRecipe({ blight_datacube = 1, obsidian = 1 }, 1000) -- default ({ blight_datacube = 1, obsidian = 1 }, 1000)
techs.t_blight_protection.progress_count = 400 -- default 40

-- Conversion
techs.t_blight_magnifier.uplink_recipe = CreateUplinkRecipe({ blight_datacube = 4 }, 1000) -- default ({ blight_datacube = 4 }, 1000)
techs.t_blight_magnifier.progress_count = 200 -- default 20

-- Blight Power
techs.t_blight_power.uplink_recipe = CreateUplinkRecipe({ blight_datacube = 4, blight_extraction = 4 }, 200) -- default ({ blight_datacube = 4, blight_extraction = 4 }, 200)
techs.t_blight_power.progress_count = 100 -- default 10

---------------------------------------------------------
-- 3. BLIGHT TIER THREE
---------------------------------------------------------
-- Basic Terraformer
techs.t_grass_terraformer.uplink_recipe = CreateUplinkRecipe({ blight_research = 2, laterite = 4, obsidian = 4 }, 1500) -- default ({ blight_research = 2, laterite = 4, obsidian = 4 }, 1500)
techs.t_grass_terraformer.progress_count = 200 -- default 20

-- Magnification
techs.t_blight_conversion.uplink_recipe = CreateUplinkRecipe({ blight_crystal = 5, blight_research = 4 }, 2000) -- default ({ blight_crystal = 5, blight_research = 4 }, 2000)
techs.t_blight_conversion.progress_count = 200 -- default 20

-- Blight Terraformer
techs.t_blight_terraformer.uplink_recipe = CreateUplinkRecipe({ blight_research = 2, blight_extraction = 5 }, 1500) -- default ({ blight_research = 2, blight_extraction = 5 }, 1500)
techs.t_blight_terraformer.progress_count = 200 -- default 20