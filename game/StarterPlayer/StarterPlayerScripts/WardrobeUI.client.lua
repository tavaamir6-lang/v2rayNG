local Players=game:GetService("Players")
local ReplicatedStorage=game:GetService("ReplicatedStorage")
local p=Players.LocalPlayer
local rem=ReplicatedStorage:WaitForChild("WardrobeRemotes")
local open=rem:FindFirstChild("OpenWardrobe") or Instance.new("RemoteEvent",rem);open.Name="OpenWardrobe"
local get=rem:WaitForChild("GetData")
local gui=Instance.new("ScreenGui");gui.Name="LightSpeedWardrobe";gui.ResetOnSpawn=false;gui.Enabled=false;gui.Parent=p:WaitForChild("PlayerGui")
local panel=Instance.new("Frame");panel.Size=UDim2.fromScale(.72,.72);panel.Position=UDim2.fromScale(.14,.14);panel.BackgroundColor3=Color3.fromRGB(9,12,18);panel.Parent=gui
local title=Instance.new("TextLabel");title.Size=UDim2.fromScale(1,.12);title.BackgroundTransparency=1;title.Text="LIGHT SPEED  •  ARMORY";title.TextColor3=Color3.fromRGB(0,190,255);title.TextScaled=true;title.Font=Enum.Font.GothamBold;title.Parent=panel
local info=Instance.new("TextLabel");info.Position=UDim2.fromScale(.05,.16);info.Size=UDim2.fromScale(.9,.12);info.BackgroundTransparency=1;info.Text="Suit Vault  |  لباس‌ها در مخفیگاه نگهداری می‌شوند";info.TextColor3=Color3.new(1,1,1);info.TextScaled=true;info.Font=Enum.Font.Gotham;info.Parent=panel
local close=Instance.new("TextButton");close.Size=UDim2.fromScale(.1,.09);close.Position=UDim2.fromScale(.87,.02);close.Text="X";close.TextScaled=true;close.Parent=panel
close.MouseButton1Click:Connect(function() gui.Enabled=false end)
open.OnClientEvent:Connect(function(suit)
 gui.Enabled=true
 local d=get:InvokeServer()
 info.Text="Suit Vault  •  "..tostring(suit).."   |   "..#(d.unlocked or {}).." items collected"
end)