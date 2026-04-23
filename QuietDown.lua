-- QuietDown: Suppress UI errors and selected server/system spam in WoW 3.3.5a

---------------------------------------------------------
-- UI Error Blacklist (fully commented)
---------------------------------------------------------
local BlackListErrors = {
    [ERR_OUT_OF_MANA]                 = true,   -- Not enough mana.
    [ERR_OUT_OF_ENERGY]               = true,   -- Not enough energy.
    [ERR_OUT_OF_RAGE]                 = true,   -- Not enough rage.
    [ERR_OUT_OF_FOCUS]                = true,   -- Not enough focus.

    [ERR_ABILITY_COOLDOWN]            = true,   -- Ability is not ready yet.
    [ERR_ITEM_COOLDOWN]               = true,   -- Item is not ready yet.
    [ERR_SPELL_COOLDOWN]              = true,   -- Spell is not ready yet.

    [ERR_BADATTACKPOS]                = true,   -- You are too far away!
    [ERR_OUT_OF_RANGE]                = true,   -- Out of range.
    [ERR_NO_ATTACK_TARGET]            = true,   -- There is nothing to attack.
    [ERR_INVALID_ATTACK_TARGET]       = true,   -- You cannot attack that target.

    [ERR_BADATTACKFACING]             = true,   -- You are facing the wrong way!

    [SPELL_FAILED_MOVING]             = true,   -- Can't do that while moving.
    [SPELL_FAILED_AFFECTING_COMBAT]   = true,   -- You are in combat.
    [ERR_NOT_IN_COMBAT]               = true,   -- You can't do that while in combat.
    [SPELL_FAILED_UNIT_NOT_INFRONT]   = true,   -- Target needs to be in front of you.
    [SPELL_FAILED_TOO_CLOSE]          = true,   -- Target too close.
    [SPELL_FAILED_NO_COMBO_POINTS]    = true,   -- That ability requires combo points.
    [SPELL_FAILED_TARGETS_DEAD]       = true,   -- Your target is dead.
    [SPELL_FAILED_SPELL_IN_PROGRESS]  = true,   -- Another action is in progress.
    [SPELL_FAILED_TARGET_AURASTATE]   = true,   -- You can't do that yet.
    [SPELL_FAILED_CASTER_AURASTATE]   = true,   -- You can't do that yet.
    [SPELL_FAILED_NO_ENDURANCE]       = true,   -- Not enough endurance.
    [SPELL_FAILED_BAD_TARGETS]        = true,   -- Invalid target.
    [SPELL_FAILED_NOT_MOUNTED]        = true,   -- You are mounted.
    [SPELL_FAILED_NOT_ON_TAXI]        = true,   -- You are in flight.

    [ERR_UNIT_NOT_FOUND]              = true,   -- Unknown Unit.
    [INTERRUPTED]                     = true,   -- Interrupted.
}

