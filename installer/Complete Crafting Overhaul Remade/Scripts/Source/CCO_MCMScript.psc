Scriptname CCO_MCMScript extends SKI_ConfigBase

; -------------------------------------------------------------------------------------------------
; Properties
; -------------------------------------------------------------------------------------------------

CCO_CompatibilityScript Property CCO_MCMStartupQuest                       auto
FormList                Property BAN_ItemList_Large                        Auto
FormList                Property BAN_ItemList_Med                          Auto
FormList                Property BAN_ItemList_Small                        Auto
FormList                Property BAN_ItemList_XLarge                       Auto
GlobalVariable          property AttackStrikesBeforeCollectionGV_CCO       auto
GlobalVariable          property BANEnchantmentToggleGV_CCO                auto
GlobalVariable          property CCO_AltSmithingXPBonusExpGV               auto
GlobalVariable          property CCO_AltSmithingXPBonusMultGV              auto
GlobalVariable          property CCO_AltSmithingXPEnabledGV                auto
GlobalVariable          property CCO_AltSmithingXPInitialMultGV            auto
GlobalVariable          property CCO_ArmorBootRecipes                      auto
GlobalVariable          property CCO_ArmorClothingRecipes                  auto
GlobalVariable          property CCO_ArmorCuirassRecipes                   auto
GlobalVariable          property CCO_ArmorGauntletRecipes                  auto
GlobalVariable          property CCO_ArmorHeavyRecipes                     auto
GlobalVariable          property CCO_ArmorHelmetRecipes                    auto
GlobalVariable          property CCO_ArmorLightRecipes                     auto
GlobalVariable          property CCO_ArmorOnlyFEMALE                       auto
GlobalVariable          property CCO_ArmorOnlyMALE                         auto
GlobalVariable          property CCO_ArmorShieldRecipes                    auto
GlobalVariable          property CCO_CCOAddedRecipes                       auto
GlobalVariable          property CCO_ClothingBootRecipes                   auto
GlobalVariable          property CCO_ClothingCloakRecipes                  auto
GlobalVariable          property CCO_ClothingGlovesRecipes                 auto
GlobalVariable          property CCO_ClothingHoodRecipes                   auto
GlobalVariable          property CCO_ClothingRobeRecipes                   auto
GlobalVariable          property CCO_DLCDawnguard                          auto
GlobalVariable          property CCO_DLCDragonborn                         auto
GlobalVariable          property CCO_DLCHearthfire                         auto
GlobalVariable          property CCO_FantasyNonLoreRecipes                 auto
GlobalVariable          property CCO_LearningDraugr                        auto
GlobalVariable          property CCO_LearningEnabled                       auto
GlobalVariable          property CCO_LearningFalmer                        auto
GlobalVariable          property CCO_LearningFalmerHeavy                   auto
GlobalVariable          property CCO_LearningForsworn                      auto
GlobalVariable          property CCO_LearningRequiredtoSmith               auto
GlobalVariable          property CCO_MiscAccessories                       auto
GlobalVariable          property CCO_MiscCircletRecipes                    auto
GlobalVariable          property CCO_MiscNecklaceRecipes                   auto
GlobalVariable          property CCO_MiscPouchRecipes                      auto
GlobalVariable          property CCO_MiscRingRecipes                       auto
GlobalVariable          property CCO_MiscToolRecipes                       auto
GlobalVariable          property CCO_MODBandoliers                         auto
GlobalVariable          property CCO_MODBookofSilence                      auto
GlobalVariable          property CCO_MODCloaks                             auto
GlobalVariable          property CCO_MODCloaksBookDistChance               auto
GlobalVariable          property CCO_MODCLoaksRequireBook                  auto
GlobalVariable          property CCO_MODHeavyArmory                        auto
GlobalVariable          property CCO_MODImmersiveArmors                    auto
GlobalVariable          property CCO_MODImmersiveJewelry                   auto
GlobalVariable          property CCO_MODImmersiveWeapons                   auto
GlobalVariable          property CCO_MODJaysusSwords                       auto
GlobalVariable          property CCO_MODJewelCraft                         auto
GlobalVariable          property CCO_MODSupported                          auto
GlobalVariable          property CCO_MODWICRequireBasket                   auto
GlobalVariable          property CCO_MODWinterIsComing                     auto
GlobalVariable          property CCO_OptionArmoredCirclets                 auto
GlobalVariable          property CCO_OptionArtifactReplicas                auto
GlobalVariable          property CCO_OptionBreakdownEquipmentatSmelter     auto
GlobalVariable          property CCO_OptionBreakdownEquipmentatTanningRack auto
GlobalVariable          property CCO_OptionComplexityLevel                 auto
GlobalVariable          property CCO_OptionCraftDaedricOnlyAtNight         auto
GlobalVariable          property CCO_OptionDeclutterCraftingMenu           auto
GlobalVariable          property CCO_OptionRacialRestrictions              auto
GlobalVariable          property CCO_OptionUnenchantedUniques              auto
GlobalVariable          property CCO_OptionUseGenericFurPlate              auto
GlobalVariable          property CCO_OrientalStyleRecipes                  auto
GlobalVariable          property CCO_WeapAmmoRecipes                       auto
GlobalVariable          property CCO_WeapBattleaxeRecipes                  auto
GlobalVariable          property CCO_WeapBowRecipes                        auto
GlobalVariable          property CCO_WeapDaggerRecipes                     auto
GlobalVariable          property CCO_WeapGreatswordRecipes                 auto
GlobalVariable          property CCO_WeapMaceRecipes                       auto
GlobalVariable          property CCO_WeapSwordRecipes                      auto
GlobalVariable          property CCO_WeapWarAxeRecipes                     auto
GlobalVariable          property CCO_WeapWarhammerRecipes                  auto
GlobalVariable          property CorundumRename_CCO                        auto
GlobalVariable          property DIST_CCOBandoliers_OFF                    auto
GlobalVariable          property DIST_CCOBandoliers_ON                     auto
GlobalVariable          property DIST_CCOBandoliersChance                  auto
GlobalVariable          property DIST_CCOBandoliersDG_OFF                  auto
GlobalVariable          property DIST_CCOBandoliersDG_ON                   auto
GlobalVariable          property DIST_CCOCloaks_OFF                        auto
GlobalVariable          property DIST_CCOCloaks_ON                         auto
GlobalVariable          property DIST_CCOCloaksBanditBossChance            auto
GlobalVariable          property DIST_CCOCloaksBanditChance                auto
GlobalVariable          property DIST_CCOCloaksCommonChance                auto
GlobalVariable          property DIST_CCOCloaksForswornChance              auto
GlobalVariable          property DIST_CCOCloaksGuardChance                 auto
GlobalVariable          property DIST_CCOCloaksHunterChance                auto
GlobalVariable          property DIST_CCOCloaksImperialChance              auto
GlobalVariable          property DIST_CCOCloaksNecroChance                 auto
GlobalVariable          property DIST_CCOCloaksThalmorBossChance           auto
GlobalVariable          property DIST_CCOCloaksThalmorChance               auto
GlobalVariable          property DIST_CCOCloaksVampireChance               auto
GlobalVariable          property DIST_CCOCrossbowBolt_Chance               auto
GlobalVariable          property DIST_CCOCrossbows_OFF                     auto
GlobalVariable          property DIST_CCOCrossbows_ON                      auto
GlobalVariable          property DIST_CCOJaysusSwords_OFF                  auto
GlobalVariable          property DIST_CCOJaysusSwords_ON                   auto
GlobalVariable          property DIST_CCOJewelCraft_OFF                    auto
GlobalVariable          property DIST_CCOJewelCraft_ON                     auto
GlobalVariable          property DIST_CCOWinterIsComing_OFF                auto
GlobalVariable          property DIST_CCOWinterIsComing_ON                 auto
GlobalVariable          property EnchantTweakAccessoriesGV_CCO             auto
GlobalVariable          property EnchantTweakArmorMinorPiecesGV_CCO        auto
GlobalVariable          property EnchantTweakBowsGV_CCO                    auto
GlobalVariable          property EnchantTweakClothingGV_CCO                auto
GlobalVariable          property EnchantTweakCuirassGV_CCO                 auto
GlobalVariable          property EnchantTweakDaggersGV_CCO                 auto
GlobalVariable          property EnchantTweakJewelryExpensiveGV_CCO        auto
GlobalVariable          property EnchantTweakJewelryExquisiteGV_CCO        auto
GlobalVariable          property EnchantTweakJewelryGV_CCO                 auto
GlobalVariable          property EnchantTweakOneHandGV_CCO                 auto
GlobalVariable          property EnchantTweakToggleGV_CCO                  auto
GlobalVariable          property EnchantTweakTwoHandGV_CCO                 auto
GlobalVariable          property FirewoodResourceMaxGV_CCO                 auto
GlobalVariable          property FirewoodResourcePerUseGV_CCO              auto
GlobalVariable          property FlawlessGemChance_CCO                     auto
GlobalVariable          property LevelUpSpellAutoRun_CCO                   auto
GlobalVariable          property MalachiteRenameGlass_CCO                  auto
GlobalVariable          property MalachiteRenameMoldavite_CCO              auto
GlobalVariable          property MCM_BandolierModStatus                    auto
GlobalVariable          property MCM_BandolierWorkbench                    auto
GlobalVariable          property MCM_CCOBandoliersDGInst                   auto
GlobalVariable          property MCM_CCOBandoliersDist                     auto
GlobalVariable          property MCM_CCOBandoliersEnchLarge                auto
GlobalVariable          property MCM_CCOBandoliersEnchMed                  auto
GlobalVariable          property MCM_CCOBandoliersEnchSmall                auto
GlobalVariable          property MCM_CCOBandoliersEnchXLarge               auto
GlobalVariable          property MCM_CCOBandoliersInst                     auto
GlobalVariable          property MCM_CCOBookofSilenceInst                  auto
GlobalVariable          property MCM_CCOCharcoalAmt                        auto
GlobalVariable          property MCM_CCOCloaksDist                         auto
GlobalVariable          property MCM_CCOCloaksInst                         auto
GlobalVariable          property MCM_CCOCrossbowsInWorld                   auto
GlobalVariable          property MCM_CCODawnguardInst                      auto
GlobalVariable          property MCM_CCODragonbornInst                     auto
GlobalVariable          property MCM_CCOGoldArmorPerk                      auto
GlobalVariable          property MCM_CCOHearthfireInst                     auto
GlobalVariable          property MCM_CCOHeavyArmoryInst                    auto
GlobalVariable          property MCM_CCOImmersiveArmorsInst                auto
GlobalVariable          property MCM_CCOImmersiveJewelryInst               auto
GlobalVariable          property MCM_CCOImmersiveWeaponsInst               auto
GlobalVariable          property MCM_CCOJaysusDist                         auto
GlobalVariable          property MCM_CCOJaysusInst                         auto
GlobalVariable          property MCM_CCOJewelCraftDist                     auto
GlobalVariable          property MCM_CCOOreSmeltingAmt                     auto
GlobalVariable          property MCM_CCOSilverArmorPerk                    auto
GlobalVariable          property MCM_CCOSilverWeaponPerk                   auto
GlobalVariable          property MCM_CCOStalhrimEnchPerk                   auto
GlobalVariable          property MCM_CCOWinterIsComingDist                 auto
GlobalVariable          property MCM_CCOWinterIsComingInst                 auto
GlobalVariable          property MCM_DawnguardWorkbench                    auto
GlobalVariable          property MiningGemChanceGV_CCO                     auto
GlobalVariable          property MiningGemLeveledGV_CCO                    auto
GlobalVariable          property MiningGemSpecialGV_CCO                    auto
GlobalVariable          property MiningGemUnleveledGV_CCO                  auto
GlobalVariable          property MiningSkillIncreaseGV_CCO                 auto
GlobalVariable          property PlayerHasLevelUpSpell_CCO                 auto
GlobalVariable          property PRUFEI_EquippedProtectedAmt               auto
GlobalVariable          property PRUFEI_FavoriteProtectedAmt               auto
GlobalVariable          property QuicksilverRename_CCO                     auto
GlobalVariable          property ResourceCountGV_CCO                       auto
GlobalVariable          property ResourceCountTotalGV_CCO                  auto
GlobalVariable          property SmithingXPSmelterGV_CCO                   auto
GlobalVariable          property SmithingXPTanningRackGV_CCO               auto
GlobalVariable          property StrikesBeforeCollectionGV_CCO             auto
GlobalVariable          property TemperTweakBaselineGV_CCO                 auto
GlobalVariable          property TemperTweakBowsGV_CCO                     auto
GlobalVariable          property TemperTweakCuirassGV_CCO                  auto
GlobalVariable          property TemperTweakDaggersGV_CCO                  auto
GlobalVariable          property TemperTweakGauntletsGV_CCO                auto
GlobalVariable          property TemperTweakLeatherHideArmorGV_CCO         auto
GlobalVariable          property TemperTweakLightArmorGV_CCO               auto
GlobalVariable          property TemperTweakShieldsGV_CCO                  auto
GlobalVariable          property TemperTweakToggleGV_CCO                   auto
GlobalVariable          property TemperTweakTwoHandGV_CCO                  auto
ObjectReference         property CloaksParentMarker                        auto
ObjectReference         property JaysusSwordsParentMarker                  auto
Perk                    property CCO_AltSmithingXPInitialMultPerk          Auto
Perk                    property CCO_SmithingXPSmelterPerk                 auto
Perk                    property CCO_SmithingXPTanningRackPerk             auto
ReferenceAlias          Property CCO_AltXPPlayerAlias                      Auto
Spell                   Property LevelUpSpell                              Auto


; -------------------------------------------------------------------------------------------------
; Variables
; -------------------------------------------------------------------------------------------------

int OIDAllOff
int OIDAllOn
int OIDAltSmithXPBonusExp
int OIDAltSmithXPBonusMult
int OIDAltSmithXPEnable
int OIDAltSmithXPInitMult
int OIDArmorAll
int OIDArmorBoots
int OIDArmorClothing
int OIDArmorCuirass
int OIDArmorGauntlets
int OIDArmorHeavy
int OIDArmorHelmets
int OIDArmorLight
int OIDArmorShields
int OIDBandoliersCraft
int OIDBandoliersDGInst
int OIDBandoliersDist
int OIDBandoliersDistChance
int OIDBandoliersEnchantLarge
int OIDBandoliersEnchantMed
int OIDBandoliersEnchantSmall
int OIDBandoliersEnchantXLarge
int OIDBandoliersInst
int OIDBandoliersOptions
int OIDBandoliersWorkbench
int OIDBookofSilenceCraft
int OIDBookofSilenceRace
int OIDBreakdownAdv
int OIDBreakdownSmelt
int OIDBreakdownTanRack
int OIDCCORecipes
int OIDCharcoalAmt
int OIDCloakBanditDistChance
int OIDCloakForswornDistChance
int OIDCloakGuardDistChance
int OIDCloakHunterDistChance
int OIDCloakImperialDistChance
int OIDCloakMiscDistChance
int OIDCloakNecroDistChance
int OIDCloaksCraft
int OIDCloaksDist
int OIDCloaksInst
int OIDCloaksRequireBook
int OIDCloakThalmorDistChance
int OIDCloakVampireDistChance
int OIDComplexity
int OIDCorundumRename
int OIDDaedricAtNight
int OIDDawnguard
int OIDDawnguardInst
int OIDDawnguardOnlyCrossbow
int OIDDawnguardWorkbench
int OIDDragonborn
int OIDDragonbornInst
int OIDDraugrLearning
int OIDEnch1Hand
int OIDEnch2Hand
int OIDEnchAccessory
int OIDEnchantTweaks
int OIDEnchBody
int OIDEnchBows
int OIDEnchClothing
int OIDEnchDaggers
int OIDEnchJewelry
int OIDEnchJewelryEq
int OIDEnchJewelryEx
int OIDEnchMinor
int OIDExperienceMining
int OIDFalmerHeavyLearning
int OIDFalmerLearning
int OIDFemaleOnly
int OIDFirewoodMax
int OIDFirewoodPerUse
int OIDFlawlessChance
int OIDForswornLearning
int OIDFurRecipes
int OIDGemChance
int OIDGemListMenu
int OIDGoldArmor
int OIDHearthfire
int OIDHearthfireInst
int OIDHeavyArmoryCraft
int OIDImmersiveArmorsCraft
int OIDImmersiveArmorsInst
int OIDImmersiveJewelryCraft
int OIDImmersiveWeaponsCraft
int OIDInventoryConditions
int OIDJaysusCraft
int OIDJaysusDist
int OIDJaysusInst
int OIDJewelCraft
int OIDJewelCraftDist
int OIDLearning
int OIDLearningReq
int OIDLevelUp
int OIDLevelUpAuto
int OIDLevelUpSpell
int OIDMalachiteRename1
int OIDMalachiteRename2
int OIDMaleOnly
int OIDMiningAttackStrikes
int OIDMiningOresDrop
int OIDMiningOresTotal
int OIDMiningPresetsMenu
int OIDMiningStrikes
int OIDMiscAccessories
int OIDMiscCirclet
int OIDMiscCloaks
int OIDMiscJewelryAll
int OIDMiscNecklace
int OIDMiscPouches
int OIDMiscRing
int OIDMiscTools
int OIDMSCirclets
int OIDNonLore
int OIDOreAmt
int OIDOriental
int OIDPRUFEIProtectEquip
int OIDPRUFEIProtectFavor
int OIDQuicksilverRename
int OIDReplicas
int OIDSilverArmor
int OIDSilverWeap
int OIDSmelterXP
int OIDStalhrimEnch
int OIDSupportedMod
int OIDTanningRackXP
int OIDTemper2Hand
int OIDTemperBase
int OIDTemperBow
int OIDTemperCuirass
int OIDTemperDagger
int OIDTemperGauntlets
int OIDTemperHide
int OIDTemperLArmor
int OIDTemperShields
int OIDTemperTweaks
int OIDUnenchant
int OIDUninstallMod
int OIDWeapAll
int OIDWeapAmmo
int OIDWeapBattleaxe
int OIDWeapBow
int OIDWeapDaggers
int OIDWeapGreatswords
int OIDWeapMace
int OIDWeapOneHand
int OIDWeapSwords
int OIDWeapTwoHand
int OIDWeapWarAxe
int OIDWeapWarhammer
int OIDWinterIsComingCraft
int OIDWinterIsComingDist
int OIDWinterIsComingInst
int OIDWinterIsComingRequireKit

float BandolierChanceVal     = 10.0
float BandolierLargeVal      = 15.0
float BandolierMedVal        = 10.0
float BandolierSmallVal      = 5.0
float BandolierXLargeVal     = 20.0
float BonusExpVal            = 0.5
float BonusMultVal           = 53.0
float CharcoalRatioVal       = 0.0
float CloakBanditChanceVal   = 15.0
float CloakForswornChanceVal = 15.0
float CloakGuardChanceVal    = 65.0
float CloakHunterChanceVal   = 25.0
float CloakImperialChanceVal = 50.0
float CloakMiscChanceVal     = 35.0
float CloakNecroChanceVal    = 35.0
float CloakThalmorChanceVal  = 10.0
float CloakVampireChanceVal  = 35.0
float Ench1HandVal           = 0.0
float Ench2HandVal           = 0.0
float EnchAccessoryVal       = -50.0
float EnchBodyVal            = 25.0
float EnchBowsVal            = 0.0
float EnchClothingVal        = 50.0
float EnchDaggersVal         = 0.0
float EnchJewelryEqVal       = 10.0
float EnchJewelryExVal       = 10.0
float EnchJewelryVal         = 10.0
float EnchMinorVal           = -25.0
float ExpMiningVal           = 0.0
float ExpSmelterVal          = 0.0
float ExpTanningVal          = 0.0
float FirewoodMaxVal         = 6.0
float FirewoodPerUseVal      = 2.0
float FlawlessChanceVal      = 20.0
float GemChanceVal           = 10.0
float GoldArmorVal           = 5.0
float LearningReqVal         = 100.0
float MiningAttackStrikesVal = 3.0
float MiningOresDropVal      = 1.0
float MiningOresTotalVal     = 3.0
float MiningStrikesVal       = 1.0
float PRUFEIEquipVal         = 1.0
float PRUFEIFavorVal         = 1.0
float SilverArmorVal         = 5.0
float SilverWeapVal          = 30.0
float StalhrimEnchVal        = 10.0
float Temp2HandVal           = 15.0
float TempBaseVal            = 0.0
float TempBowVal             = -10.0
float TempCuirassVal         = 20.0
float TempDaggerVal          = -15.0
float TempGauntletVal        = -20.0
float TempHideVal            = -15.0
float TempLArmorVal          = -10.0
float TempShieldVal          = 30.0
float VanillaXPModVal        = 0.5
int AltXPVal                 = 0
int GemListSelection         = 2
int MiningPresetsSelection   = 0
int OreRatioVal              = 0
int UseCustomMiningSettings  = 0
string[] GemListMenu
string[] MiningPresetsMenu
String[] OreRatioList


; -------------------------------------------------------------------------------------------------
; MCM Events
; -------------------------------------------------------------------------------------------------

event OnConfigInit()
	; Execution Delay.
	Utility.Wait(20.0)

	Pages = new string[8]
	Pages[0] = "Crafting Menu"
	Pages[1] = "Crafting Options"
	Pages[2] = "Learning & XP"
	Pages[3] = "Mining & Materials"
	Pages[4] = "Misc Balance"
	Pages[5] = "Enable Mods"
	Pages[6] = "Mod Options"
	Pages[7] = "Uninstall"
	; = "Extras"
	; = "Distribution"
	; = "Items"

	GemListMenu = new string[3]
	GemListMenu[0] = "Vanilla - Leveled"
	GemListMenu[1] = "All Gems - Unleveled"
	GemListMenu[2] = "Specific Gems - Unleveled"

	MiningPresetsMenu = new string[8]
	MiningPresetsMenu[0] = "Vanilla"
	MiningPresetsMenu[1] = "More Ore"
	MiningPresetsMenu[2] = "Much More Ore"
	MiningPresetsMenu[3] = "Faster Mining"
	MiningPresetsMenu[4] = "Faster Mining and More Ore"
	MiningPresetsMenu[5] = "Slower Mining"
	MiningPresetsMenu[6] = "Slower Mining and Much More Ore"
	MiningPresetsMenu[7] = "Use Custom Settings"

	OreRatioList = New String[3]
	OreRatioList[0] = "5:1"
	OreRatioList[1] = "Per Perk"
	OreRatioList[2] = "3:1"
endEvent


event OnVersionUpdate(int a_version)
	if (a_version > 1)
		OnConfigInit()
	endIf
endEvent


