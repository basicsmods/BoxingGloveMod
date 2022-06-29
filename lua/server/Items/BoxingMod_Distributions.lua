require "Items/SuburbsDistributions"
require "Items/ProceduralDistributions"
require "Items/VehicleDistributions"
require "Items/ItemPicker"	


	-- zombies
	table.insert(SuburbsDistributions["all"]["inventorymale"].items, "Base.BoxingGloveRed1");
	table.insert(SuburbsDistributions["all"]["inventorymale"].items, 4);
	table.insert(SuburbsDistributions["all"]["inventoryfemale"].items, "Base.BoxingGloveRed1");
	table.insert(SuburbsDistributions["all"]["inventoryfemale"].items, 4);
	table.insert(SuburbsDistributions["all"]["inventorymale"].items, "Base.BoxingGloveRed2");
	table.insert(SuburbsDistributions["all"]["inventorymale"].items, 1);
	table.insert(SuburbsDistributions["all"]["inventoryfemale"].items, "Base.BoxingGloveRed2");
	table.insert(SuburbsDistributions["all"]["inventoryfemale"].items, 1);
	table.insert(SuburbsDistributions["all"]["inventorymale"].items, "Base.BoxingGloveRed3");
	table.insert(SuburbsDistributions["all"]["inventorymale"].items, 0.1);
	table.insert(SuburbsDistributions["all"]["inventoryfemale"].items, "Base.BoxingGloveRed3");
	table.insert(SuburbsDistributions["all"]["inventoryfemale"].items, 0.1);
	
	table.insert(SuburbsDistributions["all"]["inventorymale"].items, "Base.BoxingGloveBlue1");
	table.insert(SuburbsDistributions["all"]["inventorymale"].items, 4);
	table.insert(SuburbsDistributions["all"]["inventoryfemale"].items, "Base.BoxingGloveBlue1");
	table.insert(SuburbsDistributions["all"]["inventoryfemale"].items, 4);
	table.insert(SuburbsDistributions["all"]["inventorymale"].items, "Base.BoxingGloveBlue2");
	table.insert(SuburbsDistributions["all"]["inventorymale"].items, 1);
	table.insert(SuburbsDistributions["all"]["inventoryfemale"].items, "Base.BoxingGloveBlue2");
	table.insert(SuburbsDistributions["all"]["inventoryfemale"].items, 1);
	table.insert(SuburbsDistributions["all"]["inventorymale"].items, "Base.BoxingGloveBlue3");
	table.insert(SuburbsDistributions["all"]["inventorymale"].items, 0.1);
	table.insert(SuburbsDistributions["all"]["inventoryfemale"].items, "Base.BoxingGloveBlue3");
	table.insert(SuburbsDistributions["all"]["inventoryfemale"].items, 0.1);
	
	
	table.insert(SuburbsDistributions["all"]["inventorymale"].items, "Base.Hat_BoxingRed1");
	table.insert(SuburbsDistributions["all"]["inventorymale"].items, 15);
	table.insert(SuburbsDistributions["all"]["inventoryfemale"].items, "Base.Hat_BoxingRed1");
	table.insert(SuburbsDistributions["all"]["inventoryfemale"].items, 15);
	table.insert(SuburbsDistributions["all"]["inventorymale"].items, "Base.Hat_BoxingRed2");
	table.insert(SuburbsDistributions["all"]["inventorymale"].items, 1);
	table.insert(SuburbsDistributions["all"]["inventoryfemale"].items, "Base.Hat_BoxingRed2");
	table.insert(SuburbsDistributions["all"]["inventoryfemale"].items, 1);
	table.insert(SuburbsDistributions["all"]["inventorymale"].items, "Base.Hat_BoxingRed3");
	table.insert(SuburbsDistributions["all"]["inventorymale"].items, 0.1);
	table.insert(SuburbsDistributions["all"]["inventoryfemale"].items, "Base.Hat_BoxingRed3");
	table.insert(SuburbsDistributions["all"]["inventoryfemale"].items, 0.1);
	
	table.insert(SuburbsDistributions["all"]["inventorymale"].items, "Base.Hat_BoxingBlue1");
	table.insert(SuburbsDistributions["all"]["inventorymale"].items, 15);
	table.insert(SuburbsDistributions["all"]["inventoryfemale"].items, "Base.Hat_BoxingBlue1");
	table.insert(SuburbsDistributions["all"]["inventoryfemale"].items, 15);
	table.insert(SuburbsDistributions["all"]["inventorymale"].items, "Base.Hat_BoxingBlue2");
	table.insert(SuburbsDistributions["all"]["inventorymale"].items, 1);
	table.insert(SuburbsDistributions["all"]["inventoryfemale"].items, "Base.Hat_BoxingBlue2");
	table.insert(SuburbsDistributions["all"]["inventoryfemale"].items, 1);
	table.insert(SuburbsDistributions["all"]["inventorymale"].items, "Base.Hat_BoxingBlue3");
	table.insert(SuburbsDistributions["all"]["inventorymale"].items, 0.1);
	table.insert(SuburbsDistributions["all"]["inventoryfemale"].items, "Base.Hat_BoxingBlue3");
	table.insert(SuburbsDistributions["all"]["inventoryfemale"].items, 0.1);
	
	
	table.insert(SuburbsDistributions["all"]["inventorymale"].items, "Base.Shorts_BoxingRedCold");
	table.insert(SuburbsDistributions["all"]["inventorymale"].items, 15);
	table.insert(SuburbsDistributions["all"]["inventoryfemale"].items, "Base.Shorts_BoxingRedCold");
	table.insert(SuburbsDistributions["all"]["inventoryfemale"].items, 0.1);
	table.insert(SuburbsDistributions["all"]["inventorymale"].items, "Base.Shorts_BoxingBlueCold");
	table.insert(SuburbsDistributions["all"]["inventorymale"].items, 0.1);
	table.insert(SuburbsDistributions["all"]["inventoryfemale"].items, "Base.Shorts_BoxingBlueCold");
	table.insert(SuburbsDistributions["all"]["inventoryfemale"].items, 15);
	
	table.insert(SuburbsDistributions["all"]["inventorymale"].items, "Base.Shorts_BoxingRedWarm");
	table.insert(SuburbsDistributions["all"]["inventorymale"].items, 2);
	table.insert(SuburbsDistributions["all"]["inventoryfemale"].items, "Base.Shorts_BoxingRedWarm");
	table.insert(SuburbsDistributions["all"]["inventoryfemale"].items, 0.2);
	table.insert(SuburbsDistributions["all"]["inventorymale"].items, "Base.Shorts_BoxingBlueWarm");
	table.insert(SuburbsDistributions["all"]["inventorymale"].items, 0.2);
	table.insert(SuburbsDistributions["all"]["inventoryfemale"].items, "Base.Shorts_BoxingBlueWarm");
	table.insert(SuburbsDistributions["all"]["inventoryfemale"].items, 2);

function ManageGlovesRed1()
	local player = getPlayer()
	local inv = player:getInventory()
	local weap = inv:FindAndReturn("Base.BoxingGloveRed1")
	if not weap then
		return
	end
	local gloves = inv:FindAndReturn("Base.Gloves_BoxingRed")
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

function ManageGlovesRed2()
	local player = getPlayer()
	local inv = player:getInventory()
	local weap = inv:FindAndReturn("Base.BoxingGloveRed2")
	if not weap then
		return
	end
	local gloves = inv:FindAndReturn("Base.Gloves_BoxingRed")
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
	if not weap then
		return
	end
	local gloves = inv:FindAndReturn("Base.Gloves_BoxingRed")
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
	if not weap then
		return
	end
	local gloves = inv:FindAndReturn("Base.Gloves_BoxingBlue")
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
	if not weap then
		return
	end
	local gloves = inv:FindAndReturn("Base.Gloves_BoxingBlue")
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
	if not weap then
		return
	end
	local gloves = inv:FindAndReturn("Base.Gloves_BoxingBlue")
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
