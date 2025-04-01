print('[Red.Leaf] Waiting for game to load...')
if not game:IsLoaded() then 
    game.Loaded:Wait()
end
print('[Red.Leaf] Loading...')
local TimeToLoad = tick()

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xataxell/library/main/Linoria.lua"))()
local ThemeManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/xataxell/library/main/themes.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/xataxell/library/main/saving.lua"))()
local Window = Library:CreateWindow({Title = 'Red.Leaf for Typical Colors 2', Center = true, AutoShow = true})
Library:SetWatermark('Red.Leaf')

local Aim = Window:AddTab('Aim')
local Aimbot = Aim:AddLeftGroupbox('Aimbot')
local HitboxExpander = Aim:AddRightGroupbox('Hitbox Expander')
Aimbot:AddToggle('AimbotToggle', { Text = 'Aimbot', Default = false, Tooltip = 'Moves your view to the closest player'}):AddKeyPicker('AimbotBind', { Default = 'None', NoUI = false, Mode = 'Hold', Text = 'Aimkey' })
Aimbot:AddToggle('VisibleCheck', { Text = 'Visible Check', Default = false, Tooltip = 'Checks if the target is visible'})
Aimbot:AddToggle('VisualizeFOVCircle', { Text = 'Visualize Aimbot FOV', Default = false, Tooltip = 'Makes the FOV circle for the aimbot visible'})
Aimbot:AddDropdown("AimPart", {Values = {'Head', 'UpperTorso', 'LowerTorso'}, Default = 2, Multi = false, Text = "Aim part"})
Aimbot:AddSlider('AimbotFOV', {Text = 'FOV', Default = 25, Min = 0, Max = 180, Rounding = 0, Compact = true})
Aimbot:AddSlider('Smoothing', {Text = 'Smoothing', Default = 20, Min = 1, Max = 100, Rounding = 0, Suffix = '%', Compact = true})
HitboxExpander:AddToggle('HeadHitboxExpand', { Text = 'Head Expand', Default = false, Tooltip = "Changes the size of every player's head hitbox"})
HitboxExpander:AddToggle('HeadHitboxTeamCheck', { Text = 'Team Check', Default = false, Tooltip = "Only expands the head hitbox for the enemy"})
HitboxExpander:AddToggle('HeadHitboxVisualize', { Text = 'Visualize Head Hitbox', Default = false, Tooltip = "Visualizes the head hitbox"}):AddColorPicker('HeadHitboxColor', {Default = Color3.fromRGB(224, 64, 62)})
HitboxExpander:AddSlider('HeadSize', {Text = 'Head Size', Default = 5, Min = 1, Max = 75, Rounding = 1, Suffix = ' studs', Compact = false})
HitboxExpander:AddSlider('HeadHitboxTransparency', {Text = 'Head Hitbox Transparency', Default = .75, Min = 0, Max = 1, Rounding = 2, Suffix = '', Compact = false})
HitboxExpander:AddDivider()
HitboxExpander:AddToggle('HitboxExpand', { Text = 'Hitbox Expand', Default = false, Tooltip = "Changes the size of every player's hitbox"})
HitboxExpander:AddToggle('HitboxTeamCheck', { Text = 'Team Check', Default = false, Tooltip = "Only expands the hitbox for the enemy"})
HitboxExpander:AddToggle('HitboxVisualize', { Text = 'Visualize Hitbox', Default = false, Tooltip = "Visualizes the head hitbox"}):AddColorPicker('HitboxColor', {Default = Color3.fromRGB(232, 200, 114)})
HitboxExpander:AddSlider('HitboxSize', {Text = 'Hitbox Size', Default = 5, Min = 1, Max = 75, Rounding = 1, Suffix = ' studs', Compact = false})
HitboxExpander:AddSlider('HitboxTransparency', {Text = 'Hitbox Transparency', Default = .75, Min = 0, Max = 1, Rounding = 2, Suffix = '', Compact = false})

local Visuals = Window:AddTab('Visuals')
local ESP = Visuals:AddLeftGroupbox('ESP')
local Viewmodel = Visuals:AddLeftGroupbox('Viewmodel')
local MiscVisuals = Visuals:AddRightTabbox()
local View = MiscVisuals:AddTab('View/Hud')
local Lighting = MiscVisuals:AddTab('Lighting')
ESP:AddToggle('BoundingBox', { Text = 'Box', Default = false, Tooltip = 'Toggles the bounding box visual option'}):AddColorPicker('BoundingBoxDefaultColor', {Default = Color3.fromRGB(255, 255, 255), Transparency = nil, Title = 'Box Color'})
ESP:AddToggle('BoxTeamCheck', { Text = 'Team Check', Default = false, Tooltip = 'Toggles the team check, box colors are set to selected colors for teams'}):AddColorPicker('BoundingBoxColor', {Default = Color3.fromRGB(224, 64, 62), Transparency = nil, Title = 'Enemy Box Color'}):AddColorPicker('FriendlyBoundingBoxColor', {Default = Color3.fromRGB(74, 172, 40), Transparency = nil, Title = 'Friendly Box Color'})
ESP:AddSlider('BoxFillTransparency', {Text = '', Default = 0.2, Min = 0, Max = 1, Rounding = 2, Compact = true})
ESP:AddDivider()
ESP:AddToggle('Chams', { Text = 'Chams', Default = false, Tooltip = 'Toggles player highlights / chams'}):AddColorPicker('ChamsFillColor', {Default = Color3.fromRGB(176, 141, 247), Title = 'Fill Color'}):AddColorPicker('ChamsOutlineColor', {Default = Color3.fromRGB(132, 84, 229), Title = 'Outline Color'})
ESP:AddToggle('ChamsTeamCheck', { Text = 'Team Check', Default = false, Tooltip = 'Toggles the team check, chams colors are set to selected colors for teams'}):AddColorPicker('EnemyChamsColor', {Default = Color3.fromRGB(224, 64, 62), Transparency = nil, Title = 'Enemy Chams Color'}):AddColorPicker('FriendlyChamsColor', {Default = Color3.fromRGB(74, 172, 40), Transparency = nil, Title = 'Friendly Chams Color'})
ESP:AddToggle('ChamsDepthMode', { Text = 'Always on top', Default = true, Tooltip = 'Toggles depth mode between always on top or occluded'})
ESP:AddSlider('ChamsFillTransparency', {Text = '', Default = 0.2, Min = 0, Max = 1, Rounding = 2, Compact = true})
ESP:AddSlider('ChamsOutlineTransparency', {Text = '', Default = 0, Min = 0, Max = 1, Rounding = 2, Compact = true})
ESP:AddDivider()
ESP:AddToggle('HealthBar', { Text = 'Health Bar', Default = false, Tooltip = 'Toggles the health bar visual option'}):AddColorPicker('HealthBarColor', {Default = Color3.fromRGB(255, 255, 255)})
ESP:AddToggle('Names', { Text = 'Name', Default = false, Tooltip = 'Toggles the name text visual option'})
ESP:AddToggle('Class', { Text = 'Class', Default = false, Tooltip = 'Toggles the class text visual option'})
ESP:AddToggle('Weapon', { Text = 'Weapon', Default = false, Tooltip = 'Toggles the weapon text visual option'})
ESP:AddToggle('Distance', { Text = 'Distance', Default = false, Tooltip = 'Toggles the distance text visual option'})
ESP:AddDivider()
ESP:AddDropdown("EspFont", {Values = {'UI', 'System', 'Plex', 'Monospace'}, Default = 4, Multi = false, Text = "Font"})
ESP:AddDropdown("Ignore", {Values = {'Friendly', 'Enemy'}, Default = 0, Multi = true, Text = "Ignore"})
View:AddToggle('customfov', { Text = 'FOV Modifications', Default = false, Tooltip = 'Toggles FOV Modifications'})
View:AddSlider('customfovamount', { Text = 'FOV', Default = 90, Min = 0, Max = 120, Rounding = 0, Suffix = '°/120', Compact = true})
View:AddDivider()
View:AddToggle('thirdperson', { Text = 'Third Person', Default = false, Tooltip = 'Puts you into third person'}):AddKeyPicker('thirdpersonbind', { Default = 'V', NoUI = false, Mode = 'Toggle', Text = 'Third Person' })
View:AddSlider('thirdpersonoffset', {Text = 'Up Offset', Default = 110, Min = 10, Max = 250, Rounding = 0, Suffix = '', Compact = true})
View:AddToggle('NoScope', { Text = 'No Sniper Scope', Default = false, Tooltip = 'Hides the sniper scope'})
Lighting:AddDropdown("LightingTechnology", {Values = {'Voxel', 'ShadowMap', 'Legacy', 'Future', 'Compatibility'}, Default = 1, Multi = false, Text = "Lighting Technology"})
Viewmodel:AddToggle('ViewmodelOffset', { Text = 'Offset', Default = false, Tooltip = 'Sets a custom viewmodel offset'})
Viewmodel:AddSlider('ViewmodelOffsetX', {Text = 'X', Default = 0, Min = -5, Max = 5, Rounding = 1, Suffix = '', Compact = true})
Viewmodel:AddSlider('ViewmodelOffsetY', {Text = 'Y', Default = 0, Min = -5, Max = 5, Rounding = 1, Suffix = '', Compact = true})
Viewmodel:AddSlider('ViewmodelOffsetZ', {Text = 'Z', Default = 0, Min = -5, Max = 5, Rounding = 1, Suffix = '', Compact = true})

local Automation = Window:AddTab('Automation')
local Pyro = Automation:AddLeftGroupbox('Arsonist')
local Annihilator = Automation:AddRightGroupbox('Annihilator')
local Healbot = Automation:AddRightGroupbox('Healbot')
Pyro:AddToggle('autoairblast', { Text = 'Auto Airblast', Default = false, Tooltip = 'Airblasts as soon as a projectile gets too close to you'})
Pyro:AddDropdown("projectilestoairblast", {Values = {'Rockets', 'Grenades', 'Baubles', 'Baseballs', 'Flares'}, Default = 1, Multi = true, Text = "Projectiles"})
Healbot:AddToggle('healwhenlow', { Text = 'Heal self when health below:', Default = false, Tooltip = 'Heals you when your health is below the desired threshold'})
Healbot:AddSlider('healthamount', {Text = 'Health', Default = 75, Min = 10, Max = 225, Rounding = 0, Suffix = '', Compact = true})
Healbot:AddToggle('healaura', { Text = 'Heal Aura', Default = false, Tooltip = 'Heals teammates around you'})
Healbot:AddToggle('healaurafriendsonly', { Text = 'Friends only', Default = false, Tooltip = 'Only heals friends around you'})
Annihilator:AddToggle('autodetonate', { Text = 'Auto Detonate', Default = false, Tooltip = 'Detonates the stickybomb that is in the blast radius of an enemy player'})
Annihilator:AddDropdown("autodetonatemode", {Values = {'Legit', 'Rage'}, Default = 1, Multi = false, Text = "Mode"})
Annihilator:AddSlider('autodetonaterageradiusoverride', {Text = 'Rage Radius Override', Default = 100, Min = 100, Max = 200, Rounding = 0, Suffix = '%', Compact = false})

local SkinChanger = Window:AddTab('Skin Changer')
local WeaponSelection = SkinChanger:AddLeftGroupbox('Weapon Selection')
local SkinSelection = SkinChanger:AddRightGroupbox('Skin Selection')
WeaponSelection:AddDropdown("PrimarySelection", {Values = {'Lupara DB', 'Revolver'}, Default = 0, Multi = false, Text = "Primary"})
SkinSelection:AddDropdown("SkinSelectionPrimary", {Values = {'none'}, Default = 1, Multi = false, Text = "Primary Skin"})

local Misc = Window:AddTab('Misc')
local MiscMain = Misc:AddLeftTabbox()
local Movement = MiscMain:AddTab('Movement')
local Chat = MiscMain:AddTab('Chat')
local Exploits = Misc:AddRightGroupbox('Exploits')
local SpawnSentry = false
local SpawnDispenser = false
local SpawnEntrance = false
local SpawnExit = false
Movement:AddToggle('bunnyhop', { Text = 'Bunnyhop', Default = false, Tooltip = 'Lets you hold space to automatically jump and uncaps your speed'})
Movement:AddToggle('walkspeedmod', { Text = 'Speed Mod', Default = false, Tooltip = 'Changes your speed'}):AddKeyPicker('walkspeedmodbind', { Default = 'LeftShift', NoUI = false, Mode = 'Hold', Text = 'Speed Mod' })
Movement:AddDivider()
Movement:AddToggle('bunnyhopcustomspeed', { Text = 'Bunnyhop Custom Speed', Default = false, Tooltip = 'Sets a custom speed for your directional autostrafe'})
Movement:AddToggle('directionalacceleration', { Text = 'Directional Acceleration', Default = false, Tooltip = 'Makes you accelerate when using directional autostrafe'})
Movement:AddDropdown("bunnyhopautostrafe", {Values = {'None', 'Directional'}, Default = 1, Multi = false, Text = 'Auto-Strafe'})
Movement:AddSlider('bunnyhopspeed', { Text = 'Bunnyhop Speed', Default = 20, Min = 0, Max = 100, Rounding = 0, Suffix = ' studs/s', Compact = false})
Movement:AddSlider('directionalaccelerationcap', { Text = 'Directional Acceleration Cap', Default = 2.5, Min = 1, Max = 10, Rounding = 1, Suffix = 'x', Compact = false})
Movement:AddSlider('walkspeed', { Text = 'Walkspeed', Default = 20, Min = 0, Max = 200, Rounding = 0, Suffix = ' studs/s', Compact = false})
Exploits:AddToggle('infiniteammo', { Text = 'Infinite Ammo', Default = false, Tooltip = 'Gives you infinite ammo (wow)'})
Exploits:AddToggle('freebuildings', { Text = 'Free buildings', Default = false, Tooltip = 'Changes the metal cost of all buildings to 0'})
Exploits:AddToggle('instantrespawn', { Text = 'Instant Respawn', Default = false, Tooltip = 'Makes you respawn as soon as you die'})
Exploits:AddToggle('setspread', { Text = 'Set spread', Default = false, Tooltip = 'Sets your spread to desired amount'})
Exploits:AddSlider('spreadamount', { Text = 'Spread', Default = 10, Min = 0, Max = 100, Rounding = 0, Compact = true})
Exploits:AddButton('Spawn Sentry [ Engineer ]', function() SpawnSentry = true end)
Exploits:AddButton('Spawn Dispenser [ Engineer ]', function() SpawnDispenser = true end)
Exploits:AddButton('Spawn Tele Entrance [ Engineer ]', function() SpawnEntrance = true end)
Exploits:AddButton('Spawn Tele Exit [ Engineer ]', function() SpawnExit = true end)
Exploits:AddSlider('SentryLevel', { Text = 'Level', Default = 3, Min = 1, Max = 3, Rounding = 0, Suffix = '', Compact = false})

