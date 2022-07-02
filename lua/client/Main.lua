function BoxingGloveMod:InitOptions()
    local Settings = BoxingGloveMod.Settings;

    -- load settings
    Settings:Deserialize();

    -- add our settings tab
    MainOptions.instance:addPage(BoxingGloveMod.NAME .. " Mod");
    MainOptions.instance.addY = 0;

    -- build UI for settings...hack hack hack
    local splitpoint = MainOptions.instance:getWidth() / 3;
    local comboWidth = MainOptions.instance:getWidth()-splitpoint - 100;
    local comboWidth = 300;
    local delta = 20;
    local padding = 6;
    local ypos = delta;
    local scrollHeight = ypos;
    local function addScrollHeight(amount)
        scrollHeight = scrollHeight + delta + amount + padding;
    end

    -- create dropdowns for weapon
    local weight_options = {"0.05", "0.10", "0.15", "0.20", "0.25", "0.30", "0.35", "0.40", "0.45", "0.50", "0.55", "0.60", "0.65", "0.70", "0.75", "0.80", "0.85", "0.90", "0.95", "1.0", "1.25", "1.50", "1.75", "2.0", "3.0", "4.0", "5.0", "10.0"};
    ypos = ypos + delta;
    local weaponComboBox = MainOptions.instance:addCombo(splitpoint, ypos, comboWidth, 20, getText("UI_Weapon1"), weight_options, 1);
    local weaponComboOption = BoxingGloveMod.GameOption:new('weaponComboBox', weaponComboBox);
    function weaponComboOption.toUI(self)
        self.control:select(weight);
    end
    function weaponComboOption.apply(self)
        local value = self.control.options[self.control.selected];

        -- serialize category option
        Settings:Set("WEAPON1_WEIGHT", value);
        Settings:Serialize();
    end
    MainOptions.instance.gameOptions:add(weaponComboOption);
    addScrollHeight(weaponComboBox:getHeight());

    -- set our panel scroll height
    MainOptions.instance.mainPanel:setScrollHeight(scrollHeight + delta);

    -- reset this to be nice, its state seems to apply to every tab created
    MainOptions.instance.addY = 0;
end


-- Register events we need
Events.OnMainMenuEnter.Add(BoxingGloveMod.InitOptions);                             -- init menu options (main menu)
Events.OnGameStart.Add(BoxingGloveMod.InitOptions);                                 -- init menu options (add to game options menu)
