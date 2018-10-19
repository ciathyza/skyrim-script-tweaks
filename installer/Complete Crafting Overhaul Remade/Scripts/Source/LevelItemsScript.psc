Scriptname LevelItemsScript extends activemagiceffect  

Weapon Property Chillrend001 auto
Weapon Property Chillrend002 auto
Weapon Property Chillrend003 auto
Weapon Property Chillrend004 auto
Weapon Property Chillrend005 auto
LeveledItem Property LItemTG07Chillrend Auto

Weapon Property MQ203AkaviriKatana1 auto
Weapon Property MQ203AkaviriKatana2 auto
Weapon Property MQ203AkaviriKatana3 auto
Weapon Property MQ203AkaviriKatana4 auto
LeveledItem Property LItemMQ203AkaviriKatana Auto

Weapon Property FolgunthurMikrulSword02 auto
Weapon Property FolgunthurMikrulSword03 auto
Weapon Property FolgunthurMikrulSword04 auto
Weapon Property FolgunthurMikrulSword05 auto
LeveledItem Property dunLItemFolgunthurMikrulSword Auto

Weapon Property dunGeirmundSigdisBow02 auto
Weapon Property dunGeirmundSigdisBow03 auto
Weapon Property dunGeirmundSigdisBow04 auto
Weapon Property dunGeirmundSigdisBow05 auto
LeveledItem Property dunLItemGeirmundSigdisBow Auto

Weapon Property SilentMoonsIronMace01 auto
Weapon Property SilentMoonsIronMace02 auto
LeveledItem Property dunSilentMoonsLItemEnchIronMace Auto

Weapon Property SilentMoonsIronSword01 auto
Weapon Property SilentMoonsIronSword02 auto
LeveledItem Property dunSilentMoonsLItemEnchIronSword Auto

Weapon Property SilentMoonsIronWarAxe01 auto
Weapon Property SilentMoonsIronWarAxe02 auto
LeveledItem Property dunSilentMoonsLItemEnchIronWarAxe Auto

Weapon Property SilentMoonsSteelMace01 auto
Weapon Property SilentMoonsSteelMace02 auto
LeveledItem Property dunSilentMoonsLItemEnchSteelMace Auto

Weapon Property SilentMoonsSteelSword01 auto
Weapon Property SilentMoonsSteelSword02 auto
LeveledItem Property dunSilentMoonsLItemEnchSteelSword Auto

Weapon Property SilentMoonsSteelWarAxe01 auto
Weapon Property SilentMoonsSteelWarAxe02 auto
LeveledItem Property dunSilentMoonsLItemEnchSteelWarAxe Auto

Weapon Property PaleBlade01 auto
Weapon Property PaleBlade02 auto
Weapon Property PaleBlade03 auto
Weapon Property PaleBlade04 auto
LeveledItem Property dunLItemFrostmereBlade Auto 

Weapon Property BattleAxeTsun01 auto
Weapon Property BattleAxeTsun02 auto
Weapon Property BattleAxeTsun03 auto
LeveledItem Property MQ304TsunBattleAxe Auto

Armor Property MS06ShieldL12 auto
Armor Property MS06ShieldL18 auto
Armor Property MS06ShieldL25 auto
Armor Property MS06ShieldL32 auto
LeveledItem Property MS06Shield Auto  

Armor Property TGAmuletofArticulation01 auto
Armor Property TGAmuletofArticulation02 auto
Armor Property TGAmuletofArticulation03 auto
Armor Property TGAmuletofArticulation04 auto
Armor Property TGAmuletofArticulation05 auto
Armor Property TGAmuletofArticulation06 auto
LeveledItem Property LItemTGAmuletofArticulation Auto  

Armor Property MG04Reward01 auto
Armor Property MG04Reward02 auto
Armor Property MG04Reward03 auto
Armor Property MG04Reward04 auto
Armor Property MG04Reward05 auto
LeveledItem Property MG04RewardLVL Auto

