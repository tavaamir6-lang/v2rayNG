local ReplicatedStorage=game:GetService("ReplicatedStorage")
local Players=game:GetService("Players")
local rem=ReplicatedStorage:FindFirstChild("WardrobeRemotes") or Instance.new("Folder",ReplicatedStorage);rem.Name="WardrobeRemotes"
local function mk(n,c)local x=rem:FindFirstChild(n) or Instance.new(c);x.Name=n;x.Parent=rem;return x end
local Mission=mk("CompleteMission","RemoteEvent")
local Upgrade=mk("UpgradeHideout","RemoteEvent")
local Notify=mk("Notify","RemoteEvent")
local sessions={}
local DEFAULT={unlocked={"top_001","bottom_001","shoes_001"},equipped={Top="top_001",Bottom="bottom_001",Shoes="shoes_001"},colors={},outfits={},missionsCompleted=0,hideoutLevel=1}
local store=game:GetService("DataStoreService"):GetDataStore("LightSpeed_Wardrobe_v3")
local function clone(t)local n={};for k,v in pairs(t)do n[k]=type(v)=="table" and clone(v) or v end;return n end
local function save(p)if not sessions[p]then return end pcall(function()store:SetAsync("u_"..p.UserId,sessions[p])end)end
Players.PlayerAdded:Connect(function(p)local ok,d=pcall(function()return store:GetAsync("u_"..p.UserId)end);sessions[p]=(ok and type(d)=="table")and d or clone(DEFAULT)end)
Players.PlayerRemoving:Connect(function(p)save(p);sessions[p]=nil end)
Mission.OnServerEvent:Connect(function(p,count)local d=sessions[p];count=math.clamp(tonumber(count)or 1,1,100);if not d then return end;d.missionsCompleted=math.max(d.missionsCompleted or 0,count);if d.missionsCompleted>=5 then local found=false;for _,id in ipairs(d.unlocked)do if id=="ShadowAgent"then found=true end end;if not found then table.insert(d.unlocked,"ShadowAgent")end end;save(p);Notify:FireClient(p,"Mission progress: "..d.missionsCompleted.."/5")end)
Upgrade.OnServerEvent:Connect(function(p)local d=sessions[p];if not d then return end;if(d.hideoutLevel or 1)<5 then d.hideoutLevel+=1;save(p);Notify:FireClient(p,"Hideout upgraded to Level "..d.hideoutLevel)end end)