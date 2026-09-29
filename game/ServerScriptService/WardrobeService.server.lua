local Players=game:GetService("Players")
local DataStoreService=game:GetService("DataStoreService")
local ReplicatedStorage=game:GetService("ReplicatedStorage")
local Store=DataStoreService:GetDataStore("LightSpeed_Wardrobe_v2")
local remotes=ReplicatedStorage:FindFirstChild("WardrobeRemotes") or Instance.new("Folder",ReplicatedStorage);remotes.Name="WardrobeRemotes"
local function remote(n,c)local r=remotes:FindFirstChild(n) or Instance.new(c,remotes);r.Name=n;return r end
local GetData=remote("GetData","RemoteFunction");local Equip=remote("Equip","RemoteEvent");local CreateOutfit=remote("CreateOutfit","RemoteEvent");local OpenWardrobe=remote("OpenWardrobe","RemoteEvent")
local sessions={}
local DEFAULT={unlocked={"top_001","bottom_001","shoes_001"},equipped={Top="top_001",Bottom="bottom_001",Shoes="shoes_001"},colors={},outfits={},missionsCompleted=0,hideoutLevel=1}
local function clone(t)local n={};for k,v in pairs(t)do n[k]=type(v)=="table" and clone(v) or v end;return n end
local function save(p)local d=sessions[p];if not d then return end;pcall(function()Store:SetAsync("u_"..p.UserId,d)end)end
Players.PlayerAdded:Connect(function(p)local ok,d=pcall(function()return Store:GetAsync("u_"..p.UserId)end);sessions[p]=(ok and type(d)=="table")and d or clone(DEFAULT)end)
Players.PlayerRemoving:Connect(function(p)save(p);sessions[p]=nil end)
GetData.OnServerInvoke=function(p)return sessions[p] or clone(DEFAULT)end
Equip.OnServerEvent:Connect(function(p,category,itemId)local d=sessions[p];if not d then return end;for _,id in ipairs(d.unlocked)do if id==itemId then d.equipped[category]=itemId;save(p);return end end end)
CreateOutfit.OnServerEvent:Connect(function(p,o)local d=sessions[p];if not d or type(o)~="table" or type(o.name)~="string" or #o.name<1 or #o.name>32 then return end;d.outfits[o.name]={pieces=o.pieces or {},colors=o.colors or {}};save(p)end)
