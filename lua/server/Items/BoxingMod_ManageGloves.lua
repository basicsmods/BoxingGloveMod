
BoxingGloveMod.Settings = BoxingGloveMod.Settings or {}

function ManageGlovesRed()
	local player = getPlayer()
	local inv = player:getInventory()
	local weap1s = inv:FindAll("Base.BoxingGloveRed1")
    local weap2s = inv:FindAll("Base.BoxingGloveRed2")
    local weap3s = inv:FindAll("Base.BoxingGloveRed3")

    local gloveslist = inv:FindAll("Base.Gloves_BoxingRed")
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
            inv:AddItem("Base.Gloves_BoxingRed")
			gloves = inv:FindAndReturn("Base.Gloves_BoxingRed")
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

function ManageGlovesBlue()
	local player = getPlayer()
	local inv = player:getInventory()
	local weap1s = inv:FindAll("Base.BoxingGloveBlue1")
    local weap2s = inv:FindAll("Base.BoxingGloveBlue2")
    local weap3s = inv:FindAll("Base.BoxingGloveBlue3")

    local gloveslist = inv:FindAll("Base.Gloves_BoxingBlue")
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
            inv:AddItem("Base.Gloves_BoxingBlue")
			gloves = inv:FindAndReturn("Base.Gloves_BoxingBlue")
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

function ModifyWeaponAttribute(item_name, attribute, value)
    item = ScriptManager.instance:getItem(item_name)
    if item then
        item:DoParam(attribute.." = "..value)
    end
end

function updateInventoryItemsHelper(player, inv, item_name)
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

function updateInventoryItems()
    local player = getPlayer()
    if player then
	    local inv = player:getInventory()
        if inv then
            updateInventoryItemsHelper(player, inv, "Base.BoxingGloveRed1")
            updateInventoryItemsHelper(player, inv, "Base.BoxingGloveRed2")
            updateInventoryItemsHelper(player, inv, "Base.BoxingGloveRed3")
            updateInventoryItemsHelper(player, inv, "Base.BoxingGloveBlue1")
            updateInventoryItemsHelper(player, inv, "Base.BoxingGloveBlue2")
            updateInventoryItemsHelper(player, inv, "Base.BoxingGloveBlue3")
        end
    end
end


