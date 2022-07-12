--package.path = "../?.lua;" .. package.path
require('BoxingMod_Settings')

BoxingGloveMod = BoxingGloveMod or {}
BoxingGloveMod.Settings = BoxingGloveMod.Settings or {}

local Colour = {}
Colour.Red = 0
Colour.Blue = 1
Colour.Black = 2
Colour.Pink = 3
Colour.White = 4

local function ManageGloves(clr)
	local player = getPlayer()
	local inv = player:getInventory()
	local weap1s = inv:FindAll("Base.BoxingGlove"..clr.."1")
    local weap2s = inv:FindAll("Base.BoxingGlove"..clr.."2")
    local weap3s = inv:FindAll("Base.BoxingGlove"..clr.."3")

    local gloveslist = inv:FindAll("Base.Gloves_Boxing"..clr)
    local gloves
    for i=0,gloveslist:size()-1 do
        if player:isEquipped(gloveslist:get(i)) then
            gloves = gloveslist:get(i)
            break
        end
    end

	if not weap1s:size() and not weap2s:size() and not weap3s:size() then
        -- we could be here but still have gloves to delete if the player
        -- just dropped their equipped gloves
        if gloveslist:size() then
            if gloves then
                player:removeWornItem(gloves)
			end
            for i=0,gloveslist:size()-1 do
			    inv:Remove(gloveslist:get(i))
            end
        end
		return
	end

	local weap_equipped1 = false
    local weap_equipped2 = false
    local weap_equipped3 = false

    for i=0,weap1s:size()-1 do
        if player:isEquipped(weap1s:get(i)) then
            weap_equipped1 = true
            break
        end
    end
    for i=0,weap2s:size()-1 do
        if player:isEquipped(weap2s:get(i)) then
            weap_equipped2 = true
            break
        end
    end
    for i=0,weap3s:size()-1 do
        if player:isEquipped(weap3s:get(i)) then
            weap_equipped3 = true
            break
        end
    end

    if weap_equipped1 or weap_equipped2 or weap_equipped3 then
        if not gloves then
            inv:AddItem("Base.Gloves_Boxing"..clr)
			gloves = inv:FindAndReturn("Base.Gloves_Boxing"..clr)
            player:setWornItem(gloves:getBodyLocation(), gloves)
        end
    else
        if gloveslist:size() then
            if gloves then
                player:removeWornItem(gloves)
			end
            for i=0,gloveslist:size()-1 do
			    inv:Remove(gloveslist:get(i))
            end
        end
    end
end

local function ModifyWeaponAttribute(item_name, attribute, value)
    item = ScriptManager.instance:getItem(item_name)
    if item then
        item:DoParam(attribute.." = "..value)
    end
end

local function updateInventoryItemsHelper(player, inv, item_name)
    local weaps = inv:FindAll(item_name)
    local conditions = {}
    local repairs = {}
    local equipped = 0
    local attached = 0
    for i=1,weaps:size() do
        local weap = weaps:get(i-1)
        conditions[i-1] = weap:getCondition()
        repairs[i-1] = weap:getHaveBeenRepaired()
        if player:isEquipped(weap) then
            equipped = i
            player:removeWornItem(weap)
        end
        if weap:getAttachedSlot() > -1 then
            attached = i
        end
        inv:Remove(weap)
        inv:AddItem(item_name)
    end
    weaps = inv:FindAll(item_name)
    for i=1,weaps:size() do
        local weap = weaps:get(i-1)
        local condition = conditions[i-1]
        local repair = repairs[i-1]
        weap:setCondition(condition)
        weap:setHaveBeenRepaired(repair)
        if equipped == i then
            player:setPrimaryHandItem(weap)
        end
        if attached == i then
            player:setAttachedItem("Big Weapon On Back", weap);
		    weap:setAttachedSlot(1);
		    weap:setAttachedSlotType("Back");
		    weap:setAttachedToModel("Big Weapon On Back");
        end
    end
end