local Settings = Window:AddTab('Settings')
local MenuSettings = Settings:AddLeftGroupbox('Main')
local Config = Settings:AddRightGroupbox('Config')
local Theme = Settings:AddRightGroupbox('Theme')
MenuSettings:AddLabel('Open / Close'):AddKeyPicker('MenuKeybind', { Default = 'RightShift', NoUI = true, Text = 'Menu keybind' })
MenuSettings:AddToggle('DisableMovement', { Text = 'Disable Movement If Open', Default = false, Tooltip = 'Disables movement when the menu is open'})
MenuSettings:AddButton('Join Discord', function() 
    local res = game:GetService("HttpService"):RequestAsync({
        Url = 'http://127.0.0.1:6463/rpc?v=1',
        Method = 'POST',
        Headers = {
            ['Content-Type'] = 'application/json',
            Origin = 'https://discord.com'
        },
        Body = game:GetService('HttpService'):JSONEncode({
            cmd = 'INVITE_BROWSER',
            nonce = game:GetService('HttpService'):GenerateGUID(false),
            args = {code = 'nxnvTcTaXx'}
        })
    })
end)
MenuSettings:AddButton('Copy Discord', function() setclipboard('https://discord.gg/nxnvTcTaXx') end)
MenuSettings:AddButton('Copy Game Invite', function() setclipboard(([[Roblox.GameLauncher.joinGameInstance(%s, "%s"))]]):format(game.PlaceId, game.JobId)) end)
MenuSettings:AddButton('Rejoin', function() game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId, game:GetService('Players').LocalPlayer) end)
MenuSettings:AddButton('Unload', function() Library:Unload(); cleardrawcache() end)
MenuSettings:AddDivider()
MenuSettings:AddToggle('NoKeybinds', { Text = 'Keybind Indicator', Default = false, Tooltip = 'Toggles the visibility of the keybind indicator'}):OnChanged(function()
    Library.KeybindFrame.Visible = Toggles.NoKeybinds.Value;
end)
MenuSettings:AddSlider('KeybindPositionX', {Text = 'Position X', Default = .5, Min = 0, Max = 100, Rounding = 1, Suffix = '%', Compact = false})
MenuSettings:AddSlider('KeybindPositionY', {Text = 'Position Y', Default = 50, Min = 0, Max = 100, Rounding = 1, Suffix = '%', Compact = false})
MenuSettings:AddDivider()
MenuSettings:AddToggle('NoWatermark', { Text = 'Watermark', Default = false, Tooltip = 'Toggles the visibility of the watermark'})
MenuSettings:AddSlider('WatermarkPositionX', {Text = 'Position X', Default = 1.7, Min = 0, Max = 100, Rounding = 1, Suffix = '%', Compact = false})
MenuSettings:AddSlider('WatermarkPositionY', {Text = 'Position Y', Default = 4.3, Min = 0, Max = 100, Rounding = 1, Suffix = '%', Compact = false})
MenuSettings:AddDropdown('WatermarkSettings', {Values = { 'Display Name', 'Config Name', 'Time', 'Date', 'Framerate', 'Latency' }, Default = {'Time', 'Date', 'Framerate', 'Latency'}, Multi = true, Text = 'Watermark Settings', Tooltip = 'What to show in the watermark'})
MenuSettings:AddDropdown('WatermarkColorSettings', {Values = { 'Cheat Name', 'Display Name', 'Config Name', 'Time', 'Date', 'Framerate', 'Latency' }, Default = {'Cheat Name'}, Multi = true, Text = 'Watermark Color Settings', Tooltip = 'What parts to change the color of to library accentcolor in the watermark'})

Config:AddInput('SaveManager_ConfigName',    { Text = 'Config Name' })
Config:AddDropdown('SaveManager_ConfigList', { Text = 'Config', Values = SaveManager:RefreshConfigList(), AllowNull = true })
Options.SaveManager_ConfigList:SetValues(SaveManager:RefreshConfigList()); Options.SaveManager_ConfigList:SetValue(nil)
Config:AddButton('Load', function()
    local name = Options.SaveManager_ConfigList.Value

    local success, err = SaveManager:Load(name)
    if not success then
        return Library:Notify('Failed to load config: ' .. err)
    end

    Library:Notify(string.format('Successfully loaded config: %s', name))
    ConfigName = name
end):AddButton('Save', function()
    local name = Options.SaveManager_ConfigList.Value

    local success, err = SaveManager:Save(name)
    if not success then
        return Library:Notify('Failed to save config: ' .. err)
    end

    Library:Notify(string.format('Successfully saved config: %s', name))
end)
Config:AddButton('Create', function()
    local name = Options.SaveManager_ConfigName.Value

    if name:gsub(' ', '') == '' then 
        return Library:Notify('Invalid config name (empty)', 2)
    end

    local success, err = SaveManager:Save(name)
    if not success then
        return Library:Notify('Failed to create config: ' .. err)
    end

    Library:Notify(string.format('Successfully created config: %s', name))

    Options.SaveManager_ConfigList:SetValues(SaveManager:RefreshConfigList())
    Options.SaveManager_ConfigList:SetValue(nil)
end):AddButton('Delete', function()
    local name = Options.SaveManager_ConfigList.Value

    local success, err = SaveManager:Delete(name)
    if not success then
        return Library:Notify('Failed to delete config: ' .. err)
    end

    Library:Notify(string.format('Successfully deleted config: %s', name))

    Options.SaveManager_ConfigList:SetValues(SaveManager:RefreshConfigList())
    Options.SaveManager_ConfigList:SetValue(nil)
end)

local function UpdateTheme(BackgroundColor, MainColor, AccentColor, OutlineColor, FontColor)
    Library.BackgroundColor = BackgroundColor or Library.BackgroundColor;
    Library.MainColor = MainColor or Library.MainColor;
    Library.AccentColor = AccentColor or Library.AccentColor;
    Library.AccentColorDark = Library:GetDarkerColor(AccentColor) or Library.AccentColor;
    Library.OutlineColor = OutlineColor or Library.OutlineColor;
    Library.FontColor = FontColor or Library.FontColor;

    Library:UpdateColorsUsingRegistry();
end;

local function SetDefault()       
    UpdateTheme(Color3.fromRGB(17, 17, 17), Color3.fromRGB(32, 32, 32), Color3.fromRGB(164, 158, 224), Color3.fromRGB(49, 49, 49), Color3.fromRGB(195, 195, 195))
end;

Theme:AddLabel('Accent'):AddColorPicker('AccentColor', { Default = Color3.fromRGB(164, 158, 227) });
Theme:AddDropdown("Themes", {Text = 'Presets', Default = 1, Values = { 'Default', 'Nekocheat', 'Nekocheat Blue', 'Nekocheat Orange', 'secretservice.club', 'Fatality', 'Skeet', 'Twitch', 'BLM' }})
Options.Themes:OnChanged(function()
    if Options.Themes.Value == "Default" then
        SetDefault();
    elseif Options.Themes.Value == "Nekocheat" then
        UpdateTheme(Color3.fromRGB(23, 23, 23), Color3.fromRGB(19, 19, 18), Color3.fromRGB(207, 31, 104), Color3.fromRGB(41, 41, 41), Color3.fromRGB(191, 191, 191))
    elseif Options.Themes.Value == "Nekocheat Blue" then
        UpdateTheme(Color3.fromRGB(23, 23, 23), Color3.fromRGB(19, 19, 18), Color3.fromRGB(0, 202, 209), Color3.fromRGB(41, 41, 41), Color3.fromRGB(191, 191, 191))
    elseif Options.Themes.Value == "Nekocheat Orange" then
        UpdateTheme(Color3.fromRGB(23, 23, 23), Color3.fromRGB(19, 19, 18), Color3.fromRGB(255, 99, 0), Color3.fromRGB(41, 41, 41), Color3.fromRGB(191, 191, 191))
    elseif Options.Themes.Value == "secretservice.club" then
        UpdateTheme(Color3.fromRGB(27, 27, 27), Color3.fromRGB(17, 17, 17), Color3.fromRGB(172, 156, 159), Color3.fromRGB(41, 41, 41), Color3.fromRGB(255, 255, 255))
    elseif Options.Themes.Value == "Fatality" then
        UpdateTheme(Color3.fromRGB(27, 20, 52), Color3.fromRGB(31, 26, 67), Color3.fromRGB(218, 5, 88), Color3.fromRGB(55, 48, 87), Color3.fromRGB(255, 255, 255))
    elseif Options.Themes.Value == "Skeet" then
        UpdateTheme(Color3.fromRGB(16, 16, 16), Color3.fromRGB(16, 16, 16), Color3.fromRGB(113, 143, 18), Color3.fromRGB(36, 36, 36), Color3.fromRGB(200, 200, 200))
    elseif Options.Themes.Value == "Twitch" then
        UpdateTheme(Color3.fromRGB(16, 16, 16), Color3.fromRGB(28, 31, 32), Color3.fromRGB(129, 85, 188), Color3.fromRGB(41, 41, 41), Color3.fromRGB(200, 200, 200))
    elseif Options.Themes.Value == "BLM" then
        UpdateTheme(Color3.fromRGB(0, 0, 0), Color3.fromRGB(0, 0, 0), Color3.fromRGB(0, 0, 0), Color3.fromRGB(0, 0, 0), Color3.fromRGB(255, 255, 255))
    end
end)
Options.AccentColor:OnChanged(function()
    UpdateTheme(nil, nil, Options.AccentColor.Value)
end);

Library.ToggleKeybind = Options.MenuKeybind; ThemeManager:SetLibrary(Library); SaveManager:SetLibrary(Library); SaveManager:IgnoreThemeSettings(); SaveManager:SetIgnoreIndexes({ 'MenuKeybind' }); ThemeManager:SetFolder('RedLeaf/tc2'); SaveManager:SetFolder('RedLeaf/tc2')
if game:GetService('Players').LocalPlayer and game:GetService('Players').LocalPlayer.DisplayName then
    Library:Notify('Welcome to Red.Leaf, ' .. game:GetService('Players').LocalPlayer.DisplayName .. '!', 7)
else
    Library:Notify("Red.Leaf has been initialized in " .. tostring(string.format('%.2f', tick() - TimeToLoad)) .. 's', 7)
end

game:GetService("RunService").RenderStepped:Connect(function() if Library.Unloaded then return end if Toggles.customfov.Value then game:GetService('Workspace').CurrentCamera.FieldOfView = Options.customfovamount.Value end; if Toggles.NoWatermark.Value then Library:SetWatermarkVisibility(Toggles.NoWatermark.Value) else Library:SetWatermarkVisibility(false) end; if Toggles.DisableMovement.Value and Library.Toggled then game:GetService('ContextActionService'):BindAction('FreezeMovement', function() return Enum.ContextActionResult.Sink end, false, unpack(Enum.PlayerActions:GetEnumItems())); else game:GetService('ContextActionService'):UnbindAction('FreezeMovement'); end end)