event OnPageReset(string page)
	If (page == "")
		LoadCustomContent("CompleteCraftingOverhaul/CCOTitle.dds", 52, 115)
		Return
	Else
		UnloadCustomContent()
	EndIf
	If (page == "Crafting Menu")
		SetCursorFillMode(TOP_TO_BOTTOM)
		OIDAllOn = AddTextOption("Select All", "")
		OIDAllOff = AddTextOption("Clear All", "")
		OIDArmorAll = AddTextOption("Select all Armor & Clothing", "")
		AddHeaderOption("Armor")
		OIDArmorLight = AddToggleOption("Light Armor", CCO_ArmorLightRecipes.getValueInt())
		OIDArmorHeavy = AddToggleOption("Heavy Armor", CCO_ArmorHeavyRecipes.getValueInt())
		OIDArmorClothing = AddToggleOption("Clothing", CCO_ArmorClothingRecipes.getValueInt())
		AddEmptyOption()
		OIDArmorCuirass = AddToggleOption("Body ", CCO_ArmorCuirassRecipes.getValueInt())
		OIDArmorHelmets = AddToggleOption("Head ", CCO_ArmorHelmetRecipes.getValueInt())
		OIDArmorGauntlets = AddToggleOption("Hands", CCO_ArmorGauntletRecipes.getValueInt())
		OIDArmorBoots = AddToggleOption("Feet", CCO_ArmorBootRecipes.getValueInt())
		OIDArmorShields = AddToggleOption("Shields", CCO_ArmorShieldRecipes.getValueInt())
		AddHeaderOption("Jewelry ")
		OIDMiscJewelryAll = AddTextOption("All Jewelry", "")
		OIDMiscCirclet = AddToggleOption("Circlets", CCO_MiscCircletRecipes.getValueInt())
		OIDMiscNecklace = AddToggleOption("Necklaces", CCO_MiscNecklaceRecipes.getValueInt())
		OIDMiscRing = AddToggleOption("Rings", CCO_MiscRingRecipes.getValueInt())
;		AddEmptyOption()
		AddHeaderOption("Misc Options")
		OIDMaleOnly = AddToggleOption("Male Only Clothing & Armor", CCO_ArmorOnlyMALE.getValueInt())
		OIDFemaleOnly = AddToggleOption("Female Only Clothing & Armor", CCO_ArmorOnlyFEMALE.getValueInt())
		SetCursorPosition(1)		;start right-hand column
		OIDWeapAll = AddTextOption("Select all Weapons", "")
		OIDWeapOneHand = AddTextOption("Select all One-handed Weapons", "")
		OIDWeapTwoHand = AddTextOption("Select all Two-handed Weapons", "")
		AddHeaderOption("Weapons")
		OIDWeapDaggers = AddToggleOption("Daggers", CCO_WeapDaggerRecipes.getValueInt())
		OIDWeapSwords = AddToggleOption("Swords", CCO_WeapSwordRecipes.getValueInt())
		OIDWeapGreatswords = AddToggleOption("Greatswords", CCO_WeapGreatswordRecipes.getValueInt())
		OIDWeapWarAxe = AddToggleOption("War Axes", CCO_WeapWarAxeRecipes.getValueInt())
		OIDWeapBattleaxe = AddToggleOption("Battleaxes", CCO_WeapBattleaxeRecipes.getValueInt())
		OIDWeapMace = AddToggleOption("Maces", CCO_WeapMaceRecipes.getValueInt())
		OIDWeapWarhammer = AddToggleOption("Warhammers", CCO_WeapWarhammerRecipes.getValueInt())
		OIDWeapBow = AddToggleOption("Ranged", CCO_WeapBowRecipes.getValueInt())
		OIDWeapAmmo = AddToggleOption("Ammo", CCO_WeapAmmoRecipes.getValueInt())
		AddHeaderOption("Accessories")
		OIDMiscCloaks = AddToggleOption("Cloaks", CCO_ClothingCloakRecipes.getValueInt())
		OIDMiscPouches = AddToggleOption("Bags & Pouches", CCO_MiscPouchRecipes.getValueInt())
		OIDMiscAccessories = AddToggleOption("Misc Accessories", CCO_MiscAccessories.getValueInt())
		OIDMiscTools = AddToggleOption("Tools & Utility", CCO_MiscToolRecipes.getValueInt())
;		AddEmptyOption()
		AddHeaderOption("")
		OIDOriental = AddToggleOption("Eastern Style Items", CCO_OrientalStyleRecipes.getValueInt())
		OIDNonLore = AddToggleOption("Non-Lore Fantasy Items", CCO_FantasyNonLoreRecipes.getValueInt())
	elseif (page == "Crafting Options")
		SetCursorFillMode(TOP_TO_BOTTOM)
		AddHeaderOption("Crafting Options")
		OIDInventoryConditions = AddToggleOption("Inventory Conditions on Crafting Recipes", CCO_OptionDeclutterCraftingMenu.getValueInt())
		if CCO_OptionComplexityLevel.getValue() == 1
			OIDComplexity = AddTextOption("Recipe Complexity", "Immersive")
		else
			OIDComplexity = AddTextOption("Recipe Complexity", "Simplified")
		endif
		if CCO_OptionUseGenericFurPlate.getValue() == 1
			OIDFurRecipes = AddTextOption("Fur and Hide Recipes", "Generic")
		else
			OIDFurRecipes = AddTextOption("Fur and Hide Recipes", "Specific")
		endif
		OIDDaedricAtNight = AddToggleOption("Craft Daedric Items Only at Night", CCO_OptionCraftDaedricOnlyAtNight.getValueInt())
		AddEmptyOption()
		AddHeaderOption("Breakdown Equipment")
		OIDBreakdownSmelt = AddToggleOption("At Smelter", CCO_OptionBreakdownEquipmentatSmelter.getValueInt())
		OIDBreakdownTanRack = AddToggleOption("At Tanning Rack", CCO_OptionBreakdownEquipmentatTanningRack.getValueInt())
		OIDPRUFEIProtectFavor = AddSliderOption("Protect Favorited Items", PRUFEIFavorVal as int, "{0}")
		OIDPRUFEIProtectEquip = AddSliderOption("Protect Equipped Items", PRUFEIEquipVal as int, "{0}")
		SetCursorPosition(1)		;start right-hand column
		AddHeaderOption("Additional Items")
		OIDUnenchant = AddToggleOption("Unenchanted Variations", CCO_OptionUnenchantedUniques.getValueInt())
		OIDReplicas = AddToggleOption("Artifact Replicas", CCO_OptionArtifactReplicas.getValueInt())
		OIDMSCirclets = AddToggleOption("Matching Set Circlets", CCO_OptionArmoredCirclets.getValueInt())
		AddEmptyOption()
		AddEmptyOption()
		AddHeaderOption("Leveled Items")
		OIDLevelUp = AddTextOption("Upgrade Leveled Items", "")
		OIDLevelUpSpell = AddToggleOption("Level Up Spell", PlayerHasLevelUpSpell_CCO.getValueInt())
		OIDLevelUpAuto = AddToggleOption("Auto Upgrade", LevelUpSpellAutoRun_CCO.getValueInt())
	elseif (page == "Learning & XP")
		SetCursorFillMode(TOP_TO_BOTTOM)
		AddHeaderOption("Alternate Experience Formula")
		OIDAltSmithXPEnable = AddToggleOption("Use Alternate XP Formula", AltXPVal)
		if AltXPVal == 0
			OIDAltSmithXPInitMult = AddSliderOption("Vanilla XP Modifier", VanillaXPModVal, "{1}", OPTION_FLAG_DISABLED)
			OIDAltSmithXPBonusMult = AddSliderOption("Bonus Multiplier", BonusMultVal as int, "{0}", OPTION_FLAG_DISABLED)
			OIDAltSmithXPBonusExp = AddSliderOption("Bonus Exponent", BonusExpVal, "{1}", OPTION_FLAG_DISABLED)
		else
			OIDAltSmithXPInitMult = AddSliderOption("Vanilla XP Modifier", VanillaXPModVal, "{1}", OPTION_FLAG_NONE)
			OIDAltSmithXPBonusMult = AddSliderOption("Bonus Multiplier", BonusMultVal as int, "{0}", OPTION_FLAG_NONE)
			OIDAltSmithXPBonusExp = AddSliderOption("Bonus Exponent", BonusExpVal, "{1}", OPTION_FLAG_NONE)
		endif
		AddEmptyOption()
		AddHeaderOption("Learn to Craft")
		OIDLearning = AddToggleOption("Enable Learning Recipes", CCO_LearningEnabled.getValueInt())
		OIDLearningReq = AddSliderOption("Learning Points required to Craft", LearningReqVal as int, "{0}")
		SetCursorPosition(1)		;start right-hand column
		AddHeaderOption("Smithing Experience")
		OIDTanningRackXP = AddSliderOption("Tanning Rack", SmithingXPTanningRackGV_CCO.getValue(), "{1}")
		OIDSmelterXP = AddSliderOption("Smelter", SmithingXPSmelterGV_CCO.getValue(), "{1}")
		OIDExperienceMining = AddSliderOption("Mining", MiningSkillIncreaseGV_CCO.getValueInt(), "{0}")
		AddEmptyOption()
		AddEmptyOption()
		if CCO_LearningEnabled.getValueInt() == 1
			AddHeaderOption("Accumulated Learning Points")
			OIDDraugrLearning = AddTextOption("Ancient Nord Learning", CCO_LearningDraugr.getValueInt())
			OIDFalmerLearning = AddTextOption("Falmer Learning", CCO_LearningFalmer.getValueInt())
			if MCM_CCODawnguardInst.GetValue() == 1
				OIDFalmerHeavyLearning = AddTextOption("Falmer Heavy Learning", CCO_LearningFalmerHeavy.getValueInt())
			endif
			OIDForswornLearning = AddTextOption("Forsworn Learning", CCO_LearningForsworn.getValueInt())
	;learn to craft guard armor
	;Bonemold?, chitin?, cultist armor, skaal clothing, thalmor armor(cabals), thalmor glass (cabals),
		endif
	elseif (page == "Mining & Materials")
		SetCursorFillMode(TOP_TO_BOTTOM)
		AddHeaderOption("Firewood")
		OIDFirewoodPerUse = AddSliderOption("Firewood per chop", FirewoodPerUseVal as int, "{0}")
		OIDFirewoodMax = AddSliderOption("Max per activation", FirewoodMaxVal as int, "{0}")
		;AddEmptyOption()
		AddHeaderOption("Mining")
		OIDMiningPresetsMenu = AddMenuOption("Mining Presets", MiningPresetsMenu[MiningPresetsSelection])
		if UseCustomMiningSettings == 0
			OIDMiningStrikes = AddSliderOption("Animations cycles per drop", MiningStrikesVal as int, "{0}", OPTION_FLAG_DISABLED)				;mining script still needs to be applied to unused ore activators
			OIDMiningAttackStrikes = AddSliderOption("Attack Strikes per drop", MiningAttackStrikesVal as int, "{0}", OPTION_FLAG_DISABLED)
			OIDMiningOresDrop = AddSliderOption("Ores per drop", MiningOresDropVal as int, "{0}", OPTION_FLAG_DISABLED)
			OIDMiningOresTotal = AddSliderOption("Drops per vein", MiningOresTotalVal as int, "{0}", OPTION_FLAG_DISABLED)
		else
			OIDMiningStrikes = AddSliderOption("Animations cycles per drop", MiningStrikesVal as int, "{0}", OPTION_FLAG_NONE)
			OIDMiningAttackStrikes = AddSliderOption("Attack Strikes per drop", MiningAttackStrikesVal as int, "{0}", OPTION_FLAG_NONE)
			OIDMiningOresDrop = AddSliderOption("Ores per drop", MiningOresDropVal as int, "{0}", OPTION_FLAG_NONE)
			OIDMiningOresTotal = AddSliderOption("Drops per vein", MiningOresTotalVal as int, "{0}", OPTION_FLAG_NONE)
		endif
		OIDGemListMenu = AddMenuOption("Gem List", GemListMenu[GemListSelection])
		OIDGemChance = AddSliderOption("Gem Chance", GemChanceVal as int, "{0}%")
		if GemListSelection > 0
			OIDFlawlessChance = AddSliderOption("Flawless Gem Chance", FlawlessChanceVal as int, "{0}%")
		endif
		SetCursorPosition(1)		;start right-hand column
		AddHeaderOption("Rename Materials")
		OIDCorundumRename = AddToggleOption("Corundum to Copper", CorundumRename_CCO.getValueInt())
		OIDMalachiteRename1 = AddToggleOption("Malachite to Glass", MalachiteRenameGlass_CCO.getValueInt())
		OIDMalachiteRename2 = AddToggleOption("Malachite to Moldavite", MalachiteRenameMoldavite_CCO.getValueInt())
		OIDQuicksilverRename = AddToggleOption("Quicksilver to Mithril", QuicksilverRename_CCO.getValueInt())
		AddEmptyOption()
		AddHeaderOption("Smelting")
		OIDOreAmt = AddTextOption("Ingot Production", OreRatioList[OreRatioVal])
		if CharcoalRatioVal == 0
			OIDCharcoalAmt = AddTextOption("Charcoal Production", "1:3")
		else
			OIDCharcoalAmt = AddTextOption("Charcoal Production", "1:1")
		endif
	;allow chopping with any axe yes/no
	;require proper tools to use other workstations...tongs and hammer for forge, shovel for smelter, hammer for armor bench
	elseif (page == "Misc Balance")
		SetCursorFillMode(TOP_TO_BOTTOM)
		OIDSilverWeap = AddSliderOption("Silver Weapon Bonus", SilverWeapVal as int, "{0}%")
		AddEmptyOption()
		AddHeaderOption("Tempering Tweaks")
		OIDTemperTweaks = AddToggleOption("Variable Tempering Strength", TemperTweakToggleGV_CCO.getValueInt())
		if TemperTweakToggleGV_CCO.getValueInt() == 1
			OIDTemperBase = AddSliderOption("Baseline Adjustment", TempBaseVal as int, "{0}%")
			OIDTemperDagger = AddSliderOption("Daggers", TempDaggerVal as int, "{0}%")
			OIDTemperBow = AddSliderOption("Bows", TempBowVal as int, "{0}%")
			OIDTemper2Hand = AddSliderOption("Two-Hand Weapons", Temp2HandVal as int, "{0}%")
			OIDTemperLArmor = AddSliderOption("Light Armor", TempLArmorVal as int, "{0}%")
			OIDTemperHide = AddSliderOption("Non-metallic Armors", TempHideVal as int, "{0}%")
			OIDTemperShields = AddSliderOption("Shields", TempShieldVal as int, "{0}%")
			OIDTemperCuirass = AddSliderOption("Cuirasses", TempCuirassVal as int, "{0}%")
			OIDTemperGauntlets = AddSliderOption("Gauntlets", TempGauntletVal as int, "{0}%")
		endif
		SetCursorPosition(1)		;start right-hand column
		if MCM_CCODragonbornInst.GetValue() == 1
			OIDStalhrimEnch = AddSliderOption("Stalhrim Enchanting Bonus", StalhrimEnchVal as int, "{0}%")
			AddEmptyOption()
		endif
		AddHeaderOption("Enchanting Tweaks")
		OIDEnchantTweaks = AddToggleOption("Variable Enchantment Strength", EnchantTweakToggleGV_CCO.getValueInt())
		if EnchantTweakToggleGV_CCO.getValueInt() == 1
			OIDEnchClothing = AddSliderOption("Clothing", EnchClothingVal as int, "{0}%")
			OIDEnchBody = AddSliderOption("Body/Torso", EnchBodyVal as int, "{0}%")
			OIDEnchMinor = AddSliderOption("Head/Hands/Feet", EnchMinorVal as int, "{0}%")
			OIDEnchJewelry = AddSliderOption("All Jewelry", EnchJewelryVal as int, "{0}%")
			OIDEnchJewelryEx = AddSliderOption("Expensive Jewelry", EnchJewelryExVal as int, "{0}%")
			OIDEnchJewelryEq = AddSliderOption("Exquisite Jewelry", EnchJewelryEqVal as int, "{0}%")
			OIDEnchDaggers = AddSliderOption("Daggers", EnchDaggersVal as int, "{0}%")
			OIDEnchBows = AddSliderOption("Bows", EnchBowsVal as int, "{0}%")
			OIDEnch1Hand = AddSliderOption("One-Hand Weapons", Ench1HandVal as int, "{0}%")
			OIDEnch2Hand = AddSliderOption("Two-Hand Weapons", Ench2HandVal as int, "{0}%")
			OIDEnchAccessory = AddSliderOption("Accessories", EnchAccessoryVal as int, "{0}%")
		endif
	elseif (page == "Enable Mods")
		SetCursorFillMode(TOP_TO_BOTTOM)
;		AddHeaderOption("Detected Mods")
;		if MCM_CCODawnguardInst.GetValue() == 1
;			OIDDawnguardInst = AddTextOption("Dawnguard", "")
;		endif
		AddHeaderOption("Display Crafting Recipes")
		if MCM_CCODawnguardInst.GetValue() == 1
			OIDDawnguard = AddToggleOption("Dawnguard Items", CCO_DLCDawnguard.getValueInt(), OPTION_FLAG_NONE)
		else
			OIDDawnguard = AddToggleOption("Dawnguard Items", CCO_DLCDawnguard.getValueInt(), OPTION_FLAG_DISABLED)
		endif
		if MCM_CCOHearthfireInst.GetValue() == 1
			OIDHearthfire = AddToggleOption("Hearthfire Items", CCO_DLCHearthfire.getValueInt(), OPTION_FLAG_NONE)
		else
			OIDHearthfire = AddToggleOption("Hearthfire Items", CCO_DLCHearthfire.getValueInt(), OPTION_FLAG_DISABLED)
		endif
		if MCM_CCODragonbornInst.GetValue() == 1
			OIDDragonborn = AddToggleOption("Dragonborn Items", CCO_DLCDragonborn.getValueInt(), OPTION_FLAG_NONE)
		else
			OIDDragonborn = AddToggleOption("Dragonborn Items", CCO_DLCDragonborn.getValueInt(), OPTION_FLAG_DISABLED)
		endif
		OIDCCORecipes = AddToggleOption("Complete Crafting Overhaul", CCO_CCOAddedRecipes.getValueInt())
		OIDJewelCraft = AddToggleOption("JewelCraft", CCO_MODJewelCraft.getValueInt())
		if MCM_CCOBandoliersInst.GetValueInt() >= 0
			OIDBandoliersCraft = AddToggleOption("Bandoliers, Bags and Pouches", CCO_MODBandoliers.getValueInt(), OPTION_FLAG_NONE)
		else
			OIDBandoliersCraft = AddToggleOption("Bandoliers, Bags and Pouches", CCO_MODBandoliers.getValueInt(), OPTION_FLAG_DISABLED)
		endif
		if MCM_CCOCloaksInst.GetValueInt() >= 0
			OIDCloaksCraft = AddToggleOption("Cloaks of Skyrim", CCO_MODCloaks.getValueInt(), OPTION_FLAG_NONE)
		else
			OIDCloaksCraft = AddToggleOption("Cloaks of Skyrim", CCO_MODCloaks.getValueInt(), OPTION_FLAG_DISABLED)
		endif
		if MCM_CCOJaysusInst.GetValueInt() >= 0
			OIDJaysusCraft = AddToggleOption("Jaysus Swords", CCO_MODJaysusSwords.getValueInt(), OPTION_FLAG_NONE)
		else
			OIDJaysusCraft = AddToggleOption("Jaysus Swords", CCO_MODJaysusSwords.getValueInt(), OPTION_FLAG_DISABLED)
		endif
		if MCM_CCOWinterIsComingInst.GetValueInt() >= 0
			OIDWinterIsComingCraft = AddToggleOption("Winter Is Coming", CCO_MODWinterIsComing.getValueInt(), OPTION_FLAG_NONE)
		else
			OIDWinterIsComingCraft = AddToggleOption("Winter Is Coming", CCO_MODWinterIsComing.getValueInt(), OPTION_FLAG_DISABLED)
		endif
		OIDSupportedMod = AddToggleOption("Misc Supported Mods", CCO_MODSupported.getValueInt())
		if MCM_CCOBookofSilenceInst.GetValueInt() == 1
			OIDBookofSilenceCraft = AddToggleOption("Book of Silence", CCO_MODBookofSilence.getValueInt())
		endif
		if MCM_CCOHeavyArmoryInst.GetValueInt() == 1
			OIDHeavyArmoryCraft = AddToggleOption("Heavy Armory", CCO_MODHeavyArmory.getValueInt())
		endif
		if MCM_CCOImmersiveArmorsInst.GetValueInt() == 1
			OIDImmersiveArmorsCraft = AddToggleOption("Immersive Armors", CCO_MODImmersiveArmors.getValueInt())
		endif
		if MCM_CCOImmersiveWeaponsInst.GetValueInt() == 1
			OIDImmersiveWeaponsCraft = AddToggleOption("Immersive Weapons", CCO_MODImmersiveWeapons.getValueInt())
		endif
		if MCM_CCOImmersiveJewelryInst.GetValueInt() == 1
			OIDImmersiveJewelryCraft = AddToggleOption("Immersive Jewelry", CCO_MODImmersiveJewelry.getValueInt())
		endif

		SetCursorPosition(1)		;start right-hand column