function ApplyWeaponSandboxSettings()
    ModifyWeaponAttribute("Base.BoxingGloveRed1", "Weight", SandboxVars.BoxingGloveMod.Weight)
    ModifyWeaponAttribute("Base.BoxingGloveRed1", "MinDamage", SandboxVars.BoxingGloveMod.MinDamage1)
    if SandboxVars.BoxingGloveMod.MinDamage1 > SandboxVars.BoxingGloveMod.MaxDamage1 then
        ModifyWeaponAttribute("Base.BoxingGloveRed1", "MaxDamage", SandboxVars.BoxingGloveMod.MinDamage1)
    else
        ModifyWeaponAttribute("Base.BoxingGloveRed1", "MaxDamage", SandboxVars.BoxingGloveMod.MaxDamage1)
    end
    ModifyWeaponAttribute("Base.BoxingGloveRed1", "MinRange", SandboxVars.BoxingGloveMod.MinRange1)
    if SandboxVars.BoxingGloveMod.MinRange1 > SandboxVars.BoxingGloveMod.MaxRange1 then
        ModifyWeaponAttribute("Base.BoxingGloveRed1", "MaxRange", SandboxVars.BoxingGloveMod.MinRange1)
    else
        ModifyWeaponAttribute("Base.BoxingGloveRed1", "MaxRange", SandboxVars.BoxingGloveMod.MaxRange1)
    end
    ModifyWeaponAttribute("Base.BoxingGloveRed1", "BaseSpeed", SandboxVars.BoxingGloveMod.BaseSpeed1)
    ModifyWeaponAttribute("Base.BoxingGloveRed1", "CriticalChance", SandboxVars.BoxingGloveMod.CriticalChance1)
    ModifyWeaponAttribute("Base.BoxingGloveRed1", "CritDmgMultiplier", SandboxVars.BoxingGloveMod.CritDmgMultiplier1)
    ModifyWeaponAttribute("Base.BoxingGloveRed1", "ConditionMax", SandboxVars.BoxingGloveMod.MaxDurability1)
    ModifyWeaponAttribute("Base.BoxingGloveRed1", "ConditionLowerChanceOneIn", SandboxVars.BoxingGloveMod.DurabilityLossOneIn1)
    ModifyWeaponAttribute("Base.BoxingGloveRed1", "PushBackMod", SandboxVars.BoxingGloveMod.PushBackMod1)
    ModifyWeaponAttribute("Base.BoxingGloveRed1", "KnockdownMod", SandboxVars.BoxingGloveMod.KnockdownMod1)
    ModifyWeaponAttribute("Base.BoxingGloveRed1", "TreeDamage", SandboxVars.BoxingGloveMod.TreeDamage1)


    ModifyWeaponAttribute("Base.BoxingGloveRed2", "Weight", SandboxVars.BoxingGloveMod.Weight)
    ModifyWeaponAttribute("Base.BoxingGloveRed2", "MinDamage", SandboxVars.BoxingGloveMod.MinDamage2)
    if SandboxVars.BoxingGloveMod.MinDamage2 > SandboxVars.BoxingGloveMod.MaxDamage2 then
        ModifyWeaponAttribute("Base.BoxingGloveRed2", "MaxDamage", SandboxVars.BoxingGloveMod.MinDamage2)
    else
        ModifyWeaponAttribute("Base.BoxingGloveRed2", "MaxDamage", SandboxVars.BoxingGloveMod.MaxDamage2)
    end
    ModifyWeaponAttribute("Base.BoxingGloveRed2", "MinRange", SandboxVars.BoxingGloveMod.MinRange2)
    if SandboxVars.BoxingGloveMod.MinRange2 > SandboxVars.BoxingGloveMod.MaxRange2 then
        ModifyWeaponAttribute("Base.BoxingGloveRed2", "MaxRange", SandboxVars.BoxingGloveMod.MinRange2)
    else
        ModifyWeaponAttribute("Base.BoxingGloveRed2", "MaxRange", SandboxVars.BoxingGloveMod.MaxRange2)
    end
    ModifyWeaponAttribute("Base.BoxingGloveRed2", "BaseSpeed", SandboxVars.BoxingGloveMod.BaseSpeed2)
    ModifyWeaponAttribute("Base.BoxingGloveRed2", "CriticalChance", SandboxVars.BoxingGloveMod.CriticalChance2)
    ModifyWeaponAttribute("Base.BoxingGloveRed2", "CritDmgMultiplier", SandboxVars.BoxingGloveMod.CritDmgMultiplier2)
    ModifyWeaponAttribute("Base.BoxingGloveRed2", "ConditionMax", SandboxVars.BoxingGloveMod.MaxDurability2)
    ModifyWeaponAttribute("Base.BoxingGloveRed2", "ConditionLowerChanceOneIn", SandboxVars.BoxingGloveMod.DurabilityLossOneIn2)
    ModifyWeaponAttribute("Base.BoxingGloveRed2", "PushBackMod", SandboxVars.BoxingGloveMod.PushBackMod2)
    ModifyWeaponAttribute("Base.BoxingGloveRed2", "KnockdownMod", SandboxVars.BoxingGloveMod.KnockdownMod2)
    ModifyWeaponAttribute("Base.BoxingGloveRed2", "TreeDamage", SandboxVars.BoxingGloveMod.TreeDamage2)


    ModifyWeaponAttribute("Base.BoxingGloveRed3", "Weight", SandboxVars.BoxingGloveMod.Weight)
    ModifyWeaponAttribute("Base.BoxingGloveRed3", "MinDamage", SandboxVars.BoxingGloveMod.MinDamage3)
    if SandboxVars.BoxingGloveMod.MinDamage3 > SandboxVars.BoxingGloveMod.MaxDamage3 then
        ModifyWeaponAttribute("Base.BoxingGloveRed3", "MaxDamage", SandboxVars.BoxingGloveMod.MinDamage3)
    else
        ModifyWeaponAttribute("Base.BoxingGloveRed3", "MaxDamage", SandboxVars.BoxingGloveMod.MaxDamage3)
    end
    ModifyWeaponAttribute("Base.BoxingGloveRed3", "MinRange", SandboxVars.BoxingGloveMod.MinRange3)
    if SandboxVars.BoxingGloveMod.MinRange3 > SandboxVars.BoxingGloveMod.MaxRange3 then
        ModifyWeaponAttribute("Base.BoxingGloveRed3", "MaxRange", SandboxVars.BoxingGloveMod.MinRange3)
    else
        ModifyWeaponAttribute("Base.BoxingGloveRed3", "MaxRange", SandboxVars.BoxingGloveMod.MaxRange3)
    end
    ModifyWeaponAttribute("Base.BoxingGloveRed3", "BaseSpeed", SandboxVars.BoxingGloveMod.BaseSpeed3)
    ModifyWeaponAttribute("Base.BoxingGloveRed3", "CriticalChance", SandboxVars.BoxingGloveMod.CriticalChance3)
    ModifyWeaponAttribute("Base.BoxingGloveRed3", "CritDmgMultiplier", SandboxVars.BoxingGloveMod.CritDmgMultiplier3)
    ModifyWeaponAttribute("Base.BoxingGloveRed3", "ConditionMax", SandboxVars.BoxingGloveMod.MaxDurability3)
    ModifyWeaponAttribute("Base.BoxingGloveRed3", "ConditionLowerChanceOneIn", SandboxVars.BoxingGloveMod.DurabilityLossOneIn3)
    ModifyWeaponAttribute("Base.BoxingGloveRed3", "PushBackMod", SandboxVars.BoxingGloveMod.PushBackMod3)
    ModifyWeaponAttribute("Base.BoxingGloveRed3", "KnockdownMod", SandboxVars.BoxingGloveMod.KnockdownMod3)
    ModifyWeaponAttribute("Base.BoxingGloveRed3", "TreeDamage", SandboxVars.BoxingGloveMod.TreeDamage3)





    ModifyWeaponAttribute("Base.BoxingGloveBlue1", "Weight", SandboxVars.BoxingGloveMod.Weight)
    ModifyWeaponAttribute("Base.BoxingGloveBlue1", "MinDamage", SandboxVars.BoxingGloveMod.MinDamage1)
    if SandboxVars.BoxingGloveMod.MinDamage1 > SandboxVars.BoxingGloveMod.MaxDamage1 then
        ModifyWeaponAttribute("Base.BoxingGloveBlue1", "MaxDamage", SandboxVars.BoxingGloveMod.MinDamage1)
    else
        ModifyWeaponAttribute("Base.BoxingGloveBlue1", "MaxDamage", SandboxVars.BoxingGloveMod.MaxDamage1)
    end
    ModifyWeaponAttribute("Base.BoxingGloveBlue1", "MinRange", SandboxVars.BoxingGloveMod.MinRange1)
    if SandboxVars.BoxingGloveMod.MinRange1 > SandboxVars.BoxingGloveMod.MaxRange1 then
        ModifyWeaponAttribute("Base.BoxingGloveBlue1", "MaxRange", SandboxVars.BoxingGloveMod.MinRange1)
    else
        ModifyWeaponAttribute("Base.BoxingGloveBlue1", "MaxRange", SandboxVars.BoxingGloveMod.MaxRange1)
    end
    ModifyWeaponAttribute("Base.BoxingGloveBlue1", "BaseSpeed", SandboxVars.BoxingGloveMod.BaseSpeed1)
    ModifyWeaponAttribute("Base.BoxingGloveBlue1", "CriticalChance", SandboxVars.BoxingGloveMod.CriticalChance1)
    ModifyWeaponAttribute("Base.BoxingGloveBlue1", "CritDmgMultiplier", SandboxVars.BoxingGloveMod.CritDmgMultiplier1)
    ModifyWeaponAttribute("Base.BoxingGloveBlue1", "ConditionMax", SandboxVars.BoxingGloveMod.MaxDurability1)
    ModifyWeaponAttribute("Base.BoxingGloveBlue1", "ConditionLowerChanceOneIn", SandboxVars.BoxingGloveMod.DurabilityLossOneIn1)
    ModifyWeaponAttribute("Base.BoxingGloveBlue1", "PushBackMod", SandboxVars.BoxingGloveMod.PushBackMod1)
    ModifyWeaponAttribute("Base.BoxingGloveBlue1", "KnockdownMod", SandboxVars.BoxingGloveMod.KnockdownMod1)
    ModifyWeaponAttribute("Base.BoxingGloveBlue1", "TreeDamage", SandboxVars.BoxingGloveMod.TreeDamage1)


    ModifyWeaponAttribute("Base.BoxingGloveBlue2", "Weight", SandboxVars.BoxingGloveMod.Weight)
    ModifyWeaponAttribute("Base.BoxingGloveBlue2", "MinDamage", SandboxVars.BoxingGloveMod.MinDamage2)
    if SandboxVars.BoxingGloveMod.MinDamage2 > SandboxVars.BoxingGloveMod.MaxDamage2 then
        ModifyWeaponAttribute("Base.BoxingGloveBlue2", "MaxDamage", SandboxVars.BoxingGloveMod.MinDamage2)
    else
        ModifyWeaponAttribute("Base.BoxingGloveBlue2", "MaxDamage", SandboxVars.BoxingGloveMod.MaxDamage2)
    end
    ModifyWeaponAttribute("Base.BoxingGloveBlue2", "MinRange", SandboxVars.BoxingGloveMod.MinRange2)
    if SandboxVars.BoxingGloveMod.MinRange2 > SandboxVars.BoxingGloveMod.MaxRange2 then
        ModifyWeaponAttribute("Base.BoxingGloveBlue2", "MaxRange", SandboxVars.BoxingGloveMod.MinRange2)
    else
        ModifyWeaponAttribute("Base.BoxingGloveBlue2", "MaxRange", SandboxVars.BoxingGloveMod.MaxRange2)
    end
    ModifyWeaponAttribute("Base.BoxingGloveBlue2", "BaseSpeed", SandboxVars.BoxingGloveMod.BaseSpeed2)
    ModifyWeaponAttribute("Base.BoxingGloveBlue2", "CriticalChance", SandboxVars.BoxingGloveMod.CriticalChance2)
    ModifyWeaponAttribute("Base.BoxingGloveBlue2", "CritDmgMultiplier", SandboxVars.BoxingGloveMod.CritDmgMultiplier2)
    ModifyWeaponAttribute("Base.BoxingGloveBlue2", "ConditionMax", SandboxVars.BoxingGloveMod.MaxDurability2)
    ModifyWeaponAttribute("Base.BoxingGloveBlue2", "ConditionLowerChanceOneIn", SandboxVars.BoxingGloveMod.DurabilityLossOneIn2)
    ModifyWeaponAttribute("Base.BoxingGloveBlue2", "PushBackMod", SandboxVars.BoxingGloveMod.PushBackMod2)
    ModifyWeaponAttribute("Base.BoxingGloveBlue2", "KnockdownMod", SandboxVars.BoxingGloveMod.KnockdownMod2)
    ModifyWeaponAttribute("Base.BoxingGloveBlue2", "TreeDamage", SandboxVars.BoxingGloveMod.TreeDamage2)


    ModifyWeaponAttribute("Base.BoxingGloveBlue3", "Weight", SandboxVars.BoxingGloveMod.Weight)
    ModifyWeaponAttribute("Base.BoxingGloveBlue3", "MinDamage", SandboxVars.BoxingGloveMod.MinDamage3)
    if SandboxVars.BoxingGloveMod.MinDamage3 > SandboxVars.BoxingGloveMod.MaxDamage3 then
        ModifyWeaponAttribute("Base.BoxingGloveBlue3", "MaxDamage", SandboxVars.BoxingGloveMod.MinDamage3)
    else
        ModifyWeaponAttribute("Base.BoxingGloveBlue3", "MaxDamage", SandboxVars.BoxingGloveMod.MaxDamage3)
    end
    ModifyWeaponAttribute("Base.BoxingGloveBlue3", "MinRange", SandboxVars.BoxingGloveMod.MinRange3)
    if SandboxVars.BoxingGloveMod.MinRange3 > SandboxVars.BoxingGloveMod.MaxRange3 then
        ModifyWeaponAttribute("Base.BoxingGloveBlue3", "MaxRange", SandboxVars.BoxingGloveMod.MinRange3)
    else
        ModifyWeaponAttribute("Base.BoxingGloveBlue3", "MaxRange", SandboxVars.BoxingGloveMod.MaxRange3)
    end
    ModifyWeaponAttribute("Base.BoxingGloveBlue3", "BaseSpeed", SandboxVars.BoxingGloveMod.BaseSpeed3)
    ModifyWeaponAttribute("Base.BoxingGloveBlue3", "CriticalChance", SandboxVars.BoxingGloveMod.CriticalChance3)
    ModifyWeaponAttribute("Base.BoxingGloveBlue3", "CritDmgMultiplier", SandboxVars.BoxingGloveMod.CritDmgMultiplier3)
    ModifyWeaponAttribute("Base.BoxingGloveBlue3", "ConditionMax", SandboxVars.BoxingGloveMod.MaxDurability3)
    ModifyWeaponAttribute("Base.BoxingGloveBlue3", "ConditionLowerChanceOneIn", SandboxVars.BoxingGloveMod.DurabilityLossOneIn3)
    ModifyWeaponAttribute("Base.BoxingGloveBlue3", "PushBackMod", SandboxVars.BoxingGloveMod.PushBackMod3)
    ModifyWeaponAttribute("Base.BoxingGloveBlue3", "KnockdownMod", SandboxVars.BoxingGloveMod.KnockdownMod3)
    ModifyWeaponAttribute("Base.BoxingGloveBlue3", "TreeDamage", SandboxVars.BoxingGloveMod.TreeDamage3)