spawn(function()
    game:GetService("RunService").RenderStepped:Connect(function(frametime)
        local stringorder = "Red.Leaf"
        if Options.WatermarkSettings.Value["Display Name"] == true then
            stringorder = stringorder .. " | " .. 'User: ' .. tostring(game:GetService('Players').LocalPlayer.DisplayName)
        end
        if Options.WatermarkSettings.Value["Config Name"] == true then
            if stringorder ~= "Red.Leaf" then
                stringorder = stringorder
            end
            stringorder = stringorder .. " | " .. tostring(ConfigName)
        end
        if Options.WatermarkSettings.Value["Time"] == true then
            if stringorder ~= "Red.Leaf" then
                stringorder = stringorder
            end
            stringorder = stringorder .. " | " .. os.date('%I:%M:%S %p')
        end
        if Options.WatermarkSettings.Value["Date"] == true then
            if stringorder ~= "Red.Leaf" then
                stringorder = stringorder
            end
            stringorder = stringorder .. " | " .. os.date("%B %d") .. (os.date("%d"):sub(-1) == "1" and (os.date("%d") ~= "11" and "st" or "") or os.date("%d"):sub(-1) == "2" and (os.date("%d") ~= "12" and "nd" or "") or os.date("%d"):sub(-1) == "3" and (os.date("%d") ~= "13" and "rd" or "") or "th") .. ", " .. os.date("%Y")
        end
        if Options.WatermarkSettings.Value["Framerate"] == true then
            if stringorder ~= "Red.Leaf" then
                stringorder = stringorder
            end
            stringorder = stringorder .. " | " .. math.floor(1/frametime) .. ' fps'
        end
        if Options.WatermarkSettings.Value["Latency"] == true then
            if stringorder ~= "Red.Leaf" then
                stringorder = stringorder
            end
            stringorder = stringorder .. " | " .. math.floor(game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValue()) .. ' ms'
        end
        if Options.WatermarkColorSettings.Value['Cheat Name'] then
            stringorder = string.format('Red.<font color="rgb(%d, %d, %d)">%s</font>%s', Library.AccentColor.R * 255, Library.AccentColor.G * 255, Library.AccentColor.B * 255, "Leaf", string.sub(stringorder, #("Red.Leaf") + 1))
        end
        if Options.WatermarkColorSettings.Value["Display Name"] then
            stringorder = string.gsub(stringorder, tostring(game:GetService('Players').LocalPlayer.DisplayName), string.format('<font color="rgb(%d, %d, %d)">%s</font>', Library.AccentColor.R * 255, Library.AccentColor.G * 255, Library.AccentColor.B * 255, tostring(game:GetService('Players').LocalPlayer.DisplayName)))
        end
        if Options.WatermarkColorSettings.Value["Config Name"] then
            stringorder = string.gsub(stringorder, tostring(ConfigName), string.format('<font color="rgb(%d, %d, %d)">%s</font>', Library.AccentColor.R * 255, Library.AccentColor.G * 255, Library.AccentColor.B * 255, tostring(ConfigName)))
        end
        if Options.WatermarkColorSettings.Value["Time"] then
            stringorder = string.gsub(stringorder, os.date('%I:%M:%S %p'), string.format('<font color="rgb(%d, %d, %d)">%s</font>', Library.AccentColor.R * 255, Library.AccentColor.G * 255, Library.AccentColor.B * 255, os.date('%I:%M:%S %p')))
        end
        if Options.WatermarkColorSettings.Value["Date"] then
            stringorder = string.gsub(stringorder, os.date("%B %d") .. (os.date("%d"):sub(-1) == "1" and (os.date("%d") ~= "11" and "st" or "") or os.date("%d"):sub(-1) == "2" and (os.date("%d") ~= "12" and "nd" or "") or os.date("%d"):sub(-1) == "3" and (os.date("%d") ~= "13" and "rd" or "") or "th") .. ", " .. os.date("%Y"), string.format('<font color="rgb(%d, %d, %d)">%s</font>', Library.AccentColor.R * 255, Library.AccentColor.G * 255, Library.AccentColor.B * 255, os.date("%B %d") .. (os.date("%d"):sub(-1) == "1" and (os.date("%d") ~= "11" and "st" or "") or os.date("%d"):sub(-1) == "2" and (os.date("%d") ~= "12" and "nd" or "") or os.date("%d"):sub(-1) == "3" and (os.date("%d") ~= "13" and "rd" or "") or "th") .. ", " .. os.date("%Y")))
        end
        if Options.WatermarkColorSettings.Value["Framerate"] then
            stringorder = string.gsub(stringorder, math.floor(1/frametime) .. ' fps', string.format('<font color="rgb(%d, %d, %d)">%s</font>', Library.AccentColor.R * 255, Library.AccentColor.G * 255, Library.AccentColor.B * 255, math.floor(1/frametime) .. ' fps'))
        end
        if Options.WatermarkColorSettings.Value["Latency"] then
            stringorder = string.gsub(stringorder, math.floor(game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValue()) .. ' ms', string.format('<font color="rgb(%d, %d, %d)">%s</font>', Library.AccentColor.R * 255, Library.AccentColor.G * 255, Library.AccentColor.B * 255, math.floor(game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValue()) .. ' ms'))
        end
        Library:SetWatermark(stringorder)
    end)
end)

game:GetService("RunService").RenderStepped:Connect(function() if Toggles.customfov.Value then game:GetService('Workspace').CurrentCamera.FieldOfView = Options.customfovamount.Value end; if Toggles.NoWatermark.Value then Library:SetWatermarkVisibility(Toggles.NoWatermark.Value) else Library:SetWatermarkVisibility(false) end end)

task.spawn(function()
    while task.wait() do
        Toggles.thirdperson:SetValue(Options.thirdpersonbind:GetState())
        Toggles.walkspeedmod:SetValue(Options.walkspeedmodbind:GetState())
        if Library.Unloaded then break end
    end
end)





local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera
local UserInputService = game:GetService("UserInputService")
local filter = Instance.new("ColorCorrectionEffect", game:GetService("Lighting"))
local bloom = Instance.new("BloomEffect", game:GetService("Lighting"))
local skyPath = game:GetService("Lighting"):FindFirstChild("Sky")

local GetPlayers = Players.GetPlayers
local WorldToScreen = Camera.WorldToScreenPoint
local FindFirstChild = game.FindFirstChild
local GetMouseLocation = UserInputService.GetMouseLocation
local GetPartsObscuringTarget = Camera.GetPartsObscuringTarget

local function automaticdetonate()
    if game:GetService('Players').LocalPlayer:FindFirstChild('Status'):FindFirstChild('Class').Value == "Annihilator" and LocalPlayer:FindFirstChild('Status'):FindFirstChild('Loadout') and LocalPlayer:FindFirstChild('Status'):FindFirstChild('Loadout'):FindFirstChild('Secondary') and LocalPlayer:FindFirstChild('Status'):FindFirstChild('Loadout'):FindFirstChild('Secondary'):GetAttribute("Item") == LocalPlayer.Character:GetAttribute("EquippedWeapon") then
        for i,v in pairs(game:GetService('Workspace')["Destructable"]:GetChildren()) do
            if v:FindFirstChild('Owner') and v:FindFirstChild('Team') then
                if v.Name == string.format('%s stickybomb', LocalPlayer.Name) then
                    for ii,vv in pairs(game:GetService('Players'):GetChildren()) do
                        if vv:FindFirstChild('Status') and vv:FindFirstChild('Status'):FindFirstChild('Team') and vv:FindFirstChild('Status'):FindFirstChild('Team').Value ~= LocalPlayer:FindFirstChild('Status').Team.Value and vv.Character and vv.Character:FindFirstChild('HumanoidRootPart') then
                            if Options.autodetonatemode.Value == 'Legit' then
                                if vv.Character:FindFirstChild('Humanoid') and vv.Character:FindFirstChild('Humanoid').FloorMaterial == 'Air' and (v.Position - vv.Character.HumanoidRootPart.Position).Magnitude <= 9/2 then
                                    game:GetService("ReplicatedStorage").Events.Detonate:FireServer(v, nil, v.CFrame)
                                elseif vv.Character:FindFirstChild('Humanoid') and vv.Character:FindFirstChild('Humanoid').FloorMaterial ~= 'Air' and (v.Position - vv.Character.HumanoidRootPart.Position).Magnitude <= 9 then
                                    game:GetService("ReplicatedStorage").Events.Detonate:FireServer(v, nil, v.CFrame)
                                end
                            elseif Options.autodetonatemode.Value == 'Rage' and (v.Position - vv.Character.HumanoidRootPart.Position).Magnitude <= 9 * (Options.autodetonaterageradiusoverride.Value / 100) then
                                game:GetService("ReplicatedStorage").Events.Detonate:FireServer(v, nil, vv.Character.HumanoidRootPart.CFrame)
                            end
                        end
                    end
                end
            end
        end
    end
end

local function setkeybindindicatorposition(X, Y)
    local ScreenSize = game:GetService('Workspace').CurrentCamera.ViewportSize
    local X = math.clamp((X / 100) * (ScreenSize.X - Library.KeybindFrame.Size.X.Offset), 0, ScreenSize.X - Library.KeybindFrame.Size.X.Offset)
    local Y = math.clamp((Y / 100) * (ScreenSize.Y - Library.KeybindFrame.Size.Y.Offset) + (Library.KeybindFrame.Size.Y.Offset * (1 - Library.KeybindFrame.AnchorPoint.Y)), 0, ScreenSize.Y - Library.KeybindFrame.Size.Y.Offset * (1 - Library.KeybindFrame.AnchorPoint.Y))
    Library.KeybindFrame.Position = UDim2.new(0, X, 0, Y)
end

local function setwatermarkposition(X, Y)
    local ScreenSize = game:GetService('Workspace').CurrentCamera.ViewportSize
    local X = math.clamp((X / 100) * (ScreenSize.X - Library.Watermark.Size.X.Offset), 0, ScreenSize.X - Library.Watermark.Size.X.Offset)
    local Y = math.clamp((Y / 100) * (ScreenSize.Y - Library.Watermark.Size.Y.Offset), 0, ScreenSize.Y - Library.Watermark.Size.Y.Offset)
    Library.Watermark.Position = UDim2.new(0, X, 0, Y)
end

local function instantrespawn()
    if game:GetService('Players').LocalPlayer.PlayerGui.GUI.Client.LegacyLocalVariables.died.Value and LocalPlayer.Team == 'GRN' or game:GetService('Players').LocalPlayer.PlayerGui.GUI.Client.LegacyLocalVariables.died.Value and LocalPlayer.Team == 'RED' then
        game:GetService("ReplicatedStorage").Events.LoadCharacter:FireServer()
    end
end

local function healbotsaveself()
    if LocalPlayer:FindFirstChild('Status'):FindFirstChild('Class').Value == 'Doctor' and LocalPlayer.Character.Humanoid.Health < Options.healthamount.Value then
        game:GetService('Players').LocalPlayer.Character.Doctor.ChangeValue:FireServer('Target', tostring(LocalPlayer.Name))
    elseif LocalPlayer:FindFirstChild('Status'):FindFirstChild('Class').Value == 'Doctor' and LocalPlayer.Character.Humanoid.Health >= Options.healthamount.Value and game:GetService('Players').LocalPlayer.Character.Doctor:GetAttribute('Target') == tostring(LocalPlayer.Name) then
        game:GetService('Players').LocalPlayer.Character.Doctor.ChangeValue:FireServer('Target', '')
    end
end

local function healaura()
    if LocalPlayer:FindFirstChild('Status'):FindFirstChild('Class').Value == 'Doctor' and LocalPlayer.Character.Doctor then
        local closest
        local lowhp
        for i, v in pairs(game:GetService('Players'):GetChildren()) do
            if v.Team == LocalPlayer.Team and v.Character and v.Character:FindFirstChild("HumanoidRootPart") and v.Character:FindFirstChild("Humanoid") and (v.Character.HumanoidRootPart.Position - LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 50 then
                if (not closest or (v.Character.HumanoidRootPart.Position - LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < (closest.Character.HumanoidRootPart.Position - LocalPlayer.Character.HumanoidRootPart.Position).Magnitude) and v ~= LocalPlayer then
                    if Toggles.healaurafriendsonly.Value and v:IsFriendsWith(LocalPlayer.UserId) then
                        closest = v
                    elseif not Toggles.healaurafriendsonly.Value then
                        closest = v
                    end
                end
                if (not lowhp or v.Character.Humanoid.Health < lowhp.Character.Humanoid.Health) and v ~= LocalPlayer then
                    if Toggles.healaurafriendsonly.Value and v:IsFriendsWith(LocalPlayer.UserId) then
                        lowhp = v
                    elseif not Toggles.healaurafriendsonly.Value then
                        lowhp = v
                    end
                end
            end
        end
        if closest and closest ~= LocalPlayer then
            game:GetService('Players').LocalPlayer.Character.Doctor.ChangeValue:FireServer('Target', tostring(closest.Name))
        elseif lowhp and lowhp ~= LocalPlayer then
            game:GetService('Players').LocalPlayer.Character.Doctor.ChangeValue:FireServer('Target', tostring(lowhp.Name))
        end
    end
end

local function nosniperscope(visibility)
    for i,v in pairs(LocalPlayer.PlayerGui.HUDGui.Crosshairs.Scope:GetChildren()) do
        if v.Name ~= 'ACTION_WEPFIRE' then
            v.Visible = visibility
        end
    end
    if visibility == false then
        LocalPlayer.PlayerGui.HUDGui.Crosshairs.Crosshair.Visible = not visibility
    end
end

local function speedchanger(class, speed)
    if class and class ~= '' and game:GetService('ReplicatedStorage'):FindFirstChild('ClassInfo')[class].WalkSpeed.Value ~= speed*16 then
        local Speed = game:GetService('ReplicatedStorage'):FindFirstChild('ClassInfo')[class].WalkSpeed:Clone()
        Speed.Parent = game:GetService('ReplicatedStorage').Medic
        Speed.Value = speed*16
        task.wait()
        game:GetService('ReplicatedStorage'):FindFirstChild('ClassInfo')[class].WalkSpeed:Destroy()
        Speed.Parent = game:GetService('ReplicatedStorage'):FindFirstChild('ClassInfo')[class]
    end
end

local function spawnbuilding(position, building, level)
    game:GetService("ReplicatedStorage").Events.DeployBuilding:FireServer(position, building, nil, level, nil, nil, nil, nil, nil, LocalPlayer:FindFirstChild('Status').Team.Value)
end

local function hitboxexpand()
    --[[
        ----- The hitbox sizes for each class in Vector3 studs -----

        Hitbox:
            Trooper - 5.475600242614746, 5.070000171661377, 5.070000171661377
            Brute - 5.859000205993652, 5.425000190734863, 5.425000190734863
            Arsonist - 5.319000244140625, 4.925000190734863, 4.925000190734863
            Mechanic - 5.0868000984191895, 4.710000038146973, 4.710000038146973
            Doctor - 5.551199913024902, 5.139999866485596, 5.139999866485596
            Agent - 5.513400077819824, 5.105000019073486, 5.105000019073486
            Flanker - 5.475600242614746, 5.070000171661377, 5.070000171661377
            Annihilator - 5.5889997482299805, 5.174999713897705, 5.174999713897705
            Marksman - 5.626800537109375, 5.210000038146973, 5.210000038146973

        Head Hitbox:
            Trooper - 1.4699958562850952, 1.3199238777160645, 1.3199238777160645
            Brute - 1.5729244947433472, 1.4123445749282837, 1.4123445749282837
            Arsonist - 1.4279545545578003, 1.2821744680404663, 1.2821744680404663
            Mechanic - 1.3656173944473267, 1.2262014150619507, 1.2262014150619507
            Doctor - 1.4902915954589844, 1.3381476402282715, 1.3381476402282715
            Agent - 1.4801437854766846, 1.329035758972168, 1.329035758972168
            Flanker - 1.4699958562850952, 1.3199238777160645, 1.3199238777160645
            Annihilator - 1.5004394054412842, 1.3472594022750854, 1.3472594022750854
            Marksman - 1.510587453842163, 1.356371521949768, 1.356371521949768
    ]]--

    if Toggles.HeadHitboxExpand.Value then
        for i,v in pairs(Players:GetChildren()) do
            if v ~= LocalPlayer and v.Character and v.Character:FindFirstChild("HeadHB") then
                if Options.HeadSize.Value ~= 1 and (not Toggles.HeadHitboxTeamCheck.Value or v.Team ~= game:GetService('Players').LocalPlayer.Team) then
                    v.Character:FindFirstChild("HeadHB").Size = Vector3.new(Options.HeadSize.Value,Options.HeadSize.Value,Options.HeadSize.Value)
                else
                    if v:FindFirstChild('Status'):FindFirstChild('Class').Value == "Trooper" then
                        v.Character:FindFirstChild("HeadHB").Size = Vector3.new(1.4699958562850952, 1.3199238777160645, 1.3199238777160645)
                    elseif v:FindFirstChild('Status'):FindFirstChild('Class').Value == "Brute" then
                        v.Character:FindFirstChild("HeadHB").Size = Vector3.new(1.5729244947433472, 1.4123445749282837, 1.4123445749282837)
                    elseif v:FindFirstChild('Status'):FindFirstChild('Class').Value == "Arsonist" then
                        v.Character:FindFirstChild("HeadHB").Size = Vector3.new(1.4279545545578003, 1.2821744680404663, 1.2821744680404663)
                    elseif v:FindFirstChild('Status'):FindFirstChild('Class').Value == "Mechanic" then
                        v.Character:FindFirstChild("HeadHB").Size = Vector3.new(1.3656173944473267, 1.2262014150619507, 1.2262014150619507)
                    elseif v:FindFirstChild('Status'):FindFirstChild('Class').Value == "Doctor" then
                        v.Character:FindFirstChild("HeadHB").Size = Vector3.new(1.4902915954589844, 1.3381476402282715, 1.3381476402282715)
                    elseif v:FindFirstChild('Status'):FindFirstChild('Class').Value == "Agent" then
                        v.Character:FindFirstChild("HeadHB").Size = Vector3.new(1.4801437854766846, 1.329035758972168, 1.329035758972168)
                    elseif v:FindFirstChild('Status'):FindFirstChild('Class').Value == "Flanker" then
                        v.Character:FindFirstChild("HeadHB").Size = Vector3.new(1.4699958562850952, 1.3199238777160645, 1.3199238777160645)
                    elseif v:FindFirstChild('Status'):FindFirstChild('Class').Value == "Annihilator" then
                        v.Character:FindFirstChild("HeadHB").Size = Vector3.new(1.5004394054412842, 1.3472594022750854, 1.3472594022750854)
                    elseif v:FindFirstChild('Status'):FindFirstChild('Class').Value == "Marksman" then
                        v.Character:FindFirstChild("HeadHB").Size = Vector3.new(1.510587453842163, 1.356371521949768, 1.356371521949768)
                    end
                end
                if Toggles.HeadHitboxVisualize.Value and (not Toggles.HeadHitboxTeamCheck.Value or v.Team ~= game:GetService('Players').LocalPlayer.Team) then
                    v.Character:FindFirstChild("HeadHB").Transparency = Options.HeadHitboxTransparency.Value
                    v.Character:FindFirstChild("HeadHB").Color = Options.HeadHitboxColor.Value
                else
                    v.Character:FindFirstChild("HeadHB").Transparency = 1
                end
            end
        end
    end
    if Toggles.HitboxExpand.Value then
        for i,v in pairs(Players:GetChildren()) do
            if v ~= LocalPlayer and v.Character and v.Character:FindFirstChild("Hitbox") then
                if Options.HitboxSize.Value ~= 1 and (not Toggles.HitboxTeamCheck.Value or v.Team ~= game:GetService('Players').LocalPlayer.Team) then
                    v.Character:FindFirstChild("Hitbox").Size = Vector3.new(Options.HitboxSize.Value,Options.HitboxSize.Value,Options.HitboxSize.Value)
                else
                    if v:FindFirstChild('Status'):FindFirstChild('Class').Value == "Trooper" then
                        v.Character:FindFirstChild("Hitbox").Size = Vector3.new(5.475600242614746, 5.070000171661377, 5.070000171661377)
                    elseif v:FindFirstChild('Status'):FindFirstChild('Class').Value == "Brute" then
                        v.Character:FindFirstChild("Hitbox").Size = Vector3.new(5.859000205993652, 5.425000190734863, 5.425000190734863)
                    elseif v:FindFirstChild('Status'):FindFirstChild('Class').Value == "Arsonist" then
                        v.Character:FindFirstChild("Hitbox").Size = Vector3.new(5.319000244140625, 4.925000190734863, 4.925000190734863)
                    elseif v:FindFirstChild('Status'):FindFirstChild('Class').Value == "Mechanic" then
                        v.Character:FindFirstChild("Hitbox").Size = Vector3.new(5.0868000984191895, 4.710000038146973, 4.710000038146973)
                    elseif v:FindFirstChild('Status'):FindFirstChild('Class').Value == "Doctor" then
                        v.Character:FindFirstChild("Hitbox").Size = Vector3.new(5.551199913024902, 5.139999866485596, 5.139999866485596)
                    elseif v:FindFirstChild('Status'):FindFirstChild('Class').Value == "Agent" then
                        v.Character:FindFirstChild("Hitbox").Size = Vector3.new(5.513400077819824, 5.105000019073486, 5.105000019073486)
                    elseif v:FindFirstChild('Status'):FindFirstChild('Class').Value == "Flanker" then
                        v.Character:FindFirstChild("Hitbox").Size = Vector3.new(5.475600242614746, 5.070000171661377, 5.070000171661377)
                    elseif v:FindFirstChild('Status'):FindFirstChild('Class').Value == "Annihilator" then
                        v.Character:FindFirstChild("Hitbox").Size = Vector3.new(5.5889997482299805, 5.174999713897705, 5.174999713897705)
                    elseif v:FindFirstChild('Status'):FindFirstChild('Class').Value == "Marksman" then
                        v.Character:FindFirstChild("Hitbox").Size = Vector3.new(5.626800537109375, 5.210000038146973, 5.210000038146973)
                    end
                end
                if Toggles.HitboxVisualize.Value and (not Toggles.HitboxTeamCheck.Value or v.Team ~= game:GetService('Players').LocalPlayer.Team) then
                    v.Character:FindFirstChild("Hitbox").Transparency = Options.HitboxTransparency.Value
                    v.Character:FindFirstChild("Hitbox").Color = Options.HitboxColor.Value
                else
                    v.Character:FindFirstChild("Hitbox").Transparency = 1
                end
            end
        end
    end
end

local function unhitboxexpand()
    --[[
        ----- The hitbox sizes for each class in Vector3 studs -----

        Hitbox:
            Trooper - 5.475600242614746, 5.070000171661377, 5.070000171661377
            Brute - 5.859000205993652, 5.425000190734863, 5.425000190734863
            Arsonist - 5.319000244140625, 4.925000190734863, 4.925000190734863
            Mechanic - 5.0868000984191895, 4.710000038146973, 4.710000038146973
            Doctor - 5.551199913024902, 5.139999866485596, 5.139999866485596
            Agent - 5.513400077819824, 5.105000019073486, 5.105000019073486
            Flanker - 5.475600242614746, 5.070000171661377, 5.070000171661377
            Annihilator - 5.5889997482299805, 5.174999713897705, 5.174999713897705
            Marksman - 5.626800537109375, 5.210000038146973, 5.210000038146973

        Head Hitbox:
            Trooper - 1.4699958562850952, 1.3199238777160645, 1.3199238777160645
            Brute - 1.5729244947433472, 1.4123445749282837, 1.4123445749282837
            Arsonist - 1.4279545545578003, 1.2821744680404663, 1.2821744680404663
            Mechanic - 1.3656173944473267, 1.2262014150619507, 1.2262014150619507
            Doctor - 1.4902915954589844, 1.3381476402282715, 1.3381476402282715
            Agent - 1.4801437854766846, 1.329035758972168, 1.329035758972168
            Flanker - 1.4699958562850952, 1.3199238777160645, 1.3199238777160645
            Annihilator - 1.5004394054412842, 1.3472594022750854, 1.3472594022750854
            Marksman - 1.510587453842163, 1.356371521949768, 1.356371521949768
    ]]--

    if not Toggles.HeadHitboxExpand.Value then
        for i,v in pairs(Players:GetChildren()) do
            if v ~= LocalPlayer and v.Character and v.Character:FindFirstChild("Hitbox") then
                if v:FindFirstChild('Status'):FindFirstChild('Class').Value == "Trooper" then
                    v.Character:FindFirstChild("Hitbox").Size = Vector3.new(5.475600242614746, 5.070000171661377, 5.070000171661377)
                elseif v:FindFirstChild('Status'):FindFirstChild('Class').Value == "Brute" then
                    v.Character:FindFirstChild("Hitbox").Size = Vector3.new(5.859000205993652, 5.425000190734863, 5.425000190734863)
                elseif v:FindFirstChild('Status'):FindFirstChild('Class').Value == "Arsonist" then
                    v.Character:FindFirstChild("Hitbox").Size = Vector3.new(5.319000244140625, 4.925000190734863, 4.925000190734863)
                elseif v:FindFirstChild('Status'):FindFirstChild('Class').Value == "Mechanic" then
                    v.Character:FindFirstChild("Hitbox").Size = Vector3.new(5.0868000984191895, 4.710000038146973, 4.710000038146973)
                elseif v:FindFirstChild('Status'):FindFirstChild('Class').Value == "Doctor" then
                    v.Character:FindFirstChild("Hitbox").Size = Vector3.new(5.551199913024902, 5.139999866485596, 5.139999866485596)
                elseif v:FindFirstChild('Status'):FindFirstChild('Class').Value == "Agent" then
                    v.Character:FindFirstChild("Hitbox").Size = Vector3.new(5.513400077819824, 5.105000019073486, 5.105000019073486)
                elseif v:FindFirstChild('Status'):FindFirstChild('Class').Value == "Flanker" then
                    v.Character:FindFirstChild("Hitbox").Size = Vector3.new(5.475600242614746, 5.070000171661377, 5.070000171661377)
                elseif v:FindFirstChild('Status'):FindFirstChild('Class').Value == "Annihilator" then
                    v.Character:FindFirstChild("Hitbox").Size = Vector3.new(5.5889997482299805, 5.174999713897705, 5.174999713897705)
                elseif v:FindFirstChild('Status'):FindFirstChild('Class').Value == "Marksman" then
                    v.Character:FindFirstChild("Hitbox").Size = Vector3.new(5.626800537109375, 5.210000038146973, 5.210000038146973)
                end
                v.Character:FindFirstChild("HeadHB").Transparency = 1
            end
        end
    end
    if not Toggles.HitboxExpand.Value then
        for i,v in pairs(Players:GetChildren()) do
            if v ~= LocalPlayer and v.Character and v.Character:FindFirstChild("HeadHB") then
                if v:FindFirstChild('Status'):FindFirstChild('Class').Value == "Trooper" then
                    v.Character:FindFirstChild("HeadHB").Size = Vector3.new(1.4699958562850952, 1.3199238777160645, 1.3199238777160645)
                elseif v:FindFirstChild('Status'):FindFirstChild('Class').Value == "Brute" then
                    v.Character:FindFirstChild("HeadHB").Size = Vector3.new(1.5729244947433472, 1.4123445749282837, 1.4123445749282837)
                elseif v:FindFirstChild('Status'):FindFirstChild('Class').Value == "Arsonist" then
                    v.Character:FindFirstChild("HeadHB").Size = Vector3.new(1.4279545545578003, 1.2821744680404663, 1.2821744680404663)
                elseif v:FindFirstChild('Status'):FindFirstChild('Class').Value == "Mechanic" then
                    v.Character:FindFirstChild("HeadHB").Size = Vector3.new(1.3656173944473267, 1.2262014150619507, 1.2262014150619507)
                elseif v:FindFirstChild('Status'):FindFirstChild('Class').Value == "Doctor" then
                    v.Character:FindFirstChild("HeadHB").Size = Vector3.new(1.4902915954589844, 1.3381476402282715, 1.3381476402282715)
                elseif v:FindFirstChild('Status'):FindFirstChild('Class').Value == "Agent" then
                    v.Character:FindFirstChild("HeadHB").Size = Vector3.new(1.4801437854766846, 1.329035758972168, 1.329035758972168)
                elseif v:FindFirstChild('Status'):FindFirstChild('Class').Value == "Flanker" then
                    v.Character:FindFirstChild("HeadHB").Size = Vector3.new(1.4699958562850952, 1.3199238777160645, 1.3199238777160645)
                elseif v:FindFirstChild('Status'):FindFirstChild('Class').Value == "Annihilator" then
                    v.Character:FindFirstChild("HeadHB").Size = Vector3.new(1.5004394054412842, 1.3472594022750854, 1.3472594022750854)
                elseif v:FindFirstChild('Status'):FindFirstChild('Class').Value == "Marksman" then
                    v.Character:FindFirstChild("HeadHB").Size = Vector3.new(1.510587453842163, 1.356371521949768, 1.356371521949768)
                end
                v.Character:FindFirstChild("Hitbox").Transparency = 1
            end
        end
    end
end

local function automaticairblast()
    if game:GetService('Players').LocalPlayer:FindFirstChild('Status'):FindFirstChild('Class').Value == "Arsonist" and LocalPlayer:FindFirstChild('Status'):FindFirstChild('Loadout'):FindFirstChild('Primary'):GetAttribute("Item") == LocalPlayer.Character:GetAttribute("EquippedWeapon") then
        for i,v in pairs(game:GetService('Workspace')["Ray_Ignore"]:GetChildren()) do
            if v:FindFirstChild('Owner') and v:FindFirstChild('Team') then
                if Options.projectilestoairblast.Value["Rockets"] and v.Name == "Rocket" and v.Team.Value ~= LocalPlayer:FindFirstChild('Status').Team.Value and (v.Position - LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 13 then --// team check added late cuz im slow..
                    game:GetService('Players').LocalPlayer.PlayerGui.GUI.Client.LegacyLocalVariables.Held2.Value = true
                    task.wait(.1)
                    game:GetService('Players').LocalPlayer.PlayerGui.GUI.Client.LegacyLocalVariables.Held2.Value = false
                end
                if Options.projectilestoairblast.Value["Grenades"] and v.Name == "Grenade" and v.Team.Value ~= LocalPlayer:FindFirstChild('Status').Team.Value and (v.Position - LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 13 then --// team check added late cuz im slow..
                    game:GetService('Players').LocalPlayer.PlayerGui.GUI.Client.LegacyLocalVariables.Held2.Value = true
                    task.wait(.1)
                    game:GetService('Players').LocalPlayer.PlayerGui.GUI.Client.LegacyLocalVariables.Held2.Value = false
                end
                if Options.projectilestoairblast.Value["Baubles"] and v.Name == "Bauble" and v.Team.Value ~= LocalPlayer:FindFirstChild('Status').Team.Value and (v.Position - LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 40 then --// team check added late cuz im slow..
                    game:GetService('Players').LocalPlayer.PlayerGui.GUI.Client.LegacyLocalVariables.Held2.Value = true
                    task.wait(.1)
                    game:GetService('Players').LocalPlayer.PlayerGui.GUI.Client.LegacyLocalVariables.Held2.Value = false
                end
                if Options.projectilestoairblast.Value["Baseballs"] and v.Name == "Baseball" and v.Team.Value ~= LocalPlayer:FindFirstChild('Status').Team.Value and (v.Position - LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 40 then --// team check added late cuz im slow..
                    game:GetService('Players').LocalPlayer.PlayerGui.GUI.Client.LegacyLocalVariables.Held2.Value = true
                    task.wait(.1)
                    game:GetService('Players').LocalPlayer.PlayerGui.GUI.Client.LegacyLocalVariables.Held2.Value = false
                end
                if Options.projectilestoairblast.Value["Flares"] and v.Name == "Flare Gun" and v.Team.Value ~= LocalPlayer:FindFirstChild('Status').Team.Value and (v.Position - LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 16 then --// team check added late cuz im slow..
                    game:GetService('Players').LocalPlayer.PlayerGui.GUI.Client.LegacyLocalVariables.Held2.Value = true
                    task.wait(.1)
                    game:GetService('Players').LocalPlayer.PlayerGui.GUI.Client.LegacyLocalVariables.Held2.Value = false
                end
                if Options.projectilestoairblast.Value["Flares"] and v.Name == tostring(v.Owner.Value) .. " bomb" and v.Team.Value ~= LocalPlayer:FindFirstChild('Status').Team.Value and (v.Position - LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 16 then --// team check added late cuz im slow..
                    game:GetService('Players').LocalPlayer.PlayerGui.GUI.Client.LegacyLocalVariables.Held2.Value = true
                    task.wait(.1)
                    game:GetService('Players').LocalPlayer.PlayerGui.GUI.Client.LegacyLocalVariables.Held2.Value = false
                end
            end
        end
    end
end

local function freebuildings()
    for i,v in pairs(game:GetService('Players').LocalPlayer.PlayerGui.GUI.Client.LegacyLocalVariables.metalcoster:GetChildren()) do
        v.Value = 0
    end
end

local function normalpricebuildings()
    if not LocalPlayer:FindFirstChild('Status'):FindFirstChild('Loadout'):FindFirstChild('Melee') then return end
    local Melee = LocalPlayer:FindFirstChild('Status'):FindFirstChild('Loadout'):FindFirstChild('Melee'):GetAttribute("Item")
    for i,v in pairs(game:GetService('Players').LocalPlayer.PlayerGui.GUI.Client.LegacyLocalVariables.metalcoster:GetChildren()) do
        if v.Name == "Dispenser" then
            v.Value = 100
        elseif v.Name == "Sentry" and Melee == "Gunslinger" then
            v.Value = 100
        elseif v.Name == "Sentry" and Melee ~= "Gunslinger" then
            v.Value = 130
        elseif v.Name == "Teleporter" and Melee == "Eureka Effect" then
            v.Value = 25
        elseif v.Name == "Teleporter" and Melee ~= "Eureka Effect" then
            v.Value = 50
        elseif v.Name == "Landmine" then
            v.Value = 100
        end
    end
end

local function thirdperson()
    local Weapon1 = game:GetService('ReplicatedStorage').Weapons[LocalPlayer:FindFirstChild('Status'):FindFirstChild('Loadout'):FindFirstChild('Primary'):GetAttribute("Item")]
    local Weapon2 = game:GetService('ReplicatedStorage').Weapons[(LocalPlayer:FindFirstChild('Status'):FindFirstChild('Class').Value == 'Agent' and LocalPlayer:FindFirstChild('Status'):FindFirstChild('Loadout'):FindFirstChild('PDA1') or LocalPlayer:FindFirstChild('Status'):FindFirstChild('Loadout'):FindFirstChild('Secondary')):GetAttribute("Item")]
    local Weapon3 = game:GetService('ReplicatedStorage').Weapons[LocalPlayer:FindFirstChild('Status'):FindFirstChild('Loadout'):FindFirstChild('Melee'):GetAttribute("Item")]
    local DisguiseKit
    local class = LocalPlayer:FindFirstChild('Status'):FindFirstChild('Class').Value
    if class == 'Agent' then
        Weapon1 = game:GetService('ReplicatedStorage').Weapons[LocalPlayer:FindFirstChild('Status'):FindFirstChild('Loadout'):FindFirstChild('Primary'):GetAttribute("Item")]
        Weapon2 = game:GetService('ReplicatedStorage').Weapons[LocalPlayer:FindFirstChild('Status'):FindFirstChild('Loadout'):FindFirstChild('PDA1'):GetAttribute("Item")]
        Weapon3 = game:GetService('ReplicatedStorage').Weapons[LocalPlayer:FindFirstChild('Status'):FindFirstChild('Loadout'):FindFirstChild('Melee'):GetAttribute("Item")]
        DisguiseKit = game:GetService('ReplicatedStorage').Weapons[LocalPlayer:FindFirstChild('Status'):FindFirstChild('Loadout'):FindFirstChild('PDA2'):GetAttribute("Item")]
    end
    if game:GetService('ReplicatedStorage'):FindFirstChild('ClassInfo')[class].Viewheight.Value ~= Options.thirdpersonoffset.Value then
        local ViewHeight = game:GetService('ReplicatedStorage'):FindFirstChild('ClassInfo')[class].Viewheight:Clone()
        ViewHeight.Parent = game:GetService('ReplicatedStorage').Medic
        ViewHeight.Value = Options.thirdpersonoffset.Value
        task.wait()
        game:GetService('ReplicatedStorage'):FindFirstChild('ClassInfo')[class].Viewheight:Destroy()
        ViewHeight.Parent = game:GetService('ReplicatedStorage'):FindFirstChild('ClassInfo')[class]
        game:GetService('Players').LocalPlayer.PlayerGui.GUI.Client.LegacyLocalVariables.viewheight.Value = game:GetService('ReplicatedStorage'):FindFirstChild('ClassInfo')[class].Viewheight.Value >= 250 and 8.78125 or game:GetService('ReplicatedStorage'):FindFirstChild('ClassInfo')[class].Viewheight.Value >= 230 and (7.71875 + (game:GetService('ReplicatedStorage'):FindFirstChild('ClassInfo')[class].Viewheight.Value - 230) * (8.78125 - 7.71875) / 20) or game:GetService('ReplicatedStorage'):FindFirstChild('ClassInfo')[class].Viewheight.Value >= 210 and (6.65625 + (game:GetService('ReplicatedStorage'):FindFirstChild('ClassInfo')[class].Viewheight.Value - 210) * (7.71875 - 6.65625) / 20) or game:GetService('ReplicatedStorage'):FindFirstChild('ClassInfo')[class].Viewheight.Value >= 190 and (5.59375 + (game:GetService('ReplicatedStorage'):FindFirstChild('ClassInfo')[class].Viewheight.Value - 190) * (6.65625 - 5.59375) / 20) or game:GetService('ReplicatedStorage'):FindFirstChild('ClassInfo')[class].Viewheight.Value >= 170 and (4.53125 + (game:GetService('ReplicatedStorage'):FindFirstChild('ClassInfo')[class].Viewheight.Value - 170) * (5.59375 - 4.53125) / 20) or game:GetService('ReplicatedStorage'):FindFirstChild('ClassInfo')[class].Viewheight.Value >= 150 and (3.46875 + (game:GetService('ReplicatedStorage'):FindFirstChild('ClassInfo')[class].Viewheight.Value - 150) * (4.53125 - 3.46875) / 20) or game:GetService('ReplicatedStorage'):FindFirstChild('ClassInfo')[class].Viewheight.Value >= 130 and (2.40625 + (game:GetService('ReplicatedStorage'):FindFirstChild('ClassInfo')[class].Viewheight.Value - 130) * (3.46875 - 2.40625) / 20) or game:GetService('ReplicatedStorage'):FindFirstChild('ClassInfo')[class].Viewheight.Value >= 110 and (1.34375 + (game:GetService('ReplicatedStorage'):FindFirstChild('ClassInfo')[class].Viewheight.Value - 110) * (2.40625 - 1.34375) / 20) or game:GetService('ReplicatedStorage'):FindFirstChild('ClassInfo')[class].Viewheight.Value >= 90 and (0.28125 + (game:GetService('ReplicatedStorage'):FindFirstChild('ClassInfo')[class].Viewheight.Value - 90) * (1.34375 - 0.28125) / 20) or game:GetService('ReplicatedStorage'):FindFirstChild('ClassInfo')[class].Viewheight.Value >= 70 and (-0.78125 + (game:GetService('ReplicatedStorage'):FindFirstChild('ClassInfo')[class].Viewheight.Value - 70) * (0.28125 + 0.78125) / 20) or game:GetService('ReplicatedStorage'):FindFirstChild('ClassInfo')[class].Viewheight.Value >= 50 and (-1.84375 + (game:GetService('ReplicatedStorage'):FindFirstChild('ClassInfo')[class].Viewheight.Value - 50) * (-0.78125 + 1.84375) / 20) or game:GetService('ReplicatedStorage'):FindFirstChild('ClassInfo')[class].Viewheight.Value >= 30 and (-2.90625 + (game:GetService('ReplicatedStorage'):FindFirstChild('ClassInfo')[class].Viewheight.Value - 30) * (-1.84375 + 2.90625) / 20) or game:GetService('ReplicatedStorage'):FindFirstChild('ClassInfo')[class].Viewheight.Value >= 10 and (-3.96875 + (game:GetService('ReplicatedStorage'):FindFirstChild('ClassInfo')[class].Viewheight.Value - 10) * (-2.90625 + 3.96875) / 20) or -3.96875
    end
    if not Weapon1:FindFirstChild("ForceThirdPerson") then
        game:GetService('ReplicatedStorage').Weapons["Prop Handle"]["ForceThirdPerson"]:Clone().Parent = Weapon1
        game:GetService('Players').LocalPlayer.PlayerGui.GUI.Client.LegacyLocalVariables.disarmed.Value = true
    end
    if not Weapon2:FindFirstChild("ForceThirdPerson") and not class == 'Agent' then
        game:GetService('ReplicatedStorage').Weapons["Prop Handle"]["ForceThirdPerson"]:Clone().Parent = Weapon2
        game:GetService('Players').LocalPlayer.PlayerGui.GUI.Client.LegacyLocalVariables.disarmed.Value = true
    end
    if Weapon3.Name ~= "Prop Handle" and not Weapon3:FindFirstChild("ForceThirdPerson") then
        game:GetService('ReplicatedStorage').Weapons["Prop Handle"]["ForceThirdPerson"]:Clone().Parent = Weapon3
        game:GetService('Players').LocalPlayer.PlayerGui.GUI.Client.LegacyLocalVariables.disarmed.Value = true
    end
    if class == 'Agent' and not DisguiseKit:FindFirstChild("ForceThirdPerson") then
        game:GetService('ReplicatedStorage').Weapons["Prop Handle"]["ForceThirdPerson"]:Clone().Parent = DisguiseKit
        game:GetService('Players').LocalPlayer.PlayerGui.GUI.Client.LegacyLocalVariables.disarmed.Value = true
    end
end

local function unthirdperson()
    if LocalPlayer and LocalPlayer:FindFirstChild('Status') and LocalPlayer:FindFirstChild('Status'):FindFirstChild('Class') and LocalPlayer:FindFirstChild('Status'):FindFirstChild('Loadout') and LocalPlayer:FindFirstChild('Status'):FindFirstChild('Loadout'):FindFirstChild('Primary') and LocalPlayer:FindFirstChild('Status'):FindFirstChild('Loadout'):FindFirstChild('Secondary') and LocalPlayer:FindFirstChild('Status'):FindFirstChild('Loadout'):FindFirstChild('Melee') and game:GetService('ReplicatedStorage') and game:GetService('ReplicatedStorage'):FindFirstChild('Weapons') and LocalPlayer:FindFirstChild('Status'):FindFirstChild('Class').Value ~= '' then
        local Weapon1 = game:GetService('ReplicatedStorage').Weapons[LocalPlayer:FindFirstChild('Status'):FindFirstChild('Loadout'):FindFirstChild('Primary'):GetAttribute("Item")]
        local Weapon2 = game:GetService('ReplicatedStorage').Weapons[(LocalPlayer:FindFirstChild('Status'):FindFirstChild('Class').Value == 'Agent' and LocalPlayer:FindFirstChild('Status'):FindFirstChild('Loadout'):FindFirstChild('PDA1') or LocalPlayer:FindFirstChild('Status'):FindFirstChild('Loadout'):FindFirstChild('Secondary')):GetAttribute("Item")]
        local Weapon3 = game:GetService('ReplicatedStorage').Weapons[LocalPlayer:FindFirstChild('Status'):FindFirstChild('Loadout'):FindFirstChild('Melee'):GetAttribute("Item")]
        local DisguiseKit
        local class = LocalPlayer:FindFirstChild('Status'):FindFirstChild('Class').Value
        if class == 'Agent' then
            Weapon1 = game:GetService('ReplicatedStorage').Weapons[LocalPlayer:FindFirstChild('Status'):FindFirstChild('Loadout'):FindFirstChild('Primary'):GetAttribute("Item")]
            Weapon2 = game:GetService('ReplicatedStorage').Weapons[LocalPlayer:FindFirstChild('Status'):FindFirstChild('Loadout'):FindFirstChild('PDA1'):GetAttribute("Item")]
            Weapon3 = game:GetService('ReplicatedStorage').Weapons[LocalPlayer:FindFirstChild('Status'):FindFirstChild('Loadout'):FindFirstChild('Melee'):GetAttribute("Item")]
            DisguiseKit = game:GetService('ReplicatedStorage').Weapons[LocalPlayer:FindFirstChild('Status'):FindFirstChild('Loadout'):FindFirstChild('PDA2'):GetAttribute("Item")]
        end
        local viewheightoriginal = 78
        if Weapon1:FindFirstChild("ForceThirdPerson") then
            Weapon1["ForceThirdPerson"]:Destroy()
            game:GetService('Players').LocalPlayer.PlayerGui.GUI.Client.LegacyLocalVariables.disarmed.Value = true
            if class == 'Agent' or class == 'Assault' or class == 'Doctor' then
                viewheightoriginal = 77
            elseif class == 'Annihilator' or class == 'Flanker' or class == 'Marksman' or class == 'Mechanic' or class == 'Trooper' then
                viewheightoriginal = 79
            elseif class == 'Brute' then
                viewheightoriginal = 80
            end
            if game:GetService('ReplicatedStorage'):FindFirstChild('ClassInfo')[class].Viewheight.Value ~= viewheightoriginal then
                local ViewHeight = game:GetService('ReplicatedStorage'):FindFirstChild('ClassInfo')[class].Viewheight:Clone()
                ViewHeight.Parent = game:GetService('ReplicatedStorage').Medic
                ViewHeight.Value = viewheightoriginal
                task.wait()
                game:GetService('ReplicatedStorage'):FindFirstChild('ClassInfo')[class].Viewheight:Destroy()
                game:GetService('Players').LocalPlayer.PlayerGui.GUI.Client.LegacyLocalVariables.viewheight.Value = -0.303
                ViewHeight.Parent = game:GetService('ReplicatedStorage'):FindFirstChild('ClassInfo')[class]
            end
        end
        if Weapon2:FindFirstChild("ForceThirdPerson") and not class == 'Agent' then
            Weapon2["ForceThirdPerson"]:Destroy()
            game:GetService('Players').LocalPlayer.PlayerGui.GUI.Client.LegacyLocalVariables.disarmed.Value = true
        end
        if Weapon3.Name ~= "Prop Handle" and Weapon3:FindFirstChild("ForceThirdPerson") then
            Weapon3["ForceThirdPerson"]:Destroy()
            game:GetService('Players').LocalPlayer.PlayerGui.GUI.Client.LegacyLocalVariables.disarmed.Value = true
        end
        if class == 'Agent' and DisguiseKit:FindFirstChild("ForceThirdPerson") then
            DisguiseKit["ForceThirdPerson"]:Destroy()
            game:GetService('Players').LocalPlayer.PlayerGui.GUI.Client.LegacyLocalVariables.disarmed.Value = true
        end
    end
end

local function infammo()
    if LocalPlayer.Character:GetAttribute("EquippedWeapon") and LocalPlayer.Character:GetAttribute("EquippedWeapon") ~= '' then
        local WeaponAmmo = game:GetService('ReplicatedStorage').Weapons[LocalPlayer.Character:GetAttribute("EquippedWeapon")]:FindFirstChild('Ammo').Value
        if WeaponAmmo <= 0 then WeaponAmmo = 1 end
        game:GetService('Players').LocalPlayer.PlayerGui.GUI.Client.LegacyLocalVariables.ammocount.Value = WeaponAmmo
        game:GetService('Players').LocalPlayer.PlayerGui.GUI.Client.LegacyLocalVariables.ammocount2.Value = WeaponAmmo
        game:GetService('Players').LocalPlayer.PlayerGui.GUI.Client.LegacyLocalVariables.ammocount3.Value = WeaponAmmo
        game:GetService('Players').LocalPlayer.PlayerGui.GUI.Client.LegacyLocalVariables.ammocount4.Value = WeaponAmmo
        game:GetService('Players').LocalPlayer.PlayerGui.GUI.Client.LegacyLocalVariables.ammocount5.Value = WeaponAmmo
    end
end

local function rotationy(cframe)
    local x, y, z = cframe:ToOrientation()
    return CFrame.new(cframe.Position) * CFrame.Angles(0,y,0)
end

local speed2 = 1
local function bunnyhop(enabled, speed)
    local speed3 = speed
    if enabled and LocalPlayer and LocalPlayer.Character then
        if game:GetService('Players').LocalPlayer.Character.HumanoidRootPart:FindFirstChild('5a7OsGIFapg5ReEUeqUi1uNa6fiWsFiI') then
            game:GetService('Players').LocalPlayer.Character.HumanoidRootPart['5a7OsGIFapg5ReEUeqUi1uNa6fiWsFiI']:Destroy()
        end
        local Velocity = Instance.new('BodyVelocity')
        Velocity.Name = '5a7OsGIFapg5ReEUeqUi1uNa6fiWsFiI'
        Velocity.MaxForce = Vector3.new(math.huge, 0, math.huge)

        if game:GetService("UserInputService"):IsKeyDown('Space') then
            if game:GetService('Players').LocalPlayer.Character.HumanoidRootPart:FindFirstChild('BodyVelocity') then
                game:GetService('Players').LocalPlayer.Character.HumanoidRootPart.BodyVelocity.Parent = game:GetService('ReplicatedStorage'):FindFirstChild('Medic')
            end
            local Direction = 0

            if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.W) then Direction = 0 end
            if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.A) then Direction = 90 end
            if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.S) then Direction = 180 end
            if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.D) then Direction = 270 end
            if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.A) and game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.W) then Direction = 45 end
            if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.D) and game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.W) then Direction = 315 end
            if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.D) and game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.S) then Direction = 225 end
            if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.A) and game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.S) then Direction = 145 end

            local Rotation = rotationy(game:GetService('Workspace').CurrentCamera.CFrame) * CFrame.Angles(0, math.rad(Direction), 0)
            Velocity.Parent = LocalPlayer.Character.HumanoidRootPart
            LocalPlayer.Character.Humanoid.Jump = true

            if Toggles.directionalacceleration.Value then
                if speed2 < Options.directionalaccelerationcap.Value then
                    speed2 = speed2 + 0.001
                    speed3 = speed * speed2
                else
                    speed3 = speed * speed2
                end
            end                       

            Velocity.Velocity = Vector3.new(Rotation.LookVector.X, 0, Rotation.LookVector.Z) * speed3
            if Direction == 0 and not game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.W) then
                Velocity:Destroy()
            end
        else
            if not game:GetService('Players').LocalPlayer.Character.HumanoidRootPart:FindFirstChild('BodyVelocity') then
                game:GetService('ReplicatedStorage'):FindFirstChild('Medic'):FindFirstChild('BodyVelocity').Parent = game:GetService('Players').LocalPlayer.Character.HumanoidRootPart
            end
            speed2 = 1
        end
    elseif not enabled and LocalPlayer and LocalPlayer.Character then
        if game:GetService('Players').LocalPlayer.Character.HumanoidRootPart:FindFirstChild('5a7OsGIFapg5ReEUeqUi1uNa6fiWsFiI') then
            game:GetService('Players').LocalPlayer.Character.HumanoidRootPart['5a7OsGIFapg5ReEUeqUi1uNa6fiWsFiI']:Destroy()
        end
        if not game:GetService('Players').LocalPlayer.Character.HumanoidRootPart:FindFirstChild('BodyVelocity') then
            game:GetService('ReplicatedStorage'):FindFirstChild('Medic'):FindFirstChild('BodyVelocity').Parent = game:GetService('Players').LocalPlayer.Character.HumanoidRootPart
        end
    end
