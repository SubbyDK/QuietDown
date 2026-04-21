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
    ["When making a ticket in any language other than English"]     = true, -- Advertising from "Ascension Autobroadcast".
    ["Treasure Spoils and Adventure awaits the bold!"]              = true, -- Advertising from "Ascension Autobroadcast".
    ["Testing of Wrath of the Lich King is underway!"]              = true, -- Advertising from "Ascension Autobroadcast".
    ["Every crafted item gains bonus affix stats"]                  = true, -- Advertising from "Ascension Autobroadcast".
    ["Group Experience Rates are boosted"]                          = true, -- Advertising from "Ascension Autobroadcast".
    ["letting you look EXACTLY like the enemies you defeat!"]       = true, -- Advertising from "Ascension Autobroadcast".
    ["Need a break? Rested Experience accumulates much faster"]     = true, -- Advertising from "Ascension Autobroadcast".
    ["Endgame Factions have been buffed on Warcraft Reborn,"]       = true, -- Advertising from "Ascension Autobroadcast".
    ["If you're experiencing FPS issues or lag, Third-Party"]       = true, -- Advertising from "Ascension Autobroadcast".
    ["Mystic Runes and Mystic Orbs can be used to Reroll Enchants"] = true, -- Advertising from "Ascension Autobroadcast".

    ["has completed their Trial!"]                                  = true, -- When a Prestige complete.

    ["access to the Conquest of Azeroth Alpha Realm,"]               = true, -- ???? Something with "Azeroth Alpha Realm"

    ["[Titan Scroll]"]                                              = true, -- Titan Scroll announcements.
    ["[Keeper's Scroll]"]                                           = true, -- Keeper's Scroll announcements.

    ["has been killed by "]                                         = true, -- Announcement when a Hardcore is killed.
    [") has been killed by Falling."]                               = true, -- Announcement when a Hardcore die from falling.
}

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
    if not msg then
        return false
    end

    for text in pairs(ServerMessageBlacklist) do
        if msg:find(text, 1, true) then  -- PLAIN TEXT
            return true
        end
    end

    return false
end

ChatFrame_AddMessageEventFilter("CHAT_MSG_SYSTEM", QuietDown_ServerFilter)