;		AddHeaderOption("Optional Integrated Mods")
;		OIDBandoliersInst = AddToggleOption("Bandolier - Bags and Pouches", MCM_CCOBandoliersInst.getValueInt())
;		if MCM_CCOBandoliersInst.getValueInt() == 1 && MCM_CCODawnguardInst.GetValue() == 1
;			OIDBandoliersDGInst = AddToggleOption("Bandolier - Dawnguard", MCM_CCOBandoliersDGInst.getValueInt())
;		endif
;		OIDCloaksInst = AddToggleOption("Cloaks of Skyrim", MCM_CCOCloaksInst.getValueInt())
;		if MCM_CCOCloaksInst.getValueInt() == 1 && MCM_CCODawnguardInst.GetValue() == 1
;			OIDCloaksDGInst = AddToggleOption("Cloaks - Dawnguard", MCM_CCOCloaksDGInst.getValueInt())
;		endif
;		OIDJaysusInst = AddToggleOption("Jaysus Swords", MCM_CCOJaysusInst.getValueInt())
;		OIDWinterIsComingInst = AddToggleOption("Winter is Coming -  Cloaks", MCM_CCOWinterIsComingInst.getValueInt())

		AddHeaderOption("Distribute in Lists")
		AddEmptyOption()
		AddEmptyOption()
		AddEmptyOption()
		AddEmptyOption()
		;OIDJewelCraftDist = AddToggleOption("JewelCraft", MCM_CCOJewelCraftDist.getValueInt())
		OIDJewelCraftDist = AddToggleOption(". . . . . . . . . . . . . . . . . . . . . . . . . . . . . .", MCM_CCOJewelCraftDist.getValueInt())
		if MCM_CCOBandoliersInst.GetValueInt() >= 0
			;OIDBandoliersDist = AddToggleOption("Bandoliers, Bags and Pouches", MCM_CCOBandoliersDist.getValueInt())
			OIDBandoliersDist = AddToggleOption(". . . . . . . . . . . . . . . . . . . . . . . . . . . . . .", MCM_CCOBandoliersDist.getValueInt(), OPTION_FLAG_NONE)
		else
			OIDBandoliersDist = AddToggleOption(". . . . . . . . . . . . . . . . . . . . . . . . . . . . . .", MCM_CCOBandoliersDist.getValueInt(), OPTION_FLAG_DISABLED)
		endif
		if MCM_CCOCloaksInst.GetValueInt() >= 0
			OIDCloaksDist = AddToggleOption(". . . . . . . . . . . . . . . . . . . . . . . . . . . . . .", MCM_CCOCloaksDist.getValueInt(), OPTION_FLAG_NONE)
		else
			OIDCloaksDist = AddToggleOption(". . . . . . . . . . . . . . . . . . . . . . . . . . . . . .", MCM_CCOCloaksDist.getValueInt(), OPTION_FLAG_DISABLED)
		endif
		if MCM_CCOJaysusInst.GetValueInt() >= 0
			OIDJaysusDist = AddToggleOption(". . . . . . . . . . . . . . . . . . . . . . . . . . . . . .", MCM_CCOJaysusDist.getValueInt(), OPTION_FLAG_NONE)
		else
			OIDJaysusDist = AddToggleOption(". . . . . . . . . . . . . . . . . . . . . . . . . . . . . .", MCM_CCOJaysusDist.getValueInt(), OPTION_FLAG_DISABLED)
		endif
		if MCM_CCOWinterIsComingInst.GetValueInt() >= 0
			OIDWinterIsComingDist = AddToggleOption(". . . . . . . . . . . . . . . . . . . . . . . . . . . . . .", MCM_CCOWinterIsComingDist.getValueInt(), OPTION_FLAG_NONE)
		else
			OIDWinterIsComingDist = AddToggleOption(". . . . . . . . . . . . . . . . . . . . . . . . . . . . . .", MCM_CCOWinterIsComingDist.getValueInt(), OPTION_FLAG_DISABLED)
		endif
	elseif (page == "Mod Options")
		SetCursorFillMode(TOP_TO_BOTTOM)
		if MCM_CCODawnguardInst.GetValue() == 1
			AddHeaderOption("Dawnguard")
			if MCM_DawnguardWorkbench.getValue() == 0
				OIDDawnguardWorkbench = AddTextOption("Craft Dawnguard Items", "At Any Forge")
			else
				OIDDawnguardWorkbench = AddTextOption("Craft Dawnguard Items", "Fort Dawnguard")
			endif
			if MCM_CCOCrossbowsInWorld.getValue() == 0
				OIDDawnguardOnlyCrossbow = AddTextOption("Crossbows and Bolts", "Dawnguard Only")
			else
				OIDDawnguardOnlyCrossbow = AddTextOption("Crossbows and Bolts", "Throughout Skyrim")
			endif
		AddEmptyOption()
		endif
		if MCM_CCOBandoliersInst.getValueInt() == 1
			AddHeaderOption("Bandolier - Bags and Pouches")
			OIDBandoliersEnchantSmall = AddSliderOption("Small Enchantment Value", BandolierSmallVal as int, "{0}")
			OIDBandoliersEnchantMed = AddSliderOption("Medium Enchantment Value", BandolierMedVal as int, "{0}")
			OIDBandoliersEnchantLarge = AddSliderOption("Large Enchantment Value", BandolierLargeVal as int, "{0}")
			OIDBandoliersEnchantXLarge = AddSliderOption("XLarge Enchantment Value", BandolierXLargeVal as int, "{0}")
			if MCM_BandolierWorkbench.getValue() == 0
				OIDBandoliersWorkbench = AddTextOption("Crafting Location", "Tanning Rack")
			else
				OIDBandoliersWorkbench = AddTextOption("Crafting Location", "Forge")
			endif
			if MCM_CCOBandoliersDist.getValueInt() == 1
				OIDBandoliersDistChance = AddSliderOption("Distribution Chance", BandolierChanceVal as int, "{0}%")
			endif
			AddEmptyOption()
		endif
		SetCursorPosition(1)		;start right-hand column
		if MCM_CCOBookofSilenceInst.getValueInt() == 1
			AddHeaderOption("Book of Silence")
			OIDBookofSilenceRace = AddToggleOption("Racial Restrictions", CCO_OptionRacialRestrictions.getValueInt())
			OIDGoldArmor = AddSliderOption("Gilded Ebony Enchanting Bonus", GoldArmorVal as int, "{0}%")
			OIDSilverArmor = AddSliderOption("Silver Ebony Bonus", SilverArmorVal as int, "{0}%")
			AddEmptyOption()
		endif
		if (MCM_CCOCloaksDist.GetValueInt() == 1) || (MCM_CCOWinterIsComingDist.GetValueInt() == 1)
			AddHeaderOption("Cloak Distribution")
			OIDCloakBanditDistChance = AddSliderOption("Bandits", CloakBanditChanceVal as int, "{0}%")
			OIDCloakForswornDistChance = AddSliderOption("Forsworn", CloakForswornChanceVal as int, "{0}%")
			OIDCloakGuardDistChance = AddSliderOption("Guards", CloakGuardChanceVal as int, "{0}%")
			OIDCloakHunterDistChance = AddSliderOption("Hunters", CloakHunterChanceVal as int, "{0}%")
			OIDCloakImperialDistChance = AddSliderOption("Imperial", CloakImperialChanceVal as int, "{0}%")
			OIDCloakNecroDistChance = AddSliderOption("Necromancers", CloakNecroChanceVal as int, "{0}%")
			OIDCloakThalmorDistChance = AddSliderOption("Thalmor", CloakThalmorChanceVal as int, "{0}%")
			OIDCloakVampireDistChance = AddSliderOption("Vampires", CloakVampireChanceVal as int, "{0}%")
			OIDCloakMiscDistChance = AddSliderOption("Other", CloakMiscChanceVal as int, "{0}%")
		endif
	;tweak Dawnguard bonus to apply to all undead, not just vampires?
	elseif (page == "Uninstall")
		SetCursorFillMode(TOP_TO_BOTTOM)
		OIDUninstallMod = AddTextOption("Uninstall Mod", "")
	endif
endEvent



event OnOptionMenuOpen(int option)
	if (option == OIDGemListMenu)
		SetMenuDialogOptions(GemListMenu)
		SetMenuDialogStartIndex(GemListSelection)
		SetMenuDialogDefaultIndex(2)
	elseif (option == OIDMiningPresetsMenu)
		SetMenuDialogOptions(MiningPresetsMenu)
		SetMenuDialogStartIndex(MiningPresetsSelection)
		SetMenuDialogDefaultIndex(0)
	endif
endEvent


event OnOptionMenuAccept(int option, int index)
	if (option == OIDGemListMenu)
		GemListSelection = index
		SetMenuOptionValue(OIDGemListMenu, GemListMenu[GemListSelection])
		if GemListSelection == 0
			MiningGemLeveledGV_CCO.Setvalue(0)
			MiningGemUnLeveledGV_CCO.Setvalue(100)
			MiningGemSpecialGV_CCO.Setvalue(100)
			FlawlessGemChance_CCO.Setvalue(0)
		elseif GemListSelection == 1
			MiningGemLeveledGV_CCO.Setvalue(100)
			MiningGemUnLeveledGV_CCO.Setvalue(0)
			MiningGemSpecialGV_CCO.Setvalue(100)
			FlawlessGemChance_CCO.Setvalue(FlawlessChanceVal)
		else
			MiningGemLeveledGV_CCO.Setvalue(100)
			MiningGemUnLeveledGV_CCO.Setvalue(100)
			MiningGemSpecialGV_CCO.Setvalue(0)
			FlawlessGemChance_CCO.Setvalue(FlawlessChanceVal)
		endif
	elseif (option == OIDMiningPresetsMenu)
		MiningPresetsSelection = index
		SetMenuOptionValue(OIDMiningPresetsMenu, MiningPresetsMenu[MiningPresetsSelection])
		if MiningPresetsSelection == 0				;vanilla values = 3 ore in 9 strikes
			MiningStrikesVal = 1
			SetSliderOptionValue(OIDMiningStrikes, MiningStrikesVal, "{1}")
			StrikesBeforeCollectionGV_CCO.Setvalue(MiningStrikesVal)
			MiningAttackStrikesVal = 3
			SetSliderOptionValue(OIDMiningAttackStrikes, MiningAttackStrikesVal, "{1}")
			AttackStrikesBeforeCollectionGV_CCO.Setvalue(MiningAttackStrikesVal)
			MiningOresDropVal = 1
			SetSliderOptionValue(OIDMiningOresDrop, MiningOresDropVal, "{1}")
			ResourceCountGV_CCO.Setvalue(MiningOresDropVal)
			MiningOresTotalVal = 3
			SetSliderOptionValue(OIDMiningOresTotal, MiningOresTotalVal, "{1}")
			ResourceCountTotalGV_CCO.Setvalue(MiningOresTotalVal)
			OIDMiningStrikes = AddSliderOption("Animations cycles per drop", MiningStrikesVal, "{1}", OPTION_FLAG_DISABLED)
			OIDMiningAttackStrikes = AddSliderOption("Attack Strikes per drop", MiningAttackStrikesVal, "{1}", OPTION_FLAG_DISABLED)
			OIDMiningOresDrop = AddSliderOption("Ores per drop", MiningOresDropVal, "{1}", OPTION_FLAG_DISABLED)
			OIDMiningOresTotal = AddSliderOption("Drops per vein", MiningOresTotalVal, "{1}", OPTION_FLAG_DISABLED)
			UseCustomMiningSettings = 0
			ForcePageReset()
		elseif MiningPresetsSelection == 1			;more ore, same rate = 6 ore in 18 strikes
			MiningStrikesVal = 1
			SetSliderOptionValue(OIDMiningStrikes, MiningStrikesVal, "{1}")
			StrikesBeforeCollectionGV_CCO.Setvalue(MiningStrikesVal)
			MiningAttackStrikesVal = 3
			SetSliderOptionValue(OIDMiningAttackStrikes, MiningAttackStrikesVal, "{1}")
			AttackStrikesBeforeCollectionGV_CCO.Setvalue(MiningAttackStrikesVal)
			MiningOresDropVal = 1
			SetSliderOptionValue(OIDMiningOresDrop, MiningOresDropVal, "{1}")
			ResourceCountGV_CCO.Setvalue(MiningOresDropVal)
			MiningOresTotalVal = 6
			SetSliderOptionValue(OIDMiningOresTotal, MiningOresTotalVal, "{1}")
			ResourceCountTotalGV_CCO.Setvalue(MiningOresTotalVal)
			OIDMiningStrikes = AddSliderOption("Animations cycles per drop", MiningStrikesVal, "{1}", OPTION_FLAG_DISABLED)
			OIDMiningAttackStrikes = AddSliderOption("Attack Strikes per drop", MiningAttackStrikesVal, "{1}", OPTION_FLAG_DISABLED)
			OIDMiningOresDrop = AddSliderOption("Ores per drop", MiningOresDropVal, "{1}", OPTION_FLAG_DISABLED)
			OIDMiningOresTotal = AddSliderOption("Drops per vein", MiningOresTotalVal, "{1}", OPTION_FLAG_DISABLED)
			UseCustomMiningSettings = 0
			ForcePageReset()
		elseif MiningPresetsSelection == 2			;much more ore, same rate = 24 ore in 72 strikes
			MiningStrikesVal = 1
			SetSliderOptionValue(OIDMiningStrikes, MiningStrikesVal, "{1}")
			StrikesBeforeCollectionGV_CCO.Setvalue(MiningStrikesVal)
			MiningAttackStrikesVal = 3
			SetSliderOptionValue(OIDMiningAttackStrikes, MiningAttackStrikesVal, "{1}")
			AttackStrikesBeforeCollectionGV_CCO.Setvalue(MiningAttackStrikesVal)
			MiningOresDropVal = 1
			SetSliderOptionValue(OIDMiningOresDrop, MiningOresDropVal, "{1}")
			ResourceCountGV_CCO.Setvalue(MiningOresDropVal)
			MiningOresTotalVal = 24
			SetSliderOptionValue(OIDMiningOresTotal, MiningOresTotalVal, "{1}")
			ResourceCountTotalGV_CCO.Setvalue(MiningOresTotalVal)
			OIDMiningStrikes = AddSliderOption("Animations cycles per drop", MiningStrikesVal, "{1}", OPTION_FLAG_DISABLED)
			OIDMiningAttackStrikes = AddSliderOption("Attack Strikes per drop", MiningAttackStrikesVal, "{1}", OPTION_FLAG_DISABLED)
			OIDMiningOresDrop = AddSliderOption("Ores per drop", MiningOresDropVal, "{1}", OPTION_FLAG_DISABLED)
			OIDMiningOresTotal = AddSliderOption("Drops per vein", MiningOresTotalVal, "{1}", OPTION_FLAG_DISABLED)
			UseCustomMiningSettings = 0
			ForcePageReset()
		elseif MiningPresetsSelection == 3			;faster mining = 3 ores in 3 strikes
			MiningStrikesVal = 1
			SetSliderOptionValue(OIDMiningStrikes, MiningStrikesVal, "{1}")
			StrikesBeforeCollectionGV_CCO.Setvalue(MiningStrikesVal)
			MiningAttackStrikesVal = 3
			SetSliderOptionValue(OIDMiningAttackStrikes, MiningAttackStrikesVal, "{1}")
			AttackStrikesBeforeCollectionGV_CCO.Setvalue(MiningAttackStrikesVal)
			MiningOresDropVal = 3
			SetSliderOptionValue(OIDMiningOresDrop, MiningOresDropVal, "{1}")
			ResourceCountGV_CCO.Setvalue(MiningOresDropVal)
			MiningOresTotalVal = 1
			SetSliderOptionValue(OIDMiningOresTotal, MiningOresTotalVal, "{1}")
			ResourceCountTotalGV_CCO.Setvalue(MiningOresTotalVal)
			OIDMiningStrikes = AddSliderOption("Animations cycles per drop", MiningStrikesVal, "{1}", OPTION_FLAG_DISABLED)
			OIDMiningAttackStrikes = AddSliderOption("Attack Strikes per drop", MiningAttackStrikesVal, "{1}", OPTION_FLAG_DISABLED)
			OIDMiningOresDrop = AddSliderOption("Ores per drop", MiningOresDropVal, "{1}", OPTION_FLAG_DISABLED)
			OIDMiningOresTotal = AddSliderOption("Drops per vein", MiningOresTotalVal, "{1}", OPTION_FLAG_DISABLED)
			UseCustomMiningSettings = 0
			ForcePageReset()
		elseif MiningPresetsSelection == 4			;faster mining and more ore = 6 ores in 3 strikes
			MiningStrikesVal = 1
			SetSliderOptionValue(OIDMiningStrikes, MiningStrikesVal, "{1}")
			StrikesBeforeCollectionGV_CCO.Setvalue(MiningStrikesVal)
			MiningAttackStrikesVal = 3
			SetSliderOptionValue(OIDMiningAttackStrikes, MiningAttackStrikesVal, "{1}")
			AttackStrikesBeforeCollectionGV_CCO.Setvalue(MiningAttackStrikesVal)
			MiningOresDropVal = 6
			SetSliderOptionValue(OIDMiningOresDrop, MiningOresDropVal, "{1}")
			ResourceCountGV_CCO.Setvalue(MiningOresDropVal)
			MiningOresTotalVal = 1
			SetSliderOptionValue(OIDMiningOresTotal, MiningOresTotalVal, "{1}")
			ResourceCountTotalGV_CCO.Setvalue(MiningOresTotalVal)
			OIDMiningStrikes = AddSliderOption("Animations cycles per drop", MiningStrikesVal, "{1}", OPTION_FLAG_DISABLED)
			OIDMiningAttackStrikes = AddSliderOption("Attack Strikes per drop", MiningAttackStrikesVal, "{1}", OPTION_FLAG_DISABLED)
			OIDMiningOresDrop = AddSliderOption("Ores per drop", MiningOresDropVal, "{1}", OPTION_FLAG_DISABLED)
			OIDMiningOresTotal = AddSliderOption("Drops per vein", MiningOresTotalVal, "{1}", OPTION_FLAG_DISABLED)
			UseCustomMiningSettings = 0
			ForcePageReset()
		elseif MiningPresetsSelection == 5			;slower mining = 3 ore in 18 strikes
			MiningStrikesVal = 2
			SetSliderOptionValue(OIDMiningStrikes, MiningStrikesVal, "{1}")
			StrikesBeforeCollectionGV_CCO.Setvalue(MiningStrikesVal)
			MiningAttackStrikesVal = 3
			SetSliderOptionValue(OIDMiningAttackStrikes, MiningAttackStrikesVal, "{1}")
			AttackStrikesBeforeCollectionGV_CCO.Setvalue(MiningAttackStrikesVal)
			MiningOresDropVal = 1
			SetSliderOptionValue(OIDMiningOresDrop, MiningOresDropVal, "{1}")
			ResourceCountGV_CCO.Setvalue(MiningOresDropVal)
			MiningOresTotalVal = 3
			SetSliderOptionValue(OIDMiningOresTotal, MiningOresTotalVal, "{1}")
			ResourceCountTotalGV_CCO.Setvalue(MiningOresTotalVal)
			OIDMiningStrikes = AddSliderOption("Animations cycles per drop", MiningStrikesVal, "{1}", OPTION_FLAG_DISABLED)
			OIDMiningAttackStrikes = AddSliderOption("Attack Strikes per drop", MiningAttackStrikesVal, "{1}", OPTION_FLAG_DISABLED)
			OIDMiningOresDrop = AddSliderOption("Ores per drop", MiningOresDropVal, "{1}", OPTION_FLAG_DISABLED)
			OIDMiningOresTotal = AddSliderOption("Drops per vein", MiningOresTotalVal, "{1}", OPTION_FLAG_DISABLED)
			UseCustomMiningSettings = 0
			ForcePageReset()
		elseif MiningPresetsSelection == 6			;slower mining and much more ore = 24 ore in 144 strikes
			MiningStrikesVal = 2
			SetSliderOptionValue(OIDMiningStrikes, MiningStrikesVal, "{1}")
			StrikesBeforeCollectionGV_CCO.Setvalue(MiningStrikesVal)
			MiningAttackStrikesVal = 3
			SetSliderOptionValue(OIDMiningAttackStrikes, MiningAttackStrikesVal, "{1}")
			AttackStrikesBeforeCollectionGV_CCO.Setvalue(MiningAttackStrikesVal)
			MiningOresDropVal = 1
			SetSliderOptionValue(OIDMiningOresDrop, MiningOresDropVal, "{1}")
			ResourceCountGV_CCO.Setvalue(MiningOresDropVal)
			MiningOresTotalVal = 24
			SetSliderOptionValue(OIDMiningOresTotal, MiningOresTotalVal, "{1}")
			ResourceCountTotalGV_CCO.Setvalue(MiningOresTotalVal)
			OIDMiningStrikes = AddSliderOption("Animations cycles per drop", MiningStrikesVal, "{1}", OPTION_FLAG_DISABLED)
			OIDMiningAttackStrikes = AddSliderOption("Attack Strikes per drop", MiningAttackStrikesVal, "{1}", OPTION_FLAG_DISABLED)
			OIDMiningOresDrop = AddSliderOption("Ores per drop", MiningOresDropVal, "{1}", OPTION_FLAG_DISABLED)
			OIDMiningOresTotal = AddSliderOption("Drops per vein", MiningOresTotalVal, "{1}", OPTION_FLAG_DISABLED)
			UseCustomMiningSettings = 0
			ForcePageReset()
		else										;use custom settings
			OIDMiningStrikes = AddSliderOption("Animations cycles per drop", MiningStrikesVal, "{1}", OPTION_FLAG_NONE)
			OIDMiningAttackStrikes = AddSliderOption("Attack Strikes per drop", MiningAttackStrikesVal, "{1}", OPTION_FLAG_NONE)
			OIDMiningOresDrop = AddSliderOption("Ores per drop", MiningOresDropVal, "{1}", OPTION_FLAG_NONE)
			OIDMiningOresTotal = AddSliderOption("Drops per vein", MiningOresTotalVal, "{1}", OPTION_FLAG_NONE)
			UseCustomMiningSettings = 1
			ForcePageReset()
		endif
	endIf
endEvent


