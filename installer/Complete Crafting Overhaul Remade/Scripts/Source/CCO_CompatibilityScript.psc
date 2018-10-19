Scriptname CCO_CompatibilityScript extends Quest  

GlobalVariable property CCO_ArmorLightRecipes auto
GlobalVariable property CCO_ArmorHeavyRecipes auto
GlobalVariable property CCO_ArmorClothingRecipes auto
GlobalVariable property CCO_ArmorBootRecipes auto
GlobalVariable property CCO_ArmorCuirassRecipes auto
GlobalVariable property CCO_ArmorGauntletRecipes auto
GlobalVariable property CCO_ArmorHelmetRecipes auto
GlobalVariable property CCO_ArmorShieldRecipes auto
GlobalVariable property CCO_WeapAmmoRecipes auto
GlobalVariable property CCO_WeapBowRecipes auto
GlobalVariable property CCO_WeapDaggerRecipes auto
GlobalVariable property CCO_WeapSwordRecipes auto
GlobalVariable property CCO_WeapGreatswordRecipes auto
GlobalVariable property CCO_WeapBattleaxeRecipes auto
GlobalVariable property CCO_WeapMaceRecipes auto
GlobalVariable property CCO_WeapWarAxeRecipes auto
GlobalVariable property CCO_WeapWarhammerRecipes auto
GlobalVariable property CCO_MiscCircletRecipes auto
GlobalVariable property CCO_MiscNecklaceRecipes auto
GlobalVariable property CCO_MiscRingRecipes auto
GlobalVariable property CCO_MiscPouchRecipes auto
GlobalVariable property CCO_MiscToolRecipes auto
GlobalVariable property CCO_ClothingRobeRecipes auto
GlobalVariable property CCO_ClothingBootRecipes auto
GlobalVariable property CCO_ClothingHoodRecipes auto
GlobalVariable property CCO_ClothingGlovesRecipes auto
GlobalVariable property CCO_ClothingCloakRecipes auto
GlobalVariable property CCO_MiscAccessories auto
GlobalVariable property CCO_OptionArtifactReplicas auto
GlobalVariable property CCO_OptionArmoredCirclets auto
GlobalVariable property CCO_OptionUnenchantedUniques auto
GlobalVariable property CCO_FantasyNonLoreRecipes auto
GlobalVariable property CCO_OrientalStyleRecipes auto
GlobalVariable property CCO_MODImmersiveArmors auto
GlobalVariable property CCO_LearningEnabled auto
GlobalVariable property CCO_OptionBreakdownEquipmentatSmelter auto
GlobalVariable property CCO_OptionCraftDaedricOnlyAtNight auto
GlobalVariable property CCO_OptionDeclutterCraftingMenu auto
GlobalVariable property CCO_CCOAddedRecipes auto
GlobalVariable property CCO_DLCDawnguard auto
GlobalVariable property CCO_DLCHearthfire auto
GlobalVariable property CCO_DLCDragonborn auto
GlobalVariable property CCO_MODJewelCraft auto
GlobalVariable property CCO_ArmorOnlyMALE auto
GlobalVariable property CCO_ArmorOnlyFEMALE auto
GlobalVariable property CCO_OptionUseGenericFurPlate auto
GlobalVariable property CCO_OptionRacialRestrictions auto
GlobalVariable property CCO_MODBookofSilence auto
GlobalVariable property CCO_MODHeavyArmory auto
GlobalVariable property CCO_MODWinterIsComing auto
GlobalVariable property CCO_MODWICRequireBasket auto
GlobalVariable property CCO_MODCloaks auto
GlobalVariable property CCO_MODCLoaksRequireBook auto
GlobalVariable property CCO_MODCloaksBookDistChance auto
GlobalVariable property CCO_OptionComplexityLevel auto
GlobalVariable property CCO_MODSupported auto
GlobalVariable property CCO_OptionBreakdownEquipmentatTanningRack auto

;GlobalVariable property AttackStrikesBeforeCollectionGV_CCO auto
;GlobalVariable property StrikesBeforeCollectionGV_CCO auto
;GlobalVariable property ResourceCountTotalGV_CCO auto
;GlobalVariable property ResourceCountGV_CCO auto
;GlobalVariable property FirewoodResourceMaxGV_CCO auto
;GlobalVariable property FirewoodResourcePerUseGV_CCO auto
;GlobalVariable property MiningSkillIncreaseGV_CCO auto

