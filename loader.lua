if _G.KeyMenuCleanup then
    pcall(_G.KeyMenuCleanup)
end

local player = game:GetService("Players").LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")

local old = playerGui:FindFirstChild("KeyMenu")
if old then old:Destroy() end

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "KeyMenu"
screenGui.ResetOnSpawn = false
screenGui.IgnoreGuiInset = true
screenGui.Parent = playerGui

local frame = Instance.new("Frame")
frame.Name = "Main"
frame.Size = UDim2.new(0, 275, 0, 180)
frame.Position = UDim2.new(0.5, -137, 0.5, -90)
frame.BackgroundColor3 = Color3.fromRGB(20, 20, 28)
frame.BorderSizePixel = 0
frame.Active = true
frame.BackgroundTransparency = 1
frame.Parent = screenGui

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 12)
corner.Parent = frame

local stroke = Instance.new("UIStroke")
stroke.Color = Color3.fromRGB(60, 60, 80)
stroke.Thickness = 1
stroke.Transparency = 1
stroke.Parent = frame

local bar = Instance.new("Frame")
bar.Name = "Bar"
bar.Size = UDim2.new(1, 0, 0, 36)
bar.BackgroundColor3 = Color3.fromRGB(32, 32, 42)
bar.BackgroundTransparency = 1
bar.BorderSizePixel = 0
bar.Parent = frame

local barCorner = Instance.new("UICorner")
barCorner.CornerRadius = UDim.new(0, 12)
barCorner.Parent = bar

local barFix = Instance.new("Frame")
barFix.Size = UDim2.new(1, 0, 0, 12)
barFix.Position = UDim2.new(0, 0, 1, -12)
barFix.BackgroundColor3 = Color3.fromRGB(32, 32, 42)
barFix.BackgroundTransparency = 1
barFix.BorderSizePixel = 0
barFix.Parent = bar

local title = Instance.new("TextLabel")
title.Name = "Title"
title.Size = UDim2.new(1, -60, 1, 0)
title.Position = UDim2.new(0.03, 0, 0.04, 0)
title.BackgroundTransparency = 1
title.Text = "Verification"
title.TextColor3 = Color3.fromRGB(240, 240, 245)
title.TextTransparency = 1
title.Font = Enum.Font.GothamBold
title.TextSize = 16
title.TextXAlignment = Enum.TextXAlignment.Left
title.Parent = bar

local closeBtn = Instance.new("TextButton")
closeBtn.Name = "Close"
closeBtn.Size = UDim2.fromOffset(24, 24)
closeBtn.Position = UDim2.new(1, -32, 0.5, -12)
closeBtn.BackgroundColor3 = Color3.fromRGB(45, 45, 58)
closeBtn.BackgroundTransparency = 1
closeBtn.BorderSizePixel = 0
closeBtn.AutoButtonColor = false
closeBtn.Text = "X"
closeBtn.TextColor3 = Color3.fromRGB(230, 230, 235)
closeBtn.TextTransparency = 1
closeBtn.Font = Enum.Font.GothamBold
closeBtn.TextSize = 14
closeBtn.Parent = bar

local closeCorner = Instance.new("UICorner")
closeCorner.CornerRadius = UDim.new(0, 6)
closeCorner.Parent = closeBtn

local closeStroke = Instance.new("UIStroke")
closeStroke.Color = Color3.fromRGB(70, 70, 90)
closeStroke.Thickness = 1
closeStroke.Transparency = 1
closeStroke.Parent = closeBtn

local keyBox = Instance.new("TextBox")
keyBox.Name = "KeyBox"
keyBox.Size = UDim2.new(1, -80, 0, 42)
keyBox.Position = UDim2.new(0, 15, 0, 55)
keyBox.BackgroundColor3 = Color3.fromRGB(28, 28, 38)
keyBox.BackgroundTransparency = 1
keyBox.BorderSizePixel = 0
keyBox.Text = ""
keyBox.PlaceholderText = "Enter your key..."
keyBox.PlaceholderColor3 = Color3.fromRGB(100, 100, 115)
keyBox.TextColor3 = Color3.fromRGB(240, 240, 245)
keyBox.TextTransparency = 1
keyBox.Font = Enum.Font.Gotham
keyBox.TextSize = 14
keyBox.ClearTextOnFocus = false
keyBox.TextXAlignment = Enum.TextXAlignment.Left
keyBox.Parent = frame

local keyBoxCorner = Instance.new("UICorner")
keyBoxCorner.CornerRadius = UDim.new(0, 8)
keyBoxCorner.Parent = keyBox