Event OnOptionSelect(int option)
	If (option == OIDAllOn)
		CCO_ArmorLightRecipes.setValue(1)
		CCO_ArmorHeavyRecipes.setValue(1)
		CCO_ArmorClothingRecipes.setValue(1)
		CCO_ArmorBootRecipes.setValue(1)
		CCO_ArmorCuirassRecipes.setValue(1)
		CCO_ArmorGauntletRecipes.setValue(1)
		CCO_ArmorHelmetRecipes.setValue(1)
		CCO_ArmorShieldRecipes.setValue(1)
		CCO_ClothingRobeRecipes.setValue(1)
		CCO_ClothingHoodRecipes.setValue(1)
		CCO_ClothingGlovesRecipes.setValue(1)
		CCO_ClothingBootRecipes.setValue(1)
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
		CCO_ClothingCloakRecipes.setValue(1)
		CCO_MiscAccessories.setValue(1)
		ForcePageReset()
	elseif (option == OIDAllOff)
		CCO_ArmorLightRecipes.setValue(0)
		CCO_ArmorHeavyRecipes.setValue(0)
		CCO_ArmorClothingRecipes.setValue(0)
		CCO_ArmorBootRecipes.setValue(0)
		CCO_ArmorCuirassRecipes.setValue(0)
		CCO_ArmorGauntletRecipes.setValue(0)
		CCO_ArmorHelmetRecipes.setValue(0)
		CCO_ArmorShieldRecipes.setValue(0)
		CCO_ClothingRobeRecipes.setValue(0)
		CCO_ClothingHoodRecipes.setValue(0)
		CCO_ClothingGlovesRecipes.setValue(0)
		CCO_ClothingBootRecipes.setValue(0)
		CCO_WeapAmmoRecipes.setValue(0)
		CCO_WeapBowRecipes.setValue(0)
		CCO_WeapDaggerRecipes.setValue(0)
		CCO_WeapSwordRecipes.setValue(0)
		CCO_WeapGreatswordRecipes.setValue(0)
		CCO_WeapBattleaxeRecipes.setValue(0)
		CCO_WeapMaceRecipes.setValue(0)
		CCO_WeapWarAxeRecipes.setValue(0)
		CCO_WeapWarhammerRecipes.setValue(0)
		CCO_MiscCircletRecipes.setValue(0)
		CCO_MiscNecklaceRecipes.setValue(0)
		CCO_MiscRingRecipes.setValue(0)
		CCO_MiscPouchRecipes.setValue(0)
		CCO_MiscToolRecipes.setValue(0)
		CCO_ClothingCloakRecipes.setValue(0)
		CCO_MiscAccessories.setValue(0)
		ForcePageReset()
	elseif (option == OIDWeapAll)
		CCO_WeapAmmoRecipes.setValue(1)
		CCO_WeapBowRecipes.setValue(1)
		CCO_WeapDaggerRecipes.setValue(1)
		CCO_WeapSwordRecipes.setValue(1)
		CCO_WeapGreatswordRecipes.setValue(1)
		CCO_WeapBattleaxeRecipes.setValue(1)
		CCO_WeapMaceRecipes.setValue(1)
		CCO_WeapWarAxeRecipes.setValue(1)
		CCO_WeapWarhammerRecipes.setValue(1)
		ForcePageReset()
	elseif (option == OIDWeapOneHand)
		CCO_WeapDaggerRecipes.setValue(1)
		CCO_WeapSwordRecipes.setValue(1)
		CCO_WeapMaceRecipes.setValue(1)
		CCO_WeapWarAxeRecipes.setValue(1)
		ForcePageReset()
	elseif (option == OIDWeapTwoHand)
		CCO_WeapBowRecipes.setValue(1)
		CCO_WeapGreatswordRecipes.setValue(1)
		CCO_WeapBattleaxeRecipes.setValue(1)
		CCO_WeapWarhammerRecipes.setValue(1)
		ForcePageReset()
	elseif (option == OIDArmorAll)
		CCO_ArmorLightRecipes.setValue(1)
		CCO_ArmorHeavyRecipes.setValue(1)
		CCO_ArmorClothingRecipes.setValue(1)
		CCO_ArmorBootRecipes.setValue(1)
		CCO_ArmorCuirassRecipes.setValue(1)
		CCO_ArmorGauntletRecipes.setValue(1)
		CCO_ArmorHelmetRecipes.setValue(1)
		CCO_ArmorShieldRecipes.setValue(1)
		CCO_ClothingRobeRecipes.setValue(1)
		CCO_ClothingHoodRecipes.setValue(1)
		CCO_ClothingGlovesRecipes.setValue(1)
		CCO_ClothingBootRecipes.setValue(1)
		CCO_MiscPouchRecipes.setValue(0)
		CCO_ClothingCloakRecipes.setValue(0)
		CCO_MiscAccessories.setValue(0)
		ForcePageReset()
	elseif (option == OIDMiscJewelryAll)
		CCO_MiscCircletRecipes.setValue(1)
		CCO_MiscNecklaceRecipes.setValue(1)
		CCO_MiscRingRecipes.setValue(1)
		ForcePageReset()
	elseif (option == OIDWeapDaggers)
		if CCO_WeapDaggerRecipes.GetValueInt() == 0
			CCO_WeapDaggerRecipes.setValue(1)
			ForcePageReset()
		else
			CCO_WeapDaggerRecipes.setValue(0)
			ForcePageReset()
		endif
	elseif (option == OIDWeapSwords)
		if CCO_WeapSwordRecipes.GetValueInt() == 0
			CCO_WeapSwordRecipes.setValue(1)
			ForcePageReset()
		else
			CCO_WeapSwordRecipes.setValue(0)
			ForcePageReset()
		endif
	elseif (option == OIDWeapGreatswords)
		if CCO_WeapGreatswordRecipes.GetValueInt() == 0
			CCO_WeapGreatswordRecipes.setValue(1)
			ForcePageReset()
		else
			CCO_WeapGreatswordRecipes.setValue(0)
			ForcePageReset()
		endif
	elseif (option == OIDWeapWarAxe)
		if CCO_WeapWarAxeRecipes.GetValueInt() == 0
			CCO_WeapWarAxeRecipes.setValue(1)
			ForcePageReset()
		else
			CCO_WeapWarAxeRecipes.setValue(0)
			ForcePageReset()
		endif
	elseif (option == OIDWeapBattleaxe)
		if CCO_WeapBattleaxeRecipes.GetValueInt() == 0
			CCO_WeapBattleaxeRecipes.setValue(1)
			ForcePageReset()
		else
			CCO_WeapBattleaxeRecipes.setValue(0)
			ForcePageReset()
		endif
	elseif (option == OIDWeapMace)
		if CCO_WeapMaceRecipes.GetValueInt() == 0
			CCO_WeapMaceRecipes.setValue(1)
			ForcePageReset()
		else
			CCO_WeapMaceRecipes.setValue(0)
			ForcePageReset()
		endif
	elseif (option == OIDWeapWarhammer)
		if CCO_WeapWarhammerRecipes.GetValueInt() == 0
			CCO_WeapWarhammerRecipes.setValue(1)
			ForcePageReset()
		else
			CCO_WeapWarhammerRecipes.setValue(0)
			ForcePageReset()
		endif
	elseif (option == OIDWeapBow)
		if CCO_WeapBowRecipes.GetValueInt() == 0
			CCO_WeapBowRecipes.setValue(1)
			ForcePageReset()
		else
			CCO_WeapBowRecipes.setValue(0)
			ForcePageReset()
		endif
	elseif (option == OIDWeapAmmo)
		if CCO_WeapAmmoRecipes.GetValueInt() == 0
			CCO_WeapAmmoRecipes.setValue(1)
			ForcePageReset()
		else
			CCO_WeapAmmoRecipes.setValue(0)
			ForcePageReset()
		endif
	elseif (option == OIDArmorLight)
		if CCO_ArmorLightRecipes.GetValueInt() == 0
			CCO_ArmorLightRecipes.setValue(1)
			ForcePageReset()
		else
			CCO_ArmorLightRecipes.setValue(0)
			ForcePageReset()
		endif
	elseif (option == OIDArmorHeavy)
		if CCO_ArmorHeavyRecipes.GetValueInt() == 0
			CCO_ArmorHeavyRecipes.setValue(1)
			ForcePageReset()
		else
			CCO_ArmorHeavyRecipes.setValue(0)
			ForcePageReset()
		endif
	elseif (option == OIDArmorClothing)
		if CCO_ArmorClothingRecipes.GetValueInt() == 0
			CCO_ArmorClothingRecipes.setValue(1)
			ForcePageReset()
		else
			CCO_ArmorClothingRecipes.setValue(0)
			ForcePageReset()
		endif
	elseif (option == OIDArmorCuirass)
		if CCO_ArmorCuirassRecipes.GetValueInt() == 0 || CCO_ClothingRobeRecipes.GetValueInt() == 0
			CCO_ArmorCuirassRecipes.setValue(1)
			CCO_ClothingRobeRecipes.setValue(1)
			ForcePageReset()
		else
			CCO_ArmorCuirassRecipes.setValue(0)
			CCO_ClothingRobeRecipes.setValue(0)
			ForcePageReset()
		endif
	elseif (option == OIDArmorHelmets)
		if CCO_ArmorHelmetRecipes.GetValueInt() == 0 || CCO_ClothingHoodRecipes.GetValueInt() == 0
			CCO_ArmorHelmetRecipes.setValue(1)
			CCO_ClothingHoodRecipes.setValue(1)
			ForcePageReset()
		else
			CCO_ArmorHelmetRecipes.setValue(0)
			CCO_ClothingHoodRecipes.setValue(0)
			ForcePageReset()
		endif
	elseif (option == OIDArmorGauntlets)
		if CCO_ArmorGauntletRecipes.GetValueInt() == 0 || CCO_ClothingGlovesRecipes.GetValueInt() == 0
			CCO_ArmorGauntletRecipes.setValue(1)
			CCO_ClothingGlovesRecipes.setValue(1)
			ForcePageReset()
		else
			CCO_ArmorGauntletRecipes.setValue(0)
			CCO_ClothingGlovesRecipes.setValue(0)
			ForcePageReset()
		endif
	elseif (option == OIDArmorBoots)
		if CCO_ArmorBootRecipes.GetValueInt() == 0 || CCO_ClothingBootRecipes.GetValueInt() == 0
			CCO_ArmorBootRecipes.setValue(1)
			CCO_ClothingBootRecipes.setValue(1)
			ForcePageReset()
		else
			CCO_ArmorBootRecipes.setValue(0)
			CCO_ClothingBootRecipes.setValue(0)
			ForcePageReset()
		endif
	elseif (option == OIDArmorShields)
		if CCO_ArmorShieldRecipes.GetValueInt() == 0
			CCO_ArmorShieldRecipes.setValue(1)
			ForcePageReset()
		else
			CCO_ArmorShieldRecipes.setValue(0)
			ForcePageReset()
		endif
	elseif (option == OIDMiscCirclet)
		if CCO_MiscCircletRecipes.GetValueInt() == 0
			CCO_MiscCircletRecipes.setValue(1)
			ForcePageReset()
		else
			CCO_MiscCircletRecipes.setValue(0)
			ForcePageReset()
		endif
	elseif (option == OIDMiscNecklace)
		if CCO_MiscNecklaceRecipes.GetValueInt() == 0
			CCO_MiscNecklaceRecipes.setValue(1)
			ForcePageReset()
		else
			CCO_MiscNecklaceRecipes.setValue(0)
			ForcePageReset()
		endif
	elseif (option == OIDMiscRing)
		if CCO_MiscRingRecipes.GetValueInt() == 0
			CCO_MiscRingRecipes.setValue(1)
			ForcePageReset()
		else
			CCO_MiscRingRecipes.setValue(0)
			ForcePageReset()
		endif
	elseif (option == OIDMiscCloaks)
		if CCO_ClothingCloakRecipes.GetValueInt() == 0
			CCO_ClothingCloakRecipes.setValue(1)
			ForcePageReset()
		else
			CCO_ClothingCloakRecipes.setValue(0)
			ForcePageReset()
		endif
	elseif (option == OIDMiscPouches)
		if CCO_MiscPouchRecipes.GetValueInt() == 0
			CCO_MiscPouchRecipes.setValue(1)
			ForcePageReset()
		else
			CCO_MiscPouchRecipes.setValue(0)
			ForcePageReset()
		endif
	elseif (option == OIDMiscAccessories)
		if CCO_MiscAccessories.GetValueInt() == 0
			CCO_MiscAccessories.setValue(1)
			ForcePageReset()
		else
			CCO_MiscAccessories.setValue(0)
			ForcePageReset()
		endif