end

local function applyskin(weapon, skin)
    if weapon == 'Lupara DB' and LocalPlayer.Character:GetAttribute("EquippedWeapon") == 'DB Shotgun' then
        if skin == 'Australium' then
            if game:GetService('Workspace'):FindFirstChild('Camera') and game:GetService('Workspace'):FindFirstChild('Camera'):FindFirstChild('Arms') then
                viewmodel = game:GetService('Workspace'):FindFirstChild('Camera'):FindFirstChild('Arms')
                if viewmodel:FindFirstChild('Base') and viewmodel:FindFirstChild('Base').Color == Color3.fromRGB(80, 79, 81) then
                    viewmodel.Base.Color = Color3.fromRGB(200, 150, 0)
                end
                if viewmodel:FindFirstChild('Screw') and viewmodel:FindFirstChild('Screw').Color == Color3.fromRGB(116, 116, 118) then
                    viewmodel.Screw.Color = Color3.fromRGB(140, 84, 6)
                end
                if viewmodel:FindFirstChild('SlideBone') then
                    for i,v in pairs(viewmodel:FindFirstChild('SlideBone'):GetChildren()) do
                        if v:IsA('MeshPart') and v.Name == 'barrel' and v.Color == Color3.fromRGB(80, 79, 81) then
                            v.Color = Color3.fromRGB(200, 150, 0)
                        end
                    end
                end
                if viewmodel:FindFirstChild('Thatthingonthebackbone') then
                    for i,v in pairs(viewmodel:FindFirstChild('Thatthingonthebackbone'):GetChildren()) do
                        if v:IsA('MeshPart') and v.Name == 'f' and v.Color == Color3.fromRGB(80, 79, 81) then
                            v.Color = Color3.fromRGB(140, 84, 6)
                        end
                    end
                end
            end
        end
        if skin == 'none' then
            if game:GetService('Workspace'):FindFirstChild('Camera') and game:GetService('Workspace'):FindFirstChild('Camera'):FindFirstChild('Arms') then
                viewmodel = game:GetService('Workspace'):FindFirstChild('Camera'):FindFirstChild('Arms')
                if viewmodel:FindFirstChild('Base') and viewmodel:FindFirstChild('Base').Color == Color3.fromRGB(200, 150, 0) then
                    viewmodel.Base.Color = Color3.fromRGB(80, 79, 81)
                end
                if viewmodel:FindFirstChild('Screw') and viewmodel:FindFirstChild('Screw').Color == Color3.fromRGB(140, 84, 6) then
                    viewmodel.Screw.Color = Color3.fromRGB(116, 116, 118)
                end
                if viewmodel:FindFirstChild('SlideBone') then
                    for i,v in pairs(viewmodel:FindFirstChild('SlideBone'):GetChildren()) do
                        if v:IsA('MeshPart') and v.Name == 'barrel' and v.Color == Color3.fromRGB(200, 150, 0) then
                            v.Color = Color3.fromRGB(80, 79, 81)
                        end
                    end
                end
                if viewmodel:FindFirstChild('Thatthingonthebackbone') then
                    for i,v in pairs(viewmodel:FindFirstChild('Thatthingonthebackbone'):GetChildren()) do
                        if v:IsA('MeshPart') and v.Name == 'f' and v.Color == Color3.fromRGB(140, 84, 6) then
                            v.Color = Color3.fromRGB(80, 79, 81)
                        end
                    end
                end
            end
        end
    end
    if weapon == 'Revolver' and LocalPlayer.Character:GetAttribute("EquippedWeapon") == 'Revolver' then
        if skin == 'Australium' then
            if game:GetService('Workspace'):FindFirstChild('Camera') and game:GetService('Workspace'):FindFirstChild('Camera'):FindFirstChild('Arms') then
                viewmodel = game:GetService('Workspace'):FindFirstChild('Camera'):FindFirstChild('Arms')
                for i,v in pairs(viewmodel:GetDescendants()) do
                    if v.Name == 'Cylinder' and v:IsA('MeshPart') then
                        v.Color = Color3.fromRGB(200, 150, 0)
                    end
                    if v.Name == 'Hammer' and v:IsA('MeshPart') then
                        v.Color = Color3.fromRGB(140, 84, 6)
                    end
                    if v.Name == 'Part' and v:IsA('MeshPart') then
                        v.Color = Color3.fromRGB(200, 150, 0)
                    end
                    if v.Name == 'Screws' and v:IsA('MeshPart') then
                        v.Color = Color3.fromRGB(140, 84, 6)
                    end
                    if v.Name == 'Secondary' and v:IsA('MeshPart') then
                        v.Color = Color3.fromRGB(200, 150, 0)
                    end
                    if v.Name == 'Flash' and v:IsA('Attachment') and v:FindFirstChild('bzzbarrel') then
                        v:FindFirstChild('bzzbarrel'):Destroy()
                    end
                    if v.Name == 'Part' and v:IsA('MeshPart') and v:FindFirstChild('bzzz') and v:FindFirstChild('glow') and v:FindFirstChild('shinythings2') then
                        v:FindFirstChild('bzzz'):Destroy()
                        v:FindFirstChild('glow'):Destroy()
                        v:FindFirstChild('shinythings2'):Destroy()
                    end
                end
            end
        end
        if skin == 'Fittanium' then
            if game:GetService('Workspace'):FindFirstChild('Camera') and game:GetService('Workspace'):FindFirstChild('Camera'):FindFirstChild('Arms') then
                viewmodel = game:GetService('Workspace'):FindFirstChild('Camera'):FindFirstChild('Arms')
                for i,v in pairs(viewmodel:GetDescendants()) do
                    if v.Name == 'Cylinder' and v:IsA('MeshPart') then
                        v.Color = Color3.fromRGB(124, 84, 187)
                        v.Material = Enum.Material.Glass
                    end
                    if v.Name == 'Hammer' and v:IsA('MeshPart') then
                        v.Color = Color3.fromRGB(86, 57, 130)
                        v.Material = Enum.Material.Glass
                    end
                    if v.Name == 'Part' and v:IsA('MeshPart') then
                        v.Color = Color3.fromRGB(124, 84, 187)
                        v.Material = Enum.Material.Glass
                    end
                    if v.Name == 'Screws' and v:IsA('MeshPart') then
                        v.Color = Color3.fromRGB(86, 57, 130)
                        v.Material = Enum.Material.Glass
                    end
                    if v.Name == 'Secondary' and v:IsA('MeshPart') then
                        v.Color = Color3.fromRGB(124, 84, 187)
                        v.Material = Enum.Material.Glass
                    end
                    if game:GetService('ReplicatedStorage'):FindFirstChild('Other'):FindFirstChild('fittanium_barrel') and v.Name == 'Flash' and v:IsA('Attachment') and not v:FindFirstChild('bzzbarrel') then
                        local bzzbarrel = game:GetService('ReplicatedStorage'):FindFirstChild('Other'):FindFirstChild('fittanium_barrel'):FindFirstChild('Attachment'):FindFirstChild('bzzbarrel'):Clone(); bzzbarrel.Parent, bzzbarrel.Rate = v, 5
                    end
                    if game:GetService('ReplicatedStorage'):FindFirstChild('Other'):FindFirstChild('fittanium_fx') and v.Name == 'Part' and v:IsA('MeshPart') and (not v:FindFirstChild('bzzz') and not v:FindFirstChild('glow') and not v:FindFirstChild('shinythings2')) then
                        local bzzz = game:GetService('ReplicatedStorage'):FindFirstChild('Other'):FindFirstChild('fittanium_fx'):FindFirstChild('bzzz'):Clone(); bzzz.Parent, bzzz.Rate = v, 5
                        local glow = game:GetService('ReplicatedStorage'):FindFirstChild('Other'):FindFirstChild('fittanium_fx'):FindFirstChild('glow'):Clone(); glow.Parent, glow.Rate = v, 5
                        local shinythings2 = game:GetService('ReplicatedStorage'):FindFirstChild('Other'):FindFirstChild('fittanium_fx'):FindFirstChild('shinythings2'):Clone(); shinythings2.Parent, shinythings2.Rate = v, 5
                    end
                end
            end
        end
        if skin == 'none' then
            if game:GetService('Workspace'):FindFirstChild('Camera') and game:GetService('Workspace'):FindFirstChild('Camera'):FindFirstChild('Arms') then
                viewmodel = game:GetService('Workspace'):FindFirstChild('Camera'):FindFirstChild('Arms')
                for i,v in pairs(viewmodel:GetDescendants()) do
                    if v.Name == 'Cylinder' and v:IsA('MeshPart') and (v.Color == Color3.fromRGB(200, 150, 0) or v.Color == Color3.fromRGB(124, 84, 187)) then
                        v.Color = Color3.fromRGB(143, 146, 152)
                    end
                    if v.Name == 'Hammer' and v:IsA('MeshPart') and (v.Color == Color3.fromRGB(140, 84, 6) or v.Color == Color3.fromRGB(86, 57, 130)) then
                        v.Color = Color3.fromRGB(123, 126, 131)
                    end
                    if v.Name == 'Part' and v:IsA('MeshPart') and (v.Color == Color3.fromRGB(200, 150, 0) or v.Color == Color3.fromRGB(124, 84, 187)) then
                        v.Color = Color3.fromRGB(143, 146, 152)
                    end
                    if v.Name == 'Screws' and v:IsA('MeshPart') and (v.Color == Color3.fromRGB(140, 84, 6) or v.Color == Color3.fromRGB(86, 57, 130)) then
                        v.Color = Color3.fromRGB(85, 90, 95)
                    end
                    if v.Name == 'Secondary' and v:IsA('MeshPart') and (v.Color == Color3.fromRGB(200, 150, 0) or v.Color == Color3.fromRGB(124, 84, 187)) then
                        v.Color = Color3.fromRGB(123, 126, 131)
                    end
                    if v.Name == 'Flash' and v:IsA('Attachment') and v:FindFirstChild('bzzbarrel') then
                        v:FindFirstChild('bzzbarrel'):Destroy()
                    end
                    if v.Name == 'Part' and v:IsA('MeshPart') and v:FindFirstChild('bzzz') and v:FindFirstChild('glow') and v:FindFirstChild('shinythings2') then
                        v:FindFirstChild('bzzz'):Destroy()
                        v:FindFirstChild('glow'):Destroy()
                        v:FindFirstChild('shinythings2'):Destroy()
                    end
                end
            end
        end
    end
