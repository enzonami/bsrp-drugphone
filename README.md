
# **📱😎 bsrp-drugphone 😎📱**  

**"Rule the streets like a pro."** — Introducing a feature-packed drug-selling system for FiveM, combining dynamic gameplay with an immersive underground economy. Perfect for enhancing your server's criminal RP experience!  

[🔗 GitHub Repository](https://github.com/enzonami/bsrp-drugphone)

---

## **🔥 Key Features**  

- **📈 Dynamic Pricing:**  
  Real-time price fluctuations based on sales volume for a true market experience.  

- **🕒 Cooldowns:**  
  Enforce time limits between sales to balance gameplay and curb exploits.  

- **🤖 Immersive NPCs:**  
  NPC dealers with customizable animations, blips, and GPS waypoints.  

- **💊 Customizable Drugs:**  
  Easily add new drugs, tweak prices, and handle inventory with full control.  

- **📊 Player Notifications:**  
  Stylish success and error messages delivered through `ox_lib` notifications.  

- **🔄 Automatic Resets:**  
  NPCs and waypoints refresh on a timer to maintain server cleanliness.  

- **🛠️ Built on Modern Frameworks:**  
  Fully integrated with `ox_lib`, `ox_inventory`, and `ox_target` for seamless performance.  

---

## **🚀 Installation Guide**

### **Step 1: Download**  
Clone or download the repository to your `resources` folder.  

### **Step 2: Dependencies**  
Ensure these frameworks are installed and configured:  
- [ox_lib](https://github.com/overextended/ox_lib)  
- [ox_inventory](https://github.com/overextended/ox_inventory)  
- [ox_target](https://github.com/overextended/ox_target)  

### **Step 3: Add to `server.cfg`**  
```plaintext
ensure ox_lib
ensure ox_inventory
ensure ox_target
ensure bsrp-drugphone
```

### **Step 4: Configure**  
Customize `config.lua` to suit your server's needs:  
```lua
Config.Cooldown = 60       -- Cooldown time between sales (in seconds)
Config.RestartTime = 300   -- Time for NPC reset (in seconds)
Config.Drugs = {
    weed = { basePrice = 100 },
    coke = { basePrice = 200 },
    meth = { basePrice = 300 }
}
```

---

## **🌀 How It Works**

### **Selling Drugs**  
1. Interact with an NPC dealer (press **E**) to access the sell menu.  
2. Enter the quantities for each drug.  
3. Get paid and watch prices adjust dynamically based on market activity.  

### **Cooldowns**  
- After a sale, players must wait for the cooldown (`Config.Cooldown`) before selling again.  
- Notifications inform players when they can sell again.  

### **Dynamic Pricing**  
- Prices decrease as sales increase to simulate market supply and demand.  
- Prices slowly reset over time to maintain economic balance.  

### **NPC Reset**  
- NPCs and waypoints automatically despawn and refresh after a set interval (`Config.RestartTime`).  

---

## **🛠️ Commands**

- **`/spawnDealer`:** Spawn a random NPC dealer.  
- **`/clearWaypoint`:** Remove the GPS waypoint for the dealer.  

---

## **📊 Configuration Options**

Tailor the script to your server's needs by modifying `config.lua`:  

### **Cooldown Settings**  
```lua
Config.Cooldown = 60  -- Time (in seconds) between sales
```

### **Dynamic Pricing Toggle**  
```lua
Config.DynamicPricing = true  -- Enable or disable dynamic pricing
```

### **NPC Customization**  
```lua
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
    }
}
```

---

## **📅 Future Updates**

### **Coming Soon:**  
- **🚶 NPC Patrols:** Watch dealers roam the streets for extra immersion.  
- **⚖️ Weight Management:** Ensure inventory limits are respected during sales.  
- **🚨 Police Alerts:** High-risk transactions can trigger law enforcement interactions.  

### **Long-Term Goals:**  
- **🌿 New Drugs:** Expand with more drug types and unique effects.  
- **📦 Black Market:** Introduce a premium economy for rare items.  
- **🏙️ Gang Territories:** Tie NPC spawn locations to gang control.  

---

## **🤝 Contributions**

Join the development journey!  
- Submit pull requests or report issues directly on the [GitHub Repository](https://github.com/enzonami/bsrp-drugphone).  

---

## **💡 Credits**  

- **Script Creator:** [Enzonami](https://github.com/enzonami)  
- **Optimization & Updates:** [Your Name]  

---

## **📜 License**

This project is licensed under the [MIT License](LICENSE).  

Enjoy the script, tweak it to fit your server, and share the love! 😎📱  