GlobalVariable Property CorundumRename_CCO Auto
GlobalVariable Property QuicksilverRename_CCO Auto
GlobalVariable Property MalachiteRenameGlass_CCO Auto
GlobalVariable Property MalachiteRenameMoldavite_CCO Auto
GlobalVariable Property MCM_BandolierWorkbench auto
GlobalVariable property CCO_DisableIfCCOisInstalled auto
GlobalVariable property MCM_DawnguardWorkbench auto
FormList Property CorundumOresFLST Auto 
FormList Property QuicksilverOresFLST Auto
FormList Property MalachiteOresFLST Auto
FormList Property DisabledForgeRecipesFLST Auto
FormList Property DisabledSkyforgeRecipesFLST Auto
FormList Property DisabledArmorTableRecipesFLST Auto
FormList Property DisabledSharpeningWheelRecipesFLST Auto
FormList Property DisabledSmelterRecipesFLST Auto
FormList Property DisabledCookingRecipesFLST Auto
FormList Property BandolierRecipesFLST Auto
FormList Property BandolierEnchantFLST Auto
FormList Property DLC1DawnguardRecipesFLST_CCO Auto
MiscObject Property CorundumOreRef Auto
MiscObject Property CorundumIngotRef Auto
MiscObject Property MalachiteOreRef Auto
MiscObject Property MalachiteIngotRef Auto
MiscObject Property QuicksilverOreRef Auto
MiscObject Property QuicksilverIngotRef Auto
Keyword Property WorkbenchPlaceholder_CCO Auto
Keyword Property CraftingSmithingForge Auto
Keyword Property CraftingSmithingSkyforge Auto
Keyword Property CraftingSmithingArmorTable Auto
Keyword Property CraftingSmithingSharpeningWheel Auto
Keyword Property CraftingSmelter Auto
Keyword Property CraftingCookpot Auto
Keyword Property CraftingTanningRack Auto
Keyword Property DLC1CraftingDawnguard Auto
ObjectReference Property prufeiChest Auto

Function RenameCorundum()
	If CorundumRename_CCO.getValue() == 1
		Int iIndex = CorundumOresFLST.GetSize() 
		While iIndex
			iIndex -= 1
			Activator CurrentReference = CorundumOresFLST.GetAt(iIndex) As Activator 
			CurrentReference.SetName("Copper Ore Vein")
		EndWhile
		CorundumOreRef.SetName("Copper Ore")
		CorundumIngotRef.SetName("Copper Ingot")
	elseif CorundumRename_CCO.getValue() == 0	
		Int iIndex = CorundumOresFLST.GetSize() 
		While iIndex
			iIndex -= 1
			Activator CurrentReference = CorundumOresFLST.GetAt(iIndex) As Activator 
			CurrentReference.SetName("Corundum Ore Vein")
		EndWhile
		CorundumOreRef.SetName("Corundum Ore")
		CorundumIngotRef.SetName("Corundum Ingot")
	EndIf
EndFunction

Function RenameQuicksilver()
	If QuicksilverRename_CCO.getValue() == 1
		Int iIndex = QuicksilverOresFLST.GetSize() 
		While iIndex
			iIndex -= 1
			Activator CurrentReference = QuicksilverOresFLST.GetAt(iIndex) As Activator 
			CurrentReference.SetName("Mithril Ore Vein")
		EndWhile
		QuicksilverOreRef.SetName("Mithril Ore")
		QuicksilverIngotRef.SetName("Mithril Ingot")
	elseif QuicksilverRename_CCO.getValue() == 0	
		Int iIndex = QuicksilverOresFLST.GetSize() 
		While iIndex
			iIndex -= 1
			Activator CurrentReference = QuicksilverOresFLST.GetAt(iIndex) As Activator 
			CurrentReference.SetName("Quicksilver Ore Vein")
		EndWhile
		QuicksilverOreRef.SetName("Quicksilver Ore")
		QuicksilverIngotRef.SetName("Quicksilver Ingot")
	EndIf
EndFunction

Function RenameMalachite()
	If MalachiteRenameGlass_CCO.getValue() == 1
		Int iIndex = MalachiteOresFLST.GetSize() 
		While iIndex
			iIndex -= 1
			Activator CurrentReference = MalachiteOresFLST.GetAt(iIndex) As Activator 
			CurrentReference.SetName("Raw Glass Deposit")
		EndWhile
		MalachiteOreRef.SetName("Raw Glass")
		MalachiteIngotRef.SetName("Refined Glass")
	elseif MalachiteRenameMoldavite_CCO.getValue() == 1	
		Int iIndex = MalachiteOresFLST.GetSize() 
		While iIndex
			iIndex -= 1
			Activator CurrentReference = MalachiteOresFLST.GetAt(iIndex) As Activator 
			CurrentReference.SetName("Moldavite Deposit")
		EndWhile
		MalachiteOreRef.SetName("Raw Moldavite")
		MalachiteIngotRef.SetName("Refined Moldavite")
	else
		Int iIndex = MalachiteOresFLST.GetSize() 
		While iIndex
			iIndex -= 1
			Activator CurrentReference = MalachiteOresFLST.GetAt(iIndex) As Activator 
			CurrentReference.SetName("Malachite Ore Vein")
		EndWhile
		MalachiteOreRef.SetName("Malachite Ore")
		MalachiteIngotRef.SetName("Refined Malachite")
	EndIf
