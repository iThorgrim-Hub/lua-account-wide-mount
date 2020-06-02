--[[

                                                                                                                             __      __       __                                  __
                                                                                                                            /  |    /  \     /  |                                /  |
    ______    _______   _______   ______   __    __  _______   _$$ |_   $$  \   /$$ |  ______   __    __  _______   _$$ |_
    /      \  /       | /       | /      \ /  |  /  |/       \ / $$   |  $$$  \ /$$$ | /      \ /  |  /  |/       \ / $$   |
    $$$$$$  |/$$$$$$$/ /$$$$$$$/ /$$$$$$  |$$ |  $$ |$$$$$$$  |$$$$$$/   $$$$  /$$$$ |/$$$$$$  |$$ |  $$ |$$$$$$$  |$$$$$$/
    /    $$ |$$ |      $$ |      $$ |  $$ |$$ |  $$ |$$ |  $$ |  $$ | __ $$ $$ $$/$$ |$$ |  $$ |$$ |  $$ |$$ |  $$ |  $$ | __
    /$$$$$$$ |$$ \_____ $$ \_____ $$ \__$$ |$$ \__$$ |$$ |  $$ |  $$ |/  |$$ |$$$/ $$ |$$ \__$$ |$$ \__$$ |$$ |  $$ |  $$ |/  |
    $$    $$ |$$       |$$       |$$    $$/ $$    $$/ $$ |  $$ |  $$  $$/ $$ | $/  $$ |$$    $$/ $$    $$/ $$ |  $$ |  $$  $$/
    $$$$$$$/  $$$$$$$/  $$$$$$$/  $$$$$$/   $$$$$$/  $$/   $$/    $$$$/  $$/      $$/  $$$$$$/   $$$$$$/  $$/   $$/    $$$$/
                                                                                                                                                                                                                            Without AIO



  @Original_Author : Open-Wow

  This script allow player to learn mount on connect, levelup.

  @Open-Wow Github : https://github.com/Open-Wow
  @Open-Wow Site : https://open-wow.fr

  @AzerothCore Community : https://discord.gg/PaqQRkd
  @Open-Wow Community : https://discord.gg/mTHxKmY

  Thanks for your patience <3.

]] --

local accountMount = {}

accountMount.Config = {
    -- DB Name .. so easy
    dbName = "r1_eluna"
}