;..................................Start Mod Options..................................
	elseif (option == OIDDawnguard)
		if CCO_DLCDawnguard.GetValueInt() == 0
			CCO_DLCDawnguard.setValue(1)
		else
			CCO_DLCDawnguard.setValue(0)
		endif
		ForcePageReset()
	elseif (option == OIDHearthfire)
		if CCO_DLCHearthfire.GetValueInt() == 0
			CCO_DLCHearthfire.setValue(1)
		else
			CCO_DLCHearthfire.setValue(0)
		endif
		ForcePageReset()
	elseif (option == OIDDragonborn)
		if CCO_DLCDragonborn.GetValueInt() == 0
			CCO_DLCDragonborn.setValue(1)
		else
			CCO_DLCDragonborn.setValue(0)
		endif
		ForcePageReset()
	elseif (option == OIDJewelCraft)
		if CCO_MODJewelCraft.GetValueInt() == 0
			CCO_MODJewelCraft.setValue(1)
		else
			CCO_MODJewelCraft.setValue(0)
		endif
		ForcePageReset()
	elseif (option == OIDJewelCraftDist)
		if MCM_CCOJewelCraftDist.GetValueInt() == 0
			MCM_CCOJewelCraftDist.setValue(1)
			DIST_CCOJewelCraft_ON.setValue(0)
			DIST_CCOJewelCraft_OFF.setValue(100)
		else
			MCM_CCOJewelCraftDist.setValue(0)
			DIST_CCOJewelCraft_ON.setValue(100)
			DIST_CCOJewelCraft_OFF.setValue(0)
		endif
		ForcePageReset()
	elseif (option == OIDBandoliersCraft)
		if MCM_CCOBandoliersInst.GetValueInt() == 0
			if ShowMessage("This will enable Bandoliers, Bags and Pouches. \n\nIMPORTANT!\nYou must install any mesh or texture assets from the original mod page, failing to do so will result in invisible items or missing textures.\n\nDo you wish to continue?", true, "Yes, Activate Mod", "Cancel")
				ActivateBandoliers()
			Endif
		elseif CCO_MODBandoliers.GetValueInt() == 1 && MCM_CCOBandoliersDist.GetValue() == 0
			if ShowMessage("Do you wish to disable Bandoliers? \n\nSelecting 'Yes' will deactive all related mod options from within CCO.  Selecting 'No' will leave the mod activated, and disable only this specific option.", true, "Yes, Disable Mod", "No, Leave Mod Active")
				ActivateBandoliers()
			else
				CCO_MODBandoliers.setValue(0)
			Endif
		elseif CCO_MODBandoliers.GetValueInt() == 1
			CCO_MODBandoliers.setValue(0)
		else
			CCO_MODBandoliers.setValue(1)
		endif
		ForcePageReset()
	elseif (option == OIDBandoliersDist)
		if MCM_CCOBandoliersInst.GetValueInt() == 0
			if ShowMessage("This will enable Bandoliers, Bags and Pouches. \n\nIMPORTANT!\nYou must install any mesh or texture assets from the original mod page, failing to do so will result in invisible items or missing textures.\n\nDo you wish to continue?", true, "Yes, Activate Mod", "Cancel")
				ActivateBandoliers()
			Endif
		elseif MCM_CCOBandoliersDist.GetValue() == 1 && CCO_MODBandoliers.GetValueInt() == 0
			if ShowMessage("Do you wish to disable Bandoliers? \n\nSelecting 'Yes' will deactive all related mod options from within CCO.  Selecting 'No' will leave the mod activated, and disable only this specific option.", true, "Yes, Disable Mod", "No, Leave Mod Active")
				ActivateBandoliers()
			else
				MCM_CCOBandoliersDist.setValue(0)
				DIST_CCOBandoliersChance.Setvalue(100)
			Endif
		elseif MCM_CCOBandoliersDist.GetValueInt() == 0
			MCM_CCOBandoliersDist.setValue(1)
			DIST_CCOBandoliersChance.Setvalue(100-BandolierChanceVal)
		else
			MCM_CCOBandoliersDist.setValue(0)
			DIST_CCOBandoliersChance.Setvalue(100)
		endif
		ForcePageReset()
	elseif (option == OIDJaysusCraft)
		if MCM_CCOJaysusInst.GetValueInt() == 0
			if ShowMessage("This will enable Jaysus Swords. \n\nIMPORTANT!\nYou must install any mesh or texture assets from the original mod page, failing to do so will result in invisible items or missing textures.\n\nDo you wish to continue?", true, "Yes, Activate Mod", "Cancel")
				ActivateJaysus()
			Endif
		elseif CCO_MODJaysusSwords.GetValueInt() == 1 && MCM_CCOJaysusDist.GetValue() == 0
			if ShowMessage("Do you wish to disable Jaysus Swords? \n\nSelecting 'Yes' will deactive all related mod options from within CCO.  Selecting 'No' will leave the mod activated, and disable only this specific option.", true, "Yes, Disable Mod", "No, Leave Mod Active")
				ActivateJaysus()
			Else
				CCO_MODJaysusSwords.setValue(0)
			Endif
		elseif CCO_MODJaysusSwords.GetValueInt() == 1
			CCO_MODJaysusSwords.setValue(0)
		else
			CCO_MODJaysusSwords.setValue(1)
		endif
		ForcePageReset()
	elseif (option == OIDJaysusDist)
		if MCM_CCOJaysusInst.GetValueInt() == 0
			if ShowMessage("This will enable Jaysus Swords. \n\nIMPORTANT!\nYou must install any mesh or texture assets from the original mod page, failing to do so will result in invisible items or missing textures.\n\nDo you wish to continue?", true, "Yes, Activate Mod", "Cancel")
				ActivateJaysus()
			Endif
		elseif MCM_CCOJaysusDist.GetValue() == 1 && CCO_MODJaysusSwords.GetValueInt() == 0
			if ShowMessage("Do you wish to disable Jaysus Swords? \n\nSelecting 'Yes' will deactive all related mod options from within CCO.  Selecting 'No' will leave the mod activated, and disable only this specific option.", true, "Yes, Disable Mod", "No, Leave Mod Active")
				ActivateJaysus()
			else
				MCM_CCOJaysusDist.setValue(0)
				DIST_CCOJaysusSwords_ON.setValue(100)
				DIST_CCOJaysusSwords_OFF.setValue(0)
				JaysusSwordsParentMarker.disable()
			Endif
		elseif MCM_CCOJaysusDist.GetValueInt() == 0
			MCM_CCOJaysusDist.setValue(1)
			DIST_CCOJaysusSwords_ON.setValue(0)
			DIST_CCOJaysusSwords_OFF.setValue(100)
			JaysusSwordsParentMarker.enable()
		else
			MCM_CCOJaysusDist.setValue(0)
			DIST_CCOJaysusSwords_ON.setValue(100)
			DIST_CCOJaysusSwords_OFF.setValue(0)
			JaysusSwordsParentMarker.disable()
		endif
		ForcePageReset()
	elseif (option == OIDCloaksCraft)
		if MCM_CCOCloaksInst.GetValueInt() == 0
			if ShowMessage("This will enable Cloaks of Skyrim. \n\nIMPORTANT!\nYou must install any mesh or texture assets from the original mod page, failing to do so will result in invisible items or missing textures.\n\nDo you wish to continue?", true, "Yes, Activate Mod", "Cancel")
				ActivateCloaks()
			Endif
		elseif CCO_MODCloaks.GetValueInt() == 1 && MCM_CCOCloaksDist.GetValue() == 0
			if ShowMessage("Do you wish to disable Cloaks of Skyrim? \n\nSelecting 'Yes' will deactive all related mod options from within CCO.  Selecting 'No' will leave the mod activated, and disable only this specific option.", true, "Yes, Disable Mod", "No, Leave Mod Active")
				ActivateCloaks()
			Else
				CCO_MODCloaks.setValue(0)
			Endif
		elseif CCO_MODCloaks.GetValueInt() == 1
			CCO_MODCloaks.setValue(0)
		else
			CCO_MODCloaks.setValue(1)
		endif
		ForcePageReset()
	elseif (option == OIDCloaksDist)
		if MCM_CCOCloaksInst.GetValueInt() == 0
			if ShowMessage("This will enable Cloaks of Skyrim. \n\nIMPORTANT!\nYou must install any mesh or texture assets from the original mod page, failing to do so will result in invisible items or missing textures.\n\nDo you wish to continue?", true, "Yes, Activate Mod", "Cancel")
				ActivateCloaks()
			Endif
		elseif MCM_CCOCloaksDist.GetValue() == 1 && CCO_MODCloaks.GetValueInt() == 0
			if ShowMessage("Do you wish to disable Cloaks of Skyrim? \n\nSelecting 'Yes' will deactive all related mod options from within CCO.  Selecting 'No' will leave the mod activated, and disable only this specific option.", true, "Yes, Disable Mod", "No, Leave Mod Active")
				ActivateCloaks()
			else
				MCM_CCOCloaksDist.setValue(0)
				DIST_CCOCloaks_ON.setValue(100)
				DIST_CCOCloaks_OFF.setValue(0)
				CloaksParentMarker.disable()
			Endif
		elseif MCM_CCOCloaksDist.GetValueInt() == 0
			MCM_CCOCloaksDist.setValue(1)
			DIST_CCOCloaks_ON.setValue(0)
			DIST_CCOCloaks_OFF.setValue(100)
			CloaksParentMarker.enable()
		else
			MCM_CCOCloaksDist.setValue(0)
			DIST_CCOCloaks_ON.setValue(100)
			DIST_CCOCloaks_OFF.setValue(0)
			CloaksParentMarker.disable()
		endif
		ForcePageReset()
	elseif (option == OIDWinterIsComingCraft)
		if MCM_CCOWinterIsComingInst.GetValueInt() == 0
			if ShowMessage("This will enable Winter Is Coming - Cloaks. \n\nIMPORTANT!\nYou must install any mesh or texture assets from the original mod page, failing to do so will result in invisible items or missing textures.\n\nDo you wish to continue?", true, "Yes, Activate Mod", "Cancel")
				ActivateWinterIsComing()
			Endif
		elseif CCO_MODWinterIsComing.GetValueInt() == 1 && MCM_CCOWinterIsComingDist.GetValue() == 0
			if ShowMessage("Do you wish to disable Winter Is Coming - Cloaks? \n\nSelecting 'Yes' will deactive all related mod options from within CCO.  Selecting 'No' will leave the mod activated, and disable only this specific option.", true, "Yes, Disable Mod", "No, Leave Mod Active")
				ActivateWinterIsComing()
			Else
				CCO_MODWinterIsComing.setValue(0)
			Endif
		elseif CCO_MODWinterIsComing.GetValueInt() == 1
			CCO_MODWinterIsComing.setValue(0)
		else
			CCO_MODWinterIsComing.setValue(1)
		endif
		ForcePageReset()
	elseif (option == OIDWinterIsComingDist)
		if MCM_CCOWinterIsComingInst.GetValueInt() == 0
			if ShowMessage("This will enable Winter Is Coming - Cloaks. \n\nIMPORTANT!\nYou must install any mesh or texture assets from the original mod page, failing to do so will result in invisible items or missing textures.\n\nDo you wish to continue?", true, "Yes, Activate Mod", "Cancel")
				ActivateWinterIsComing()
			Endif
		elseif MCM_CCOWinterIsComingDist.GetValue() == 1 && CCO_MODWinterIsComing.GetValueInt() == 0
			if ShowMessage("Do you wish to disable Winter Is Coming - Cloaks? \n\nSelecting 'Yes' will deactive all related mod options from within CCO.  Selecting 'No' will leave the mod activated, and disable only this specific option.", true, "Yes, Disable Mod", "No, Leave Mod Active")
				ActivateWinterIsComing()
			else
				MCM_CCOWinterIsComingDist.setValue(0)
				DIST_CCOWinterIsComing_ON.setValue(100)
				DIST_CCOWinterIsComing_OFF.setValue(0)
			Endif
		elseif MCM_CCOWinterIsComingDist.GetValueInt() == 0
			MCM_CCOWinterIsComingDist.setValue(1)
			DIST_CCOWinterIsComing_ON.setValue(0)
			DIST_CCOWinterIsComing_OFF.setValue(100)
		else
			MCM_CCOWinterIsComingDist.setValue(0)
			DIST_CCOWinterIsComing_ON.setValue(100)
			DIST_CCOWinterIsComing_OFF.setValue(0)
		endif
		ForcePageReset()
	elseif (option == OIDImmersiveArmorsCraft)
		if CCO_MODImmersiveArmors.GetValueInt() == 0
			CCO_MODImmersiveArmors.setValue(1)
		else
			CCO_MODImmersiveArmors.setValue(0)
		endif
		ForcePageReset()
	elseif (option == OIDImmersiveWeaponsCraft)
		if CCO_MODImmersiveWeapons.GetValueInt() == 0
			CCO_MODImmersiveWeapons.setValue(1)
		else
			CCO_MODImmersiveWeapons.setValue(0)
		endif
		ForcePageReset()
	elseif (option == OIDImmersiveJewelryCraft)
		if CCO_MODImmersiveJewelry.GetValueInt() == 0
			CCO_MODImmersiveJewelry.setValue(1)
		else
			CCO_MODImmersiveJewelry.setValue(0)
		endif
		ForcePageReset()
	elseif (option == OIDLearning)
		if CCO_LearningEnabled.GetValueInt() == 0
			CCO_LearningEnabled.setValue(1)
		else
			CCO_LearningEnabled.setValue(0)
		endif
		ForcePageReset()
	elseif (option == OIDAltSmithXPEnable)
		if AltXPVal == 0
			AltXPVal = 1
			CCO_AltXPPlayerAlias.ForceRefTo(Game.GetPlayer())
		else
			AltXPVal = 0
			CCO_AltXPPlayerAlias.Clear()
			If Game.GetPlayer().HasPerk(CCO_AltSmithingXPInitialMultPerk)
				Game.GetPlayer().RemovePerk(CCO_AltSmithingXPInitialMultPerk)
			endif
		endif
		SetToggleOptionValue(OIDAltSmithXPEnable, AltXPVal)
		forcepagereset()
	elseif (option == OIDBreakdownSmelt)
		if CCO_OptionBreakdownEquipmentatSmelter.GetValueInt() == 0
			CCO_OptionBreakdownEquipmentatSmelter.setValue(1)
		else
			CCO_OptionBreakdownEquipmentatSmelter.setValue(0)
		endif
		ForcePageReset()
	elseif (option == OIDBreakdownTanRack)
		if CCO_OptionBreakdownEquipmentatTanningRack.GetValueInt() == 0
			CCO_OptionBreakdownEquipmentatTanningRack.setValue(1)
		else
			CCO_OptionBreakdownEquipmentatTanningRack.setValue(0)
		endif
		ForcePageReset()
	elseif (option == OIDNonLore)
		if CCO_FantasyNonLoreRecipes.GetValueInt() == 0
			CCO_FantasyNonLoreRecipes.setValue(1)
		else
			CCO_FantasyNonLoreRecipes.setValue(0)
		endif
		ForcePageReset()
	elseif (option == OIDMaleOnly)
		if CCO_ArmorOnlyMALE.getValueInt() == 0
			CCO_ArmorOnlyMALE.setValue(1)
		else
			CCO_ArmorOnlyMALE.setValue(0)
		endif
		ForcePageReset()
	elseif (option == OIDFemaleOnly)
		if CCO_ArmorOnlyFEMALE.GetValueInt() == 0
			CCO_ArmorOnlyFEMALE.setValue(1)
		else
			CCO_ArmorOnlyFEMALE.setValue(0)
		endif
		ForcePageReset()
	elseif (option == OIDMiscTools)
		if CCO_MiscToolRecipes.GetValueInt() == 0
			CCO_MiscToolRecipes.setValue(1)
			ForcePageReset()
		else
			CCO_MiscToolRecipes.setValue(0)
			ForcePageReset()
		endif
	elseif (option == OIDOriental)
		if CCO_OrientalStyleRecipes.GetValueInt() == 0
			CCO_OrientalStyleRecipes.setValue(1)
			ForcePageReset()
		else
			CCO_OrientalStyleRecipes.setValue(0)
			ForcePageReset()
		endif
	elseif (option == OIDMSCirclets)
		if CCO_OptionArmoredCirclets.GetValueInt() == 0
			CCO_OptionArmoredCirclets.setValue(1)
			ForcePageReset()
		else
			CCO_OptionArmoredCirclets.setValue(0)
			ForcePageReset()
		endif
	elseif (option == OIDUnenchant)
		if CCO_OptionUnenchantedUniques.GetValueInt() == 0
			CCO_OptionUnenchantedUniques.setValue(1)
			ForcePageReset()
		else
			CCO_OptionUnenchantedUniques.setValue(0)
			ForcePageReset()
		endif
	elseif (option == OIDReplicas)
		if CCO_OptionArtifactReplicas.GetValueInt() == 0
			CCO_OptionArtifactReplicas.setValue(1)
			ForcePageReset()
		else
			CCO_OptionArtifactReplicas.setValue(0)
			ForcePageReset()
		endif
	elseif (option == OIDCorundumRename)
		if CorundumRename_CCO.GetValueInt() == 0
			CorundumRename_CCO.setValue(1)
			CCO_MCMStartupQuest.RenameCorundum()
			ForcePageReset()
		else
			CorundumRename_CCO.setValue(0)
			CCO_MCMStartupQuest.RenameCorundum()
			ForcePageReset()
		endif
	elseif (option == OIDMalachiteRename1)
		if MalachiteRenameGlass_CCO.GetValueInt() == 0
			MalachiteRenameGlass_CCO.setValue(1)
			MalachiteRenameMoldavite_CCO.setValue(0)
			CCO_MCMStartupQuest.RenameMalachite()
			ForcePageReset()
		else
			MalachiteRenameGlass_CCO.setValue(0)
			CCO_MCMStartupQuest.RenameMalachite()
			ForcePageReset()
		endif
	elseif (option == OIDMalachiteRename2)
		if MalachiteRenameMoldavite_CCO.GetValueInt() == 0
			MalachiteRenameMoldavite_CCO.setValue(1)
			MalachiteRenameGlass_CCO.setValue(0)
			CCO_MCMStartupQuest.RenameMalachite()
			ForcePageReset()
		else
			MalachiteRenameMoldavite_CCO.setValue(0)
			CCO_MCMStartupQuest.RenameMalachite()
			ForcePageReset()
		endif
	elseif (option == OIDQuicksilverRename)
		if QuicksilverRename_CCO.GetValueInt() == 0
			QuicksilverRename_CCO.setValue(1)
			CCO_MCMStartupQuest.RenameQuicksilver()
			ForcePageReset()
		else
			QuicksilverRename_CCO.setValue(0)
			CCO_MCMStartupQuest.RenameQuicksilver()
			ForcePageReset()
		endif
	elseif (option == OIDUninstallMod)
		SetTextOptionValue(option, "Uninstalling CCO")
		CCO_MCMStartupQuest.UninstallCCO()
		Debug.MessageBox("You may now save and deactivate Complete Crafting Overhaul")
		ForcePageReset()
	elseif (option == OIDLevelUp)
		SetTextOptionValue(option, "Upgrading Items")
		LevelUpSpell.Cast(Game.getPlayer())
	elseif (option == OIDLevelUpSpell)
		if PlayerHasLevelUpSpell_CCO.GetValueInt() == 0
			PlayerHasLevelUpSpell_CCO.setValue(1)
			Game.getPlayer().addspell(LevelUpSpell)
			ForcePageReset()
		else
			PlayerHasLevelUpSpell_CCO.setValue(0)
			Game.getPlayer().removespell(LevelUpSpell)
			ForcePageReset()
		endif
	elseif (option == OIDLevelUpAuto)
		if LevelUpSpellAutoRun_CCO.GetValueInt() == 0
			LevelUpSpellAutoRun_CCO.setValue(1)
			ForcePageReset()
		else
			LevelUpSpellAutoRun_CCO.setValue(0)
			ForcePageReset()
		endif
	elseif (option == OIDBandoliersOptions)
		if MCM_BandolierModStatus.getValue() == 0
			SetTextOptionValue(option, "Hide")
			MCM_BandolierModStatus.setValue(1)
		else
			SetTextOptionValue(option, "Show")
			MCM_BandolierModStatus.setValue(0)
		endif
	elseif (option == OIDBandoliersWorkbench)
		if MCM_BandolierWorkbench.getValue() == 0
			SetTextOptionValue(option, "Forge")
			MCM_BandolierWorkbench.setValue(1)
			CCO_MCMStartupQuest.BANSwitchWorkbench()
			ForcePageReset()
		else
			SetTextOptionValue(option, "Tanning Rack")
			MCM_BandolierWorkbench.setValue(0)
			CCO_MCMStartupQuest.BANSwitchWorkbench()
			ForcePageReset()
		endif
	elseif (option == OIDDawnguardWorkbench)
		if MCM_DawnguardWorkbench.getValue() == 0
			SetTextOptionValue(option, "Fort Dawnguard")
			MCM_DawnguardWorkbench.setValue(1)
			CCO_MCMStartupQuest.DawnguardSwitchWorkbench()
		else
			SetTextOptionValue(option, "At Any Forge")
			MCM_DawnguardWorkbench.setValue(0)
			CCO_MCMStartupQuest.DawnguardSwitchWorkbench()
		endif
	elseif (option == OIDDawnguardOnlyCrossbow)
		if MCM_CCOCrossbowsInWorld.getValue() == 0
			SetTextOptionValue(option, "Throughout Skyrim")
			MCM_CCOCrossbowsInWorld.setValue(1)
			DIST_CCOCrossbows_ON.setValue(0)
			DIST_CCOCrossbows_OFF.setValue(100)
			DIST_CCOCrossbowBolt_Chance.setValue(25)
		else
			SetTextOptionValue(option, "Dawnguard Only")
			MCM_CCOCrossbowsInWorld.setValue(0)
			DIST_CCOCrossbows_ON.setValue(100)
			DIST_CCOCrossbows_OFF.setValue(0)
			DIST_CCOCrossbowBolt_Chance.setValue(100)
		endif
	elseif (option == OIDFurRecipes)
		if CCO_OptionUseGenericFurPlate.getValue() == 0
			SetTextOptionValue(option, "Generic")
			CCO_OptionUseGenericFurPlate.setValue(1)
		else
			SetTextOptionValue(option, "Specific")
			CCO_OptionUseGenericFurPlate.setValue(0)
		endif
	elseif (option == OIDComplexity)
		if CCO_OptionComplexityLevel.getValue() == 0
			SetTextOptionValue(option, "Immersive")
			CCO_OptionComplexityLevel.setValue(1)
		else
			SetTextOptionValue(option, "Simplified")
			CCO_OptionComplexityLevel.setValue(0)
		endif
	elseif (option == OIDEnchantTweaks)
		if EnchantTweakToggleGV_CCO.GetValueInt() == 0
			EnchantTweakToggleGV_CCO.setValue(1)
			ForcePageReset()
		else
			EnchantTweakToggleGV_CCO.setValue(0)
			ForcePageReset()
		endif
	elseif (option == OIDTemperTweaks)
		if TemperTweakToggleGV_CCO.GetValueInt() == 0
			TemperTweakToggleGV_CCO.setValue(1)
			ForcePageReset()
		else
			TemperTweakToggleGV_CCO.setValue(0)
			ForcePageReset()
		endif
	elseif (option == OIDDaedricAtNight)
		if CCO_OptionCraftDaedricOnlyAtNight.GetValueInt() == 0
			CCO_OptionCraftDaedricOnlyAtNight.setValue(1)
			ForcePageReset()
		else
			CCO_OptionCraftDaedricOnlyAtNight.setValue(0)
			ForcePageReset()
		endif
	elseif (option == OIDInventoryConditions)
		if CCO_OptionDeclutterCraftingMenu.GetValueInt() == 0
			CCO_OptionDeclutterCraftingMenu.setValue(1)
			ForcePageReset()
		else
			CCO_OptionDeclutterCraftingMenu.setValue(0)
			ForcePageReset()
		endif
	elseif (option == OIDCCORecipes)
		if CCO_CCOAddedRecipes.GetValueInt() == 0
			CCO_CCOAddedRecipes.setValue(1)
			CCO_LearningEnabled.setValue(1)
			CCO_OptionArmoredCirclets.setValue(1)
			CCO_MODJewelCraft.setValue(1)
			if MCM_CCOJaysusInst.GetValueInt() == 1
				CCO_MODJaysusSwords.setValue(1)
			endif
			if MCM_CCOBandoliersInst.GetValueInt() == 1
				CCO_MODBandoliers.setValue(1)
			endif
			if MCM_CCOCloaksInst.GetValueInt() == 1
				CCO_MODCloaks.setValue(1)
			endif
			if MCM_CCOWinterIsComingInst.GetValueInt() == 1
				CCO_MODWinterIsComing.setValue(1)
			endif
			ForcePageReset()
		else
			CCO_CCOAddedRecipes.setValue(0)
			CCO_MODJaysusSwords.setValue(0)
			CCO_MODBandoliers.setValue(0)
			CCO_LearningEnabled.setValue(0)
			CCO_MODJewelCraft.setValue(0)
			CCO_OptionArmoredCirclets.setValue(0)
			CCO_MODCloaks.setValue(0)
			CCO_MODWinterIsComing.setValue(0)
			ForcePageReset()
		endif
	elseif (option == OIDBookofSilenceRace)
		if CCO_OptionRacialRestrictions.GetValueInt() == 0
			CCO_OptionRacialRestrictions.setValue(1)
			ForcePageReset()
		else
			CCO_OptionRacialRestrictions.setValue(0)
			ForcePageReset()
		endif
	elseif (option == OIDBookofSilenceCraft)
		if CCO_MODBookofSilence.GetValueInt() == 0
			CCO_MODBookofSilence.setValue(1)
			ForcePageReset()
		else
			CCO_MODBookofSilence.setValue(0)
			ForcePageReset()
		endif
	elseif (option == OIDSupportedMod)
		if CCO_MODSupported.GetValueInt() == 0
			CCO_MODSupported.setValue(1)
			ForcePageReset()
		else
			CCO_MODSupported.setValue(0)
			ForcePageReset()
		endif
	elseif (option == OIDHeavyArmoryCraft)
		if CCO_MODHeavyArmory.GetValueInt() == 0
			CCO_MODHeavyArmory.setValue(1)
			ForcePageReset()
		else
			CCO_MODHeavyArmory.setValue(0)
			ForcePageReset()
		endif

;	elseif (option == OIDTanningRackXP)
;		if SmithingXPTanningRackGV_CCO.GetValueInt() == 0
;			SmithingXPTanningRackGV_CCO.setValue(1)
			;Game.GetPlayer().addperk(CCO_SmithingXPTanningRackPerk)
;			ForcePageReset()
;		else
;			SmithingXPTanningRackGV_CCO.setValue(0)
			;Game.GetPlayer().removeperk(CCO_SmithingXPTanningRackPerk)
;			ForcePageReset()
;		endif
;	elseif (option == OIDSmelterXP)
;		if SmithingXPSmelterGV_CCO.GetValueInt() == 0
;			SmithingXPSmelterGV_CCO.setValue(1)
			;Game.GetPlayer().addperk(CCO_SmithingXPSmelterPerk)
;			ForcePageReset()
;		else
;			SmithingXPSmelterGV_CCO.setValue(0)
			;Game.GetPlayer().removeperk(CCO_SmithingXPSmelterPerk)
;			ForcePageReset()
;		endif
	elseif (option == OIDOreAmt)
		if OreRatioVal < 2
			OreRatioVal = OreRatioVal + 1
		else
			OreRatioVal = 0
		endif
		MCM_CCOOreSmeltingAmt.SetValue(OreRatioVal)
		SetTextOptionValue(option, OreRatioList[OreRatioVal])
	elseif (option == OIDCharcoalAmt)
		if CharcoalRatioVal == 0
			SetTextOptionValue(option, "1:1")
			CharcoalRatioVal = 1.0
			MCM_CCOCharcoalAmt.setValue(1)
		else
			SetTextOptionValue(option, "1:3")
			CharcoalRatioVal = 0.0
			MCM_CCOCharcoalAmt.setValue(0)
		endif
	endif
endEvent


event OnOptionSliderOpen(int option)
	if (option == OIDMiningStrikes)
		SetSliderDialogStartValue(MiningStrikesVal)
		SetSliderDialogDefaultValue(1.0)
		SetSliderDialogRange(1.0, 10.0)
		SetSliderDialogInterval(1.0)
	elseif (option == OIDMiningAttackStrikes)
		SetSliderDialogStartValue(MiningAttackStrikesVal)
		SetSliderDialogDefaultValue(3.0)
		SetSliderDialogRange(1.0, 20.0)
		SetSliderDialogInterval(1.0)
	elseif (option == OIDMiningOresDrop)
		SetSliderDialogStartValue(MiningOresDropVal)
		SetSliderDialogDefaultValue(1.0)
		SetSliderDialogRange(1.0, 10.0)
		SetSliderDialogInterval(1.0)
	elseif (option == OIDMiningOresTotal)
		SetSliderDialogStartValue(MiningOresTotalVal)
		SetSliderDialogDefaultValue(3.0)
		SetSliderDialogRange(1.0, 100.0)
		SetSliderDialogInterval(1.0)
	elseif (option == OIDGemChance)
		SetSliderDialogStartValue(GemChanceVal)
		SetSliderDialogDefaultValue(10.0)
		SetSliderDialogRange(0.0, 100.0)
		SetSliderDialogInterval(1.0)
	elseif (option == OIDFlawlessChance)
		SetSliderDialogStartValue(FlawlessChanceVal)
		SetSliderDialogDefaultValue(20.0)
		SetSliderDialogRange(1.0, 30.0)
		SetSliderDialogInterval(1.0)
	elseif (option == OIDFirewoodPerUse)
		SetSliderDialogStartValue(FirewoodPerUseVal)
		SetSliderDialogDefaultValue(2.0)
		SetSliderDialogRange(1.0, 10.0)
		SetSliderDialogInterval(1.0)
	elseif (option == OIDFirewoodMax)
		SetSliderDialogStartValue(FirewoodMaxVal)
		SetSliderDialogDefaultValue(6.0)
		SetSliderDialogRange(1.0, 100.0)
		SetSliderDialogInterval(1.0)
	elseif (option == OIDLearningReq)
		SetSliderDialogStartValue(LearningReqVal)
		SetSliderDialogDefaultValue(100.0)
		SetSliderDialogRange(0.0, 500.0)
		SetSliderDialogInterval(25.0)
	elseif (option == OIDAltSmithXPInitMult)
		SetSliderDialogStartValue(VanillaXPModVal)
		SetSliderDialogDefaultValue(0.5)
		SetSliderDialogRange(0.1, 1.0)
		SetSliderDialogInterval(0.1)
	elseif (option == OIDAltSmithXPBonusMult)
		SetSliderDialogStartValue(BonusMultVal)
		SetSliderDialogDefaultValue(53.0)
		SetSliderDialogRange(0.0, 100.0)
		SetSliderDialogInterval(1.0)
	elseif (option == OIDAltSmithXPBonusExp)
		SetSliderDialogStartValue(BonusExpVal)
		SetSliderDialogDefaultValue(0.5)
		SetSliderDialogRange(0.1, 0.5)
		SetSliderDialogInterval(0.1)
	elseif (option == OIDSmelterXP)
		SetSliderDialogStartValue(ExpSmelterVal)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(0.0, 1.0)
		SetSliderDialogInterval(0.1)
	elseif (option == OIDTanningRackXP)
		SetSliderDialogStartValue(ExpTanningVal)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(0.0, 1.0)
		SetSliderDialogInterval(0.1)
	elseif (option == OIDExperienceMining)
		SetSliderDialogStartValue(ExpMiningVal)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(0.0, 50.0)
		SetSliderDialogInterval(1.0)
	elseif (option == OIDBandoliersDistChance)
		SetSliderDialogStartValue(BandolierChanceVal)
		SetSliderDialogDefaultValue(10.0)
		SetSliderDialogRange(0.0, 100.0)
		SetSliderDialogInterval(1.0)
	elseif (option == OIDCloakBanditDistChance)
		SetSliderDialogStartValue(CloakBanditChanceVal)
		SetSliderDialogDefaultValue(15.0)
		SetSliderDialogRange(0.0, 100.0)
		SetSliderDialogInterval(1.0)
	elseif (option == OIDCloakForswornDistChance)
		SetSliderDialogStartValue(CloakForswornChanceVal)
		SetSliderDialogDefaultValue(15.0)
		SetSliderDialogRange(0.0, 100.0)
		SetSliderDialogInterval(1.0)
	elseif (option == OIDCloakGuardDistChance)
		SetSliderDialogStartValue(CloakGuardChanceVal)
		SetSliderDialogDefaultValue(65.0)
		SetSliderDialogRange(0.0, 100.0)
		SetSliderDialogInterval(1.0)
	elseif (option == OIDCloakHunterDistChance)
		SetSliderDialogStartValue(CloakHunterChanceVal)
		SetSliderDialogDefaultValue(25.0)
		SetSliderDialogRange(0.0, 100.0)
		SetSliderDialogInterval(1.0)
	elseif (option == OIDCloakImperialDistChance)
		SetSliderDialogStartValue(CloakImperialChanceVal)
		SetSliderDialogDefaultValue(50.0)
		SetSliderDialogRange(0.0, 100.0)
		SetSliderDialogInterval(1.0)
	elseif (option == OIDCloakNecroDistChance)
		SetSliderDialogStartValue(CloakNecroChanceVal)
		SetSliderDialogDefaultValue(35.0)
		SetSliderDialogRange(0.0, 100.0)
		SetSliderDialogInterval(1.0)
	elseif (option == OIDCloakThalmorDistChance)
		SetSliderDialogStartValue(CloakThalmorChanceVal)
		SetSliderDialogDefaultValue(10.0)
		SetSliderDialogRange(0.0, 100.0)
		SetSliderDialogInterval(1.0)
	elseif (option == OIDCloakVampireDistChance)
		SetSliderDialogStartValue(CloakVampireChanceVal)
		SetSliderDialogDefaultValue(35.0)
		SetSliderDialogRange(0.0, 100.0)
		SetSliderDialogInterval(1.0)
	elseif (option == OIDCloakMiscDistChance)
		SetSliderDialogStartValue(CloakMiscChanceVal)
		SetSliderDialogDefaultValue(35.0)
		SetSliderDialogRange(0.0, 100.0)
		SetSliderDialogInterval(1.0)
	elseif (option == OIDEnchClothing)
		SetSliderDialogStartValue(EnchClothingVal)
		SetSliderDialogDefaultValue(50.0)
		SetSliderDialogRange(0.0, 100.0)
		SetSliderDialogInterval(5.0)
	elseif (option == OIDEnchBody)
		SetSliderDialogStartValue(EnchBodyVal)
		SetSliderDialogDefaultValue(25.0)
		SetSliderDialogRange(0.0, 50.0)
		SetSliderDialogInterval(5.0)
	elseif (option == OIDEnchMinor)
		SetSliderDialogStartValue(EnchMinorVal)
		SetSliderDialogDefaultValue(-25.0)
		SetSliderDialogRange(-50.0, 0.0)
		SetSliderDialogInterval(5.0)
	elseif (option == OIDEnchJewelry)
		SetSliderDialogStartValue(EnchJewelryVal)
		SetSliderDialogDefaultValue(10.0)
		SetSliderDialogRange(0.0, 100.0)
		SetSliderDialogInterval(5.0)
	elseif (option == OIDEnchJewelryEx)
		SetSliderDialogStartValue(EnchJewelryExVal)
		SetSliderDialogDefaultValue(10.0)
		SetSliderDialogRange(0.0, 100.0)
		SetSliderDialogInterval(5.0)
	elseif (option == OIDEnchJewelryEq)
		SetSliderDialogStartValue(EnchJewelryEqVal)
		SetSliderDialogDefaultValue(10.0)
		SetSliderDialogRange(0.0, 100.0)
		SetSliderDialogInterval(5.0)
	elseif (option == OIDEnchDaggers)
		SetSliderDialogStartValue(EnchDaggersVal)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-50.0, 50.0)
		SetSliderDialogInterval(10.0)
	elseif (option == OIDEnchBows)
		SetSliderDialogStartValue(EnchBowsVal)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-50.0, 50.0)
		SetSliderDialogInterval(10.0)
	elseif (option == OIDEnch1Hand)
		SetSliderDialogStartValue(Ench1HandVal)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-50.0, 50.0)
		SetSliderDialogInterval(10.0)
	elseif (option == OIDEnch2Hand)
		SetSliderDialogStartValue(Ench2HandVal)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-50.0, 50.0)
		SetSliderDialogInterval(10.0)
	elseif (option == OIDEnchAccessory)
		SetSliderDialogStartValue(EnchAccessoryVal)
		SetSliderDialogDefaultValue(-50.0)
		SetSliderDialogRange(-50.0, 0.0)
		SetSliderDialogInterval(5.0)
	elseif (option == OIDTemperBase)
		SetSliderDialogStartValue(TempBaseVal)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-50.0, 0.0)
		SetSliderDialogInterval(5.0)
	elseif (option == OIDTemperDagger)
		SetSliderDialogStartValue(TempDaggerVal)
		SetSliderDialogDefaultValue(-15.0)
		SetSliderDialogRange(-50.0, 50.0)
		SetSliderDialogInterval(10.0)
	elseif (option == OIDTemperBow)
		SetSliderDialogStartValue(TempBowVal)
		SetSliderDialogDefaultValue(-10.0)
		SetSliderDialogRange(-50.0, 50.0)
		SetSliderDialogInterval(10.0)
	elseif (option == OIDTemper2Hand)
		SetSliderDialogStartValue(Temp2HandVal)
		SetSliderDialogDefaultValue(15.0)
		SetSliderDialogRange(-50.0, 50.0)
		SetSliderDialogInterval(10.0)
	elseif (option == OIDTemperLArmor)
		SetSliderDialogStartValue(TempLArmorVal)
		SetSliderDialogDefaultValue(-10.0)
		SetSliderDialogRange(-50.0, 0.0)
		SetSliderDialogInterval(5.0)
	elseif (option == OIDTemperHide)
		SetSliderDialogStartValue(TempHideVal)
		SetSliderDialogDefaultValue(-15.0)
		SetSliderDialogRange(-50.0, 0.0)
		SetSliderDialogInterval(5.0)
	elseif (option == OIDTemperShields)
		SetSliderDialogStartValue(TempShieldVal)
		SetSliderDialogDefaultValue(30.0)
		SetSliderDialogRange(-50.0, 50.0)
		SetSliderDialogInterval(10.0)
	elseif (option == OIDTemperCuirass)
		SetSliderDialogStartValue(TempCuirassVal)
		SetSliderDialogDefaultValue(20.0)
		SetSliderDialogRange(-50.0, 50.0)
		SetSliderDialogInterval(10.0)
	elseif (option == OIDTemperGauntlets)
		SetSliderDialogStartValue(TempGauntletVal)
		SetSliderDialogDefaultValue(-20.0)
		SetSliderDialogRange(-50.0, 50.0)
		SetSliderDialogInterval(10.0)
	elseif (option == OIDBandoliersEnchantSmall)
		SetSliderDialogStartValue(BandolierSmallVal)
		SetSliderDialogDefaultValue(5.0)
		SetSliderDialogRange(5.0, 100.0)
		SetSliderDialogInterval(5.0)
	elseif (option == OIDBandoliersEnchantMed)
		SetSliderDialogStartValue(BandolierMedVal)
		SetSliderDialogDefaultValue(10.0)
		SetSliderDialogRange(5.0, 100.0)
		SetSliderDialogInterval(5.0)
	elseif (option == OIDBandoliersEnchantLarge)
		SetSliderDialogStartValue(BandolierLargeVal)
		SetSliderDialogDefaultValue(15.0)
		SetSliderDialogRange(5.0, 100.0)
		SetSliderDialogInterval(5.0)
	elseif (option == OIDBandoliersEnchantXLarge)
		SetSliderDialogStartValue(BandolierXLargeVal)
		SetSliderDialogDefaultValue(20.0)
		SetSliderDialogRange(5.0, 100.0)
		SetSliderDialogInterval(5.0)
	elseif (option == OIDSilverWeap)
		SetSliderDialogStartValue(SilverWeapVal)
		SetSliderDialogDefaultValue(30.0)
		SetSliderDialogRange(0.0, 50.0)
		SetSliderDialogInterval(10.0)
	elseif (option == OIDSilverArmor)
		SetSliderDialogStartValue(SilverArmorVal)
		SetSliderDialogDefaultValue(5.0)
		SetSliderDialogRange(0.0, 25.0)
		SetSliderDialogInterval(5.0)
	elseif (option == OIDGoldArmor)
		SetSliderDialogStartValue(GoldArmorVal)
		SetSliderDialogDefaultValue(5.0)
		SetSliderDialogRange(0.0, 25.0)
		SetSliderDialogInterval(5.0)
	elseif (option == OIDStalhrimEnch)
		SetSliderDialogStartValue(StalhrimEnchVal)
		SetSliderDialogDefaultValue(10.0)
		SetSliderDialogRange(0.0, 25.0)
		SetSliderDialogInterval(5.0)
	elseif (option == OIDPRUFEIProtectEquip)
		SetSliderDialogStartValue(PRUFEIEquipVal)
		SetSliderDialogDefaultValue(1.0)
		SetSliderDialogRange(0.0, 100.0)
		SetSliderDialogInterval(1.0)
	elseif (option == OIDPRUFEIProtectFavor)
		SetSliderDialogStartValue(PRUFEIFavorVal)
		SetSliderDialogDefaultValue(1.0)
		SetSliderDialogRange(0.0, 100.0)
		SetSliderDialogInterval(1.0)
	endif