local function updateInventoryItems(clr)
    local player = getPlayer()
    if player then
	    local inv = player:getInventory()
        if inv then
            updateInventoryItemsHelper(player, inv, "Base.BoxingGlove"..clr.."1")
            updateInventoryItemsHelper(player, inv, "Base.BoxingGlove"..clr.."2")
            updateInventoryItemsHelper(player, inv, "Base.BoxingGlove"..clr.."3")
        end
    end
end


local function ApplyWeaponSandboxSettings(clr)
    ModifyWeaponAttribute("Base.BoxingGlove"..clr.."1", "Weight", SandboxVars.BoxingGloveMod.Weight)
    ModifyWeaponAttribute("Base.BoxingGlove"..clr.."1", "MinDamage", SandboxVars.BoxingGloveMod.MinDamage1)
    if SandboxVars.BoxingGloveMod.MinDamage1 > SandboxVars.BoxingGloveMod.MaxDamage1 then
        ModifyWeaponAttribute("Base.BoxingGlove"..clr.."1", "MaxDamage", SandboxVars.BoxingGloveMod.MinDamage1)
    else
        ModifyWeaponAttribute("Base.BoxingGlove"..clr.."1", "MaxDamage", SandboxVars.BoxingGloveMod.MaxDamage1)
    end
    ModifyWeaponAttribute("Base.BoxingGlove"..clr.."1", "MinRange", SandboxVars.BoxingGloveMod.MinRange1)
    if SandboxVars.BoxingGloveMod.MinRange1 > SandboxVars.BoxingGloveMod.MaxRange1 then
        ModifyWeaponAttribute("Base.BoxingGlove"..clr.."1", "MaxRange", SandboxVars.BoxingGloveMod.MinRange1)
    else
        ModifyWeaponAttribute("Base.BoxingGlove"..clr.."1", "MaxRange", SandboxVars.BoxingGloveMod.MaxRange1)
    end
    ModifyWeaponAttribute("Base.BoxingGlove"..clr.."1", "BaseSpeed", SandboxVars.BoxingGloveMod.BaseSpeed1)
    ModifyWeaponAttribute("Base.BoxingGlove"..clr.."1", "CriticalChance", SandboxVars.BoxingGloveMod.CriticalChance1)
    ModifyWeaponAttribute("Base.BoxingGlove"..clr.."1", "CritDmgMultiplier", SandboxVars.BoxingGloveMod.CritDmgMultiplier1)
    ModifyWeaponAttribute("Base.BoxingGlove"..clr.."1", "ConditionMax", SandboxVars.BoxingGloveMod.MaxDurability1)
    ModifyWeaponAttribute("Base.BoxingGlove"..clr.."1", "ConditionLowerChanceOneIn", SandboxVars.BoxingGloveMod.DurabilityLossOneIn1)
    ModifyWeaponAttribute("Base.BoxingGlove"..clr.."1", "TreeDamage", SandboxVars.BoxingGloveMod.TreeDamage1)


    ModifyWeaponAttribute("Base.BoxingGlove"..clr.."2", "Weight", SandboxVars.BoxingGloveMod.Weight)
    ModifyWeaponAttribute("Base.BoxingGlove"..clr.."2", "MinDamage", SandboxVars.BoxingGloveMod.MinDamage2)
    if SandboxVars.BoxingGloveMod.MinDamage2 > SandboxVars.BoxingGloveMod.MaxDamage2 then
        ModifyWeaponAttribute("Base.BoxingGlove"..clr.."2", "MaxDamage", SandboxVars.BoxingGloveMod.MinDamage2)
    else
        ModifyWeaponAttribute("Base.BoxingGlove"..clr.."2", "MaxDamage", SandboxVars.BoxingGloveMod.MaxDamage2)
    end
    ModifyWeaponAttribute("Base.BoxingGlove"..clr.."2", "MinRange", SandboxVars.BoxingGloveMod.MinRange2)
    if SandboxVars.BoxingGloveMod.MinRange2 > SandboxVars.BoxingGloveMod.MaxRange2 then
        ModifyWeaponAttribute("Base.BoxingGlove"..clr.."2", "MaxRange", SandboxVars.BoxingGloveMod.MinRange2)
    else
        ModifyWeaponAttribute("Base.BoxingGlove"..clr.."2", "MaxRange", SandboxVars.BoxingGloveMod.MaxRange2)
    end
    ModifyWeaponAttribute("Base.BoxingGlove"..clr.."2", "BaseSpeed", SandboxVars.BoxingGloveMod.BaseSpeed2)
    ModifyWeaponAttribute("Base.BoxingGlove"..clr.."2", "CriticalChance", SandboxVars.BoxingGloveMod.CriticalChance2)
    ModifyWeaponAttribute("Base.BoxingGlove"..clr.."2", "CritDmgMultiplier", SandboxVars.BoxingGloveMod.CritDmgMultiplier2)
    ModifyWeaponAttribute("Base.BoxingGlove"..clr.."2", "ConditionMax", SandboxVars.BoxingGloveMod.MaxDurability2)
    ModifyWeaponAttribute("Base.BoxingGlove"..clr.."2", "ConditionLowerChanceOneIn", SandboxVars.BoxingGloveMod.DurabilityLossOneIn2)
    ModifyWeaponAttribute("Base.BoxingGlove"..clr.."2", "TreeDamage", SandboxVars.BoxingGloveMod.TreeDamage2)


    ModifyWeaponAttribute("Base.BoxingGlove"..clr.."3", "Weight", SandboxVars.BoxingGloveMod.Weight)
    ModifyWeaponAttribute("Base.BoxingGlove"..clr.."3", "MinDamage", SandboxVars.BoxingGloveMod.MinDamage3)
    if SandboxVars.BoxingGloveMod.MinDamage3 > SandboxVars.BoxingGloveMod.MaxDamage3 then
        ModifyWeaponAttribute("Base.BoxingGlove"..clr.."3", "MaxDamage", SandboxVars.BoxingGloveMod.MinDamage3)
    else
        ModifyWeaponAttribute("Base.BoxingGlove"..clr.."3", "MaxDamage", SandboxVars.BoxingGloveMod.MaxDamage3)
    end
    ModifyWeaponAttribute("Base.BoxingGlove"..clr.."3", "MinRange", SandboxVars.BoxingGloveMod.MinRange3)
    if SandboxVars.BoxingGloveMod.MinRange3 > SandboxVars.BoxingGloveMod.MaxRange3 then
        ModifyWeaponAttribute("Base.BoxingGlove"..clr.."3", "MaxRange", SandboxVars.BoxingGloveMod.MinRange3)
    else
        ModifyWeaponAttribute("Base.BoxingGlove"..clr.."3", "MaxRange", SandboxVars.BoxingGloveMod.MaxRange3)
    end
    ModifyWeaponAttribute("Base.BoxingGlove"..clr.."3", "BaseSpeed", SandboxVars.BoxingGloveMod.BaseSpeed3)
    ModifyWeaponAttribute("Base.BoxingGlove"..clr.."3", "CriticalChance", SandboxVars.BoxingGloveMod.CriticalChance3)
    ModifyWeaponAttribute("Base.BoxingGlove"..clr.."3", "CritDmgMultiplier", SandboxVars.BoxingGloveMod.CritDmgMultiplier3)
    ModifyWeaponAttribute("Base.BoxingGlove"..clr.."3", "ConditionMax", SandboxVars.BoxingGloveMod.MaxDurability3)
    ModifyWeaponAttribute("Base.BoxingGlove"..clr.."3", "ConditionLowerChanceOneIn", SandboxVars.BoxingGloveMod.DurabilityLossOneIn3)
    ModifyWeaponAttribute("Base.BoxingGlove"..clr.."3", "TreeDamage", SandboxVars.BoxingGloveMod.TreeDamage3)
