local M={}
M.Categories={"Top","Bottom","Shoes","Head","Face","Accessory"}
M.Items={
 {id="top_001",category="Top",name="Black Hoodie",rarity="Common",slot="Upper"},
 {id="top_002",category="Top",name="Tactical Jacket",rarity="Rare",slot="Upper"},
 {id="bottom_001",category="Bottom",name="Cargo Pants",rarity="Common",slot="Lower"},
 {id="bottom_002",category="Bottom",name="Shadow Pants",rarity="Epic",slot="Lower"},
 {id="shoes_001",category="Shoes",name="Street Boots",rarity="Common",slot="Feet"},
 {id="shoes_002",category="Shoes",name="Night Runner",rarity="Rare",slot="Feet"},
 {id="head_001",category="Head",name="Cap",rarity="Common",slot="Head"},
 {id="face_001",category="Face",name="Black Mask",rarity="Rare",slot="Face"},
}
M.Outfits={{id="ShadowAgent",displayName="Shadow Agent",requiredMissions=5,rarity="Legendary"}}
M.HideoutLevels={{level=1,name="Small Wardrobe",capacity=30},{level=2,name="Wardrobe Room",capacity=80},{level=3,name="Premium Wardrobe",capacity=180},{level=4,name="Collection Archive",capacity=400},{level=5,name="Legendary Showroom",capacity=1000}}
return M