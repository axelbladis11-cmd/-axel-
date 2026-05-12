-- [[ $$ RATON KING OF HVH $$ ]]
local player = game.Players.LocalPlayer
local pgui = player:WaitForChild("PlayerGui")
local uis = game:GetService("UserInputService")

-- Limpiar si ya existe
if pgui:FindFirstChild("RatonHub") then pgui.RatonHub:Destroy() end

-- Crear GUI
local sg = Instance.new("ScreenGui")
sg.Name = "RatonHub"
sg.Parent = pgui
sg.ResetOnSpawn = false

-- Cuadrado Principal
local frame = Instance.new("Frame")
frame.Name = "MainFrame"
frame.Size = UDim2.new(0, 220, 0, 150)
frame.Position = UDim2.new(0.5, -110, 0.2, 0)
frame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
frame.BorderSizePixel = 2
frame.BorderColor3 = Color3.fromRGB(255, 215, 0) -- Amarillo
frame.Active = true
frame.Draggable = true
frame.Parent = sg

-- Título
local title = Instance.new("TextLabel")
title.Text = "$$ RATON KING OF HVH $$"
title.Size = UDim2.new(1, 0, 0, 40)
title.TextColor3 = Color3.fromRGB(255, 215, 0)
title.BackgroundTransparency = 1
title.Font = Enum.Font.SourceSansBold
title.TextSize = 18
title.Parent = frame

-- Botón ON/OFF
local statusButton = Instance.new("TextButton")
statusButton.Name = "ToggleButton"
statusButton.Size = UDim2.new(0.8, 0, 0, 60)
statusButton.Position = UDim2.new(0.1, 0, 0.4, 0)
statusButton.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
statusButton.Text = "OFF"
statusButton.TextColor3 = Color3.fromRGB(255, 0, 0)
statusButton.Font = Enum.Font.SourceSansBold
statusButton.TextSize = 35
statusButton.Parent = frame

-- Lógica Anti-Bag
_G.AntiBagRaton = false

local function ToggleRaton()
    _G.AntiBagRaton = not _G.AntiBagRaton
    
    if _G.AntiBagRaton then
        statusButton.Text = "ON"
        statusButton.TextColor3 = Color3.fromRGB(0, 255, 0)
        
        task.spawn(function()
            while _G.AntiBagRaton do
                local char = player.Character
                if char then
                    for _, v in ipairs(char:GetChildren()) do
                        if v.Name:lower():find("bag") or v.Name == "Grip" then 
                            v:Destroy()
                        end
                    end
                end
                task.wait(0.1)
            end
        end)
    else
        statusButton.Text = "OFF"
        statusButton.TextColor3 = Color3.fromRGB(255, 0, 0)
    end
end

-- Tecla J y Click
uis.InputBegan:Connect(function(input, processed)
    if not processed and input.KeyCode == Enum.KeyCode.J then
        ToggleRaton()
    end
end)

statusButton.MouseButton1Click:Connect(ToggleRaton)