end

local function ModifyEquippedWeaponAttribute(attribute_key, attribute_value)
    local player = getPlayer()
    if not player then
        return
    end
    local inv = player:getInventory()
    if not inv then
        return
    end
    local prim = player:getPrimaryHandItem()
    if not prim then
        return
    end

    local prim_name = prim:getType()
    ModifyWeaponAttribute(prim_name, attribute_key, attribute_value)

    local attached = false
    local condition = prim:getCondition()
    local repair = prim:getHaveBeenRepaired()
    player:removeWornItem(prim)
    if prim:getAttachedSlot() > -1 then
        attached = true
    end
    inv:Remove(prim)
    local new_weap = inv:AddItem(prim_name)
    new_weap:setCondition(condition)
    new_weap:setHaveBeenRepaired(repair)
    player:setPrimaryHandItem(new_weap)
    if attached then
        player:setAttachedItem("Big Weapon On Back", new_weap);
        new_weap:setAttachedSlot(1);
        new_weap:setAttachedSlotType("Back");
        new_weap:setAttachedToModel("Big Weapon On Back");
    end
end

local fresh_weap2 = true
local knockMode = false
local function calculateKnockChance(swingChance)
    local player = getPlayer()
    if not player then
        return
    end
    local inv = player:getInventory()
    if not inv then
        return
    end
    local prim = player:getPrimaryHandItem()
    if not prim then
        return
    end
    local knockChance
    local prim_name = prim:getType()
    if prim_name == "BoxingGlove 1" then
        knockChance = SandboxVars.BoxingGloveMod.KnockChance1
    elseif prim_name == "BoxingGlove 2" then
        knockChance = SandboxVars.BoxingGloveMod.KnockChance2
    elseif prim_name == "BoxingGlove 3" then
        knockChance = SandboxVars.BoxingGloveMod.KnockChance3
    end
    if not knockChance then
        return
    end

    local swingChance = 100 - swingChance
    swingChance = swingChance / 100
    if swingChance == 0 then
        -- so we don't divide by 0
        swingChance = 0.01
    end
    local swingKnockChance = knockChance / swingChance

    local rand = ZombRand(100)
    local knock = rand < swingKnockChance
    if not fresh_weap2 and knock == knockMode then
        return
    end
    fresh_weap2 = false
    knockMode = knock
    if knockMode then
        ModifyEquippedWeaponAttribute("AlwaysKnockdown", "TRUE")
    else
        ModifyEquippedWeaponAttribute("AlwaysKnockdown", "FALSE")
    end
