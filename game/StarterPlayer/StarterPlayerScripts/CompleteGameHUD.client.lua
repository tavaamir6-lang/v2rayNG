local Players=game:GetService("Players")
local ReplicatedStorage=game:GetService("ReplicatedStorage")
local player=Players.LocalPlayer
local rem=ReplicatedStorage:WaitForChild("WardrobeRemotes")
local gui=Instance.new("ScreenGui");gui.Name="LightSpeedCompleteHUD";gui.ResetOnSpawn=false;gui.Parent=player:WaitForChild("PlayerGui")
local panel=Instance.new("Frame");panel.Size=UDim2.fromScale(.34,.16);panel.Position=UDim2.fromScale(.03,.78);panel.BackgroundColor3=Color3.fromRGB(8,12,18);panel.BackgroundTransparency=.08;panel.Parent=gui
local title=Instance.new("TextLabel");title.Size=UDim2.fromScale(1,.32);title.BackgroundTransparency=1;title.Text="LIGHT SPEED  //  ARMORY";title.TextColor3=Color3.fromRGB(0,190,255);title.TextScaled=true;title.Font=Enum.Font.GothamBold;title.Parent=panel
local status=Instance.new("TextLabel");status.Position=UDim2.fromScale(.03,.34);status.Size=UDim2.fromScale(.94,.3);status.BackgroundTransparency=1;status.Text="ماموریت‌ها: 0/5   •   مخفیگاه: سطح 1";status.TextColor3=Color3.new(1,1,1);status.TextScaled=true;status.Font=Enum.Font.Gotham;status.Parent=panel
local mission=Instance.new("TextButton");mission.Position=UDim2.fromScale(.03,.68);mission.Size=UDim2.fromScale(.45,.24);mission.Text="ثبت مأموریت";mission.TextScaled=true;mission.Parent=panel
local upgrade=Instance.new("TextButton");upgrade.Position=UDim2.fromScale(.52,.68);upgrade.Size=UDim2.fromScale(.45,.24);upgrade.Text="ارتقای مخفیگاه";upgrade.TextScaled=true;upgrade.Parent=panel
local get=rem:WaitForChild("GetData")
local function refresh()local d=get:InvokeServer();status.Text="ماموریت‌ها: "..tostring(d.missionsCompleted or 0).."/5   •   مخفیگاه: سطح "..tostring(d.hideoutLevel or 1) end
mission.MouseButton1Click:Connect(function()rem.CompleteMission:FireServer((get:InvokeServer().missionsCompleted or 0)+1)end)
upgrade.MouseButton1Click:Connect(function()rem.UpgradeHideout:FireServer()end)
rem.Notify.OnClientEvent:Connect(function()refresh()end)
task.wait(1);refresh()