end

function ModifyEquippedWeaponAttribute(attribute_key, attribute_value)
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
    local item_name
    local prim_name = prim:getName()
    if prim_name == "BoxingGlove 1 (Red)" then
        item_name = "Base.BoxingGloveRed1"
    elseif prim_name == "BoxingGlove 2 (Red)" then
        item_name = "Base.BoxingGloveRed2"
    elseif prim_name == "BoxingGlove 3 (Red)" then
        item_name = "Base.BoxingGloveRed3"
    elseif prim_name == "BoxingGlove 1 (Blue)" then
        item_name = "Base.BoxingGloveBlue1"
    elseif prim_name == "BoxingGlove 2 (Blue)" then
        item_name = "Base.BoxingGloveBlue2"
    elseif prim_name == "BoxingGlove 3 (Blue)" then
        item_name = "Base.BoxingGloveBlue3"
    end
    if not item_name then
        return
    end
    ModifyWeaponAttribute(item_name, attribute_key, attribute_value)

    local attached = false
    local condition = prim:getCondition()
    local repair = prim:getHaveBeenRepaired()
    player:removeWornItem(prim)
    if prim:getAttachedSlot() > -1 then
        attached = true
    end
    inv:Remove(prim)
    new_weap = inv:AddItem(item_name)
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

