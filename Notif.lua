local Notifications = Instance.new("ScreenGui")

Notifications.Name = "Notifications"
Notifications.Parent = game:WaitForChild("CoreGui")
Notifications:SetAttribute("Active", false)

-- -- -- --

local notifLibrary = {}

function notifLibrary:SendNotification(title, desc, type)
    if Notifications:GetAttribute("Active") then
        Notifications:FindFirstChild("Notification"):Destroy()
        Notifications:SetAttribute("Active", false)
    end

    Notifications:SetAttribute("Active", true)

    local Notification = Instance.new("Frame")
    local Title = Instance.new("TextLabel")
    local Desc = Instance.new("TextLabel")
    local Yes = Instance.new("TextButton")
    local UICorner = Instance.new("UICorner")
    local No = Instance.new("TextButton")
    local UICorner_2 = Instance.new("UICorner")
    local UICorner_3 = Instance.new("UICorner")
    local UIGradient = Instance.new("UIGradient")

    Notification.Name = "Notification"
    Notification.Parent = Notifications
    Notification.AnchorPoint = Vector2.new(0.5, 0.5)
    Notification.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    Notification.BorderSizePixel = 0
    Notification.Position = UDim2.new(0.913491905, 0, 0.894551933, 0)
    Notification.Size = UDim2.new(0.140144229, 0, 0.144585326, 0)
    --Config
    Notification:SetAttribute("Title", title)
    Notification:SetAttribute("Desc", desc)
    Notification:SetAttribute("Type", type) --timed-normal | confirmation
    --

    Title.Name = "Title"
    Title.Parent = Notification
    Title.AnchorPoint = Vector2.new(0.5, 0.5)
    Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Title.BackgroundTransparency = 1.000
    Title.BorderSizePixel = 0
    Title.Position = UDim2.new(0.509000003, 0, 0.150000006, 0)
    Title.Size = UDim2.new(0.910599887, 0, 0.253909826, 0)
    Title.Font = Enum.Font.TitilliumWeb
    Title.FontFace.Weight = "Bold"
    Title.Text = "Location Change Failed"
    Title.TextColor3 = Color3.fromRGB(240, 240, 240)
    Title.TextScaled = true
    Title.TextSize = 14.000
    Title.TextWrapped = true

    Desc.Name = "Desc"
    Desc.Parent = Title
    Desc.AnchorPoint = Vector2.new(0.5, 0.5)
    Desc.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Desc.BackgroundTransparency = 1.000
    Desc.BorderSizePixel = 0
    Desc.Position = UDim2.new(0.498488188, 0, 1.64703381, 0)
    Desc.Size = UDim2.new(0.997043014, 0, 1.54884577, 0)
    Desc.Font = Enum.Font.TitilliumWeb
    Desc.Text = "Try again?"
    Desc.TextColor3 = Color3.fromRGB(230, 230, 230)
    Desc.TextScaled = true
    Desc.TextSize = 14.000
    Desc.TextWrapped = true

    Yes.Name = "Yes"
    Yes.Parent = Title
    Yes.AnchorPoint = Vector2.new(0.5, 0.5)
    Yes.BackgroundColor3 = Color3.fromRGB(55, 55, 55)
    Yes.BorderSizePixel = 0
    Yes.Position = UDim2.new(0.223410383, 0, 3.04999852, 0)
    Yes.Size = UDim2.new(0.480804026, 0, 1.01066852, 0)
    Yes.AutoButtonColor = false
    Yes.Font = Enum.Font.Unknown
    Yes.Text = "Yes"
    Yes.TextColor3 = Color3.fromRGB(210, 225, 210)
    Yes.TextScaled = true
    Yes.TextSize = 14.000
    Yes.TextWrapped = true

    UICorner.CornerRadius = UDim.new(0.300000012, 0)
    UICorner.Parent = Yes

    No.Name = "No"
    No.Parent = Title
    No.AnchorPoint = Vector2.new(0.5, 0.5)
    No.BackgroundColor3 = Color3.fromRGB(55, 55, 55)
    No.BorderSizePixel = 0
    No.Position = UDim2.new(0.752563059, 0, 3.04999852, 0)
    No.Size = UDim2.new(0.480804026, 0, 1.01066852, 0)
    No.AutoButtonColor = false
    No.Font = Enum.Font.Unknown
    No.Text = "No"
    No.TextColor3 = Color3.fromRGB(225, 210, 210)
    No.TextScaled = true
    No.TextSize = 14.000
    No.TextWrapped = true

    UICorner_2.CornerRadius = UDim.new(0.300000012, 0)
    UICorner_2.Parent = No

    UICorner_3.CornerRadius = UDim.new(0.100000001, 0)
    UICorner_3.Parent = Notification

    UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(211, 211, 211)), ColorSequenceKeypoint.new(0.06, Color3.fromRGB(252, 252, 252)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 255, 255))}
    UIGradient.Offset = Vector2.new(-0.0500000007, 0)
    UIGradient.Parent = Notification

    coroutine.wrap(function()
        local script = Instance.new('LocalScript', Notification)

        local TweenService = game:GetService("TweenService")
        
        for _, v in pairs(script.Parent.Title:GetChildren()) do
            if v:IsA("TextButton") then
                v.MouseButton1Down:Connect(function()
                    local time = 0.2
        
                    local cornerTween = TweenService:Create(v.UICorner, TweenInfo.new(time), {CornerRadius = UDim.new(0.2, 0)})
                    cornerTween:Play()
        
                    local tween = TweenService:Create(v, TweenInfo.new(time), {BackgroundColor3 = Color3.fromRGB(75, 75, 75)})
                    tween:Play()
        
                    tween.Completed:Wait()
        
                    local cornerTween2 = TweenService:Create(v.UICorner, TweenInfo.new(time), {CornerRadius = UDim.new(0.3, 0)})
                    cornerTween2:Play()
        
                    local tween2 = TweenService:Create(v, TweenInfo.new(time), {BackgroundColor3 = Color3.fromRGB(55, 55, 55)})
                    tween2:Play()
                end)
            end
        end
        
        -- -- -- -- --
        
        local types = {"normal", "timed-normal", "confirmation"}
        
        local Notiftype = type

        script.Parent.Title.Text = title
        script.Parent.Title.Desc.Text = desc

        if table.find(types, Notiftype) then
            if Notiftype == types[1] then
                script.Parent.Title.Yes.Size = UDim2.new(1.011, 0, 1.011, 0)
                script.Parent.Title.Yes.Text = "Ok"
                script.Parent.Title.No.Visible = false
            elseif Notiftype == types[2] then
                script.Parent.UIGradient.Enabled = true
                script.Parent.Title.No.Visible = false
                script.Parent.Title.Yes.Visible = false
                script.Parent.Title.Desc.Size = UDim2.new(0.997, 0, 2.637, 0)
                script.Parent.Title.Desc.Position = UDim2.new(0.498, 0, 2.191, 0)
                --
                
                local time = 5
                local TweenService = game:GetService("TweenService")
                
                local Tween = TweenService:Create(script.Parent.UIGradient, TweenInfo.new(time, Enum.EasingStyle.Quad), {Offset = Vector2.new(1, 0)})
                Tween:Play()
                Tween.Completed:Wait()
                
                --
                script.Parent:Destroy()
            else
                --Standart layout, also this is retarted but works
            end
        else
            print("Notification has no type")
        end
    end)()
end
return notifLibrary