accountMount.Spells = {
    -- Generated with WdbxEditor  & SQL Join
    --[[

  SELECT ID AS `spell_entry`, `requiredLEvel`, `allowablerace` FROM `item_template` JOIN `db_spell_12340`

    ON `db_spell_12340`.ID = `item_template`.spellid_1
        AND `db_spell_12340`.EffectAura_2 = 32
    OR `db_spell_12340`.ID = `item_template`.spellid_1
        AND `db_spell_12340`.EffectAura_2 = 32

    OR `db_spell_12340`.ID = `item_template`.spellid_1
        AND `db_spell_12340`.EffectAura_2 = 207
    OR `db_spell_12340`.ID = `item_template`.spellid_1
        AND `db_spell_12340`.EffectAura_2 = 207

    OR `db_spell_12340`.ID = `item_template`.spellid_2
        AND `db_spell_12340`.EffectAura_2 = 32
    OR `db_spell_12340`.ID = `item_template`.spellid_2
        AND `db_spell_12340`.EffectAura_2 = 32

    OR `db_spell_12340`.ID = `item_template`.spellid_2
        AND `db_spell_12340`.EffectAura_2 = 207
    OR `db_spell_12340`.ID = `item_template`.spellid_2
        AND `db_spell_12340`.EffectAura_2 = 207;

  ]] --
    [64977] = {20, 2}, --   Horde
    [472] = {20, 1}, -- Alliance
    [43899] = {20, 0}, --   Neutral
    [42776] = {20, 0}, --   Neutral
    [580] = {20, 2}, -- Horde
    [42776] = {20, 0}, --   Neutral
    [6648] = {20, 1}, --    Alliance
    [6653] = {20, 2}, --    Horde
    [6654] = {20, 2}, --    Horde
    [6777] = {20, 1}, --    Alliance
    [470] = {20, 1}, -- Alliance
    [35711] = {20, 1}, --   Alliance
    [6898] = {20, 1}, --    Alliance
    [64658] = {20, 2}, --   Horde
    [8394] = {20, 1}, --    Alliance
    [8395] = {20, 2}, --    Horde
    [35710] = {20, 1}, --   Alliance
    [35022] = {20, 2}, --   Horde
    [35020] = {20, 2}, --   Horde
    [10789] = {20, 1}, --   Alliance
    [35018] = {20, 2}, --   Horde
    [34795] = {20, 2}, --   Horde
    [10793] = {20, 1}, --   Alliance
    [34406] = {20, 1}, --   Alliance
    [10796] = {20, 2}, --   Horde
    [66847] = {20, 1}, --   Alliance
    [10799] = {20, 2}, --   Horde
    [10873] = {20, 1}, --   Alliance
    [10969] = {20, 1}, --   Alliance
    [64657] = {20, 2}, --   Horde
    [6899] = {20, 1}, --    Alliance
    [458] = {20, 1}, -- Alliance
    [16058] = {20, 1}, --   Alliance
    [16059] = {20, 1}, --   Alliance
    [16060] = {20, 1}, --   Alliance
    [49378] = {20, 0}, --   Neutral
    [18990] = {20, 2}, --   Horde
    [73313] = {20, 0}, --   Neutral
    [18989] = {20, 2}, --   Horde
    [17464] = {20, 2}, --   Horde
    [17463] = {20, 2}, --   Horde
    [17462] = {20, 2}, --   Horde
    [17456] = {20, 1}, --   Alliance
    [17453] = {20, 1}, --   Alliance
    [17454] = {20, 1}, --   Alliance
    [17455] = {20, 1}, --   Alliance
    [17458] = {30, 0}, --   Neutral
    [17450] = {40, 2}, --   Horde
    [17459] = {40, 1}, --   Alliance
    [17460] = {40, 1}, --   Alliance
    [17461] = {40, 1}, --   Alliance
    [17229] = {40, 1}, --   Alliance
    [16084] = {40, 2}, --   Horde
    [16083] = {40, 1}, --   Alliance
    [17465] = {40, 2}, --   Horde
    [17481] = {40, 0}, --   Neutral
    [18363] = {40, 0}, --   Neutral
    [16082] = {40, 1}, --   Alliance
    [16081] = {40, 2}, --   Horde
    [18991] = {40, 2}, --   Horde
    [18992] = {40, 2}, --   Horde
    [22717] = {40, 1}, --   Alliance
    [22717] = {40, 1}, --   Alliance
    [22718] = {40, 2}, --   Horde
    [22718] = {40, 2}, --   Horde
    [22719] = {40, 1}, --   Alliance
    [22719] = {40, 1}, --   Alliance
    [22720] = {40, 1}, --   Alliance
    [22720] = {40, 1}, --   Alliance
    [22721] = {40, 2}, --   Horde
    [22721] = {40, 2}, --   Horde
    [22722] = {40, 2}, --   Horde
    [22722] = {40, 2}, --   Horde
    [22723] = {40, 1}, --   Alliance
    [22723] = {40, 1}, --   Alliance
    [22724] = {40, 2}, --   Horde
    [22724] = {40, 2}, --   Horde
    [23219] = {40, 1}, --   Alliance
    [23220] = {40, 1}, --   Alliance
    [23221] = {40, 1}, --   Alliance
    [23222] = {40, 1}, --   Alliance
    [23223] = {40, 1}, --   Alliance
    [23225] = {40, 1}, --   Alliance
    [23227] = {40, 1}, --   Alliance
    [23228] = {40, 1}, --   Alliance
    [23229] = {40, 1}, --   Alliance
    [23238] = {40, 1}, --   Alliance
    [23239] = {40, 1}, --   Alliance
    [23240] = {40, 1}, --   Alliance
    [23241] = {40, 2}, --   Horde
    [23242] = {40, 2}, --   Horde
    [23243] = {40, 2}, --   Horde
    [23246] = {40, 2}, --   Horde
    [23247] = {40, 2}, --   Horde
    [23248] = {40, 2}, --   Horde
    [23249] = {40, 2}, --   Horde
    [23250] = {40, 2}, --   Horde
    [23251] = {40, 2}, --   Horde
    [16080] = {40, 2}, --   Horde
    [23338] = {40, 1}, --   Alliance
    [23509] = {40, 0}, --   Neutral
    [23510] = {40, 0}, --   Neutral
    [24242] = {40, 0}, --   Neutral
    [24252] = {40, 0}, --   Neutral
    [24576] = {40, 0}, --   Neutral
    [16056] = {40, 1}, --   Alliance
    [25953] = {40, 0}, --   Neutral
    [26054] = {40, 0}, --   Neutral
    [26055] = {40, 0}, --   Neutral
    [26056] = {40, 0}, --   Neutral
    [26656] = {40, 0}, --   Neutral
    [16055] = {40, 1}, --   Alliance
    [15779] = {40, 1}, --   Alliance
    [68188] = {40, 2}, --   Horde
    [68187] = {40, 1}, --   Alliance
    [68057] = {40, 1}, --   Alliance
    [68056] = {40, 2}, --   Horde
    [67466] = {40, 0}, --   Neutral
    [66906] = {40, 0}, --   Neutral
    [10798] = {40, 0}, --   Neutral
    [66846] = {40, 2}, --   Horde
    [66091] = {40, 2}, --   Horde
    [66090] = {40, 1}, --   Alliance
    [65646] = {40, 2}, --   Horde
    [65646] = {40, 2}, --   Horde
    [65645] = {40, 2}, --   Horde
    [65645] = {40, 2}, --   Horde
    [33660] = {40, 2}, --   Horde
    [10795] = {40, 0}, --   Neutral
    [34407] = {40, 1}, --   Alliance
    [34790] = {40, 0}, --   Neutral
    [10792] = {40, 0}, --   Neutral
    [34896] = {40, 2}, --   Horde
    [34896] = {40, 1}, --   Alliance
    [34897] = {40, 2}, --   Horde
    [34897] = {40, 1}, --   Alliance
    [34898] = {40, 1}, --   Alliance
    [34898] = {40, 2}, --   Horde
    [34899] = {40, 2}, --   Horde
    [34899] = {40, 1}, --   Alliance
    [10790] = {40, 0}, --   Neutral
    [10788] = {40, 0}, --   Neutral
    [10787] = {40, 0}, --   Neutral
    [35025] = {40, 2}, --   Horde
    [35027] = {40, 2}, --   Horde
    [35028] = {40, 2}, --   Horde
    [35028] = {40, 2}, --   Horde
    [8980] = {40, 0}, --    Neutral
    [6897] = {40, 0}, --    Neutral
    [35712] = {40, 1}, --   Alliance
    [35713] = {40, 1}, --   Alliance
    [35714] = {40, 1}, --   Alliance
    [36702] = {40, 0}, --   Neutral
    [74918] = {40, 0}, --   Neutral
    [39315] = {40, 1}, --   Alliance
    [39315] = {40, 2}, --   Horde
    [39316] = {40, 0}, --   Neutral
    [39317] = {40, 2}, --   Horde
    [39317] = {40, 1}, --   Alliance
    [39318] = {40, 1}, --   Alliance
    [39318] = {40, 2}, --   Horde
    [39319] = {40, 1}, --   Alliance
    [39319] = {40, 2}, --   Horde
    [65644] = {40, 2}, --   Horde
    [65644] = {40, 2}, --   Horde
    [65643] = {40, 1}, --   Alliance
    [65643] = {40, 1}, --   Alliance
    [65642] = {40, 1}, --   Alliance
    [65642] = {40, 1}, --   Alliance
    [41252] = {40, 0}, --   Neutral
    [65641] = {40, 2}, --   Horde
    [65641] = {40, 2}, --   Horde
    [65640] = {40, 1}, --   Alliance
    [65640] = {40, 1}, --   Alliance
    [65639] = {40, 2}, --   Horde
    [65639] = {40, 2}, --   Horde
    [65638] = {40, 1}, --   Alliance
    [42668] = {40, 0}, --   Neutral
    [65638] = {40, 1}, --   Alliance
    [6896] = {40, 0}, --    Neutral
    [581] = {40, 0}, -- Neutral
    [579] = {40, 0}, -- Neutral
    [42777] = {40, 0}, --   Neutral
    [65637] = {40, 1}, --   Alliance
    [578] = {40, 0}, -- Neutral
    [43900] = {40, 0}, --   Neutral
    [65637] = {40, 1}, --   Alliance
    [471] = {40, 0}, -- Neutral
    [64659] = {40, 2}, --   Horde
    [468] = {40, 0}, -- Neutral
    [459] = {40, 0}, -- Neutral
    [63643] = {40, 2}, --   Horde
    [63642] = {40, 2}, --   Horde
    [63641] = {40, 2}, --   Horde
    [46628] = {40, 0}, --   Neutral
    [48027] = {40, 1}, --   Alliance
    [48954] = {40, 0}, --   Neutral
    [63640] = {40, 2}, --   Horde
    [49322] = {40, 0}, --   Neutral
    [23252] = {40, 2}, --   Horde
    [49379] = {40, 0}, --   Neutral
    [63639] = {40, 1}, --   Alliance
    [51412] = {40, 0}, --   Neutral
    [51412] = {40, 0}, --   Neutral
    [54753] = {40, 0}, --   Neutral
    [63638] = {40, 1}, --   Alliance
    [55531] = {40, 2}, --   Horde
    [63637] = {40, 1}, --   Alliance
    [63636] = {40, 1}, --   Alliance
    [63635] = {40, 2}, --   Horde
    [63232] = {40, 1}, --   Alliance
    [61470] = {40, 1}, --   Alliance
    [61469] = {40, 2}, --   Horde
    [59572] = {40, 0}, --   Neutral
    [59573] = {40, 0}, --   Neutral
    [61467] = {40, 2}, --   Horde
    [59785] = {40, 1}, --   Alliance
    [59788] = {40, 2}, --   Horde
    [59791] = {40, 1}, --   Alliance
    [59793] = {40, 2}, --   Horde
    [59797] = {40, 2}, --   Horde
    [59799] = {40, 1}, --   Alliance
    [61465] = {40, 1}, --   Alliance
    [61447] = {40, 2}, --   Horde
    [61425] = {40, 1}, --   Alliance
    [60424] = {40, 1}, --   Alliance
    [60119] = {40, 2}, --   Horde
    [60118] = {40, 1}, --   Alliance
    [60116] = {40, 2}, --   Horde
    [60114] = {40, 1}, --   Alliance
    [16082] = {60, 0}, --   Neutral
    [32235] = {60, 1}, --   Alliance
    [32239] = {60, 1}, --   Alliance
    [32240] = {60, 1}, --   Alliance
    [32243] = {60, 2}, --   Horde
    [32244] = {60, 2}, --   Horde
    [61289] = {60, 0}, --   Neutral
    [32245] = {60, 2}, --   Horde
    [42667] = {60, 0}, --   Neutral
    [29059] = {60, 0}, --   Neutral
    [44153] = {60, 0}, --   Neutral
    [61451] = {60, 0}, --   Neutral
    [46197] = {60, 0}, --   Neutral
    [46197] = {60, 0}, --   Neutral
    [50281] = {60, 1}, --   Alliance
    [54753] = {60, 0}, --   Neutral
    [61996] = {70, 0}, --   Neutral
    [61997] = {70, 0}, --   Neutral
    [59569] = {70, 0}, --   Neutral
    [59568] = {70, 0}, --   Neutral
    [59567] = {70, 0}, --   Neutral
    [58615] = {70, 0}, --   Neutral
    [59570] = {70, 0}, --   Neutral
    [59571] = {70, 0}, --   Neutral
    [49193] = {70, 0}, --   Neutral
    [46199] = {70, 0}, --   Neutral
    [46199] = {70, 0}, --   Neutral
    [59650] = {70, 0}, --   Neutral
    [63796] = {70, 0}, --   Neutral
    [63844] = {70, 0}, --   Neutral
    [63956] = {70, 0}, --   Neutral
    [63963] = {70, 0}, --   Neutral
    [59961] = {70, 0}, --   Neutral
    [44744] = {70, 0}, --   Neutral
    [59976] = {70, 0}, --   Neutral
    [64927] = {70, 0}, --   Neutral
    [59996] = {70, 0}, --   Neutral
    [65439] = {70, 0}, --   Neutral
    [43927] = {70, 0}, --   Neutral
    [43688] = {70, 0}, --   Neutral
    [42668] = {70, 0}, --   Neutral
    [61309] = {70, 0}, --   Neutral
    [41518] = {70, 0}, --   Neutral
    [41517] = {70, 0}, --   Neutral
    [41516] = {70, 0}, --   Neutral
    [41515] = {70, 0}, --   Neutral
    [41514] = {70, 0}, --   Neutral
    [41513] = {70, 0}, --   Neutral
    [40192] = {70, 0}, --   Neutral
    [39803] = {70, 0}, --   Neutral
    [39802] = {70, 0}, --   Neutral
    [39801] = {70, 0}, --   Neutral
    [39800] = {70, 0}, --   Neutral
    [39798] = {70, 0}, --   Neutral
    [32345] = {70, 0}, --   Neutral
    [32297] = {70, 2}, --   Horde
    [32296] = {70, 2}, --   Horde
    [32295] = {70, 2}, --   Horde
    [66087] = {70, 0}, --   Neutral
    [66088] = {70, 0}, --   Neutral
    [32292] = {70, 1}, --   Alliance
    [32290] = {70, 1}, --   Alliance
    [32289] = {70, 1}, --   Alliance
    [32246] = {70, 2}, --   Horde
    [61294] = {70, 0}, --   Neutral
    [67336] = {70, 0}, --   Neutral
    [61230] = {70, 2}, --   Horde
    [61229] = {70, 1}, --   Alliance
    [32242] = {70, 1}, --   Alliance
    [60002] = {70, 0}, --   Neutral
    [60021] = {70, 0}, --   Neutral
    [60024] = {70, 0}, --   Neutral
    [44151] = {70, 0}, --   Neutral
    [69395] = {70, 0}, --   Neutral
    [71810] = {70, 0}, --   Neutral
    [72807] = {70, 0}, --   Neutral
    [72808] = {70, 0}, --   Neutral
    [60025] = {70, 0}, --   Neutral
    [37015] = {70, 0}, --   Neutral
    [75596] = {70, 0} --    Neutral
}

