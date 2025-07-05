# 🛩️ Airplane Racing Game (Solidity)    
    
A fully on-chain, turn-based airplane racing game built in Solidity.      
No tokens. No rewards. Just fun.    
    
## 🚀 About the Game      
  
Two players register to race their airplanes. Each turn, they move forward by 1–10 units.    
The first player to cross the finish line at 100 wins. All logic lives 100% on-chain.  
    
> ✈️ Fastest plane wins.     
> 🧠 Strategy matters.      
> 🔐 Trustless. Verifiable. Immutable.   

## 🧱 Smart Contract

- ✅ Built in Solidity `^0.8.24`  
- 🎮 Turn-based mechanics
- 👥 Max 2 players per race   
- 🎯 Finish line at `100`
- 📦 No tokens or oracles — pure Solidity logic 

## 🛠️ Functions

| Function          | Description                                      |
|-------------------|--------------------------------------------------|
| `register()`      | Join the game (only before race starts)         |
| `startRace()`     | Starts the race with exactly 2 players          |
| `move(uint)`      | Move your plane (1 to 10 units) per turn        |
| `getPosition()`   | View your current position                      |
| `getPlayers()`    | See registered players                          |

## 🧪 How to Play (Local)

```bash
git clone https://github.com/your-username/airplane-racing-game.git
cd airplane-racing-game