Weapon Property NightingaleBlade01 auto
Weapon Property NightingaleBlade02 auto
Weapon Property NightingaleBlade03 auto
Weapon Property NightingaleBlade04 auto
LeveledItem Property LItemWeaponNightingaleSword Auto  

Weapon Property NightingaleBow01 auto
Weapon Property NightingaleBow02 auto
Weapon Property NightingaleBow03 auto
Weapon Property NightingaleBow04 auto
LeveledItem Property LItemWeaponNightingaleBow Auto  

Armor Property ArmorNightingaleBootsPlayer01 auto
Armor Property ArmorNightingaleBootsPlayer02 auto
LeveledItem Property TGLvlItemNightingaleBoots Auto

Armor Property ArmorNightingaleCuirassPlayer01 auto
Armor Property ArmorNightingaleCuirassPlayer02 auto
LeveledItem Property TGLvlItemNightingaleChest Auto
  
Armor Property ArmorNightingaleGauntletsPlayer01 auto
Armor Property ArmorNightingaleGauntletsPlayer02 auto
LeveledItem Property TGLvlItemNightingaleGloves Auto  

Armor Property ArmorNightingaleHelmetPlayer01 auto
Armor Property ArmorNightingaleHelmetPlayer02 auto
LeveledItem Property TGLvlItemNightingaleHelmet Auto 

Armor Property DLC2MKMiraakMask1H auto
Armor Property DLC2MKMiraakMask2H auto
Armor Property DLC2MKMiraakMask3H auto
Armor Property DLC2MKMiraakMask1L auto
Armor Property DLC2MKMiraakMask2L auto
Armor Property DLC2MKMiraakMask3L auto
Armor Property DLC2MKMiraakRobes1 auto
Armor Property DLC2MKMiraakRobes2 auto
Armor Property DLC2MKMiraakRobes3 auto
Weapon Property DLC2MKMiraakStaff1 auto
Weapon Property DLC2MKMiraakStaff2 auto
Weapon Property DLC2MKMiraakStaff3 auto
Weapon Property DLC2MKMiraakSword1 auto
Weapon Property DLC2MKMiraakSword2 auto
Weapon Property DLC2MKMiraakSword3 auto
LeveledItem Property DLC2MQ06MiraakRewardMaskH auto
LeveledItem Property DLC2MQ06MiraakRewardMaskL auto
LeveledItem Property DLC2MQ06MiraakRewardRobes auto
LeveledItem Property DLC2MQ06MiraakRewardStaff auto
LeveledItem Property DLC2MQ06MiraakRewardSword auto



int Function GetLevel() native

EVENT OnEffectStart(Actor akTarget, Actor akCaster)

Actor Player = Game.GetPlayer()

;levels up Chillrend

        if ((Player.GetItemCount(Chillrend001) >= 1) && (Player.GetLevel() >= 11))
                Player.addItem(LItemTG07Chillrend, 1)
                Player.removeItem(Chillrend001, 1, true)
        elseif ((Player.GetItemCount(Chillrend002) >= 1) && (Player.GetLevel() >= 19))
                Player.addItem(LItemTG07Chillrend, 1)
                Player.removeItem(Chillrend002, 1, true)
        elseif ((Player.GetItemCount(Chillrend003) >= 1) && (Player.GetLevel() >= 27))
                Player.addItem(LItemTG07Chillrend, 1)
                Player.removeItem(Chillrend003, 1, true)
        elseif ((Player.GetItemCount(Chillrend004) >= 1) && (Player.GetLevel() >= 36))
                Player.addItem(LItemTG07Chillrend, 1)
                Player.removeItem(Chillrend004, 1, true)
        elseif ((Player.GetItemCount(Chillrend005) >= 1) && (Player.GetLevel() >= 46))
                Player.addItem(LItemTG07Chillrend, 1)
                Player.removeItem(Chillrend005, 1, true)
        endif        

