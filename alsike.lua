-- // Load

local startupArgs = ({...})[1] or {}

if getgenv().library ~= nil then
    getgenv().library:Unload();
end

if not game:IsLoaded() then
    game.Loaded:Wait()
end

local function gs(a)
    return game:GetService(a)
end

local loads = tick()
local msize = 0
local tname = ""
local thealth = ""
local tdistance = ""

local cachedValues = {
    FlyToggle = false,
}

local aflags = {
    anigga = false,
    anigga2 = false,
    anigga3 = false
}

local messages = {
    "You just died to Alsike AI 🤣🤣🤣🤣💀💀",
    "Im legit bro!",
    "Alsike > all",
    "Seems like you died to me....💀💀💀💀💀💀",
    "Are you gay?",
    "Lets d8",
    "How ru after you died to me..🤣🤣🤣💀💀",
    "Seems like a skill issue tbh",
    "Are you mad now?",
    "Oh no im hacking!",
    "bro!! why u usin the hack!",
    "i go report for hack!",
    ".gg/uVWwHxqXgj"
}

for _ in pairs(messages) do 
    msize = msize + 1 
end

local FovCircle2 = Drawing.new("Circle")
FovCircle2.Visible = false
FovCircle2.Filled = false
FovCircle2.Thickness = 3

local FovCircle = Drawing.new("Circle")
FovCircle.Visible = false
FovCircle.Filled = false
FovCircle.Thickness = 1

-- // Variables
local Players, http, RunService, UserInputService, tweenService, stats, actionservice = gs('Players'), gs('HttpService'), gs('RunService'), gs('UserInputService'), gs('TweenService'), gs('Stats'), gs('ContextActionService')

local LocalPlayer = Players.LocalPlayer
local LocalMouse  = LocalPlayer:GetMouse()
local GameSettings = UserSettings():GetService("UserGameSettings")

local PLRDS = {}
local Ut = {}

Ut.Settings = {
    Line = {
        Thickness = 1,
        Color = Color3.fromRGB(0, 255, 0)
    },
    Text = {
        Size = 13,
        Center = true,
        Outline = true,
        Font = 2,
        Color = Color3.fromRGB(255, 255, 255)
    },
    Square = {
        Thickness = 1,
        Color = Color3.fromRGB(255, 255, 255),
        Filled = false,
    },
    Circle = {
        Filled = false,
        NumSides = 30,
        Thickness = 0,
    },
    Triangle = {
        Color = Color3.fromRGB(255, 255, 255),
        Filled = true,
        Visible = false,
        Thickness = 1,
    }
}

function Ut.New(data)
    local drawing = Drawing.new(data.type)
    for i, v in pairs(Ut.Settings[data.type]) do
        drawing[i] = v
    end
    if data.out then
        drawing.Color = Color3.new(0,0,0)
        drawing.Thickness = 3
    end
    return drawing
end

function isAlive(player)
    local alive = false
    if player ~= nil and player.Parent == game.Players and player.Character ~= nil then
        if player.Character:FindFirstChild("HumanoidRootPart") and player.Character:FindFirstChild("Humanoid") ~= nil and player.Character.Humanoid.Health > 0 and player.Character:FindFirstChild("Head") then
            alive = true
        end
    end
    return alive
end

function isTarget(plr, teammates)
	if isAlive(plr) then
		if not plr.Neutral and not LocalPlayer.Neutral then
			if teammates == false then
				return plr.Team ~= LocalPlayer.Team
			elseif teammates == true then
				return plr ~= LocalPlayer
			end
		else
			return plr ~= LocalPlayer
		end
	end
end

function Ut.Add(Player)
    if not PLRDS[Player] then
        PLRDS[Player] = {
            Offscreen = Ut.New({type = "Triangle"}),
            Name = Ut.New({type = "Text"}),
            Distance = Ut.New({type = "Text"}),
            BoxOutline = Ut.New({type = "Square", out = true}),
            Box = Ut.New({type = "Square"}),
            BoxFill = Ut.New({type = "Square"}),
            HealthOutline = Ut.New({type = "Line", out = true}),
            Health = Ut.New({type = "Line"}),
            HeadDot = Ut.New({type = "Circle"}),
            Tracers = Ut.New({type = "Line"}),
            Exit = Ut.New({type = "Text"}),
            FovTracers = Ut.New({type = "Line"}),
            Tool = Ut.New({type = "Text"}),
        }
    end
end

for _,Player in pairs(Players:GetPlayers()) do
    if Player ~= LocalPlayer then
        Ut.Add(Player)
    end
end

Players.PlayerAdded:Connect(Ut.Add)
Players.PlayerRemoving:Connect(function(Player)
    if PLRDS[Player] then
        for i,v in pairs(PLRDS[Player]) do
            if v then
                v:Remove()
            end
        end

        PLRDS[Player] = nil
    end
end)

local floor, ceil, huge, pi, clamp = math.floor, math.ceil, math.huge, math.pi, math.clamp
local c3new, fromrgb, fromhsv = Color3.new, Color3.fromRGB, Color3.fromHSV
local next, newInstance, newUDim2, newVector2 = next, Instance.new, UDim2.new, Vector2.new
local isexecutorclosure = isexecutorclosure or is_synapse_function or is_sirhurt_closure or iskrnlclosure;
local executor = (
    syn and 'syn' or
    getexecutorname and getexecutorname() or
    'unknown'
)

local library = {
    windows = {};
    indicators = {};
    flags = {};
    options = {};
    connections = {};
    drawings = {};
    instances = {};
    utility = {};
    notifications = {};
    tweens = {};
    theme = {};
    zindexOrder = {
        ['indicator'] = 950;
        ['window'] = 1000;
        ['dropdown'] = 1200;
        ['colorpicker'] = 1100;
        ['watermark'] = 1300;
        ['notification'] = 1400;
        ['cursor'] = 1500;
    },
    stats = {
        ['fps'] = 0;
        ['ping'] = 0;
    };
    images = {
        ['gradientp90'] = 'https://github.com/senpaioffice132/Octohook-Assets/blob/main/gradientp90.png?raw=true';
        ['gradientp45'] = 'https://github.com/senpaioffice132/Octohook-Assets/blob/main/gradientP45.png?raw=true';
        ['colorhue'] = 'https://github.com/senpaioffice132/Octohook-Assets/blob/main/hue.png?raw=true';
        ['colorsat1'] = 'https://github.com/senpaioffice132/Octohook-Assets/blob/main/colorsat1.png?raw=true';
        ['colorsat2'] = 'https://github.com/senpaioffice132/Octohook-Assets/blob/main/colorsat2.png?raw=true';
        ['colortrans'] = 'https://github.com/senpaioffice132/Octohook-Assets/blob/main/transparency.png?raw=true';
    };
    numberStrings = {['Zero'] = 0, ['One'] = 1, ['Two'] = 2, ['Three'] = 3, ['Four'] = 4, ['Five'] = 5, ['Six'] = 6, ['Seven'] = 7, ['Eight'] = 8, ['Nine'] = 9};
    signal = loadstring(game:HttpGet('https://raw.githubusercontent.com/senpaioffice132/Octohook-Assets/main/Signal.lua'))();
    open = false;
    opening = false;
    hasInit = false;
    cheatuser = "office";
    cheatname = startupArgs.cheatname or 'Alsike';
    cheatwatermarktext = "";
    gamename = startupArgs.gamename or 'universal';
    fileext = startupArgs.fileext or '.txt';
}

library.cheatwatermarktext = "Alsike | " ..library.cheatuser

library.themes = {
    {
        name = 'Default',
        theme = {
            ['Accent']                    = fromrgb(183, 166, 253);
            ['Background']                = fromrgb(18,18,18);
            ['Border']                    = fromrgb(0,0,0);
            ['Border 1']                  = fromrgb(60,60,60);
            ['Border 2']                  = fromrgb(35,35,35);
            ['Border 3']                  = fromrgb(10,10,10);
            ['Primary Text']              = fromrgb(235,235,235);
            ['Group Background']          = fromrgb(35,35,35);
            ['Selected Tab Background']   = fromrgb(35,35,35);
            ['Unselected Tab Background'] = fromrgb(18,18,18);
            ['Selected Tab Text']         = fromrgb(245,245,245);
            ['Unselected Tab Text']       = fromrgb(145,145,145);
            ['Section Background']        = fromrgb(18,18,18);
            ['Option Text 1']             = fromrgb(245,245,245);
            ['Option Text 2']             = fromrgb(195,195,195);
            ['Option Text 3']             = fromrgb(145,145,145);
            ['Option Border 1']           = fromrgb(50,50,50);
            ['Option Border 2']           = fromrgb(0,0,0);
            ['Option Background']         = fromrgb(35,35,35);
            ["Risky Text"]                = fromrgb(175, 21, 21);
            ["Risky Text Enabled"]        = fromrgb(255, 41, 41);
        }
    },
    {
        name = 'Nekocheat',
        theme = {
            ["Accent"]                    = fromrgb(226, 30, 112);
            ["Background"]                = fromrgb(18,18,18);
            ["Border"]                    = fromrgb(0,0,0);
            ["Border 1"]                  = fromrgb(60,60,60);
            ["Border 2"]                  = fromrgb(18,18,18);
            ["Border 3"]                  = fromrgb(10,10,10);
            ["Primary Text"]              = fromrgb(255,255,255);
            ["Group Background"]          = fromrgb(18,18,18);
            ["Selected Tab Background"]   = fromrgb(18,18,18);
            ["Unselected Tab Background"] = fromrgb(18,18,18);
            ["Selected Tab Text"]         = fromrgb(245,245,245);
            ["Unselected Tab Text"]       = fromrgb(145,145,145);
            ["Section Background"]        = fromrgb(18,18,18);
            ["Option Text 1"]             = fromrgb(255,255,255);
            ["Option Text 2"]             = fromrgb(255,255,255);
            ["Option Text 3"]             = fromrgb(255,255,255);
            ["Option Border 1"]           = fromrgb(50,50,50);
            ["Option Border 2"]           = fromrgb(0,0,0);
            ["Option Background"]         = fromrgb(23,23,23);
            ["Risky Text"]                = fromrgb(175, 21, 21);
            ["Risky Text Enabled"]        = fromrgb(255, 41, 41);
        }
    },
    {
        name = 'Nekocheat Blue',
        theme = {
            ["Accent"]                    = fromrgb(0, 247, 255);
            ["Background"]                = fromrgb(18,18,18);
            ["Border"]                    = fromrgb(0,0,0);
            ["Border 1"]                  = fromrgb(60,60,60);
            ["Border 2"]                  = fromrgb(18,18,18);
            ["Border 3"]                  = fromrgb(10,10,10);
            ["Primary Text"]              = fromrgb(255,255,255);
            ["Group Background"]          = fromrgb(18,18,18);
            ["Selected Tab Background"]   = fromrgb(18,18,18);
            ["Unselected Tab Background"] = fromrgb(18,18,18);
            ["Selected Tab Text"]         = fromrgb(245,245,245);
            ["Unselected Tab Text"]       = fromrgb(145,145,145);
            ["Section Background"]        = fromrgb(18,18,18);
            ["Option Text 1"]             = fromrgb(255,255,255);
            ["Option Text 2"]             = fromrgb(255,255,255);
            ["Option Text 3"]             = fromrgb(255,255,255);
            ["Option Border 1"]           = fromrgb(50,50,50);
            ["Option Border 2"]           = fromrgb(0,0,0);
            ["Option Background"]         = fromrgb(23,23,23);
            ["Risky Text"]                = fromrgb(175, 21, 21);
            ["Risky Text Enabled"]        = fromrgb(255, 41, 41);
        }
    },
    {
        name = 'Fatality',
        theme = {
            ['Accent']                    = fromrgb(197,7,83);
            ['Background']                = fromrgb(25,19,53);
            ['Border']                    = fromrgb(0,0,0);
            ['Border 1']                  = fromrgb(60,53,93);
            ['Border 2']                  = fromrgb(29,23,66);
            ['Border 3']                  = fromrgb(10,10,10);
            ['Primary Text']              = fromrgb(235,235,235);
            ['Group Background']          = fromrgb(29,23,66);
            ['Selected Tab Background']   = fromrgb(29,23,66);
            ['Unselected Tab Background'] = fromrgb(25,19,53);
            ['Selected Tab Text']         = fromrgb(245,245,245);
            ['Unselected Tab Text']       = fromrgb(145,145,145);
            ['Section Background']        = fromrgb(25,19,53);
            ['Option Text 1']             = fromrgb(245,245,245);
            ['Option Text 2']             = fromrgb(195,195,195);
            ['Option Text 3']             = fromrgb(145,145,145);
            ['Option Border 1']           = fromrgb(60,53,93);
            ['Option Border 2']           = fromrgb(0,0,0);
            ['Option Background']         = fromrgb(29,23,66);
            ["Risky Text"]                = fromrgb(175, 21, 21);
            ["Risky Text Enabled"]        = fromrgb(255, 41, 41);
        }
    },
    {
        name = 'Skeet',
        theme = {
            ['Accent']                    = fromrgb(147,184,26);
            ['Background']                = fromrgb(17,17,17);
            ['Border']                    = fromrgb(0,0,0);
            ['Border 1']                  = fromrgb(47,47,47);
            ['Border 2']                  = fromrgb(17,17,17);
            ['Border 3']                  = fromrgb(10,10,10);
            ['Primary Text']              = fromrgb(235,235,235);
            ['Group Background']          = fromrgb(17,17,17);
            ['Selected Tab Background']   = fromrgb(17,17,17);
            ['Unselected Tab Background'] = fromrgb(17,17,17);
            ['Selected Tab Text']         = fromrgb(245,245,245);
            ['Unselected Tab Text']       = fromrgb(145,145,145);
            ['Section Background']        = fromrgb(17,17,17);
            ['Option Text 1']             = fromrgb(245,245,245);
            ['Option Text 2']             = fromrgb(195,195,195);
            ['Option Text 3']             = fromrgb(145,145,145);
            ['Option Border 1']           = fromrgb(47,47,47);
            ['Option Border 2']           = fromrgb(0,0,0);
            ['Option Background']         = fromrgb(35,35,35);
            ["Risky Text"]                = fromrgb(175, 21, 21);
            ["Risky Text Enabled"]        = fromrgb(255, 41, 41);
        }
    },
    {
        name = 'Twitch',
        theme = {
            ['Accent']                    = fromrgb(169,112,255);
            ['Background']                = fromrgb(14,14,14);
            ['Border']                    = fromrgb(0,0,0);
            ['Border 1']                  = fromrgb(45,45,45);
            ['Border 2']                  = fromrgb(31,31,35);
            ['Border 3']                  = fromrgb(10,10,10);
            ['Primary Text']              = fromrgb(235,235,235);
            ['Group Background']          = fromrgb(31,31,35);
            ['Selected Tab Background']   = fromrgb(31,31,35);
            ['Unselected Tab Background'] = fromrgb(17,17,17);
            ['Selected Tab Text']         = fromrgb(225,225,225);
            ['Unselected Tab Text']       = fromrgb(160,170,175);
            ['Section Background']        = fromrgb(17,17,17);
            ['Option Text 1']             = fromrgb(245,245,245);
            ['Option Text 2']             = fromrgb(195,195,195);
            ['Option Text 3']             = fromrgb(145,145,145);
            ['Option Border 1']           = fromrgb(45,45,45);
            ['Option Border 2']           = fromrgb(0,0,0);
            ['Option Background']         = fromrgb(24,24,27);
            ["Risky Text"]                = fromrgb(175, 21, 21);
            ["Risky Text Enabled"]        = fromrgb(255, 41, 41);
        }
    },
    {
	    name = "BLM",
        theme = {
			['Accent']                    = fromrgb(0, 0, 0);
			['Background']                = fromrgb(0, 0, 0);
			['Border']                    = fromrgb(0,0,0);
			['Border 1']                  = fromrgb(0, 0, 0);
			['Border 2']                  = fromrgb(0, 0, 0);
			['Border 3']                  = fromrgb(0, 0, 0);
			['Primary Text']             = fromrgb(255, 255, 255);
			['Group Background']          = fromrgb(0, 0, 0);
			['Selected Tab Background']   = fromrgb(0, 0, 0);
			['Unselected Tab Background'] = fromrgb(0, 0, 0);
			['Selected Tab Text']         = fromrgb(255, 255, 255);
			['Unselected Tab Text']       = fromrgb(255, 255, 255);
			['Section Background']        = fromrgb(0, 0, 0);
			['Option Text 1']             = fromrgb(255, 255, 255);
			['Option Text 2']             = fromrgb(255, 255, 255);
			['Option Text 3']             = fromrgb(255, 255, 255);
			['Option Border 1']           = fromrgb(0, 0, 0);
			['Option Border 2']           = fromrgb(0, 0, 0);
			['Option Background']        = fromrgb(0, 0, 0);
			["Risky Text"]                = fromrgb(0, 0, 0);
			["Risky Text Enabled"]        = fromrgb(0, 0, 0);
       	}
    }
}

local blacklistedKeys = {
	Enum.KeyCode.Unknown,
	Enum.KeyCode.W,
	Enum.KeyCode.A,
	Enum.KeyCode.S,
	Enum.KeyCode.D,
	Enum.KeyCode.Slash,
	Enum.KeyCode.Tab,
	Enum.KeyCode.Escape
}

local whitelistedBoxKeys = {
    Enum.KeyCode.Zero,
    Enum.KeyCode.One,
    Enum.KeyCode.Two,
    Enum.KeyCode.Three,
    Enum.KeyCode.Four,
    Enum.KeyCode.Five,
    Enum.KeyCode.Six,
    Enum.KeyCode.Seven,
    Enum.KeyCode.Eight,
    Enum.KeyCode.Nine,
    Enum.KeyCode.Period
}

local keyNames = {
    [Enum.KeyCode.LeftControl] = 'LCTRL';
    [Enum.KeyCode.RightControl] = 'RCTRL';
    [Enum.KeyCode.LeftShift] = 'LSHIFT';
    [Enum.KeyCode.RightShift] = 'RSHIFT';
    [Enum.UserInputType.MouseButton1] = 'MB1';
    [Enum.UserInputType.MouseButton2] = 'MB2';
    [Enum.UserInputType.MouseButton3] = 'MB3';
}

library.button1down = library.signal.new()
library.button1up   = library.signal.new()
library.mousemove   = library.signal.new()
library.unloaded    = library.signal.new()

local button1down, button1up, mousemove = library.button1down, library.button1up, library.mousemove
local mb1down = false;

local utility = library.utility
do

    function utility:Connection(signal, func)
        local c = signal:Connect(func)
        table.insert(library.connections, c)
        return c
    end

    function utility:CloneTable(t)
        local clone = {}
        for i,v in next, t do
            clone[i] = v;
        end
        return clone
    end

    function utility:SetProperties(t, props)
        for i,v in next, props do
            t[i] = v;
        end
        return t
    end

    function utility:CFrameToViewport(cf)
        local cam = workspace.CurrentCamera;
        return cam:WorldToViewportPoint((cf * (cf - cf.p):ToObjectSpace(cam.CFrame - cam.CFrame.p)).p);
    end

    function utility:HasCharacter(plr, minhealth)
        if plr.Character ~= nil and plr.Character:FindFirstChild('HumanoidRootPart') and plr.Character:FindFirstChild('Humanoid') and plr.Character.Humanoid.Health > (minhealth or 0) then
            return true, plr.Character;
        end
        return false;
    end

    function utility:Raycast(a,b,c)
        c = typeof(c) == 'table' and c or {}
        local params = RaycastParams.new();
        params.IgnoreWater = true;
        params.FilterType = Enum.RaycastFilterType.Blacklist;
        params.FilterDescendantsInstances = c;
    
        local ray = workspace:Raycast(a,b,params);
        if ray ~= nil then -- it was erroring without 2 if statements lol idk why
            if ray.Instance.Transparency >= .25 or not ray.Instance.CanCollide then
                table.insert(c, ray.Instance);
                local newray = self:Raycast(a,b,c)
                if newray ~= nil then
                    ray = newray
                end
            end
        end
        return ray
    end

    function utility:EnableConnections(connection, ignoresynapse)
        for i,v in next, getconnections(connection) do
            if v.Function ~= nil and ignoresynapse and isexecutorclosure(v.Function) then
                return
            end
            v:Enable()
        end
    end

    function utility:DisableConnections(connection, ignoresynapse)
        for i,v in next, getconnections(connection) do
            if v.Function ~= nil and ignoresynapse and isexecutorclosure(v.Function) then
                return
            end
            v:Disable()
        end
    end

    function utility:Instance(class, properties)
        local inst = newInstance(class)
        for prop, val in next, properties or {} do
            local s,e = pcall(function()
                inst[prop] = val
            end)
            if not s then
                printconsole(e, 255,0,0)
            end
        end
        table.insert(library.instances, inst);
        return inst
    end

    function utility:HasProperty(obj, prop)
        return ({(pcall(function() local a = obj[prop] end))})[1]
    end

    function utility:CheckEnum(enum,enumitem)
        if typeof(enumitem) == 'EnumItem' then
            return ({pcall(function()
                local a = enum[enumitem.Name]
            end)})[1]
        else
            return false
        end
    end

    function utility:ToRGB(c3)
        return c3.R*255,c3.G*255,c3.B*255
    end

    function utility:AddRGB(a,b)
        local r1,g1,b1 = self:ToRGB(a);
        local r2,g2,b2 = self:ToRGB(b);
        return fromrgb(clamp(r1+r2,0,255),clamp(g1+g2,0,255),clamp(b1+b2,0,255))
    end

    function utility:ConvertNumberRange(val,oldmin,oldmax,newmin,newmax)
        return (((val - oldmin) * (newmax - newmin)) / (oldmax - oldmin)) + newmin
    end

    function utility:UDim2ToVector2(udim2, vector2)
        local x,y
        x = udim2.X.Offset + self:ConvertNumberRange(udim2.X.Scale,0,1,0,vector2.X)
        y = udim2.Y.Offset + self:ConvertNumberRange(udim2.Y.Scale,0,1,0,vector2.Y)
        return newVector2(x,y)
    end

    function utility:Vector2ToUDim2(a,b)
        local x,y
        x = self:ConvertNumberRange(a.X, 0, b.X, 0, 1)
        y = self:ConvertNumberRange(a.Y, 0, b.Y, 0, 1)
        return newUDim2(x,0,y,0)
    end

    function utility:Lerp(a,b,c)
        return a + (b-a) * c
    end

    function utility:Bezier(p1,p2,p3,t)
        local a = self:Lerp(p1, p2, t);
        local b = self:Lerp(p2, p3, t);
        return self:Lerp(a, b, t)
    end

    function utility:Tween(obj, prop, val, time, direction, style)
        if self:HasProperty(obj, prop) then
            if library.tweens[obj] then
                if library.tweens[obj][prop] then
                    library.tweens[obj][prop]:Cancel()
                end
            end

            local startVal = obj[prop];
            local a = 0;
            local tween = {
                Completed = library.signal.new();
            };

            library.tweens[obj] = library.tweens[obj] or {};
            library.tweens[obj][prop] = tween;

            tween.Connection = self:Connection(RunService.RenderStepped, function(dt)
                a = a + (dt / time);
                if a >= 1 or obj == nil then
                    tween:Cancel();
                end
                pcall(function()
                    local progress = tweenService:GetValue(a, style or Enum.EasingStyle.Linear, direction or Enum.EasingDirection.In)
                    local newVal
                    if typeof(startVal) == 'number' then
                        newVal = utility:Lerp(startVal, val, progress);
                    else
                        newVal = startVal:Lerp(val, progress);
                    end
                    obj[prop] = newVal;
                end)
            end)

            function tween:Cancel()
                tween.Connection:Disconnect();
                tween.Completed:Fire();
                table.clear(tween);
                library.tweens[obj][prop] = nil;
            end
            
            return tween;
        else
            printconsole('unable to tween: invalid property '..tostring(prop)..' for object '..tostring(obj), 255,0,0)
        end
    end

    function utility:DetectTableChange(indexcallback,newindexcallback)
        if indexcallback == nil then
            warn('DetectTableChange: Argument #1 (indexcallback) is nil, function may not work as expected.')
        elseif newindexcallback == nil then
            warn('DetectTableChange: Argument #2 (newindexcallback) is nil, function may not work as expected.')
        end
        local proxy = newproxy(true);
        local mt = getmetatable(proxy);
        mt.__index = indexcallback
        mt.__newindex = newindexcallback
        return proxy
    end

    function utility:MouseOver(obj)
        local mousePos = UserInputService:GetMouseLocation();
        local x1 = obj.Position.X
        local y1 = obj.Position.Y
        local x2 = x1 + obj.Size.X
        local y2 = y1 + obj.Size.Y
        return (mousePos.X >= x1 and mousePos.Y >= y1 and mousePos.X <= x2 and mousePos.Y <= y2)
    end

    function utility:GetHoverObject()
        local objects = {}
        for i,v in next, library.drawings do
            if v.Object.Visible and v.Class == 'Square' and self:MouseOver(v.Object) then
                table.insert(objects,v.Object)
            end
        end
        table.sort(objects,function(a,b)
            return a.ZIndex > b.ZIndex
        end)
        return objects[1]
    end

    function utility:Draw(class, properties)
        local blacklistedProperties = {'Object','Children','Class'}
        local drawing = {
            Object = Drawing.new(class);
            Children = {};
            ThemeColor = '';
            OutlineThemeColor = '';
            ThemeColorOffset = 0;
            OutlineThemeColorOffset = 0;
            Parent = nil;
            Size = newUDim2(0,0,0,0);
            Position = newUDim2(0,0,0,0);
            AbsoluteSize = newVector2(0,0);
            AbsolutePosition = newVector2(0,0);
            Hover = false;
            Visible = true;
            MouseButton1Down = library.signal.new();
            MouseButton2Down = library.signal.new();
            MouseButton1Up = library.signal.new();
            MouseButton2Up = library.signal.new();
            MouseEnter = library.signal.new();
            MouseLeave = library.signal.new();
            Class = class;
        }

        function drawing:Update()
            -- if drawing.Parent then
                local parent = drawing.Parent ~= nil and library.drawings[drawing.Parent.Object] or nil
                local parentSize,parentPos,parentVis = workspace.CurrentCamera.ViewportSize, Vector2.new(0,0), true;
                if parent ~= nil then
                    parentSize = (parent.Class == 'Square' or parent.Class == 'Image') and parent.Object.Size or parent.Class == 'Text' and parent.TextBounds or workspace.CurrentCamera.ViewportSize
                    parentPos = parent.Object.Position
                    parentVis = parent.Object.Visible
                end

                if drawing.Class == 'Square' or drawing.Class == 'Image' then
                    drawing.Object.Size = typeof(drawing.Size) == 'Vector2' and drawing.Size or typeof(drawing.Size) == 'UDim2' and utility:UDim2ToVector2(drawing.Size,parentSize)
                end

                if drawing.Class == 'Square' or drawing.Class == 'Image' or drawing.Class == 'Circle' or drawing.Class == 'Text' then
                    drawing.Object.Position = parentPos + (typeof(drawing.Position) == 'Vector2' and drawing.Position or utility:UDim2ToVector2(drawing.Position,parentSize))
                end

                drawing.Object.Visible = (parentVis and drawing.Visible) and true or false

            -- end
            drawing:UpdateChildren()
        end

        function drawing:UpdateChildren()
            for i,v in next, drawing.Children do
                v:Update()
            end
        end

        function drawing:GetDescendants()
            local descendants = {};
            local function a(t)
                for _,v in next, t.Children do
                    table.insert(descendants, v);
                    a(v)
                end
            end
            a(self)
            return descendants;
        end

        library.drawings[drawing.Object] = drawing

        -- this is really stupid lol
        local proxy = utility:DetectTableChange(
        function(obj,i)
            return drawing[i] == nil and drawing.Object[i] or drawing[i]
        end,
        function(obj,i,v)
            if not table.find(blacklistedProperties,i) then

                local lastval = drawing[i]

                if i == 'Size' and (class == 'Square' or class == 'Image') then
                    drawing.Object.Size = utility:UDim2ToVector2(v,drawing.Parent == nil and workspace.CurrentCamera.ViewportSize or drawing.Parent.Object.Size);
                    drawing.AbsoluteSize = drawing.Object.Size;
                elseif i == 'Position' and (class == 'Square' or class == 'Image' or class == 'Text') then
                    drawing.Object.Position =  utility:UDim2ToVector2(v,drawing.Parent == nil and newVector2(0,0) or drawing.Parent.Object.Position);
                    drawing.AbsolutePosition = drawing.Object.Position;
                elseif i == 'Parent' then
                    if drawing.Parent ~= nil then
                        drawing.Parent.Children[drawing] = nil
                    end
                    if v ~= nil then
                        table.insert(v.Children,drawing)
                    end
                elseif i == 'Visible' then
                    drawing.Visible = v
                elseif i == 'Font' and v == 2 and executor == 'ScriptWare' then
                    v = 1
                end

                pcall(function()
                    drawing.Object[i] = v
                end)
                if drawing[i] ~= nil or i == 'Parent' then
                    drawing[i] = v
                end

                if table.find({'Size','Position','Position','Visible','Parent'},i) then
                    drawing:Update()
                end
                if table.find({'ThemeColor','OutlineThemeColor','ThemeColorOffset','OutlineThemeColorOffset'},i) and lastval ~= v then
                    library.UpdateThemeColors()
                end

            end
        end)

        function drawing:Remove()
            for i,v in next, self.Children do
                v:Remove();
            end

            if drawing.Parent then
                drawing.Parent.Children[drawing.Object] = nil;
            end

            library.drawings[drawing.Object] = nil;
            drawing.Object:Remove();
            table.clear(drawing);

        end

        properties = typeof(properties) == 'table' and properties or {}

        if class == 'Square' and properties.Filled == nil then
            properties.Filled = true;
        end

        if properties.Visible == nil then
            properties.Visible = true;
        end

        for i,v in next, properties do
            proxy[i] = v
        end

        drawing:Update()
        return proxy
    end
