Scriptname CCO_MenuCategoryArmorOptions extends ObjectReference  

Armor Property ThisItem Auto
int Property OptionType Auto 	;0=ArmorClass, 1=ArmorType
GlobalVariable Property OptionArmorClassGV Auto	;tracks which option is currently active
GlobalVariable Property OptionArmorTypeGV Auto		;tracks which option is currently active
GlobalVariable Property CCO_ArmorHeavyRecipes Auto	
GlobalVariable Property CCO_ArmorLightRecipes Auto
GlobalVariable Property CCO_ArmorClothingRecipes Auto
GlobalVariable Property CCO_ArmorBootRecipes Auto
GlobalVariable Property CCO_ArmorCuirassRecipes Auto
GlobalVariable Property CCO_ArmorGauntletRecipes Auto
GlobalVariable Property CCO_ArmorHelmetRecipes Auto
GlobalVariable Property CCO_ArmorShieldRecipes Auto
GlobalVariable Property CCO_ClothingBootRecipes Auto
GlobalVariable Property CCO_ClothingRobeRecipes Auto
GlobalVariable Property CCO_ClothingGlovesRecipes Auto
GlobalVariable Property CCO_ClothingHoodRecipes Auto
GlobalVariable Property CCO_ClothingCloakRecipes Auto
GlobalVariable Property CCO_MiscPouchRecipes Auto 
GlobalVariable Property CCO_MiscAccessories Auto 

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
	If akNewContainer == Game.GetPlayer() && akOldContainer == None
		If OptionType == 1
			If OptionArmorTypeGV.GetValue() == 0
				OptionArmorTypeGV.SetValue(1)
				CCO_ArmorCuirassRecipes.SetValue(1)
				CCO_ClothingRobeRecipes.SetValue(1)
				CCO_ArmorHelmetRecipes.SetValue(0)
				CCO_ClothingHoodRecipes.SetValue(0)
				CCO_ArmorBootRecipes.SetValue(0)
				CCO_ClothingBootRecipes.SetValue(0)
				CCO_ArmorGauntletRecipes.SetValue(0)
				CCO_ClothingGlovesRecipes.SetValue(0)
				CCO_ArmorShieldRecipes.SetValue(0)
				CCO_ClothingCloakRecipes.SetValue(0)
				CCO_MiscPouchRecipes.SetValue(0)
				CCO_MiscAccessories.SetValue(0)
			elseif OptionArmorTypeGV.GetValue() == 1
				OptionArmorTypeGV.SetValue(2)
				CCO_ArmorCuirassRecipes.SetValue(0)
				CCO_ClothingRobeRecipes.SetValue(0)
				CCO_ArmorHelmetRecipes.SetValue(1)
				CCO_ClothingHoodRecipes.SetValue(1)
				;CCO_ArmorBootRecipes.SetValue(0)
				;CCO_ClothingBootRecipes.SetValue(0)
				;CCO_ArmorGauntletRecipes.SetValue(0)
				;CCO_ClothingGlovesRecipes.SetValue(0)
				;CCO_ArmorShieldRecipes.SetValue(0)
				;CCO_ClothingCloakRecipes.SetValue(0)
				;CCO_MiscPouchRecipes.SetValue(0)
			elseif OptionArmorTypeGV.GetValue() == 2
				OptionArmorTypeGV.SetValue(3)
				;CCO_ArmorCuirassRecipes.SetValue(0)
				;CCO_ClothingRobeRecipes.SetValue(0)
				CCO_ArmorHelmetRecipes.SetValue(0)
				CCO_ClothingHoodRecipes.SetValue(0)
				CCO_ArmorGauntletRecipes.SetValue(1)
				CCO_ClothingGlovesRecipes.SetValue(1)
				;CCO_ArmorBootRecipes.SetValue(0)
				;CCO_ClothingBootRecipes.SetValue(0)
				;CCO_ArmorShieldRecipes.SetValue(0)
				;CCO_ClothingCloakRecipes.SetValue(0)
				;CCO_MiscPouchRecipes.SetValue(0)
			elseif OptionArmorTypeGV.GetValue() == 3
				OptionArmorTypeGV.SetValue(4)
				;CCO_ArmorCuirassRecipes.SetValue(0)
				;CCO_ClothingRobeRecipes.SetValue(0)
				;CCO_ArmorHelmetRecipes.SetValue(0)
				;CCO_ClothingHoodRecipes.SetValue(0)
				CCO_ArmorGauntletRecipes.SetValue(0)
				CCO_ClothingGlovesRecipes.SetValue(0)
				CCO_ArmorBootRecipes.SetValue(1)
				CCO_ClothingBootRecipes.SetValue(1)
				;CCO_ArmorShieldRecipes.SetValue(0)
				;CCO_ClothingCloakRecipes.SetValue(0)
				;CCO_MiscPouchRecipes.SetValue(0)
			elseif OptionArmorTypeGV.GetValue() == 4 && OptionArmorClassGV.GetValue() <= 2 
				OptionArmorTypeGV.SetValue(5)
				;CCO_ArmorCuirassRecipes.SetValue(0)
				;CCO_ClothingRobeRecipes.SetValue(0)
				;CCO_ArmorHelmetRecipes.SetValue(0)
				;CCO_ClothingHoodRecipes.SetValue(0)
				;CCO_ArmorGauntletRecipes.SetValue(0)
				;CCO_ClothingGlovesRecipes.SetValue(0)
				CCO_ArmorBootRecipes.SetValue(0)
				CCO_ClothingBootRecipes.SetValue(0)
				CCO_ArmorShieldRecipes.SetValue(1)
				;CCO_ClothingCloakRecipes.SetValue(0)
				;CCO_MiscPouchRecipes.SetValue(0)
			elseif (OptionArmorTypeGV.GetValue() == 4 || OptionArmorTypeGV.GetValue() == 5) && (OptionArmorClassGV.GetValue() == 3 || OptionArmorClassGV.GetValue() == 0) 
				OptionArmorTypeGV.SetValue(6)
				;CCO_ArmorCuirassRecipes.SetValue(0)
				;CCO_ClothingRobeRecipes.SetValue(0)
				;CCO_ArmorHelmetRecipes.SetValue(0)
				;CCO_ClothingHoodRecipes.SetValue(0)
				;CCO_ArmorGauntletRecipes.SetValue(0)
				;CCO_ClothingGlovesRecipes.SetValue(0)
				CCO_ArmorBootRecipes.SetValue(0)
				CCO_ClothingBootRecipes.SetValue(0)
				CCO_ArmorShieldRecipes.SetValue(0)
				CCO_ClothingCloakRecipes.SetValue(1)
				;CCO_MiscPouchRecipes.SetValue(0)
			elseif OptionArmorTypeGV.GetValue() >= 5 && (OptionArmorClassGV.GetValue() == 1 || OptionArmorClassGV.GetValue() == 2) 
				OptionArmorTypeGV.SetValue(0)
				CCO_ArmorCuirassRecipes.SetValue(1)
				CCO_ClothingRobeRecipes.SetValue(1)
				CCO_ArmorHelmetRecipes.SetValue(1)
				CCO_ClothingHoodRecipes.SetValue(1)
				CCO_ArmorGauntletRecipes.SetValue(1)
				CCO_ClothingGlovesRecipes.SetValue(1)
				CCO_ArmorBootRecipes.SetValue(1)
				CCO_ClothingBootRecipes.SetValue(1)
				CCO_ArmorShieldRecipes.SetValue(1)
				CCO_ClothingCloakRecipes.SetValue(1)
				CCO_MiscPouchRecipes.SetValue(1)
				CCO_MiscAccessories.SetValue(1)
			elseif OptionArmorTypeGV.GetValue() == 6 
				OptionArmorTypeGV.SetValue(7)
				;CCO_ArmorCuirassRecipes.SetValue(0)
				;CCO_ClothingRobeRecipes.SetValue(0)
				;CCO_ArmorHelmetRecipes.SetValue(0)
				;CCO_ClothingHoodRecipes.SetValue(0)
				;CCO_ArmorGauntletRecipes.SetValue(0)
				;CCO_ClothingGlovesRecipes.SetValue(0)
				;CCO_ArmorBootRecipes.SetValue(0)
				;CCO_ClothingBootRecipes.SetValue(0)
				;CCO_ArmorShieldRecipes.SetValue(0)
				CCO_ClothingCloakRecipes.SetValue(0)
				CCO_MiscPouchRecipes.SetValue(1)
				CCO_MiscAccessories.SetValue(1)
			elseif OptionArmorTypeGV.GetValue() == 7 
				OptionArmorTypeGV.SetValue(0)
				CCO_ArmorCuirassRecipes.SetValue(1)
				CCO_ClothingRobeRecipes.SetValue(1)
				CCO_ArmorHelmetRecipes.SetValue(1)
				CCO_ClothingHoodRecipes.SetValue(1)
				CCO_ArmorGauntletRecipes.SetValue(1)
				CCO_ClothingGlovesRecipes.SetValue(1)
				CCO_ArmorBootRecipes.SetValue(1)
				CCO_ClothingBootRecipes.SetValue(1)
				CCO_ArmorShieldRecipes.SetValue(1)
				CCO_ClothingCloakRecipes.SetValue(1)
				CCO_MiscPouchRecipes.SetValue(1)
				CCO_MiscAccessories.SetValue(1)
			endif
		else
			If OptionArmorClassGV.GetValue() == 0
				OptionArmorClassGV.SetValue(1)
				CCO_ArmorHeavyRecipes.SetValue(1)
				CCO_ArmorLightRecipes.SetValue(0)
				CCO_ArmorClothingRecipes.SetValue(0)
			elseif OptionArmorClassGV.GetValue() == 1
				OptionArmorClassGV.SetValue(2)	
				CCO_ArmorHeavyRecipes.SetValue(0)
				CCO_ArmorLightRecipes.SetValue(1)
				CCO_ArmorClothingRecipes.SetValue(0)
			elseif OptionArmorClassGV.GetValue() == 2
				OptionArmorClassGV.SetValue(3)		
				CCO_ArmorHeavyRecipes.SetValue(0)
				CCO_ArmorLightRecipes.SetValue(0)
				CCO_ArmorClothingRecipes.SetValue(1)
				if  OptionArmorTypeGV.GetValue() == 5
					OptionArmorTypeGV.SetValue(0)
					CCO_ArmorCuirassRecipes.SetValue(1)
					CCO_ClothingRobeRecipes.SetValue(1)
					CCO_ArmorHelmetRecipes.SetValue(1)
					CCO_ClothingHoodRecipes.SetValue(1)
					CCO_ArmorGauntletRecipes.SetValue(1)
					CCO_ClothingGlovesRecipes.SetValue(1)
					CCO_ArmorBootRecipes.SetValue(1)
					CCO_ClothingBootRecipes.SetValue(1)
					CCO_ArmorShieldRecipes.SetValue(1)
					CCO_ClothingCloakRecipes.SetValue(1)
					CCO_MiscPouchRecipes.SetValue(1)
					CCO_MiscAccessories.SetValue(1)
				endif
			elseif OptionArmorClassGV.GetValue() == 3
				OptionArmorClassGV.SetValue(0)		
				CCO_ArmorHeavyRecipes.SetValue(1)
				CCO_ArmorLightRecipes.SetValue(1)
				CCO_ArmorClothingRecipes.SetValue(1)
			endif
		endif
		Game.GetPlayer().RemoveItem(ThisItem, 1, true)
	EndIf
EndEvent
 