;levels up Dragonbane

        if ((Player.GetItemCount(MQ203AkaviriKatana1) >= 1) && (Player.GetLevel() >= 19))
                Player.addItem(LItemMQ203AkaviriKatana, 1)
                Player.removeItem(MQ203AkaviriKatana1, 1, true)
        elseif ((Player.GetItemCount(MQ203AkaviriKatana2) >= 1) && (Player.GetLevel() >= 27))
                Player.addItem(LItemMQ203AkaviriKatana, 1)
                Player.removeItem(MQ203AkaviriKatana2, 1, true)
        elseif ((Player.GetItemCount(MQ203AkaviriKatana3) >= 1) && (Player.GetLevel() >= 36))
                Player.addItem(LItemMQ203AkaviriKatana, 1)
                Player.removeItem(MQ203AkaviriKatana3, 1, true)
        elseif ((Player.GetItemCount(MQ203AkaviriKatana4) >= 1) && (Player.GetLevel() >= 46))
                Player.addItem(LItemMQ203AkaviriKatana, 1)
                Player.removeItem(MQ203AkaviriKatana4, 1, true)
        endif
	
;levels up Gauldur Blackblade

        if ((Player.GetItemCount(FolgunthurMikrulSword02) >= 1) && (Player.GetLevel() >= 12))
                Player.addItem(dunLItemFolgunthurMikrulSword, 1)
                Player.removeItem(FolgunthurMikrulSword02, 1, true)
        elseif ((Player.GetItemCount(FolgunthurMikrulSword03) >= 1) && (Player.GetLevel() >= 19))
                Player.addItem(dunLItemFolgunthurMikrulSword, 1)
                Player.removeItem(FolgunthurMikrulSword03, 1, true)
        elseif ((Player.GetItemCount(FolgunthurMikrulSword04) >= 1) && (Player.GetLevel() >= 27))
                Player.addItem(dunLItemFolgunthurMikrulSword, 1)
                Player.removeItem(FolgunthurMikrulSword04, 1, true)
        elseif ((Player.GetItemCount(FolgunthurMikrulSword05) >= 1) && (Player.GetLevel() >= 36))
                Player.addItem(dunLItemFolgunthurMikrulSword, 1)
                Player.removeItem(FolgunthurMikrulSword05, 1, true)
        endif     

;levels up Gaulder Blackbow

        if ((Player.GetItemCount(dunGeirmundSigdisBow02) >= 1) && (Player.GetLevel() >= 12))
                Player.addItem(dunLItemGeirmundSigdisBow, 1)
                Player.removeItem(dunGeirmundSigdisBow02, 1, true)
        elseif ((Player.GetItemCount(dunGeirmundSigdisBow03) >= 1) && (Player.GetLevel() >= 19))
                Player.addItem(dunLItemGeirmundSigdisBow, 1)
                Player.removeItem(dunGeirmundSigdisBow03, 1, true)
        elseif ((Player.GetItemCount(dunGeirmundSigdisBow04) >= 1) && (Player.GetLevel() >= 27))
                Player.addItem(dunLItemGeirmundSigdisBow, 1)
                Player.removeItem(dunGeirmundSigdisBow04, 1, true)
        elseif ((Player.GetItemCount(dunGeirmundSigdisBow05) >= 1) && (Player.GetLevel() >= 36))
                Player.addItem(dunLItemGeirmundSigdisBow, 1)
                Player.removeItem(dunGeirmundSigdisBow05, 1, true)
        endif   

;levels up Lunar Iron Mace

        if ((Player.GetItemCount(SilentMoonsIronMace01) >= 1) && (Player.GetLevel() >= 4))
                Player.addItem(dunSilentMoonsLItemEnchIronMace, 1)
                Player.removeItem(SilentMoonsIronMace01, 1, true)
        elseif ((Player.GetItemCount(SilentMoonsIronMace02) >= 1) && (Player.GetLevel() >= 6))
                Player.addItem(dunSilentMoonsLItemEnchIronMace, 1)
                Player.removeItem(SilentMoonsIronMace02, 1, true)
        endif          