EndFunction

Function BANSwitchWorkbench()
	If MCM_BandolierWorkbench.getValue() == 0
		Int iIndex = BandolierRecipesFLST.GetSize() 
		While iIndex
			iIndex -= 1
			ConstructibleObject CurrentRecipe = BandolierRecipesFLST.GetAt(iIndex) As ConstructibleObject 
			CurrentRecipe.SetWorkbenchKeyword(CraftingTanningRack)
		EndWhile
	elseif MCM_BandolierWorkbench.getValue() == 1	
		Int iIndex = BandolierRecipesFLST.GetSize() 
		While iIndex
			iIndex -= 1
			ConstructibleObject CurrentRecipe = BandolierRecipesFLST.GetAt(iIndex) As ConstructibleObject 
			CurrentRecipe.SetWorkbenchKeyword(CraftingSmithingForge)
		EndWhile
	EndIf
EndFunction

Function DawnguardSwitchWorkbench()
	If MCM_DawnguardWorkbench.getValue() == 0
		Int iIndex = DLC1DawnguardRecipesFLST_CCO.GetSize() 
		While iIndex
			iIndex -= 1
			ConstructibleObject CurrentRecipe = DLC1DawnguardRecipesFLST_CCO.GetAt(iIndex) As ConstructibleObject 
			CurrentRecipe.SetWorkbenchKeyword(CraftingSmithingForge)
		EndWhile
	elseif MCM_BandolierWorkbench.getValue() == 1	
		Int iIndex = DLC1DawnguardRecipesFLST_CCO.GetSize() 
		While iIndex
			iIndex -= 1
			ConstructibleObject CurrentRecipe = DLC1DawnguardRecipesFLST_CCO.GetAt(iIndex) As ConstructibleObject 
			CurrentRecipe.SetWorkbenchKeyword(DLC1CraftingDawnguard)
		EndWhile
	EndIf
EndFunction

Function BANSwitchEnchantment(formlist pBANList, int pSelectedEnchant)
	Int iIndex = pBANList.GetSize() 
	Enchantment iEnchant = BandolierEnchantFLST.GetAt(pSelectedEnchant) as Enchantment
	While iIndex
		iIndex -= 1
		Armor CurrentPouch = pBANList.GetAt(iIndex) As Armor
			CurrentPouch.SetEnchantment(iEnchant)
		EndWhile
EndFunction