end

spawn(function()
    game:GetService("RunService").RenderStepped:Connect(function()
        if Library.Unloaded then return end
        setkeybindindicatorposition(Options.KeybindPositionX.Value, Options.KeybindPositionY.Value)
        setwatermarkposition(Options.WatermarkPositionX.Value, Options.WatermarkPositionY.Value)

        if Options.PrimarySelection.Value == 'Lupara DB' then
            Options.SkinSelectionPrimary:SetValues({'none', 'Australium'})
        elseif Options.PrimarySelection.Value == 'Revolver' then
            Options.SkinSelectionPrimary:SetValues({'none', 'Australium', 'Fittanium'})
        else
            Options.SkinSelectionPrimary:SetValues({'none'})
        end

        if game.Lighting.Technology ~= Enum.Technology[Options.LightingTechnology.Value] then
            game.Lighting.Technology = Enum.Technology[Options.LightingTechnology.Value]
        end

        if Toggles.ViewmodelOffset.Value then
            if game:GetService('Workspace'):FindFirstChild("Camera") and game:GetService('Workspace'):FindFirstChild("Camera"):FindFirstChild("Arms") then
                if not game:GetService('Workspace'):FindFirstChild("Camera"):FindFirstChild("Arms"):FindFirstChild("Offset") then
                    local offset = Instance.new("Vector3Value")
                    offset.Parent = game:GetService('Workspace'):FindFirstChild("Camera"):FindFirstChild("Arms")
                    offset.Name = "Offset"
                    offset.Value = Vector3.new(Options.ViewmodelOffsetX.Value,Options.ViewmodelOffsetY.Value,Options.ViewmodelOffsetZ.Value)
                else
                    game:GetService('Workspace'):FindFirstChild("Camera"):FindFirstChild("Arms"):FindFirstChild("Offset").Value = Vector3.new(Options.ViewmodelOffsetX.Value,Options.ViewmodelOffsetY.Value,Options.ViewmodelOffsetZ.Value)
                end
            end
        end

        if game:GetService('ReplicatedStorage'):FindFirstChild("VIPSettings") and game:GetService('ReplicatedStorage'):FindFirstChild("VIPSettings"):FindFirstChild("SpeedDemon") and game:GetService('ReplicatedStorage'):FindFirstChild("VIPSettings"):FindFirstChild("SpeedDemon") ~= Toggles.bunnyhop.Value then
            game:GetService('ReplicatedStorage'):FindFirstChild("VIPSettings"):FindFirstChild("SpeedDemon").Value = Toggles.bunnyhop.Value
        end

        if Toggles.bunnyhop.Value and Options.bunnyhopautostrafe.Value == 'Directional' and LocalPlayer:FindFirstChild('Status') and LocalPlayer:FindFirstChild('Status'):FindFirstChild('Class') and LocalPlayer:FindFirstChild('Status'):FindFirstChild('Class').Value and LocalPlayer:FindFirstChild('Status'):FindFirstChild('Class').Value ~= '' then
            if Toggles.bunnyhopcustomspeed.Value then
                bunnyhop(true, Options.bunnyhopspeed.Value)
            else
                bunnyhop(true, game:GetService('ReplicatedStorage'):FindFirstChild('ClassInfo')[LocalPlayer:FindFirstChild('Status'):FindFirstChild('Class').Value].WalkSpeed.Value/16)
            end
        else
            bunnyhop(false, 0)
        end

        if Toggles.infiniteammo.Value then
            infammo()
        end

        if Toggles.thirdperson.Value then
            thirdperson()
        else
            unthirdperson()
        end

        if Toggles.freebuildings.Value then
            freebuildings()
        else
            normalpricebuildings()
        end

        if Toggles.setspread.Value then
            game:GetService('Players').LocalPlayer.PlayerGui.GUI.Client.LegacyLocalVariables.currentspread.Value = Options.spreadamount.Value
        end

        if Toggles.autoairblast.Value then
            automaticairblast()
        end

        if Toggles.HeadHitboxExpand.Value or Toggles.HitboxExpand.Value then
            hitboxexpand()
        else
            unhitboxexpand()
        end

        if SpawnSentry then
            SpawnSentry = false
            spawnbuilding(LocalPlayer.Character.LowerTorso.CFrame + Vector3.new(0, -2, 0), 'Sentry', Options.SentryLevel.Value)
        end

        if SpawnDispenser then
            SpawnDispenser = false
            spawnbuilding(LocalPlayer.Character.LowerTorso.CFrame + Vector3.new(0, -2, 0), 'Dispenser', Options.SentryLevel.Value)
        end

        if SpawnEntrance then
            SpawnEntrance = false
            spawnbuilding(LocalPlayer.Character.LowerTorso.CFrame + Vector3.new(0, -2, 0), 'Teleporter Entrance', Options.SentryLevel.Value)
        end

        if SpawnExit then
            SpawnExit = false
            spawnbuilding(LocalPlayer.Character.LowerTorso.CFrame + Vector3.new(0, -2, 0), 'Teleporter Exit', Options.SentryLevel.Value)
        end

        if Toggles.instantrespawn.Value then
            instantrespawn()
        end

        if Toggles.walkspeedmod.Value then
            speedchanger(LocalPlayer:FindFirstChild('Status'):FindFirstChild('Class').Value, Options.walkspeed.Value)
        else
            local Class = LocalPlayer:FindFirstChild('Status'):FindFirstChild('Class').Value
            local Speed = 288
            if Class == 'Agent' or Class == 'Assault' or Class == 'Doctor' then
                Speed = 320
            elseif Class == 'Flanker' then
                Speed = 400
            elseif Class == 'Brute' then
                Speed = 230
            elseif Class == 'Trooper' then
                Speed = 240
            elseif Class == 'Annihilator' then
                Speed = 280
            elseif Class == 'Arsonist' or Class == 'Mechanic' or class == 'Marksman' then
                Speed = 300
            end
            speedchanger(Class, Speed/16)
        end

        if Toggles.NoScope.Value then
            nosniperscope(false)
        else
            nosniperscope(true)
        end

        if Toggles.healwhenlow.Value then
            healbotsaveself()
        end

        if Toggles.healaura.Value then
            healaura()
        end

        if Toggles.autodetonate.Value then
            automaticdetonate()
        end

        if Options.PrimarySelection.Value == 'Lupara DB' and LocalPlayer.Character:GetAttribute("EquippedWeapon") == 'DB Shotgun' then
            applyskin('Lupara DB', Options.SkinSelectionPrimary.Value)
        end
        if Options.PrimarySelection.Value == 'Revolver' and LocalPlayer.Character:GetAttribute("EquippedWeapon") == 'Revolver' then
            applyskin('Revolver', Options.SkinSelectionPrimary.Value)
        end
    end)
end)