end

local fresh_weap = true
local swing = true
local function ToggleSwingAnim()
    local rand = ZombRand(100)
    local thresh = 50
    if BoxingGloveMod.Settings then
        local ratio = BoxingGloveMod.Settings:Get("WEAPON_SWINGRATIO")
        if ratio then
            thresh = ratio * 100
        end
    end

    local next_swing = rand < thresh

    if not next_swing then
        calculateKnockChance(thresh)
    end

    if not fresh_weap and swing == next_swing then
        return
    end
    fresh_weap = false
    swing = next_swing
    if swing then
        ModifyEquippedWeaponAttribute("SwingAnim", "Stab")
    else
        ModifyEquippedWeaponAttribute("SwingAnim", "Bat")
    end
end

local function ResetSavedSwingToggle()
    fresh_weap = true
    fresh_weap2 = true
end

local function upgradeGlovePressed(gloveTier, gloveColour)
    local player = getPlayer()
    local inv = player:getInventory()
    local gloveNameRed
    local gloveNameBlue
    local gloveNameBlack
    local gloveNamePink
    local gloveNameWhite

    if gloveTier == 1 then
        gloveNameRed = "Base.BoxingGloveRed1"
        gloveNameBlue = "Base.BoxingGloveBlue1"
        gloveNameBlack = "Base.BoxingGloveBlack1"
        gloveNamePink = "Base.BoxingGlovePink1"
        gloveNameWhite = "Base.BoxingGloveWhite1"
    elseif gloveTier == 2 then
        gloveNameRed = "Base.BoxingGloveRed2"
        gloveNameBlue = "Base.BoxingGloveBlue2"
        gloveNameBlack = "Base.BoxingGloveBlack2"
        gloveNamePink = "Base.BoxingGlovePink2"
        gloveNameWhite = "Base.BoxingGloveWhite2"
    elseif gloveTier == 3 then
        gloveNameRed = "Base.BoxingGloveRed3"
        gloveNameBlue = "Base.BoxingGloveBlue3"
        gloveNameBlack = "Base.BoxingGloveBlack3"
        gloveNamePink = "Base.BoxingGlovePink3"
        gloveNameWhite = "Base.BoxingGloveWhite3"
    else
        return
    end

    local glovesRed = inv:FindAll(gloveNameRed)
    local glovesBlue = inv:FindAll(gloveNameBlue)
    local glovesBlack = inv:FindAll(gloveNameBlack)
    local glovesPink = inv:FindAll(gloveNamePink)
    local glovesWhite = inv:FindAll(gloveNameWhite)
    local num_gloves = glovesRed:size() + glovesBlue:size() + glovesBlack:size() + glovesPink:size() + glovesWhite:size()
    local num_needed
    if (gloveTier == 1) then
        num_needed = SandboxVars.BoxingGloveMod.NumForUpgrade1
    elseif (gloveTier == 2) then
        num_needed = SandboxVars.BoxingGloveMod.NumForUpgrade2
    elseif (gloveTier == 3) then
        num_needed = 1 -- downgrade from 3 to 1
    end

    if not num_needed then
        player:Say("Something went wrong.")
        return
    end

    if num_needed > num_gloves then
        player:Say("Need at least "..num_needed.." gloves to upgrade.")
        return
    end

    local gloves = {}
    for i=0,glovesRed:size()-1 do
        table.insert(gloves, glovesRed:get(i))
    end
    for i=0,glovesBlue:size()-1 do
        table.insert(gloves, glovesBlue:get(i))
    end
    for i=0,glovesBlack:size()-1 do
        table.insert(gloves, glovesBlack:get(i))
    end
    for i=0,glovesWhite:size()-1 do
        table.insert(gloves, glovesWhite:get(i))
    end
    for i=0,glovesPink:size()-1 do
        table.insert(gloves, glovesPink:get(i))
    end

    local function compare_gloves(glove1, glove2)
        return glove1:getCondition() < glove2:getCondition()
    end

    table.sort(gloves, compare_gloves)

    local equipped = false

    local current_weap = player:getPrimaryHandItem()
    for i,glove in ipairs(gloves) do
        if i > num_needed then
            break
        end
        if gloveTier == 3 and glove:getCondition() > 0 then
            player:Say("Can't downgrade a tier 3 that isn't broken.")
            return
        end
        if current_weap == glove then
            player:removeWornItem(glove)
            equipped = true
        end
        inv:Remove(glove)
    end
    local new_glove
    if (gloveTier == 1) then
        if (gloveColour == Colour.Red) then
            new_glove = inv:AddItem("Base.BoxingGloveRed2")
        elseif (gloveColour == Colour.Blue) then
            new_glove = inv:AddItem("Base.BoxingGloveBlue2")
        elseif (gloveColour == Colour.Black) then
            new_glove = inv:AddItem("Base.BoxingGloveBlack2")
        elseif (gloveColour == Colour.White) then
            new_glove = inv:AddItem("Base.BoxingGloveWhite2")
        elseif (gloveColour == Colour.Pink) then
            new_glove = inv:AddItem("Base.BoxingGlovePink2")
        else
            player:Say("Error getting the colour.")
        end
    elseif (gloveTier == 2) then
        if (gloveColour == Colour.Red) then
            new_glove = inv:AddItem("Base.BoxingGloveRed3")
        elseif (gloveColour == Colour.Blue) then
            new_glove = inv:AddItem("Base.BoxingGloveBlue3")
        elseif (gloveColour == Colour.Black) then
            new_glove = inv:AddItem("Base.BoxingGloveBlack3")
        elseif (gloveColour == Colour.White) then
            new_glove = inv:AddItem("Base.BoxingGloveWhite3")
        elseif (gloveColour == Colour.Pink) then
            new_glove = inv:AddItem("Base.BoxingGlovePink3")
        else
            player:Say("Error getting the colour.")
        end
    elseif (gloveTier == 3) then
        if (gloveColour == Colour.Red) then
            new_glove = inv:AddItem("Base.BoxingGloveRed1")
        elseif (gloveColour == Colour.Blue) then
            new_glove = inv:AddItem("Base.BoxingGloveBlue1")
        elseif (gloveColour == Colour.Black) then
            new_glove = inv:AddItem("Base.BoxingGloveBlack1")
        elseif (gloveColour == Colour.White) then
            new_glove = inv:AddItem("Base.BoxingGloveWhite1")
        elseif (gloveColour == Colour.Pink) then
            new_glove = inv:AddItem("Base.BoxingGlovePink1")
        else
            player:Say("Error getting the colour.")
        end
    end

    if equipped and new_glove then
        player:setPrimaryHandItem(new_glove)
    end

    if (gloveTier == 3) then
        player:Say("Downgraded!")
    else
        player:Say("Upgraded!")
    end