;levels up Lunar Iron Sword

      	if ((Player.GetItemCount(SilentMoonsIronSword01) >= 1) && (Player.GetLevel() >= 4))
                Player.addItem(dunSilentMoonsLItemEnchIronSword, 1)
                Player.removeItem(SilentMoonsIronSword01, 1, true)
        elseif ((Player.GetItemCount(SilentMoonsIronSword02) >= 1) && (Player.GetLevel() >= 6))
                Player.addItem(dunSilentMoonsLItemEnchIronSword, 1)
                Player.removeItem(SilentMoonsIronSword02, 1, true)
        endif    

;levels up Lunar Iron War Axe

        if ((Player.GetItemCount(SilentMoonsIronWarAxe01) >= 1) && (Player.GetLevel() >= 4))
                Player.addItem(dunSilentMoonsLItemEnchIronWarAxe, 1)
                Player.removeItem(SilentMoonsIronWarAxe01, 1, true)
        elseif ((Player.GetItemCount(SilentMoonsIronWarAxe02) >= 1) && (Player.GetLevel() >= 6))
                Player.addItem(dunSilentMoonsLItemEnchIronWarAxe, 1)
                Player.removeItem(SilentMoonsIronWarAxe02, 1, true)
        endif    

;levels up Lunar Steel Mace

        if ((Player.GetItemCount(SilentMoonsSteelMace01) >= 1) && (Player.GetLevel() >= 6))
                Player.addItem(dunSilentMoonsLItemEnchSteelMace, 1)
                Player.removeItem(SilentMoonsSteelMace01, 1, true)
        elseif ((Player.GetItemCount(SilentMoonsSteelMace02) >= 1) && (Player.GetLevel() >= 8))
                Player.addItem(dunSilentMoonsLItemEnchSteelMace, 1)
                Player.removeItem(SilentMoonsSteelMace02, 1, true)
        endif    

;levels up Lunar Steel Sword

        if ((Player.GetItemCount(SilentMoonsSteelSword01) >= 1) && (Player.GetLevel() >= 6))
                Player.addItem(dunSilentMoonsLItemEnchSteelSword, 1)
                Player.removeItem(SilentMoonsSteelSword01, 1, true)
        elseif ((Player.GetItemCount(SilentMoonsSteelSword02) >= 1) && (Player.GetLevel() >= 8))
                Player.addItem(dunSilentMoonsLItemEnchSteelSword, 1)
                Player.removeItem(SilentMoonsSteelSword02, 1, true)
        endif    

;levels up Lunar Steel War Axe

        if ((Player.GetItemCount(SilentMoonsSteelWarAxe01) >= 1) && (Player.GetLevel() >= 6))
                Player.addItem(dunSilentMoonsLItemEnchSteelWarAxe, 1)
                Player.removeItem(SilentMoonsSteelWarAxe01, 1, true)
        elseif ((Player.GetItemCount(SilentMoonsSteelWarAxe02) >= 1) && (Player.GetLevel() >= 8))
                Player.addItem(dunSilentMoonsLItemEnchSteelWarAxe, 1)
                Player.removeItem(SilentMoonsSteelWarAxe02, 1, true)
        endif    


;levels up The Pale Blade

        if ((Player.GetItemCount(PaleBlade01) >= 1) && (Player.GetLevel() >= 6))
                Player.addItem(dunLItemFrostmereBlade, 1)
                Player.removeItem(PaleBlade01, 1, true)
        elseif ((Player.GetItemCount(PaleBlade02) >= 1) && (Player.GetLevel() >= 12))
                Player.addItem(dunLItemFrostmereBlade, 1)
                Player.removeItem(PaleBlade02, 1, true)
        elseif ((Player.GetItemCount(PaleBlade03) >= 1) && (Player.GetLevel() >= 19))
                Player.addItem(dunLItemFrostmereBlade, 1)
                Player.removeItem(PaleBlade03, 1, true)
        elseif ((Player.GetItemCount(PaleBlade04) >= 1) && (Player.GetLevel() >= 27))
                Player.addItem(dunLItemFrostmereBlade, 1)
                Player.removeItem(PaleBlade04, 1, true)
        endif   

