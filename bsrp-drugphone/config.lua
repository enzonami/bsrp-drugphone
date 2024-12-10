
Config = {}

print("=== Bsrp-Drugphone Configuration Initializing ===")
print("🅱🆂🆁🅿-⊂(▀¯▀⊂ )🇧 🇱 🇦 🇨 🇰 - 🇸 🇭 🇦 🇩 🇪 🇸 ⊂(▀¯▀⊂ )🅱🆂🆁🅿 ")

-----------------------------------
-- 🔧 Debug Settings
-----------------------------------
-- Debug Mode
Config.Debug = true

-----------------------------------
-- 💊 Drug Definitions
-----------------------------------

-- Dynamic Pricing Toggle
Config.DynamicPricing = true -- Set to false to disable dynamic pricing

-- Drugs
Config.Drugs = {
    weed = { basePrice = 100 },
    coke = { basePrice = 200 },
    meth = { basePrice = 300 }
}

-----------------------------------
-- 💰 Currency Settings
-----------------------------------

Config.Currency = 'money'

-----------------------------------
-- 🤖 NPC Settings
-----------------------------------
Config.NPC = {
    locations = {
        vector4(100, 200, 30, 90),
        vector4(200, 300, 30, 270)
    },
    model = `a_m_m_tranvest_01`,
    interactionDistance = 5.0,
    blip = {
        enabled = true,
        sprite = 353,
        color = 1,
        scale = 0.9,
        name = "Drug Dealer"
    },
    idleAnimations = {
        "WORLD_HUMAN_STAND_MOBILE",
        "WORLD_HUMAN_SMOKING",
        "WORLD_HUMAN_DRINKING"
    }
}

Config.Animations = {
    selling = {
        dict = "mp_common",
        clip = "givetake1_a",
        duration = 2000 -- In milliseconds
    }
}

-----------------------------------
-- ⏲️ Cooldown Settings
-----------------------------------
---
Config.Cooldown = 60
Config.RestartTime = 300
