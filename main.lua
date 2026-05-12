-- [[ $$ RATON KING OF HVH $$ ]]
local player = game.Players.LocalPlayer
local pgui = player:WaitForChild("PlayerGui")
local uis = game:GetService("UserInputService")

-- Eliminar GUI si ya existe
if pgui:FindFirstChild("RatonHub") then pgui.RatonHub:Destroy() end

-- Crear la Pantalla
local sg = Instance.new("ScreenGui", pgui)
sg.Name = "RatonHub"
sg.ResetOnSpawn = false

-- Marco Principal
local frame = Instance.new("Frame", sg)
frame.Size = UDim2.new(0, 220, 0, 150)
frame.Position = UDim2.new(0.5, -110, 0.2, 0)
frame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
frame.BorderSizePixel = 2
frame.BorderColor3 = Color3.fromRGB(255, 215, 0) -- Amarillo
frame.Active = true
frame.Draggable = true

-- Título
local title = Instance.new("TextLabel", frame)
title.Text = "$$ RATON KING OF HVH $$"
title.Size = UDim2.new(1, 0, 0, 40)
title.TextColor3 = Color3.fromRGB(255, 215, 0)
title.BackgroundTransparency = 1
title.Font = Enum.Font.GothamBold
title.TextSize = 16

-- El Botón de Estado
local statusButton = Instance.new("TextButton", frame)
statusButton.Size = UDim2.new(0.8, 0, 0, 50)
statusButton.Position = UDim2.new(0.1, 0, 0.45, 0)
statusButton.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
statusButton.Text = "OFF"
statusButton.TextColor3 = Color3.fromRGB(255, 0, 0)
statusButton.Font = Enum.Font.GothamBlack
statusButton.TextSize = 30
statusButton.BorderSizePixel = 1
statusButton.BorderColor3 = Color3.fromRGB(255, 0, 0)

local corner = Instance.new("UICorner", statusButton)
corner.CornerRadius = UDim.new(0, 8)

-- Lógica
_G.AntiBagRaton = false

local function ToggleRaton()
    _G.AntiBagRaton = not _G.AntiBagRaton
    
    if _G.AntiBagRaton then
        statusButton.Text = "ON"
        statusButton.TextColor3 = Color3.fromRGB(0, 255, 0)
        statusButton.BorderColor3 = Color3.fromRGB(0, 255, 0)
        
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
        statusButton.BorderColor3 = Color3.fromRGB(255, 0, 0)
    end
end

-- Tecla J
uis.InputBegan:Connect(function(input, processed)
    if not processed and input.KeyCode == Enum.KeyCode.J then
        ToggleRaton()
    end
end)

statusButton.MouseButton1Click:Connect(ToggleRaton)