local keyBoxStroke = Instance.new("UIStroke")
keyBoxStroke.Color = Color3.fromRGB(60, 60, 80)
keyBoxStroke.Thickness = 1
keyBoxStroke.Transparency = 1
keyBoxStroke.Parent = keyBox

local keyBoxPadding = Instance.new("UIPadding")
keyBoxPadding.PaddingLeft = UDim.new(0, 12)
keyBoxPadding.Parent = keyBox

local pasteBtn = Instance.new("TextButton")
pasteBtn.Name = "Paste"
pasteBtn.Size = UDim2.fromOffset(42, 42)
pasteBtn.Position = UDim2.new(1, -55, 0, 55)
pasteBtn.BackgroundColor3 = Color3.fromRGB(32, 32, 42)
pasteBtn.BackgroundTransparency = 1
pasteBtn.BorderSizePixel = 0
pasteBtn.AutoButtonColor = false
pasteBtn.Text = ""
pasteBtn.Parent = frame

local pasteCorner = Instance.new("UICorner")
pasteCorner.CornerRadius = UDim.new(0, 8)
pasteCorner.Parent = pasteBtn

local pasteStroke = Instance.new("UIStroke")
pasteStroke.Color = Color3.fromRGB(60, 60, 80)
pasteStroke.Thickness = 1
pasteStroke.Transparency = 1
pasteStroke.Parent = pasteBtn

local pasteIcon = Instance.new("ImageLabel")
pasteIcon.Size = UDim2.fromOffset(28, 28)
pasteIcon.Position = UDim2.new(0.5, -13, 0.5, -14)
pasteIcon.BackgroundTransparency = 1
pasteIcon.Image = "rbxassetid://77429856051268"
pasteIcon.ImageColor3 = Color3.fromRGB(220, 220, 230)
pasteIcon.ImageTransparency = 1
pasteIcon.Parent = pasteBtn

local verifyBtn = Instance.new("TextButton")
verifyBtn.Name = "Verify"
verifyBtn.Size = UDim2.new(1, -30, 0, 38)
verifyBtn.Position = UDim2.new(0, 15, 0, 130)
verifyBtn.BackgroundColor3 = Color3.fromRGB(60, 160, 110)
verifyBtn.BackgroundTransparency = 1
verifyBtn.BorderSizePixel = 0
verifyBtn.AutoButtonColor = false
verifyBtn.Text = "Verify Key"
verifyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
verifyBtn.TextTransparency = 1
verifyBtn.Font = Enum.Font.GothamBold
verifyBtn.TextSize = 14
verifyBtn.Parent = frame

local verifyCorner = Instance.new("UICorner")
verifyCorner.CornerRadius = UDim.new(0, 8)
verifyCorner.Parent = verifyBtn

local verifyStroke = Instance.new("UIStroke")
verifyStroke.Color = Color3.fromRGB(80, 200, 140)
verifyStroke.Thickness = 1
verifyStroke.Transparency = 1
verifyStroke.Parent = verifyBtn

local getKeyBtn = Instance.new("TextButton")
getKeyBtn.Name = "GetKey"
getKeyBtn.Size = UDim2.new(1, -30, 0, 22)
getKeyBtn.Position = UDim2.new(0, -70, 0, 103)
getKeyBtn.BackgroundTransparency = 1
getKeyBtn.BorderSizePixel = 0
getKeyBtn.AutoButtonColor = false
getKeyBtn.Text = "Get Key Link"
getKeyBtn.TextColor3 = Color3.fromRGB(100, 160, 255)
getKeyBtn.TextTransparency = 1
getKeyBtn.Font = Enum.Font.GothamMedium
getKeyBtn.TextSize = 12
getKeyBtn.Parent = frame

local dragging = false
local dragStart
local startPos
local targetX = frame.Position.X.Offset
local targetY = frame.Position.Y.Offset
local canDrag = false

local conns = {}

local c1 = bar.InputBegan:Connect(function(input)
    if not canDrag then return end
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = frame.Position
        targetX = frame.Position.X.Offset
        targetY = frame.Position.Y.Offset
    end
end)

local c2 = UserInputService.InputChanged:Connect(function(input)
    if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
        local delta = input.Position - dragStart
        targetX = startPos.X.Offset + delta.X
        targetY = startPos.Y.Offset + delta.Y
    end
end)

local c3 = UserInputService.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = false
    end
end)

