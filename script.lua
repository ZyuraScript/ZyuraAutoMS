-- // Zyura Free Auto Marshmallow \ --
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

-- Hapus GUI lama jika script dieksekusi ulang
if PlayerGui:FindFirstChild("ZyuraAutoMS") then
    PlayerGui.ZyuraAutoMS:Destroy()
end

-- Membuat ScreenGui
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "ZyuraAutoMS"
ScreenGui.Parent = PlayerGui
ScreenGui.ResetOnSpawn = false

-- Tab / Frame Utama (Hitam & Draggable persis Jawa Hub) - Tinggi diperbesar jadi 350
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(18, 18, 22) -- Hitam Pekat
MainFrame.BorderSizePixel = 0
MainFrame.Position = UDim2.new(0.35, 0, 0.25, 0)
MainFrame.Size = UDim2.new(0, 240, 0, 350)
MainFrame.Active = true
MainFrame.Draggable = true

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 12)
UICorner.Parent = MainFrame

-- Judul Script
local TitleLabel = Instance.new("TextLabel")
TitleLabel.Parent = MainFrame
TitleLabel.BackgroundTransparency = 1
TitleLabel.Position = UDim2.new(0, 0, 0, 12)
TitleLabel.Size = UDim2.new(1, 0, 0, 22)
TitleLabel.Font = Enum.Font.SourceSansBold
TitleLabel.Text = "Zyura Free Auto Marshmallow"
TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TitleLabel.TextSize = 16

-- Label Sisa MS (Warna Merah Tua)
local SisaMSLabel = Instance.new("TextLabel")
SisaMSLabel.Parent = MainFrame
SisaMSLabel.BackgroundTransparency = 1
SisaMSLabel.Position = UDim2.new(0, 0, 0, 38)
SisaMSLabel.Size = UDim2.new(1, 0, 0, 20)
SisaMSLabel.Font = Enum.Font.SourceSansBold
SisaMSLabel.Text = "Sisa MS: 0"
SisaMSLabel.TextColor3 = Color3.fromRGB(180, 40, 40) -- Merah Tua
SisaMSLabel.TextSize = 15

-- Label MS Sudah Jadi (Warna Hijau Tua)
local MSSectionLabel = Instance.new("TextLabel")
MSSectionLabel.Parent = MainFrame
MSSectionLabel.BackgroundTransparency = 1
MSSectionLabel.Position = UDim2.new(0, 18, 0, 68)
MSSectionLabel.Size = UDim2.new(1, -36, 0, 75)
MSSectionLabel.Font = Enum.Font.SourceSansBold
MSSectionLabel.Text = "MS Sudah Jadi:\nSmall: 0\nMedium: 0\nLarge: 0"
MSSectionLabel.TextColor3 = Color3.fromRGB(40, 160, 70) -- Hijau Tua
MSSectionLabel.TextSize = 14
MSSectionLabel.TextXAlignment = Enum.TextXAlignment.Left
MSSectionLabel.TextYAlignment = Enum.TextYAlignment.Top

-- Label Bahan (Warna Merah Tua)
local BahanLabel = Instance.new("TextLabel")
BahanLabel.Parent = MainFrame
BahanLabel.BackgroundTransparency = 1
BahanLabel.Position = UDim2.new(0, 18, 0, 150)
BahanLabel.Size = UDim2.new(1, -36, 0, 60)
BahanLabel.Font = Enum.Font.SourceSansBold
BahanLabel.Text = "Water: 0\nSugar Block Bag: 0\nGelatin: 0"
BahanLabel.TextColor3 = Color3.fromRGB(180, 40, 40) -- Merah Tua
BahanLabel.TextSize = 14
BahanLabel.TextXAlignment = Enum.TextXAlignment.Left
BahanLabel.TextYAlignment = Enum.TextYAlignment.Top

-- ==================== FITUR CLICK DELETE ====================
-- Container untuk Toggle Click Delete di bawah bahan
local DeleteContainer = Instance.new("TextButton")
DeleteContainer.Parent = MainFrame
DeleteContainer.BackgroundTransparency = 1
DeleteContainer.Position = UDim2.new(0, 18, 0, 215)
DeleteContainer.Size = UDim2.new(1, -36, 0, 24)
DeleteContainer.Text = ""
DeleteContainer.AutoButtonColor = false

