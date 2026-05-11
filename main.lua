-- [[ $$ AXEL $$ HUB EXCLUSIVE ]]
-- Verificación rápida
if not identifyexecutor():find("Xeno") then
    game.Players.LocalPlayer:Kick("$$ AXEL $$ HUB: Usa Xeno.")
    return
end

local OrionLib = loadstring(game:HttpGet('https://raw.githubusercontent.com/jensonhirst/Orion/main/source'))()
local Window = OrionLib:MakeWindow({
    Name = "$$ AXEL $$ HUB", 
    HidePremium = false, 
    SaveConfig = false, 
    IntroText = "$$ AXEL $$"
})

-- Variables de estado
_G.AntiBagAxel = false
local UserInputService = game:GetService("UserInputService")

-- Pestaña Principal
local Tab = Window:MakeTab({
    Name = "Axel $$",
    Icon = "rbxassetid://4483345906",
    PremiumOnly = false
})

-- Función de protección (Mejorada para no dar Lag)
local function ToggleProtection()
    _G.AntiBagAxel = not _G.AntiBagAxel
    
    if _G.AntiBagAxel then
        OrionLib:MakeNotification({Name = "$$ AXEL $$", Content = "Anti-Bag: ACTIVADO", Time = 2})
        task.spawn(function()
            while _G.AntiBagAxel do
                local char = game.Players.LocalPlayer.Character
                if char then
                    for _, v in ipairs(char:GetChildren()) do
                        if v.Name:lower():find("bag") or v.Name == "Grip" then 
                            v:Destroy()
                        end
                    end
                end
                task.wait(0.2) -- Un poco más de espera para evitar crasheos
            end
        end)
    else
        OrionLib:MakeNotification({Name = "$$ AXEL $$", Content = "Anti-Bag: DESACTIVADO", Time = 2})
    end
end

-- Botón en el menú por si no quieres usar la tecla
Tab:AddToggle({
	Name = "Anti-Bag ($$ AXEL $$)",
	Default = false,
	Callback = function(Value)
        if _G.AntiBagAxel ~= Value then
		    ToggleProtection()
        end
	end    
})

-- Botón para cerrar que SI funciona
Tab:AddButton({
	Name = "Cerrar y Limpiar Hub",
	Callback = function()
        _G.AntiBagAxel = false -- Apaga todo antes de cerrar
        OrionLib:Destroy()
	end    
})

-- SISTEMA DE TECLA J (Independiente del GUI para que no crashee)
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if not gameProcessed and input.KeyCode == Enum.KeyCode.J then
        ToggleProtection()
    end
end)

OrionLib:Init()