;levels up Tsun's Battle Axe

        if ((Player.GetItemCount(BattleAxeTsun01) >= 1) && (Player.GetLevel() >= 14))
                Player.addItem(MQ304TsunBattleAxe, 1)
                Player.removeItem(BattleAxeTsun01, 1, true)
        elseif ((Player.GetItemCount(BattleAxeTsun02) >= 1) && (Player.GetLevel() >= 18))
                Player.addItem(MQ304TsunBattleAxe, 1)
                Player.removeItem(BattleAxeTsun02, 1, true)
        elseif ((Player.GetItemCount(BattleAxeTsun03) >= 1) && (Player.GetLevel() >= 23))
                Player.addItem(MQ304TsunBattleAxe, 1)
                Player.removeItem(BattleAxeTsun03, 1, true)
        endif   

;levels up Shield of Solitude

        if ((Player.GetItemCount(MS06ShieldL12) >= 1) && (Player.GetLevel() >= 18))
                Player.addItem(MS06Shield, 1)
                Player.removeItem(MS06ShieldL12, 1, true)
        elseif ((Player.GetItemCount(MS06ShieldL18) >= 1) && (Player.GetLevel() >= 25))
                Player.addItem(MS06Shield, 1)
                Player.removeItem(MS06ShieldL18, 1, true)
        elseif ((Player.GetItemCount(MS06ShieldL25) >= 1) && (Player.GetLevel() >= 32))
                Player.addItem(MS06Shield, 1)
                Player.removeItem(MS06ShieldL25, 1, true)
        elseif ((Player.GetItemCount(MS06ShieldL32) >= 1) && (Player.GetLevel() >= 40))
                Player.addItem(MS06Shield, 1)
                Player.removeItem(MS06ShieldL32, 1, true)
        endif   

;levels up Amulet of Articulation

        if ((Player.GetItemCount(TGAmuletofArticulation01) >= 1) && (Player.GetLevel() >= 8))
                Player.addItem(LItemTGAmuletofArticulation, 1)
                Player.removeItem(TGAmuletofArticulation01, 1, true)
        elseif ((Player.GetItemCount(TGAmuletofArticulation02) >= 1) && (Player.GetLevel() >= 15))
                Player.addItem(LItemTGAmuletofArticulation, 1)
                Player.removeItem(TGAmuletofArticulation02, 1, true)
        elseif ((Player.GetItemCount(TGAmuletofArticulation03) >= 1) && (Player.GetLevel() >= 22))
                Player.addItem(LItemTGAmuletofArticulation, 1)
                Player.removeItem(TGAmuletofArticulation03, 1, true)
        elseif ((Player.GetItemCount(TGAmuletofArticulation04) >= 1) && (Player.GetLevel() >= 29))
                Player.addItem(LItemTGAmuletofArticulation, 1)
                Player.removeItem(TGAmuletofArticulation04, 1, true)
        elseif ((Player.GetItemCount(TGAmuletofArticulation05) >= 1) && (Player.GetLevel() >= 36))
                Player.addItem(LItemTGAmuletofArticulation, 1)
                Player.removeItem(TGAmuletofArticulation05, 1, true)
        elseif ((Player.GetItemCount(TGAmuletofArticulation06) >= 1) && (Player.GetLevel() >= 43))
                Player.addItem(LItemTGAmuletofArticulation, 1)
                Player.removeItem(TGAmuletofArticulation06, 1, true)
        endif      

;levels up Mages Circlet

        if ((Player.GetItemCount(MG04Reward01) >= 1) && (Player.GetLevel() >= 5))
                Player.addItem(MG04RewardLVL, 1)
                Player.removeItem(MG04Reward01, 1, true)
        elseif ((Player.GetItemCount(MG04Reward02) >= 1) && (Player.GetLevel() >= 10))
                Player.addItem(MG04RewardLVL, 1)
                Player.removeItem(MG04Reward02, 1, true)
        elseif ((Player.GetItemCount(MG04Reward03) >= 1) && (Player.GetLevel() >= 15))
                Player.addItem(MG04RewardLVL, 1)
                Player.removeItem(MG04Reward03, 1, true)
        elseif ((Player.GetItemCount(MG04Reward04) >= 1) && (Player.GetLevel() >= 20))
                Player.addItem(MG04RewardLVL, 1)
                Player.removeItem(MG04Reward04, 1, true)
        elseif ((Player.GetItemCount(MG04Reward05) >= 1) && (Player.GetLevel() >= 25))
                Player.addItem(MG04RewardLVL, 1)
                Player.removeItem(MG04Reward05, 1, true)
        endif    

