
🅱🆂🆁🅿-⊂(▀¯▀⊂ )🇧 🇱 🇦 🇨 🇰 - 🇸 🇭 🇦 🇩 🇪 🇸 ⊂(▀¯▀⊂ )🅱🆂🆁🅿

# **📱😎 bsrp-drugphone 😎📱**  

**"Deal smart, deal cool."** Qbox drug selling resource Featuring dynamic pricing, immersive NPCs, and an all-around stylish way to manage the underground economy.  

[🔗 GitHub Repository](https://github.com/enzonami/bsrp-drugphone)

---

## **✨ Features 😎**  

- **📈 Dynamic Pricing:**  
  Prices adjust in real-time based on player sales activity. Be the boss of a living, breathing economy.  

- **🕒 Cooldowns That Keep It Real:**  
  Prevents sales spam with a configurable cooldown timer.  

- **🤖 NPCs With Style:**  
  Drug dealers come with idle animations, blips, and GPS waypoints. They’re the cool cats of the block.  

- **💊 Your Drug, Your Rules:**  
  Add, remove, or tweak drugs, base prices, and inventory logic to suit your server's vibe.  

- **📊 Notifications That Pop:**  
  Stylish in-game messages let players know what's up – success, errors, or even a "cool down" 😎.  

- **🔄 Automatic NPC Reset:**  
  Dealers vanish and reset after a configurable interval, keeping the streets fresh.  

- **🛠️ Modernized Frameworks:**  
  Powered by `ox_lib`, `ox_inventory`, and `ox_target` for seamless gameplay.  

---

## **📥 Installation Guide**

### **Step 1: Download 😎**  
- Clone or download this repository from GitHub:  
  [🔗 GitHub Repository](https://github.com/enzonami/bsrp-drugphone)

### **Step 2: Get Your Crew (Dependencies) 📱**  
- Install these modern frameworks for everything to run smoothly:  
  - [ox_lib](https://github.com/overextended/ox_lib)  
  - [ox_inventory](https://github.com/overextended/ox_inventory)  
  - [ox_target](https://github.com/overextended/ox_target)  

### **Step 3: Add It to Your Mix 🎵**  
- Update your `server.cfg` file:  
  ```plaintext
  ensure ox_lib
  ensure ox_inventory
  ensure ox_target
  ensure bsrp-drugphone
  ```

### **Step 4: Customize Your World 🌎**  
- Open `config.lua` and set the vibe for your server:  
  ```lua
  Config.Cooldown = 60       -- Time (in seconds) between sales
  Config.RestartTime = 300   -- Time (in seconds) to reset NPCs
  Config.Drugs = {
      weed = { basePrice = 100 },
      coke = { basePrice = 200 },
      meth = { basePrice = 300 }
  }
  ```

---

## **🔄 Updates & Maintenance**

### **How to Update Like a Pro 😎**  
1. **Backup** your existing files.  
2. Replace them with the latest version from this repository.  
3. Double-check the `config.lua` file for new settings.  
4. Restart your server and enjoy the fresh vibes.  

---

## **🛠️ Commands That Make Life Easy**

- **`/spawnDealer`:** Spawns a drug dealer NPC at a random spot.  
- **`/clearWaypoint`:** Clears the GPS waypoint for the NPC.  

---

## **🌀 How It Works**

### **Deal Drugs, Be Cool 😎**  
1. Find a dealer NPC (they’ve got style).  
2. Press **E** to open the sell menu.  
3. Enter quantities for each drug and confirm.  
4. Get paid and walk away like a boss.  

### **Dynamic Pricing 📈**  
- More sales = lower prices.  
- Prices reset slowly over time, simulating a true street economy.  

### **Cool Cooldowns 🕒**  
- Players can only sell drugs after the cooldown timer runs out.  
- They’ll be notified if they’re too eager.  

### **NPC Reset 🔄**  
- NPCs despawn and refresh every few minutes, keeping things dynamic.  

---

## **🛡️ Configuration Options**

### **Set the Rules Your Way**  

**Cooldowns (🕒):**  
```lua
Config.Cooldown = 60  -- Time between sales in seconds
```

**Dynamic Pricing (📈):**  
```lua
Config.DynamicPricing = true  -- Turn dynamic pricing on or off
```

**NPCs With Style (🤖):**  
```lua
Config.NPC = {
    locations = {
        vector4(100, 200, 30, 90), -- Add more dealer spots here
        vector4(200, 300, 30, 270)
    },
    model = `a_m_m_tranvest_01`,  -- Dealer model
    interactionDistance = 5.0    -- How close players need to be
}
```

---

## **🚀 Future Updates**

### ✅ Near-Future Plans:  
1. NPC patrol routes for extra immersion 📱.    
2. Police alerts for high-stakes deals 🚨.  

### 🛠️ Long-Term Goals:  
1. Expand drug types and introduce unique effects 🌿💉.  
2. Black-market system for premium, high-risk deals 📦.  
3. Gang territory features to bring street dynamics to life 🏙️.  

---

## **🤝 Contributing**

Got ideas? Found a bug? Let’s build something great together:  
- Submit a pull request on GitHub:  
  [🔗 GitHub Repository](https://github.com/enzonami/bsrp-drugphone)  
- Open an issue to share your feedback or suggestions.  

---

## **💡 Credits**  

- **Script Author:** [Enzonami](https://github.com/enzonami)    

---

## **📜 License**

This resource is licensed under the [MIT License](LICENSE).  
Feel free to modify, share, and enjoy!  