Function USLEPCompatibility()
	DisabledForgeRecipesFLST.AddForm(Game.GetFormFromFile(0x0200080B, "Unofficial Skyrim Legendary Edition Patch.esp"))	;ScaledCuirassB
	DisabledForgeRecipesFLST.AddForm(Game.GetFormFromFile(0x02021721, "Unofficial Skyrim Legendary Edition Patch.esp"))	;ImperialBow
	DisabledForgeRecipesFLST.AddForm(Game.GetFormFromFile(0x020272C2, "Unofficial Skyrim Legendary Edition Patch.esp"))	;ImperialSword
	DisabledForgeRecipesFLST.AddForm(Game.GetFormFromFile(0x02053C98, "Unofficial Skyrim Legendary Edition Patch.esp"))		;RecipeBoneHawkRing
	DisabledSkyforgeRecipesFLST.AddForm(Game.GetFormFromFile(0x020273B1, "Unofficial Skyrim Legendary Edition Patch.esp"))		;RecipeNordHeroArrow
	DisabledSmelterRecipesFLST.AddForm(Game.GetFormFromFile(0x02049B66, "Unofficial Skyrim Legendary Edition Patch.esp"))	;DwarvenScrapMetal
	DisabledArmorTableRecipesFLST.AddForm(Game.GetFormFromFile(0x0200FB27, "Unofficial Skyrim Legendary Edition Patch.esp"))	;TemperDBHelmetMaskless
	DisabledArmorTableRecipesFLST.AddForm(Game.GetFormFromFile(0x0201009D, "Unofficial Skyrim Legendary Edition Patch.esp"))	;TemperDBArmorWorn
	DisabledArmorTableRecipesFLST.AddForm(Game.GetFormFromFile(0x0201009E, "Unofficial Skyrim Legendary Edition Patch.esp"))	;TemperDBBootsWorn
	DisabledArmorTableRecipesFLST.AddForm(Game.GetFormFromFile(0x0201009F, "Unofficial Skyrim Legendary Edition Patch.esp"))	;TemperDBHelmetWorn
	DisabledArmorTableRecipesFLST.AddForm(Game.GetFormFromFile(0x020100A0, "Unofficial Skyrim Legendary Edition Patch.esp"))	;TemperDBGlovesWorn
	DisabledArmorTableRecipesFLST.AddForm(Game.GetFormFromFile(0x0201009B, "Unofficial Skyrim Legendary Edition Patch.esp"))	;TemperDBGlovesReward	
	DisabledArmorTableRecipesFLST.AddForm(Game.GetFormFromFile(0x02010097, "Unofficial Skyrim Legendary Edition Patch.esp"))	;TemperLabyrinthianCirclet
	DisabledArmorTableRecipesFLST.AddForm(Game.GetFormFromFile(0x02010090, "Unofficial Skyrim Legendary Edition Patch.esp"))	;TemperTGAmuletofArticulation
	DisabledArmorTableRecipesFLST.AddForm(Game.GetFormFromFile(0x02010091, "Unofficial Skyrim Legendary Edition Patch.esp"))	;TemperTGAmuletofArticulation
	DisabledArmorTableRecipesFLST.AddForm(Game.GetFormFromFile(0x02010092, "Unofficial Skyrim Legendary Edition Patch.esp"))	;TemperTGAmuletofArticulation
	DisabledArmorTableRecipesFLST.AddForm(Game.GetFormFromFile(0x02010093, "Unofficial Skyrim Legendary Edition Patch.esp"))	;TemperTGAmuletofArticulation
	DisabledArmorTableRecipesFLST.AddForm(Game.GetFormFromFile(0x02010094, "Unofficial Skyrim Legendary Edition Patch.esp"))	;TemperTGAmuletofArticulation
	DisabledArmorTableRecipesFLST.AddForm(Game.GetFormFromFile(0x02010095, "Unofficial Skyrim Legendary Edition Patch.esp"))	;TemperTGAmuletofArticulation
	DisabledArmorTableRecipesFLST.AddForm(Game.GetFormFromFile(0x02010096, "Unofficial Skyrim Legendary Edition Patch.esp"))	;TemperTGAmuletofArticulation
	DisabledArmorTableRecipesFLST.AddForm(Game.GetFormFromFile(0x0200A30A, "Unofficial Skyrim Legendary Edition Patch.esp"))	;TemperDentedIronShield
	DisabledArmorTableRecipesFLST.AddForm(Game.GetFormFromFile(0x0200A306, "Unofficial Skyrim Legendary Edition Patch.esp"))	;TemperSkaalCoat
	DisabledArmorTableRecipesFLST.AddForm(Game.GetFormFromFile(0x0200A307, "Unofficial Skyrim Legendary Edition Patch.esp"))	;TemperSkaalHat
	DisabledArmorTableRecipesFLST.AddForm(Game.GetFormFromFile(0x0200A308, "Unofficial Skyrim Legendary Edition Patch.esp"))	;TemperSkaalBoots
	DisabledArmorTableRecipesFLST.AddForm(Game.GetFormFromFile(0x0200A309, "Unofficial Skyrim Legendary Edition Patch.esp"))	;TemperSkaalGloves
	DisabledArmorTableRecipesFLST.AddForm(Game.GetFormFromFile(0x0200A30D, "Unofficial Skyrim Legendary Edition Patch.esp"))	;TemperMiraakMask1L	
	DisabledArmorTableRecipesFLST.AddForm(Game.GetFormFromFile(0x0200A30E, "Unofficial Skyrim Legendary Edition Patch.esp"))	;TemperMiraakMask2L	
	DisabledArmorTableRecipesFLST.AddForm(Game.GetFormFromFile(0x0200A30F, "Unofficial Skyrim Legendary Edition Patch.esp"))	;TemperMiraakMask3L		
	DisabledArmorTableRecipesFLST.AddForm(Game.GetFormFromFile(0x0200A310, "Unofficial Skyrim Legendary Edition Patch.esp"))	;TemperMiraakMask1H	
	DisabledArmorTableRecipesFLST.AddForm(Game.GetFormFromFile(0x0200A311, "Unofficial Skyrim Legendary Edition Patch.esp"))	;TemperMiraakMask2H	
	DisabledArmorTableRecipesFLST.AddForm(Game.GetFormFromFile(0x0200A312, "Unofficial Skyrim Legendary Edition Patch.esp"))	;TemperMiraakMask3H		
	DisabledArmorTableRecipesFLST.AddForm(Game.GetFormFromFile(0x02036159, "Unofficial Skyrim Legendary Edition Patch.esp"))	;TemperSaintJiubNecklace
	DisabledSharpeningWheelRecipesFLST.AddForm(Game.GetFormFromFile(0x0200FB14, "Unofficial Skyrim Legendary Edition Patch.esp"))	;TemperSilverSword
	DisabledSharpeningWheelRecipesFLST.AddForm(Game.GetFormFromFile(0x0200FB15, "Unofficial Skyrim Legendary Edition Patch.esp"))	;TemperSilverGreatsword	
	DisabledSharpeningWheelRecipesFLST.AddForm(Game.GetFormFromFile(0x0200FB21, "Unofficial Skyrim Legendary Edition Patch.esp"))	;TemperAxe01
	DisabledSharpeningWheelRecipesFLST.AddForm(Game.GetFormFromFile(0x0200FB1A, "Unofficial Skyrim Legendary Edition Patch.esp"))	;TemperDragonPriestDagger
	DisabledSharpeningWheelRecipesFLST.AddForm(Game.GetFormFromFile(0x0200FB17, "Unofficial Skyrim Legendary Edition Patch.esp"))	;TemperDraugrBowSupple
	DisabledSharpeningWheelRecipesFLST.AddForm(Game.GetFormFromFile(0x0201519F, "Unofficial Skyrim Legendary Edition Patch.esp"))	;TemperFollowerHuntingBow
	DisabledSharpeningWheelRecipesFLST.AddForm(Game.GetFormFromFile(0x0200FB22, "Unofficial Skyrim Legendary Edition Patch.esp"))	;TemperFalmerSwordHoned
	DisabledSharpeningWheelRecipesFLST.AddForm(Game.GetFormFromFile(0x0200FB23, "Unofficial Skyrim Legendary Edition Patch.esp"))	;TemperFalmerWarAxeHoned
	DisabledCookingRecipesFLST.AddForm(Game.GetFormFromFile(0x0200A30B, "Unofficial Skyrim Legendary Edition Patch.esp"))		;RecipeBoarCooked
	DisableForgeRecipes()
	DisableSkyforgeRecipes()	
	DisableSmelterRecipes()
	DisableArmorTableRecipes()
	DisableSharpeningWheelRecipes()
	DisableCookingRecipes()
