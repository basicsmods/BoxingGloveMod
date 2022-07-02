require("BoxingGloveMod/Constants");

BoxingGloveMod.Settings = BoxingGloveMod.Settings or {};
local defaultSettings = {
    WEAPON1_WEIGHT = 0.5,
};

---
--
function BoxingGloveMod.Settings:Get(settingKey)
    return defaultSettings[settingKey];
end

---
--
function BoxingGloveMod.Settings:GetBool(settingKey)
    local result = self:Get(settingKey);
    if not result or result == "false" or result == 0 then
        return false;
    end
    return true;
end

---
--
function BoxingGloveMod.Settings:Set(settingKey, value)
    defaultSettings[settingKey] = value;
end

---
--
function BoxingGloveMod.Settings:Deserialize()
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
            BoxingGloveMod.Settings:Set(tuple[1], tuple[2]);
        end
        file:close();
    end
end

---
--
function BoxingGloveMod.Settings:Serialize()
    local file = getFileWriter(BoxingGloveMod.INI, true, false);
    for k,v in pairs(defaultSettings) do
        file:write(k .. "=" .. tostring(v) .. "\n");
    end
    file:close();
end