---------------------------------------------------------
-- Server/System Message Blacklist (keyword-based)
-- Only messages in CHAT_MSG_SYSTEM are filtered.
-- Guild/party/raid/whisper/etc. are NEVER affected.
---------------------------------------------------------
local ServerMessageBlacklist = {
    ["Send a screenshot of your email receipt and account name"]    = true, -- [Ascension Autobroadcast]: Having DP or shop issues? Send a screenshot of your email receipt and account name to Tuluku0001 on Discord and fully describe your issue. If you do not have Discord, you can make an in-game ticket via the ? icon next to the game menu button.
    ["Every crafted item gains bonus affix stats"]                  = true, -- [Ascension Autobroadcast]:  [Crafting Overhaul] Crafting on Ascension has been overhauled! Every crafted item gains bonus affix stats and you can upgrade ALL crafted gear by using crafting upgrade kits taught from trainers!
    ["try toggling Hardware Cursor in video settings."]             = true, -- [Ascension Autobroadcast]: If you are experiencing FPS drops, try toggling Hardware Cursor in video settings. A recent Nvidia driver update caused this issue.
    ["Testing of Wrath of the Lich King is underway!"]              = true, -- [Ascension Autobroadcast]:  [Wotlk Alpha Bundle] Testing of Wrath of the Lich King is underway! If you want access to WOTLK Alpha you can buy a Northrend Travel Guide from players or grab the Wotlk Alpha Bundle from the Ascension Store!
    ["Over 1,800 hidden treasures scattered across Azeroth!"]       = true, -- [Ascension Autobroadcast]:  [Worldforged] Over 1,800 hidden treasures scattered across Azeroth! Venture off the beaten path to discover Worldforged gear tucked away in forgotten caves, ancient towers, and remote corners of the world. Treasure Spoils and Adventure awaits the bold!
    ["Did you know all quest drops are shared in parties"]          = true, -- [Ascension Autobroadcast]: Did you know all quest drops are shared in parties and you lose significantly less experience for grouping on Ascension? It's always worth questing and leveling with friends!
    ["Every creature drops the exact gear they're wearing"]         = true, -- [Ascension Autobroadcast]:  [Immersive Gear Drops] Every creature drops the exact gear they're wearing with matching stats! Want spell power? Slay casters. Need defense? Take down armored warriors with shields. The gear has the stats you'd expect from that creature type, letting you look EXACTLY like the enemies you defeat!
    ["Keep up with the latest news, changes and events"]            = true, -- [Ascension Autobroadcast]: Keep up with the latest news, changes and events by following us on Facebook: https://facebook.com/OfficialAscension - X: https://x.com/AscensionFeed - Discord: https://discord.gg/classless
    ["Need a break? Rested Experience accumulates much faster"]     = true, -- [Ascension Autobroadcast]:  [Resting] Need a break? Rested Experience accumulates much faster on Ascension. Resting in an inn for 15 minutes will grant you a small experience boost for 2 hours! Safe Travels!
    ["If you're experiencing FPS issues or lag,"]                   = true, -- [Ascension Autobroadcast]: If you're experiencing FPS issues or lag, Third-Party Addons are the primary cause of these issues. Try updating your addons on the launcher or disabling them.
    ["Group Experience Rates are boosted and Quest Items"]          = true, -- [Ascension Autobroadcast]:  [Group Up!] Group Experience Rates are boosted and Quest Items are shared to all party members! Grouping up together will allow you to progress together and have friends to enjoy the journey.
    ["Looking for some answers? Join The Ascension discord"]        = true, -- [Ascension Autobroadcast]:  [Newcomer's Corner] Looking for some answers? Join The Ascension discord and read through our Newcomer's Corner guides and frequently asked questions! [Discord: Newcomer's FAQ]
    ["Looking for a place to enable or disable level scaling?"]     = true, -- [Ascension Autobroadcast]:  [Level Scaling] Looking for a place to enable or disable level scaling? The Destiny Weaver can help you, located in Capital City Banks and starting areas. Ask a guard for directions!
    ["You can queue for Battlegrounds and Dungeons at the"]         = true, -- [Ascension Autobroadcast]: You can queue for Battlegrounds and Dungeons at the same time on Ascension!
    ["You can submit bugs on the bugtracker! Visit"]                = true, -- [Ascension Autobroadcast]: [Bugtracker] You can submit bugs on the bugtracker! Visit https://ascension.gg/bugtracker or Bugtracker on the Launcher. Searching for an existing report and upvoting/commenting will help us prioritize bugs affecting the most people. Avoid submitting bugs in GM tickets, as these will take longer to reach the bugtracker.
    ["Soulbound items become Bloodforged items when you lose"]      = true, -- [Ascension Autobroadcast]:  [Bloodforged]  Soulbound items become Bloodforged items when you lose them in High-Risk PvP, but you can also convert them yourself with Bloody Jars. You can find Bloody Jars on Edrim Skysong. Please note, at this time enchants are not carried over upon conversion.
    ["Taking down Heroic Dungeon Bosses will earn you Marks"]       = true, -- [Ascension Autobroadcast]:  [Marks of Triumph] Taking down Heroic Dungeon Bosses will earn you Marks of Triumph. Exchange these Marks in your capital city for Epic Rewards, ask any guard for directions!
    ["Endgame Factions have been buffed on Warcraft Reborn,"]       = true, -- [Ascension Autobroadcast]:  [Reputation Rewards] Endgame Factions have been buffed on Warcraft Reborn, earn the strongest rewards available by gaining exalted with: The Argent Dawn, Timbermaw Hold, Thorium Brotherhood and Cenarion Circle. Visit the Quartermasters at the respective faction to see what they have to offer!
    ["Did you know that you can now join our discord by"]           = true, -- [Ascension Autobroadcast]:  [Discord] Did you know that you can now join our discord by clicking this chat link? Join and chat with the community! [Discord: Ascension]


    ["[Criminal Intent]"]                                           = true, -- [Criminal Intent]  Aspinia has slain Brithania near you at Thorn Hill!

    ["has completed their Trial!"]                                  = true, -- [Prestige - Nightmare - Personal Nightmare] Odsfghlkjdfd has completed their Trial!
    ["[High-Risk]"]                                                 = true, -- [High-Risk] [Crow's Cache]  The Crow's Treasure has been looted by Jumpswife - sup!
    ["Conquest of Azeroth Alpha Realm, a new realm with 21"]        = true, -- Lampy has read their [Conquest of Azeroth Travel Guide] and unlocked access to the Conquest of Azeroth Alpha Realm, a new realm with 21 completely unique custom classes!

    ["[Titan Scroll]"]                                              = true, -- [Titan Scroll]  Cassll  did not allow the Titan Scroll: Norgannon to fail!
    ["[Keeper's Scroll]"]                                           = true, -- [Keeper's Scroll] Everyone can now access the Ancient Enchanting Altar in the Trade District, thanks to the brave hero Kkrf who used a [Keeper's Scroll: Ancient Enchanting Altar]!

    ["[Setis]"]                                                     = true, -- [Setis]  has spawned in The Scarab Wall (No Risk)!
    ["[Emeriss]"]                                                   = true, -- [Emeriss]  has spawned in Bough Shadow (High Risk)!
    ["[Lord Kazzak]"]                                               = true, -- [Lord Kazzak]  has spawned in The Tainted Scar (No Risk)!
    ["[Kaldros Depthbreaker]"]                                      = true, -- [Kaldros Depthbreaker]  has spawned in Depthbreaker's Hollow (No Risk)!
    ["[Lethon]"]                                                    = true, -- [Lethon]  has spawned in Twilight Grove (No Risk)!
    ["[Atal'zul, the Soulreaver]"]                                  = true, -- [Atal'zul, the Soulreaver]  has spawned in Zul'Mashar (High Risk)!

    ["has been killed by "]                                         = true, -- [Hardcore] Nzghoul (Level 17) has been killed by [Defias Pyromancer].
    [") has been killed by Falling."]                               = true, -- [Ironman] Kofu (Level 14) has been killed by Falling.
}




-- [SERVER] Restart in 7 Minute(s)  - Updates. 3 Minutes Downtime





---------------------------------------------------------
-- UI Error Filter
---------------------------------------------------------
local OriginalAddMessage = UIErrorsFrame.AddMessage

function UIErrorsFrame:AddMessage(message, r, g, b, id)
    if (message) and (BlackListErrors[message]) then
        return -- suppress UI error
    end
    return OriginalAddMessage(self, message, r, g, b, id)
end

---------------------------------------------------------
-- Server/System Chat Filter
-- Filters ONLY CHAT_MSG_SYSTEM, so player chat is safe.
---------------------------------------------------------
local function QuietDown_ServerFilter(self, event, msg, ...)
    if (not msg) then
        return false
    end

    for text in pairs(ServerMessageBlacklist) do
        if (msg:find(text, 1, true)) then  -- PLAIN TEXT
            return true
        end
    end

    return false
end

ChatFrame_AddMessageEventFilter("CHAT_MSG_SYSTEM", QuietDown_ServerFilter)