EndFunction

Function USKPCompatibility()
	DisabledForgeRecipesFLST.AddForm(Game.GetFormFromFile(0x0200080B, "Unofficial Skyrim Patch.esp"))	;ScaledCuirassB
	DisabledForgeRecipesFLST.AddForm(Game.GetFormFromFile(0x02021721, "Unofficial Skyrim Patch.esp"))	;ImperialBow
	DisabledForgeRecipesFLST.AddForm(Game.GetFormFromFile(0x020272C2, "Unofficial Skyrim Patch.esp"))	;ImperialSword
	DisabledSmelterRecipesFLST.AddForm(Game.GetFormFromFile(0x02049B66, "Unofficial Skyrim Patch.esp"))	;DwarvenScrapMetal
	DisabledArmorTableRecipesFLST.AddForm(Game.GetFormFromFile(0x0200FB27, "Unofficial Skyrim Patch.esp"))	;TemperDBHelmetMaskless
	DisabledArmorTableRecipesFLST.AddForm(Game.GetFormFromFile(0x0201009D, "Unofficial Skyrim Patch.esp"))	;TemperDBArmorWorn
	DisabledArmorTableRecipesFLST.AddForm(Game.GetFormFromFile(0x0201009E, "Unofficial Skyrim Patch.esp"))	;TemperDBBootsWorn
	DisabledArmorTableRecipesFLST.AddForm(Game.GetFormFromFile(0x0201009F, "Unofficial Skyrim Patch.esp"))	;TemperDBHelmetWorn
	DisabledArmorTableRecipesFLST.AddForm(Game.GetFormFromFile(0x020100A0, "Unofficial Skyrim Patch.esp"))	;TemperDBGlovesWorn
	DisabledArmorTableRecipesFLST.AddForm(Game.GetFormFromFile(0x0201009B, "Unofficial Skyrim Patch.esp"))	;TemperDBGlovesReward	
	DisabledArmorTableRecipesFLST.AddForm(Game.GetFormFromFile(0x02010097, "Unofficial Skyrim Patch.esp"))	;TemperLabyrinthianCirclet
	DisabledArmorTableRecipesFLST.AddForm(Game.GetFormFromFile(0x02010090, "Unofficial Skyrim Patch.esp"))	;TemperTGAmuletofArticulation
	DisabledArmorTableRecipesFLST.AddForm(Game.GetFormFromFile(0x02010091, "Unofficial Skyrim Patch.esp"))	;TemperTGAmuletofArticulation
	DisabledArmorTableRecipesFLST.AddForm(Game.GetFormFromFile(0x02010092, "Unofficial Skyrim Patch.esp"))	;TemperTGAmuletofArticulation
	DisabledArmorTableRecipesFLST.AddForm(Game.GetFormFromFile(0x02010093, "Unofficial Skyrim Patch.esp"))	;TemperTGAmuletofArticulation
	DisabledArmorTableRecipesFLST.AddForm(Game.GetFormFromFile(0x02010094, "Unofficial Skyrim Patch.esp"))	;TemperTGAmuletofArticulation
	DisabledArmorTableRecipesFLST.AddForm(Game.GetFormFromFile(0x02010095, "Unofficial Skyrim Patch.esp"))	;TemperTGAmuletofArticulation
	DisabledArmorTableRecipesFLST.AddForm(Game.GetFormFromFile(0x02010096, "Unofficial Skyrim Patch.esp"))	;TemperTGAmuletofArticulation
	DisabledSharpeningWheelRecipesFLST.AddForm(Game.GetFormFromFile(0x0200FB14, "Unofficial Skyrim Patch.esp"))	;TemperSilverSword
	DisabledSharpeningWheelRecipesFLST.AddForm(Game.GetFormFromFile(0x0200FB15, "Unofficial Skyrim Patch.esp"))	;TemperSilverGreatsword	
	DisabledSharpeningWheelRecipesFLST.AddForm(Game.GetFormFromFile(0x0200FB21, "Unofficial Skyrim Patch.esp"))	;TemperAxe01
	DisabledSharpeningWheelRecipesFLST.AddForm(Game.GetFormFromFile(0x0200FB1A, "Unofficial Skyrim Patch.esp"))	;TemperDragonPriestDagger
	DisabledSharpeningWheelRecipesFLST.AddForm(Game.GetFormFromFile(0x0200FB17, "Unofficial Skyrim Patch.esp"))	;TemperDraugrBowSupple
	DisabledSharpeningWheelRecipesFLST.AddForm(Game.GetFormFromFile(0x0201519F, "Unofficial Skyrim Patch.esp"))	;TemperFollowerHuntingBow
	DisabledSharpeningWheelRecipesFLST.AddForm(Game.GetFormFromFile(0x0200FB22, "Unofficial Skyrim Patch.esp"))	;TemperFalmerSwordHoned
	DisabledSharpeningWheelRecipesFLST.AddForm(Game.GetFormFromFile(0x0200FB23, "Unofficial Skyrim Patch.esp"))	;TemperFalmerWarAxeHoned
	DisableForgeRecipes()
	DisableSmelterRecipes()
	DisableArmorTableRecipes()
	DisableSharpeningWheelRecipes()
