# QuietDown

<p align="center">
  <img src="https://img.shields.io/badge/Interface-3.3.5a-blue.svg" alt="Interface">
  <img src="https://img.shields.io/badge/Version-0.0.1-green.svg" alt="Version">
  <img src="https://img.shields.io/badge/Author-Subby-orange.svg" alt="Author">
  <img src="https://img.shields.io/github/downloads/SubbyDK/QuietDown/total" alt="Downloads">
</p>

**[QuietDown](https://github.com/SubbyDK/QuietDown/releases/latest/download/QuietDown.zip)** is a lightweight utility for World of Warcraft (3.3.5a) designed to declutter your experience by suppressing annoying UI errors and filtering out server-wide broadcast spam.  
Download the newest version [here](https://github.com/SubbyDK/QuietDown/releases/latest/download/QuietDown.zip).

---

### 💡 The Background
The motivation behind this addon comes from the constant "red text" spam in the middle of the screen (like "Not enough mana" or "Ability is not ready yet") and the repetitive server announcements on some servers.  
**QuietDown** acts as a silent guardian, keeping your UI clean so you can focus on the gameplay instead of the clutter.

---

### 🚀 Features

* **UI Error Suppression**: Automatically hides common combat errors like "Out of range," "Not enough energy," and "Spell is not ready yet" from the top of your screen.
* **System Message Filtering**: Blocks repetitive server-wide broadcasts, autobroadcasts, and system spam in the `CHAT_MSG_SYSTEM` channel.
* **Plain-Text Matching**: Uses efficient keyword-based filtering to ensure that legitimate player chat (Guild, Party, Whispers) is **never** affected.
* **Ultra Lightweight**: Written in clean Lua with minimal footprint; it won't impact your FPS or loading times.

---

### 🛠️ Functionality

QuietDown works automatically upon installation.  
It targets two main areas:
1.  **UIErrorsFrame**: Intercepts error messages and checks them against a blacklist. If the error is on the list, it is suppressed.
2.  **System Chat**: Monitors the system channel for specific phrases (like "[Hardcore] has been killed by") and hides the entire line if a match is found.

---

### 📦 Installation

1. [Download](https://github.com/SubbyDK/QuietDown/releases/latest/download/QuietDown.zip) the repository.
2. Rename the folder `QuietDown-master` to `QuietDown`.
3. Move the `QuietDown` folder into your `Interface\AddOns` directory.
4. Ensure the structure looks like this:
```
Interface/
    └── AddOns/
        └── QuietDown/
        ├── QuietDown.lua
        └── QuietDown.toc
```
5. Restart World of Warcraft.

### 🗑️ Uninstallation

1. Delete the `QuietDown` folder from your `Interface\AddOns` directory.
2. Restart World of Warcraft.

---

### ⚠️ Caution
This version is pre-configured with filters specifically observed on **Project Ascension - Bronzebeard**.  
If you are playing on a different 3.3.5a server, you can easily add new phrases to the `ServerMessageBlacklist` inside `QuietDown.lua` to customize your experience.

---

### 👤 Author
**Created by Subby** *Enjoy the silence!*

---

## 📄 License

MIT License — do what you want with it. Credits appreciated but not required.
