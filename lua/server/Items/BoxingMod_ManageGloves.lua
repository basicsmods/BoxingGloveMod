BoxingGloveMod.Settings = BoxingGloveMod.Settings or {}

function ManageGlovesRed()
	local player = getPlayer()
	local inv = player:getInventory()
	local weap1 = inv:FindAndReturn("Base.BoxingGloveRed1")
    local weap2 = inv:FindAndReturn("Base.BoxingGloveRed2")
    local weap3 = inv:FindAndReturn("Base.BoxingGloveRed3")

    local gloves = inv:FindAndReturn("Base.Gloves_BoxingRed")
    local gloves_equipped = false
	if gloves then
		gloves_equipped = player:isEquipped(gloves)
	end

	if not weap1 and not weap2 and not weap3 then
        -- we could be here but still have gloves to delete if the player
        -- just dropped their equipped gloves
        if gloves then
            if gloves_equipped then
                player:removeWornItem(gloves)
			end
			inv:Remove(gloves)
        end
		return
	end

	local weap_equipped1 = player:isEquipped(weap1)
    local weap_equipped2 = player:isEquipped(weap2)
    local weap_equipped3 = player:isEquipped(weap3)

    if weap_equipped1 or weap_equipped2 or weap_equipped3 then
        if not gloves then
            inv:AddItem("Base.Gloves_BoxingRed")
			gloves = inv:FindAndReturn("Base.Gloves_BoxingRed")
        end
        if not gloves_equipped then
            player:setWornItem(gloves:getBodyLocation(), gloves)
        end
    else
        if gloves then
            if gloves_equipped then
                player:removeWornItem(gloves)
			end
			inv:Remove(gloves)
        end
    end
end

function ManageGlovesBlue()
	local player = getPlayer()
	local inv = player:getInventory()
	local weap1 = inv:FindAndReturn("Base.BoxingGloveBlue1")
    local weap2 = inv:FindAndReturn("Base.BoxingGloveBlue2")
    local weap3 = inv:FindAndReturn("Base.BoxingGloveBlue3")

    local gloves = inv:FindAndReturn("Base.Gloves_BoxingBlue")
    local gloves_equipped = false
	if gloves then
		gloves_equipped = player:isEquipped(gloves)
	end

	if not weap1 and not weap2 and not weap3 then
        -- we could be here but still have gloves to delete if the player
        -- just dropped their equipped gloves
        if gloves then
            if gloves_equipped then
                player:removeWornItem(gloves)
			end
			inv:Remove(gloves)
        end
		return
	end

	local weap_equipped1 = player:isEquipped(weap1)
    local weap_equipped2 = player:isEquipped(weap2)
    local weap_equipped3 = player:isEquipped(weap3)

    if weap_equipped1 or weap_equipped2 or weap_equipped3 then
        if not gloves then
            inv:AddItem("Base.Gloves_BoxingBlue")
			gloves = inv:FindAndReturn("Base.Gloves_BoxingBlue")
        end
        if not gloves_equipped then
            player:setWornItem(gloves:getBodyLocation(), gloves)
        end
    else
        if gloves then
            if gloves_equipped then
                player:removeWornItem(gloves)
			end
			inv:Remove(gloves)
        end
    end
end

function ApplySettings()
    -- if isClient() and self.playerIndex > 0 then
    local new_weight = BoxingGloveMod.Settings:Get("WEAPON1_MIN_DMG")
    if new_weight then
        item = ScriptManager.instance:getItem("Base.BoxingGloveRed1")
        if item then
            item:DoParam("Weight = "..new_weight)
        end
    end
end

Events.OnEquipPrimary.Add(ManageGlovesRed)
Events.OnEquipPrimary.Add(ManageGlovesBlue)
--Events.EveryOneMinute.Add(ApplySettings)


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