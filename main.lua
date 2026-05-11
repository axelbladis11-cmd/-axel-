-- [[ $$ AXEL $$ HUB EXCLUSIVE ]]
local executor = identifyexecutor()

if not executor:find("Xeno") then
    game.Players.LocalPlayer:Kick("$$ AXEL $$ HUB: Este script solo es compatible con XENO.")
    return
end

print("$$ AXEL $$ HUB: Bienvenido usuario de Xeno.")

-- Nueva fuente de Orion más estable
local OrionLib = loadstring(game:HttpGet('https://raw.githubusercontent.com/jensonhirst/Orion/main/source'))()

local Window = OrionLib:MakeWindow({
    Name = "$$ AXEL $$ HUB", 
    HidePremium = false, 
    SaveConfig = true, 
    ConfigFolder = "AxelHub",
    IntroText = "$$ AXEL $$"
})

local Tab = Window:MakeTab({
    Name = "Axel $$",
    Icon = "rbxassetid://4483345906",
    PremiumOnly = false
})

Tab:AddSection({
    Name = "Defensa Automática"
})

Tab:AddToggle({
    Name = "Anti-Bag ($$ AXEL $$)",
    Default = false,
    Callback = function(Value)
        _G.AntiBag = Value
        if Value then
            task.spawn(function()
                while _G.AntiBag do
                    task.wait(0.1)
                    local char = game.Players.LocalPlayer.Character
                    if char then
                        for _, v in pairs(char:GetChildren()) do
                            if v.Name:lower():find("bag") or v.Name == "Grip" then 
                                v:Destroy()
                            end
                        end
                    end
                end
            end)
        end
    end    
})

OrionLib:Init()
