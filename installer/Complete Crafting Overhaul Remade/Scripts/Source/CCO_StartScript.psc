Scriptname CCO_StartScript extends Quest

; -------------------------------------------------------------------------------------------------
; Properties
; -------------------------------------------------------------------------------------------------

CCO_CompatibilityScript Property CCO_MCMStartupQuest                   auto
GlobalVariable          property CCO_MODCloaksBookDistChance           auto
GlobalVariable          property CCO_MODCloaksRequireBook              auto
GlobalVariable          property CCO_MODWICRequireBasket               auto
GlobalVariable          property CCO_DisableIfCCOisInstalled           auto
GlobalVariable          property CCO_DLCDawnguard                      auto
GlobalVariable          property CCO_DLCDragonborn                     auto
GlobalVariable          property CCO_DLCHearthfire                     auto
GlobalVariable          property CCO_LearningEnabled                   auto
GlobalVariable          property CCO_MODStealthSkillsRebalanced        auto
GlobalVariable          property CCO_ModUDBPInst                       auto
GlobalVariable          property CCO_ModUDGPInst                       auto
GlobalVariable          property CCO_ModUSKPInst                       auto
GlobalVariable          property CCO_OptionArmoredCirclets             auto
GlobalVariable          property CCO_OptionArtifactReplicas            auto
GlobalVariable          property CCO_OptionCraftDaedricOnlyAtNight     auto
GlobalVariable          property DIST_CCOCrossbowBolt_Chance           auto
GlobalVariable          property DIST_CCOCrossbows_OFF                 auto
GlobalVariable          property DIST_CCOCrossbows_ON                  auto
GlobalVariable          property MCM_CCOBandoliersInst                 auto
GlobalVariable          property MCM_CCOBookofSilenceInst              auto
GlobalVariable          property MCM_CCOCloaksInst                     auto
GlobalVariable          property MCM_CCOCrossbowsInWorld               auto
GlobalVariable          property MCM_CCODawnguardInst                  auto
GlobalVariable          property MCM_CCODragonbornInst                 auto
GlobalVariable          property MCM_CCOFrostfallInst                  auto
GlobalVariable          property MCM_CCOHearthfireInst                 auto
GlobalVariable          property MCM_CCOHeavyArmoryInst                auto
GlobalVariable          property MCM_CCOImmersiveArmorsInst            auto
GlobalVariable          property MCM_CCOImmersiveWeaponsInst           auto ;Immersive Weapons
GlobalVariable          property MCM_CCOJaysusInst                     auto
GlobalVariable          property MCM_CCOWinterIsComingInst             auto
Perk                    property CCO_EnchantingTweaks_Clothing         auto
Perk                    property CCO_EnchantingTweaks_HandsHeadFeet    auto
Perk                    property CCO_EnchantingTweaks_Jewelry          auto
Perk                    property CCO_EnchantingTweaks_JewelryExpensive auto
Perk                    property CCO_EnchantingTweaks_JewelryExquisite auto
Perk                    property CCO_EnchantingTweaks_Torso            auto
Perk                    property CCO_EnchantingTweaks_WeaponBow        auto
Perk                    property CCO_EnchantingTweaks_WeaponDagger     auto
Perk                    property CCO_EnchantingTweaks_WeaponOneHand    auto
Perk                    property CCO_EnchantingTweaks_WeaponTwoHand    auto
Perk                    property CCO_TemperTweaks_ArmorCuirass         auto
Perk                    property CCO_TemperTweaks_ArmorGauntlets       auto
Perk                    property CCO_TemperTweaks_ArmorLeatherFurHide  auto
Perk                    property CCO_TemperTweaks_ArmorLight           auto
Perk                    property CCO_TemperTweaks_ArmorShield          auto
Perk                    property CCO_TemperTweaks_Baseline             auto
Perk                    property CCO_TemperTweaks_WeaponBow            auto
Perk                    property CCO_TemperTweaks_WeaponDagger         auto
Perk                    property CCO_TemperTweaks_WeaponTwoHand        auto

bool                    property DLC1Loaded                            auto hidden     ;Dawnguard
bool                    property DLC2Loaded                            auto hidden     ;Hearthfire
bool                    property DLC3Loaded                            auto hidden     ;Dragonborn
bool                    property MOD01Loaded                           auto hidden     ;Stealth    Skills     Rebalanced - Complete
bool                    property MOD02Loaded                           auto hidden     ;Stealth    Skills     Rebalanced - Lockpicking
bool                    property MOD03Loaded                           auto hidden     ;Immersive  Armors
bool                    property MOD04Loaded                           auto hidden     ;Frostfall
bool                    property MOD05Loaded                           auto hidden     ;Heavy      Armory
bool                    property MOD06Loaded                           auto hidden     ;Book       of         Silence
bool                    property MOD07Loaded                           auto hidden     ;Winter     Is         Coming
bool                    property MOD08Loaded                           auto hidden     ;Cloaks
bool                    property UDBPLoaded                            auto hidden     ;Unofficial Dragonborn Patch
bool                    property UDGPLoaded                            auto hidden     ;Unofficial Dawnguard  Patch
bool                    property USKPLoaded                            auto hidden     ;Unofficial Skyrim     Patch