local function clamp(a, lowerNum, higher)
	if a > higher then
		return higher
	elseif a < lowerNum then
		return lowerNum
	else
		return a
	end
end

function calcHitChance(Percentage)
    Percentage = math.floor(Percentage)
    local chance = math.floor(Random.new().NextNumber(Random.new(), 0, 1) * 100) / 100
    return chance <= Percentage / 100
end

local function AimVisCheck(Player)
    local RaycastParams = RaycastParams.new()
    RaycastParams.FilterDescendantsInstances = {Player.Character, LocalPlayer.Character, workspace.CurrentCamera, workspace.Camera}
    RaycastParams.FilterType = Enum.RaycastFilterType.Exclude
    local WeaponRange = game:GetService('ReplicatedStorage').Weapons[LocalPlayer.Character:GetAttribute("EquippedWeapon")].Range.Value

    local Origin = workspace.CurrentCamera.CFrame.Position
    local Direction = Player.Character.Head.Position

    local Raycast = workspace:Raycast(Origin, Direction - Origin, RaycastParams)

    return not Raycast and (Origin - Direction).Magnitude < 5000
end

local function VisualVisCheckSimple(Player)
    local RaycastParams = RaycastParams.new()
    RaycastParams.FilterDescendantsInstances = {Player.Character, LocalPlayer.Character, workspace.CurrentCamera, workspace.Camera}
    RaycastParams.FilterType = Enum.RaycastFilterType.Exclude

    local Origin = workspace.CurrentCamera.CFrame.Position
    local Direction = Player.Character.Head.Position

    local Raycast = workspace:Raycast(Origin, Direction - Origin, RaycastParams)

    return not Raycast