end

local function RightClickItem(player_num, context, items)
    local player = getPlayer()
    local glove1 = false
    local glove2 = false
    local glove3 = false

    local function string_starts(str, start)
        return string.sub(str,1,string.len(start))==start
    end
     
    for _, k in pairs(items) do
        if not instanceof(k, "InventoryItem") then
            for _, item in ipairs(k.items) do
                 if instanceof(item, "InventoryItem") then
                    local name = item:getName()
                    if string_starts(name, "BoxingGlove 1") then
                        glove1 = true
                    elseif string_starts(name, "BoxingGlove 2") then
                        glove2 = true
                    elseif string_starts(name, "BoxingGlove 3") then
                        glove3 = true
                    end
                end
            end
        elseif instanceof(k, "InventoryItem") then
            local name = k:getName()
            if string_starts(name, "BoxingGlove 1") then
                glove1 = true
            elseif string_starts(name, "BoxingGlove 2") then
                glove2 = true
            elseif string_starts(name, "BoxingGlove 3") then
                glove3 = true
            end
        end
    end
    if glove1 then
        local option = context:addOption("Upgrade to Glove 2")
        local subMenu = context:getNew(context)
        context:addSubMenu(option, subMenu)
        local subOption1 = subMenu:addOption("Red", 1, upgradeGlovePressed, Colour.Red)
        local subOption2 = subMenu:addOption("Blue", 1, upgradeGlovePressed, Colour.Blue)
        local subOption2 = subMenu:addOption("Black", 1, upgradeGlovePressed, Colour.Black)
        local subOption2 = subMenu:addOption("White", 1, upgradeGlovePressed, Colour.White)
        local subOption2 = subMenu:addOption("Pink", 1, upgradeGlovePressed, Colour.Pink)
        -- option.notAvailable = true ?
    end
    if glove2 then
        local option = context:addOption("Upgrade to Glove 3")
        local subMenu = context:getNew(context)
        context:addSubMenu(option, subMenu)
        local subOption1 = subMenu:addOption("Red", 2, upgradeGlovePressed, Colour.Red)
        local subOption2 = subMenu:addOption("Blue", 2, upgradeGlovePressed, Colour.Blue)
        local subOption2 = subMenu:addOption("Black", 2, upgradeGlovePressed, Colour.Black)
        local subOption2 = subMenu:addOption("White", 2, upgradeGlovePressed, Colour.White)
        local subOption2 = subMenu:addOption("Pink", 2, upgradeGlovePressed, Colour.Pink)
    end
    if glove3 then
        local option = context:addOption("Downgrade to Glove 1")
        local subMenu = context:getNew(context)
        context:addSubMenu(option, subMenu)
        local subOption1 = subMenu:addOption("Red", 3, upgradeGlovePressed, Colour.Red)
        local subOption2 = subMenu:addOption("Blue", 3, upgradeGlovePressed, Colour.Blue)
        local subOption2 = subMenu:addOption("Black", 3, upgradeGlovePressed, Colour.Black)
        local subOption2 = subMenu:addOption("White", 3, upgradeGlovePressed, Colour.White)
        local subOption2 = subMenu:addOption("Pink", 3, upgradeGlovePressed, Colour.Pink)
    end
    --context:addOption(name, param1, callback, param2, param3, etc.)