endFunction

Function UDGPCompatibility()
	DisabledSkyforgeRecipesFLST.AddForm(Game.GetFormFromFile(0x020273B1, "Unofficial Dawnguard Patch.esp"))		;RecipeNordHeroArrow
	DisabledArmorTableRecipesFLST.AddForm(Game.GetFormFromFile(0x02036159, "Unofficial Dawnguard Patch.esp"))	;TemperSaintJiubNecklace
	DisabledForgeRecipesFLST.AddForm(Game.GetFormFromFile(0x02053C98, "Unofficial Dawnguard Patch.esp"))		;RecipeBoneHawkRing
	DisableSkyforgeRecipes()
	DisableArmorTableRecipes()
	DisableForgeRecipes()
endFunction

Function UDBPCompatibility()
	DisabledCookingRecipesFLST.AddForm(Game.GetFormFromFile(0x02070B51, "Unofficial Dragonborn Patch.esp"))		;RecipeBoarCooked
	DisabledArmorTableRecipesFLST.AddForm(Game.GetFormFromFile(0x02070B50, "Unofficial Dragonborn Patch.esp"))	;TemperDentedIronShield
	DisabledArmorTableRecipesFLST.AddForm(Game.GetFormFromFile(0x02070B4C, "Unofficial Dragonborn Patch.esp"))	;TemperSkaalCoat
	DisabledArmorTableRecipesFLST.AddForm(Game.GetFormFromFile(0x02070B4D, "Unofficial Dragonborn Patch.esp"))	;TemperSkaalHat
	DisabledArmorTableRecipesFLST.AddForm(Game.GetFormFromFile(0x02070B4E, "Unofficial Dragonborn Patch.esp"))	;TemperSkaalBoots
	DisabledArmorTableRecipesFLST.AddForm(Game.GetFormFromFile(0x02070B4F, "Unofficial Dragonborn Patch.esp"))	;TemperSkaalGloves
	DisabledArmorTableRecipesFLST.AddForm(Game.GetFormFromFile(0x020B3F73, "Unofficial Dragonborn Patch.esp"))	;TemperMiraakMask1L	
	DisabledArmorTableRecipesFLST.AddForm(Game.GetFormFromFile(0x020B3F74, "Unofficial Dragonborn Patch.esp"))	;TemperMiraakMask2L	
	DisabledArmorTableRecipesFLST.AddForm(Game.GetFormFromFile(0x020B3F75, "Unofficial Dragonborn Patch.esp"))	;TemperMiraakMask3L		
	DisabledArmorTableRecipesFLST.AddForm(Game.GetFormFromFile(0x020B3F76, "Unofficial Dragonborn Patch.esp"))	;TemperMiraakMask1H	
	DisabledArmorTableRecipesFLST.AddForm(Game.GetFormFromFile(0x020B3F77, "Unofficial Dragonborn Patch.esp"))	;TemperMiraakMask2H	
	DisabledArmorTableRecipesFLST.AddForm(Game.GetFormFromFile(0x020B3F78, "Unofficial Dragonborn Patch.esp"))	;TemperMiraakMask3H	
	DisableCookingRecipes()
	DisableArmorTableRecipes()
