require "Items/SuburbsDistributions"
require "Items/ProceduralDistributions"
require "Items/VehicleDistributions"
require "Items/ItemPicker"	

local dropRate
local dropRate2
local dropRate3
local file = getFileReader(BoxingGloveMod.INI, false);
if file then
	while true do
		local line = file:readLine();
		if line == nil then
			break;
		end
		local tuple = {};
		for match in (line.."="):gmatch("(.-)=") do
			table.insert(tuple, match);
		end
		if tuple[1] == "WEAPON1_DROPRATE" then
			dropRate = tonumber(tuple[2]) / 2
		elseif tuple[1] == "WEAPON2_DROPRATE" then
			dropRate2 = tonumber(tuple[2]) / 2
		elseif tuple[1] == "WEAPON3_DROPRATE" then
			dropRate3 = tonumber(tuple[2]) / 2
		end
	end
	file:close();
end

if BoxingGloveMod then
	if not dropRate then
		dropRate = BoxingGloveMod.DEFAULT_DROPRATE
	end
	if not dropRate2 then
		dropRate2 = BoxingGloveMod.DEFAULT_DROPRATE2
	end
	if not dropRate3 then
		dropRate3 = BoxingGloveMod.DEFAULT_DROPRATE3
	end
else
	if not dropRate then
		dropRate = 3
	end
	if not dropRate2 then
		dropRate2 = 1
	end
	if not dropRate3 then
		dropRate3 = 0.1
	end
end

--[[
local found = false
for k,v in pairs(SuburbsDistributions["all"]["inventorymale"].items) do
	if found then
		print("found$ it!!!")
		print(SuburbsDistributions["all"]["inventorymale"].items[k])
		break
	end
	if v == "Base.BoxingGloveRed1" then
		found = true
	end
end
if not found then
	print("not found$")
end--]]

	-- zombies
if dropRate and dropRate ~= 0 then
	table.insert(SuburbsDistributions["all"]["inventorymale"].items, "Base.BoxingGloveRed1");
	table.insert(SuburbsDistributions["all"]["inventorymale"].items, dropRate);
	table.insert(SuburbsDistributions["all"]["inventoryfemale"].items, "Base.BoxingGloveRed1");
	table.insert(SuburbsDistributions["all"]["inventoryfemale"].items, dropRate);
	table.insert(SuburbsDistributions["all"]["inventorymale"].items, "Base.BoxingGloveBlue1");
	table.insert(SuburbsDistributions["all"]["inventorymale"].items, dropRate);
	table.insert(SuburbsDistributions["all"]["inventoryfemale"].items, "Base.BoxingGloveBlue1");
	table.insert(SuburbsDistributions["all"]["inventoryfemale"].items, dropRate);
end
if dropRate2 and dropRate2 ~= 0 then
	table.insert(SuburbsDistributions["all"]["inventorymale"].items, "Base.BoxingGloveRed2");
	table.insert(SuburbsDistributions["all"]["inventorymale"].items, dropRate2);
	table.insert(SuburbsDistributions["all"]["inventoryfemale"].items, "Base.BoxingGloveRed2");
	table.insert(SuburbsDistributions["all"]["inventoryfemale"].items, dropRate2);
	table.insert(SuburbsDistributions["all"]["inventorymale"].items, "Base.BoxingGloveBlue2");
	table.insert(SuburbsDistributions["all"]["inventorymale"].items, dropRate2);
	table.insert(SuburbsDistributions["all"]["inventoryfemale"].items, "Base.BoxingGloveBlue2");
	table.insert(SuburbsDistributions["all"]["inventoryfemale"].items, dropRate2);
end
if dropRate3 and dropRate3 ~= 0 then
	table.insert(SuburbsDistributions["all"]["inventorymale"].items, "Base.BoxingGloveRed3");
	table.insert(SuburbsDistributions["all"]["inventorymale"].items, dropRate3);
	table.insert(SuburbsDistributions["all"]["inventoryfemale"].items, "Base.BoxingGloveRed3");
	table.insert(SuburbsDistributions["all"]["inventoryfemale"].items, dropRate3);
	table.insert(SuburbsDistributions["all"]["inventorymale"].items, "Base.BoxingGloveBlue3");
	table.insert(SuburbsDistributions["all"]["inventorymale"].items, dropRate3);
	table.insert(SuburbsDistributions["all"]["inventoryfemale"].items, "Base.BoxingGloveBlue3");
	table.insert(SuburbsDistributions["all"]["inventoryfemale"].items, dropRate3);