local jab = true
function toggleSwingAnim()
    local rand = ZombRand(100)
    local thresh = 50
    if BoxingGloveMod.Settings then
        local ratio = BoxingGloveMod.Settings:Get("WEAPON_JABRATIO")
        if ratio then
            thresh = ratio * 100
        end
    end

    local next_jab = rand < thresh

    if jab == next_jab then
        return
    end
    jab = next_jab
    if jab then
        ModifyEquippedWeaponAttribute("SwingAnim", "Stab")
    else
        ModifyEquippedWeaponAttribute("SwingAnim", "Bat")
    end
end

Events.OnEquipPrimary.Add(ManageGlovesRed)
Events.OnEquipPrimary.Add(ManageGlovesBlue)
Events.OnInitWorld.Add(ApplyWeaponSandboxSettings)
Events.OnGameStart.Add(ApplyWeaponSandboxSettings)
Events.OnGameStart.Add(updateInventoryItems)
--Events.OnKeyPressed.Add(ApplyDropRates)
--Events.OnGameBoot.Add(ApplyDropRates)
--Events.OnMainMenuEnter.Add(ApplyDropRates)
--Events.OnLoad.Add(ApplyDropRates)
--Events.OnResetLua.Add(ApplyDropRates)
Events.OnPlayerAttackFinished.Add(toggleSwingAnim)

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
function testFunc99()
    item = ScriptManager.instance:getItem("Base.BoxingGloveRed1")
    if item then
        item:DoParam("Weight = "..new_weight)
        new_weight = new_weight + 0.01
    end
    return
end

Events.EveryOneMinute.Add(testFunc99)--]]