endevent


event OnOptionSliderAccept(int option, float value)
	if (option == OIDMiningStrikes)
		MiningStrikesVal = value
		SetSliderOptionValue(OIDMiningStrikes, MiningStrikesVal as int, "{0}")
		StrikesBeforeCollectionGV_CCO.Setvalue(MiningStrikesVal)
	elseif (option == OIDMiningAttackStrikes)
		MiningAttackStrikesVal = value
		SetSliderOptionValue(OIDMiningAttackStrikes, MiningAttackStrikesVal as int, "{0}")
		AttackStrikesBeforeCollectionGV_CCO.Setvalue(MiningAttackStrikesVal)
	elseif (option == OIDMiningOresDrop)
		MiningOresDropVal = value
		SetSliderOptionValue(OIDMiningOresDrop, MiningOresDropVal as int, "{0}")
		ResourceCountGV_CCO.Setvalue(MiningOresDropVal)
	elseif (option == OIDMiningOresTotal)
		MiningOresTotalVal = value
		SetSliderOptionValue(OIDMiningOresTotal, MiningOresTotalVal as int, "{0}")
		ResourceCountTotalGV_CCO.Setvalue(MiningOresTotalVal)
	elseif (option == OIDGemChance)
		GemChanceVal = value
		SetSliderOptionValue(OIDGemChance, GemChanceVal as int, "{0}%")
		int ChanceNone = 100 - (GemChanceVal as int)
		MiningGemChanceGV_CCO.Setvalue(ChanceNone)
	elseif (option == OIDFlawlessChance)
		FlawlessChanceVal = value
		SetSliderOptionValue(OIDFlawlessChance, FlawlessChanceVal as int, "{0}%")
		FlawlessGemChance_CCO.Setvalue(FlawlessChanceVal)
	elseif (option == OIDFirewoodPerUse)
		FirewoodPerUseVal = value
		SetSliderOptionValue(OIDFirewoodPerUse, FirewoodPerUseVal as int, "{0}")
		FirewoodResourcePerUseGV_CCO.Setvalue(FirewoodPerUseVal)
	elseif (option == OIDFirewoodMax)
		FirewoodMaxVal = value
		SetSliderOptionValue(OIDFirewoodMax, FirewoodMaxVal as int, "{0}")
		FirewoodResourceMaxGV_CCO.Setvalue(FirewoodMaxVal)
	elseif (option == OIDLearningReq)
		LearningReqVal = value
		SetSliderOptionValue(OIDLearningReq, LearningReqVal as int, "{0}")
		CCO_LearningRequiredtoSmith.Setvalue(LearningReqVal)
	elseif (option == OIDAltSmithXPInitMult)
		VanillaXPModVal = value
		SetSliderOptionValue(OIDAltSmithXPInitMult, VanillaXPModVal as float, "{1}")
		CCO_AltSmithingXPInitialMultGV.Setvalue(VanillaXPModVal)
	elseif (option == OIDAltSmithXPBonusMult)
		BonusMultVal = value
		SetSliderOptionValue(OIDAltSmithXPBonusMult, BonusMultVal as int, "{0}")
		CCO_AltSmithingXPBonusMultGV.Setvalue(BonusMultVal)
	elseif (option == OIDAltSmithXPBonusExp)
		BonusExpVal = value
		SetSliderOptionValue(OIDAltSmithXPBonusExp, BonusExpVal as float, "{1}")
		CCO_AltSmithingXPBonusExpGV.Setvalue(BonusExpVal)
	elseif (option == OIDSmelterXP)
		ExpSmelterVal = value
		SetSliderOptionValue(OIDSmelterXP, ExpSmelterVal as float, "{1}")
		SmithingXPSmelterGV_CCO.SetValue(ExpSmelterVal)
	elseif (option == OIDTanningRackXP)
		ExpTanningVal = value
		SetSliderOptionValue(OIDTanningRackXP, ExpTanningVal as float, "{1}")
		SmithingXPTanningRackGV_CCO.SetValue(ExpTanningVal)
	elseif (option == OIDExperienceMining)
		ExpMiningVal = value
		SetSliderOptionValue(OIDExperienceMining, ExpMiningVal as int, "{0}")
		MiningSkillIncreaseGV_CCO.SetValue(ExpMiningVal)
	elseif (option == OIDBandoliersDistChance)
		BandolierChanceVal = value
		SetSliderOptionValue(OIDBandoliersDistChance, BandolierChanceVal as int, "{0}%")
		DIST_CCOBandoliersChance.Setvalue(100-BandolierChanceVal)
	elseif (option == OIDCloakBanditDistChance)
		CloakBanditChanceVal = value
		SetSliderOptionValue(OIDCloakBanditDistChance, CloakBanditChanceVal as int, "{0}%")
		DIST_CCOCloaksBanditChance.Setvalue(100-CloakBanditChanceVal)
		if CloakBanditChanceVal == 0
			DIST_CCOCloaksBanditBossChance.Setvalue(100)
		else
			int BanBossChance = (CloakBanditChanceVal+30) as int
			if BanBossChance > 100
				DIST_CCOCloaksBanditBossChance.Setvalue(0)
			else
				DIST_CCOCloaksBanditBossChance.Setvalue(100-BanBossChance)
			endif
		endif
	elseif (option == OIDCloakThalmorDistChance)
		CloakThalmorChanceVal = value
		SetSliderOptionValue(OIDCloakThalmorDistChance, CloakThalmorChanceVal as int, "{0}%")
		DIST_CCOCloaksThalmorChance.Setvalue(100-CloakThalmorChanceVal)
		if CloakThalmorChanceVal == 0
			DIST_CCOCloaksThalmorBossChance.Setvalue(100)
		else
			int ThalBossChance = (CloakThalmorChanceVal+65) as int
			if ThalBossChance > 100
				DIST_CCOCloaksThalmorBossChance.Setvalue(0)
			else
				DIST_CCOCloaksThalmorBossChance.Setvalue(100-ThalBossChance)
			endif
		endif
	elseif (option == OIDCloakForswornDistChance)
		CloakForswornChanceVal = value
		SetSliderOptionValue(OIDCloakForswornDistChance, CloakForswornChanceVal as int, "{0}%")
		DIST_CCOCloaksForswornChance.Setvalue(100-CloakForswornChanceVal)
	elseif (option == OIDCloakGuardDistChance)
		CloakGuardChanceVal = value
		SetSliderOptionValue(OIDCloakGuardDistChance, CloakGuardChanceVal as int, "{0}%")
		DIST_CCOCloaksGuardChance.Setvalue(100-CloakGuardChanceVal)
	elseif (option == OIDCloakHunterDistChance)
		CloakHunterChanceVal = value
		SetSliderOptionValue(OIDCloakHunterDistChance, CloakHunterChanceVal as int, "{0}%")
		DIST_CCOCloaksHunterChance.Setvalue(100-CloakHunterChanceVal)
	elseif (option == OIDCloakImperialDistChance)
		CloakImperialChanceVal = value
		SetSliderOptionValue(OIDCloakImperialDistChance, CloakImperialChanceVal as int, "{0}%")
		DIST_CCOCloaksImperialChance.Setvalue(100-CloakImperialChanceVal)
	elseif (option == OIDCloakNecroDistChance)
		CloakNecroChanceVal = value
		SetSliderOptionValue(OIDCloakNecroDistChance, CloakNecroChanceVal as int, "{0}%")
		DIST_CCOCloaksNecroChance.Setvalue(100-CloakNecroChanceVal)
	elseif (option == OIDCloakVampireDistChance)
		CloakVampireChanceVal = value
		SetSliderOptionValue(OIDCloakVampireDistChance, CloakVampireChanceVal as int, "{0}%")
		DIST_CCOCloaksVampireChance.Setvalue(100-CloakVampireChanceVal)
	elseif (option == OIDCloakMiscDistChance)
		CloakMiscChanceVal = value
		SetSliderOptionValue(OIDCloakMiscDistChance, CloakMiscChanceVal as int, "{0}%")
		DIST_CCOCloaksCommonChance.Setvalue(100-CloakMiscChanceVal)
	elseif (option == OIDEnchClothing)
		EnchClothingVal = value
		SetSliderOptionValue(OIDEnchClothing, EnchClothingVal as int, "{0}%")
		EnchantTweakClothingGV_CCO.SetValue(EnchClothingVal)
	elseif (option == OIDEnchBody)
		EnchBodyVal = value
		SetSliderOptionValue(OIDEnchBody, EnchBodyVal as int, "{0}%")
		EnchantTweakCuirassGV_CCO.SetValue(EnchBodyVal)
	elseif (option == OIDEnchMinor)
		EnchMinorVal = value
		SetSliderOptionValue(OIDEnchMinor, EnchMinorVal as int, "{0}%")
		EnchantTweakArmorMinorPiecesGV_CCO.SetValue(EnchMinorVal)
	elseif (option == OIDEnchJewelry)
		EnchJewelryVal = value
		SetSliderOptionValue(OIDEnchJewelry, EnchJewelryVal as int, "{0}%")
		EnchantTweakJewelryGV_CCO.SetValue(EnchJewelryVal)
	elseif (option == OIDEnchJewelryEx)
		EnchJewelryExVal = value
		SetSliderOptionValue(OIDEnchJewelryEx, EnchJewelryExVal as int, "{0}%")
		EnchantTweakJewelryExpensiveGV_CCO.SetValue(EnchJewelryExVal)
	elseif (option == OIDEnchJewelryEq)
		EnchJewelryEqVal = value
		SetSliderOptionValue(OIDEnchJewelryEq, EnchJewelryEqVal as int, "{0}%")
		EnchantTweakJewelryExquisiteGV_CCO.SetValue(EnchJewelryEqVal)
	elseif (option == OIDEnchDaggers)
		EnchDaggersVal = value
		SetSliderOptionValue(OIDEnchDaggers, EnchDaggersVal as int, "{0}%")
		EnchantTweakDaggersGV_CCO.SetValue(EnchDaggersVal)
	elseif (option == OIDEnchBows)
		EnchBowsVal = value
		SetSliderOptionValue(OIDEnchBows, EnchBowsVal as int, "{0}%")
		EnchantTweakBowsGV_CCO.SetValue(EnchBowsVal)
	elseif (option == OIDEnch1Hand)
		Ench1HandVal = value
		SetSliderOptionValue(OIDEnch1Hand, Ench1HandVal as int, "{0}%")
		EnchantTweakOneHandGV_CCO.SetValue(Ench1HandVal)
	elseif (option == OIDEnch2Hand)
		Ench2HandVal = value
		SetSliderOptionValue(OIDEnch2Hand, Ench2HandVal as int, "{0}%")
		EnchantTweakTwoHandGV_CCO.SetValue(Ench2HandVal)
	elseif (option == OIDEnchAccessory)
		EnchAccessoryVal = value
		SetSliderOptionValue(OIDEnchAccessory, EnchAccessoryVal as int, "{0}%")
		EnchantTweakAccessoriesGV_CCO.SetValue(EnchAccessoryVal)
	elseif (option == OIDTemperBase)
		TempBaseVal = value
		SetSliderOptionValue(OIDTemperBase, TempBaseVal as int, "{0}%")
		TemperTweakBaselineGV_CCO.SetValue(TempBaseVal)
	elseif (option == OIDTemperDagger)
		TempDaggerVal = value
		SetSliderOptionValue(OIDTemperDagger, TempDaggerVal as int, "{0}%")
		TemperTweakDaggersGV_CCO.SetValue(TempDaggerVal)
	elseif (option == OIDTemperBow)
		TempBowVal = value
		SetSliderOptionValue(OIDTemperBow, TempBowVal as int, "{0}%")
		TemperTweakBowsGV_CCO.SetValue(TempBowVal)
	elseif (option == OIDTemper2Hand)
		Temp2HandVal = value
		SetSliderOptionValue(OIDTemper2Hand, Temp2HandVal as int, "{0}%")
		EnchantTweakTwoHandGV_CCO.SetValue(Temp2HandVal)
	elseif (option == OIDTemperLArmor)
		TempLArmorVal = value
		SetSliderOptionValue(OIDTemperLArmor, TempLArmorVal as int, "{0}%")
		TemperTweakLightArmorGV_CCO.SetValue(TempLArmorVal)
	elseif (option == OIDTemperHide)
		TempHideVal = value
		SetSliderOptionValue(OIDTemperHide, TempHideVal as int, "{0}%")
		TemperTweakLeatherHideArmorGV_CCO.SetValue(TempHideVal)
	elseif (option == OIDTemperShields)
		TempShieldVal = value
		SetSliderOptionValue(OIDTemperShields, TempShieldVal as int, "{0}%")
		TemperTweakShieldsGV_CCO.SetValue(TempShieldVal)
	elseif (option == OIDTemperCuirass)
		TempCuirassVal = value
		SetSliderOptionValue(OIDTemperCuirass, TempCuirassVal as int, "{0}%")
		TemperTweakCuirassGV_CCO.SetValue(TempCuirassVal)
	elseif (option == OIDTemperGauntlets)
		TempGauntletVal = value
		SetSliderOptionValue(OIDTemperGauntlets, TempGauntletVal as int, "{0}%")
		TemperTweakGauntletsGV_CCO.SetValue(TempGauntletVal)
	elseif (option == OIDBandoliersEnchantSmall)
		BandolierSmallVal = value
		SetSliderOptionValue(OIDBandoliersEnchantSmall, BandolierSmallVal as int, "{0}")
		int pSelectedEnchant = (BandolierSmallVal/5) as int
		MCM_CCOBandoliersEnchSmall.SetValue(pSelectedEnchant)
		CCO_MCMStartupQuest.BANSwitchEnchantment(BAN_ItemList_Small, pSelectedEnchant)
	elseif (option == OIDBandoliersEnchantMed)
		BandolierMedVal = value
		SetSliderOptionValue(OIDBandoliersEnchantMed, BandolierMedVal as int, "{0}")
		int pSelectedEnchant = (BandolierMedVal/5) as int
		MCM_CCOBandoliersEnchMed.SetValue(pSelectedEnchant)
		CCO_MCMStartupQuest.BANSwitchEnchantment(BAN_ItemList_Med, pSelectedEnchant)
	elseif (option == OIDBandoliersEnchantLarge)
		BandolierLargeVal = value
		SetSliderOptionValue(OIDBandoliersEnchantLarge, BandolierLargeVal as int, "{0}")
		int pSelectedEnchant = (BandolierLargeVal/5) as int
		MCM_CCOBandoliersEnchLarge.SetValue(pSelectedEnchant)
		CCO_MCMStartupQuest.BANSwitchEnchantment(BAN_ItemList_Large, pSelectedEnchant)
	elseif (option == OIDBandoliersEnchantXLarge)
		BandolierXLargeVal = value
		SetSliderOptionValue(OIDBandoliersEnchantXLarge, BandolierXLargeVal as int, "{0}")
		int pSelectedEnchant = (BandolierXLargeVal/5) as int
		MCM_CCOBandoliersEnchXLarge.SetValue(pSelectedEnchant)
		CCO_MCMStartupQuest.BANSwitchEnchantment(BAN_ItemList_XLarge, pSelectedEnchant)
	elseif (option == OIDSilverWeap)
		SilverWeapVal = value
		SetSliderOptionValue(OIDSilverWeap, SilverWeapVal as int, "{0}%")
		MCM_CCOSilverWeaponPerk.SetValue(SilverWeapVal)
	elseif (option == OIDSilverArmor)
		SilverArmorVal = value
		SetSliderOptionValue(OIDSilverArmor, SilverArmorVal as int, "{0}%")
		MCM_CCOSilverArmorPerk.SetValue(SilverArmorVal)
	elseif (option == OIDGoldArmor)
		GoldArmorVal = value
		SetSliderOptionValue(OIDGoldArmor, GoldArmorVal as int, "{0}%")
		MCM_CCOGoldArmorPerk.SetValue(GoldArmorVal)
	elseif (option == OIDStalhrimEnch)
		StalhrimEnchVal = value
		SetSliderOptionValue(OIDStalhrimEnch, StalhrimEnchVal as int, "{0}%")
		MCM_CCOStalhrimEnchPerk.SetValue(StalhrimEnchVal)
	elseif (option == OIDPRUFEIProtectEquip)
		PRUFEIEquipVal = value
		SetSliderOptionValue(OIDPRUFEIProtectEquip, PRUFEIEquipVal as int, "{0}")
		PRUFEI_EquippedProtectedAmt.SetValue(PRUFEIEquipVal as int)
	elseif (option == OIDPRUFEIProtectFavor)
		PRUFEIFavorVal = value
		SetSliderOptionValue(OIDPRUFEIProtectFavor, PRUFEIFavorVal as int, "{0}")
		PRUFEI_FavoriteProtectedAmt.SetValue(PRUFEIFavorVal as int)
	endif
endevent


