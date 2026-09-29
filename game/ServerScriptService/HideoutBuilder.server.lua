-- Light speed Hideout: display capsules + animated suit reveal
local Workspace=game:GetService("Workspace")
local ReplicatedStorage=game:GetService("ReplicatedStorage")
local TweenService=game:GetService("TweenService")
local old=Workspace:FindFirstChild("LightSpeedHideout"); if old then old:Destroy() end
local folder=Instance.new("Folder"); folder.Name="LightSpeedHideout"; folder.Parent=Workspace
local function part(name,size,pos,mat,color,trans,parent)
 local p=Instance.new("Part");p.Name=name;p.Size=size;p.Position=pos;p.Anchored=true;p.Material=mat or Enum.Material.Metal;p.Color=color or Color3.fromRGB(25,30,36);p.Transparency=trans or 0;p.Parent=parent or folder;return p
end
local function neon(name,size,pos,color,parent)
 return part(name,size,pos,Enum.Material.Neon,color,0,parent)
end
part("Floor",Vector3.new(100,1,70),Vector3.new(0,0,0),Enum.Material.Metal,Color3.fromRGB(12,15,20))
part("BackWall",Vector3.new(100,30,1),Vector3.new(0,15,-34),Enum.Material.Metal,Color3.fromRGB(17,20,26))
part("LeftWall",Vector3.new(1,30,70),Vector3.new(-50,15,0),Enum.Material.Metal,Color3.fromRGB(17,20,26))
part("RightWall",Vector3.new(1,30,70),Vector3.new(50,15,0),Enum.Material.Metal,Color3.fromRGB(17,20,26))
neon("CeilingLight",Vector3.new(70,.25,.25),Vector3.new(0,27,-10),Color3.fromRGB(0,170,255))
local function label(parent,text,pos)
 local gui=Instance.new("BillboardGui");gui.Size=UDim2.fromOffset(260,50);gui.StudsOffset=Vector3.new(0,4,0);gui.AlwaysOnTop=true;gui.Parent=parent
 local t=Instance.new("TextLabel");t.Size=UDim2.fromScale(1,1);t.BackgroundTransparency=1;t.Text=text;t.TextColor3=Color3.fromRGB(0,190,255);t.TextStrokeTransparency=.25;t.TextScaled=true;t.Font=Enum.Font.GothamBold;t.Parent=gui
end
local function capsule(index,name,pos)
 local m=Instance.new("Model");m.Name="SuitCapsule_"..index;m.Parent=folder
 part("Base",Vector3.new(9,1,9),pos+Vector3.new(0,.5,0),Enum.Material.Metal,Color3.fromRGB(22,26,32),0,m)
 local glass=part("Glass",Vector3.new(7,15,7),pos+Vector3.new(0,8,0),Enum.Material.Glass,Color3.fromRGB(80,180,255),.78,m)
 local core=neon("ChestCore",Vector3.new(1.4,1.4,.3),pos+Vector3.new(0,7,-3.55),Color3.fromRGB(0,210,255),m)
 local body=part("Armor",Vector3.new(4.2,6,2),pos+Vector3.new(0,6.2,0),Enum.Material.Metal,Color3.fromRGB(30,35,42),0,m)
 local helmet=part("Helmet",Vector3.new(3,3,3),pos+Vector3.new(0,10.8,0),Enum.Material.Metal,Color3.fromRGB(45,52,60),0,m);helmet.Shape=Enum.PartType.Ball
 for _,x in ipairs({-2.7,2.7}) do part("Arm",Vector3.new(1.1,5,1.4),pos+Vector3.new(x,5.1,0),Enum.Material.Metal,Color3.fromRGB(25,30,36),0,m) end
 local prompt=Instance.new("ProximityPrompt");prompt.ActionText="پوشیدن / بازکردن";prompt.ObjectText=name;prompt.HoldDuration=.35;prompt.MaxActivationDistance=12;prompt.Parent=glass
 label(glass,name,pos)
 prompt.Triggered:Connect(function(plr)
  local target=glass
  local open=TweenService:Create(target,TweenInfo.new(.55,Enum.EasingStyle.Quad),{Transparency=.96,Size=Vector3.new(7,.4,7),Position=pos+Vector3.new(0,.2,0)})
  open:Play()
  TweenService:Create(core,TweenInfo.new(.3,Enum.EasingStyle.Quad),{Size=Vector3.new(2.2,2.2,.5)}):Play()
  task.wait(2)
  TweenService:Create(target,TweenInfo.new(.55,Enum.EasingStyle.Quad),{Transparency=.78,Size=Vector3.new(7,15,7),Position=pos+Vector3.new(0,8,0)}):Play()
  TweenService:Create(core,TweenInfo.new(.3),{Size=Vector3.new(1.4,1.4,.3)}):Play()
 end)
end
local suits={{"MARK I",Vector3.new(-32,0,-14)},{"MARK II",Vector3.new(-16,0,-14)},{"MARK III",Vector3.new(0,0,-14)},{"MARK IV",Vector3.new(16,0,-14)},{"SHADOW AGENT",Vector3.new(32,0,-14)}}
for i,s in ipairs(suits) do capsule(i,s[1],s[2]) end
for i=1,8 do local x=-28+(i-1)*8; local p=neon("FloorGuide"..i,Vector3.new(5,.12,.35),Vector3.new(x,.6,14),Color3.fromRGB(0,120,255));end
local sign=part("LightSpeedSign",Vector3.new(30,7,.4),Vector3.new(0,21,-33.4),Enum.Material.Neon,Color3.fromRGB(0,120,255))
local sg=Instance.new("SurfaceGui");sg.Face=Enum.NormalId.Front;sg.Parent=sign
local tx=Instance.new("TextLabel");tx.Size=UDim2.fromScale(1,1);tx.BackgroundTransparency=1;tx.Text="LIGHT SPEED  //  SUIT ARMORY";tx.TextColor3=Color3.new(1,1,1);tx.TextScaled=true;tx.Font=Enum.Font.GothamBlack;tx.Parent=sg