local c4 = RunService.RenderStepped:Connect(function(dt)
    local currentX = frame.Position.X.Offset
    local currentY = frame.Position.Y.Offset
    local speed = 25
    local newX = currentX + (targetX - currentX) * math.min(dt * speed, 1)
    local newY = currentY + (targetY - currentY) * math.min(dt * speed, 1)
    frame.Position = UDim2.new(0.5, newX, 0.5, newY)
end)

table.insert(conns, c1)
table.insert(conns, c2)
table.insert(conns, c3)
table.insert(conns, c4)

local tweenInfo = TweenInfo.new(0.4, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)

TweenService:Create(frame, tweenInfo, { BackgroundTransparency = 0 }):Play()
TweenService:Create(stroke, tweenInfo, { Transparency = 0.4 }):Play()
TweenService:Create(bar, tweenInfo, { BackgroundTransparency = 0 }):Play()
TweenService:Create(barFix, tweenInfo, { BackgroundTransparency = 0 }):Play()
TweenService:Create(title, tweenInfo, { TextTransparency = 0 }):Play()
TweenService:Create(closeBtn, tweenInfo, { BackgroundTransparency = 0, TextTransparency = 0 }):Play()
TweenService:Create(closeStroke, tweenInfo, { Transparency = 0.4 }):Play()
TweenService:Create(keyBox, tweenInfo, { BackgroundTransparency = 0, TextTransparency = 0 }):Play()
TweenService:Create(keyBoxStroke, tweenInfo, { Transparency = 0.4 }):Play()
TweenService:Create(pasteBtn, tweenInfo, { BackgroundTransparency = 0 }):Play()
TweenService:Create(pasteStroke, tweenInfo, { Transparency = 0.4 }):Play()
TweenService:Create(pasteIcon, tweenInfo, { ImageTransparency = 0 }):Play()
TweenService:Create(verifyBtn, tweenInfo, { BackgroundTransparency = 0, TextTransparency = 0 }):Play()
TweenService:Create(verifyStroke, tweenInfo, { Transparency = 0.4 }):Play()
TweenService:Create(getKeyBtn, tweenInfo, { TextTransparency = 0 }):Play()

local scale = Instance.new("UIScale")
scale.Scale = 0.85
scale.Parent = frame

TweenService:Create(scale, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out), { Scale = 1 }):Play()

task.delay(0.5, function()
    canDrag = true
end)

closeBtn.MouseEnter:Connect(function()
    TweenService:Create(closeBtn, TweenInfo.new(0.15), { BackgroundColor3 = Color3.fromRGB(200, 60, 60) }):Play()
end)

closeBtn.MouseLeave:Connect(function()
    TweenService:Create(closeBtn, TweenInfo.new(0.15), { BackgroundColor3 = Color3.fromRGB(45, 45, 58) }):Play()
end)

verifyBtn.MouseEnter:Connect(function()
    TweenService:Create(verifyBtn, TweenInfo.new(0.15), { BackgroundColor3 = Color3.fromRGB(75, 190, 130) }):Play()
end)

verifyBtn.MouseLeave:Connect(function()
    TweenService:Create(verifyBtn, TweenInfo.new(0.15), { BackgroundColor3 = Color3.fromRGB(60, 160, 110) }):Play()
end)

local shakeConn
local function shakeFrame()
    if shakeConn then shakeConn:Disconnect() end
    local startedAt = os.clock()
    local duration = 0.45
    local origin = frame.Position
    shakeConn = RunService.RenderStepped:Connect(function()
        local t = os.clock() - startedAt
        if t >= duration then
            frame.Position = origin
            shakeConn:Disconnect()
            shakeConn = nil
            return
        end
        local decay = (1 - (t / duration)) ^ 2
        local x = math.sin(t * math.pi * 10) * 8 * decay
        frame.Position = origin + UDim2.fromOffset(x, 0)
        targetX = frame.Position.X.Offset
        targetY = frame.Position.Y.Offset
    end)
end

local isVerified = false