accountMount.newSpells = {}

CharDBExecute(
    "CREATE TABLE IF NOT EXISTS `" ..
        accountMount.Config.dbName ..
            "`.`account_mount_link` ( `accountid` INT(10) NOT NULL, `spellid` INT(10), PRIMARY KEY (`accountid`, `spellid`));"
)

function accountMount.learnMount(player)
    -- locales
    local pAccId = player:GetAccountId()
    local pLevel = player:GetLevel()
    local pHorde = player:IsHorde()

    if (pLevel >= 20) then
        for z, y in pairs(accountMount.Spells) do
            for w, x in pairs(accountMount[pAccId]) do
                if (x ~= 0) then
                    if (pLevel >= y[1] and player:HasSpell(x) == false) then
                        if ((pHorde == false and y[2] == 0 and z == x) or (pHorde == false and y[2] == 1 and z == x)) then
                            player:LearnSpell(x)
                        elseif ((pHorde == true and y[2] == 0) or (pHorde == true and y[2] == 2)) then
                            player:LearnSpell(x)
                        end
                    end
                end
            end
        end
    end
end

function accountMount.onLevelUp(event, player, oldlevel)
    -- locales
    local pAccId = player:GetAccountId()
    local pLevel = player:GetLevel()

    if ((player:HasSpell(33388) == true) or (player:HasSpell(34091) == true) or (player:HasSpell(34090) == true)) then
        accountMount.learnMount(player)
    end
