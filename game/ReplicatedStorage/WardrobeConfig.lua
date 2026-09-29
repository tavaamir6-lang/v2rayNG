local Config = {}
Config.Categories = {"Top","Bottom","Shoes","Head","Face","Accessory"}
Config.Items = {
 top_001={name="Black Hoodie",category="Top",rarity="Common"},
 top_002={name="Tactical Jacket",category="Top",rarity="Rare"},
 bottom_001={name="Cargo Pants",category="Bottom",rarity="Common"},
 bottom_002={name="Shadow Pants",category="Bottom",rarity="Epic"},
 shoes_001={name="Street Boots",category="Shoes",rarity="Common"},
 shoes_002={name="Night Runner",category="Shoes",rarity="Rare"},
 head_001={name="Cap",category="Head",rarity="Common"},
 face_001={name="Black Mask",category="Face",rarity="Rare"},
}
Config.LockedOutfits={ShadowAgent={displayName="Shadow Agent",requiredMissions=5,rarity="Legendary"}}
Config.HideoutLevels={
 [1]={name="Small Wardrobe",capacity=30}, [2]={name="Wardrobe Room",capacity=80},
 [3]={name="Premium Wardrobe",capacity=180}, [4]={name="Collection Archive",capacity=400},
 [5]={name="Legendary Showroom",capacity=1000},
}
return Config