end
	
	
table.insert(SuburbsDistributions["all"]["inventorymale"].items, "Base.Hat_BoxingRed1");
table.insert(SuburbsDistributions["all"]["inventorymale"].items, 5);
table.insert(SuburbsDistributions["all"]["inventoryfemale"].items, "Base.Hat_BoxingRed1");
table.insert(SuburbsDistributions["all"]["inventoryfemale"].items, 5);
table.insert(SuburbsDistributions["all"]["inventorymale"].items, "Base.Hat_BoxingRed2");
table.insert(SuburbsDistributions["all"]["inventorymale"].items, 1);
table.insert(SuburbsDistributions["all"]["inventoryfemale"].items, "Base.Hat_BoxingRed2");
table.insert(SuburbsDistributions["all"]["inventoryfemale"].items, 1);
table.insert(SuburbsDistributions["all"]["inventorymale"].items, "Base.Hat_BoxingRed3");
table.insert(SuburbsDistributions["all"]["inventorymale"].items, 0.1);
table.insert(SuburbsDistributions["all"]["inventoryfemale"].items, "Base.Hat_BoxingRed3");
table.insert(SuburbsDistributions["all"]["inventoryfemale"].items, 0.1);

table.insert(SuburbsDistributions["all"]["inventorymale"].items, "Base.Hat_BoxingBlue1");
table.insert(SuburbsDistributions["all"]["inventorymale"].items, 5);
table.insert(SuburbsDistributions["all"]["inventoryfemale"].items, "Base.Hat_BoxingBlue1");
table.insert(SuburbsDistributions["all"]["inventoryfemale"].items, 5);
table.insert(SuburbsDistributions["all"]["inventorymale"].items, "Base.Hat_BoxingBlue2");
table.insert(SuburbsDistributions["all"]["inventorymale"].items, 1);
table.insert(SuburbsDistributions["all"]["inventoryfemale"].items, "Base.Hat_BoxingBlue2");
table.insert(SuburbsDistributions["all"]["inventoryfemale"].items, 1);
table.insert(SuburbsDistributions["all"]["inventorymale"].items, "Base.Hat_BoxingBlue3");
table.insert(SuburbsDistributions["all"]["inventorymale"].items, 0.1);
table.insert(SuburbsDistributions["all"]["inventoryfemale"].items, "Base.Hat_BoxingBlue3");
table.insert(SuburbsDistributions["all"]["inventoryfemale"].items, 0.1);


table.insert(SuburbsDistributions["all"]["inventorymale"].items, "Base.Shorts_BoxingRedCold");
table.insert(SuburbsDistributions["all"]["inventorymale"].items, 5);
table.insert(SuburbsDistributions["all"]["inventoryfemale"].items, "Base.Shorts_BoxingRedCold");
table.insert(SuburbsDistributions["all"]["inventoryfemale"].items, 0.1);
table.insert(SuburbsDistributions["all"]["inventorymale"].items, "Base.Shorts_BoxingBlueCold");
table.insert(SuburbsDistributions["all"]["inventorymale"].items, 0.1);
table.insert(SuburbsDistributions["all"]["inventoryfemale"].items, "Base.Shorts_BoxingBlueCold");
table.insert(SuburbsDistributions["all"]["inventoryfemale"].items, 5);

table.insert(SuburbsDistributions["all"]["inventorymale"].items, "Base.Shorts_BoxingRedWarm");
table.insert(SuburbsDistributions["all"]["inventorymale"].items, 2);
table.insert(SuburbsDistributions["all"]["inventoryfemale"].items, "Base.Shorts_BoxingRedWarm");
table.insert(SuburbsDistributions["all"]["inventoryfemale"].items, 0.2);
table.insert(SuburbsDistributions["all"]["inventorymale"].items, "Base.Shorts_BoxingBlueWarm");
table.insert(SuburbsDistributions["all"]["inventorymale"].items, 0.2);
table.insert(SuburbsDistributions["all"]["inventoryfemale"].items, "Base.Shorts_BoxingBlueWarm");
table.insert(SuburbsDistributions["all"]["inventoryfemale"].items, 2);



local found = false
for k,v in pairs(SuburbsDistributions["all"]["inventorymale"].items) do
	if found then
		print("found$2 it!!!")
		print(SuburbsDistributions["all"]["inventorymale"].items[k])
		break
	end
	if v == "Base.BoxingGloveRed1" then
		found = true
	end
end
if not found then
	print("not found$2")
end