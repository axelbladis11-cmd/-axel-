-- [[ $$ RATON KING OF HVH $$ ]]
local player = game.Players.LocalPlayer
local pgui = player:WaitForChild("PlayerGui")
local uis = game:GetService("UserInputService")

-- Limpiar versiones anteriores
if pgui:FindFirstChild("RatonHub") then 
    pgui.RatonHub:Destroy() 
end

-- Crear la interfaz base
local sg = Instance.new("ScreenGui")
sg.Name = "RatonHub"
sg.Parent = pgui
sg.ResetOnSpawn = false

-- El cuadrado amarillo
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 250, 0, 160)
frame.Position = UDim2.new(0.5, -125, 0.3, 0)
frame.BackgroundColor3 = Color3.fromRGB(10, 10, 10) -- Negro puro
frame.BorderSizePixel = 3
frame.BorderColor3 = Color3.fromRGB(255, 230, 0) -- Amarillo Neón
frame.Active = true
frame.Draggable = true
frame.Parent = sg

-- Título imponente
local title = Instance.new("TextLabel")
title.Text = "$$ Raton King of HvH $$"
title.Size = UDim2.new(1, 0, 0, 45)
title.TextColor3 = Color3.fromRGB(255, 230, 0)
title.BackgroundTransparency = 1
title.Font = Enum.Font.SourceSansBold
title.TextSize = 20
title.Parent = frame

-- El Botón Central
local btn = Instance.new("TextButton")
btn.Size = UDim2.new(0.8, 0, 0, 70)
btn.Position = UDim2.new(0.1, 0, 0.4, 0)
btn.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
btn.Text = "OFF"
btn.TextColor3 = Color3.fromRGB(255, 0, 0) -- Rojo apagado
btn.Font = Enum.Font.SourceSansBold
btn.TextSize = 40
btn.Parent = frame

-- Lógica de activación
local estado = false

local function alternar()
    estado = not estado
    if estado then
        btn.Text = "ON"
        btn.TextColor3 = Color3.fromRGB(0, 255, 0) -- Verde neón
        print("$$ Raton King of HvH $$: ACTIVADO")
    else
        btn.Text = "OFF"
        btn.TextColor3 = Color3.fromRGB(255, 0, 0) -- Rojo
        print("$$ Raton King Of HvH $$: DESACTIVADO")
    end
end

-- Activar con click
btn.MouseButton1Click:Connect(alternar)

-- Activar con tecla J
uis.InputBegan:Connect(function(input, chat)
    if not chat and input.KeyCode == Enum.KeyCode.J then
        alternar()
    end
end)