end

local function VisualVisCheck(Player)
    local RaycastParams = RaycastParams.new()
    RaycastParams.FilterDescendantsInstances = {Player.Character, LocalPlayer.Character, workspace.CurrentCamera, workspace.Camera}
    RaycastParams.FilterType = Enum.RaycastFilterType.Exclude

    local Origin = workspace.CurrentCamera.CFrame.Position
    local limbs = {Player.Character.Head, Player.Character.UpperTorso, Player.Character.LowerTorso, Player.Character.RightUpperArm, Player.Character.RightLowerArm, Player.Character.RightHand, Player.Character.LeftUpperArm, Player.Character.LeftLowerArm, Player.Character.LeftHand, Player.Character.RightUpperLeg, Player.Character.RightLowerLeg, Player.Character.RightFoot, Player.Character.LeftUpperLeg, Player.Character.LeftLowerLeg, Player.Character.LeftFoot}

    for _, Limb in ipairs(limbs) do
        local Direction = Limb.Position
        local Raycast = workspace:Raycast(Origin, Direction - Origin, RaycastParams)
        if not Raycast then
            return true
        end
    end
    return false
end

function getClosestPlayer()
    mouseLocation = UserInputService:GetMouseLocation()
    local Distance, closestChar, plr_pos, OnScreen = 1000, nil, nil, nil
    local plrPart = Options.AimPart.Value
    local chance = calcHitChance(100)
    local partsList = {"Head", "UpperTorso", "LowerTorso"}
    local fovValue = Options.AimbotFOV.Value * 10

    if plrPart == "Random" then
        plrPart = partsList[math.random(1, #partsList)]
    end

    for i,v in next, Players:GetPlayers() do
        local base = v.Character
        if base and v ~= LocalPlayer and v.Team ~= LocalPlayer.Team and base:FindFirstChild(plrPart) then
            local Health = base.Humanoid.Health
            if Health > 0 and chance then
                plr_pos, OnScreen = Camera:worldToViewportPoint(base[plrPart].Position)
                if OnScreen then
                    local mag = (Vector2.new(mouseLocation.X, mouseLocation.Y) - Vector2.new(plr_pos.X, plr_pos.Y)).Magnitude
                    if mag < Distance and mag <= fovValue then
                        Distance = mag
                        closestChar = v
                    end
                end
            end
        end
    end

    if closestChar then
        plr_pos = Camera:worldToViewportPoint(closestChar.Character[plrPart].Position)
    end
    
    return closestChar, plrPart, plr_pos
end


local function getPositionOnScreen(Vector)
    local Vec3, OnScreen = WorldToScreen(Camera, Vector)
    return Vector2.new(Vec3.X, Vec3.Y), OnScreen
end

local function ValidateArguments(Args, RayMethod)
    local Matches = 0
    if #Args < RayMethod.ArgCountRequired then
        return false
    end
    for Pos, Argument in next, Args do
        if typeof(Argument) == RayMethod.Args[Pos] then
            Matches = Matches + 1
        end
    end
    return Matches >= RayMethod.ArgCountRequired
end

local function getDirection(Origin, Position)
    return (Position - Origin).Unit * 1000
end

local function getMousePosition()
    return GetMouseLocation(UserInputService)
end

function Visuals(Player)

    if (Player == LocalPlayer) then
        return
    end

    -- Bounding Boxes
    local fillBox = Drawing.new("Square")
    fillBox.Visible = false
    fillBox.Color = Color3.new(255,255,255)
    fillBox.Thickness = 0.1
    fillBox.Transparency = 0.5
    fillBox.Filled = true

    local outlineBox = Drawing.new("Square")
    outlineBox.Visible = false
    outlineBox.Color = Color3.new(0, 0, 0)
    outlineBox.Thickness = 1.4
    outlineBox.Transparency = 1
    outlineBox.Filled = false
    
    local box = Drawing.new("Square")
    box.Visible = false
    box.Color = Color3.new(255,255,255)
    box.Thickness = 0.7
    box.Transparency = 1
    box.Filled = false

    -- Healthbar Outline
    local healthOutlineBox = Drawing.new("Square")
    healthOutlineBox.Visible = false
    healthOutlineBox.Color = Color3.new(0, 0, 0)
    healthOutlineBox.Thickness = 3
    healthOutlineBox.Transparency = 1
    healthOutlineBox.Filled = true
    
    -- Healthbar
    local healthBarBox = Drawing.new("Square")
    healthBarBox.Visible = false
    healthBarBox.Color = Color3.new(255,255,255)
    healthBarBox.Thickness = 1
    healthBarBox.Transparency = 1
    healthBarBox.Filled = true
    
    -- Snaplines
    local snapLine = Drawing.new("Line")
    snapLine.Visible =  false
    snapLine.Thickness = 1
    snapLine.Color = Color3.new(255,255,255)
    
    -- Name ESP
    local nameText = Drawing.new("Text")
    nameText.Visible = false
    nameText.Center = true
    nameText.Outline = true
    nameText.Font = 3
    nameText.Size = 13
    nameText.Color = Color3.new(255,255,255)
        
    -- Distance ESP
    local distanceText = Drawing.new("Text")
    distanceText.Visible = false
    distanceText.Center = true
    distanceText.Outline = true
    distanceText.Font = 3
    distanceText.Size = 13
    distanceText.Color = Color3.new(255,255,255)

    -- Class ESP
    local classText = Drawing.new("Text")
    classText.Visible = false
    classText.Center = true
    classText.Outline = true
    classText.Font = 3
    classText.Size = 13
    classText.Color = Color3.new(255,255,255)

    -- Weapon ESP
    local weaponText = Drawing.new("Text")
    weaponText.Visible = false
    weaponText.Center = true
    weaponText.Outline = true
    weaponText.Font = 3
    weaponText.Size = 13
    weaponText.Color = Color3.new(255,255,255)

    RunService:BindToRenderStep(Player.Name .. "Esp", 1, function()

        -- if Player ~= nil and Player.Team ~= LocalPlayer.Team then
        if Player ~= nil and Player.Character ~= nil and Player.Character:FindFirstChild('Humanoid') and (not Options.Ignore.Value["Friendly"] or Player.Team ~= LocalPlayer.Team) and (not Options.Ignore.Value["Enemy"] or Player.Team == LocalPlayer.Team) then
            local plrClass = Player:FindFirstChild('Status'):FindFirstChild('Class').Value or "Spectator"
            local plrWeapon = Player.Character:GetAttribute("EquippedWeapon") or "None"
            local base = Player.Character
            local Head = base.Head
            local Health = base.Humanoid.Health
            local MaxHealth = base.Humanoid.MaxHealth
            local Root = base.HumanoidRootPart
            local Font = 3
                
            if Options.HealthBarColor.Value == Color3.fromRGB(255,255,255) then
                healthBarBox.Color = Color3.fromRGB(255 - 255 / (MaxHealth / Health), 255 / (MaxHealth / Health), 0)
            else
                healthBarBox.Color = Options.HealthBarColor.Value
            end

            if Options.EspFont.Value == 'UI' then
                Font = 0
            elseif Options.EspFont.Value == 'System' then
                Font = 1
            elseif Options.EspFont.Value == 'Plex' then
                Font = 2
            elseif Options.EspFont.Value == 'Monospace' then
                Font = 3
            end

            if (base and Head and Root and Health > 0) then
                
                local Cam = Camera.CFrame
                local Torso = Root.CFrame

                local top, top_isrendered = workspace.CurrentCamera:worldToViewportPoint(Head.Position + (Torso.UpVector * 0.025) + Cam.UpVector)
                local bottom, bottom_isrendered = workspace.CurrentCamera:worldToViewportPoint(Torso.Position - (Torso.UpVector * 2.05) - Cam.UpVector)
        
                local minY = math.abs(bottom.y - top.y)
                local sizeX = math.ceil(math.max(clamp(math.abs(bottom.x - top.x) * 2.7, 0, minY), minY / 2, 3))
                local sizeY = math.ceil(math.max(minY, sizeX * 0.5, 3))

                if Player.Team == LocalPlayer.Team then
                    if Toggles.BoxTeamCheck.Value then
                        box.Color = Options.FriendlyBoundingBoxColor.Value
                    else
                        box.Color = Options.BoundingBoxDefaultColor.Value
                    end
                else
                    if Toggles.BoxTeamCheck.Value then
                        box.Color = Options.BoundingBoxColor.Value
                    else
                        box.Color = Options.BoundingBoxDefaultColor.Value
                    end
                end

                if Player.Team == LocalPlayer.Team then
                    if Toggles.BoxTeamCheck.Value then
                        fillBox.Color = Options.FriendlyBoundingBoxColor.Value
                    else
                        fillBox.Color = Options.BoundingBoxDefaultColor.Value
                    end
                else
                    if Toggles.BoxTeamCheck.Value then
                        fillBox.Color = Options.BoundingBoxColor.Value
                    else
                        fillBox.Color = Options.BoundingBoxDefaultColor.Value
                    end
                end
                
                if top_isrendered or bottom_isrendered then
        
                    local boxtop = Vector2.new(
                        math.floor(top.x * 0.5 + bottom.x * 0.5 - sizeX * 0.5),
                        math.floor(math.min(top.y, bottom.y))
                    )
    
                    local boxsize = { w = sizeX, h = sizeY }
    
                    -- Boxes
                    fillBox.Position = Vector2.new(boxtop.x, boxtop.y)
                    fillBox.Size = Vector2.new(boxsize.w, boxsize.h)
                    fillBox.Transparency = Options.BoxFillTransparency.Value
                    fillBox.Thickness = 0.1

                    outlineBox.Position = Vector2.new(boxtop.x, boxtop.y)
                    outlineBox.Size = Vector2.new(boxsize.w, boxsize.h)
                    outlineBox.Thickness = 1.4
    
                    box.Position = Vector2.new(boxtop.x, boxtop.y)
                    box.Size = Vector2.new(boxsize.w, boxsize.h)
                    box.Thickness = 0.7
    
                    -- Boxes
                    if Toggles.BoundingBox.Value then
                        box.Visible = true
                        outlineBox.Visible = true
                    else
                        box.Visible = false
                        outlineBox.Visible = false
                    end

                    if Toggles.BoundingBox.Value and Toggles.BoundingBox.Value then
                        fillBox.Visible = true
                    else
                        fillBox.Visible = false
                    end

                    -- Health Bar
                    if Toggles.HealthBar.Value then
                        local ySizeBar = -math.floor(boxsize.h * Health / MaxHealth)
                        healthOutlineBox.Position = Vector2.new(boxtop.x - 7, boxtop.y - 1)
                        healthOutlineBox.Size = Vector2.new(3.35, boxsize.h + 3)

                        healthBarBox.Position = Vector2.new(boxtop.x - 6, boxtop.y + boxsize.h)
                        healthBarBox.Size = Vector2.new(1.35, ySizeBar)

                        healthBarBox.Visible = true
                        healthOutlineBox.Visible = true
                    else
                        healthBarBox.Visible = false
                        healthOutlineBox.Visible = false
                    end

                    -- Distance
                    if Toggles.Distance.Value then
                        if Toggles.Class.Value and Toggles.Weapon.Value then
                            distanceText.Position = Vector2.new(math.floor(boxtop.x + boxsize.w * 0.5), boxtop.y + boxsize.h + 26)
                        elseif Toggles.Class.Value and not Toggles.Weapon.Value then
                            distanceText.Position = Vector2.new(math.floor(boxtop.x + boxsize.w * 0.5), boxtop.y + boxsize.h + 13)
                        elseif not Toggles.Class.Value and Toggles.Weapon.Value then
                            distanceText.Position = Vector2.new(math.floor(boxtop.x + boxsize.w * 0.5), boxtop.y + boxsize.h + 13)
                        elseif not Toggles.Class.Value and not Toggles.Weapon.Value then --// Pretty sure this could just be an else but im too lazy to actually test it (even though it takes like 20 seconds)
                            distanceText.Position = Vector2.new(math.floor(boxtop.x + boxsize.w * 0.5), boxtop.y + boxsize.h + 1)
                        end
                        distanceText.Text = tostring("[" .. math.ceil((Root.Position - Camera.CFrame.Position).magnitude) .. "]")
                        distanceText.Visible = true
                        distanceText.Font = Font
                    else
                        distanceText.Visible = false
                    end

                    -- Name
                    if Toggles.Names.Value then
                        nameText.Text = tostring(Player.Name)
                        nameText.Position = (Vector2.new(math.floor(boxtop.x + boxsize.w * 0.5), math.floor(boxtop.y - 15)) or Vector2.new(math.floor(boxtop.x + boxsize.w * 0.5), math.floor(boxtop.y - 4)))
                        nameText.Visible = true
                        nameText.Font = Font
                    else
                        nameText.Visible = false
                    end

                    -- Class
                    if Toggles.Class.Value then
                        if Toggles.Weapon.Value then
                            classText.Position = Vector2.new(math.floor(boxtop.x + boxsize.w * 0.5), boxtop.y + boxsize.h + 13)
                        else
                            classText.Position = Vector2.new(math.floor(boxtop.x + boxsize.w * 0.5), boxtop.y + boxsize.h + 1)
                        end
                        classText.Text = tostring(plrClass) or "Spectator"
                        classText.Visible = true
                        classText.Font = Font
                    else
                        classText.Visible = false
                    end

                    -- Weapon
                    if Toggles.Weapon.Value then
                        weaponText.Text = tostring(plrWeapon) or "None"
                        weaponText.Position = Vector2.new(math.floor(boxtop.x + boxsize.w * 0.5), boxtop.y + boxsize.h + 1)
                        weaponText.Visible = true
                        weaponText.Font = Font
                    else
                        weaponText.Visible = false
                    end

                else
                    healthBarBox.Visible = false
                    healthOutlineBox.Visible = false
                    box.Visible = false
                    outlineBox.Visible = false
                    fillBox.Visible = false
                    distanceText.Visible = false
                    nameText.Visible = false
                    classText.Visible = false
                    weaponText.Visible = false
                end

                -- Chams
                if not Player.Character:FindFirstChild('G1bx6peW8Ni935JTEKeRN8e0Lxl0HMcJ') then
                    
                    local highlight = Instance.new("Highlight", Player.Character)
                    highlight.Parent = Player.Character
                    highlight.Name = 'G1bx6peW8Ni935JTEKeRN8e0Lxl0HMcJ'
                    highlight.FillColor = Color3.fromRGB(255, 0, 0)
                    highlight.OutlineColor = Color3.fromRGB(255, 0, 0)
                    if Toggles.Chams.Value then
                        highlight.Enabled = true
                    else
                        highlight.Enabled = false
                    end
                    if Toggles.ChamsDepthMode.Value then
                        highlight.DepthMode = 0
                    else
                        highlight.DepthMode = 1
                    end

                    highlight.FillTransparency = 0
                    highlight.OutlineTransparency = 0
                    --highlight.Adornee = Base
                end                

                if Player.Character:FindFirstChild('G1bx6peW8Ni935JTEKeRN8e0Lxl0HMcJ') then
                    if not Toggles.ChamsTeamCheck.Value then
                        Player.Character:FindFirstChild('G1bx6peW8Ni935JTEKeRN8e0Lxl0HMcJ').FillColor = Options.ChamsFillColor.Value
                        Player.Character:FindFirstChild('G1bx6peW8Ni935JTEKeRN8e0Lxl0HMcJ').OutlineColor = Options.ChamsOutlineColor.Value
                    else
                        if Player.Team ~= LocalPlayer.Team then
                            Player.Character:FindFirstChild('G1bx6peW8Ni935JTEKeRN8e0Lxl0HMcJ').FillColor = Options.EnemyChamsColor.Value
                            Player.Character:FindFirstChild('G1bx6peW8Ni935JTEKeRN8e0Lxl0HMcJ').OutlineColor = Options.EnemyChamsColor.Value
                        else
                            Player.Character:FindFirstChild('G1bx6peW8Ni935JTEKeRN8e0Lxl0HMcJ').FillColor = Options.FriendlyChamsColor.Value
                            Player.Character:FindFirstChild('G1bx6peW8Ni935JTEKeRN8e0Lxl0HMcJ').OutlineColor = Options.FriendlyChamsColor.Value
                        end
                    end
                    Player.Character:FindFirstChild('G1bx6peW8Ni935JTEKeRN8e0Lxl0HMcJ').FillTransparency = Options.ChamsFillTransparency.Value
                    Player.Character:FindFirstChild('G1bx6peW8Ni935JTEKeRN8e0Lxl0HMcJ').OutlineTransparency = Options.ChamsOutlineTransparency.Value
                    Player.Character:FindFirstChild('G1bx6peW8Ni935JTEKeRN8e0Lxl0HMcJ').Enabled = Toggles.Chams.Value
                    Player.Character:FindFirstChild('G1bx6peW8Ni935JTEKeRN8e0Lxl0HMcJ').DepthMode = Toggles.ChamsDepthMode.Value and 0 or 1
                    Player.Character:FindFirstChild('G1bx6peW8Ni935JTEKeRN8e0Lxl0HMcJ').Adornee = Player.Character
                end

                if base:FindFirstChild('LemonedHighlight') then
                    base:FindFirstChild('LemonedHighlight'):Destroy()
                end

                if base:FindFirstChild('HealHighlight') then
                    base:FindFirstChild('HealHighlight'):Destroy()
                end

                if base:FindFirstChild('MilkedHighlight') then
                    base:FindFirstChild('MilkedHighlight'):Destroy()
                end

                if base:FindFirstChild('SpawnHighlight') then
                    base:FindFirstChild('SpawnHighlight'):Destroy()
                end
                
                if workspace:FindFirstChild('Accoutrements') then
                    if workspace:FindFirstChild('Accoutrements'):FindFirstChild(Player.Name) then
                        if Player.Character:FindFirstChild(workspace:FindFirstChild('Accoutrements'):FindFirstChild(Player.Name).Name) then
                            Player.Character[workspace:FindFirstChild('Accoutrements'):FindFirstChild(Player.Name).Name]:Destroy()
                        end
                        workspace:FindFirstChild('Accoutrements'):FindFirstChild(Player.Name).Parent = Player.Character
                    end
                end

            else
                healthBarBox.Visible = false
                healthOutlineBox.Visible = false
                box.Visible = false
                fillBox.Visible = false
                outlineBox.Visible = false
                distanceText.Visible = false
                nameText.Visible = false
                classText.Visible = false
                weaponText.Visible = false
            end
        else
            healthBarBox.Visible = false
            healthOutlineBox.Visible = false
            box.Visible = false
            fillBox.Visible = false
            outlineBox.Visible = false
            distanceText.Visible = false
            nameText.Visible = false
            classText.Visible = false
            weaponText.Visible = false

            if Player.Character and Player.Character:FindFirstChild('G1bx6peW8Ni935JTEKeRN8e0Lxl0HMcJ') then
                Player.Character:FindFirstChild('G1bx6peW8Ni935JTEKeRN8e0Lxl0HMcJ'):Destroy()
            end
        end
    end)

    Players.PlayerRemoving:Connect(function(Player)

        box.Visible = false
        outlineBox.Visible = false
        fillBox.Visible = false
        healthBarBox.Visible = false
        healthOutlineBox.Visible = false
        distanceText.Visible = false
        nameText.Visible = false
        classText.Visible = false
        weaponText.Visible = false

        RunService:UnbindFromRenderStep(Player.Name .. "Esp")
    end)
end

for i,v in pairs(Players:GetPlayers()) do
    Visuals(v)
end

Players.PlayerAdded:Connect(function(Player)
    Visuals(Player)
end)

function Aimbot()
    
    task.spawn(function()
        while task.wait() do
            local state = Options.AimbotBind:GetState()
            if state then
                Toggles.AimbotToggle:SetValue(state)
                Toggles.AimbotToggle.Value = state
                aiming = true
            else
                Toggles.AimbotToggle:SetValue(false)
                Toggles.AimbotToggle.Value = false
                aiming = false
            end

            if Library.Unloaded then break end
        end
    end)

    local fovcircle = Drawing.new("Circle")
    fovcircle.Visible = Toggles.VisualizeFOVCircle.Value
    fovcircle.Radius = Options.AimbotFOV.Value * 10
    fovcircle.Color = Color3.new(255,255,255)
    fovcircle.Thickness = 1
    fovcircle.Filled = false

    RunService.RenderStepped:Connect(function()

        local mouseLocation = UserInputService:GetMouseLocation()
        fovcircle.Visible = Toggles.VisualizeFOVCircle.Value
        fovcircle.Radius = Options.AimbotFOV.Value * 10

        fovcircle.Position = Vector2.new(mouseLocation.X, mouseLocation.Y)
        fovcircle.Color = Color3.fromRGB(255,255,255)
        
        local horizontal = Options.Smoothing.Value
        local vertical = Options.Smoothing.Value

        if aiming and Toggles.AimbotToggle.Value == true then
            
            local closestPlr, plrPart, plrPos = getClosestPlayer()
            local visible = AimVisCheck(closestPlr)

            if Toggles.VisibleCheck.Value then
                if plrPos ~= nil and plrPart ~= nil and visible then
                    mousemoverel( (plrPos.X - mouseLocation.X) / horizontal, (plrPos.Y - mouseLocation.Y) / vertical)
                end
            else
                if plrPos ~= nil and plrPart ~= nil then
                    mousemoverel( (plrPos.X - mouseLocation.X) / horizontal, (plrPos.Y - mouseLocation.Y) / vertical)
                end
            end
        end
    end)
end

Aimbot()
Options.SaveManager_ConfigList:SetValues(SaveManager:RefreshConfigList()); Options.SaveManager_ConfigList:SetValue(nil)
print('[Red.Leaf] Loaded in ' .. tostring(string.format('%.2f', tick() - TimeToLoad)) .. 's')