; -------------------------------------------------------------------------------------------------
; Variables
; -------------------------------------------------------------------------------------------------

int ModPosition = 255
int ModPosition1 = 255
int ModPosition2 = 255
int ModPosition3 = 255


; -------------------------------------------------------------------------------------------------
; Events
; -------------------------------------------------------------------------------------------------

Event OnInit()
;	RunModCheck()
;	CCO_OptionArtifactReplicas.SetValue(0)
;	CCO_OptionArmoredCirclets.SetValue(0)
;	CCO_OptionCraftDaedricOnlyAtNight.SetValue(1)
;	CCO_DisableIfCCOisInstalled.SetValue(0)
;	CCO_LearningEnabled.SetValue(1)
;	Actor PlayerRef = Game.getPlayer()
;	PlayerRef.addperk(CCO_EnchantingTweaks_Clothing)
;	PlayerRef.addperk(CCO_EnchantingTweaks_HandsHeadFeet)
;	PlayerRef.addperk(CCO_EnchantingTweaks_Jewelry)
;	PlayerRef.addperk(CCO_EnchantingTweaks_JewelryExpensive)
;	PlayerRef.addperk(CCO_EnchantingTweaks_JewelryExquisite)
;	PlayerRef.addperk(CCO_EnchantingTweaks_Torso)
;	PlayerRef.addperk(CCO_EnchantingTweaks_WeaponBow)
;	PlayerRef.addperk(CCO_EnchantingTweaks_WeaponDagger)
;	PlayerRef.addperk(CCO_EnchantingTweaks_WeaponOneHand)
;	PlayerRef.addperk(CCO_EnchantingTweaks_WeaponTwoHand)
;	PlayerRef.addperk(CCO_TemperTweaks_ArmorCuirass)
;	PlayerRef.addperk(CCO_TemperTweaks_ArmorGauntlets)
;	PlayerRef.addperk(CCO_TemperTweaks_ArmorLeatherFurHide)
;	PlayerRef.addperk(CCO_TemperTweaks_ArmorLight)
;	PlayerRef.addperk(CCO_TemperTweaks_ArmorShield)
;	PlayerRef.addperk(CCO_TemperTweaks_WeaponBow)
;	PlayerRef.addperk(CCO_TemperTweaks_WeaponDagger)
;	PlayerRef.addperk(CCO_TemperTweaks_WeaponTwoHand)
;	PlayerRef.addperk(CCO_TemperTweaks_Baseline)
endEvent


