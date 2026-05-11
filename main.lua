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
        
        if _G.AntiBag then
            -- Notificación rápida para saber que el click funcionó
            OrionLib:MakeNotification({
                Name = "$$ AXEL $$",
                Content = "SISTEMA ACTIVO",
                Time = 2
            })
            
            -- El bucle de protección
            task.spawn(function()
                while _G.AntiBag do
                    local char = game.Players.LocalPlayer.Character
                    if char then
                        for _, v in pairs(char:GetChildren()) do
                            if v.Name:lower():find("bag") or v.Name == "Grip" then 
                                v:Destroy()
                            end
                        end
                    end
                    task.wait(0.1)
                end
            end)
        else
            OrionLib:MakeNotification({
                Name = "$$ AXEL $$",
                Content = "SISTEMA DESACTIVADO",
                Time = 2
            })
        end
	end    
})

OrionLib:Init()
