local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

-- Crear la ventana principal
local Window = OrionLib:MakeWindow({
    Name = "$$ AXEL $$ ", 
    HidePremium = false, 
    SaveConfig = true, 
    ConfigFolder = "AxelHub",
    IntroText = "$$ AXEL $$"
})

-- Pestaña de Combate/HvH
local Tab = Window:MakeTab({
	Name = "Axel $$",
	Icon = "rbxassetid://4483345906",
	PremiumOnly = false
})

-- Sección de Defensa
Tab:AddSection({
	Name = "Defensa Automática"
})

-- El Toggle del Anti-Bag que hicimos
Tab:AddToggle({
	Name = "Anti-Bag ($$AXEL$$)",
	Default = false,
	Callback = function(Value)
		_G.AntiBag = Value
        if Value then
            -- Iniciar el sistema de protección
            spawn(function()
                while _G.AntiBag do
                    task.wait(0.1)
                    local char = game.Players.LocalPlayer.Character
                    if char then
                        for _, v in pairs(char:GetChildren()) do
                            if v.Name:find("Bag") or v.Name == "Grip" then 
                                v:Destroy()
                            end
                        end
                    end
                end
            end)
            OrionLib:MakeNotification({
                Name = "$$ AXEL $$",
                Content = "Anti-Bag ACTIVADO",
                Image = "rbxassetid://4483345906",
                Time = 3
            })
        end
	end    
})

-- Botón para destruir el menú (Limpiar)
Tab:AddButton({
	Name = "Cerrar Hub",
	Callback = function()
        OrionLib:Destroy()
  	end    
})

OrionLib:Init()