end
RegisterPlayerEvent(13, accountMount.onLevelUp)

function accountMount.getMount(event, player)
    -- locales
    local pAccId = player:GetAccountId()
    local pLevel = player:GetLevel()

    if (pLevel >= 20) then
        if (not (accountMount[pAccId])) then
            accountMount[pAccId] = {0}

            local getAccountMount =
                CharDBQuery(
                "SELECT spellid FROM `" ..
                    accountMount.Config.dbName .. "`.`account_mount_link` WHERE accountid = " .. pAccId .. ";"
            )
            if (getAccountMount) then
                repeat
                    table.insert(accountMount[pAccId], getAccountMount:GetUInt32(0))
                until not getAccountMount:NextRow()
                accountMount.learnMount(player)
            end
        else
            accountMount.learnMount(player);
        end
    end
end
RegisterPlayerEvent(3, accountMount.getMount)

function accountMount.setMount(event, player)
    -- locales
    local pAccId = player:GetAccountId()
    local pGuid = player:GetGUIDLow()
    local pLevel = player:GetLevel()

    if (pLevel >= 20) then
        if (accountMount.newSpells[pGuid]) then
            for k, v in pairs(accountMount.newSpells[pGuid]) do
                local setAccountMount =
                    CharDBQuery(
                    "INSERT INTO `" ..
                        accountMount.Config.dbName .. "`.`account_mount_link` VALUES (" .. pAccId .. ", " .. v .. ")"
                )
            end
            accountMount.newSpells[pGuid] = nil
        else
          for z, y in pairs(accountMount.Spells) do
            for k, v in pairs (accountMount[pAccId]) do
              if (z ~= v) then
                if (player:HasSpell(z) == true) then
                  local setAccountMount =
                      CharDBQuery(
                      "INSERT IGNORE INTO `" ..
                          accountMount.Config.dbName .. "`.`account_mount_link` VALUES (" .. pAccId .. ", " .. z .. ")"
                  )
                end
              end
            end
          end
        end
    end