verifyBtn.MouseButton1Click:Connect(function()
    if isVerified then return end
    local input = keyBox.Text
    
    verifyBtn.Text = "Checking..."
    verifyBtn.BackgroundColor3 = Color3.fromRGB(180, 160, 60)
    verifyStroke.Color = Color3.fromRGB(220, 200, 80)
    
    task.wait(0.5)
    
    local url = "https://work.ink/_api/v2/token/isValid/" .. input
    local success, response = pcall(function()
        return game:HttpGet(url)
    end)
    
    local found = false
    if success and response then
        local HttpService = game:GetService("HttpService")
        local ok, data = pcall(function() return HttpService:JSONDecode(response) end)
        if ok and data and data.valid == true then
            found = true
        end
    end
    
    if found then
        isVerified = true
        verifyBtn.Text = "Verified!"
        verifyBtn.BackgroundColor3 = Color3.fromRGB(60, 200, 120)
        verifyStroke.Color = Color3.fromRGB(100, 240, 160)
        task.wait(1)
        if _G.KeyMenuCleanup then
            _G.KeyMenuCleanup()
        end
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Axisexe1/SohbetOyunu-Script/refs/heads/main/main.lua"))()
    else
        verifyBtn.Text = "Cannot Verify"
        verifyBtn.BackgroundColor3 = Color3.fromRGB(200, 60, 60)
        verifyStroke.Color = Color3.fromRGB(240, 100, 100)
        shakeFrame()
        task.wait(1.2)
        if verifyBtn and verifyBtn.Parent then
            verifyBtn.Text = "Verify Key"
            verifyBtn.BackgroundColor3 = Color3.fromRGB(60, 160, 110)
            verifyStroke.Color = Color3.fromRGB(80, 200, 140)
        end
    end
end)

getKeyBtn.MouseButton1Click:Connect(function()
    local ok, result = pcall(function()
        if setclipboard then
            setclipboard("https://work.ink/37z8/access")
            return true
        end
        return false
    end)
    getKeyBtn.Text = "Link Copied!"
    getKeyBtn.TextColor3 = Color3.fromRGB(100, 200, 120)
    task.wait(1.5)
    if getKeyBtn and getKeyBtn.Parent then
        getKeyBtn.Text = "Get Key Link"
        getKeyBtn.TextColor3 = Color3.fromRGB(100, 160, 255)
    end
end)

pasteBtn.MouseButton1Click:Connect(function()
    local ok, result = pcall(function()
        if getclipboard then return getclipboard() end
        if toclipboard then return toclipboard() end
        if clipboard and clipboard.get then return clipboard.get() end
        return nil
    end)
    if ok and type(result) == "string" and result ~= "" then
        keyBox.Text = result
    end
end)

closeBtn.MouseButton1Click:Connect(function()
    if not canDrag then return end
    canDrag = false
    
    local closeTween = TweenInfo.new(0.25, Enum.EasingStyle.Quart, Enum.EasingDirection.In)
    
    TweenService:Create(frame, closeTween, { BackgroundTransparency = 1 }):Play()
    TweenService:Create(bar, closeTween, { BackgroundTransparency = 1 }):Play()
    TweenService:Create(barFix, closeTween, { BackgroundTransparency = 1 }):Play()
    TweenService:Create(title, closeTween, { TextTransparency = 1 }):Play()
    TweenService:Create(stroke, closeTween, { Transparency = 1 }):Play()
    TweenService:Create(closeBtn, closeTween, { BackgroundTransparency = 1, TextTransparency = 1 }):Play()
    TweenService:Create(closeStroke, closeTween, { Transparency = 1 }):Play()
    TweenService:Create(keyBox, closeTween, { BackgroundTransparency = 1, TextTransparency = 1 }):Play()
    TweenService:Create(keyBoxStroke, closeTween, { Transparency = 1 }):Play()
    TweenService:Create(pasteBtn, closeTween, { BackgroundTransparency = 1 }):Play()
    TweenService:Create(pasteStroke, closeTween, { Transparency = 1 }):Play()
    TweenService:Create(pasteIcon, closeTween, { ImageTransparency = 1 }):Play()
    TweenService:Create(verifyBtn, closeTween, { BackgroundTransparency = 1, TextTransparency = 1 }):Play()
    TweenService:Create(verifyStroke, closeTween, { Transparency = 1 }):Play()
    TweenService:Create(getKeyBtn, closeTween, { TextTransparency = 1 }):Play()
    
    local closeScale = TweenService:Create(scale, closeTween, { Scale = 0.85 })
    closeScale:Play()
    closeScale.Completed:Connect(function()
        if _G.KeyMenuCleanup then
            _G.KeyMenuCleanup()
        end
    end)
end)

_G.KeyMenuCleanup = function()
    for _, conn in ipairs(conns) do
        pcall(function() conn:Disconnect() end)
    end
    if shakeConn then
        pcall(function() shakeConn:Disconnect() end)
    end
    if screenGui then
        pcall(function() screenGui:Destroy() end)
    end
    _G.KeyMenuCleanup = nil
end
