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



  @Original_Author : iThorgrimHub

  This script allow player to learn mount on connect, levelup.

  @Open-Wow Github : https://github.com/Open-Wow

  @AzerothCore Community : https://discord.gg/PaqQRkd

  Thanks for your patience <3.

]] --
-- Require list of all mount
local mount_listing = require('mount_listing');

-- Local & Options
local accMount = {}

accMount.Config = {

  -- Option for developers
  dbname = 'R1_Eluna';
};

accMount.Account = {};

CharDBExecute("CREATE TABLE IF NOT EXISTS `" ..accMount.Config.dbname.."`.`account_mount` ( `accountid` INT(10) NOT NULL, `spell` INT(10), PRIMARY KEY (`accountid`, `spell`));")


function accMount.setLearn(player)
  local pAcc = player:GetAccountId();

  for key, value in pairs(mount_listing) do

    if (player:HasSpell(33388)) then
      for pkey, pvalue in pairs(accMount.Account[pAcc]) do
        if (value[1] == 20) then
          if (player:isHorde() == false and value[1] == 0 or player:isHorde() == false and value[1] == 1) then
            if (key == pvalue) then
              if (player:HasSpell(pvalue) == false) then
                player:LearnSpell(pvalue);
              end
            end
          elseif (player:isHorde() == true and value[1] == 0 or player:isHorde() == true and value[1] == 2) then
            if (key == pvalue) then
              if (player:HasSpell(pvalue) == false) then
                player:LearnSpell(pvalue);
              end
            end
          end
        end
      end
    end

    if (player:HasSpell(33388)) then
      for pkey, pvalue in pairs(accMount.Account[pAcc]) do
        if (value[1] == 30) then
          if (player:isHorde() == false and value[1] == 0 or player:isHorde() == false and value[1] == 1) then
            if (key == pvalue) then
              if (player:HasSpell(pvalue) == false) then
                player:LearnSpell(pvalue);
              end
            end
          elseif (player:isHorde() == true and value[1] == 0 or player:isHorde() == true and value[1] == 2) then
            if (key == pvalue) then
              if (player:HasSpell(pvalue) == false) then
                player:LearnSpell(pvalue);
              end
            end
          end
        end
      end
    end

    if (player:HasSpell(33391)) then
      for pkey, pvalue in pairs(accMount.Account[pAcc]) do
        if (value[1] == 40) then
          if (player:isHorde() == false and value[1] == 0 or player:isHorde() == false and value[1] == 1) then
            if (key == pvalue) then
              if (player:HasSpell(pvalue) == false) then
                player:LearnSpell(pvalue);
              end
            end
          elseif (player:isHorde() == true and value[1] == 0 or player:isHorde() == true and value[1] == 2) then
            if (key == pvalue) then
              if (player:HasSpell(pvalue) == false) then
                player:LearnSpell(pvalue);
              end
            end
          end
        end
      end
    end

    if (player:HasSpell(34090)) then
      for pkey, pvalue in pairs(accMount.Account[pAcc]) do
        if (value[1] == 60) then
          if (player:isHorde() == false and value[1] == 0 or player:isHorde() == false and value[1] == 1) then
            if (key == pvalue) then
              if (player:HasSpell(pvalue) == false) then
                player:LearnSpell(pvalue);
              end
            end
          elseif (player:isHorde() == true and value[1] == 0 or player:isHorde() == true and value[1] == 2) then
            if (key == pvalue) then
              if (player:HasSpell(pvalue) == false) then
                player:LearnSpell(pvalue);
              end
            end
          end
        end
      end
    end

    if (player:HasSpell(34091)) then
      for pkey, pvalue in pairs(accMount.Account[pAcc]) do
        if (value[1] == 70) then
          if (player:isHorde() == false and value[1] == 0 or player:isHorde() == false and value[1] == 1) then
            if (key == pvalue) then
              if (player:HasSpell(pvalue) == false) then
                player:LearnSpell(pvalue);
              end
            end
          elseif (player:isHorde() == true and value[1] == 0 or player:isHorde() == true and value[1] == 2) then
            if (key == pvalue) then
              if (player:HasSpell(pvalue) == false) then
                player:LearnSpell(pvalue);
              end
            end
          end
        end
      end
    end
  end
end

function accMount.onLogin(event, player)
  local pAcc = player:GetAccountId();

  if (not accMount.Account[pAcc]) then
    accMount.Account[pAcc] = {};
    local getMount = CharDBQuery('SELECT spell FROM '..accMount.Config.dbname..'.account_mount WHERE accountid = '..pAcc..';');
    if (getMount) then
      repeat
        table.insert(accMount.Account[pAcc], getMount:GetUInt32(0));
      until not getMount:NextRow();
    end
  end
  accMount.setLearn(player);
end
RegisterPlayerEvent(3, accMount.onLogin);

function accMount.getAllMounts(event)
    for _, player in pairs(GetPlayersInWorld()) do
        accMount.onLogin(event, player)
    end
end
RegisterServerEvent(33, accMount.getAllMounts)

function accMount.onLogout(event, player)
  local pAcc = player:GetAccountId();

  if (accMount.Account[pAcc]) then
    for k, v in pairs (accMount.Account[pAcc]) do
      local setMount = CharDBQuery('INSERT IGNORE INTO '..accMount.Config.dbname..'.account_mount VALUES ('..pAcc..', '..v..')');
    end
  end
  accMount.Account[pAcc] = nil;
end
RegisterPlayerEvent(4, accMount.onLogout);

function accMount.setAllMounts(event)
    for _, player in pairs(GetPlayersInWorld()) do
        accMount.onLogout(event, player);
    end
end
RegisterServerEvent(16, accMount.setAllMounts);

function accMount.onLevelUp(event, player, oldlevel)
  if (oldlevel == 19 or oldlevel == 39 or oldlevel == 59 or oldlevel == 69) then
    accMount.setLearn(player);
  end
end
RegisterPlayerEvent(13, accMount.onLevelUp);

function accMount.onLearn(event, packet, player);
  local pAcc = player:GetAccountId();
  -- -- -- -- -- -- -- -- -- -- -- --
  local spellId = packet:ReadULong();

  for key, value in pairs(mount_listing) do
    if (spellId == key) then
      table.insert(accMount.Account[pAcc], spellId);
    end
  end

  if ((spellId == 33388) or (spellId == 33391) or (spellId == 34090) or (spellId == 34091)) then
    accMount.setLearn(player);
  end
end
RegisterPacketEvent(299, 7, accMount.onLearn);