;levels up Nightingale Sword

        if ((Player.GetItemCount(NightingaleBlade01) >= 1) && (Player.GetLevel() >= 19))
                Player.addItem(LItemWeaponNightingaleSword, 1)
                Player.removeItem(NightingaleBlade01, 1, true)
        elseif ((Player.GetItemCount(NightingaleBlade02) >= 1) && (Player.GetLevel() >= 27))
                Player.addItem(LItemWeaponNightingaleSword, 1)
                Player.removeItem(NightingaleBlade02, 1, true)
        elseif ((Player.GetItemCount(NightingaleBlade03) >= 1) && (Player.GetLevel() >= 36))
                Player.addItem(LItemWeaponNightingaleSword, 1)
                Player.removeItem(NightingaleBlade03, 1, true)
        elseif ((Player.GetItemCount(NightingaleBlade04) >= 1) && (Player.GetLevel() >= 46))
                Player.addItem(LItemWeaponNightingaleSword, 1)
                Player.removeItem(NightingaleBlade04, 1, true)
        endif                 

;levels up Nightingale Bow

        if ((Player.GetItemCount(NightingaleBow01) >= 1) && (Player.GetLevel() >= 19))
                Player.addItem(LItemWeaponNightingaleBow, 1)
                Player.removeItem(NightingaleBow01, 1, true)
        elseif ((Player.GetItemCount(NightingaleBow02) >= 1) && (Player.GetLevel() >= 27))
                Player.addItem(LItemWeaponNightingaleBow, 1)
                Player.removeItem(NightingaleBow02, 1, true)
        elseif ((Player.GetItemCount(NightingaleBow03) >= 1) && (Player.GetLevel() >= 36))
                Player.addItem(LItemWeaponNightingaleBow, 1)
                Player.removeItem(NightingaleBow03, 1, true)
        elseif ((Player.GetItemCount(NightingaleBow04) >= 1) && (Player.GetLevel() >= 46))
                Player.addItem(LItemWeaponNightingaleBow, 1)
                Player.removeItem(NightingaleBow04, 1, true)
        endif    

;levels up Nightingale Boots

        if ((Player.GetItemCount(ArmorNightingaleBootsPlayer01) >= 1) && (Player.GetLevel() >= 19))
                Player.addItem(TGLvlItemNightingaleBoots, 1)
                Player.removeItem(ArmorNightingaleBootsPlayer01, 1, true)
        elseif ((Player.GetItemCount(ArmorNightingaleBootsPlayer02) >= 1) && (Player.GetLevel() >= 32))
                Player.addItem(TGLvlItemNightingaleBoots, 1)
                Player.removeItem(ArmorNightingaleBootsPlayer02, 1, true)
        endif    

;levels up Nightingale Armor

        if ((Player.GetItemCount(ArmorNightingaleCuirassPlayer01) >= 1) && (Player.GetLevel() >= 19))
                Player.addItem(TGLvlItemNightingaleChest, 1)
                Player.removeItem(ArmorNightingaleCuirassPlayer01, 1, true)
        elseif ((Player.GetItemCount(ArmorNightingaleCuirassPlayer02) >= 1) && (Player.GetLevel() >= 32))
                Player.addItem(TGLvlItemNightingaleChest, 1)
                Player.removeItem(ArmorNightingaleCuirassPlayer02, 1, true)
        endif    