end

library.utility = utility

function library:Unload()
    esp.enabled = false
    FovCircle.Visible = false
    FovCircle2.Visible = false
    library.unloaded:Fire();
    for _,c in next, self.connections do
        c:Disconnect()
    end
    for obj in next, self.drawings do
        obj:Remove()
    end
    table.clear(self.drawings)
    getgenv().library = nil
end

function library:init()
    if self.hasInit then
        return
    end

    local tooltipObjects = {};

    makefolder(self.cheatname)
    makefolder(self.cheatname..'/assets')
    makefolder(self.cheatname..'/'..self.gamename)
    makefolder(self.cheatname..'/'..self.gamename..'/configs');
    writefile(self.cheatname..'/'..self.gamename..'/waypoints.txt', '');
    if not isfile(self.cheatname..'_friendlist.txt') then
        writefile(self.cheatname..'_friendlist.txt', http:JSONEncode({}))
    end
    if not isfile(self.cheatname..'_enemylist.txt') then
        writefile(self.cheatname..'_enemylist.txt', http:JSONEncode({}))
    end

    function self:SetTheme(theme)
        for i,v in next, theme do
            self.theme[i] = v;
        end
        self.UpdateThemeColors();
    end

    function self:GetConfig(name)
        if isfile(self.cheatname..'/'..self.gamename..'/configs/'..name..self.fileext) then
            return readfile(self.cheatname..'/'..self.gamename..'/configs/'..name..self.fileext);
        end
    end

    function self:LoadConfig(name)
        local cfg = self:GetConfig(name)
        if not cfg then
            self:SendNotification('Error loading config: Config does not exist. ('..tostring(name)..')', 5, c3new(1,0,0));
            return
        end

        local s,e = pcall(function()
            for flag,value in next, http:JSONDecode(cfg) do
                local option = library.options[flag]
                if option ~= nil then
                    if option.class == 'toggle' then
                        option:SetState(value == nil and false or (value == 1 and true or false));
                    elseif option.class == 'slider' then
                        option:SetValue(value == nil and 0 or value)
                    elseif option.class == 'bind' then
                        option:SetBind(value == nil and 'none' or (utility:HasProperty(Enum.KeyCode, value) and Enum.KeyCode[value] or Enum.UserInputType[value]));
                    elseif option.class == 'color' then
                        option:SetColor(value == nil and c3new(1,1,1) or c3new(value[1], value[2], value[3]));
                        option:SetTrans(value == nil and 1 or value[4]);
                    elseif option.class == 'list' then
                        option:Select(value == nil and '' or value);
                    end
                end
            end
        end)

        if s then
            self:SendNotification('Successfully loaded config: '..name, 5, c3new(0,1,0));
        else
            self:SendNotification('Error loading config: '..tostring(e)..'. ('..tostring(name)..')', 5, c3new(1,0,0));
        end
    end

    function self:SaveConfig(name)
        if not self:GetConfig(name) then
            self:SendNotification('Error saving config: Config does not exist. ('..tostring(name)..')', 5, c3new(1,0,0));
            return
        end

        local s,e = pcall(function()
            local cfg = {};
            for flag,option in next, self.options do
                if option.class == 'toggle' then
                    cfg[flag] = option.state and 1 or 0;
                elseif option.class == 'slider' then
                    cfg[flag] = option.value;
                elseif option.class == 'bind' then
                    cfg[flag] = option.bind.Name;
                elseif option.class == 'color' then
                    cfg[flag] = {
                        option.color.r,
                        option.color.g,
                        option.color.b,
                        option.trans,
                    }
                elseif option.class == 'list' then
                    cfg[flag] = option.selected;
                end
            end
            writefile(self.cheatname..'/'..self.gamename..'/configs/'..name..self.fileext, http:JSONEncode(cfg));
        end)

        if s then
            self:SendNotification('Successfully saved config: '..name, 5, c3new(0,1,0));
        else
            self:SendNotification('Error saving config: '..tostring(e)..'. ('..tostring(name)..')', 5, c3new(1,0,0));
        end
    end

    for i,v in next, self.images do
        if not isfile(self.cheatname..'/assets/'..i..'.lx') then
            writefile(self.cheatname..'/assets/'..i..'.lx', game:HttpGet(v))
        end
        self.images[i] = readfile(self.cheatname..'/assets/'..i..'.lx');
    end

    self.cursor1 = utility:Draw('Triangle', {Filled = true, Color = fromrgb(255,255,255), ZIndex = self.zindexOrder.cursor});
    self.cursor2 = utility:Draw('Triangle', {Filled = true, Color = fromrgb(85,85,85), self.zindexOrder.cursor-1});
    local function updateCursor()
        self.cursor1.Visible = self.open
        self.cursor2.Visible = self.open
        if self.cursor1.Visible then
            local pos = UserInputService:GetMouseLocation();
	    UserInputService.MouseIconEnabled = false
            self.cursor1.PointA = pos;
            self.cursor1.PointB = pos + newVector2(16,5);
            self.cursor1.PointC = pos + newVector2(5,16);
            self.cursor2.PointA = self.cursor1.PointA + newVector2(0, 0)
            self.cursor2.PointB = self.cursor1.PointB + newVector2(1, 1)
            self.cursor2.PointC = self.cursor1.PointC + newVector2(1, 1)
	else
	    UserInputService.MouseIconEnabled = true
	end
    end

    local screenGui = Instance.new('ScreenGui');
    if syn then syn.protect_gui(screenGui); end
    screenGui.Parent = game:GetService('CoreGui');
    screenGui.Enabled = true;
    utility:Instance('ImageButton', {
        Parent = screenGui,
        Visible = true,
        Modal = true,
        Size = UDim2.new(1,0,1,0),
        ZIndex = 9999999999,
        Transparency = 1;
    })
    

    utility:Connection(library.unloaded, function()
        screenGui:Destroy()
    end)

    local namecall; namecall = hookmetamethod(game, '__namecall', function(obj, ...)
        if getnamecallmethod() == 'Destroy' and library.instances[obj] ~= nil then
            library.instances[obj] = nil;
        end
        return namecall(obj, ...)
    end)

    utility:Connection(UserInputService.InputBegan, function(input, gpe)
        if self.hasInit then
            local hoverObj = utility:GetHoverObject();
            local hoverObjData = library.drawings[hoverObj];

            if input.KeyCode == self.toggleKey and not library.opening then
                self:SetOpen(not self.open)
                task.spawn(function()
                    library.opening = true;
                    task.wait(.15);
                    library.opening = false;
                end)
            elseif input.UserInputType == Enum.UserInputType.MouseButton1 then
                mb1down = true;
                button1down:Fire()
                if hoverObj and hoverObjData then
                    hoverObjData.MouseButton1Down:Fire(UserInputService:GetMouseLocation())
                end

                -- // Update Sliders Click
                if library.draggingSlider ~= nil then
                    local rel = UserInputService:GetMouseLocation() - library.draggingSlider.objects.background.Object.Position;
                    local val = utility:ConvertNumberRange(rel.X, 0 , library.draggingSlider.objects.background.Object.Size.X, library.draggingSlider.min, library.draggingSlider.max);
                    library.draggingSlider:SetValue(val)
                end

            elseif input.UserInputType == Enum.UserInputType.MouseButton2 then
                if hoverObj and hoverObjData then
                    hoverObjData.MouseButton2Down:Fire(UserInputService:GetMouseLocation())
                end
            end

        end
    end)

    utility:Connection(UserInputService.InputEnded, function(input, gpe)
        if self.hasInit then
            local hoverObj = utility:GetHoverObject();
            local hoverObjData = library.drawings[hoverObj];

            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                mb1down = false;
                button1up:Fire();
                if hoverObj and hoverObjData then
                    hoverObjData.MouseButton1Up:Fire(UserInputService:GetMouseLocation())
                end
            elseif input.UserInputType == Enum.UserInputType.MouseButton2 then
                if hoverObj and hoverObjData then
                    hoverObjData.MouseButton2Up:Fire(UserInputService:GetMouseLocation())
                end
            end
        end
    end)

    utility:Connection(UserInputService.InputChanged, function(input, gpe)
        if input.UserInputType == Enum.UserInputType.MouseMovement then

            mousemove:Fire(UserInputService:GetMouseLocation());
            updateCursor();

            if library.CurrentTooltip ~= nil then
                local mousePos = UserInputService:GetMouseLocation()
                tooltipObjects.background.Position = UDim2.new(0,mousePos.X + 15,0,mousePos.Y + 15)
                tooltipObjects.background.Size = UDim2.new(0,tooltipObjects.text.TextBounds.X + 6 + (library.CurrentTooltip.risky and 60 or 0),0,tooltipObjects.text.TextBounds.Y + 2)
            end

            local hoverObj = utility:GetHoverObject();
            for _,v in next, library.drawings do
                local hover = hoverObj == v.Object;
                if hover and not v.Hover then
                    v.Hover = true;
                    v.MouseEnter:Fire(UserInputService:GetMouseLocation());
                elseif not hover and v.Hover then
                    v.Hover = false;
                    v.MouseLeave:Fire(UserInputService:GetMouseLocation());
                end
            end

            if mb1down then

                -- // Update Sliders Drag
                if library.draggingSlider ~= nil then
                    local rel = UserInputService:GetMouseLocation() - library.draggingSlider.objects.background.Object.Position;
                    local val = utility:ConvertNumberRange(rel.X, 0 , library.draggingSlider.objects.background.Object.Size.X, library.draggingSlider.min, library.draggingSlider.max);
                    library.draggingSlider:SetValue(val)
                end

            end

        end
    end)
    
    function self:SetOpen(bool)
        self.open = bool;
        screenGui.Enabled = bool;

        if bool and library.flags.disablemenumovement then
            actionservice:BindAction(
                'FreezeMovement',
                function()
                    return Enum.ContextActionResult.Sink
                end,
                false,
                unpack(Enum.PlayerActions:GetEnumItems())
            )
        else
            actionservice:UnbindAction('FreezeMovement');
        end

        updateCursor();
        for _,window in next, self.windows do
            window:SetOpen(bool);
         end
    end

    function self.UpdateThemeColors()
        for _,v in next, library.drawings do
            if v.ThemeColor and library.theme[v.ThemeColor] then
                v.Object.Color = utility:AddRGB(library.theme[v.ThemeColor],fromrgb(v.ThemeColorOffset,v.ThemeColorOffset,v.ThemeColorOffset))
            end
            if v.ThemeColorOutline and library.theme[v.ThemeColorOutline] then
                v.Object.OutlineColor = utility:AddRGB(library.theme[v.ThemeColorOutline],fromrgb(v.OutlineThemeColorOffset,v.OutlineThemeColorOffset,v.OutlineThemeColorOffset))
            end
        end
    end

    function self:SendNotification(message, time, color)
        time = time or 5
        if typeof(message) ~= 'string' then
            return error(string.format('invalid message type, got %s, expected string', typeof(message)))
        elseif typeof(time) ~= 'number' then
            return error(string.format('invalid time type, got %s, expected number', typeof(time)))
        elseif color ~= nil and typeof(color) ~= 'Color3' then
            return error(string.format('invalid color type, got %s, expected color3', typeof(time)))
        end

        local notification = {};

        self.notifications[notification] = true

        do
            local objs = notification;
            local z = self.zindexOrder.notification;

            notification.holder = utility:Draw('Square', {
                Position = newUDim2(0, 0, 0, 75);
                Transparency = 0;
            })
            
            notification.background = utility:Draw('Square', {
                Size = newUDim2(1,0,1,0);
                Position = newUDim2(0, -500, 0, 0);
                Parent = notification.holder;
                ThemeColor = 'Background';
                ZIndex = z;
            })

            notification.border1 = utility:Draw('Square', {
                Size = newUDim2(1,2,1,2);
                Position = newUDim2(0,-1,0,-1);
                ThemeColor = 'Border 2';
                Parent = notification.background;
                ZIndex = z-1;
            })

            objs.border2 = utility:Draw('Square', {
                Size = newUDim2(1,2,1,2);
                Position = newUDim2(0,-1,0,-1);
                ThemeColor = 'Border 3';
                Parent = objs.border1;
                ZIndex = z-2;
            })

            notification.gradient = utility:Draw('Image', {
                Size = newUDim2(1,0,1,0);
                Data = self.images.gradientp90;
                Parent = notification.background;
                Transparency = .5;
                ZIndex = z+1;
            })

            notification.accentBar = utility:Draw('Square',{
                Size = newUDim2(0,5,1,4);
                Position = newUDim2(0,0,0,-2);
                Parent = notification.background;
                ThemeColor = color == nil and 'Accent' or '';
                ZIndex = z+5;
            })

            notification.text = utility:Draw('Text', {
                Position = newUDim2(0,13,0,2);
                ThemeColor = 'Primary Text';
                Text = message;
                Outline = true;
                Font = 2;
                Size = 13;
                ZIndex = z+4;
                Parent = notification.background;
            })

            if color then
                notification.accentBar.Color = color;
            end

        end

        function notification:Remove()
            library.notifications[notification] = nil;
            self.holder:Remove();
            library:UpdateNotifications()
        end

        task.spawn(function()
            self:UpdateNotifications();
            notification.background.Size = newUDim2(0, notification.text.TextBounds.X + 20, 0, 19)
            task.wait();
            utility:Tween(notification.background, 'Position', newUDim2(0,0,0, 0), .1);
            task.wait(time);
            for i,v in next, notification do
                if typeof(v) ~= 'function' then
                    utility:Tween(v, 'Transparency', 0, .15);
                end
            end
            utility:Connection(utility:Tween(notification.background, 'Position', newUDim2(0,-500,0, 0), .25).Completed, (function()
                notification:Remove();
            end))
        end)

    end

    function self:UpdateNotifications()
        local i = 0
        for v in next, self.notifications do
            utility:Tween(v.holder, 'Position', newUDim2(0,0,0, 75 + (i * 30)), .15)
            i += 1
        end
    end

    function self.NewIndicator(data)
        local indicator = {
            title = data.title or 'indicator',
            enabled = data.enabled or false,
            position = data.position or newUDim2(0,55,0,300),
            values = {},
            objects = {valueObjects = {}},
            spacing = '   ',
        };

        table.insert(self.indicators, indicator)

        -- Create Objects --
        do
            local z = self.zindexOrder.indicator;
            local objs = indicator.objects;

            objs.background = utility:Draw('Square', {
                Size = newUDim2(0, 200, 0, 16);
                Position = indicator.position;
                ThemeColor = 'Background';
                ZIndex = z;
            })

            objs.border1 = utility:Draw('Square', {
                Size = newUDim2(1,2,1,2);
                Position = newUDim2(0,-1,0,-1);
                ThemeColor = 'Border 2';
                Parent = objs.background;
                ZIndex = z-1;
            })

            objs.border2 = utility:Draw('Square', {
                Size = newUDim2(1,2,1,2);
                Position = newUDim2(0,-1,0,-1);
                ThemeColor = 'Border 3';
                Parent = objs.border1;
                ZIndex = z-2;
            })

            objs.topborder = utility:Draw('Square', {
                Size = newUDim2(1,0,0,1);
                ThemeColor = 'Accent';
                Parent = objs.background;
                ZIndex = z+1;
            })

            objs.textlabel = utility:Draw('Text', {
                Position = newUDim2(.5,0,0,1);
                ThemeColor = 'Primary Text';
                Text = indicator.title;
                Size = 13;
                Font = 2;
                ZIndex = z+2;
                Center = true;
                Outline = true;
                Parent = objs.background;
            });

        end
        --------------------

        function indicator:Update()
            local xSize  = 125
            local yPos  = 0
            table.sort(self.values, function(a,b)
                return a.order < b.order;
            end)

            for _,v in next, self.values do
                v.objects.keyLabel.Text = tostring(v.key);
                v.objects.valueLabel.Text = tostring(v.value);
               
                v.objects.valueLabel.Position = newUDim2(1,-(v.objects.valueLabel.TextBounds.X),0,0)
                v.objects.background.Position = newUDim2(0,0,1,3 + yPos)
                v.objects.background.Visible = v.enabled

                if v.enabled then
                    yPos = yPos + 16 + 3
                    local x = (v.objects.keyLabel.TextBounds.X + 10 + v.objects.valueLabel.TextBounds.X)
                    if x > xSize then
                        xSize = x
                    end
                end
            end

            self.objects.background.Size = newUDim2(0,xSize + 8,0,16)
            self.objects.background.Position = self.position
        end

        function indicator:AddValue(data)
            local value = {
                key = data.key or '',
                value = data.value or '',
                order = data.order or #self.values+1,
                enabled = data.enabled == nil and true or data.enabled,
                objects = {},
            }

            table.insert(self.values, value);

            -- Create Objects --
            do
                local z = library.zindexOrder.indicator;
                local objs = value.objects;

                objs.background = utility:Draw('Square', {
                    Size = newUDim2(1, 0, 0, 16);
                    ThemeColor = 'Background';
                    ZIndex = z;
                    Parent = indicator.objects.background;
                })
    
                objs.border1 = utility:Draw('Square', {
                    Size = newUDim2(1,2,1,2);
                    Position = newUDim2(0,-1,0,-1);
                    ThemeColor = 'Border 2';
                    Parent = objs.background;
                    ZIndex = z-1;
                })
    
                objs.border2 = utility:Draw('Square', {
                    Size = newUDim2(1,2,1,2);
                    Position = newUDim2(0,-1,0,-1);
                    ThemeColor = 'Border 3';
                    Parent = objs.border1;
                    ZIndex = z-2;
                })
    
                objs.keyLabel = utility:Draw('Text', {
                    Position = newUDim2(0,3,0,1);
                    ThemeColor = 'Option Text 2';
                    Size = 13;
                    Font = 2;
                    ZIndex = z+2;
                    Outline = true;
                    Parent = objs.background;
                });

                objs.valueLabel = utility:Draw('Text', {
                    Position = newUDim2(0,0,0,1);
                    ThemeColor = 'Option Text 2';
                    Size = 13;
                    Font = 2;
                    ZIndex = z+2;
                    Outline = true;
                    Parent = objs.background;
                });

            end
            --------------------

            function value:Remove()
                table.remove(indicator.values, table.find(indicator.values, value))
                self.objects.background:Remove()
                table.clear(self)
                indicator:Update();
            end

            function value:SetEnabled(bool)
                if typeof(bool) == 'boolean' then
                    self.enabled = bool
                    indicator:Update()
                end
            end

            function value:SetValue(str)
                if typeof(str) == 'string' then
                    self.value = str
                    indicator:Update()
                end
            end

            function value:SetKey(str)
                if typeof(str) == 'string' then
                    self.key = str
                    indicator:Update()
                end
            end

            self:Update()
            return value
        end

        function indicator:GetValue(idx)
            if typeof(idx) == 'number' then
                return self.values[idx]
            else
                for i,v in next, self.values do
                    if v.key == idx then
                        return v
                    end
                end
            end
        end

        function indicator:SetEnabled(bool)
            if typeof(bool) == 'boolean' then
                self.enabled = bool;
                self.objects.background.Visible = bool;
                self:Update();
            end
        end

        function indicator:SetPosition(udim2)
            if typeof(udim2) == 'UDim2' then
                self.position = udim2
                self.objects.background.Position = udim2;
            end
        end

        for i,v in next, data.values or {} do
            indicator:AddValue({key = tostring(i), value = tostring(v)})
        end

        indicator:SetEnabled(indicator.enabled);
        return indicator
    end

    function self.NewWindow(data)
        local window = {
            title = data.title,
            selectedTab = nil;
            tabs = {},
            objects = {},
            colorpicker = {
                objects = {};
                color = c3new(1,0,0);
                trans = 0;
            };
            dropdown = {
                objects = {
                    values = {};
                };
                max = 5;
            }
        };
        window.title = "Alsike - Project Delta"

        table.insert(library.windows, window);

        ----- Create Objects ----
        do
            local size = data.size or newUDim2(0, 525, 0, 650);
            local position = data.position or newUDim2(0, 250, 0, 150);
            local objs = window.objects;
            local z = library.zindexOrder.window;

            objs.background = utility:Draw('Square', {
                Size = size;
                Position = position;
                ThemeColor = 'Background';
                ZIndex = z;
            })

            objs.innerBorder1 = utility:Draw('Square', {
                Size = newUDim2(1,2,1,2);
                Position = newUDim2(0,-1,0,-1);
                ThemeColor = 'Border 3';
                ZIndex = z-1;
                Parent = objs.background;
            })

            objs.innerBorder2 = utility:Draw('Square', {
                Size = newUDim2(1,2,1,2);
                Position = newUDim2(0,-1,0,-1);
                ThemeColor = 'Border 1';
                ZIndex = z-2;
                Parent = objs.innerBorder1;
            })

            objs.midBorder = utility:Draw('Square', {
                Size = newUDim2(1,10,1,25);
                Position = newUDim2(0,-5,0,-20);
                ThemeColor = 'Border 2';
                ZIndex = z-3;
                Parent = objs.innerBorder2;
            })

            objs.outerBorder1 = utility:Draw('Square', {
                Size = newUDim2(1,2,1,2);
                Position = newUDim2(0,-1,0,-1);
                ThemeColor = 'Border 1';
                ZIndex = z-4;
                Parent = objs.midBorder;
            })

            objs.outerBorder2 = utility:Draw('Square', {
                Size = newUDim2(1,2,1,2);
                Position = newUDim2(0,-1,0,-1);
                ThemeColor = 'Border 3';
                ZIndex = z-5;
                Parent = objs.outerBorder1;
            })

            objs.topBorder = utility:Draw('Square', {
                Size = newUDim2(1,0,0,1);
                ThemeColor = 'Accent';
                ZIndex = z+1;
                Parent = objs.background;
            })

            objs.title = utility:Draw('Text', {
                Position = newUDim2(0,7,0,2);
                ThemeColor = 'Primary Text';
                Text = window.title;
                Font = 2;
                Size = 13;
                ZIndex = z+1;
                Outline = true;
                Parent = objs.midBorder;
            })

            objs.groupBackground = utility:Draw('Square', {
                Size = newUDim2(1,-16,1,-(16+23));
                Position = newUDim2(0,8,0,8+23);
                ThemeColor = 'Group Background';
                ZIndex = z+5;
                Parent = objs.background;
            })

            objs.groupInnerBorder = utility:Draw('Square', {
                Size = newUDim2(1,2,1,2);
                Position = newUDim2(0,-1,0,-1);
                ThemeColor = 'Border 1';
                ZIndex = z+4;
                Parent = objs.groupBackground;
            })

            objs.groupOuterBorder = utility:Draw('Square', {
                Size = newUDim2(1,2,1,2);
                Position = newUDim2(0,-1,0,-1);
                ThemeColor = 'Border 3';
                ZIndex = z+3;
                Parent = objs.groupInnerBorder;
            })

            objs.tabHolder = utility:Draw('Square', {
                Size = newUDim2(1,0,0,20);
                Position = newUDim2(0,0,0,-21);
                Parent = objs.groupBackground;
                Transparency = 0;
                ZIndex = z+1;
            })

            objs.columnholder1 = utility:Draw('Square', {
                Size = newUDim2(.48, 0, .96, 0);
                Position = newUDim2(.01, 0, .02, 0);
                Transparency = 0;
                ZIndex = z+6;
                Parent = objs.groupBackground;
            })

            objs.columnholder2 = utility:Draw('Square', {
                Size = newUDim2(.48, 0, .96, 0);
                Position = newUDim2(1 - (.48 + .01), 0, .02, 0);
                Transparency = 0;
                ZIndex = z+6;
                Parent = objs.groupBackground;
            })


            objs.dragdetector = utility:Draw('Square',{
                Size = newUDim2(1,0,1,0);
                Parent = objs.midBorder;
                Transparency = 0;
                ZIndex = z+2;
            })

            local dragging, mouseStart, objStart;

            utility:Connection(objs.dragdetector.MouseButton1Down, function(pos)
                dragging = true;
                mouseStart = newUDim2(0, pos.X, 0, pos.Y);
                objStart = objs.background.Position;
            end)

            utility:Connection(button1up, function()
                dragging = false;
            end)

            utility:Connection(mousemove, function(pos)
                if dragging then
                    if window.open then
                        objs.background.Position = objStart + newUDim2(0, pos.X, 0, pos.Y) - mouseStart;
                    else
                        dragging = false
                    end
                end
            end)

        end
        -------------------------

        -- Create Color Picker --
        do
            -- Objects
            do
                local objs = window.colorpicker.objects;
                local z = library.zindexOrder.colorpicker;

                objs.background = utility:Draw('Square', {
                    Visible = false;
                    Size = newUDim2(0,200,0,242);
                    Position = newUDim2(1,-200,1,10);
                    ThemeColor = 'Background';
                    ZIndex = z;
                    Parent = window.objects.background;
                })

                objs.border1 = utility:Draw('Square', {
                    Size = newUDim2(1,2,1,2);
                    Position = newUDim2(0,-1,0,-1);
                    ThemeColor = 'Border';
                    ZIndex = z-1;
                    Parent = objs.background;
                })

                objs.border2 = utility:Draw('Square', {
                    Size = newUDim2(1,2,1,2);
                    Position = newUDim2(0,-1,0,-1);
                    ThemeColor = 'Border 1';
                    ZIndex = z-2;
                    Parent = objs.border1;
                })

                objs.border3 = utility:Draw('Square', {
                    Size = newUDim2(1,2,1,2);
                    Position = newUDim2(0,-1,0,-1);
                    ThemeColor = 'Border';
                    ZIndex = z-3;
                    Parent = objs.border2;
                })

                objs.statusText = utility:Draw('Text', {
                    Position = newUDim2(0,5,0,4);
                    Text = 'colorpicker_status_text';
                    ThemeColor = 'Option Text 1';
                    Size = 13;
                    Font = 2;
                    Outline = true;
                    ZIndex = z+1;
                    Parent = objs.background;
                })

                objs.mainColor = utility:Draw('Square', {
                    Size = newUDim2(0, 175, 0, 175);
                    Position = newUDim2(0, 5, 0, 25);
                    Color = c3new(1,0,0);
                    ZIndex = z+2;
                    Parent = objs.background;
                })

                objs.sat1 = utility:Draw('Image', {
                    Size = newUDim2(1,0,1,0);
                    Data = library.images.colorsat1;
                    ZIndex = z+3;
                    Parent = objs.mainColor;
                })

                objs.sat2 = utility:Draw('Image', {
                    Size = newUDim2(1,0,1,0);
                    Data = library.images.colorsat2;
                    ZIndex = z+4;
                    Parent = objs.mainColor;
                })

                objs.colorBorder = utility:Draw('Square', {
                    Size = newUDim2(1,2,1,2);
                    Position = newUDim2(0,-1,0,-1);
                    ThemeColor = 'Border';
                    ZIndex = z+1;
                    Parent = objs.mainColor;
                })

                objs.mainDetector = utility:Draw('Square',{
                    Size = newUDim2(1,0,1,0);
                    Transparency = 0;
                    ZIndex = z+10;
                    Parent = objs.mainColor;
                })

                objs.hue = utility:Draw('Image', {
                    Size = newUDim2(0,175,0,10);
                    Position = newUDim2(0,5,0,205);
                    Data = library.images.colorhue;
                    ZIndex = z+2;
                    Parent = objs.background;
                })

                objs.hueBorder = utility:Draw('Square', {
                    Size = newUDim2(1,2,1,2);
                    Position = newUDim2(0,-1,0,-1);
                    ThemeColor = 'Border';
                    ZIndex = z+1;
                    Parent = objs.hue;
                })

                objs.hueDetector = utility:Draw('Square',{
                    Size = newUDim2(1,0,1,0);
                    Transparency = 0;
                    ZIndex = z+10;
                    Parent = objs.hue;
                })

                objs.transColor = utility:Draw('Square', {
                    Size = newUDim2(0,10,0,175);
                    Position = newUDim2(0,185,0,25);
                    Color = c3new(1,0,0);
                    ZIndex = z+2;
                    Parent = objs.background;
                })

                objs.trans = utility:Draw('Image', {
                    Size = newUDim2(1,0,1,0);
                    Data = library.images.colortrans;
                    ZIndex = z+3;
                    Parent = objs.transColor;
                })

                objs.transBorder = utility:Draw('Square', {
                    Size = newUDim2(1,2,1,2);
                    Position = newUDim2(0,-1,0,-1);
                    ThemeColor = 'Border';
                    ZIndex = z+1;
                    Parent = objs.transColor;
                })

                objs.transDetector = utility:Draw('Square',{
                    Size = newUDim2(1,0,1,0);
                    Transparency = 0;
                    ZIndex = z+10;
                    Parent = objs.transColor;
                })

                objs.pointer = utility:Draw('Square', {
                    Size = newUDim2(0,2,0,2);
                    Position = newUDim2(0,0,0,0);
                    Color = c3new(1,1,1);
                    ZIndex = z+6;
                    Parent = objs.mainColor;
                })

                objs.pointerBorder = utility:Draw('Square', {
                    Size = newUDim2(1,2,1,2);
                    Position = newUDim2(0,-1,0,-1);
                    Color = c3new(0,0,0);
                    ZIndex = z+5;
                    Parent = objs.pointer;
                })

                objs.hueSlider = utility:Draw('Square', {
                    Size = newUDim2(0,1,1,0);
                    Color = c3new(1,1,1);
                    ZIndex = z+4;
                    Parent = objs.hue;
                })

                objs.hueSliderBorder = utility:Draw('Square', {
                    Size = newUDim2(1,2,1,2);
                    Position = newUDim2(0,-1,0,-1);
                    Color = c3new(0,0,0);
                    ZIndex = z+3;
                    Parent = objs.hueSlider;
                })

                objs.transSlider = utility:Draw('Square', {
                    Size = newUDim2(1,0,0,1);
                    Color = c3new(1,1,1);
                    ZIndex = z+5;
                    Parent = objs.trans;
                })

                objs.transSliderBorder = utility:Draw('Square', {
                    Size = newUDim2(1,2,1,2);
                    Position = newUDim2(0,-1,0,-1);
                    Color = c3new(0,0,0);
                    ZIndex = z+4;
                    Parent = objs.transSlider;
                })

                objs.rBackground = utility:Draw('Square', {
                    Size = newUDim2(0, 60, 0, 15);
                    Position = newUDim2(0, 5, 1, - 20);
                    ThemeColor = 'Option Background';
                    Parent = objs.background;
                    ZIndex = z+5;
                })

                objs.rBorder = utility:Draw('Square', {
                    Size = newUDim2(1,2,1,2);
                    Position = newUDim2(0,-1,0,-1);
                    Color = c3new(0,0,0);
                    ZIndex = z+4;
                    Parent = objs.rBackground;
                })

                objs.rText = utility:Draw('Text', {
                    Position = newUDim2(.5,0,0,0);
                    Color = c3new(1,.1,.1);
                    Text = 'R';
                    Size = 13;
                    Font = 2;
                    Outline = true;
                    Center = true;
                    ZIndex = z+6;
                    Parent = objs.rBackground;
                })

                objs.gBackground = utility:Draw('Square', {
                    Size = newUDim2(0, 60, 0, 15);
                    Position = newUDim2(0, 70, 1, - 20);
                    ThemeColor = 'Option Background';
                    Parent = objs.background;
                    ZIndex = z+5;
                })

                objs.gBorder = utility:Draw('Square', {
                    Size = newUDim2(1,2,1,2);
                    Position = newUDim2(0,-1,0,-1);
                    Color = c3new(0,0,0);
                    ZIndex = z+4;
                    Parent = objs.gBackground;
                })

                objs.gText = utility:Draw('Text', {
                    Position = newUDim2(.5,0,0,0);
                    Color = c3new(.1,1,.1);
                    Text = 'G';
                    Size = 13;
                    Font = 2;
                    Outline = true;
                    Center = true;
                    ZIndex = z+6;
                    Parent = objs.gBackground;
                })

                objs.bBackground = utility:Draw('Square', {
                    Size = newUDim2(0, 60, 0, 15);
                    Position = newUDim2(0, 135, 1, - 20);
                    ThemeColor = 'Option Background';
                    Parent = objs.background;
                    ZIndex = z+5;
                })

                objs.bBorder = utility:Draw('Square', {
                    Size = newUDim2(1,2,1,2);
                    Position = newUDim2(0,-1,0,-1);
                    Color = c3new(0,0,0);
                    ZIndex = z+4;
                    Parent = objs.bBackground;
                })

                objs.bText = utility:Draw('Text', {
                    Position = newUDim2(.5,0,0,0);
                    Color = c3new(.1,.1,1);
                    Text = 'B';
                    Size = 13;
                    Font = 2;
                    Outline = true;
                    Center = true;
                    ZIndex = z+6;
                    Parent = objs.bBackground;
                })

                local draggingHue, draggingSat, draggingTrans = false, false, false;

                local function updateSatVal(pos)
                    if window.colorpicker.selected ~= nil then
                        local hue, sat, val = window.colorpicker.selected.color:ToHSV()
                        X = (objs.mainColor.Object.Position.X + objs.mainColor.Object.Size.X) - objs.mainColor.Object.Position.X
                        Y = (objs.mainColor.Object.Position.Y + objs.mainColor.Object.Size.Y) - objs.mainColor.Object.Position.Y
                        X = math.clamp((pos.X - objs.mainColor.Object.Position.X) / X, 0, 0.995)
                        Y = math.clamp((pos.Y - objs.mainColor.Object.Position.Y) / Y, 0, 0.995)
                        sat, val = 1 - X, 1 - Y;
                        window.colorpicker.selected:SetColor(fromhsv(hue,sat,val));
                        window.colorpicker:Visualize(fromhsv(hue, sat, val), window.colorpicker.selected.trans);
                    end
                end

                local function updateHue(pos)
                    if window.colorpicker.selected ~= nil then
                        local hue, sat, val = window.colorpicker.selected.color:ToHSV()
                        X = (objs.hue.Object.Position.X + objs.hue.Object.Size.X) - objs.hue.Object.Position.X
                        X = math.clamp((pos.X - objs.hue.Object.Position.X) / X, 0, 0.995)
                        hue = 1 - X
                        window.colorpicker.selected:SetColor(fromhsv(hue,sat,val));
                        window.colorpicker:Visualize(fromhsv(hue, sat, val), window.colorpicker.selected.trans);
                    end
                end

                local function updateTrans(pos)
                    if window.colorpicker.selected ~= nil then
                        Y = (objs.trans.Object.Position.Y + objs.trans.Object.Size.Y) - objs.trans.Object.Position.Y
                        Y = math.clamp((pos.Y - objs.transColor.Object.Position.Y) / Y, 0, 0.995)
                        window.colorpicker.selected:SetTrans(Y);
                        window.colorpicker:Visualize(window.colorpicker.selected.color, Y);
                    end
                end

                utility:Connection(objs.mainDetector.MouseButton1Down, function(pos)
                    draggingSat = true;
                    updateSatVal(pos)
                end)

                utility:Connection(objs.hueDetector.MouseButton1Down, function(pos)
                    draggingHue = true;
                    updateHue(pos)
                end)

                utility:Connection(objs.transDetector.MouseButton1Down, function(pos)
                    draggingTrans = true;
                    updateTrans(pos)
                end)

                utility:Connection(mousemove, function(pos)
                    if draggingSat then
                        updateSatVal(pos)
                    elseif draggingHue then
                        updateHue(pos)
                    elseif draggingTrans then
                        updateTrans(pos)
                    end
                end)

                utility:Connection(button1up, function()
                    draggingSat = false;
                    draggingHue = false;
                    draggingTrans = false;
                end)

            end

            function window.colorpicker:Visualize(c3, a)
                if typeof(c3) ~= 'Color3' then return end
                if typeof(a) ~= 'number' then return end
                local h,s,v = c3:ToHSV();
                h = h == 0 and 1 or h;
                self.color = c3;
                self.trans = a;
                self.objects.mainColor.Color = fromhsv(h,1,1);
                self.objects.transColor.Color = fromhsv(h,s,v);
                self.objects.hueSlider.Position = newUDim2(1 - h, 0,0,0);
                self.objects.transSlider.Position = newUDim2(0,0,a,0);
                self.objects.pointer.Position = newUDim2(1 - s, 0, 1 - v, 0);
                self.objects.statusText.Text = 'Editing : Unknown';
                if self.selected ~= nil then
                    local txt = 'Editing : Unknown';
                    if self.selected.text ~= nil and self.selected.text ~= '' then
                        txt = tostring(self.selected.text)
                    elseif self.selected.flag ~= nil and self.selected.flag ~= '' then
                        txt = tostring(self.selected.flag)
                    end
                    self.objects.statusText.Text = tostring(txt);
                end
            end
            
            window.colorpicker:Visualize(window.colorpicker.color, window.colorpicker.trans)

        end
        -------------------------

        ---- Create Dropdown ----
        do
            -- Default Objects
            do
                local objs = window.dropdown.objects;
                local z = library.zindexOrder.dropdown;

                objs.background = utility:Draw('Square', {
                    Visible = false;
                    Size = newUDim2(1,-3,0,50);
                    Position = newUDim2(0,3,1,0);
                    ThemeColor = 'Background';
                    ZIndex = z;
                    Parent = window.objects.background;
                })

                objs.border1 = utility:Draw('Square', {
                    Size = newUDim2(1,2,1,2);
                    Position = newUDim2(0,-1,0,-1);
                    ThemeColor = 'Border';
                    ZIndex = z-1;
                    Parent = objs.background;
                })

                objs.border2 = utility:Draw('Square', {
                    Size = newUDim2(1,2,1,2);
                    Position = newUDim2(0,-1,0,-1);
                    ThemeColor = 'Border 1';
                    ZIndex = z-2;
                    Parent = objs.border1;
                })

                objs.border3 = utility:Draw('Square', {
                    Size = newUDim2(1,2,1,2);
                    Position = newUDim2(0,-1,0,-1);
                    ThemeColor = 'Border';
                    ZIndex = z-3;
                    Parent = objs.border2;
                })

            end

            function window.dropdown:Refresh()
                if self.selected ~= nil then
                    local list = self.selected
                    for idx, value in next, list.values do
                        local valueObject = self.objects.values[idx]
                        if valueObject == nil then
                            valueObject = {};
                            valueObject.background = utility:Draw('Square', {
                                Size = newUDim2(1,-4,0,18);
                                Color = Color3.new(.25,.25,.25);
                                Transparency = 0;
                                ZIndex = library.zindexOrder.dropdown+1;
                                Parent = self.objects.background;
                            })
                            valueObject.text = utility:Draw('Text', {
                                Position = newUDim2(0,3,0,1);
                                ThemeColor = 'Option Text 2';
                                Text = tostring(value);
                                Size = 13;
                                Font = 2;
                                ZIndex = library.zindexOrder.dropdown+2;
                                Parent = valueObject.background;
                            })
                            valueObject.connection = utility:Connection(valueObject.background.MouseButton1Down, function()
                                local currentList = self.selected
                                if currentList then
                                    local val = currentList.values[idx]
                                    local currentSelected = currentList.selected;
                                    local newSelected = currentList.multi and {} or val;
                                    
                                    if currentList.multi then
                                        for i,v in next, currentSelected do
                                            if v == "none" then continue end
                                            newSelected[i] = v;
                                        end
                                        if table.find(newSelected, val) then
                                            table.remove(newSelected, table.find(newSelected, val));
                                        else
                                            table.insert(newSelected, val)
                                        end
                                    end

                                    currentList:Select(newSelected);
                                    if not currentList.multi then
                                        currentList.open = false;
                                        currentList.objects.openText.Text = '+';
                                        window.dropdown.selected = nil;
                                        window.dropdown.objects.background.Visible = false;
                                    end

                                    for idx, val in next, currentList.values do
                                        local valueObj = self.objects.values[idx]
                                        if valueObj then
                                            valueObj.background.Transparency = (typeof(newSelected) == 'table' and table.find(newSelected, val) or newSelected == val) and 1 or 0
                                        end
                                    end

                                end
                            end)
                            self.objects.values[idx] = valueObject
                        end
                    end

                    for idx, val in next, list.values do
                        local valueObj = self.objects.values[idx]
                        if valueObj then
                            valueObj.background.Transparency = (typeof(list.selected) == 'table' and table.find(list.selected, val) or list.selected == val) and 1 or 0
                        end
                    end

                    local y,padding = 2,2
                    for idx, obj in next, self.objects.values do
                        local valueStr = list.values[idx]
                        obj.background.Visible = valueStr ~= nil
                        if valueStr ~= nil then
                            obj.background.Position = newUDim2(0,2,0,y);
                            obj.text.Text = valueStr;
                            y = y + obj.background.Object.Size.Y + padding;
                        end
                    end

                    self.objects.background.Size = newUDim2(1,-6,0,y);    

                end
            end
        
            window.dropdown:Refresh();
        end
        -------------------------

        local function tooltip(option)
            utility:Connection(option.objects.holder.MouseEnter, function()
                tooltipObjects.background.Visible = (not (option.tooltip == '' or option.tooltip == nil)) and true or false;
                tooltipObjects.riskytext.Visible = option.risky;
                tooltipObjects.text.Position = option.risky and newUDim2(0,60,0,0) or newUDim2(0,3,0,0)
                tooltipObjects.text.Text = tostring(option.tooltip);
                library.CurrentTooltip = option;
            end)
            utility:Connection(option.objects.holder.MouseLeave, function()
                if library.CurrentTooltip == option then
                    library.CurrentTooltip = nil;
                    tooltipObjects.background.Visible = false
                end
            end)
        end


        local visValues = {};

        function window:SetOpen(bool)
            if typeof(bool) == 'boolean' then
                self.open = bool;

                local objs = self.objects.background:GetDescendants()
                table.insert(objs, self.objects.background)

                task.spawn(function()
                    if not bool then
                        task.wait(.1);
                    end
                    self.objects.background.Visible = bool;
                end)

                for _,v in next, objs do
                    if v.Object.Transparency ~= 0 then
                        task.spawn(function()
                            if bool then
                                utility:Tween(v.Object, 'Transparency', visValues[v] or 1, .1);
                            else
                                visValues[v] = v.Object.Transparency;
                                utility:Tween(v.Object, 'Transparency', .05, .1);
                            end
                        end)
                    end
                end

            end
        end

        function window:AddTab(text, order)
            local tab = {
                text = text;
                order = order or #self.tabs+1;
                callback = function() end;
                objects = {};
                sections = {};
            }

            table.insert(self.tabs, tab);

            --- Create Objects ---
            do
                local objs = tab.objects;
                local z = library.zindexOrder.window + 5;

                objs.background = utility:Draw('Square', {
                    Size = newUDim2(0,50,1,0);
                    Parent = self.objects.tabHolder;
                    ThemeColor = 'Unselected Tab Background';
                    ZIndex = z;
                })

                objs.innerBorder = utility:Draw('Square', {
                    Size = newUDim2(1,2,1,2);
                    Position = newUDim2(0,-1,0,-1);
                    ThemeColor = 'Border 1';
                    ZIndex = z-1;
                    Parent = objs.background;
                })
    
                objs.outerBorder = utility:Draw('Square', {
                    Size = newUDim2(1,2,1,2);
                    Position = newUDim2(0,-1,0,-1);
                    ThemeColor = 'Border 3';
                    ZIndex = z-2;
                    Parent = objs.innerBorder;
                })

                objs.topBorder = utility:Draw('Square', {
                    Size = newUDim2(1,0,0,1);
                    ThemeColor = 'Unselected Tab Background';
                    ZIndex = z+1;
                    Parent = objs.background;
                })

                objs.text = utility:Draw('Text', {
                    ThemeColor = 'Unselected Tab Text';
                    Text = text;
                    Size = 13;
                    Font = 2;
                    ZIndex = z+1;
                    Outline = true;
                    Center = true;
                    Parent = objs.background;
                })

                utility:Connection(objs.background.MouseButton1Down, function()
                    tab:Select();
                end)

            end
            ----------------------

            function tab:AddSection(text, side, order)
                local section = {
                    text = tostring(text);
                    side = side == nil and 1 or clamp(side,1,2);
                    order = order or #self.sections+1;
                    enabled = true;
                    objects = {};
                    options = {};
                };

                table.insert(self.sections, section);

                --- Create Objects ---
                do
                    local objs = section.objects;
                    local z = library.zindexOrder.window+15;

                    objs.background = utility:Draw('Square', {
                        ThemeColor = 'Section Background';
                        ZIndex = z;
                        Parent = window.objects['columnholder'..(section.side)];
                    })

                    objs.innerBorder = utility:Draw('Square', {
                        Size = newUDim2(1,2,1,1);
                        Position = newUDim2(0,-1,0,0);
                        ThemeColor = 'Border 3';
                        ZIndex = z-1;
                        Parent = objs.background;
                    })

                    objs.outerBorder = utility:Draw('Square', {
                        Size = newUDim2(1,2,1,1);
                        Position = newUDim2(0,-1,0,0);
                        ThemeColor = 'Border 1';
                        ZIndex = z-2;
                        Parent = objs.innerBorder;
                    })

                    objs.topBorder1 = utility:Draw('Square', {
                        Size = newUDim2(.025,1,0,1);
                        Position = newUDim2(0,-1,0,0);
                        ThemeColor = 'Accent';
                        ZIndex = z+1;
                        Parent = objs.background;
                    })

                    objs.topBorder2 = utility:Draw('Square', {
                        ThemeColor = 'Accent';
                        ZIndex = z+1;
                        Parent = objs.background;
                    })

                    objs.textlabel = utility:Draw('Text', {
                        Position = newUDim2(.0425,0,0,-7);
                        ThemeColor = 'Primary Text';
                        Size = 13;
                        Font = 2;
                        ZIndex = z+1;
                        Parent = objs.background;
                    })

                    objs.optionholder = utility:Draw('Square',{
                        Size = newUDim2(1-.03,0,1,-15);
                        Position = newUDim2(.015,0,0,13);
                        Transparency = 0;
                        ZIndex = z+1;
                        Parent = objs.background;
                    })
                    
                end
                ----------------------

                function section:SetText(text)
                    self.text = tostring(text);
                    self.objects.textlabel.Text = self.text;
                    local x = self.objects.background.Object.Size.X - self.objects.textlabel.TextBounds.X - 13
                    self.objects.topBorder2.Size = newUDim2(0, x, 0, 1)
                    self.objects.topBorder2.Position = newUDim2(1, 1 + -x, 0, 0)
                end

                function section:UpdateOptions()
                    table.sort(self.options, function(a,b)
                        return a.order < b.order
                    end)

                    local ySize, padding = 15, 0;
                    for i,option in next, self.options do
                        option.objects.holder.Visible = option.enabled
                        if option.enabled then
                            option.objects.holder.Position = newUDim2(0,0,0,ySize-15);
                            ySize += option.objects.holder.Object.Size.Y + padding;
                        end
                    end

                    self.objects.background.Size = newUDim2(1,0,0,ySize);

                end

                function section:SetEnabled(bool)
                    if typeof(bool) == 'boolean' then
                        section.enabled = bool;
                        tab:UpdateSections();
                    end
                end

                ------- Options -------

                -- // Toggle
                function section:AddToggle(data)
                    local toggle = {
                        class = 'toggle';
                        flag = data.flag;
                        text = '';
                        tooltip = '';
                        order = #self.options+1;
                        state = false;
                        risky = false;
                        callback = function() end;
                        enabled = true;
                        options = {};
                        objects = {};
                    };

                    local blacklist = {'objects'};
                    for i,v in next, data do
                        if not table.find(blacklist, i) ~= toggle[i] ~= nil then
                            toggle[i] = v
                        end
                    end

                    table.insert(self.options, toggle)

                    if toggle.flag then
                        library.flags[toggle.flag] = toggle.state;
                        library.options[toggle.flag] = toggle;
                    end

                    --- Create Objects ---
                    do
                        local objs = toggle.objects;
                        local z = library.zindexOrder.window+25;

                        objs.holder = utility:Draw('Square', {
                            Size = newUDim2(1,0,0,17);
                            Transparency = 0;
                            ZIndex = z+5;
                            Parent = section.objects.optionholder;
                        })

                        objs.background = utility:Draw('Square', {
                            Size = newUDim2(0,8,0,8);
                            Position = newUDim2(0,2,0,4);
                            ThemeColor = 'Option Background';
                            ZIndex = z+3;
                            Parent = objs.holder;
                        })

                        objs.gradient = utility:Draw('Image', {
                            Size = newUDim2(1,0,1,0);
                            Data = library.images.gradientp45;
                            Transparency = .25;
                            ZIndex = z+4;
                            Parent = objs.background;
                        })

                        objs.border1 = utility:Draw('Square', {
                            Size = newUDim2(1,2,1,2);
                            Position = newUDim2(0,-1,0,-1);
                            ThemeColor = 'Option Border 1';
                            ZIndex = z+2;
                            Parent = objs.background;
                        })

                        objs.border2 = utility:Draw('Square', {
                            Size = newUDim2(1,2,1,2);
                            Position = newUDim2(0,-1,0,-1);
                            ThemeColor = 'Option Border 2';
                            ZIndex = z+1;
                            Parent = objs.border1;
                        })

                        objs.text = utility:Draw('Text', {
                            Position = newUDim2(0,19,0,1);
                            ThemeColor = 'Option Text 3';
                            Size = 13;
                            Font = 2;
                            ZIndex = z+1;
                            Outline = true;
                            Parent = objs.holder;
                        })

                        utility:Connection(objs.holder.MouseEnter, function()
                            objs.border1.ThemeColor = 'Accent';
                        end)

                        utility:Connection(objs.holder.MouseLeave, function()
                            objs.border1.ThemeColor = toggle.state and 'Accent' or 'Option Border 1';
                        end)

                        utility:Connection(objs.holder.MouseButton1Down, function()
                            toggle:SetState(not toggle.state);
                        end)

                    end
                    ----------------------

                    function toggle:SetState(bool, nocallback)
                        if typeof(bool) == 'boolean' then
                            self.state = bool;
                            if self.flag then
                                library.flags[self.flag] = bool;
                            end

                            self.objects.border1.ThemeColor = bool and 'Accent' or (self.objects.holder.Hover and 'Accent' or 'Option Border 1');
                            self.objects.text.ThemeColor = bool and (self.risky and 'Risky Text Enabled' or 'Option Text 1') or (self.risky and 'Risky Text' or 'Option Text 3');
                            self.objects.background.ThemeColor = bool and 'Accent' or 'Option Background';
                            self.objects.background.ThemeColorOffset = bool and -55 or 0

                            if not nocallback then
                                self.callback(bool);
                            end

                        end
                    end

                    function toggle:SetText(str)
                        if typeof(str) == 'string' then
                            self.text = str;
                            self.objects.text.Text = str;
                        end
                    end

                    function toggle:UpdateOptions()
                        table.sort(self.options, function(a,b)
                            return a.order < b.order
                        end)

                        local x, y = 0, 0
                        for i,option in next, self.options do
                            if option.class == 'color' or option.class == 'bind' then
                                option.objects.holder.Position = newUDim2(1,-option.objects.holder.Object.Size.X-x,0,0);
                                x = x + option.objects.holder.Object.Size.X;
                            elseif option.class == 'slider' or option.class == 'list' then
                                option.objects.holder.Position = newUDim2(0,0,1,-option.objects.holder.Object.Size.Y-y);
                                y = y + option.objects.holder.Object.Size.Y;
                            end
                        end

                        self.objects.holder.Size = newUDim2(1,0,0,17 + y);
                        section:UpdateOptions()

                    end

                    -- // Toggle Addons
                    function toggle:AddColor(data)
                        local color = {
                            class = 'color';
                            flag = data.flag;
                            text = '';
                            tooltip = '';
                            order = #self.options+1;
                            callback = function() end;
                            color = Color3.new(1,.995,.995);
                            trans = 0;
                            open = false;
                            enabled = true;
                            objects = {};
                        };
    
                        local blacklist = {'objects'};
                        for i,v in next, data do
                            if not table.find(blacklist, i) and color[i] ~= nil then
                                color[i] = v
                            end
                        end
                        
                        table.insert(self.options, color)
    
                        if color.flag then
                            library.flags[color.flag] = color.color;
                            library.options[color.flag] = color;
                        end
    
                        --- Create Objects ---
                        do
                            local objs = color.objects;
                            local z = library.zindexOrder.window+25;
    
                            objs.holder = utility:Draw('Square', {
                                Size = newUDim2(0,21,0,17);
                                Transparency = 0;
                                ZIndex = z+6;
                                Parent = self.objects.holder;
                            })
    
                            objs.background = utility:Draw('Square', {
                                Size = newUDim2(0,15,0,8);
                                Position = newUDim2(0,4,0,5);
                                ZIndex = z+3;
                                Parent = objs.holder;
                            })
    
                            objs.gradient = utility:Draw('Image', {
                                Size = newUDim2(1,0,1,0);
                                Data = library.images.gradientp45;
                                Transparency = .25;
                                ZIndex = z+4;
                                Parent = objs.background;
                            })
    
                            objs.border1 = utility:Draw('Square', {
                                Size = newUDim2(1,2,1,2);
                                Position = newUDim2(0,-1,0,-1);
                                ThemeColor = 'Option Border 1';
                                ZIndex = z+2;
                                Parent = objs.background;
                            })
    
                            objs.border2 = utility:Draw('Square', {
                                Size = newUDim2(1,2,1,2);
                                Position = newUDim2(0,-1,0,-1);
                                ThemeColor = 'Option Border 2';
                                ZIndex = z+1;
                                Parent = objs.border1;
                            })
    
                            utility:Connection(objs.holder.MouseEnter, function()
                                objs.border1.ThemeColor = 'Accent';
                            end)
    
                            utility:Connection(objs.holder.MouseLeave, function()
                                objs.border1.ThemeColor = color.state and 'Accent' or 'Option Border 1';
                            end)
    
                            utility:Connection(objs.holder.MouseButton1Down, function()
                                color:SetOpen(not color.open);
                            end)
    
                        end
                        ----------------------

    
                        function color:SetColor(c3, nocallback)
                            if typeof(c3) == 'Color3' then
                                local h,s,v = c3:ToHSV(); c3 = fromhsv(h, clamp(s,.005,.995), clamp(v,.005,.995))
                                self.color = c3;
                                self.objects.background.Color = c3;
                                if not nocallback then
                                    self.callback(c3, self.trans);
                                end
                                if self.open then
                                    window.colorpicker:Visualize(self.color, self.trans);
                                end
                                if self.flag then
                                    library.flags[self.flag] = c3;
                                end
                            end
                        end
    
                        function color:SetTrans(trans, nocallback)
                            if typeof(trans) == 'number' then
                                self.trans = trans;
                                if not nocallback then
                                    self.callback(self.color, trans);
                                end
                                if self.open then
                                    window.colorpicker:Visualize(self.color, self.trans);
                                end
                            end
                        end
    
                        function color:SetOpen(bool)
                            if typeof(bool) == 'boolean' then
                                self.open = bool
                                if bool then
                                    if window.colorpicker.selected then
                                        window.colorpicker.selected.open = false;
                                    end
                                    window.colorpicker.selected = color
                                    window.colorpicker.objects.background.Parent = self.objects.background;
                                    window.colorpicker.objects.background.Visible = true;
                                    window.colorpicker:Visualize(color.color, color.trans)
                                elseif window.colorpicker.selected == color then
                                    window.colorpicker.selected = nil;
                                    window.colorpicker.objects.background.Parent = window.objects.background;
                                    window.colorpicker.objects.background.Visible = false;
                                end
                            end
                        end
    
                        tooltip(color);
                        color:SetColor(color.color, true);
                        color:SetTrans(color.trans, true);
                        self:UpdateOptions();
                        return color
                    end

                    function toggle:AddBind(data)
                        local bind = {
                            class = 'bind';
                            flag = data.flag;
                            text = '';
                            tooltip = '';
                            bind = 'none';
                            mode = 'toggle';
                            order = #self.options+1;
                            callback = function() end;
                            keycallback = function() end;
                            indicatorValue = library.keyIndicator:AddValue({value = 'value', key = 'key', enabled = false});
                            noindicator = false;
                            invertindicator = false;
                            state = false;
                            nomouse = false;
                            enabled = true;
                            binding = false;
                            objects = {};
                        };
    
                        local blacklist = {'objects'};
                        for i,v in next, data do
                            if not table.find(blacklist, i) and bind[i] ~= nil then
                                bind[i] = v
                            end
                        end
                        
                        table.insert(self.options, bind)
    
                        if bind.flag then
                            library.options[bind.flag] = bind;
                        end
    
                        --- Create Objects ---
                        do
                            local objs = bind.objects;
                            local z = library.zindexOrder.window+25;
    
                            objs.holder = utility:Draw('Square', {
                                Size = newUDim2(0,0,0,17);
                                Transparency = 0;
                                ZIndex = z+6;
                                Parent = self.objects.holder;
                            })
    
                            objs.keyText = utility:Draw('Text', {
                                ThemeColor = 'Option Text 3';
                                Size = 13;
                                Font = 2;
                                ZIndex = z+1;
                                Parent = objs.holder;
                            })
    
                            utility:Connection(objs.holder.MouseEnter, function()
                                objs.keyText.ThemeColor = 'Accent';
                            end)
    
                            utility:Connection(objs.holder.MouseLeave, function()
                                objs.keyText.ThemeColor = bind.binding and 'Accent' or 'Option Text 3';
                            end)
    
                            utility:Connection(objs.holder.MouseButton1Down, function()
                                if not bind.binding then
                                    bind:SetKeyText('...');
                                    bind.binding = true;
                                end
                            end)
    
                        end
                        ----------------------
    
                        local c
    
                        function bind:SetBind(keybind)
                            if c then
                                c:Disconnect();
                                if bind.flag then
                                    library.flags[bind.flag] = false;
                                end
                                bind.callback(false);
                            end
                            local keyName = 'NONE'
                            self.bind = (keybind and keybind) or keybind or self.bind
                            if self.bind == Enum.KeyCode.Backspace then
                                self.bind = 'none';
                            else
                                keyName = keyNames[keybind] or keybind.Name or keybind
                            end
                            self.keycallback(self.bind);
                            self:SetKeyText(keyName:upper());
                            self.indicatorValue:SetKey((self.text == nil or self.text == '') and (self.flag == nil and 'unknown' or self.flag) or self.text); -- this is so dumb
                            self.indicatorValue:SetValue('['..keyName:upper()..']');
                            self.objects.keyText.ThemeColor = self.objects.holder.Hover and 'Accent' or 'Option Text 3';
                        end
    
                        function bind:SetKeyText(str)
                            str = tostring(str);
                            self.objects.keyText.Text = '['..str..']';
                            self.objects.keyText.Position = newUDim2(0, 2, 0, 2);
                            self.objects.holder.Size = newUDim2(0,self.objects.keyText.TextBounds.X+2,0,17)
                            toggle:UpdateOptions();
                        end
    
                        utility:Connection(UserInputService.InputBegan, function(inp)
                            if UserInputService:GetFocusedTextBox() then
                                return
                            elseif bind.binding then
                                local key = (table.find({Enum.UserInputType.MouseButton1, Enum.UserInputType.MouseButton2, Enum.UserInputType.MouseButton3}, inp.UserInputType) and not bind.nomouse) and inp.UserInputType
                                bind:SetBind(key or (not table.find(blacklistedKeys, inp.KeyCode)) and inp.KeyCode)
                                bind.binding = false
                            elseif (inp.KeyCode == bind.bind or inp.UserInputType == bind.bind) and not bind.binding then
                                if bind.mode == 'toggle' then
                                    bind.state = not bind.state
                                    if bind.flag then
                                        library.flags[bind.flag] = bind.state;
                                    end
                                    bind.callback(bind.state)
                                    local display = bind.state; if bind.invertindicator then display = not bind.state; end
                                    bind.indicatorValue:SetEnabled(display and not bind.noindicator);
                                elseif bind.mode == 'hold' then
                                    if bind.flag then
                                        library.flags[bind.flag] = true;
                                    end
                                    bind.indicatorValue:SetEnabled((not bind.invertindicator and true or false) and not bind.noindicator);
                                    c = utility:Connection(RunService.RenderStepped, function()
                                        if bind.callback then
                                            bind.callback(true);
                                        end
                                    end)
                                end
                            end
                        end)
    
                        utility:Connection(UserInputService.InputEnded, function(inp)
                            if bind.bind ~= 'none' then
                                if inp.KeyCode == bind.bind or inp.UserInputType == bind.bind then
                                    if c then
                                        c:Disconnect();
                                        if bind.flag then
                                            library.flags[bind.flag] = false;
                                        end
                                        if bind.callback then
                                            bind.callback(false);
                                        end
                                        bind.indicatorValue:SetEnabled(bind.invertindicator and true or false);
                                    end
                                end
                            end
                        end)
    
                        tooltip(bind);
                        bind:SetBind(bind.bind);
                        self:UpdateOptions();
                        return bind
                    end

                    function toggle:AddSlider(data)
                        local slider = {
                            class = 'slider';
                            flag = data.flag;
                            suffix = '';
                            tooltip = '';
                            order = #self.options+1;
                            value = 0;
                            min = 0;
                            max = 100;
                            increment = 1;
                            callback = function() end;
                            enabled = true;
                            dragging = false;
                            focused = false;
                            objects = {};
                        };
    
                        local blacklist = {'objects', 'dragging'};
                        for i,v in next, data do
                            if not table.find(blacklist, i) and (slider[i] ~= nil and typeof(slider[i]) == typeof(v)) then
                                slider[i] = v;
                            end
                        end
                   
                        table.insert(self.options, slider)

                        if slider.flag then
                            library.flags[slider.flag] = slider.value;
                            library.options[slider.flag] = slider;
                        end

                        --- Create Objects ---
                        do
                            local objs = slider.objects;
                            local z = library.zindexOrder.window+25;

                            objs.holder = utility:Draw('Square', {
                                Size = newUDim2(1,0,0,20);
                                Transparency = 0;
                                ZIndex = z+6;
                                Parent = toggle.objects.holder;
                            })

                            objs.background = utility:Draw('Square', {
                                Size = newUDim2(1,-4,1,-8);
                                Position = newUDim2(0,2,0,4);
                                ThemeColor = 'Option Background';
                                ZIndex = z+2;
                                Parent = objs.holder;
                            })

                            objs.slider = utility:Draw('Square', {
                                Size = newUDim2(0,0,1,0);
                                ThemeColor = 'Accent';
                                ZIndex = z+3;
                                Parent = objs.background;
                            })

                            objs.border1 = utility:Draw('Square', {
                                Size = newUDim2(1,2,1,2);
                                Position = newUDim2(0,-1,0,-1);
                                ThemeColor = 'Option Border 1';
                                ZIndex = z+1;
                                Parent = objs.background;
                            })

                            objs.border2 = utility:Draw('Square', {
                                Size = newUDim2(1,2,1,2);
                                Position = newUDim2(0,-1,0,-1);
                                ThemeColor = 'Option Border 2';
                                ZIndex = z;
                                Parent = objs.border1;
                            })
    
                            objs.gradient = utility:Draw('Image', {
                                Size = newUDim2(1,0,1,0);
                                Data = library.images.gradientp90;
                                Transparency = .65;
                                ZIndex = z+4;
                                Parent = objs.background;
                            })
    
                            objs.text = utility:Draw('Text', {
                                Position = newUDim2(.5,0,0,-1);
                                ThemeColor = 'Option Text 3';
                                Size = 13;
                                Font = 2;
                                ZIndex = z+5;
                                Outline = true;
                                Center = true;
                                Parent = objs.background;
                            })

                            utility:Connection(objs.holder.MouseEnter, function()
                                objs.border1.ThemeColor = 'Accent';
                            end)
    
                            utility:Connection(objs.holder.MouseLeave, function()
                                objs.border1.ThemeColor = slider.dragging and 'Accent' or 'Option Border 1';
                            end)
    
                            local c;
                            local inputNumber = '';
                            utility:Connection(slider.objects.holder.MouseButton1Down, function()
                                if UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then
                                    if slider.focused then
                                        slider.focused = false;
                                        c:Disconnect();
                                    else
                                        objs.text.Text = tostring(slider.value)..tostring(slider.suffix)..'/'..tostring(slider.max)..tostring(slider.suffix)..' []';
                                        slider.focused = true;
                                        inputNumber = '';
                                        c = utility:Connection(UserInputService.InputBegan, function(inp)
                                            if library.numberStrings[inp.KeyCode.Name] then
                                                local number = library.numberStrings[inp.KeyCode.Name];
                                                inputNumber = inputNumber..tostring(number);
						                        objs.text.Text = string.format("%.14g", slider.value) .. tostring(slider.suffix) .. "/" .. slider.max .. tostring(slider.suffix) .. " [" .. inputNumber .. "]";
                                            elseif inp.KeyCode == Enum.KeyCode.Backspace then
                                                inputNumber = inputNumber:sub(1,-2);
                                                objs.text.Text = string.format("%.14g", slider.value)..tostring(slider.suffix)..'/'..slider.max..tostring(slider.suffix)..' ['..inputNumber..']';
                                            elseif inp.KeyCode == Enum.KeyCode.Return then
                                                slider:SetValue(tonumber(inputNumber))
                                                slider.focused = false;
                                                c:Disconnect();
                                            elseif inp.KeyCode == Enum.KeyCode.Escape then
                                                slider:SetValue(slider.value, true)
                                                slider.focused = false;
                                                c:Disconnect();
                                            end
                                        end)
                                    end
                                else
                                    slider.dragging = true;
                                    library.draggingSlider = slider;
                                end
                            end)
    
                            utility:Connection(button1up, function()
                                objs.border1.ThemeColor = objs.holder.Hover and 'Accent' or 'Option Border 1';
                                slider.dragging = false;
                                library.draggingSlider = nil;
                            end)
    
                        end
                        ----------------------
    
                        function slider:SetValue(value, nocallback)
                            if typeof(value) == 'number' then
                                local newValue = clamp(self.increment * floor(value/self.increment), self.min, self.max);
                                local size, pos = self.objects.slider.Size, self.objects.slider.Position;
    
                                if self.min >= 0 then
                                    size = newUDim2((newValue - self.min) / (self.max - self.min), 0, 1, 0);
                                else
                                    size = newUDim2(newValue / (self.max - self.min), 0, 1, 0);
                                    pos = newUDim2((0 - self.min) / (self.max - self.min), 0, 0, 0);
                                end
    
                                utility:Tween(self.objects.slider, 'Size', size, .05, Enum.EasingDirection.Out, Enum.EasingStyle.Quad);
                                utility:Tween(self.objects.slider, 'Position', pos, .05, Enum.EasingDirection.Out, Enum.EasingStyle.Quad);
    
                                self.value = newValue;
                                library.flags[self.flag] = newValue;
                                self.objects.text.Text = string.format("%.14g",newValue)..tostring(self.suffix)..'/'..self.max..tostring(self.suffix);
                                self.objects.text.ThemeColor = (self.min < 0 and newValue == 0 or newValue == self.min)  and (self.risky and 'Risky Text' or 'Option Text 3') or (self.risky and 'Risky Text Enabled' or 'Option Text 1');
    
                                if not nocallback then
                                    self.callback(newValue);
                                end
    
                            end
                        end

                        tooltip(slider);
                        slider:SetValue(slider.value, true);
                        self:UpdateOptions();
                        return slider
                    end

                    function toggle:AddList(data)
                        local list = {
                            class = 'list';
                            flag = data.flag;
                            text = '';
                            selected = '';
                            tooltip = '';
                            order = #self.options+1;
                            callback = function() end;
                            enabled = true;
                            multi = false;
                            open = false;
                            values = {};
                            objects = {};
                        }
    
                        table.insert(self.options, list);
    
                        local blacklist = {'objects'};
                        for i,v in next, data do
                            if not table.find(blacklist, i) ~= list[i] ~= nil then
                                list[i] = v
                            end
                        end
    
                        if list.flag then
                            library.flags[list.flag] = list.selected;
                            library.options[list.flag] = list;
                        end
    
                        -- Create Objects --
                        do
                            local objs = list.objects;
                            local z = library.zindexOrder.window+25;
    
                            objs.holder = utility:Draw('Square', {
                                Size = newUDim2(1,0,0,22);
                                Transparency = 0;
                                ZIndex = z+6;
                                Parent = toggle.objects.holder;
                            })
    
                            objs.background = utility:Draw('Square', {
                                Size = newUDim2(1,-4,1,-8);
                                Position = newUDim2(0,2,0,4);
                                ThemeColor = 'Option Background';
                                ZIndex = z+2;
                                Parent = objs.holder;
                            })
    
                            objs.border1 = utility:Draw('Square', {
                                Size = newUDim2(1,2,1,2);
                                Position = newUDim2(0,-1,0,-1);
                                ThemeColor = 'Option Border 1';
                                ZIndex = z+1;
                                Parent = objs.background;
                            })
    
                            objs.border2 = utility:Draw('Square', {
                                Size = newUDim2(1,2,1,2);
                                Position = newUDim2(0,-1,0,-1);
                                ThemeColor = 'Option Border 2';
                                ZIndex = z;
                                Parent = objs.border1;
                            })
    
                            objs.gradient = utility:Draw('Image', {
                                Size = newUDim2(1,0,1,0);
                                Data = library.images.gradientp90;
                                Transparency = .65;
                                ZIndex = z+4;
                                Parent = objs.background;
                            })
    
                            objs.inputText = utility:Draw('Text', {
                                Position = newUDim2(0,4,0,0);
                                ThemeColor = 'Option Text 2';
                                Text = 'none',
                                Size = 13;
                                Font = 2;
                                ZIndex = z+5;
                                Outline = true;
                                Parent = objs.background;
                            })
    
                            objs.openText = utility:Draw('Text', {
                                Position = newUDim2(1,-10,0,0);
                                ThemeColor = 'Option Text 3';
                                Text = '+';
                                Size = 13;
                                Font = 2;
                                ZIndex = z+5;
                                Outline = true;
                                Parent = objs.background;
                            })
    
                            utility:Connection(objs.holder.MouseEnter, function()
                                objs.border1.ThemeColor = 'Accent';
                            end)
    
                            utility:Connection(objs.holder.MouseLeave, function()
                                objs.border1.ThemeColor = 'Option Border 1';
                            end)
    
                            utility:Connection(objs.holder.MouseButton1Down, function()
                                if list.open then
                                    list.open = false;
                                    objs.openText.Text = '+';
                                    if window.dropdown.selected == list then
                                        window.dropdown.selected = nil;
                                        window.dropdown.objects.background.Visible = false;
                                    end
                                else
                                    if window.dropdown.selected ~= nil then
                                        window.dropdown.selected.open = false
                                    end
                                    list.open = true;
                                    objs.openText.Text = '-';
                                    window.dropdown.selected = list;
                                    window.dropdown.objects.background.Visible = true;
                                    window.dropdown.objects.background.Parent = objs.holder;
                                    window.dropdown:Refresh();
                                end
                            end)
    
    
                        end
                        --------------------
    
                        function list:Select(option, nocallback)
                            option = typeof(option) == 'table' and (self.multi == true and option or (#option == 0 and nil or option[1])) or self.multi == true and {option} or option;
                            if option ~= nil then
                                self.selected = option;
                                local text = typeof(option) == 'table' and (#option == 0 and "none" or table.concat(option, ', ')) or tostring(option);
                                local label = self.objects.inputText
                                label.Text = text;
                                if label.TextBounds.X > self.objects.background.Object.Size.X - 10 then
                                    local split = text:split('');
                                    for i = 1,#split do
                                        label.Text = table.concat(split, '', 1, i)
                                        if label.TextBounds.X > self.objects.background.Object.Size.X - 10 then
                                            label.Text = label.Text:sub(1,-6)..'...';
                                            break
                                        end
                                    end
                                end
                                if self.flag then
                                    library.flags[self.flag] = self.selected
                                end
                                if not nocallback then
                                    self.callback(self.selected);
                                end
                            end
                        end
    
                        function list:AddValue(value)
                            table.insert(list.values, tostring(value));
                            if window.dropdown.selected == list then
                                window.dropdown:Refresh()
                            end
                        end
    
                        function list:RemoveValue(value)
                            if table.find(list.values, value) then
                                table.remove(list.values, table.find(list.values, value));
                                if window.dropdown.selected == list then
                                    window.dropdown:Refresh()
                                end
                            end
                        end
    
                        function list:ClearValues()
                            table.clear(list.values);
                            if window.dropdown.selected == list then
                                window.dropdown:Refresh()
                            end
                        end
    
                        tooltip(list);
                        list:Select((data.value or data.selected) or (list.multi and 'none' or list.values[1]), true);
                        self:UpdateOptions();
                        return list
                    end

                    tooltip(toggle);
                    toggle:SetText(toggle.text);
                    toggle:SetState(toggle.state, true);
                    self:UpdateOptions();
                    return toggle
                end

                -- // Slider
                function section:AddSlider(data)
                    local slider = {
                        class = 'slider';
                        flag = data.flag;
                        text = '';
                        tooltip = '';
                        suffix = '';
                        order = #self.options+1;
                        value = 0;
                        min = 0;
                        max = 100;
                        increment = 1;
                        callback = function() end;
                        enabled = true;
                        dragging = false;
                        focused = false;
                        risky = false;
                        objects = {};
                    };

                    local blacklist = {'objects', 'dragging'};
                    for i,v in next, data do
                        if not table.find(blacklist, i) and (slider[i] ~= nil and typeof(slider[i]) == typeof(v)) then
                            slider[i] = v;
                        end
                    end
                    
                    table.insert(self.options, slider)

                    if slider.flag then
                        library.flags[slider.flag] = slider.value;
                        library.options[slider.flag] = slider;
                    end

                    --- Create Objects ---
                    do
                        local objs = slider.objects;
                        local z = library.zindexOrder.window+25;

                        objs.holder = utility:Draw('Square', {
                            Size = newUDim2(1,0,0,32);
                            Transparency = 0;
                            ZIndex = z+4;
                            Parent = section.objects.optionholder;
                        })

                        objs.background = utility:Draw('Square', {
                            Size = newUDim2(1,-4,0,11);
                            Position = newUDim2(0,2,1,-14);
                            ThemeColor = 'Option Background';
                            ZIndex = z+2;
                            Parent = objs.holder;
                        })

                        objs.slider = utility:Draw('Square', {
                            Size = newUDim2(0,0,1,0);
                            ThemeColor = 'Accent';
                            ZIndex = z+3;
                            Parent = objs.background;
                        })

                        objs.border1 = utility:Draw('Square', {
                            Size = newUDim2(1,2,1,2);
                            Position = newUDim2(0,-1,0,-1);
                            ThemeColor = 'Option Border 1';
                            ZIndex = z+1;
                            Parent = objs.background;
                        })

                        objs.border2 = utility:Draw('Square', {
                            Size = newUDim2(1,2,1,2);
                            Position = newUDim2(0,-1,0,-1);
                            ThemeColor = 'Option Border 2';
                            ZIndex = z;
                            Parent = objs.border1;
                        })

                        objs.gradient = utility:Draw('Image', {
                            Size = newUDim2(1,0,1,0);
                            Data = library.images.gradientp90;
                            Transparency = .65;
                            ZIndex = z+4;
                            Parent = objs.background;
                        })

                        objs.text = utility:Draw('Text', {
                            Position = newUDim2(0,2,0,1);
                            ThemeColor = 'Option Text 3';
                            Size = 13;
                            Font = 2;
                            ZIndex = z+1;
                            Outline = true;
                            Parent = objs.holder;
                        })

                        objs.plusDetector = utility:Draw('Square', {
                            Size = newUDim2(0,14,0,14);
                            Position = newUDim2(1,-28,0,1);
                            Transparency = 0;
                            ZIndex = z+5;
                            Parent = objs.holder;
                        })

                        objs.minusDetector = utility:Draw('Square', {
                            Size = newUDim2(0,14,0,14);
                            Position = newUDim2(1,-14,0,1);
                            Transparency = 0;
                            ZIndex = z+5;
                            Parent = objs.holder;
                        })

                        objs.plusText = utility:Draw('Text', {
                            Position = newUDim2(.5,0,0,-1);
                            ThemeColor = 'Option Text 3';
                            Text = '+';
                            Size = 13;
                            Font = 2;
                            ZIndex = z+4;
                            Center = true;
                            Outline = true;
                            Parent = objs.plusDetector;
                        })

                        objs.minusText = utility:Draw('Text', {
                            Position = newUDim2(.5,0,0,-1);
                            ThemeColor = 'Option Text 3';
                            Text = '-';
                            Size = 13;
                            Font = 2;
                            ZIndex = z+4;
                            Center = true;
                            Outline = true;
                            Parent = objs.minusDetector;
                        })

                        utility:Connection(objs.holder.MouseEnter, function()
                            objs.border1.ThemeColor = 'Accent';
                        end)

                        utility:Connection(objs.holder.MouseLeave, function()
                            objs.border1.ThemeColor = slider.dragging and 'Accent' or 'Option Border 1';
                        end)

                        utility:Connection(slider.objects.plusDetector.MouseButton1Down,function()
                            slider:SetValue(slider.value + (UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) and 10 or slider.increment))
                        end)
    
                        utility:Connection(slider.objects.minusDetector.MouseButton1Down,function()
                            slider:SetValue(slider.value - (UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) and 10 or slider.increment))
                        end)


                        local c;
                        local inputNumber = '';
                        utility:Connection(slider.objects.holder.MouseButton1Down, function()
                            if UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then
                                if slider.focused then
                                    slider.focused = false;
                                    c:Disconnect();
                                else
                                    objs.text.Text = slider.text..': '..tostring(slider.value)..tostring(slider.suffix)..' []';
                                    slider.focused = true;
                                    inputNumber = '';
                                    c = utility:Connection(UserInputService.InputBegan, function(inp)
                                        if library.numberStrings[inp.KeyCode.Name] then
                                            local number = library.numberStrings[inp.KeyCode.Name];
                                            inputNumber = inputNumber..tostring(number);
                                            objs.text.Text = slider.text..': '..string.format("%.14g",slider.value)..tostring(slider.suffix)..' ['..inputNumber..']';
                                        elseif inp.KeyCode == Enum.KeyCode.Backspace then
                                            inputNumber = inputNumber:sub(1,-2);
                                            objs.text.Text = slider.text..': '..string.format("%.14g",slider.value)..tostring(slider.suffix)..' ['..inputNumber..']';
                                        elseif inp.KeyCode == Enum.KeyCode.Return then
                                            slider:SetValue(tonumber(inputNumber))
                                            slider.focused = false;
                                            c:Disconnect();
                                        elseif inp.KeyCode == Enum.KeyCode.Escape then
                                            slider:SetValue(slider.value, true)
                                            slider.focused = false;
                                            c:Disconnect();
                                        end
                                    end)

                                end


                            else
                                slider.dragging = true;
                                library.draggingSlider = slider;
                            end
                        end)

                        utility:Connection(button1up, function()
                            objs.border1.ThemeColor = objs.holder.Hover and 'Accent' or 'Option Border 1';
                            slider.dragging = false;
                            library.draggingSlider = nil;
                        end)

                    end
                    ----------------------

                    function slider:SetValue(value, nocallback)
                        if typeof(value) == 'number' then
                            local newValue = clamp(self.increment * floor(value/self.increment), self.min, self.max);
                            local size, pos = self.objects.slider.Size, self.objects.slider.Position;

                            if self.min >= 0 then
                                size = newUDim2((newValue - self.min) / (self.max - self.min), 0, 1, 0);
                            else
                                size = newUDim2(newValue / (self.max - self.min), 0, 1, 0);
                                pos = newUDim2((0 - self.min) / (self.max - self.min), 0, 0, 0);
                            end

                            utility:Tween(self.objects.slider, 'Size', size, .05, Enum.EasingDirection.Out, Enum.EasingStyle.Quad);
                            utility:Tween(self.objects.slider, 'Position', pos, .05, Enum.EasingDirection.Out, Enum.EasingStyle.Quad);

                            self.value = newValue;
                            library.flags[self.flag] = newValue;
                            self.objects.text.Text = slider.text..': '..string.format("%.14g",newValue)..tostring(self.suffix);
                            self.objects.text.ThemeColor = (self.min < 0 and newValue == 0 or newValue == self.min)  and (self.risky and 'Risky Text' or 'Option Text 3') or (self.risky and 'Risky Text Enabled' or 'Option Text 1');

                            if not nocallback then
                                self.callback(newValue);
                            end

                        end
                    end

                    function slider:SetText(str)
                        if typeof(str) == 'string' then
                            self.text = str;
                            self.objects.text.Text = str..': '..tostring(self.value)..tostring(self.suffix);
                        end
                    end

                    tooltip(slider);
                    slider:SetText(slider.text);
                    slider:SetValue(slider.value, true);
                    self:UpdateOptions();
                    return slider
                end

                -- // Button
                function section:AddButton(data)
                    local button = {
                        class = 'button';
                        flag = data.flag;
                        text = '';
                        suffix = '';
                        tooltip = '';
                        order = #self.options+1;
                        callback = function() end;
                        confirm = false;
                        enabled = true;
                        risky = false;
                        objects = {};
                        subbuttons = {};
                    };

                    local blacklist = {'objects'};
                    for i,v in next, data do
                        if not table.find(blacklist, i) and button[i] ~= nil then
                            button[i] = v;
                        end
                    end
           
                    table.insert(self.options, button)

                    if button.flag then
                        library.options[button.flag] = button;
                    end

                    --- Create Objects ---
                    do
                        local objs = button.objects;
                        local z = library.zindexOrder.window+25;

                        objs.holder = utility:Draw('Square', {
                            Size = newUDim2(1,0,0,22);
                            Transparency = 0;
                            ZIndex = z+4;
                            Parent = section.objects.optionholder;
                        })

                        objs.background = utility:Draw('Square', {
                            Size = newUDim2(1,-4,0,14);
                            Position = newUDim2(0,2,0,4);
                            ThemeColor = 'Option Background';
                            ZIndex = z+2;
                            Parent = objs.holder;
                        })

                        objs.border1 = utility:Draw('Square', {
                            Size = newUDim2(1,2,1,2);
                            Position = newUDim2(0,-1,0,-1);
                            ThemeColor = 'Option Border 1';
                            ZIndex = z+1;
                            Parent = objs.background;
                        })

                        objs.border2 = utility:Draw('Square', {
                            Size = newUDim2(1,2,1,2);
                            Position = newUDim2(0,-1,0,-1);
                            ThemeColor = 'Option Border 2';
                            ZIndex = z;
                            Parent = objs.border1;
                        })

                        objs.gradient = utility:Draw('Image', {
                            Size = newUDim2(1,0,1,0);
                            Data = library.images.gradientp90;
                            Transparency = .65;
                            ZIndex = z+3;
                            Parent = objs.background;
                        })

                        objs.text = utility:Draw('Text', {
                            Position = newUDim2(.5,0,0,0);
                            ThemeColor = 'Option Text 3';
                            Size = 13;
                            Font = 2;
                            ZIndex = z+4;
                            Outline = true;
                            Center = true;
                            Parent = objs.background;
                        })

                        utility:Connection(objs.holder.MouseEnter, function()
                            objs.border1.ThemeColor = 'Accent';
                        end)

                        utility:Connection(objs.holder.MouseLeave, function()
                            objs.border1.ThemeColor = 'Option Border 1';
                            objs.text.ThemeColor = self.risky and 'Risky Text' or 'Option Text 3';
                            objs.background.ThemeColor = 'Option Background';
                            objs.background.ThemeColorOffset = 0;
                        end)

                        utility:Connection(objs.holder.MouseButton1Up, function()
                            objs.text.ThemeColor = self.risky and 'Risky Text' or  'Option Text 3';
                            objs.background.ThemeColor = 'Option Background';
                            objs.background.ThemeColorOffset = 0;
                        end)

                        local clicked, counting = false, false
                        utility:Connection(objs.holder.MouseButton1Down, function()
                            objs.text.ThemeColor = self.risky and 'Risky Text Enabled' or 'Option Text 2';
                            objs.background.ThemeColor = 'Accent';
                            objs.background.ThemeColorOffset = -95;

                            task.spawn(function() -- this is ugly and i do not care :)
                                if button.confirm then
                                    if clicked then
                                        clicked = false
                                        counting = false
                                        objs.text.Text = button.text
                                        button.callback()
                                    else
                                        clicked = true
                                        counting = true
                                        for i = 3,1,-1 do
                                            if not counting then
                                                break
                                            end
                                            objs.text.Text = 'Confirm '..button.text..'? '..tostring(i)
                                            wait(1)
                                        end
                                        clicked = false
                                        counting = false
                                        objs.text.Text = button.text
                                    end
                                else
                                    button.callback()
                                end
                            end)

                        end)

                    end
                    ----------------------
                    function button:AddButton(data)
                        local button = {
                            class = 'button';
                            flag = data.flag;
                            text = '';
                            suffix = '';
                            tooltip = '';
                            order = #self.subbuttons+1;
                            callback = function() end;
                            confirm = false;
                            enabled = true;
                            objects = {};
                        };
    
                        local blacklist = {'objects'};
                        for i,v in next, data do
                            if not table.find(blacklist, i) and button[i] ~= nil then
                                button[i] = v;
                            end
                        end
               
                        table.insert(self.subbuttons, button)
    
                        if button.flag then
                            library.options[button.flag] = button;
                        end
    
                        --- Create Objects ---
                        do
                            local objs = button.objects;
                            local z = library.zindexOrder.window+25;
    
                            objs.holder = utility:Draw('Square', {
                                Size = newUDim2(1,0,1,0);
                                Transparency = 0;
                                ZIndex = z+5;
                                Parent = self.objects.holder;
                            })
    
                            objs.background = utility:Draw('Square', {
                                Size = newUDim2(1,-4,1,-8);
                                Position = newUDim2(0,2,0,4);
                                ThemeColor = 'Option Background';
                                ZIndex = z+2;
                                Parent = objs.holder;
                            })
    
                            objs.border1 = utility:Draw('Square', {
                                Size = newUDim2(1,2,1,2);
                                Position = newUDim2(0,-1,0,-1);
                                ThemeColor = 'Option Border 1';
                                ZIndex = z+1;
                                Parent = objs.background;
                            })
    
                            objs.border2 = utility:Draw('Square', {
                                Size = newUDim2(1,2,1,2);
                                Position = newUDim2(0,-1,0,-1);
                                ThemeColor = 'Option Border 2';
                                ZIndex = z;
                                Parent = objs.border1;
                            })
    
                            objs.gradient = utility:Draw('Image', {
                                Size = newUDim2(1,0,1,0);
                                Data = library.images.gradientp90;
                                Transparency = .65;
                                ZIndex = z+3;
                                Parent = objs.background;
                            })
    
                            objs.text = utility:Draw('Text', {
                                Position = newUDim2(.5,0,0,0);
                                ThemeColor = 'Option Text 3';
                                Size = 13;
                                Font = 2;
                                ZIndex = z+4;
                                Outline = true;
                                Center = true;
                                Parent = objs.background;
                            })
    
                            utility:Connection(objs.holder.MouseEnter, function()
                                objs.border1.ThemeColor = 'Accent';
                            end)
    
                            utility:Connection(objs.holder.MouseLeave, function()
                                objs.border1.ThemeColor = 'Option Border 1';
                                objs.text.ThemeColor = self.risky and 'Risky Text' or 'Option Text 3';
                                objs.background.ThemeColor = 'Option Background';
                                objs.background.ThemeColorOffset = 0;
                            end)
    
                            utility:Connection(objs.holder.MouseButton1Up, function()
                                objs.text.ThemeColor = self.risky and 'Risky Text' or 'Option Text 3';
                                objs.background.ThemeColor = 'Option Background';
                                objs.background.ThemeColorOffset = 0;
                            end)
    
                            local clicked, counting = false, false
                            utility:Connection(objs.holder.MouseButton1Down, function()
                                objs.text.ThemeColor = self.risky and 'Risky Text Enabled' or 'Option Text 2';
                                objs.background.ThemeColor = 'Accent';
                                objs.background.ThemeColorOffset = -95;
    
                                task.spawn(function() -- this is ugly and i do not care :)
                                    if button.confirm then
                                        if clicked then
                                            clicked = false
                                            counting = false
                                            objs.text.Text = button.text
                                            button.callback()
                                        else
                                            clicked = true
                                            counting = true
                                            for i = 3,1,-1 do
                                                if not counting then
                                                    break
                                                end
                                                objs.text.Text = 'Confirm '..button.text..'? '..tostring(i)
                                                wait(1)
                                            end
                                            clicked = false
                                            counting = false
                                            objs.text.Text = button.text
                                        end
                                    else
                                        button.callback()
                                    end
                                end)
    
                            end)
    
                        end
                        ----------------------
    
                        function button:SetText(str)
                            if typeof(str) == 'string' then
                                self.text = str;
                                self.objects.text.Text = str;
                            end
                        end
    
                        tooltip(button);
                        button:SetText(button.text);
                        self:UpdateOptions();
                        return button
                    end
                    ----------------------

                    function button:UpdateOptions() -- this so dumb XD
                        local buttons = 1 + #self.subbuttons;
                        local buttonSize = (1 / buttons) - .005;
                        self.objects.background.Size = newUDim2(buttonSize,-4,0,14);
                        for i,v in next, self.subbuttons do
                            v.objects.holder.Size = newUDim2(buttonSize,0,1,0);
                            v.objects.holder.Position = newUDim2(i * buttonSize + .01, 0, 0, 0)
                        end
                    end

                    function button:SetText(str)
                        if typeof(str) == 'string' then
                            self.text = str;
                            self.objects.text.Text = str;
                        end
                    end

                    tooltip(button);
                    button:SetText(button.text);
                    self:UpdateOptions();
                    return button
                end

                -- // Separator
                function section:AddSeparator(data)
                    local separator = {
                        class = 'separator';
                        flag = data.flag;
                        text = '';
                        order = #self.options+1;
                        enabled = true;
                        objects = {};
                    };

                    local blacklist = {'objects', 'dragging'};
                    for i,v in next, data do
                        if not table.find(blacklist, i) and (separator[i] ~= nil and typeof(separator[i]) == typeof(v)) then
                            separator[i] = v;
                        end
                    end
           
                    table.insert(self.options, separator)

                    --- Create Objects ---
                    do
                        local objs = separator.objects;
                        local z = library.zindexOrder.window+25;

                        objs.holder = utility:Draw('Square', {
                            Size = newUDim2(1,0,0,18);
                            Transparency = 0;
                            ZIndex = z;
                            Parent = section.objects.optionholder;
                        })

                        objs.line1 = utility:Draw('Square', {
                            Position = newUDim2(0,0,0,1);
                            ThemeColor = 'Option Background';
                            ZIndex = z+1;
                            Parent = objs.holder;
                        })

                        objs.line2 = utility:Draw('Square', {
                            Position = newUDim2(0,0,0,1);
                            ThemeColor = 'Option Background';
                            ZIndex = z+1;
                            Parent = objs.holder;
                        })

                        objs.border1 = utility:Draw('Square', {
                            Size = newUDim2(1,2,1,2);
                            Position = newUDim2(0,-1,0,-1);
                            ThemeColor = 'Option Border 2';
                            ZIndex = z;
                            Parent = objs.line1;
                        })

                        objs.border2 = utility:Draw('Square', {
                            Size = newUDim2(1,2,1,2);
                            Position = newUDim2(0,-1,0,-1);
                            ThemeColor = 'Option Border 2';
                            ZIndex = z;
                            Parent = objs.line2;
                        })

                        objs.text = utility:Draw('Text', {
                            Position = newUDim2(.5,0,0,1);
                            ThemeColor = 'Option Text 2';
                            Size = 13;
                            Font = 2;
                            ZIndex = z;
                            Outline = true;
                            Center = true;
                            Parent = objs.holder;
                        })

                    end
                    ----------------------

                    function separator:SetText(str)
                        if typeof(str) == 'string' then
                            self.text = str;
                            self.objects.text.Text = str;
                            local xScale = ( 1- utility:ConvertNumberRange(self.objects.text.TextBounds.X, 0, self.objects.holder.Object.Size.X, 0, 1)) / 2 - (str == '' and 0 or .04)
                            self.objects.line1.Size = newUDim2(xScale, 0, 0, 1)
                            self.objects.line2.Size = newUDim2(xScale, 0, 0, 1)
                            self.objects.line1.Position = newUDim2(0,1,.5,-1)
                            self.objects.line2.Position = newUDim2(1 - self.objects.line2.Size.X.Scale,-1,.5,-1)
                        end
                    end

                    separator:SetText(separator.text);
                    self:UpdateOptions();
                    return separator
                end

                -- // Color Picker
                function section:AddColor(data)
                    local color = {
                        class = 'color';
                        flag = data.flag;
                        text = '';
                        tooltip = '';
                        order = #self.options+1;
                        callback = function() end;
                        color = Color3.new(1,.995,.995);
                        trans = 0;
                        open = false;
                        enabled = true;
                        risky = false;
                        objects = {};
                    };

                    local blacklist = {'objects'};
                    for i,v in next, data do
                        if not table.find(blacklist, i) and color[i] ~= nil then
                            color[i] = v
                        end
                    end
                    
                    table.insert(self.options, color)

                    if color.flag then
                        library.flags[color.flag] = color.color;
                        library.options[color.flag] = color;
                    end

                    --- Create Objects ---
                    do
                        local objs = color.objects;
                        local z = library.zindexOrder.window+25;

                        objs.holder = utility:Draw('Square', {
                            Size = newUDim2(1,0,0,19);
                            Transparency = 0;
                            ZIndex = z+5;
                            Parent = section.objects.optionholder;
                        })

                        objs.background = utility:Draw('Square', {
                            Size = newUDim2(0,15,0,8);
                            Position = newUDim2(1,-16,0,5);
                            ZIndex = z+3;
                            Parent = objs.holder;
                        })

                        objs.gradient = utility:Draw('Image', {
                            Size = newUDim2(1,0,1,0);
                            Data = library.images.gradientp45;
                            Transparency = .25;
                            ZIndex = z+4;
                            Parent = objs.background;
                        })

                        objs.border1 = utility:Draw('Square', {
                            Size = newUDim2(1,2,1,2);
                            Position = newUDim2(0,-1,0,-1);
                            ThemeColor = 'Option Border 1';
                            ZIndex = z+2;
                            Parent = objs.background;
                        })

                        objs.border2 = utility:Draw('Square', {
                            Size = newUDim2(1,2,1,2);
                            Position = newUDim2(0,-1,0,-1);
                            ThemeColor = 'Option Border 2';
                            ZIndex = z+1;
                            Parent = objs.border1;
                        })

                        objs.text = utility:Draw('Text', {
                            Position = newUDim2(0,2,0,2);
                            ThemeColor = color.risky and 'Risky Text Enabled' or 'Option Text 3';
                            Size = 13;
                            Font = 2;
                            ZIndex = z+1;
                            Outline = true;
                            Parent = objs.holder;
                        })

                        utility:Connection(objs.holder.MouseEnter, function()
                            objs.border1.ThemeColor = 'Accent';
                        end)

                        utility:Connection(objs.holder.MouseLeave, function()
                            objs.border1.ThemeColor = color.state and 'Accent' or 'Option Border 1';
                        end)

                        utility:Connection(objs.holder.MouseButton1Down, function()
                            color:SetOpen(not color.open);
                        end)

                    end
                    ----------------------

                    function color:SetText(str)
                        if typeof(str) == 'string' then
                            self.text = str;
                            self.objects.text.Text = str;
                        end
                    end

                    function color:SetColor(c3, nocallback)
                        if typeof(c3) == 'Color3' then
                            local h,s,v = c3:ToHSV(); c3 = fromhsv(h, clamp(s,.005,.995), clamp(v,.005,.995));
                            self.color = c3;
                            self.objects.background.Color = c3;
                            if not nocallback then
                                self.callback(c3, self.trans);
                            end
                            if self.open then
                                window.colorpicker:Visualize(self.color, self.trans);
                            end
                            if self.flag then
                                library.flags[self.flag] = c3;
                            end
                        end
                    end

                    function color:SetTrans(trans, nocallback)
                        if typeof(trans) == 'number' then
                            self.trans = trans;
                            if not nocallback then
                                self.callback(self.color, trans);
                            end
                            if self.open then
                                window.colorpicker:Visualize(self.color, self.trans);
                            end
                        end
                    end

                    function color:SetOpen(bool)
                        if typeof(bool) == 'boolean' then
                            self.open = bool
                            if bool then
                                if window.colorpicker.selected then
                                    window.colorpicker.selected.open = false;
                                end
                                window.colorpicker.selected = color
                                window.colorpicker.objects.background.Parent = self.objects.background;
                                window.colorpicker.objects.background.Visible = true;
                                window.colorpicker:Visualize(color.color, color.trans)
                            elseif window.colorpicker.selected == color then
                                window.colorpicker.selected = nil;
                                window.colorpicker.objects.background.Parent = window.objects.background;
                                window.colorpicker.objects.background.Visible = false;
                            end
                        end
                    end

                    tooltip(color);
                    color:SetText(color.text);
                    color:SetColor(color.color, true);
                    color:SetTrans(color.trans, true);
                    self:UpdateOptions();
                    return color
                end

                -- // Text Box
                function section:AddBox(data)
                    local box = {
                        class = 'box';
                        flag = data.flag;
                        text = '';
                        input = '';
                        order = #self.options+1;
                        callback = function() end;
                        enabled = true;
                        focused = false;
                        risky = false;
                        objects = {};
                    };

                    local blacklist = {'objects', 'dragging'};
                    for i,v in next, data do
                        if not table.find(blacklist, i) and box[i] ~= nil then
                            box[i] = v;
                        end
                    end
                    
                    table.insert(self.options, box)

                    if box.flag then
                        library.flags[box.flag] = box.input;
                        library.options[box.flag] = box;
                    end

                    --- Create Objects ---
                    do
                        local objs = box.objects;
                        local z = library.zindexOrder.window+25;

                        objs.holder = utility:Draw('Square', {
                            Size = newUDim2(1,0,0,37);
                            Transparency = 0;
                            ZIndex = z+4;
                            Parent = section.objects.optionholder;
                        })

                        objs.background = utility:Draw('Square', {
                            Size = newUDim2(1,-4,0,15);
                            Position = newUDim2(0,2,1,-17);
                            ThemeColor = 'Option Background';
                            ZIndex = z+2;
                            Parent = objs.holder;
                        })

                        objs.border1 = utility:Draw('Square', {
                            Size = newUDim2(1,2,1,2);
                            Position = newUDim2(0,-1,0,-1);
                            ThemeColor = 'Option Border 1';
                            ZIndex = z+1;
                            Parent = objs.background;
                        })

                        objs.border2 = utility:Draw('Square', {
                            Size = newUDim2(1,2,1,2);
                            Position = newUDim2(0,-1,0,-1);
                            ThemeColor = 'Option Border 2';
                            ZIndex = z;
                            Parent = objs.border1;
                        })

                        objs.gradient = utility:Draw('Image', {
                            Size = newUDim2(1,0,1,0);
                            Data = library.images.gradientp90;
                            Transparency = .65;
                            ZIndex = z+4;
                            Parent = objs.background;
                        })

                        objs.text = utility:Draw('Text', {
                            Position = newUDim2(0,2,0,2);
                            ThemeColor = box.risky and 'Risky Text Enabled' or 'Option Text 2';
                            Size = 13;
                            Font = 2;
                            ZIndex = z+1;
                            Outline = true;
                            Parent = objs.holder;
                        })

                        objs.inputText = utility:Draw('Text', {
                            Position = newUDim2(0,2,0,0);
                            ThemeColor = 'Option Text 2';
                            Size = 13;
                            Font = 2;
                            ZIndex = z+5;
                            Outline = true;
                            Parent = objs.background;
                        })

                        utility:Connection(objs.holder.MouseEnter, function()
                            objs.border1.ThemeColor = 'Accent';
                        end)

                        utility:Connection(objs.holder.MouseLeave, function()
                            objs.border1.ThemeColor = 'Option Border 1';
                        end)

                        utility:Connection(objs.holder.MouseButton1Down, function()
                            if box.focused then
                                box:ReleaseFocus();
                            else
                                box:CaptureFocus(UserInputService:IsKeyDown(Enum.KeyCode.LeftControl));
                                if UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then
                                    objs.inputText.Text = '';
                                end
                            end
                        end)

                    end
                    ----------------------

                    function box:SetText(str)
                        if typeof(str) == 'string' then
                            self.text = str;
                            self.objects.text.Text = str;
                        end
                    end

                    function box:SetInput(str, nocallback)
                        if typeof(str) == 'string' then
                            self.input = str;
                            self.objects.inputText.Text = str;
                            if not nocallback then
                                self.callback(str);
                            end
                            if self.flag then
                                library.flags[self.flag] = str;
                            end
                        end
                    end

                    local c
                    local input = box.input;
                    function box:CaptureFocus(clear)
                        box.focused = true

                        if clear then
                            input = '';
                        end

                        self.objects.inputText.ThemeColor = 'Option Text 1';
                        c = utility:Connection(UserInputService.InputBegan, function(inp)
                            if inp.KeyCode == Enum.KeyCode.Return or inp.UserInputType == Enum.UserInputType.MouseButton1 then
                                box:ReleaseFocus(true);
                            elseif inp.KeyCode == Enum.KeyCode.Escape then
                                input = self.input
                                self.objects.inputText.Text = input;
                                box:ReleaseFocus();
                            elseif inp.KeyCode == Enum.KeyCode.Backspace then
                                input = input:sub(1,-2);
                                self.objects.inputText.Text = input;
                            elseif #inp.KeyCode.Name == 1 or table.find(whitelistedBoxKeys, inp.KeyCode) or inp.KeyCode.Name ==  'Space' then
                                local wlIdx = table.find(whitelistedBoxKeys, inp.KeyCode)
                                local keyString = inp.KeyCode.Name == 'Space' and ' ' or wlIdx ~= nil and tostring(wlIdx-1) or inp.KeyCode.Name
                                if not (UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) or UserInputService:IsKeyDown(Enum.KeyCode.RightShift)) then
                                    keyString = keyString:lower();
                                end
                                input = input..keyString;
                                self.objects.inputText.Text = input;
                            end
                        end)

                    end

                    function box:ReleaseFocus(apply)
                        box.focused = false;
                        self.objects.inputText.ThemeColor = 'Option Text 2';
                        if apply then
                            box:SetInput(input);
                        end
                        c:Disconnect();
                    end

                    tooltip(box);
                    box:SetText(box.text);
                    box:SetInput(box.input, true);
                    self:UpdateOptions();
                    return box
                end

                -- // Keybind
                function section:AddBind(data)
                    local bind = {
                        class = 'bind';
                        flag = data.flag;
                        text = '';
                        tooltip = '';
                        bind = 'none';
                        mode = 'toggle';
                        order = #self.options+1;
                        callback = function() end;
                        keycallback = function() end;
                        indicatorValue = library.keyIndicator:AddValue({value = 'value', key = 'key', enabled = false});
                        noindicator = false;
                        state = false;
                        nomouse = false;
                        enabled = true;
                        binding = false;
                        risky = false;
                        objects = {};
                    };

                    local blacklist = {'objects'};
                    for i,v in next, data do
                        if not table.find(blacklist, i) and bind[i] ~= nil then
                            bind[i] = v
                        end
                    end
                    
                    table.insert(self.options, bind)

                    if bind.flag then
                        library.options[bind.flag] = bind;
                    end

                    --- Create Objects ---
                    do
                        local objs = bind.objects;
                        local z = library.zindexOrder.window+25;

                        objs.holder = utility:Draw('Square', {
                            Size = newUDim2(1,0,0,19);
                            Transparency = 0;
                            ZIndex = z+5;
                            Parent = section.objects.optionholder;
                        })

                        objs.text = utility:Draw('Text', {
                            Position = newUDim2(0,2,0,2);
                            ThemeColor = bind.risky and 'Risky Text' or 'Option Text 2';
                            Size = 13;
                            Font = 2;
                            ZIndex = z+1;
                            Outline = true;
                            Parent = objs.holder;
                        })

                        objs.keyText = utility:Draw('Text', {
                            ThemeColor = 'Option Text 3';
                            Size = 13;
                            Font = 2;
                            ZIndex = z+1;
                            Parent = objs.holder;
                        })

                        utility:Connection(objs.holder.MouseEnter, function()
                            objs.keyText.ThemeColor = 'Accent';
                        end)

                        utility:Connection(objs.holder.MouseLeave, function()
                            objs.keyText.ThemeColor = bind.binding and 'Accent' or 'Option Text 3';
                        end)

                        utility:Connection(objs.holder.MouseButton1Down, function()
                            if not bind.binding then
                                bind:SetKeyText('...');
                                bind.binding = true;
                            end
                        end)

                    end
                    ----------------------

                    local c

                    function bind:SetText(str)
                        if typeof(str) == 'string' then
                            self.text = str;
                            self.objects.text.Text = str;
                            self.indicatorValue:SetKey(str);
                        end
                    end

                    function bind:SetBind(keybind)
                        if c then
                            c:Disconnect();
                            if bind.flag then
                                library.flags[bind.flag] = false;
                            end
                            bind.callback(false);
                        end
                        local keyName = 'NONE'
                        self.bind = (keybind and keybind) or keybind or self.bind
                        if self.bind == Enum.KeyCode.Backspace then
                            self.bind = 'none';
                        else
                            keyName = keyNames[keybind] or keybind.Name or keybind
                        end
                        self.keycallback(self.bind);
                        self:SetKeyText(keyName:upper());
                        self.indicatorValue:SetKey((self.text == nil or self.text == '') and (self.flag == nil and 'unknown' or self.flag) or self.text); -- this is so dumb
                        self.indicatorValue:SetValue('['..keyName:upper()..']');
                        self.objects.keyText.ThemeColor = self.objects.holder.Hover and 'Accent' or 'Option Text 3';
                    end

                    function bind:SetKeyText(str)
                        str = tostring(str);
                        self.objects.keyText.Text = '['..str..']';
                        self.objects.keyText.Position = newUDim2(1,-self.objects.keyText.TextBounds.X, 0, 2);
                    end

                    utility:Connection(UserInputService.InputBegan, function(inp)
                        if UserInputService:GetFocusedTextBox() then
                            return
                        elseif bind.binding then
                            local key = (table.find({Enum.UserInputType.MouseButton1, Enum.UserInputType.MouseButton2, Enum.UserInputType.MouseButton3}, inp.UserInputType) and not bind.nomouse) and inp.UserInputType
                            bind:SetBind(key or (not table.find(blacklistedKeys, inp.KeyCode)) and inp.KeyCode)
                            bind.binding = false
                        elseif (inp.KeyCode == bind.bind or inp.UserInputType == bind.bind) and not bind.binding then
                            if bind.mode == 'toggle' then
                                bind.state = not bind.state
                                if bind.flag then
                                    library.flags[bind.flag] = bind.state;
                                end
                                bind.callback(bind.state)
                                bind.indicatorValue:SetEnabled(bind.state and not bind.noindicator);
                            elseif bind.mode == 'hold' then
                                if bind.flag then
                                    library.flags[bind.flag] = true;
                                end
                                bind.indicatorValue:SetEnabled(true and not bind.noindicator);
                                c = utility:Connection(RunService.RenderStepped, function()
                                    bind.callback(true);
                                end)
                            end
                        end
                    end)

                    utility:Connection(UserInputService.InputEnded, function(inp)
                        if bind.bind ~= 'none' then
                            if inp.KeyCode == bind.bind or inp.UserInputType == bind.key then
                                if c then
                                    c:Disconnect();
                                    if bind.flag then
                                        library.flags[bind.flag] = false;
                                    end
                                    bind.callback(false);
                                    bind.indicatorValue:SetEnabled(false);
                                end
                            end
                        end
                    end)

                    tooltip(bind);
                    bind:SetBind(bind.bind);
                    bind:SetText(bind.text);
                    self:UpdateOptions();
                    return bind
                end

                -- // Dropdown
                function section:AddList(data)
                    local list = {
                        class = 'list';
                        flag = data.flag;
                        text = '';
                        selected = '';
                        tooltip = '';
                        order = #self.options+1;
                        callback = function() end;
                        enabled = true;
                        multi = false;
                        open = false;
                        risky = false;
                        values = {};
                        objects = {};
                    }

                    table.insert(self.options, list);

                    local blacklist = {'objects'};
                    for i,v in next, data do
                        if not table.find(blacklist, i) ~= list[i] ~= nil then
                            list[i] = v
                        end
                    end

                    if list.flag then
                        library.flags[list.flag] = list.selected;
                        library.options[list.flag] = list;
                    end

                    -- Create Objects --
                    do
                        local objs = list.objects;
                        local z = library.zindexOrder.window+25;

                        objs.holder = utility:Draw('Square', {
                            Size = newUDim2(1,0,0,40);
                            Transparency = 0;
                            ZIndex = z+4;
                            Parent = section.objects.optionholder;
                        })

                        objs.background = utility:Draw('Square', {
                            Size = newUDim2(1,-4,0,15);
                            Position = newUDim2(0,2,1,-19);
                            ThemeColor = 'Option Background';
                            ZIndex = z+2;
                            Parent = objs.holder;
                        })

                        objs.border1 = utility:Draw('Square', {
                            Size = newUDim2(1,2,1,2);
                            Position = newUDim2(0,-1,0,-1);
                            ThemeColor = 'Option Border 1';
                            ZIndex = z+1;
                            Parent = objs.background;
                        })

                        objs.border2 = utility:Draw('Square', {
                            Size = newUDim2(1,2,1,2);
                            Position = newUDim2(0,-1,0,-1);
                            ThemeColor = 'Option Border 2';
                            ZIndex = z;
                            Parent = objs.border1;
                        })

                        objs.gradient = utility:Draw('Image', {
                            Size = newUDim2(1,0,1,0);
                            Data = library.images.gradientp90;
                            Transparency = .65;
                            ZIndex = z+4;
                            Parent = objs.background;
                        })

                        objs.text = utility:Draw('Text', {
                            Position = newUDim2(0,2,0,2);
                            ThemeColor = list.risky and 'Risky Text Enabled' or 'Option Text 2';
                            Size = 13;
                            Font = 2;
                            ZIndex = z+1;
                            Outline = true;
                            Parent = objs.holder;
                        })

                        objs.inputText = utility:Draw('Text', {
                            Position = newUDim2(0,4,0,0);
                            ThemeColor = 'Option Text 2';
                            Text = 'none',
                            Size = 13;
                            Font = 2;
                            ZIndex = z+5;
                            Outline = true;
                            Parent = objs.background;
                        })

                        objs.openText = utility:Draw('Text', {
                            Position = newUDim2(1,-10,0,0);
                            ThemeColor = 'Option Text 3';
                            Text = '+';
                            Size = 13;
                            Font = 2;
                            ZIndex = z+5;
                            Outline = true;
                            Parent = objs.background;
                        })

                        utility:Connection(objs.holder.MouseEnter, function()
                            objs.border1.ThemeColor = 'Accent';
                        end)

                        utility:Connection(objs.holder.MouseLeave, function()
                            objs.border1.ThemeColor = 'Option Border 1';
                        end)

                        utility:Connection(objs.holder.MouseButton1Down, function()
                            if list.open then
                                list.open = false;
                                objs.openText.Text = '+';
                                if window.dropdown.selected == list then
                                    window.dropdown.selected = nil;
                                    window.dropdown.objects.background.Visible = false;
                                end
                            else
                                if window.dropdown.selected ~= nil then
                                    window.dropdown.selected.open = false
                                end
                                list.open = true;
                                objs.openText.Text = '-';
                                window.dropdown.selected = list;
                                window.dropdown.objects.background.Visible = true;
                                window.dropdown.objects.background.Parent = objs.holder;
                                window.dropdown:Refresh();
                            end
                        end)


                    end
                    --------------------

                    function list:SetText(str)
                        if typeof(str) == 'string' then
                            self.text = str;
                            self.objects.text.Text = str;
                        end
                    end

                    function list:Select(option, nocallback)
                        option = typeof(option) == 'table' and (self.multi == true and option or (#option == 0 and nil or option[1])) or self.multi == true and {option} or option;
                        if option ~= nil then
                            self.selected = option;
                            local text = typeof(option) == 'table' and (#option == 0 and "none" or table.concat(option, ', ')) or tostring(option);
                            local label = self.objects.inputText
                            label.Text = text;
                            if label.TextBounds.X > self.objects.background.Object.Size.X - 10 then
                                local split = text:split('');
                                for i = 1,#split do
                                    label.Text = table.concat(split, '', 1, i)
                                    if label.TextBounds.X > self.objects.background.Object.Size.X - 10 then
                                        label.Text = label.Text:sub(1,-6)..'...';
                                        break
                                    end
                                end
                            end
                            if self.flag then
                                library.flags[self.flag] = self.selected
                            end
                            if not nocallback then
                                self.callback(self.selected);
                            end
                        end
                    end

                    function list:AddValue(value)
                        table.insert(list.values, tostring(value));
                        if window.dropdown.selected == list then
                            window.dropdown:Refresh()
                        end
                    end

                    function list:RemoveValue(value)
                        if table.find(list.values, value) then
                            table.remove(list.values, table.find(list.values, value));
                            if window.dropdown.selected == list then
                                window.dropdown:Refresh()
                            end
                        end
                    end

                    function list:ClearValues()
                        table.clear(list.values);
                        if window.dropdown.selected == list then
                            window.dropdown:Refresh()
                        end
                    end

                    tooltip(list);
                    list:Select((data.value or data.selected) or (list.multi and 'none' or list.values[1]), true);
                    list:SetText(list.text);
                    self:UpdateOptions();
                    return list
                end

                -- Text
                function section:AddText(data)
                    local text = {
                        class = 'text';
                        flag = data.flag;
                        text = '';
                        tooltip = '';
                        order = #self.options+1;
                        enabled = true;
                        risky = false;
                        objects = {};
                    };

                    local blacklist = {'objects'};
                    for i,v in next, data do
                        if not table.find(blacklist, i) and text[i] ~= nil then
                            text[i] = v
                        end
                    end

                    if data.flag then
                        library.options[data.flag] = text;
                    end

                    table.insert(self.options, text)

                    --- Create Objects ---
                    do
                        local objs = text.objects;
                        local z = library.zindexOrder.window+25;

                        objs.holder = utility:Draw('Square', {
                            Transparency = 0;
                            ZIndex = z+5;
                            Parent = section.objects.optionholder;
                        })

                        objs.text = utility:Draw('Text', {
                            Position = newUDim2(0,2,0,2);
                            ThemeColor = text.risky and 'Risky Text Enabled' or 'Option Text 2';
                            Size = 13;
                            Font = 2;
                            ZIndex = z+1;
                            Outline = true;
                            Parent = objs.holder;
                        })
                    end
                    ----------------------

                    function text:SetText(str)
                        if typeof(str) == 'string' then
                            self.text = str;
                            self.objects.text.Text = str;
                            self.objects.holder.Size = newUDim2(1,0,0,self.objects.text.TextBounds.Y + 6);
                            section:UpdateOptions();
                        end
                    end

                    text:SetText(text.text);
                    self:UpdateOptions();
                    return text
                end

                -----------------------

                section:UpdateOptions();
                section:SetText(section.text);
                self:UpdateSections();
                return section;
            end

            function tab:UpdateSections()
                table.sort(self.sections, function(a,b)
                    return a.order < b.order
                end)

                local last1,last2;
                local padding = 15;
                for _,section in next, self.sections do

                    if section.objects.background.Visible ~= (section.enabled and tab.selected) then
                        section.objects.background.Visible = section.enabled and tab.selected
                        section:UpdateOptions();
                    end
                    
                    if section.enabled then
                        if section.side == 1 then
                            if last1 then
                                section.objects.background.Position = last1.objects.background.Position + newUDim2(0,0,0,last1.objects.background.Object.Size.Y + padding);
                            end
                            last1 = section;
                        elseif section.side == 2 then
                            if last2 then
                                section.objects.background.Position = last2.objects.background.Position + newUDim2(0,0,0,last2.objects.background.Object.Size.Y + padding);
                            end
                            last2 = section;
                        end
                    end

                    section:SetText(section.text)
                    
                end
            end

            function tab:SetText(str)
                if typeof(str) == 'string' then
                    self.text = str;
                    self.objects.text.Text = str;
                    window:UpdateTabs();
                end
            end

            function tab:Select()
                window.selectedTab = tab;
                window:UpdateTabs();
                for i,v in next, window.tabs do
                    if v.callback then
                        v.callback(v == tab)
                    end
                end
            end

            if window.selectedTab == nil then
                tab:Select();
            end

            tab:SetText(tab.text);
            window:UpdateTabs();
            return tab;
        end

        function window:UpdateTabs()
            table.sort(self.tabs, function(a,b)
                return a.order < b.order
            end)
            local pos = 0;
            for i,v in next, self.tabs do
                local objs = v.objects;
                v.selected = v == self.selectedTab;
                objs.background.ThemeColor = v.selected and 'Selected Tab Background' or 'Unselected Tab Background';
                objs.background.Size = newUDim2(0, objs.text.TextBounds.X + 14, 1, v.selected and 1 or 0);
                objs.background.Position = newUDim2(0, pos, 0, 0)

                objs.text.ThemeColor = v.selected and 'Selected Tab Text' or 'Unselected Tab Text';
                objs.text.Position = newUDim2(.5, 0, 0, 3);

                objs.topBorder.ThemeColor = v.selected and 'Accent' or 'Unselected Tab Background';

                pos += objs.background.Size.X.Offset + 1

                v:UpdateSections();

            end
        end

        window:SetOpen(true);
        return window;
    end

    -- Tooltip
    do
        local z = library.zindexOrder.window + 2000;
        tooltipObjects.background = utility:Draw('Square', {
            ThemeColor = 'Group Background';
            ZIndex = z;
            Visible = false;
        })

        tooltipObjects.border1 = utility:Draw('Square', {
            Size = UDim2.new(1,2,1,2);
            Position = UDim2.new(0,-1,0,-1);
            ThemeColor = 'Border 1';
            ZIndex = z-1;
            Parent = tooltipObjects.background;
        })

        tooltipObjects.border2 = utility:Draw('Square', {
            Size = UDim2.new(1,4,1,4);
            Position = UDim2.new(0,-2,0,-2);
            ThemeColor = 'Border 3';
            ZIndex = z-2;
            Parent = tooltipObjects.background;
        })

        tooltipObjects.text = utility:Draw('Text', {
            Position = UDim2.new(0,3,0,0);
            ThemeColor = 'Primary Text';
            Size = 13;
            Font = 2;
            ZIndex = z+1;
            Outline = true;
            Parent = tooltipObjects.background;
        })

        tooltipObjects.riskytext = utility:Draw('Text', {
            Position = UDim2.new(0,3,0,0);
            ThemeColor = 'Risky Text Enabled';
            Text = '[RISKY]';
            Size = 13;
            Font = 2;
            ZIndex = z+1;
            Outline = true;
            Parent = tooltipObjects.background;
        })

    end
    
    -- Watermark
    do
        self.watermark = {
            objects = {};
            text = {
                {self.cheatwatermarktext, true},
                {LocalPlayer.Name, false},
                {LocalPlayer.DisplayName, false},
                {'dev', false},
                {'0 fps', true},
                {'0ms', true},
                {'00:00:00', true},
                {'M, D, Y', true},
            };
            lock = 'custom';
            position = newUDim2(0,0,0,0);
            refreshrate = 25;
        }

        function self.watermark:Update()
            self.objects.background.Visible = library.flags.watermark_enabled
            if library.flags.watermark_enabled then
                local date = {os.date('%b',os.time()), os.date('%d',os.time()), os.date('%Y',os.time())}
                local daySuffix = math.floor(date[2]%10)
                date[2] = date[2]..(daySuffix == 1 and 'st' or daySuffix == 2 and 'nd' or daySuffix == 3 and 'rd' or 'th')

                self.text[2][1] = LocalPlayer.Name
                self.text[3][1] = LocalPlayer.DisplayName
                self.text[5][1] = library.stats.fps..' fps'
                self.text[6][1] = floor(library.stats.ping)..'ms'
                self.text[7][1] = os.date('%X', os.time())
                self.text[8][1] = table.concat(date, ', ')

                local text = {};
                for _,v in next, self.text do
                    if v[2] then
                        table.insert(text, v[1]);
                    end
                end

                self.objects.text.Text = table.concat(text,' | ')
                self.objects.background.Size = newUDim2(0, self.objects.text.TextBounds.X + 10, 0, 17)

                local size = self.objects.background.Object.Size;
                local screensize = workspace.CurrentCamera.ViewportSize;

                self.position = (
                    self.lock == 'Top Right' and newUDim2(0, screensize.X - size.X - 15, 0, 15) or
                    self.lock == 'Top Left' and newUDim2(0, 15, 0, 15) or
                    self.lock == 'Bottom Right' and newUDim2(0, screensize.X - size.X - 15, 0, screensize.Y - size.Y - 15) or
                    self.lock == 'Bottom Left' and newUDim2(0, 15, 0, screensize.Y - size.Y - 15) or
                    self.lock == 'Top' and newUDim2(0, screensize.X / 2 - size.X / 2, 0, 15) or
                    newUDim2(library.flags.watermark_x / 100, 0, library.flags.watermark_y / 100, 0)
                )

                self.objects.background.Position = self.position
            end
        end

        do
            local objs = self.watermark.objects;
            local z = self.zindexOrder.watermark;
            
            objs.background = utility:Draw('Square', {
                Visible = false;
                Size = newUDim2(0, 200, 0, 17);
                Position = newUDim2(0,800,0,100);
                ThemeColor = 'Background';
                ZIndex = z;
            })

            objs.border1 = utility:Draw('Square', {
                Size = newUDim2(1,2,1,2);
                Position = newUDim2(0,-1,0,-1);
                ThemeColor = 'Border 2';
                Parent = objs.background;
                ZIndex = z-1;
            })

            objs.border2 = utility:Draw('Square', {
                Size = newUDim2(1,2,1,2);
                Position = newUDim2(0,-1,0,-1);
                ThemeColor = 'Border 3';
                Parent = objs.border1;
                ZIndex = z-2;
            })
            
            objs.topbar = utility:Draw('Square', {
                Size = newUDim2(1,0,0,1);
                ThemeColor = 'Accent';
                ZIndex = z+1;
                Parent = objs.background;
            })

            objs.text = utility:Draw('Text', {
                Position = newUDim2(.5,0,0,2);
                ThemeColor = 'Primary Text';
                Text = 'Watermark Text';
                Size = 13;
                Font = 2;
                ZIndex = z+1;
                Outline = true;
                Center = true;
                Parent = objs.background;
            })

        end
    end

    local lasttick = tick();
    utility:Connection(RunService.RenderStepped, function(step)
        library.stats.fps = floor(1/step)
        library.stats.ping = stats.Network.ServerStatsItem["Data Ping"]:GetValue()
        library.stats.sendkbps = stats.DataSendKbps
        library.stats.receivekbps = stats.DataReceiveKbps

        if (tick()-lasttick)*1000 > library.watermark.refreshrate then
            lasttick = tick()
            library.watermark:Update()
        end
    end)

    self.keyIndicator = self.NewIndicator({title = 'Keybinds', pos = UDim2.new(0,0.5,35,0), enabled = false});
    self:SetTheme(library.theme);
    self:SetOpen(true);
    self.hasInit = true

end

function library:CreateSettingsTab(menu)
    local settingsTab = menu:AddTab('Settings', 999);
    local configSection = settingsTab:AddSection('Config', 2);
    local mainSection = settingsTab:AddSection('Main', 1);

    configSection:AddBox({text = 'Config Name', flag = 'configinput'})
    configSection:AddList({text = 'Config', flag = 'selectedconfig'})

    local function refreshConfigs()
        library.options.selectedconfig:ClearValues();
        for _,v in next, listfiles(self.cheatname..'/'..self.gamename..'/configs') do
            local ext = '.'..v:split('.')[#v:split('.')];
            if ext == self.fileext then
                library.options.selectedconfig:AddValue(v:split('\\')[#v:split('\\')]:sub(1,-#ext-1))
            end
        end
    end

    configSection:AddButton({text = 'Load', confirm = true, callback = function()
        library:LoadConfig(library.flags.selectedconfig);
    end}):AddButton({text = 'Save', confirm = true, callback = function()
        library:SaveConfig(library.flags.selectedconfig);
    end})

    configSection:AddButton({text = 'Create', confirm = true, callback = function()
        if library:GetConfig(library.flags.configinput) then
            library:SendNotification('Config \''..library.flags.configinput..'\' already exists.', 5, c3new(1,0,0));
            return
        end
        writefile(self.cheatname..'/'..self.gamename..'/configs/'..library.flags.configinput.. self.fileext, http:JSONEncode({}));
        refreshConfigs()
    end}):AddButton({text = 'Delete', confirm = true, callback = function()
        if library:GetConfig(library.flags.selectedconfig) then
            delfile(self.cheatname..'/'..self.gamename..'/configs/'..library.flags.selectedconfig.. self.fileext);
            refreshConfigs()
        end
    end})

    refreshConfigs()

    mainSection:AddBind({text = 'Open / Close', flag = 'togglebind', nomouse = true, noindicator = true, bind = Enum.KeyCode.RightShift, callback = function()
        library:SetOpen(not library.open)
    end});

    mainSection:AddToggle({text = 'Disable Movement If Open', flag = 'disablemenumovement', callback = function(bool)
        if bool and library.open then
            actionservice:BindAction(
                'FreezeMovement',
                function()
                    return Enum.ContextActionResult.Sink
                end,
                false,
                unpack(Enum.PlayerActions:GetEnumItems())
            )
        else
            actionservice:UnbindAction('FreezeMovement');
        end
    end})

    mainSection:AddButton({text = 'Join Discord', flag = 'joindiscord', confirm = true, callback = function()
        local res = syn.request({
			Url = 'http://127.0.0.1:6463/rpc?v=1',
			Method = 'POST',
			Headers = {
				['Content-Type'] = 'application/json',
				Origin = 'https://discord.com'
			},
			Body = game:GetService('HttpService'):JSONEncode({
				cmd = 'INVITE_BROWSER',
				nonce = game:GetService('HttpService'):GenerateGUID(false),
				args = {code = '3mGmM4Vz2a'}
			})
		})
        if res.Success then
            library:SendNotification(library.cheatname..' | joined discord', 3);
        end
    end})

    mainSection:AddButton({text = 'Copy Discord', flag = 'copydiscord', callback = function()
        setclipboard('discord.gg/3mGmM4Vz2a')
    end})

    mainSection:AddButton({text = 'Copy Game Invite', callback = function()
        setclipboard('game:GetService("TeleportService"):TeleportToPlaceInstance('..game.PlaceId..',"'..game.JobId..'", game.Players.LocalPlayer)')
    end})

    mainSection:AddButton({text = 'Rejoin', callback = function()
        game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId, game.Players.LocalPlayer)
    end})

    mainSection:AddButton({text = 'Join New Game', callback = function()
        local Servers = game.HttpService:JSONDecode(game:HttpGet(("https://games.roblox.com/v1/games/%s/servers/Public?sortOrder=Asc&limit=100"):format(game.PlaceId)))
        
        for Index, Value in pairs(Servers.data) do
            if Value.playing ~= Value.maxPlayers and Value.playing > 19 then
                game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, Value.id)
            end
        end
    end})

    mainSection:AddButton({text = 'Unload', confirm = true, callback = function()
        library:Unload();
    end})

    mainSection:AddSeparator({text = 'Keybinds'});
    mainSection:AddToggle({text = 'Keybind Indicator', flag = 'keybind_indicator', callback = function(bool)
        library.keyIndicator:SetEnabled(bool);
    end})

    mainSection:AddSlider({text = 'Position X', flag = 'keybind_indicator_x', min = 0, max = 100, increment = .1, value = .5, callback = function()
        library.keyIndicator:SetPosition(newUDim2(library.flags.keybind_indicator_x / 100, 0, library.flags.keybind_indicator_y / 100, 0));    
    end});
    mainSection:AddSlider({text = 'Position Y', flag = 'keybind_indicator_y', min = 0, max = 100, increment = .1, value = 35, callback = function()
        library.keyIndicator:SetPosition(newUDim2(library.flags.keybind_indicator_x / 100, 0, library.flags.keybind_indicator_y / 100, 0));    
    end});
    library.keyIndicator:SetPosition(newUDim2(0.5 / 100, 0, 35 / 100, 0));
    mainSection:AddSeparator({text = 'Watermark'})
    mainSection:AddToggle({text = 'Enabled', flag = 'watermark_enabled'});
    mainSection:AddList({text = 'Position', flag = 'watermark_pos', selected = 'Top Left', values = {'Top', 'Top Left', 'Top Right', 'Bottom Left', 'Bottom Right', 'Custom'}, callback = function(val)
        library.watermark.lock = val;
    end})
    mainSection:AddSlider({text = 'Custom X', flag = 'watermark_x', suffix = '%', min = 0, max = 100, increment = .1});
    mainSection:AddSlider({text = 'Custom Y', flag = 'watermark_y', suffix = '%', min = 0, max = 100, increment = .1});

    local themeStrings = {};
    for _,v in next, library.themes do
        table.insert(themeStrings, v.name)
    end
    local themeSection = settingsTab:AddSection('Theme', 2);

    themeSection:AddColor({text = 'Accent', flag = 'theme_accent', callback = function(c3)
        library.theme.Accent = c3
        library:SetTheme(library.theme)
    end});
    themeSection:AddList({text = 'Presets', flag = 'preset_theme', values = themeStrings, callback = function(newTheme)
        for _,v in next, library.themes do
            if v.name == newTheme then
                library.options.theme_accent:SetColor(v.theme.Accent);
                library:SetTheme(v.theme)
                break
            end
        end
    end}):Select('Default');

    return settingsTab;
end

library:init();
loads = tick()

local ColorCorrection = Instance.new("ColorCorrectionEffect", workspace.CurrentCamera)

local ind = library.NewIndicator({title = "Player Info", pos = UDim2.new(0,0.5,35,0), enabled = false});
local target = ind:AddValue({value = "", key = "Name:", enabled = true});
local targethel = ind:AddValue({value = "", key = "Health:", enabled = true});
local targetdis = ind:AddValue({value = "", key = "Distance:", enabled = true});

local function rotateVector2(v2, r)
    local c = math.cos(r);
    local s = math.sin(r);
    return Vector2.new(c * v2.X - s*v2.Y, s*v2.X + c*v2.Y)
end

local function find_2d_distance ( pos1, pos2 )
    local dx = pos1.X - pos2.X
    local dy = pos1.Y - pos2.Y
    return math.sqrt ( dx * dx + dy * dy )
end

local function Aimbot()
    tname = ""
    thealth = ""
    tdistance = ""

    if library.flags.aimenabled and not library.open then
        local organizedPlayers = {}
        local fov = library.flags.aimfov
        local mousePos = Vector3.new(UserInputService:GetMouseLocation().x, UserInputService:GetMouseLocation().y, 0)

        aflags.anigga = false
        aflags.anigga2 = false
        aflags.anigga3 = false

        for _,v in next, library.flags.aimcheck do
            if v == "Distance" then
                aflags.anigga = true
            end
            if v == "Same Team" then
                aflags.anigga2 = true
            end
            if v == "Alive" then
                aflags.anigga3 = true
            end
        end

        for i, v in ipairs(Players:GetPlayers()) do
            if v == LocalPlayer then
                continue
            end

            if v.Character ~= nil and v.Character:FindFirstChild("HumanoidRootPart") then
                local humanoid = v.Character:FindFirstChild("Humanoid")
                if humanoid then
                    if game.PlaceId == 4991214437 then
                        if aflags.anigga3 and humanoid.Health <= 1 then
                            continue
                        end
                    else
                        if aflags.anigga3 and humanoid.Health <= 0 then
                            continue
                        end
                    end
                end

                local pos = Camera:WorldToViewportPoint(v.Character.Head.Position)
                if fov ~= 0 then
                    if find_2d_distance(pos, mousePos) > fov then
                        continue
                    end
                end

                if aflags.anigga2 and v.Team and v.Team == LocalPlayer.Team then
                    continue
                end

                if aflags.anigga and LocalPlayer:DistanceFromCharacter(v.Character.HumanoidRootPart.Position) / 5 > library.flags.aimdis then
                    continue
                end

                table.insert(organizedPlayers, v)
            end
        end

        table.sort(organizedPlayers, function(a, b)
            local aPos, aVis = workspace.CurrentCamera:WorldToViewportPoint(a.Character.Head.Position)
            local bPos, bVis = workspace.CurrentCamera:WorldToViewportPoint(b.Character.Head.Position)
            if aVis and not bVis then
                return true
            end
            if bVis and not aVis then
                return false
            end
            return (aPos - mousePos).Magnitude < (bPos - mousePos).Magnitude
        end)
        
        local smoothing = library.flags.aimsmooth * 0.3 + 2
        for i, v in ipairs(organizedPlayers) do
            local humanoid = v.Character:FindFirstChild("Humanoid")
            local rootpart = v.Character.HumanoidRootPart.Position
            
            local PLRD = PLRDS[v]
            if not PLRD then continue end
            

            local hitbox = nil
            if library.flags.aimhit == "Head" then
                hitbox = v.Character:FindFirstChild("Head")
            else
                hitbox = v.Character:FindFirstChild("Torso")
                if hitbox == nil then
                    hitbox = v.Character:FindFirstChild("UpperTorso")
                end
            end

            if hitbox then
                local pos, onscreen = workspace.CurrentCamera:WorldToViewportPoint(hitbox.Position)

                if onscreen then
                    local Character = v.Character
                    local Pos = Camera:WorldToViewportPoint(rootpart)

                    Size = (Camera:WorldToViewportPoint(rootpart - Vector3.new(0, 3, 0)).Y - Camera:WorldToViewportPoint(rootpart + Vector3.new(0, 2.6, 0)).Y) / 2
                    BoxSize = Vector2.new(math.floor(Size * 1), math.floor(Size * 1.9))
                    BoxPos = Vector2.new(math.floor(Pos.X - Size * 1 / 2), math.floor(Pos.Y - Size * 1.6 / 2))

                    
                    DistanceFromCharacter = tostring(math.ceil(LocalPlayer:DistanceFromCharacter(rootpart) / 5)).. "m"

                    tname = "["..v.Name.."]"
                    thealth = "["..tostring(math.ceil(humanoid.Health)).."]"
                    tdistance = "["..DistanceFromCharacter.."]"
                    if library.flags.aimkey then
                        if UserInputService.MouseBehavior ~= Enum.MouseBehavior.LockCenter then
                            mousemoveabs(pos.x, pos.y)
                        else
                            if library.flags.aimangles then
                                Camera.CFrame = CFrame.new(Camera.CFrame.Position, hitbox.Position)
                            else
                                local inc = Vector2.new((pos.X - LocalMouse.X) / smoothing, (pos.Y - LocalMouse.Y - 36) / smoothing)
                                local sens = GameSettings.MouseSensitivity
                                mousemoverel(inc.X / (sens * 5), inc.Y / (sens * 5))
                            end
                        end
                        return
                    end
                end
            end
        end
    end
end

local function esprend() 
    niggad = false
    niggan = false

    for _,Player in pairs (Players:GetPlayers()) do
        if library.flags.espenabled and PLRDS[Player] and isTarget(Player, library.flags.espteam) then
            local PLRD = PLRDS[Player]
            for _,v in pairs (PLRD) do
                v.Visible = false
            end

            local Character = Player.Character
            local RootPart, Humanoid = Character and Character:FindFirstChild("HumanoidRootPart"), Character and Character:FindFirstChildOfClass("Humanoid")
            if Player.Character ~= nil and Player.Character:FindFirstChild("HumanoidRootPart") then
                if Humanoid then
                    if Humanoid.Health <= 0 then
                        continue
                    end
                end
            end

            local poser = Camera:WorldToViewportPoint(Player.Character.Head.Position)
            local fov = library.flags.aimfov
            local mousePos = Vector3.new(UserInputService:GetMouseLocation().x, UserInputService:GetMouseLocation().y, 0)
            local Pos, OnScreen = Camera:WorldToViewportPoint(RootPart.Position)
            local DistanceFromCharacter = tostring(math.ceil(LocalPlayer:DistanceFromCharacter(RootPart.Position) / 5)).. "m"
            local alivecheck = true
            
            if Player.Character ~= nil and Player.Character:FindFirstChild("HumanoidRootPart") then
                if Humanoid then
                    if game.PlaceId == 4991214437 then
                        if alivecheck and Humanoid.Health <= 1 then
                            continue
                        end
                    else
                        if alivecheck and Humanoid.Health <= 0 then
                            continue
                        end
                    end
                end
            end
            if library.flags.espcase == "Normal" then
                DistanceFromCharacter = tostring(math.ceil(LocalPlayer:DistanceFromCharacter(RootPart.Position) / 5)).. "m"
            elseif library.flags.espcase == "lowercase" then
                DistanceFromCharacter = tostring(math.ceil(LocalPlayer:DistanceFromCharacter(RootPart.Position) / 5)).. string.lower("m")
            elseif library.flags.espcase == "UPPERCASE" then
                DistanceFromCharacter = tostring(math.ceil(LocalPlayer:DistanceFromCharacter(RootPart.Position) / 5)).. string.upper("m")
            end
            local Pos, OnScreen = Camera:WorldToViewportPoint(RootPart.Position)
            if not OnScreen then
                local niggars = Character.PrimaryPart
                local proj = Camera.CFrame:PointToObjectSpace(RootPart.Position)
                local ang = math.atan2(proj.Z, proj.X)
                local dir = Vector2.new(math.cos(ang), math.sin(ang))
                local pos = (dir * library.flags.espard * .5) + Camera.ViewportSize / 2
                local Drawing = PLRD.Offscreen

                
                if library.flags.ooftog then
                    Drawing.PointA = pos
                    Drawing.PointB = pos - rotateVector2(dir, math.rad(35)) * library.flags.espar
                    Drawing.PointC = pos - rotateVector2(dir, -math.rad(35)) * library.flags.espar
                    Drawing.Color = library.flags.ooftogcol
                    Drawing.Filled = true
                    Drawing.Transparency = 1
                    Drawing.Visible = true
                end
            else    
                local IhateMyLifeSize = (Camera:WorldToViewportPoint(RootPart.Position - Vector3.new(0, 3, 0)).Y - Camera:WorldToViewportPoint(RootPart.Position + Vector3.new(0, 2.6, 0)).Y) / 2
                local BoxSize = Vector2.new(math.floor(IhateMyLifeSize * 1.1), math.floor(IhateMyLifeSize * 2))
                local BoxPos = Vector2.new(math.floor(Pos.X - IhateMyLifeSize * 1 / 2), math.floor(Pos.Y - IhateMyLifeSize * 1.6 / 2))
                local Name = PLRD.Name
                local Distance = PLRD.Distance
                local HealthValue = PLRD.HealthValue
                local Box = PLRD.Box
                local Tracers = PLRD.Tracers
                local HeadDot = PLRD.HeadDot
                local BoxOutline = PLRD.BoxOutline
                local Health = PLRD.Health
                local HealthOutline = PLRD.HealthOutline
                local Exit = PLRD.Exit      
                local BoxFill = PLRD.BoxFill   
                local FovTracer = PLRD.FovTracers 
                local Tool = PLRD.Tool 
                local Y_off = BoxSize.Y + BoxPos.Y + 1
                
                local ptool = Player.Character:FindFirstChildOfClass("Tool") and Player.Character:FindFirstChildOfClass("Tool").Name

                if library.flags.tooltog then
                    if ptool ~= nil then
                        Tool.Text = ptool
                        Tool.Position = Vector2.new(BoxSize.X/2 + BoxPos.X, Y_off)
                        if library.flags.tt and tname == "["..Player.Name.."]" then
                            Tool.Color = library.flags.tcol
                        else
                            Tool.Color = library.flags.tooltogcol
                        end
                        Tool.Font = library.flags.espfont
                        Tool.Size = library.flags.espsize
                        Tool.Visible = true
                        Tool.Outline = library.flags.espout
                        Y_off += 15
                    end
                end

                if library.flags.aimsnap then
                    if fov ~= 0 then
                        if find_2d_distance(poser, mousePos) < fov then
                            FovTracer.From = Vector2.new(poser.x, poser.y)
                            FovTracer.To = Vector2.new(UserInputService:GetMouseLocation().x, UserInputService:GetMouseLocation().y)
                            if library.flags.tt and tname == "["..Player.Name.."]" then
                                FovTracer.Color = library.flags.tcol
                            else
                                FovTracer.Color = Color3.fromRGB(255, 255, 255)
                            end
                            FovTracer.Visible = true
                        end
                    end
                end

                if library.flags.chametog and isTarget(Player, library.flags.espteam) then
                    if Player.Character:FindFirstChildWhichIsA("Highlight") == nil then
                        local highlight = Instance.new("Highlight", Player.Character)
                    end
                    Player.Character.Highlight.FillColor = library.flags.chamtogcol
                    Player.Character.Highlight.OutlineTransparency = library.flags.chamstransb
                    Player.Character.Highlight.FillTransparency = library.flags.chamstrans
                    Player.Character.Highlight.OutlineColor = library.flags.chamstolcolo
                else
                    if Player.Character:FindFirstChildWhichIsA("Highlight") then
                        Player.Character:FindFirstChildWhichIsA("Highlight"):Destroy()
                    end
                end

                

                if library.flags.boxtog then
                    Box.Size = BoxSize
                    Box.Position = BoxPos
                    Box.Visible = true
                    if library.flags.tt and tname == "["..Player.Name.."]" then
                        Box.Color = library.flags.tcol
                    else
                        Box.Color = library.flags.boxtogcol
                    end
                    if library.flags.espout then
                        BoxOutline.Size = BoxSize
                        BoxOutline.Position = BoxPos
                        BoxOutline.Visible = true
                    end
                    
                    BoxFill.Filled = true
                    BoxFill.Visible = true
                    BoxFill.Size = Vector2.new(math.floor(IhateMyLifeSize * 1.1 - 2), math.floor(IhateMyLifeSize * 2 - 2))
                    BoxFill.Position = Vector2.new(math.floor(Pos.X - IhateMyLifeSize * 1 / 2 + 1), math.floor(Pos.Y - IhateMyLifeSize * 1.6 / 2 + 1))
                    BoxFill.Color = library.flags.boxfillcol
                    BoxFill.Transparency = library.flags.boxfilltrans
                end
                if library.flags.nametog then
                    if library.flags.espcase == "Normal" then
                        Name.Text = Player.Name
                    elseif library.flags.espcase == "lowercase" then
                        Name.Text = string.lower(Player.Name)
                    elseif library.flags.espcase == "UPPERCASE" then
                        Name.Text = string.upper(Player.Name)
                    end
                    Name.Position = Vector2.new(BoxSize.X / 2 + BoxPos.X, BoxPos.Y - 6 - Name.TextBounds.Y)
                    if library.flags.tt and tname == "["..Player.Name.."]" then
                        Name.Color = library.flags.tcol
                    else
                        Name.Color = library.flags.nametogcol
                    end
                    Name.Font = library.flags.espfont
                    Name.Size = library.flags.espsize
                    Name.Visible = true
                    Name.Outline = library.flags.espout
                end
                if library.flags.healthtog then  
                    Health.From = Vector2.new((BoxPos.X - 5), BoxPos.Y + BoxSize.Y)
                    Health.To = Vector2.new(Health.From.X, Health.From.Y - (Humanoid.Health / Humanoid.MaxHealth) * BoxSize.Y)
                    if library.flags.tt and tname == "["..Player.Name.."]" then
                        Health.Color = library.flags.tcol
                    else
                        Health.Color = library.flags.healthtogcol
                    end
                    Health.Visible = true
        
                    if library.flags.espout then
                        HealthOutline.From = Vector2.new(Health.From.X, BoxPos.Y + BoxSize.Y + 1)
                        HealthOutline.To = Vector2.new(Health.From.X, (Health.From.Y - 1 * BoxSize.Y) -1)
                        HealthOutline.Visible = true
                    end
                end
                if library.flags.distancetog then
                    Distance.Text = DistanceFromCharacter
                    Distance.Position = Vector2.new(BoxSize.X/2 + BoxPos.X, Y_off)
                    if library.flags.tt and tname == "["..Player.Name.."]" then
                        Distance.Color = library.flags.tcol
                    else
                        Distance.Color = library.flags.distancetogcol
                    end
                    Distance.Font = library.flags.espfont
                    Distance.Size = library.flags.espsize
                    Distance.Visible = true
                    Distance.Outline = library.flags.espout
                    Y_off += 15
                end
                if library.flags.tracertog then
                    Tracers.From = Vector2.new(BoxSize.X / 2 + BoxPos.X, BoxPos.Y + BoxSize.Y)
                    Tracers.To = Vector2.new(960, 1080)
                    if library.flags.tt and tname == "["..Player.Name.."]" then
                        Tracers.Color = library.flags.tcol
                    else
                        Tracers.Color = library.flags.tracertogcol
                    end
                    Tracers.Visible = true
                end
                if library.flags.headtog then
                    local head = Player.Character:FindFirstChild("Head")
                    if head then
                        local headpos = head.Position
                        local headdotpos = workspace.CurrentCamera:WorldToViewportPoint(Vector3.new(headpos.x, headpos.y + 0.1, headpos.z))
                        local headdotpos_b = workspace.CurrentCamera:WorldToViewportPoint(Vector3.new(headpos.x, headpos.y - 0.2, headpos.z))
                        local difference = headdotpos_b.y - headdotpos.y

                        HeadDot.Radius = difference * 2
                        HeadDot.Visible = true
                        HeadDot.Position = Vector2.new(headdotpos.x, headdotpos_b.y - difference)
                        if library.flags.tt and "["..Player.Name.."]" then
                            HeadDot.Color = library.flags.tcol
                        else
                            HeadDot.Color = library.flags.headtogcol
                        end
                    end
                end
            end
        else
            if isAlive(Player) and Player.Character:FindFirstChildOfClass("Highlight") then
                Player.Character:FindFirstChildOfClass("Highlight"):Destroy()
            end
            if PLRDS[Player] then
                for i, v in pairs(PLRDS[Player]) do
                    if v.Visible ~= false then
                        v.Visible = false
                    end
                end
            end
        end
    end
end

local function movement()
    if library.flags.mvtp and library.flags.mvtpkey then
        local targetPos = LocalMouse.Hit.p
        local RP = LocalPlayer.Character.HumanoidRootPart
        RP.CFrame = CFrame.new(targetPos + Vector3.new(0, 7, 0))
        return Enum.ContextActionResult.Sink
    end

    local humanoid = LocalPlayer.Character:FindFirstChild("Humanoid")  
    local rootpart = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    local char = LocalPlayer:FindFirstChild("Character")

    if library.flags.mvspeed and library.flags.mvspeedkey then
        if library.flags.mvspeedtype == "Velocity" then
            if humanoid ~= nil and rootpart ~= nil then
                local travel = Vector3.new()
                local looking = Workspace.CurrentCamera.CFrame.lookVector
                if UserInputService:IsKeyDown(Enum.KeyCode.W) then
                    travel += Vector3.new(looking.x, 0, looking.Z)
                end
                if UserInputService:IsKeyDown(Enum.KeyCode.S) then
                    travel -= Vector3.new(looking.x, 0, looking.Z)
                end
                if UserInputService:IsKeyDown(Enum.KeyCode.D) then
                    travel += Vector3.new(-looking.Z, 0, looking.x)
                end
                if UserInputService:IsKeyDown(Enum.KeyCode.A) then
                    travel += Vector3.new(looking.Z, 0, -looking.x)
                end

                travel = travel.Unit

                local newDir = Vector3.new(travel.x * library.flags.mvspeedamt, rootpart.Velocity.y, travel.Z * library.flags.mvspeedamt)

                if travel.Unit.x == travel.Unit.x then
                    rootpart.Velocity = newDir
                end
            end
        elseif library.flags.mvspeedtype == "Walk Speed" then
            if humanoid ~= nil and rootpart ~= nil then
                LocalPlayer.Character.Humanoid.WalkSpeed = library.flags.mvspeedamt
            end
        end
    else
        if humanoid ~= nil and rootpart ~= nil then
            LocalPlayer.Character.Humanoid.WalkSpeed = 16
        end
    end

    if library.flags.mvnc and library.flags.mvnckey then
        if humanoid ~= nil and rootpart ~= nil then
            for _,v in pairs(LocalPlayer.Character:GetDescendants()) do
                if v:IsA("BasePart") and v.CanCollide == true then
                    v.CanCollide = false
                end
            end
        end
    end

    if library.flags.mvjump and library.flags.mvjumpkey and LocalPlayer.Character and LocalPlayer.Character.Humanoid then
        LocalPlayer.Character.Humanoid.JumpPower = library.flags.mvjumpamt
    else
        LocalPlayer.Character.Humanoid.JumpPower = 50
    end

    if library.flags.mvfly then
        local rootpart = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")

        cachedValues.FlyToggle = library.flags.mvflykey

        if library.flags.mvflytype == "Noclip" and cachedValues.FlyToggle then
            for _,v in pairs(LocalPlayer.Character:GetDescendants()) do
                if v:IsA("BasePart") and v.CanCollide == true then
                    v.CanCollide = false
                end
            end
        end
        if cachedValues.FlyToggle then
            local speed = library.flags.mvflyamt

            local travel = Vector3.new()
            local looking = workspace.CurrentCamera.CFrame.lookVector --getting camera looking vector

            do
                if UserInputService:IsKeyDown(Enum.KeyCode.W) then
                    travel += looking
                end
                if UserInputService:IsKeyDown(Enum.KeyCode.S) then
                    travel -= looking
                end
                if UserInputService:IsKeyDown(Enum.KeyCode.D) then
                    travel += Vector3.new(-looking.Z, 0, looking.x)
                end
                if UserInputService:IsKeyDown(Enum.KeyCode.A) then
                    travel += Vector3.new(looking.Z, 0, -looking.x)
                end

                if UserInputService:IsKeyDown(Enum.KeyCode.Space) then
                    travel += Vector3.new(0, 1, 0)
                end
                if UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) then
                    travel -= Vector3.new(0, 1, 0)
                end
            end

            if travel.Unit.x == travel.Unit.x then
                rootpart.Anchored = false
                rootpart.Velocity = travel.Unit * speed --multiplaye the unit by the speed to make
            else
                rootpart.Velocity = Vector3.new(0, 0, 0)
                rootpart.Anchored = true
            end
        else
            rootpart.Anchored = false
            cachedValues.FlyToggle = false
        end
    end
end

local function visfuncs()
    ColorCorrection.Saturation = 0
    ColorCorrection.Contrast = 0
    Camera = workspace.CurrentCamera

    if targethel and target and targetdis then
        target:SetValue(tname)
        targethel:SetValue(thealth)
        targetdis:SetValue(tdistance)
    end

    if library.flags.lcfov then
        Camera.FieldOfView = library.flags.lcfovamt
    end

    if library.flags.wlcon then
        ColorCorrection.Contrast = library.flags.wlconamt
    end

    if library.flags.wlsat then
        ColorCorrection.Saturation = library.flags.wlsatamt
    end

    if library.flags.wlambient then
        game:GetService("Lighting").OutdoorAmbient = library.flags.wlambientcol
        game:GetService("Lighting").Ambient = library.flags.wlambientcola
    end

    if library.flags.wltime then
        game:GetService("Lighting").TimeOfDay = library.flags.wltimea
    end

    FovCircle.Visible = library.flags.aimfovt
    FovCircle.NumSides = library.flags.aimnumsides
    FovCircle.Radius = library.flags.aimfov
    FovCircle.Color = library.flags.aimfovcol
    FovCircle.Position = Vector2.new(UserInputService:GetMouseLocation().x, UserInputService:GetMouseLocation().y)

    FovCircle2.Visible = library.flags.aimfovt
    FovCircle2.NumSides = library.flags.aimnumsides
    FovCircle2.Radius = library.flags.aimfov
    FovCircle2.Color = library.flags.aimfovcolb
    FovCircle2.Position = Vector2.new(UserInputService:GetMouseLocation().x, UserInputService:GetMouseLocation().y)
end

local ballsack = utility:Connection(RunService.RenderStepped, function()
    do
        esprend()
    end

    do
        visfuncs()
    end

    do
        movement()
    end

    do
        Aimbot()
    end
end)

task.spawn(function()
    while task.wait(library.flags.chatspamamt) do
        if library.flags.chatspam then
            game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(messages[math.random(1, msize)]:gsub('\"', ''), "All")
        end
    end
end)

utility:Connection(library.unloaded, function()
    ballsack:Disconnect()
end)

function menu()
    -- [[ Alsike - v0.0.5 ]]--
    local window = library:NewWindow({title = "Alsike Universal"});
    local combatTab = window:AddTab("Combat", 0);
    local visualsTab = window:AddTab("Visuals", 1);
    local miscTab = window:AddTab("Misc", 2);
    local aimSec = combatTab:AddSection("Aim Assist", 1);
    local fovSec = combatTab:AddSection("FOV", 2);
    local tarSec = combatTab:AddSection("Target", 2);
    local moveSec = miscTab:AddSection("Movement", 1);
    local othmSec = miscTab:AddSection("Other", 2);
    local playerSec = visualsTab:AddSection("Player ESP", 1);
    local worldSec = visualsTab:AddSection("World", 2);
    local lcSec = visualsTab:AddSection("Local", 2);

    --[[ Combat ]]--

    local aiment = aimSec:AddToggle({text = "Enabled", flag = "aimenabled"})
    aiment:AddBind({text = 'Aimbot', flag = 'aimkey', mode = 'hold', nomouse = false, noindicator = false, bind = Enum.KeyCode.E})

    aimSec:AddToggle({text = "Force Angles in First Person", flag = "aimangles"})

    aimSec:AddList({text = "Hitbox", flag = "aimhit", selected = "Head", multi = false, values = {"Head", "Torso"}})

    aimSec:AddSlider({text = "Smoothing Ammount", flag = "aimsmooth", suffix = "%", min = 0, max = 100, increment = 1})

    aimSec:AddList({text = "Checks", flag = "aimcheck", multi = true, values = {"Distance", "Same Team", "Alive"}})

    aimSec:AddSlider({text = "Max Distance", flag = "aimdis", suffix = "m", min = 30, max = 1500, increment = 1})

    local aimfovto = fovSec:AddToggle({text = "Aim Assist FOV", flag = "aimfovt"})
    aimfovto:AddSlider({text = "Numsides", flag = "aimnumsides", suffix = "", min = 1, max = 50, increment = 1})
    aimfovto:AddSlider({text = "Aim Assist FOV", flag = "aimfov", suffix = "", min = 1, max = 1000, increment = 1})
    aimfovto:AddColor({text = "Aim Assist FOV", color = Color3.fromRGB(255, 255, 255), flag = "aimfovcol"})
    aimfovto:AddColor({text = "Aim Assist Border FOV", color = Color3.fromRGB(0, 0, 0), flag = "aimfovcolb"})

    local aimsnt = tarSec:AddToggle({text = "Snaplines", flag = "aimsnap"})
    local ttt = tarSec:AddToggle({text = "Target Color", flag = "tt"})
    ttt:AddColor({text = "Target Color", color = Color3.fromRGB(255, 0, 98), flag = "tcol"})
    aimsnt:AddColor({text = "Snaplines", color = Color3.fromRGB(255, 255, 255), flag = "aimsnapcol"})

    tarSec:AddToggle({text = "Display Info", flag = "aiminfo", callback = function(val)
        ind:SetEnabled(val)
    end})

    tarSec:AddSlider({text = 'Position X', flag = 'aimx', suffix = '%', min = 0, max = 100, increment = .1, callback = function()
        ind:SetPosition(newUDim2(library.flags.aimx / 100, 0, library.flags.aimy / 100, 0))
    end})

    tarSec:AddSlider({text = 'Position Y', flag = 'aimy', suffix = '%', min = 0, max = 100, increment = .1, callback = function()
        ind:SetPosition(newUDim2(library.flags.aimx / 100, 0, library.flags.aimy / 100, 0))  
    end})
    ind:SetPosition(newUDim2(library.flags.aimx / 100, 0, library.flags.aimy / 100, 0))

    --[[ Visuals ]]--

    local espen = playerSec:AddToggle({text = "Enabled", flag = "espenabled"})

    local chamesp = playerSec:AddToggle({text = "Chams", flag = "chametog"})
    chamesp:AddColor({text = "Chams", color = Color3.fromRGB(255, 0, 125), flag = "chamtogcol"})
    chamesp:AddColor({text = "Chams Outline", flag = "chamstolcolo", color = Color3.fromRGB(255, 255, 0)})
    chamesp:AddSlider({text = "", flag = "chamstrans", value = 0.5, min = 0, max = 1, increment = 0.01})
    chamesp:AddSlider({text = "", flag = "chamstransb", value = 0.5, min = 0, max = 1, increment = 0.01})

    local nameesp = playerSec:AddToggle({text = "Name", flag = "nametog"})
    nameesp:AddColor({text = "Name", flag = "nametogcol", color = Color3.fromRGB(255, 255, 255)})

    local boxesp = playerSec:AddToggle({text = "Box", flag = "boxtog"})
    boxesp:AddColor({text = "Box", flag = "boxtogcol", color = Color3.fromRGB(255, 255, 255)})
    boxesp:AddColor({text = "Box Fill", flag = "boxftogcol", color = Color3.fromRGB(255, 255, 255), flag = "boxfillcol"})
    boxesp:AddSlider({text = "Box Fill Transparency", flag = "boxfilltrans", value = 0.2, min = 0, max = 1, increment = 0.01})

    local healthesp = playerSec:AddToggle({text = "Health", flag = "healthtog"})
    healthesp:AddColor({text = "Health", flag = "healthtogcol", color = Color3.fromRGB(255, 255, 0)})

    local distanceesp = playerSec:AddToggle({text = "Distance", flag = "distancetog"})
    distanceesp:AddColor({text = "Distance", flag = "distancetogcol", color = Color3.fromRGB(255, 255, 255)})

    local toolesp = playerSec:AddToggle({text = "Tool", flag = "tooltog"})
    toolesp:AddColor({text = "Tool", flag = "tooltogcol", color = Color3.fromRGB(255, 255, 255)})


    local traceresp = playerSec:AddToggle({text = "Tracer", flag = "tracertog"})
    traceresp:AddColor({text = "Tracer", flag = "tracertogcol", color = Color3.fromRGB(255, 255, 255)})

    local headdotesp = playerSec:AddToggle({text = "Head Dot", flag = "headtog"})
    headdotesp:AddColor({text = "Head Dot", flag = "headtogcol", color = Color3.fromRGB(255, 255, 255)})

    local offesp = playerSec:AddToggle({text = "Off Screen Arrow", flag = "ooftog"})
    offesp:AddColor({text = "Off Screen Arrow", flag = "ooftogcol", color = Color3.fromRGB(255, 255, 255)})

    playerSec:AddSeparator({text = 'Settings'})

    playerSec:AddToggle({text = "Outline", flag = "espout"})

    playerSec:AddToggle({text = "Teammates", flag = "espteam"})

    playerSec:AddSlider({text = "Arrow Radius", flag = "espard", suffix = "", min = 100, max = 1500, increment = 1})

    playerSec:AddSlider({text = "Arrow Size", flag = "espar", suffix = "", min = 5, max = 50, increment = 1})

    playerSec:AddList({text = "Text Case", flag = "espcase", selected = "Normal", multi = false, values = {"lowercase", "Normal", "UPPERCASE"}})

    playerSec:AddSlider({text = "Text Size", flag = "espsize", value = 13, min = 8, max = 28, increment = 1})

    playerSec:AddSlider({text = "Text Font", flag = "espfont", value = 2, min = 0, max = 3, increment = 1})

    local othSec = visualsTab:AddSection("Other ESP", 2);
    
    local exitesp = othSec:AddToggle({text = "Exits ESP", flag = "exittog"})
    exitesp:AddColor({text = "Exits", flag = "exittogcol"})

    local worldambient = worldSec:AddToggle({text = "Ambient", flag = "wlambient"})
    worldambient:AddColor({text = "Ambient", flag = "wlambientcola"})
    worldambient:AddColor({text = "Outdoor Ambient", flag = "wlambientcol"})

    local worldcon = worldSec:AddToggle({text = "Contrast", flag = "wlcon"})
    worldcon:AddSlider({text = "", flag = "wlconamt", value = 0.5, min = 0, max = 1, increment = 0.01})

    local worldsat = worldSec:AddToggle({text = "Saturation", flag = "wlsat"})
    worldsat:AddSlider({text = "", flag = "wlsatamt", value = 0.5, min = 0, max = 1, increment = 0.01})

    local worldtime = worldSec:AddToggle({text = "Time", flag = "wltime"})
    worldtime:AddSlider({text = "", flag = "wltimea", value = 12, min = 0, max = 24, increment = 1})

    local fovchangers = lcSec:AddToggle({text = "Change FOV", flag = "lcfov"})
    fovchangers:AddSlider({text = "Camera FOV", flag = "lcfovamt", suffix = "°", min = 60, max = 120, increment = 1})

    --[[ Misc ]]--

    local mvspeedt = moveSec:AddToggle({text = "Walkspeed", flag = "mvspeed"})
    mvspeedt:AddBind({text = 'Walkspeed', flag = 'mvspeedkey', mode = 'hold', nomouse = true, noindicator = false})

    local mvjumpt = moveSec:AddToggle({text = "Jump Power", flag = "mvjump"})
    mvjumpt:AddBind({text = 'Jump Power', flag = 'mvjumpkey', mode = 'hold', nomouse = true, noindicator = false})

    local mvflyt = moveSec:AddToggle({text = "Fly", flag = "mvfly"})
    mvflyt:AddBind({text = 'Fly', flag = 'mvflykey', mode = 'toggle', nomouse = true, noindicator = false})

    local mvtpt = moveSec:AddToggle({text = "Mouse Teleport", flag = "mvtp"})
    mvtpt:AddBind({text = 'Mouse Teleport', flag = 'mvtpkey', mode = 'hold', nomouse = true, noindicator = false})

    local mvnct = moveSec:AddToggle({text = "Noclip", flag = "mvnc"})
    mvnct:AddBind({text = 'Noclip', flag = 'mvnckey', mode = 'toggle', nomouse = true, noindicator = false})

    moveSec:AddSeparator({text = 'Settings'})

    moveSec:AddSlider({text = "Walkspeed Factor", flag = "mvspeedamt", suffix = " stud/s", value = 30, min = 1, max = 400, increment = 1})

    moveSec:AddSlider({text = "Jumpspeed Factor", flag = "mvjumpamt", suffix = " stud/s", value = 80, min = 1, max = 400, increment = 1})

    moveSec:AddSlider({text = "Fly Factor", flag = "mvflyamt", suffix = " stud/s", value = 25, min = 1, max = 400, increment = 1})

    moveSec:AddList({text = "Walkspeed Method", flag = "mvspeedtype", selected = "Velocity", multi = false, values = {"Velocity", "Walk Speed"}})

    moveSec:AddList({text = "Fly Method", flag = "mvflytype", selected = "Velocity", multi = false, values = {"Velocity", "Noclip"}})

    local chatt = othmSec:AddToggle({text = "Chat Spam", flag = "chatspam"})
    chatt:AddSlider({text = "", flag = "chatspamamt", suffix = "s", value = 5, min = 1, max = 20, increment = 1})

    --[[ Settings ]]--

    library:CreateSettingsTab(window)

    -- [[ Dumb Shit ]]--

    local loadtime = math.floor((tick() - loads) * 1000)

    library:SendNotification("Welcome to alsike " ..library.cheatuser.. "! | Loaded in " ..loadtime.. "ms", 8, Color3.fromRGB(0, 255, 72));
    library:SendNotification("Press RIGHTSHIFT to open/close menu!", 5, Color3.fromRGB(0, 255, 72));

    local carhorn = Instance.new("Sound", game.Workspace)
    carhorn.SoundId = "rbxassetid://130803242"
    carhorn.Volume = 100
    carhorn:Play()
    local intro = Instance.new("Sound", game.Workspace)
    intro.SoundId = "rbxassetid://1845435889"
    intro.Volume = 0.5
    intro:Play()
end
    
menu()

getgenv().library = library
return library