-- Kotak Checkbox
local CheckBox = Instance.new("Frame")
CheckBox.Parent = DeleteContainer
CheckBox.BackgroundColor3 = Color3.fromRGB(30, 30, 38)
CheckBox.BorderSizePixel = 0
CheckBox.Position = UDim2.new(0, 0, 0.5, -9)
CheckBox.Size = UDim2.new(0, 18, 0, 18)

local CheckBoxCorner = Instance.new("UICorner")
CheckBoxCorner.CornerRadius = UDim.new(0, 4)
CheckBoxCorner.Parent = CheckBox

-- Tanda Centang (Checkmark)
local Checkmark = Instance.new("TextLabel")
Checkmark.Parent = CheckBox
Checkmark.BackgroundTransparency = 1
Checkmark.Size = UDim2.new(1, 0, 1, 0)
Checkmark.Font = Enum.Font.SourceSansBold
Checkmark.Text = "✓"
Checkmark.TextColor3 = Color3.fromRGB(40, 160, 70)
Checkmark.TextSize = 16
Checkmark.Visible = Hidden -- Status awal Off

-- Label Text "Click Delete"
local DeleteLabel = Instance.new("TextLabel")
DeleteLabel.Parent = DeleteContainer
DeleteLabel.BackgroundTransparency = 1
DeleteLabel.Position = UDim2.new(0, 26, 0, 0)
DeleteLabel.Size = UDim2.new(1, -26, 1, 0)
DeleteLabel.Font = Enum.Font.SourceSansBold
DeleteLabel.Text = "Click Delete"
DeleteLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
DeleteLabel.TextSize = 14
DeleteLabel.TextXAlignment = Enum.TextXAlignment.Left

-- Tombol Start / Stop AutoMS (Posisi disesuaikan ke bawah)
local ToggleButton = Instance.new("TextButton")
ToggleButton.Parent = MainFrame
ToggleButton.BackgroundColor3 = Color3.fromRGB(35, 155, 75) -- Hijau Gelap
ToggleButton.Position = UDim2.new(0, 15, 0, 285)
ToggleButton.Size = UDim2.new(1, -30, 0, 42)
ToggleButton.Font = Enum.Font.SourceSansBold
ToggleButton.Text = "Start AutoMS"
ToggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ToggleButton.TextSize = 16

local ButtonCorner = Instance.new("UICorner")
ButtonCorner.CornerRadius = UDim.new(0, 8)
ButtonCorner.Parent = ToggleButton

-- Fungsi untuk menghitung item di Inventory
local function countItem(keyword)
    local count = 0
    local containers = {LocalPlayer:FindFirstChild("Backpack"), LocalPlayer.Character}
    for _, container in ipairs(containers) do
        if container then
            for _, item in ipairs(container:GetChildren()) do
                if string.find(string.lower(item.Name), string.lower(keyword)) then
                    count = count + 1
                end
            end
        end
    end
    return count
end

-- Update teks GUI real-time
task.spawn(function()
    while true do
        local smallCount = countItem("small")
        local medCount = countItem("medium")
        local largeCount = countItem("large")
        local waterCount = countItem("water")
        local sugarCount = countItem("sugar")
        local gelatinCount = countItem("gelatin")

        SisaMSLabel.Text = "Sisa MS: " .. sugarCount  
        MSSectionLabel.Text = string.format("MS Sudah Jadi:\nSmall: %d\nMedium: %d\nLarge: %d", smallCount, medCount, largeCount)  
        BahanLabel.Text = string.format("Water: %d\nSugar Block Bag: %d\nGelatin: %d", waterCount, sugarCount, gelatinCount)  
          
        task.wait(0.5)  
    end
end)

-- Fungsi memegang item berdasarkan nama
local function equipItem(keyword)
    local backpack = LocalPlayer:FindFirstChild("Backpack")
    local character = LocalPlayer.Character
    if not backpack or not character then return end

    for _, item in ipairs(backpack:GetChildren()) do  
        if string.find(string.lower(item.Name), string.lower(keyword)) then  
            local humanoid = character:FindFirstChildOfClass("Humanoid")  
            if humanoid then  
                humanoid:EquipTool(item)  
                return true  
            end  
        end  
    end  
    return false
end

-- Simulasi tekan tombol E
local function pressE()
    local vim = game:GetService("VirtualInputManager")
    vim:SendKeyEvent(true, Enum.KeyCode.E, false, game)
    task.wait(0.1)
    vim:SendKeyEvent(false, Enum.KeyCode.E, false, game)
