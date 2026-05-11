-- [[ $$ AXEL $$ HUB EXCLUSIVE ]]
-- Verificación de Ejecutor
local executor = identifyexecutor()

if not executor:find("Xeno") then
    game.Players.LocalPlayer:Kick("$$ AXEL $$ HUB: Este script solo es compatible con XENO.")
    return
end

print("$$ AXEL $$ HUB: Bienvenido usuario de Xeno.")

-- Cargar Librería Orion
local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

-- Crear Ventana Principal
local Window = OrionLib:MakeWindow({
    Name = "$$ AXEL $$ HUB", 
    HidePremium = false, 
    SaveConfig = true, 
    ConfigFolder = "AxelHub",
    IntroText = "$$ AXEL $$"
})

-- Pestaña de HvH
local Tab = Window:MakeTab({
    Name = "Axel $$",
    Icon = "rbxassetid://4483345906",
    PremiumOnly = false
})

-- Sección de Defensa
Tab:AddSection({
    Name = "Defensa Automática"
})

-- Toggle Anti-Bag
Tab:AddToggle({
    Name = "Anti-Bag ($$ AXEL $$)",
    Default = false,
    Callback = function(Value)
        _G.AntiBag = Value
        if Value then
            -- Inicia el bucle de protección en un hilo separado
            task.spawn(function()
                while _G.AntiBag do
                    task.wait(0.1)
                    local char = game.Players.LocalPlayer.Character
                    if char then
                        for _, v in pairs(char:GetChildren()) do
                            -- Detecta bolsas y el objeto Grip (remate)
                            if v.Name:lower():find("bag") or v.Name == "Grip" then 
                                v:Destroy()
                            end
                        end
                    end
                end
            end)
            
            -- Notificación de activación
            OrionLib:MakeNotification({
                Name = "$$ AXEL $$",
                Content = "Anti-Bag e Anti-Grip ACTIVADOS",
                Image = "rbxassetid://4483345906",
                Time = 3
            })
        end
    end    
})

-- Botón para cerrar el menú
Tab:AddButton({
    Name = "Cerrar Hub",
    Callback = function()
        OrionLib:Destroy()
    end    
})

-- Finalizar inicialización
OrionLib:Init()