end
RegisterPlayerEvent(4, accountMount.setMount)

function accountMount.onLearnSpell(event, packet, player)
    -- locales
    local pAccId = player:GetAccountId()
    local pGuid = player:GetGUIDLow()
    local pLevel = player:GetLevel()

    local spellId = packet:ReadULong()

    for z, y in pairs(accountMount.Spells) do
        for w, x in pairs(accountMount[pAccId]) do
            if (spellId == z and spellId ~= x) then
                if (not (accountMount.newSpells[pGuid])) then
                    accountMount.newSpells[pGuid] = {}
                    table.insert(accountMount.newSpells[pGuid], spellId)
                end
            end
        end
    end

    if ((spellId == 33388) or (spellId == 34091) or (spellId == 34090)) then
        accountMount.learnMount(player)
    end
    return packet;
end
RegisterPacketEvent(299, 7, accountMount.onLearnSpell)

function accountMount.setAllMounts(event)
    for _, player in pairs(GetPlayersInWorld()) do
        accountMount.setMount(event, player)
    end
end
RegisterServerEvent(16, accountMount.setAllMounts)

function accountMount.getAllMounts(event)
    for _, player in pairs(GetPlayersInWorld()) do
        accountMount.getMount(event, player)
    end
end
RegisterServerEvent(33, accountMount.getAllMounts)
