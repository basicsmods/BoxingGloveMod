function ManageGlovesRed1()
	local player = getPlayer()
	local inv = player:getInventory()
	local weap = inv:FindAndReturn("Base.BoxingGloveRed1")
	local gloves = inv:FindAndReturn("Base.Gloves_BoxingRed")
	if not weap then
		if gloves then
			if player:isEquipped(gloves) then
				player:removeWornItem(gloves)
			end
			inv:Remove(gloves)
		end
		return
	end
	local weap_equipped = player:isEquipped(weap)

	if not weap_equipped then
		local weap2 = inv:FindAndReturn("Base.BoxingGloveRed2")
		if weap2 and player:isEquipped(weap2) then
			return
		end
		local weap3 = inv:FindAndReturn("Base.BoxingGloveRed3")
		if weap3 and player:isEquipped(weap3) then
			return
		end
	end

	local gloves_equipped = false
	if gloves then
		gloves_equipped = player:isEquipped(gloves)
	end

	if weap_equipped then
		if not gloves then
            player:Say("1")
			inv:AddItem("Base.Gloves_BoxingRed")
			gloves = inv:FindAndReturn("Base.Gloves_BoxingRed")
		end
		if not gloves_equipped then
			player:setWornItem(gloves:getBodyLocation(), gloves)
            player:Say("2")
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

function ManageGlovesRed2()
	local player = getPlayer()
	local inv = player:getInventory()
	local weap = inv:FindAndReturn("Base.BoxingGloveRed2")
	local gloves = inv:FindAndReturn("Base.Gloves_BoxingRed")
	if not weap then
		if gloves then
			if player:isEquipped(gloves) then
				player:removeWornItem(gloves)
			end
			inv:Remove(gloves)
		end
		return
	end
	local weap_equipped = player:isEquipped(weap)
	
	if not weap_equipped then
		local weap1 = inv:FindAndReturn("Base.BoxingGloveRed1")
		if weap1 and player:isEquipped(weap1) then
			return
		end
		local weap3 = inv:FindAndReturn("Base.BoxingGloveRed3")
		if weap3 and player:isEquipped(weap3) then
			return
		end
	end

	local gloves_equipped = false
	if gloves then
		gloves_equipped = player:isEquipped(gloves)
	end

	if weap_equipped then
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

function ManageGlovesRed3()
	local player = getPlayer()
	local inv = player:getInventory()
	local weap = inv:FindAndReturn("Base.BoxingGloveRed3")
	local gloves = inv:FindAndReturn("Base.Gloves_BoxingRed")
	if not weap then
		if gloves then
			if player:isEquipped(gloves) then
				player:removeWornItem(gloves)
			end
			inv:Remove(gloves)
		end
		return
	end
	local weap_equipped = player:isEquipped(weap)
	
	if not weap_equipped then
		local weap2 = inv:FindAndReturn("Base.BoxingGloveRed2")
		if weap2 and player:isEquipped(weap2) then
			return
		end
		local weap1 = inv:FindAndReturn("Base.BoxingGloveRed1")
		if weap1 and player:isEquipped(weap1) then
			return
		end
	end

	local gloves_equipped = false
	if gloves then
		gloves_equipped = player:isEquipped(gloves)
	end

	if weap_equipped then
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

function ManageGlovesBlue1()
	local player = getPlayer()
	local inv = player:getInventory()
	local weap = inv:FindAndReturn("Base.BoxingGloveBlue1")
	local gloves = inv:FindAndReturn("Base.Gloves_BoxingBlue")
	if not weap then
		if gloves then
			if player:isEquipped(gloves) then
				player:removeWornItem(gloves)
			end
			inv:Remove(gloves)
		end
		return
	end
	local weap_equipped = player:isEquipped(weap)
	
	if not weap_equipped then
		local weap2 = inv:FindAndReturn("Base.BoxingGloveBlue2")
		if weap2 and player:isEquipped(weap2) then
			return
		end
		local weap3 = inv:FindAndReturn("Base.BoxingGloveBlue3")
		if weap3 and player:isEquipped(weap3) then
			return
		end
	end

	local gloves_equipped = false
	if gloves then
		gloves_equipped = player:isEquipped(gloves)
	end

	if weap_equipped then
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

function ManageGlovesBlue2()
	local player = getPlayer()
	local inv = player:getInventory()
	local weap = inv:FindAndReturn("Base.BoxingGloveBlue2")
	local gloves = inv:FindAndReturn("Base.Gloves_BoxingBlue")
	if not weap then
		if gloves then
			if player:isEquipped(gloves) then
				player:removeWornItem(gloves)
			end
			inv:Remove(gloves)
		end
		return
	end
	local weap_equipped = player:isEquipped(weap)
	
	if not weap_equipped then
		local weap1 = inv:FindAndReturn("Base.BoxingGloveBlue1")
		if weap1 and player:isEquipped(weap1) then
			return
		end
		local weap3 = inv:FindAndReturn("Base.BoxingGloveBlue3")
		if weap3 and player:isEquipped(weap3) then
			return
		end
	end

	local gloves_equipped = false
	if gloves then
		gloves_equipped = player:isEquipped(gloves)
	end

	if weap_equipped then
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

function ManageGlovesBlue3()
	local player = getPlayer()
	local inv = player:getInventory()
	local weap = inv:FindAndReturn("Base.BoxingGloveBlue3")
	local gloves = inv:FindAndReturn("Base.Gloves_BoxingBlue")
	if not weap then
		if gloves then
			if player:isEquipped(gloves) then
				player:removeWornItem(gloves)
			end
			inv:Remove(gloves)
		end
		return
	end
	local weap_equipped = player:isEquipped(weap)
	
	if not weap_equipped then
		local weap2 = inv:FindAndReturn("Base.BoxingGloveBlue2")
		if weap2 and player:isEquipped(weap2) then
			return
		end
		local weap1 = inv:FindAndReturn("Base.BoxingGloveBlue1")
		if weap1 and player:isEquipped(weap1) then
			return
		end
	end

	local gloves_equipped = false
	if gloves then
		gloves_equipped = player:isEquipped(gloves)
	end

	if weap_equipped then
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

Events.OnEquipPrimary.Add(ManageGlovesRed1)
Events.OnEquipPrimary.Add(ManageGlovesRed2)
Events.OnEquipPrimary.Add(ManageGlovesRed3)
Events.OnEquipPrimary.Add(ManageGlovesBlue1)
Events.OnEquipPrimary.Add(ManageGlovesBlue2)
Events.OnEquipPrimary.Add(ManageGlovesBlue3)

--[[
-- use this type of code to implement mod options for changing the weapon stats
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