end


Events.OnEquipPrimary.Add(function() ManageGloves("Red") end)
Events.OnEquipPrimary.Add(function() ManageGloves("Blue") end)
Events.OnEquipPrimary.Add(function() ManageGloves("White") end)
Events.OnEquipPrimary.Add(function() ManageGloves("Black") end)
Events.OnEquipPrimary.Add(function() ManageGloves("Pink") end)

Events.OnInitWorld.Add(function() ApplyWeaponSandboxSettings("Red") end)
Events.OnGameStart.Add(function() ApplyWeaponSandboxSettings("Red") end)
Events.OnInitWorld.Add(function() ApplyWeaponSandboxSettings("Blue") end)
Events.OnGameStart.Add(function() ApplyWeaponSandboxSettings("Blue") end)
Events.OnInitWorld.Add(function() ApplyWeaponSandboxSettings("White") end)
Events.OnGameStart.Add(function() ApplyWeaponSandboxSettings("White") end)
Events.OnInitWorld.Add(function() ApplyWeaponSandboxSettings("Black") end)
Events.OnGameStart.Add(function() ApplyWeaponSandboxSettings("Black") end)
Events.OnInitWorld.Add(function() ApplyWeaponSandboxSettings("Pink") end)
Events.OnGameStart.Add(function() ApplyWeaponSandboxSettings("Pink") end)