;levels up Nightingale Gloves

        if ((Player.GetItemCount(ArmorNightingaleGauntletsPlayer01) >= 1) && (Player.GetLevel() >= 19))
                Player.addItem(TGLvlItemNightingaleGloves, 1)
                Player.removeItem(ArmorNightingaleGauntletsPlayer01, 1, true)
        elseif ((Player.GetItemCount(ArmorNightingaleGauntletsPlayer02) >= 1) && (Player.GetLevel() >= 32))
                Player.addItem(TGLvlItemNightingaleGloves, 1)
                Player.removeItem(ArmorNightingaleGauntletsPlayer02, 1, true)
        endif    

;levels up Nightingale Hood

        if ((Player.GetItemCount(ArmorNightingaleHelmetPlayer01) >= 1) && (Player.GetLevel() >= 19))
                Player.addItem(TGLvlItemNightingaleHelmet, 1)
                Player.removeItem(ArmorNightingaleHelmetPlayer01, 1, true)
        elseif ((Player.GetItemCount(ArmorNightingaleHelmetPlayer02) >= 1) && (Player.GetLevel() >= 32))
                Player.addItem(TGLvlItemNightingaleHelmet, 1)
                Player.removeItem(ArmorNightingaleHelmetPlayer02, 1, true)
        endif    
		
;levels up Miraak Mask

        if ((Player.GetItemCount(DLC2MKMiraakMask1H) >= 1) && (Player.GetLevel() >= 45))
                Player.addItem(DLC2MQ06MiraakRewardMaskH, 1)
                Player.removeItem(DLC2MKMiraakMask1H, 1, true)
        elseif ((Player.GetItemCount(DLC2MKMiraakMask2H) >= 1) && (Player.GetLevel() >= 60))
                Player.addItem(DLC2MQ06MiraakRewardMaskH, 1)
                Player.removeItem(DLC2MKMiraakMask2H, 1, true)
        endif 
		
		if ((Player.GetItemCount(DLC2MKMiraakMask1L) >= 1) && (Player.GetLevel() >= 45))
                Player.addItem(DLC2MQ06MiraakRewardMaskL, 1)
                Player.removeItem(DLC2MKMiraakMask1L, 1, true)
        elseif ((Player.GetItemCount(DLC2MKMiraakMask2L) >= 1) && (Player.GetLevel() >= 60))
                Player.addItem(DLC2MQ06MiraakRewardMaskL, 1)
                Player.removeItem(DLC2MKMiraakMask2L, 1, true)
        endif  
		
;levels up Miraak Robes

        if ((Player.GetItemCount(DLC2MKMiraakRobes1) >= 1) && (Player.GetLevel() >= 45))
                Player.addItem(DLC2MQ06MiraakRewardRobes, 1)
                Player.removeItem(DLC2MKMiraakRobes1, 1, true)
        elseif ((Player.GetItemCount(DLC2MKMiraakRobes2) >= 1) && (Player.GetLevel() >= 60))
                Player.addItem(DLC2MQ06MiraakRewardRobes, 1)
                Player.removeItem(DLC2MKMiraakRobes2, 1, true)
        endif  
		
;levels up Miraak Staff

        if ((Player.GetItemCount(DLC2MKMiraakStaff1) >= 1) && (Player.GetLevel() >= 45))
                Player.addItem(DLC2MQ06MiraakRewardStaff, 1)
                Player.removeItem(DLC2MKMiraakStaff1, 1, true)
        elseif ((Player.GetItemCount(DLC2MKMiraakStaff2) >= 1) && (Player.GetLevel() >= 60))
                Player.addItem(DLC2MQ06MiraakRewardStaff, 1)
                Player.removeItem(DLC2MKMiraakStaff2, 1, true)
        endif 
		
;levels up Miraak Sword

        if ((Player.GetItemCount(DLC2MKMiraakSword1) >= 1) && (Player.GetLevel() >= 45))
                Player.addItem(DLC2MQ06MiraakRewardSword, 1)
                Player.removeItem(DLC2MKMiraakSword1, 1, true)
        elseif ((Player.GetItemCount(DLC2MKMiraakSword2) >= 1) && (Player.GetLevel() >= 60))
                Player.addItem(DLC2MQ06MiraakRewardSword, 1)
                Player.removeItem(DLC2MKMiraakSword2, 1, true)
        endif 
		
EndEvent
