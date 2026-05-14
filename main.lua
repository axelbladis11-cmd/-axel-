-- [[$$ Raton King Of HvH$$ ]]
local player = game.Players.LocalPlayer
local pgui = player:WaitForChild("PlayerGui")
local uis = game:GetService("UserInputService")

-- Limpiar versiones anteriores para que no se amontonen
if pgui:FindFirstChild("RatonKingOfHvH") then 
    pgui.RatonKingOfHvH:Destroy() 
end

-- Crear la interfaz base
local sg = Instance.new("ScreenGui")
sg.Name = "RatonKingOfHvH"
sg.Parent = pgui
sg.ResetOnSpawn = false

-- El cuadrado amarillo (Marco Principal)
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 250, 0, 160)
frame.Position = UDim2.new(0.5, -125, 0.3, 0)
frame.BackgroundColor3 = Color3.fromRGB(10, 10, 10) -- Fondo Negro
frame.BorderSizePixel = 3
frame.BorderColor3 = Color3.fromRGB(255, 230, 0) -- Borde Amarillo
frame.Active = true
frame.Draggable = true
frame.Parent = sg

-- Título
local title = Instance.new("TextLabel")
title.Text = "RatonKingOfHvH"
title.Size = UDim2.new(1, 0, 0, 45)
title.TextColor3 = Color3.fromRGB(255, 230, 0)
title.BackgroundTransparency = 1
title.Font = Enum.Font.SourceSansBold
title.TextSize = 20
title.Parent = frame

-- El Botón ON / OFF
local btn = Instance.new("TextButton")
btn.Size = UDim2.new(0.8, 0, 0, 70)
btn.Position = UDim2.new(0.1, 0, 0.4, 0)
btn.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
btn.Text = "OFF" -- Texto inicial corregido
btn.TextColor3 = Color3.fromRGB(255, 0, 0) -- Rojo inicial
btn.Font = Enum.Font.SourceSansBold
btn.TextSize = 40
btn.Parent = frame

-- Lógica de activación (Tecla J y Click)
local estado = false

local function alternar()
    estado = not estado
    if estado then
        -- Cuando se activa
        btn.Text = "ON"
        btn.TextColor3 = Color3.fromRGB(0, 255, 0) -- Verde neón
    else
        -- Cuando se apaga
        btn.Text = "OFF"
        btn.TextColor3 = Color3.fromRGB(255, 0, 0) -- Rojo
    end
end

-- Conexión por Click en el botón
btn.MouseButton1Click:Connect(alternar)

-- Conexión por Tecla J
uis.InputBegan:Connect(function(input, chat)
    if not chat and input.KeyCode == Enum.KeyCode.J then
        alternar()
    end
end)