event OnOptionDefault(int option)
	if (option == OIDMiningStrikes)
		MiningStrikesVal = 1
		SetSliderOptionValue(OIDMiningStrikes, MiningStrikesVal as int, "{0}")
		StrikesBeforeCollectionGV_CCO.Setvalue(MiningStrikesVal)
	elseif (option == OIDMiningAttackStrikes)
		MiningAttackStrikesVal = 3
		SetSliderOptionValue(OIDMiningAttackStrikes, MiningAttackStrikesVal as int, "{0}")
		AttackStrikesBeforeCollectionGV_CCO.Setvalue(MiningAttackStrikesVal)
	elseif (option == OIDMiningOresDrop)
		MiningOresDropVal = 1
		SetSliderOptionValue(OIDMiningOresDrop, MiningOresDropVal as int, "{0}")
		ResourceCountGV_CCO.Setvalue(MiningOresDropVal)
	elseif (option == OIDMiningOresTotal)
		MiningOresTotalVal = 3
		SetSliderOptionValue(OIDMiningOresTotal, MiningOresTotalVal as int, "{0}")
		ResourceCountTotalGV_CCO.Setvalue(MiningOresTotalVal)
	elseif (option == OIDGemChance)
		GemChanceVal = 10
		SetSliderOptionValue(OIDGemChance, GemChanceVal as int, "{0}%")
		MiningGemChanceGV_CCO.Setvalue(90)
	elseif (option == OIDFlawlessChance)
		FlawlessChanceVal = 20
		SetSliderOptionValue(OIDFlawlessChance, FlawlessChanceVal as int, "{0}%")
		FlawlessGemChance_CCO.Setvalue(20)
	elseif (option == OIDFirewoodPerUse)
		FirewoodPerUseVal = 2
		SetSliderOptionValue(OIDFirewoodPerUse, FirewoodPerUseVal as int, "{0}")
		FirewoodResourcePerUseGV_CCO.Setvalue(FirewoodPerUseVal)
	elseif (option == OIDFirewoodMax)
		FirewoodMaxVal = 6
		SetSliderOptionValue(OIDFirewoodMax, FirewoodMaxVal as int, "{0}")
		FirewoodResourceMaxGV_CCO.Setvalue(FirewoodMaxVal)
	elseif (option == OIDLearningReq)
		LearningReqVal = 100
		SetSliderOptionValue(OIDLearningReq, LearningReqVal as int, "{0}")
		CCO_LearningRequiredtoSmith.Setvalue(LearningReqVal)
	elseif (option == OIDAltSmithXPInitMult)
		VanillaXPModVal = 0.5
		SetSliderOptionValue(OIDAltSmithXPInitMult, VanillaXPModVal, "{1}")
		CCO_AltSmithingXPInitialMultGV.Setvalue(VanillaXPModVal)
	elseif (option == OIDAltSmithXPBonusMult)
		BonusMultVal = 53
		SetSliderOptionValue(OIDAltSmithXPBonusMult, BonusMultVal as int, "{0}")
		CCO_AltSmithingXPBonusMultGV.Setvalue(BonusMultVal)
	elseif (option == OIDAltSmithXPBonusExp)
		BonusExpVal = 0.5
		SetSliderOptionValue(OIDAltSmithXPBonusExp, BonusExpVal, "{1}")
		CCO_AltSmithingXPBonusExpGV.Setvalue(BonusExpVal)
	elseif (option == OIDSmelterXP)
		ExpSmelterVal = 0.0
		SetSliderOptionValue(OIDSmelterXP, ExpSmelterVal, "{1}")
		SmithingXPSmelterGV_CCO.SetValue(ExpSmelterVal)
	elseif (option == OIDTanningRackXP)
		ExpTanningVal = 0.0
		SetSliderOptionValue(OIDTanningRackXP, ExpTanningVal, "{1}")
		SmithingXPTanningRackGV_CCO.SetValue(ExpTanningVal)
	elseif (option == OIDExperienceMining)
		ExpMiningVal = 0
		SetSliderOptionValue(OIDExperienceMining, ExpMiningVal as int, "{0}")
		MiningSkillIncreaseGV_CCO.Setvalue(ExpMiningVal)
	elseif (option == OIDBandoliersDistChance)
		BandolierChanceVal = 10
		SetSliderOptionValue(OIDBandoliersDistChance, BandolierChanceVal as int, "{0}%")
		DIST_CCOBandoliersChance.Setvalue(100-BandolierChanceVal)
	elseif (option == OIDCloakBanditDistChance)
		CloakBanditChanceVal = 15
		SetSliderOptionValue(OIDCloakBanditDistChance, CloakBanditChanceVal as int, "{0}%")
		DIST_CCOCloaksBanditChance.Setvalue(85)
		DIST_CCOCloaksBanditBossChance.Setvalue(55)
	elseif (option == OIDCloakThalmorDistChance)
		CloakThalmorChanceVal = 10
		SetSliderOptionValue(OIDCloakThalmorDistChance, CloakThalmorChanceVal as int, "{0}%")
		DIST_CCOCloaksThalmorChance.Setvalue(90)
		DIST_CCOCloaksThalmorBossChance.Setvalue(25)
	elseif (option == OIDCloakForswornDistChance)
		CloakForswornChanceVal = 15
		SetSliderOptionValue(OIDCloakForswornDistChance, CloakForswornChanceVal as int, "{0}%")
		DIST_CCOCloaksForswornChance.Setvalue(85)
	elseif (option == OIDCloakGuardDistChance)
		CloakGuardChanceVal = 65
		SetSliderOptionValue(OIDCloakGuardDistChance, CloakGuardChanceVal as int, "{0}%")
		DIST_CCOCloaksGuardChance.Setvalue(35)
	elseif (option == OIDCloakHunterDistChance)
		CloakHunterChanceVal = 25
		SetSliderOptionValue(OIDCloakHunterDistChance, CloakHunterChanceVal as int, "{0}%")
		DIST_CCOCloaksHunterChance.Setvalue(75)
	elseif (option == OIDCloakImperialDistChance)
		CloakImperialChanceVal = 50
		SetSliderOptionValue(OIDCloakImperialDistChance, CloakImperialChanceVal as int, "{0}%")
		DIST_CCOCloaksImperialChance.Setvalue(50)
	elseif (option == OIDCloakNecroDistChance)
		CloakNecroChanceVal = 35
		SetSliderOptionValue(OIDCloakNecroDistChance, CloakNecroChanceVal as int, "{0}%")
		DIST_CCOCloaksNecroChance.Setvalue(65)
	elseif (option == OIDCloakVampireDistChance)
		CloakVampireChanceVal = 35
		SetSliderOptionValue(OIDCloakVampireDistChance, CloakVampireChanceVal as int, "{0}%")
		DIST_CCOCloaksVampireChance.Setvalue(65)
	elseif (option == OIDCloakMiscDistChance)
		CloakMiscChanceVal = 35
		SetSliderOptionValue(OIDCloakMiscDistChance, CloakMiscChanceVal as int, "{0}%")
		DIST_CCOCloaksCommonChance.Setvalue(65)
	elseif (option == OIDEnchClothing)
		EnchClothingVal = 50
		SetSliderOptionValue(OIDEnchClothing, EnchClothingVal as int, "{0}%")
		EnchantTweakClothingGV_CCO.SetValue(EnchClothingVal)
	elseif (option == OIDEnchBody)
		EnchBodyVal = 25
		SetSliderOptionValue(OIDEnchBody, EnchBodyVal as int, "{0}%")
		EnchantTweakCuirassGV_CCO.SetValue(EnchBodyVal)
	elseif (option == OIDEnchMinor)
		EnchMinorVal = -25
		SetSliderOptionValue(OIDEnchMinor, EnchMinorVal as int, "{0}%")
		EnchantTweakArmorMinorPiecesGV_CCO.SetValue(EnchMinorVal)
	elseif (option == OIDEnchJewelry)
		EnchJewelryVal = 10
		SetSliderOptionValue(OIDEnchJewelry, EnchJewelryVal as int, "{0}%")
		EnchantTweakJewelryGV_CCO.SetValue(EnchJewelryVal)
	elseif (option == OIDEnchJewelryEx)
		EnchJewelryExVal = 10
		SetSliderOptionValue(OIDEnchJewelryEx, EnchJewelryExVal as int, "{0}%")
		EnchantTweakJewelryExpensiveGV_CCO.SetValue(EnchJewelryExVal)
	elseif (option == OIDEnchJewelryEq)
		EnchJewelryEqVal = 10
		SetSliderOptionValue(OIDEnchJewelryEq, EnchJewelryEqVal as int, "{0}%")
		EnchantTweakJewelryExquisiteGV_CCO.SetValue(EnchJewelryEqVal)
	elseif (option == OIDEnchDaggers)
		EnchDaggersVal = 0
		SetSliderOptionValue(OIDEnchDaggers, EnchDaggersVal as int, "{0}%")
		EnchantTweakDaggersGV_CCO.SetValue(EnchDaggersVal)
	elseif (option == OIDEnchBows)
		EnchBowsVal = 0
		SetSliderOptionValue(OIDEnchBows, EnchBowsVal as int, "{0}%")
		EnchantTweakBowsGV_CCO.SetValue(EnchBowsVal)
	elseif (option == OIDEnch1Hand)
		Ench1HandVal = 0
		SetSliderOptionValue(OIDEnch1Hand, Ench1HandVal as int, "{0}%")
		EnchantTweakOneHandGV_CCO.SetValue(Ench1HandVal)
	elseif (option == OIDEnch2Hand)
		Ench2HandVal = 0
		SetSliderOptionValue(OIDEnch2Hand, Ench2HandVal as int, "{0}%")
		EnchantTweakTwoHandGV_CCO.SetValue(Ench2HandVal)
	elseif (option == OIDEnchAccessory)
		EnchAccessoryVal = -50
		SetSliderOptionValue(OIDEnchAccessory, EnchAccessoryVal as int, "{0}%")
		EnchantTweakAccessoriesGV_CCO.SetValue(EnchAccessoryVal)
	elseif (option == OIDTemperBase)
		TempBaseVal = 0
		SetSliderOptionValue(OIDTemperBase, TempBaseVal as int, "{0}%")
		TemperTweakBaselineGV_CCO.SetValue(TempBaseVal)
	elseif (option == OIDTemperDagger)
		TempDaggerVal = -15
		SetSliderOptionValue(OIDTemperDagger, TempDaggerVal as int, "{0}%")
		TemperTweakDaggersGV_CCO.SetValue(TempDaggerVal)
	elseif (option == OIDTemperBow)
		TempBowVal = -10
		SetSliderOptionValue(OIDTemperBow, TempBowVal as int, "{0}%")
		TemperTweakBowsGV_CCO.SetValue(TempBowVal)
	elseif (option == OIDTemper2Hand)
		Temp2HandVal = 15
		SetSliderOptionValue(OIDTemper2Hand, Temp2HandVal as int, "{0}%")
		EnchantTweakTwoHandGV_CCO.SetValue(Temp2HandVal)
	elseif (option == OIDTemperLArmor)
		TempLArmorVal = -10
		SetSliderOptionValue(OIDTemperLArmor, TempLArmorVal as int, "{0}%")
		TemperTweakLightArmorGV_CCO.SetValue(TempLArmorVal)
	elseif (option == OIDTemperHide)
		TempHideVal = -15
		SetSliderOptionValue(OIDTemperHide, TempHideVal as int, "{0}%")
		TemperTweakLeatherHideArmorGV_CCO.SetValue(TempHideVal)
	elseif (option == OIDTemperShields)
		TempShieldVal = 30
		SetSliderOptionValue(OIDTemperShields, TempShieldVal as int, "{0}%")
		TemperTweakShieldsGV_CCO.SetValue(TempShieldVal)
	elseif (option == OIDTemperCuirass)
		TempCuirassVal = 20
		SetSliderOptionValue(OIDTemperCuirass, TempCuirassVal as int, "{0}%")
		TemperTweakCuirassGV_CCO.SetValue(TempCuirassVal)
	elseif (option == OIDTemperGauntlets)
		TempGauntletVal = -20
		SetSliderOptionValue(OIDTemperGauntlets, TempGauntletVal as int, "{0}%")
		TemperTweakGauntletsGV_CCO.SetValue(TempGauntletVal)
	elseif (option == OIDBandoliersEnchantSmall)
		BandolierSmallVal = 5
		SetSliderOptionValue(OIDBandoliersEnchantSmall, BandolierSmallVal as int, "{0}")
		int pSelectedEnchant = (BandolierSmallVal/5) as int
		CCO_MCMStartupQuest.BANSwitchEnchantment(BAN_ItemList_Small, pSelectedEnchant)
	elseif (option == OIDBandoliersEnchantMed)
		BandolierMedVal = 10
		SetSliderOptionValue(OIDBandoliersEnchantMed, BandolierMedVal as int, "{0}")
		int pSelectedEnchant = (BandolierMedVal/5) as int
		CCO_MCMStartupQuest.BANSwitchEnchantment(BAN_ItemList_Med, pSelectedEnchant)
	elseif (option == OIDBandoliersEnchantLarge)
		BandolierLargeVal = 15
		SetSliderOptionValue(OIDBandoliersEnchantLarge, BandolierLargeVal as int, "{0}")
		int pSelectedEnchant = (BandolierLargeVal/5) as int
		CCO_MCMStartupQuest.BANSwitchEnchantment(BAN_ItemList_Large, pSelectedEnchant)
	elseif (option == OIDBandoliersEnchantXLarge)
		BandolierXLargeVal = 20
		SetSliderOptionValue(OIDBandoliersEnchantXLarge, BandolierXLargeVal as int, "{0}")
		int pSelectedEnchant = (BandolierXLargeVal/5) as int
		CCO_MCMStartupQuest.BANSwitchEnchantment(BAN_ItemList_XLarge, pSelectedEnchant)
	elseif (option == OIDSilverWeap)
		SilverWeapVal = 30
		SetSliderOptionValue(OIDSilverWeap, SilverWeapVal as int, "{0}%")
		MCM_CCOSilverWeaponPerk.SetValue(SilverWeapVal)
	elseif (option == OIDSilverArmor)
		SilverArmorVal = 5
		SetSliderOptionValue(OIDSilverArmor, SilverArmorVal as int, "{0}%")
		MCM_CCOSilverArmorPerk.SetValue(SilverArmorVal)
	elseif (option == OIDGoldArmor)
		GoldArmorVal = 5
		SetSliderOptionValue(OIDGoldArmor, GoldArmorVal as int, "{0}%")
		MCM_CCOGoldArmorPerk.SetValue(GoldArmorVal)
	elseif (option == OIDStalhrimEnch)
		StalhrimEnchVal = 10
		SetSliderOptionValue(OIDStalhrimEnch, StalhrimEnchVal as int, "{0}%")
		MCM_CCOStalhrimEnchPerk.SetValue(StalhrimEnchVal)
	elseif (option == OIDPRUFEIProtectEquip)
		PRUFEIEquipVal = 1
		SetSliderOptionValue(OIDPRUFEIProtectEquip, PRUFEIEquipVal as int, "{0}")
		PRUFEI_EquippedProtectedAmt.SetValue(PRUFEIEquipVal as int)
	elseif (option == OIDPRUFEIProtectFavor)
		PRUFEIFavorVal = 1
		SetSliderOptionValue(OIDPRUFEIProtectFavor, PRUFEIFavorVal as int, "{0}")
		PRUFEI_FavoriteProtectedAmt.SetValue(PRUFEIFavorVal as int)
	endif
endevent


event OnOptionHighlight(int option)
	if (option == OIDAllOn)
		SetInfoText("All available recipes are displayed in the crafting menu.")
	elseif (option == OIDAllOff)
		SetInfoText("None of the available recipes are displayed in the crafting menu.")
	elseif (option == OIDArmorAll)
		SetInfoText("All available armor & clothing recipes are displayed in the crafting menu.")
	elseif (option == OIDArmorLight)
		SetInfoText("Displays light armor recipes in the crafting menu.")
	elseif (option == OIDArmorHeavy)
		SetInfoText("Displays heavy armor recipes in the crafting menu.")
	elseif (option == OIDArmorClothing)
		SetInfoText("Displays clothing recipes in the crafting menu.")
	elseif (option == OIDArmorBoots)
		SetInfoText("Displays boots and shoes in the crafting menu.")
	elseif (option == OIDArmorCuirass)
		SetInfoText("Displays cuirasses, robes, and clothing in the crafting menu.")
	elseif (option == OIDArmorGauntlets)
		SetInfoText("Displays gloves and gauntlets in the crafting menu.")
	elseif (option == OIDArmorHelmets)
		SetInfoText("Displays hoods and helmets in the crafting menu.")
	elseif (option == OIDArmorShields)
		SetInfoText("Displays shields in the crafting menu.")
	elseif (option == OIDWeapAll)
		SetInfoText("All available weapon recipes are displayed in the crafting menu.")
	elseif (option == OIDWeapOneHand)
		SetInfoText("Displays all one-handed weapon recipes in the crafting menu.")
	elseif (option == OIDWeapTwoHand)
		SetInfoText("Displays all two-handed weapon recipes in the crafting menu.")
	elseif (option == OIDWeapDaggers)
		SetInfoText("Displays daggers in the crafting menu.")
	elseif (option == OIDWeapSwords)
		SetInfoText("Displays swords in the crafting menu.")
	elseif (option == OIDWeapGreatswords)
		SetInfoText("Displays greatswords in the crafting menu.")
	elseif (option == OIDWeapWarAxe)
		SetInfoText("Displays war axes in the crafting menu.")
	elseif (option == OIDWeapBattleaxe)
		SetInfoText("Displays battleaxes in the crafting menu.")
	elseif (option == OIDWeapMace)
		SetInfoText("Displays maces in the crafting menu.")
	elseif (option == OIDWeapWarhammer)
		SetInfoText("Displays warhammers in the crafting menu.")
	elseif (option == OIDWeapBow)
		SetInfoText("Displays bows and crossbows in the crafting menu.")
	elseif (option == OIDWeapAmmo)
		SetInfoText("Displays arrows and bolts in the crafting menu.")
	elseif (option == OIDMiscJewelryAll)
		SetInfoText("All available jewelry recipes are displayed in the crafting menu.")
	elseif (option == OIDMiscRing)
		SetInfoText("Displays rings in the crafting menu.")
	elseif (option == OIDMiscNecklace)
		SetInfoText("Displays necklaces in the crafting menu.")
	elseif (option == OIDMiscCirclet)
		SetInfoText("Displays circlets in the crafting menu.")
	elseif (option == OIDMiscTools)
		SetInfoText("Displays tools and misc utility items, such as pickaxes, tents, lockpicks, and portable crafting kits, in the crafting menu.")
	elseif (option == OIDMiscCloaks)
		SetInfoText("Displays cloaks and capes in the crafting menu.")
	elseif (option == OIDMiscPouches)
		SetInfoText("Displays bags, bandoliers, backpacks, and other pouches in the crafting menu.")
	elseif (option == OIDMiscAccessories)
		SetInfoText("Displays miscellaneous wearable items such as eyepatches, earrings, etc. in the crafting menu.")
	elseif (option == OIDNonLore)
		SetInfoText("Displays highly fanciful items and items that may deviate strongly from established lore.\nThis setting does not affect any vanilla items.")
	elseif (option == OIDMaleOnly)
		SetInfoText("Displays clothing and armor items that only have male models and can't be worn by female characters.")
	elseif (option == OIDFemaleOnly)
		SetInfoText("Displays clothing and armor items that only have female models and can't be worn by male characters.")
	elseif (option == OIDOriental)
		SetInfoText("Displays eastern-style weapons and armor in the crafting menu such as katanas, tantos, or samurai-style armors.\nThis setting does not affect any vanilla items.")
	elseif (option == OIDMSCirclets)
		SetInfoText("Displays recipes for armored circlets that fulfill the Matching Set perk requirements and have stats identical to their cooresponding helmets.  Most of these recipes require that you have the respective helmet before you can craft the circlet.")
	elseif (option == OIDUnenchant)
		SetInfoText("Displays recipes for unenchanted versions of relatively common items that are typically found only as enchanted versions in the game.  This includes unenchanted versions of divine amulets and faction armors.")
	elseif (option == OIDReplicas)
		SetInfoText("Displays recipes for unenchanted replicas of unique or artifact caliber items. This includes unenchanted versions of daedric artifacts, Nightingale items, and Ancient Falmer armor.")
