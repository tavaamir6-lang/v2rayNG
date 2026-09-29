local Workspace=game:GetService("Workspace")
local ReplicatedStorage=game:GetService("ReplicatedStorage")
local old=Workspace:FindFirstChild("LightSpeedHideout"); if old then old:Destroy() end
local folder=Instance.new("Folder"); folder.Name="LightSpeedHideout"; folder.Parent=Workspace
local function part(name,size,pos,mat,trans)
 local p=Instance.new("Part"); p.Name=name;p.Size=size;p.Position=pos;p.Anchored=true;p.Material=mat or Enum.Material.Metal;p.Transparency=trans or 0;p.Parent=folder;return p
end
part("Floor",Vector3.new(90,1,60),Vector3.new(0,0,0),Enum.Material.Metal)
part("BackWall",Vector3.new(90,28,1),Vector3.new(0,14,-30),Enum.Material.Metal)
part("LeftWall",Vector3.new(1,28,60),Vector3.new(-45,14,0),Enum.Material.Metal)
part("RightWall",Vector3.new(1,28,60),Vector3.new(45,14,0),Enum.Material.Metal)
part("Ceiling",Vector3.new(90,1,60),Vector3.new(0,28,0),Enum.Material.Metal)
local sign=part("LightSpeedSign",Vector3.new(24,7,0.5),Vector3.new(0,19,-29.3),Enum.Material.Neon)
sign.Color=Color3.fromRGB(0,170,255)
local function mannequin(name,pos)
 local m=Instance.new("Model");m.Name=name;m.Parent=folder
 local torso=Instance.new("Part");torso.Name="Suit";torso.Size=Vector3.new(4,6,2);torso.Position=pos+Vector3.new(0,6,0);torso.Anchored=true;torso.Material=Enum.Material.Metal;torso.Color=Color3.fromRGB(18,22,28);torso.Parent=m
 local head=Instance.new("Part");head.Name="Helmet";head.Shape=Enum.PartType.Ball;head.Size=Vector3.new(3,3,3);head.Position=pos+Vector3.new(0,10.5,0);head.Anchored=true;head.Material=Enum.Material.Metal;head.Color=Color3.fromRGB(35,42,50);head.Parent=m
 local glow=part("ChestArc",Vector3.new(1.3,1.3,0.3),pos+Vector3.new(0,6, -1.1),Enum.Material.Neon);glow.Color=Color3.fromRGB(0,200,255);glow.Parent=m
 for _,x in ipairs({-2.8,2.8}) do local a=Instance.new("Part");a.Size=Vector3.new(1.2,5,1.4);a.Position=pos+Vector3.new(x,4.8,0);a.Anchored=true;a.Material=Enum.Material.Metal;a.Color=Color3.fromRGB(25,30,36);a.Parent=m end
 local prompt=Instance.new("ProximityPrompt");prompt.ActionText="Open Suit";prompt.ObjectText=name;prompt.HoldDuration=0.2;prompt.MaxActivationDistance=12;prompt.Parent=torso
 prompt.Triggered:Connect(function(plr)
  local rem=ReplicatedStorage:FindFirstChild("WardrobeRemotes"); if rem and rem:FindFirstChild("OpenWardrobe") then rem.OpenWardrobe:FireClient(plr,name) end
 end)
end
local suits={{"MARK I",Vector3.new(-30,0,-15)},{"MARK II",Vector3.new(-15,0,-15)},{"MARK III",Vector3.new(0,0,-15)},{"MARK IV",Vector3.new(15,0,-15)},{"SHADOW AGENT",Vector3.new(30,0,-15)}}
for _,s in ipairs(suits) do mannequin(s[1],s[2]) end
for i=1,8 do local c=part("DisplayPod"..i,Vector3.new(7,1,7),Vector3.new(-28+(i-1)*8,0.7,12),Enum.Material.Glass);c.Transparency=.45 end