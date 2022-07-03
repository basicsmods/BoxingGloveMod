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

    -- message drop down
    local msgs = {"Thanks :)"};
    ypos = ypos + delta;
    local msgComboBox = MainOptions.instance:addCombo(splitpoint, ypos, comboWidth, 20, getText("Lua will reload when you hit Apply (may freeze temporarily)."), msgs, 1);
    local msgComboOption = BoxingGloveMod.GameOption:new('ReloadPls', msgComboBox);
    MainOptions.instance.gameOptions:add(msgComboOption);
    addScrollHeight(msgComboBox:getHeight());
    ypos = ypos + delta;
    local msgComboBox2 = MainOptions.instance:addCombo(splitpoint, ypos, comboWidth, 20, getText("Only server host's settings apply."), msgs, 1);
    local msgComboOption2 = BoxingGloveMod.GameOption:new('ReloadPls', msgComboBox2);
    MainOptions.instance.gameOptions:add(msgComboOption2);
    addScrollHeight(msgComboBox2:getHeight());

    -- create dropdowns for droprates
    local droprates = {"0","0.01","0.05","0.1","0.2","0.3","0.4","0.5","0.75","1","1.25","1.5","2","2.5","3","3.5","4","5","7.5","10","15","20","25","50","150"};
    ypos = ypos + delta;
    local dropRateComboBox = MainOptions.instance:addCombo(splitpoint, ypos, comboWidth, 20, getText("UI_Droprate"), droprates, 1);
    local dropRateComboOption = BoxingGloveMod.GameOption:new('dropRateComboBox', dropRateComboBox);
    function dropRateComboOption.toUI(self)
        self.control:select(BoxingGloveMod.Settings:Get("WEAPON1_DROPRATE"));
    end
    function dropRateComboOption.apply(self)
        local value = self.control.options[self.control.selected];

        -- serialize category option
        Settings:Set("WEAPON1_DROPRATE", value);
        Settings:Serialize();
    end
    MainOptions.instance.gameOptions:add(dropRateComboOption);
    addScrollHeight(dropRateComboBox:getHeight());

    ypos = ypos + delta;
    local dropRateComboBox2 = MainOptions.instance:addCombo(splitpoint, ypos, comboWidth, 20, getText("UI_Droprate2"), droprates, 1);
    local dropRateComboOption2 = BoxingGloveMod.GameOption:new('dropRateComboBox2', dropRateComboBox2);
    function dropRateComboOption2.toUI(self)
        self.control:select(BoxingGloveMod.Settings:Get("WEAPON2_DROPRATE"));
    end
    function dropRateComboOption2.apply(self)
        local value = self.control.options[self.control.selected];

        -- serialize category option
        Settings:Set("WEAPON2_DROPRATE", value);
        Settings:Serialize();
    end
    MainOptions.instance.gameOptions:add(dropRateComboOption2);
    addScrollHeight(dropRateComboBox2:getHeight());

    ypos = ypos + delta;
    local dropRateComboBox3 = MainOptions.instance:addCombo(splitpoint, ypos, comboWidth, 20, getText("UI_Droprate3"), droprates, 1);
    local dropRateComboOption3 = BoxingGloveMod.GameOption:new('dropRateComboBox3', dropRateComboBox3);
    function dropRateComboOption3.toUI(self)
        self.control:select(BoxingGloveMod.Settings:Get("WEAPON3_DROPRATE"));
    end
    function dropRateComboOption3.apply(self)
        local value = self.control.options[self.control.selected];

        -- serialize category option
        Settings:Set("WEAPON3_DROPRATE", value);
        Settings:Serialize();
        if not MainScreen.instance.inGame then
            getCore():ResetLua(true, "modsChanged")
        end
    end
    MainOptions.instance.gameOptions:add(dropRateComboOption3);
    addScrollHeight(dropRateComboBox3:getHeight());

    -- set our panel scroll height
    MainOptions.instance.mainPanel:setScrollHeight(scrollHeight + delta);

    -- reset this to be nice, its state seems to apply to every tab created
    MainOptions.instance.addY = 0;
end


-- Register events we need
Events.OnMainMenuEnter.Add(BoxingGloveMod.InitOptions);                             -- init menu options (main menu)
Events.OnGameStart.Add(BoxingGloveMod.InitOptions);                                 -- init menu options (add to game options menu)