endFunction

Function DisableForgeRecipes()
	Int iIndex = DisabledForgeRecipesFLST.GetSize() 
	While iIndex
		iIndex -= 1
		ConstructibleObject CurrentRecipe = DisabledForgeRecipesFLST.GetAt(iIndex) As ConstructibleObject 
		CurrentRecipe.SetWorkbenchKeyword(WorkbenchPlaceholder_CCO)
	EndWhile
endFunction

Function DisableSmelterRecipes()
	Int iIndex = DisabledSmelterRecipesFLST.GetSize() 
	While iIndex
		iIndex -= 1
		ConstructibleObject CurrentRecipe = DisabledSmelterRecipesFLST.GetAt(iIndex) As ConstructibleObject 
		CurrentRecipe.SetWorkbenchKeyword(WorkbenchPlaceholder_CCO)
	EndWhile
endFunction

Function DisableArmorTableRecipes()
	Int iIndex = DisabledArmorTableRecipesFLST.GetSize() 
	While iIndex
		iIndex -= 1
		ConstructibleObject CurrentRecipe = DisabledArmorTableRecipesFLST.GetAt(iIndex) As ConstructibleObject 
		CurrentRecipe.SetWorkbenchKeyword(WorkbenchPlaceholder_CCO)
	EndWhile
endFunction

Function DisableSharpeningWheelRecipes()
	Int iIndex = DisabledSharpeningWheelRecipesFLST.GetSize() 
	While iIndex
		iIndex -= 1
		ConstructibleObject CurrentRecipe = DisabledSharpeningWheelRecipesFLST.GetAt(iIndex) As ConstructibleObject 
		CurrentRecipe.SetWorkbenchKeyword(WorkbenchPlaceholder_CCO)
	EndWhile
endFunction

Function DisableSkyforgeRecipes()
	Int iIndex = DisabledSkyforgeRecipesFLST.GetSize() 
	While iIndex
		iIndex -= 1
		ConstructibleObject CurrentRecipe = DisabledSkyforgeRecipesFLST.GetAt(iIndex) As ConstructibleObject 
		CurrentRecipe.SetWorkbenchKeyword(WorkbenchPlaceholder_CCO)
	EndWhile
endFunction

Function DisableCookingRecipes()
	Int iIndex = DisabledCookingRecipesFLST.GetSize() 
	While iIndex
		iIndex -= 1
		ConstructibleObject CurrentRecipe = DisabledCookingRecipesFLST.GetAt(iIndex) As ConstructibleObject 
		CurrentRecipe.SetWorkbenchKeyword(WorkbenchPlaceholder_CCO)
	EndWhile
endFunction
	
Function RestoreForgeRecipes()
	Int iIndex = DisabledForgeRecipesFLST.GetSize() 
	While iIndex
		iIndex -= 1
		ConstructibleObject CurrentRecipe = DisabledForgeRecipesFLST.GetAt(iIndex) As ConstructibleObject 
		CurrentRecipe.SetWorkbenchKeyword(CraftingSmithingForge)
	EndWhile
endFunction

Function RestoreArmorTableRecipes()
	Int iIndex = DisabledArmorTableRecipesFLST.GetSize() 
	While iIndex
		iIndex -= 1
		ConstructibleObject CurrentRecipe = DisabledArmorTableRecipesFLST.GetAt(iIndex) As ConstructibleObject 
		CurrentRecipe.SetWorkbenchKeyword(CraftingSmithingArmorTable)
	EndWhile
endFunction

Function RestoreSharpeningWheelRecipes()
	Int iIndex = DisabledSharpeningWheelRecipesFLST.GetSize() 
	While iIndex
		iIndex -= 1
		ConstructibleObject CurrentRecipe = DisabledSharpeningWheelRecipesFLST.GetAt(iIndex) As ConstructibleObject 
		CurrentRecipe.SetWorkbenchKeyword(CraftingSmithingSharpeningWheel)
	EndWhile
endFunction

Function RestoreSkyforgeRecipes()
	Int iIndex = DisabledSkyforgeRecipesFLST.GetSize() 
	While iIndex
		iIndex -= 1
		ConstructibleObject CurrentRecipe = DisabledSkyforgeRecipesFLST.GetAt(iIndex) As ConstructibleObject 
		CurrentRecipe.SetWorkbenchKeyword(CraftingSmithingSkyforge)
	EndWhile
endFunction