;	elseif (option == OIDJaysusInst)
;		SetInfoText("Check this ONLY if you have Jaysus Swords already installed.  Checking this will replace the need for the original esm and esp files. However, you MUST install Jaysus Swords from the mod's original page in order to get the proper mesh & texture files.")
;	elseif (option == OIDBandoliersInst)
;		SetInfoText("Check this ONLY if you have Bandolier - Bags & Pouches already installed.  Checking this will replace the need for the original esp file. However, you MUST install Bandolier - Bags & Pouches from the mod's original page in order to get the proper mesh & texture files.")
;	elseif (option == OIDBandoliersDGInst)
;		SetInfoText("Check this ONLY if you have Bandolier - Dawnguard already installed.  Checking this will replace the need for the original esp file. However, you MUST install Bandolier - Dawnguard from the mod's original page in order to get the proper mesh & texture files.")
;	elseif (option == OIDCloaksInst)
;		SetInfoText("Check this ONLY if you have Cloaks of Skyrim already installed.  Checking this will replace the need for the original esp files. However, you MUST install Cloaks of Skyrim from the mod's original page in order to get the proper mesh & texture files.")
;	elseif (option == OIDWinterIsComingInst)
;		SetInfoText("Check this ONLY if you have Winter is Coming - Cloaks already installed.  Checking this will replace the need for the original esp file. However, you MUST install Winter is Coming from the mod's original page in order to get the proper mesh & texture files.")
;	elseif (option == OIDCloaksDGInst)
;		SetInfoText("Check this ONLY if you have Cloaks - Dawnguard already installed.  Checking this will replace the need for the original esp file. However, you MUST install Cloaks - Dawnguard from the mod's original page in order to get the proper mesh & texture files.")
	elseif (option == OIDJaysusCraft)
		SetInfoText("Toggles the visibility of all recipes added by Jaysus Swords in the crafting menu.")
	elseif (option == OIDBandoliersCraft)
		SetInfoText("Toggles the visibility of all recipes added by Bandolier in the crafting menu.")
	elseif (option == OIDBookofSilenceCraft)
		SetInfoText("Toggles the visibility of recipes for aMidianborn Book of Silence texture variants in the crafting menu.")
	elseif (option == OIDHeavyArmoryCraft)
		SetInfoText("Toggles the visibility of all recipes added by Heavy Armory in the crafting menu.")
	elseif (option == OIDImmersiveArmorsCraft)
		SetInfoText("Toggles the visibility of all recipes added by Immersive Armors in the crafting menu.")
	elseif (option == OIDImmersiveWeaponsCraft)
		SetInfoText("Toggles the visibility of all recipes added by Immersive Weapons in the crafting menu.")
	elseif (option == OIDImmersiveJewelryCraft)
		SetInfoText("Toggles the visibility of all recipes added by Immersive Jewelry in the crafting menu.")
	elseif (option == OIDJewelCraft)
		SetInfoText("Toggles the visibility of recipes from JewelCraft in the crafting menu.")
	elseif (option == OIDWinterIsComingCraft)
		SetInfoText("Toggles the visibility of recipes for Winter Is Coming Cloaks in the crafting menu.")
	elseif (option == OIDCloaksCraft)
		SetInfoText("Toggles the visibility of recipes for Cloaks of Skyrim in the crafting menu.")
	elseif (option == OIDDawnguard)
		SetInfoText("Toggles the visibility of all recipes added by Dawnguard in the crafting menu.")
	elseif (option == OIDHearthfire)
		SetInfoText("Toggles the visibility of all recipes added by Hearthfire in the forge menu.")
	elseif (option == OIDDragonborn)
		SetInfoText("Toggles the visibility of all recipes added by Dragonborn in the crafting menu.")
	elseif (option == OIDCCORecipes)
		SetInfoText("Toggles the visibility of recipes added by Complete Crafting Overhaul.  This does not affect tempering, smelter breakdown, fur plate, or rough gem recipes.  It DOES toggle learning recipes, matching set circlets, and integrated recipes from Bandolier, Cloaks, Jaysus Swords, JewelCraft, and Winter is Coming.  These can be toggled on/off separately if desired.")
	elseif (option == OIDSupportedMod)
		SetInfoText("Toggles the visibility of recipes added by CCO-supported mods that are not otherwise listed here.")
	elseif (option == OIDJaysusDist)
		SetInfoText("Allows items from Jaysus swords to appear in leveled lists and to be distributed throughout the world.")
	elseif (option == OIDBandoliersDist)
		SetInfoText("Allows items from Banolier - Bags & Pouches to appear in leveled lists and to be distributed throughout the world.")
	elseif (option == OIDCloaksDist)
		SetInfoText("Allows items from Cloaks of Skyrim to appear in leveled lists and to be distributed throughout the world.")
	elseif (option == OIDWinterIsComingDist)
		SetInfoText("Allows items from Winter is Coming - Cloaks to appear in leveled lists and to be distributed throughout the world.")
	elseif (option == OIDJewelCraftDist)
		SetInfoText("Allows items from JewelCraft to appear in leveled lists and to be distributed throughout the world.")
	elseif (option == OIDLearning)
		SetInfoText("Enables certain equipment types to be learned by deconstructing them at the forge.")
	elseif (option == OIDLearningReq)
		SetInfoText("The amount of learning points required before certain items can be crafted.  Breaking down most items will result in either 25 or 50 learning points.  Setting this value to '0' will remove the learning requirement and allow you to automatically craft these items once you've met any perk requirements.\nDefault: 100 (between 2 to 4 items).")
	elseif (option == OIDAltSmithXPEnable)
		SetInfoText("Enables an alternate formula for calculating XP gained from crafting items at the forge.  This does not affect the XP gained at other crafting stations, only the forge.  This new formula rewards more XP points for items that have not been crafted before, and decreasing amounts of XP for each additional time an identical item is crafted.")
	elseif (option == OIDAltSmithXPInitMult)
		SetInfoText("This is the amount that the vanilla XP is decreased.  This value will determine how much XP you'll continue to receive after crafting 3 copies of an item.  A value of 0.1 means that very little additional XP will be awarded when crafting 4 or more copies of an item.  A value of 1 means that you will receive full vanilla XP regardless of the number of copies crafted.")
	elseif (option == OIDAltSmithXPBonusMult)
		SetInfoText("This number controls the size of the bonus XP awarded for the first 3 copies of each item crafted.  Higher numbers result in increased XP for the first 3 copies.  Setting this value to 0 will result in no bonus XP.  A value of 53 will result in bonus amounts of +150/+100/+50 for an item which would give 100 XP per copy if using the vanilla formula.")
	elseif (option == OIDAltSmithXPBonusExp)
		SetInfoText("This number determines how sharply the XP amounts will drop off after an additional copy has been crafted.  Lower values will flatten this curve and provide only a moderate decrease in XP per copy crafted.")
	elseif (option == OIDBreakdownSmelt)
		SetInfoText("Allows equipment and misc items to be smelted into ingots.")
	elseif (option == OIDBreakdownTanRack)
		SetInfoText("Allows leather and hide items to be turned into fur plate and leather strips.")
	elseif (option == OIDPRUFEIProtectEquip)
		SetInfoText("The number of similar items that will be protected from being broken down when one is equipped.  For example, if you often dual-wield with identical weapons, then you can set this value to 2 to protect both items. Or if you want to be able to break down equipped items, then set this value to 0 to disable all protection for equipped items.")
	elseif (option == OIDPRUFEIProtectFavor)
		SetInfoText("The number of similar items that will be protected from being broken down when one is favorited.  For example, if you often dual-wield with identical weapons, then you can set this value to 2 to protect both items. Or if you want to be able to be able to protect an entire stack of items by favoriting one of them, then you can set this value much higher.  Set this value to 0 to disable all protection for favorited items.")
	elseif (option == OIDGemListMenu)
		SetInfoText("Choose the type of gemstone leveled list to associate with mining:\nVanilla = the chance of receiving more valuable gems is tied to player level.\nUnleveled = the chance of receiving more valuable gems is not dependent on player level.\nSpecific = Certain gems are associated with specific types of ore and are not dependent on player level.")
	elseif (option == OIDMiningPresetsMenu)
		SetInfoText("Choose to adjust mining speed and the number of ores received from mining.\nVanilla = 3 ores in 9 strikes. More Ore = 6 ores in 18 strikes. Much More Ore = 24 ores in 72 strikes.\nFaster Mining = 3 ores in 3 strikes. Faster Mining and More Ore = 6 ores in 3 strikes.\nSlower Mining = 3 ores in 18 strikes. Slower Mining and Much More Ore = 24 ores in 144 strikes.")
	elseif (option == OIDMiningStrikes)
		SetInfoText("Number of animation cycles per ore drop. One animation cycle consists of 3 strikes. Vanilla: 1 (3 strikes)\nAnimations per Drop X Drops per Vein X 3 = The total number of animated strikes that it will take to fully deplete the vein.")
	elseif (option == OIDMiningAttackStrikes)
		SetInfoText("Number of attack strikes per ore drop. Vanilla: 3\nAttack Strikes per Drop X Drops per Vein = The total number of attack strikes that it will take to fully deplete the vein.")
	elseif (option == OIDMiningOresDrop)
		SetInfoText("Number of ores received per drop. Vanilla: 1")
	elseif (option == OIDMiningOresTotal)
		SetInfoText("Total number of drops before mineral vein is depleted. Vanilla: 3\nOres per drop X Drops per Vein = The total number of ores acquired before depleting the vein.")
	elseif (option == OIDExperienceMining)
		SetInfoText("The amount of experience gained in smithing skill whenever the player mines ore. This is the actual amount of experience, not a percentage.  Setting the value at 0 means that mining has no effect on smithing skill. Vanilla: 0. Recommended settings if using this feature: 15-30.")
	elseif (option == OIDTanningRackXP)
		SetInfoText("The degree of Smithing experience gained when using the tanning rack. Experience is calculated by vanilla formulas and varies depending on the item's gold value.  Setting this option to 0 will result in no Smithing experience; a value of 0.5 is 50% experience; and a value of 1.0 is 100% experience.")
	elseif (option == OIDSmelterXP)
		SetInfoText("The degree of Smithing experience gained when using the smelter. Experience is calculated by vanilla formulas and varies depending on the item's gold value.  Setting this option to 0 will result in no Smithing experience; a value of 0.5 is 50% experience; and a value of 1.0 is 100% experience.")
	elseif (option == OIDGemChance)
		SetInfoText("Percent chance of receiving gemstones when mining. Vanilla: 10")
	elseif (option == OIDFlawlessChance)
		SetInfoText("Percent chance of receiving flawless gemstones when cutting gems. Default: 20")
	elseif (option == OIDFirewoodPerUse)
		SetInfoText("Pieces of firewood received per chop. Vanilla: 2")
	elseif (option == OIDFirewoodMax)
		SetInfoText("Maximum pieces of firewood per each activation. Vanilla: 6")
	elseif (option == OIDCorundumRename)
		SetInfoText("Corundum is renamed to Copper.")
	elseif (option == OIDMalachiteRename1)
		SetInfoText("Malachite Ore is renamed Raw Glass, and Refined Malachite is renamed Refined Glass.")
	elseif (option == OIDMalachiteRename2)
		SetInfoText("Malachite Ore is renamed Raw Moldavite, and Refined Malachite is renamed Refined Moldavite.")
	elseif (option == OIDQuicksilverRename)
		SetInfoText("Quicksilver is renamed to Mithril.")
	elseif (option == OIDUninstallMod)
		SetInfoText("Uninstalls mod and reverts any changes to vanilla settings.")
	elseif (option == OIDLevelUp)
		SetInfoText("Upgrades all unique leveled items that are in the player's inventory to match the player's current level.\nItems will lose any smithing improvements when they are upgraded.")
	elseif (option == OIDLevelUpSpell)
		SetInfoText("Adds the Upgrade Leveled Items spell to the player's spell list.")
	elseif (option == OIDLevelUpAuto)
		SetInfoText("Runs the Upgrade Leveled Items spell automatically whenever the player levels.\nThe spell will not run if the player is in combat when they level.")
	elseif (option == OIDFalmerLearning)
		SetInfoText("The player's total accumulated points toward learning to craft Falmer armor & weapons.\nThe Elven Smithing perk is required to learn and to craft Falmer items.")
	elseif (option == OIDDraugrLearning)
		SetInfoText("The player's total accumulated points toward learning to craft Ancient Nord armor & weapons.")
	elseif (option == OIDFalmerHeavyLearning)
		SetInfoText("The player's total accumulated points toward learning to craft Falmer Heavy armor.\nThe Dwarven Smithing perk is required to learn and to craft Falmer Heavy items.  Falmer Hardened items require the Ebony smithing perk.")
	elseif (option == OIDForswornLearning)
		SetInfoText("The player's total accumulated points toward learning to craft Forsworn armor & weapons.")
	elseif (option == OIDFalmerHeavyLearning)
		SetInfoText("The player's total accumulated points toward learning to craft Ancient Nord armor & weapons.")
	elseif (option == OIDFurRecipes)
		SetInfoText("Choose whether recipes with fur components will use generic Fur Plate or whether they will require specific hides.")
	elseif (option == OIDBandoliersOptions)
		SetInfoText("Additional options related to items added by Bandolier - Bags and Pouches. You can hide these options when you're finished and the custom settings will still be used.")
	elseif (option == OIDBandoliersEnchantSmall)
		SetInfoText("This is the strength of the carry weight enchantment applied to small bags and pouches.")
	elseif (option == OIDBandoliersEnchantMed)
		SetInfoText("This is the strength of the carry weight enchantment applied to medium bags and pouches.")
	elseif (option == OIDBandoliersEnchantLarge)
		SetInfoText("This is the strength of the carry weight enchantment applied to bandoliers.")
	elseif (option == OIDBandoliersEnchantXLarge)
		SetInfoText("This is the strength of the carry weight enchantment applied to large bandoliers.")
	elseif (option == OIDBandoliersWorkbench)
		SetInfoText("Choose which workstation to use to craft the bandoliers, bags, and pouches. Leather will always remain at the tanning rack, and recipes for buckles and armored bandoliers will always show up at the forge.")
	elseif (option == OIDDawnguardWorkbench)
		SetInfoText("Choose whether Dawnguard faction items can be crafted at any forge or if they can only be crafted at Fort Dawnguard.  In either case you must complete the quest requirements before you can craft Dawnguard items.")
	elseif (option == OIDDawnguardOnlyCrossbow)
		SetInfoText("Choose whether basic steel crossbows and bolts will be available throughout Skyrim or only available for members of the Dawnguard.")
	elseif (option == OIDBandoliersDistChance)
		SetInfoText("This is the percent chance that items from Bandoliers - Bags & Pouches will appear on NPCs.")
	elseif (option == OIDCloakBanditDistChance)
		SetInfoText("This is the percent chance that cloaks will appear on bandits.  Bandit bosses will have a higher chance than this.")
	elseif (option == OIDCloakForswornDistChance)
		SetInfoText("This is the percent chance that cloaks will appear on Forsworn.")
	elseif (option == OIDCloakGuardDistChance)
		SetInfoText("This is the percent chance that cloaks will appear on guards.")
	elseif (option == OIDCloakHunterDistChance)
		SetInfoText("This is the percent chance that cloaks will appear on hunters.")
	elseif (option == OIDCloakImperialDistChance)
		SetInfoText("This is the percent chance that cloaks will appear on Imperial soldiers.")
	elseif (option == OIDCloakMiscDistChance)
		SetInfoText("This is the percent chance that cloaks will appear on various other NPCs.")
	elseif (option == OIDCloakNecroDistChance)
		SetInfoText("This is the percent chance that cloaks will appear on necromancers and warlocks.")
	elseif (option == OIDCloakThalmorDistChance)
		SetInfoText("This is the percent chance that cloaks will appear on Thalmor.  Thalmor bosses will have a higher chance than this.")
	elseif (option == OIDCloakVampireDistChance)
		SetInfoText("This is the percent chance that cloaks will appear on vampires.")
	elseif (option == OIDEnchantTweaks)
		SetInfoText("Allows you to adjust the strength of the enchantments you place on items.\nYou must keep this box checked to activate the enchanting bonuses.")
	elseif (option == OIDTemperTweaks)
		SetInfoText("Allows you to adjust the strength of the tempering improvements on items.\nYou must keep this box checked to activate the tempering bonuses.")
	elseif (option == OIDEnchClothing)
		SetInfoText("Adjust the strength of enchantments placed on clothing items. This will not apply to fortify alchemy, smithing, light armor or heavy armor enchantments.")
	elseif (option == OIDEnchBody)
		SetInfoText("Adjust the strength of enchantments placed on primary body pieces, such as cuirasses or robes. This will not apply to fortify alchemy, smithing, light armor or heavy armor enchantments.")
	elseif (option == OIDEnchMinor)
		SetInfoText("Adjust the strength of enchantments placed on hand, head, or feet pieces.")
	elseif (option == OIDEnchJewelry)
		SetInfoText("Adjust the strength of enchantments placed on jewelry items. This will not apply to fortify alchemy, smithing, light armor or heavy armor enchantments.")
	elseif (option == OIDEnchJewelryEx)
		SetInfoText("Adjust the strength of enchantments placed on expensive jewelry items. Expensive jewelry is defined as all jewelry worth over 300 gold.  The effect will stack with the adjustment for all jewelry.  This will not apply to fortify alchemy, smithing, light armor or heavy armor enchantments.")
	elseif (option == OIDEnchJewelryEq)
		SetInfoText("Adjust the strength of enchantments placed on exquisite jewelry items. Exquisite jewelry is defined as rings and necklaces worth over 700 base gold and circlets worth over 900 base gold. The effect will stack with the adjustment for all jewelry and expensive jewelry.  This will not apply to fortify alchemy, smithing, light armor or heavy armor enchantments.")
	elseif (option == OIDEnchDaggers)
		SetInfoText("Adjust the strength of enchantments placed on daggers.")
	elseif (option == OIDEnchBows)
		SetInfoText("Adjust the strength of enchantments placed on bows and other ranged weapons.")
	elseif (option == OIDEnch1Hand)
		SetInfoText("Adjust the strength of enchantments placed on one-handed weapons, except daggers.")
	elseif (option == OIDEnch2Hand)
		SetInfoText("Adjust the strength of enchantments placed on two-handed weapons, except bows.")
	elseif (option == OIDEnchAccessory)
		SetInfoText("Adjust the strength of enchantments placed on accessories such as bags and cloaks.")
	elseif (option == OIDTemperBase)
		SetInfoText("Adjust the strength of all smithing improvements.")
	elseif (option == OIDTemperDagger)
		SetInfoText("Adjust the strength of smithing improvements on daggers.")
	elseif (option == OIDTemperBow)
		SetInfoText("Adjust the strength of smithing improvements on bows.")
	elseif (option == OIDTemper2Hand)
		SetInfoText("Adjust the strength of smithing improvements on two-handed weapons, except bows.")
	elseif (option == OIDTemperLArmor)
		SetInfoText("Adjust the strength of smithing improvements on all Light Armor items.  This will not apply to shields.")
	elseif (option == OIDTemperHide)
		SetInfoText("Adjust the strength of smithing improvements on armors made from leather, fur, or hide.  This effect will stack with the Light Armor adjustment.")
	elseif (option == OIDTemperShields)
		SetInfoText("Adjust the strength of smithing improvements on shields.")
	elseif (option == OIDTemperCuirass)
		SetInfoText("Adjust the strength of smithing improvements on cuirasses.")
	elseif (option == OIDTemperGauntlets)
		SetInfoText("Adjust the strength of smithing improvements on gauntlets.")
	elseif (option == OIDDaedricAtNight)
		SetInfoText("Allows Daedric items to only be crafted at night - between 9pm and 5am.")
	elseif (option == OIDInventoryConditions)
		SetInfoText("Adds inventory conditions to certain recipes to help reduce clutter in the crafting menu.  These conditions are most prevalent on jewelry and cooking recipes.  Turning this option off will not remove inventory conditions on smelter, leather, fur plate, or learning recipes.")
	elseif (option == OIDSilverWeap)
		SetInfoText("The percent increase in damage dealt by Silver weapons when used against the undead or werewolves.\nChanging this value to a multiplier allows it to benefit from weapon improvements, player skill, and fortify bonuses.  Setting this value to 0 results in the vanilla default of straight +20 damage.")
;	elseif (option == OIDSilverArmor)
;		SetInfoText("The percent damage reduction against attacks from undead or werewolves when wearing a full set of Silver armor .  This does not apply to any vanilla armors, but it does apply to CCO-compatible mods.  Setting the value to 0 will result in no bonus for silver armor.")
	elseif (option == OIDSilverArmor)
		SetInfoText("Reduced damage from attacks by undead or werewolves when wearing a full set of Silver Ebony armor .  This will apply to aMidianborn's Silver Ebony armor if the CCO-compatible file is installed.  Setting the value to 0 will result in no bonus.")
	elseif (option == OIDGoldArmor)
		SetInfoText("Bonus applied to Resist Fire enchantments when placed on Gold Ebony armor.  This will apply to aMidianborn's Gold Ebony armor only if the CCO-compatible file is installed. Setting the value to 0 will result in no bonus.")
	elseif (option == OIDStalhrimEnch)
		SetInfoText("Bonus applied to Frost enchantments when placed on Stalhrim items. The vanilla bonus is 25% but internal text indicates it was probably intended to be 10%.")
	elseif (option == OIDBookofSilenceRace)
		SetInfoText("This will apply lore-friendly racial restrictions to some of the Book of Silence variant crafting recipes. Only Altmer characters will be able to craft Thalmor variants, and only Nords can craft the Steel Glass variant.")
	elseif (option == OIDComplexity)
		SetInfoText("Choose whether certain recipes should be simplified to their primary ingredients, or whether they should include additional ingredients like pelts or wood in an attempt to more closely represent their in-game appearance.")
	elseif (option == OIDOreAmt)
		SetInfoText("The ratio of ore to ingots produced at a smelter. CCO default is 5:1 and is what the author considers best for gameplay balance.  Prices and weight have been balanced around the 5:1 ratio and will NOT change if you select other options.  However, for those who simply can't tolerate this, there is a 3:1 option.\nThere is also a perk-dependent option, which begins at a 5:1 ratio and changes to a 3:1 ratio once you've acquired the related smithing perk.")
	elseif (option == OIDCharcoalAmt)
		SetInfoText("The ratio of firewood to charcoal produced at a smelter.")
	endIf
endEvent


; -------------------------------------------------------------------------------------------------
; Functions
; -------------------------------------------------------------------------------------------------

int function GetVersion()
	return 4
endFunction


Function ActivateBandoliers()
	if MCM_CCOBandoliersInst.GetValueInt() == 0
		MCM_CCOBandoliersInst.setValue(1)
		CCO_MODBandoliers.setValue(1)
		MCM_CCOBandoliersDist.setValue(1)
		DIST_CCOBandoliersChance.Setvalue(100-BandolierChanceVal)
		if MCM_CCODawnguardInst.GetValue() == 1
			MCM_CCOBandoliersDGInst.setValue(1)
			DIST_CCOBandoliersDG_ON.setValue(0)
			DIST_CCOBandoliersDG_OFF.setValue(100)
		else
			MCM_CCOBandoliersDGInst.setValue(0)
			DIST_CCOBandoliersDG_ON.setValue(100)
			DIST_CCOBandoliersDG_OFF.setValue(0)
		endif
	else
		MCM_CCOBandoliersInst.setValue(0)
		CCO_MODBandoliers.setValue(0)
		MCM_CCOBandoliersDist.setValue(0)
		DIST_CCOBandoliersChance.Setvalue(100)
		MCM_CCOBandoliersDGInst.setValue(0)
		DIST_CCOBandoliersDG_ON.setValue(100)
		DIST_CCOBandoliersDG_OFF.setValue(0)
	endif
	ForcePageReset()
EndFunction


Function ActivateJaysus()
	if MCM_CCOJaysusInst.GetValueInt() == 0
		MCM_CCOJaysusInst.setValue(1)
		CCO_MODJaysusSwords.setValue(1)
		MCM_CCOJaysusDist.setValue(1)
		DIST_CCOJaysusSwords_ON.setValue(0)
		DIST_CCOJaysusSwords_OFF.setValue(100)
		JaysusSwordsParentMarker.enable()
	else
		MCM_CCOJaysusInst.setValue(0)
		CCO_MODJaysusSwords.setValue(0)
		MCM_CCOJaysusDist.setValue(0)
		DIST_CCOJaysusSwords_ON.setValue(100)
		DIST_CCOJaysusSwords_OFF.setValue(0)
		JaysusSwordsParentMarker.disable()
	endif
	ForcePageReset()
EndFunction


Function ActivateCloaks()
	if MCM_CCOCloaksInst.GetValueInt() == 0
		MCM_CCOCloaksInst.setValue(1)
		CCO_MODCloaks.setValue(1)
		MCM_CCOCloaksDist.setValue(1)
		DIST_CCOCloaks_ON.setValue(0)
		DIST_CCOCloaks_OFF.setValue(100)
	else
		MCM_CCOCloaksInst.setValue(0)
		CCO_MODCloaks.setValue(0)
		MCM_CCOCloaksDist.setValue(0)
		DIST_CCOCloaks_ON.setValue(100)
		DIST_CCOCloaks_OFF.setValue(0)
	endif
	ForcePageReset()
EndFunction


Function ActivateWinterIsComing()
	if MCM_CCOWinterIsComingInst.GetValueInt() == 0
		MCM_CCOWinterIsComingInst.setValue(1)
		CCO_MODWinterIsComing.setValue(1)
		MCM_CCOWinterIsComingDist.setValue(1)
		DIST_CCOWinterIsComing_ON.setValue(0)
		DIST_CCOWinterIsComing_OFF.setValue(100)
	else
		MCM_CCOWinterIsComingInst.setValue(0)
		CCO_MODWinterIsComing.setValue(0)
		MCM_CCOWinterIsComingDist.setValue(0)
		DIST_CCOWinterIsComing_ON.setValue(100)
		DIST_CCOWinterIsComing_OFF.setValue(0)
	endif
	ForcePageReset()
EndFunction