Events.OnGameStart.Add(function() updateInventoryItems("Red") end)
Events.OnGameStart.Add(function() updateInventoryItems("Blue") end)
Events.OnGameStart.Add(function() updateInventoryItems("White") end)
Events.OnGameStart.Add(function() updateInventoryItems("Black") end)
Events.OnGameStart.Add(function() updateInventoryItems("Pink") end)
--Events.OnKeyPressed.Add(ApplyDropRates)
--Events.OnGameBoot.Add(ApplyDropRates)
--Events.OnMainMenuEnter.Add(ApplyDropRates)
--Events.OnLoad.Add(ApplyDropRates)
--Events.OnResetLua.Add(ApplyDropRates)
Events.OnEquipPrimary.Add(ResetSavedSwingToggle)
Events.OnPlayerAttackFinished.Add(ToggleSwingAnim)
Events.OnFillInventoryObjectContextMenu.Add(RightClickItem)
--Events.OnWeaponSwingHitPoint.Add()
--Events.OnPlayerAttackFinished.Add

-- SandboxVars.BoxingGloveMod.Weight
-- Events.OnPreDistributionMerge.Add(...)

--[[
-- use this type of code to implement mod options for changing the weapon stats
-- doesn't seem to be a way to modify the repair recipe so instead of doing repair
-- through the traditional way, we can add our own custom context menu and logic for
-- repairing our weapon specifically.
-- Events.OnFillInventoryObjectContextMenu.Add
local new_weight = 0.01
local function testFunc99()
    item = ScriptManager.instance:getItem("Base.BoxingGloveRed1")
    if item then
        item:DoParam("Weight = "..new_weight)
        new_weight = new_weight + 0.01
    end
    return
end

Events.EveryOneMinute.Add(testFunc99)--]]