Function RestoreSmelterRecipes()
	Int iIndex = DisabledSmelterRecipesFLST.GetSize() 
	While iIndex
		iIndex -= 1
		ConstructibleObject CurrentRecipe = DisabledSmelterRecipesFLST.GetAt(iIndex) As ConstructibleObject 
		CurrentRecipe.SetWorkbenchKeyword(CraftingSmelter)
	EndWhile
endFunction

Function RestoreCookingRecipes()
	Int iIndex = DisabledCookingRecipesFLST.GetSize() 
	While iIndex
		iIndex -= 1
		ConstructibleObject CurrentRecipe = DisabledCookingRecipesFLST.GetAt(iIndex) As ConstructibleObject 
		CurrentRecipe.SetWorkbenchKeyword(CraftingCookpot)
	EndWhile
endFunction

Function UninstallCCO()
	CorundumRename_CCO.setValue(0)
	MalachiteRenameGlass_CCO.setValue(0)
	MalachiteRenameMoldavite_CCO.setValue(0)
	QuicksilverRename_CCO.setValue(0)
	CCO_ArmorLightRecipes.setValue(1)
	CCO_ArmorHeavyRecipes.setValue(1)
	CCO_ArmorClothingRecipes.setValue(1)
	CCO_ArmorBootRecipes.setValue(1)
	CCO_ArmorCuirassRecipes.setValue(1)
	CCO_ArmorGauntletRecipes.setValue(1)
	CCO_ArmorHelmetRecipes.setValue(1)
	CCO_ArmorShieldRecipes.setValue(1)
	CCO_WeapAmmoRecipes.setValue(1)
	CCO_WeapBowRecipes.setValue(1)
	CCO_WeapDaggerRecipes.setValue(1)
	CCO_WeapSwordRecipes.setValue(1)
	CCO_WeapGreatswordRecipes.setValue(1)
	CCO_WeapBattleaxeRecipes.setValue(1)
	CCO_WeapMaceRecipes.setValue(1)
	CCO_WeapWarAxeRecipes.setValue(1)
	CCO_WeapWarhammerRecipes.setValue(1)
	CCO_MiscCircletRecipes.setValue(1)
	CCO_MiscNecklaceRecipes.setValue(1)
	CCO_MiscRingRecipes.setValue(1)
	CCO_MiscPouchRecipes.setValue(1)
	CCO_MiscToolRecipes.setValue(1)
	CCO_ClothingRobeRecipes.setValue(1)
	CCO_ClothingBootRecipes.setValue(1)
	CCO_ClothingHoodRecipes.setValue(1)
	CCO_ClothingGlovesRecipes.setValue(1)
	CCO_ClothingCloakRecipes.setValue(1)
	CCO_MiscAccessories.setValue(1)
	CCO_OptionUnenchantedUniques.setValue(1)
	CCO_FantasyNonLoreRecipes.setValue(1)
	CCO_OrientalStyleRecipes.setValue(1)
	CCO_OptionBreakdownEquipmentatSmelter.setValue(1)
	CCO_OptionDeclutterCraftingMenu.setValue(1)
	CCO_DLCDawnguard.setValue(1)
	CCO_DLCHearthfire.setValue(1)
	CCO_DLCDragonborn.setValue(1)
	CCO_ArmorOnlyMALE.setValue(1)
	CCO_ArmorOnlyFEMALE.setValue(1)
	CCO_OptionUseGenericFurPlate.setValue(0)
	CCO_OptionRacialRestrictions.setValue(0)
	CCO_MODBookofSilence.setValue(1)
	CCO_MODHeavyArmory.setValue(1)
	CCO_MODWinterIsComing.setValue(1)
	CCO_MODWICRequireBasket.setValue(1) 
	CCO_MODImmersiveArmors.setValue(1)
	CCO_MODCloaks.setValue(1)
	CCO_MODCloaksRequireBook.setValue(1)
	CCO_MODCloaksBookDistChance.setValue(0)
	CCO_OptionComplexityLevel.setValue(1)
	CCO_MODSupported.setValue(1)
	CCO_OptionBreakdownEquipmentatTanningRack.setValue(1)
	RenameMalachite()
	RenameCorundum()
	RenameQuicksilver()
	RestoreForgeRecipes()
	RestoreArmorTableRecipes()
	RestoreSharpeningWheelRecipes()
	RestoreSkyforgeRecipes()
	RestoreSmelterRecipes()
	RestoreCookingRecipes()
	CCO_OptionArtifactReplicas.SetValue(1)
	CCO_OptionArmoredCirclets.SetValue(1)
	CCO_OptionCraftDaedricOnlyAtNight.SetValue(0)
	CCO_DisableIfCCOisInstalled.SetValue(1)
	CCO_LearningEnabled.SetValue(0)
	prufeiChest.RemoveAllItems()
endFunction			