end

-- Logika Utama AutoMS
local isRunning = false

ToggleButton.MouseButton1Click:Connect(function()
    isRunning = not isRunning

    if isRunning then  
        ToggleButton.Text = "Stop AutoMS"  
        ToggleButton.BackgroundColor3 = Color3.fromRGB(165, 35, 35) -- Merah Gelap  
          
        task.spawn(function()  
            while isRunning do  
                -- 1. Memegang item "water"  
                equipItem("water")  
                task.wait(1.0)  
                pressE()  
                  
                -- 2. Menunggu 20 detik  
                local timer = 0  
                while timer < 20 and isRunning do  
                    task.wait(1)  
                    timer = timer + 1  
                end  
                if not isRunning then break end  
                  
                task.wait(1.0)  
                if not isRunning then break end  
                  
                -- 3. Memegang item "sugar"  
                equipItem("sugar")  
                task.wait(0.5)  
                pressE()  
                  
                -- 4. Memegang item "gelatin" lalu click E  
                task.wait(0.5)  
                equipItem("gelatin")  
                task.wait(0.5)  
                pressE()  
                  
                -- 5. Menunggu 45 detik  
                timer = 0  
                while timer < 45 and isRunning do  
                    task.wait(1)  
                    timer = timer + 1  
                end  
                if not isRunning then break end  
                  
                task.wait(1.0)  
                if not isRunning then break end  
                  
                -- 6. Memegang item "empty bag" lalu click E  
                equipItem("empty bag")  
                task.wait(0.5)  
                pressE()  
                  
                task.wait(1)  
            end  
        end  )  
    else  
        ToggleButton.Text = "Start AutoMS"  
        ToggleButton.BackgroundColor3 = Color3.fromRGB(35, 155, 75) -- Hijau Gelap  
    end
end)

-- ==================== LOGIKA CLICK DELETE (SUPPORT HP & PC) ====================
local isClickDeleteActive = false
local hoveredPart = nil
local Camera = workspace.CurrentCamera

-- Membuat SelectionBox untuk efek garis pinggiran merah
local selectionBox = Instance.new("SelectionBox")
selectionBox.Name = "ZyuraDeleteHighlight"
selectionBox.Color3 = Color3.fromRGB(255, 50, 50) -- Warna Merah
selectionBox.LineThickness = 0.05
selectionBox.Parent = CoreGui or LocalPlayer:WaitForChild("PlayerGui")

-- Toggle Checkbox Click Delete saat diklik
DeleteContainer.MouseButton1Click:Connect(function()
    isClickDeleteActive = not isClickDeleteActive
    Checkmark.Visible = isClickDeleteActive
    
    if not isClickDeleteActive then
        selectionBox.Adornee = nil
        hoveredPart = nil
    end
end)

-- Deteksi objek menggunakan Raycast (Berfungsi di HP & PC)
RunService.RenderStepped:Connect(function()
    if not isClickDeleteActive then
        selectionBox.Adornee = nil
        return
    end

    -- Mendapatkan posisi kursor (PC) atau posisi jari/tengah layar (HP)
    local mouseLocation = UserInputService:GetMouseLocation()
    local unitRay = Camera:ViewportPointToRay(mouseLocation.X, mouseLocation.Y)
    
    -- Raycast untuk mendeteksi objek di depan kamera
    local raycastParams = RaycastParams.new()
    raycastParams.FilterType = Enum.RaycastFilterType.Exclude
    raycastParams.FilterDescendantsInstances = {LocalPlayer.Character}
    
    local raycastResult = workspace:Raycast(unitRay.Origin, unitRay.Direction * 1000, raycastParams)

    if raycastResult and raycastResult.Instance and raycastResult.Instance:IsA("BasePart") then
        hoveredPart = raycastResult.Instance
        selectionBox.Adornee = hoveredPart
    else
    	hoveredPart = nil
    	selectionBox.Adornee = nil
    end
end)

-- Eksekusi penghapusan lokal saat layar disentuh (HP) atau diklik (PC)
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if not isClickDeleteActive then return end
    
    -- Mendukung klik kiri mouse (PC) maupun sentuhan layar (HP)
    if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) and not gameProcessed then
        if hoveredPart then
            hoveredPart:Destroy() -- Menghapus objek secara lokal (hanya di layar kita)
            selectionBox.Adornee = nil
            hoveredPart = nil
        end
    end
end)