function RunModCheck()
	ModPosition = Game.GetModByName("Dawnguard.esm")
	if ModPosition != 255
		MCM_CCODawnguardInst.SetValue(1)
		if !DLC1Loaded
			CCO_DLCDawnguard.SetValue(1)
			DLC1Loaded = true
		endif
	else
		CCO_DLCDawnguard.SetValue(0)
		MCM_CCODawnguardInst.SetValue(0)
		MCM_CCOCrossbowsInWorld.setValue(0)
		DIST_CCOCrossbows_ON.setValue(100)
		DIST_CCOCrossbows_OFF.setValue(0)
		DIST_CCOCrossbowBolt_Chance.setValue(100)
		DLC1Loaded = false
	endif
	ModPosition = Game.GetModByName("Hearthfires.esm")
	if ModPosition != 255
		MCM_CCOHearthfireInst.SetValue(1)
		if !DLC2Loaded
			CCO_DLCHearthfire.SetValue(1)
			DLC2Loaded = true
		endif
	else
		CCO_DLCHearthfire.SetValue(0)
		MCM_CCOHearthfireInst.SetValue(0)
		DLC2Loaded = false
	endif
	ModPosition = Game.GetModByName("Dragonborn.esm")
	if ModPosition != 255
		MCM_CCODragonbornInst.SetValue(1)
		if !DLC3Loaded
			CCO_DLCDragonborn.SetValue(1)
			DLC3Loaded = true
		endif
	else
		CCO_DLCDragonborn.SetValue(0)
		MCM_CCODragonbornInst.SetValue(0)
		DLC3Loaded = false
	endif
	ModPosition = Game.GetModByName("Unofficial Skyrim Patch.esp")
	if ModPosition != 255
		CCO_ModUSKPInst.SetValue(1)
		if !USKPLoaded
			CCO_MCMStartupQuest.USKPCompatibility()
			USKPLoaded = true
		endif
	else
		CCO_ModUSKPInst.SetValue(0)
		USKPLoaded = false
	endif
	ModPosition = Game.GetModByName("Unofficial Dawnguard Patch.esp")
	if ModPosition != 255
		CCO_ModUDGPInst.SetValue(1)
		if !UDGPLoaded
			CCO_MCMStartupQuest.UDGPCompatibility()
			UDGPLoaded = true
		endif
	else
		CCO_ModUDGPInst.SetValue(0)
		UDGPLoaded = false
	endif
	ModPosition = Game.GetModByName("Unofficial Dragonborn Patch.esp")
	if ModPosition != 255
		CCO_ModUDBPInst.SetValue(1)
		if !UDBPLoaded
			CCO_MCMStartupQuest.UDBPCompatibility()
			UDBPLoaded = true
		endif
	else
		CCO_ModUDBPInst.SetValue(0)
		UDBPLoaded = false
	endif
	ModPosition1 = Game.GetModByName("Stealth Skills Rebalanced_COMPLETE.esp")
	ModPosition2 = Game.GetModByName("Stealth Skills Rebalanced_LOCKPICKING.esp")
	if (ModPosition1 != 255) || (ModPosition2 != 255)
		CCO_MODStealthSkillsRebalanced.SetValue(1)
	else
		CCO_MODStealthSkillsRebalanced.SetValue(0)
	endif
	ModPosition = Game.GetModByName("Hothtrooper44_ArmorCompilation.esp")
	if ModPosition != 255
		MCM_CCOImmersiveArmorsInst.SetValue(1)
	else
		MCM_CCOImmersiveArmorsInst.SetValue(0)
	endif
	ModPosition = Game.GetModByName("Chesko_Frostfall.esp")
	if ModPosition != 255
		MCM_CCOFrostfallInst.SetValue(1)
	else
		MCM_CCOFrostfallInst.SetValue(0)
	endif
	ModPosition = Game.GetModByName("PrvtI_HeavyArmory.esp")
	if ModPosition != 255
		MCM_CCOHeavyArmoryInst.SetValue(1)
	else
		MCM_CCOHeavyArmoryInst.SetValue(0)
	endif
	ModPosition = Game.GetModByName("aMidianBorn_ContentAddon.esp")
	if ModPosition != 255
		MCM_CCOBookofSilenceInst.SetValue(1)
	else
		MCM_CCOBookofSilenceInst.SetValue(0)
	endif
	ModPosition = Game.GetModByName("WeaponsArmorFixes_ImmersiveWeapons_Patch.esp")
	if ModPosition != 255
		MCM_CCOImmersiveWeaponsInst.SetValue(1)
	else
		MCM_CCOImmersiveWeaponsInst.SetValue(0)
	endif
	ModPosition1 = Game.GetModByName("1nivWICCloaks.esp")
	ModPosition2 = Game.GetModByName("1nivWICCloaksCRAFT.esp")
	ModPosition3 = Game.GetModByName("1nivWICCloaksNoGuards.esp")
	if (ModPosition1 != 255) || (ModPosition2 != 255) || (ModPosition3 != 255)
		MCM_CCOWinterIsComingInst.SetValue(-1)
	elseif MCM_CCOWinterIsComingInst.GetValue() == -1
		MCM_CCOWinterIsComingInst.SetValue(0)
	endif
	ModPosition1 = Game.GetModByName("Cloaks.esp")
	ModPosition2 = Game.GetModByName("Cloaks - No Imperial.esp")
	ModPosition3 = Game.GetModByName("Cloaks - Player Only.esp")
	if (ModPosition1 != 255) || (ModPosition2 != 255) || (ModPosition3 != 255)
		MCM_CCOCloaksInst.SetValue(-1)
	elseif MCM_CCOCloaksInst.GetValue() == -1
		MCM_CCOCloaksInst.SetValue(0)
	endif
	ModPosition1 = Game.GetModByName("Dr_Bandolier.esp")
	if (ModPosition1 != 255)
		MCM_CCOBandoliersInst.SetValue(-1)
	elseif MCM_CCOBandoliersInst.GetValue() == -1
		MCM_CCOBandoliersInst.SetValue(0)
	endif
	ModPosition1 = Game.GetModByName("JSwords.esm")
	ModPosition2 = Game.GetModByName("JSwordsDistributionBalancePlugin.esp")
	if (ModPosition1 != 255) || (ModPosition2 != 255)
		MCM_CCOJaysusInst.SetValue(-1)
	elseif MCM_CCOJaysusInst.GetValue() == -1
		MCM_CCOJaysusInst.SetValue(0)
	endif
endFunction
