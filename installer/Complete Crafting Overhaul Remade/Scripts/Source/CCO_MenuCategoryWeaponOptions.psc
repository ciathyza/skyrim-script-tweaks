Scriptname CCO_MenuCategoryWeaponOptions extends ObjectReference  

Weapon Property ThisItem Auto
int Property OptionType Auto 	;0=Class, 1=Type
GlobalVariable Property OptionWeapClassGV Auto	;tracks which option is currently active
GlobalVariable Property OptionWeapTypeGV Auto		;tracks which option is currently active
GlobalVariable Property CCO_WeapDaggerRecipes Auto	
GlobalVariable Property CCO_WeapSwordRecipes Auto
GlobalVariable Property CCO_WeapGreatswordRecipes Auto
GlobalVariable Property CCO_WeapWarAxeRecipes Auto
GlobalVariable Property CCO_WeapBattleaxeRecipes Auto
GlobalVariable Property CCO_WeapMaceRecipes Auto
GlobalVariable Property CCO_WeapWarhammerRecipes Auto
GlobalVariable Property CCO_WeapBowRecipes Auto

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
	If akNewContainer == Game.GetPlayer() && akOldContainer == None
		If OptionType == 1
			If OptionWeapTypeGV.GetValue() <= 1
				If OptionWeapTypeGV.GetValue() == 0 && OptionWeapClassGV.GetValue() <= 1
					OptionWeapTypeGV.SetValue(1)		
					CCO_WeapDaggerRecipes.SetValue(1)
					CCO_WeapSwordRecipes.SetValue(0)
					CCO_WeapWarAxeRecipes.SetValue(0)
					CCO_WeapMaceRecipes.SetValue(0)
					CCO_WeapGreatswordRecipes.SetValue(0)
					CCO_WeapBattleaxeRecipes.SetValue(0)
					CCO_WeapWarhammerRecipes.SetValue(0)
					CCO_WeapBowRecipes.SetValue(0)
				elseif OptionWeapTypeGV.GetValue() == 1 && OptionWeapClassGV.GetValue() == 0
					OptionWeapTypeGV.SetValue(2)		
					CCO_WeapDaggerRecipes.SetValue(0)
					CCO_WeapSwordRecipes.SetValue(1)
					;CCO_WeapWarAxeRecipes.SetValue(0)
					;CCO_WeapMaceRecipes.SetValue(0)
					CCO_WeapGreatswordRecipes.SetValue(1)
					;CCO_WeapBattleaxeRecipes.SetValue(0)
					;CCO_WeapWarhammerRecipes.SetValue(0)
					;CCO_WeapBowRecipes.SetValue(0)
				elseif OptionWeapTypeGV.GetValue() <= 1 && OptionWeapClassGV.GetValue() == 1
					OptionWeapTypeGV.SetValue(2)		
					CCO_WeapDaggerRecipes.SetValue(0)
					CCO_WeapSwordRecipes.SetValue(1)
					;CCO_WeapWarAxeRecipes.SetValue(0)
					;CCO_WeapMaceRecipes.SetValue(0)
					CCO_WeapGreatswordRecipes.SetValue(0)
					;CCO_WeapBattleaxeRecipes.SetValue(0)
					;CCO_WeapWarhammerRecipes.SetValue(0)
					;CCO_WeapBowRecipes.SetValue(0)
				elseif OptionWeapTypeGV.GetValue() <= 1 && OptionWeapClassGV.GetValue() == 2
					OptionWeapTypeGV.SetValue(2)		
					CCO_WeapDaggerRecipes.SetValue(0)
					CCO_WeapSwordRecipes.SetValue(0)
					;CCO_WeapWarAxeRecipes.SetValue(0)
					;CCO_WeapMaceRecipes.SetValue(0)
					CCO_WeapGreatswordRecipes.SetValue(1)
					;CCO_WeapBattleaxeRecipes.SetValue(0)
					;CCO_WeapWarhammerRecipes.SetValue(0)
					;CCO_WeapBowRecipes.SetValue(0)
				elseif OptionWeapTypeGV.GetValue() <= 1 && OptionWeapClassGV.GetValue() == 3
					OptionWeapTypeGV.SetValue(5)		
					CCO_WeapDaggerRecipes.SetValue(0)
					CCO_WeapSwordRecipes.SetValue(0)
					CCO_WeapWarAxeRecipes.SetValue(0)
					CCO_WeapMaceRecipes.SetValue(0)
					CCO_WeapGreatswordRecipes.SetValue(0)
					CCO_WeapBattleaxeRecipes.SetValue(0)
					CCO_WeapWarhammerRecipes.SetValue(0)
					CCO_WeapBowRecipes.SetValue(1)
				endif
			elseif OptionWeapTypeGV.GetValue() == 2
				If OptionWeapClassGV.GetValue() == 0
					OptionWeapTypeGV.SetValue(3)		
					CCO_WeapDaggerRecipes.SetValue(0)
					CCO_WeapSwordRecipes.SetValue(0)
					CCO_WeapWarAxeRecipes.SetValue(1)
					CCO_WeapMaceRecipes.SetValue(0)
					CCO_WeapGreatswordRecipes.SetValue(0)
					CCO_WeapBattleaxeRecipes.SetValue(1)
					CCO_WeapWarhammerRecipes.SetValue(0)
					CCO_WeapBowRecipes.SetValue(0)
				elseif OptionWeapClassGV.GetValue() == 1
					OptionWeapTypeGV.SetValue(3)		
					CCO_WeapDaggerRecipes.SetValue(0)
					CCO_WeapSwordRecipes.SetValue(0)
					CCO_WeapWarAxeRecipes.SetValue(1)
					CCO_WeapMaceRecipes.SetValue(0)
					CCO_WeapGreatswordRecipes.SetValue(0)
					CCO_WeapBattleaxeRecipes.SetValue(0)
					CCO_WeapWarhammerRecipes.SetValue(0)
					CCO_WeapBowRecipes.SetValue(0)
				elseif OptionWeapClassGV.GetValue() == 2
					OptionWeapTypeGV.SetValue(3)		
					CCO_WeapDaggerRecipes.SetValue(0)
					CCO_WeapSwordRecipes.SetValue(0)
					CCO_WeapWarAxeRecipes.SetValue(0)
					CCO_WeapMaceRecipes.SetValue(0)
					CCO_WeapGreatswordRecipes.SetValue(0)
					CCO_WeapBattleaxeRecipes.SetValue(1)
					CCO_WeapWarhammerRecipes.SetValue(0)
					CCO_WeapBowRecipes.SetValue(0)
				endif
			elseif OptionWeapTypeGV.GetValue() == 3
				If OptionWeapClassGV.GetValue() == 0
					OptionWeapTypeGV.SetValue(4)		
					CCO_WeapDaggerRecipes.SetValue(0)
					CCO_WeapSwordRecipes.SetValue(0)
					CCO_WeapWarAxeRecipes.SetValue(0)
					CCO_WeapMaceRecipes.SetValue(1)
					CCO_WeapGreatswordRecipes.SetValue(0)
					CCO_WeapBattleaxeRecipes.SetValue(0)
					CCO_WeapWarhammerRecipes.SetValue(1)
					CCO_WeapBowRecipes.SetValue(0)
				elseif OptionWeapClassGV.GetValue() == 1
					OptionWeapTypeGV.SetValue(4)		
					CCO_WeapDaggerRecipes.SetValue(0)
					CCO_WeapSwordRecipes.SetValue(0)
					CCO_WeapWarAxeRecipes.SetValue(0)
					CCO_WeapMaceRecipes.SetValue(1)
					CCO_WeapGreatswordRecipes.SetValue(0)
					CCO_WeapBattleaxeRecipes.SetValue(0)
					CCO_WeapWarhammerRecipes.SetValue(0)
					CCO_WeapBowRecipes.SetValue(0)
				elseif OptionWeapClassGV.GetValue() == 2
					OptionWeapTypeGV.SetValue(4)		
					CCO_WeapDaggerRecipes.SetValue(0)
					CCO_WeapSwordRecipes.SetValue(0)
					CCO_WeapWarAxeRecipes.SetValue(0)
					CCO_WeapMaceRecipes.SetValue(0)
					CCO_WeapGreatswordRecipes.SetValue(0)
					CCO_WeapBattleaxeRecipes.SetValue(0)
					CCO_WeapWarhammerRecipes.SetValue(1)
					CCO_WeapBowRecipes.SetValue(0)
				endif
			elseif OptionWeapTypeGV.GetValue() == 4
				If OptionWeapClassGV.GetValue() == 0
					OptionWeapTypeGV.SetValue(0)		
					CCO_WeapDaggerRecipes.SetValue(1)
					CCO_WeapSwordRecipes.SetValue(1)
					CCO_WeapWarAxeRecipes.SetValue(1)
					CCO_WeapMaceRecipes.SetValue(1)
					CCO_WeapGreatswordRecipes.SetValue(1)
					CCO_WeapBattleaxeRecipes.SetValue(1)
					CCO_WeapWarhammerRecipes.SetValue(1)
					CCO_WeapBowRecipes.SetValue(1)
				elseif OptionWeapClassGV.GetValue() == 1
					OptionWeapTypeGV.SetValue(0)		
					CCO_WeapDaggerRecipes.SetValue(1)
					CCO_WeapSwordRecipes.SetValue(1)
					CCO_WeapWarAxeRecipes.SetValue(1)
					CCO_WeapMaceRecipes.SetValue(1)
					CCO_WeapGreatswordRecipes.SetValue(0)
					CCO_WeapBattleaxeRecipes.SetValue(0)
					CCO_WeapWarhammerRecipes.SetValue(0)
					CCO_WeapBowRecipes.SetValue(0)
				elseif OptionWeapClassGV.GetValue() == 2
					OptionWeapTypeGV.SetValue(0)		
					CCO_WeapDaggerRecipes.SetValue(0)
					CCO_WeapSwordRecipes.SetValue(0)
					CCO_WeapWarAxeRecipes.SetValue(0)
					CCO_WeapMaceRecipes.SetValue(0)
					CCO_WeapGreatswordRecipes.SetValue(1)
					CCO_WeapBattleaxeRecipes.SetValue(1)
					CCO_WeapWarhammerRecipes.SetValue(1)
					CCO_WeapBowRecipes.SetValue(0)
				elseif OptionWeapClassGV.GetValue() == 3
					OptionWeapTypeGV.SetValue(5)		
					CCO_WeapDaggerRecipes.SetValue(0)
					CCO_WeapSwordRecipes.SetValue(0)
					CCO_WeapWarAxeRecipes.SetValue(0)
					CCO_WeapMaceRecipes.SetValue(0)
					CCO_WeapGreatswordRecipes.SetValue(0)
					CCO_WeapBattleaxeRecipes.SetValue(0)
					CCO_WeapWarhammerRecipes.SetValue(0)
					CCO_WeapBowRecipes.SetValue(1)
				endif
			elseif OptionWeapTypeGV.GetValue() == 5
				If OptionWeapClassGV.GetValue() == 3
					OptionWeapTypeGV.SetValue(0)		
					CCO_WeapDaggerRecipes.SetValue(0)
					CCO_WeapSwordRecipes.SetValue(0)
					CCO_WeapWarAxeRecipes.SetValue(0)
					CCO_WeapMaceRecipes.SetValue(0)
					CCO_WeapGreatswordRecipes.SetValue(0)
					CCO_WeapBattleaxeRecipes.SetValue(0)
					CCO_WeapWarhammerRecipes.SetValue(0)
					CCO_WeapBowRecipes.SetValue(1)
				elseif OptionWeapClassGV.GetValue() == 0
					OptionWeapTypeGV.SetValue(0)		
					CCO_WeapDaggerRecipes.SetValue(1)
					CCO_WeapSwordRecipes.SetValue(1)
					CCO_WeapWarAxeRecipes.SetValue(1)
					CCO_WeapMaceRecipes.SetValue(1)
					CCO_WeapGreatswordRecipes.SetValue(1)
					CCO_WeapBattleaxeRecipes.SetValue(1)
					CCO_WeapWarhammerRecipes.SetValue(1)
					CCO_WeapBowRecipes.SetValue(1)
				elseif OptionWeapClassGV.GetValue() == 1
					OptionWeapTypeGV.SetValue(0)		
					CCO_WeapDaggerRecipes.SetValue(1)
					CCO_WeapSwordRecipes.SetValue(1)
					CCO_WeapWarAxeRecipes.SetValue(1)
					CCO_WeapMaceRecipes.SetValue(1)
					CCO_WeapGreatswordRecipes.SetValue(0)
					CCO_WeapBattleaxeRecipes.SetValue(0)
					CCO_WeapWarhammerRecipes.SetValue(0)
					CCO_WeapBowRecipes.SetValue(0)
				elseif OptionWeapClassGV.GetValue() == 2
					OptionWeapTypeGV.SetValue(0)		
					CCO_WeapDaggerRecipes.SetValue(0)
					CCO_WeapSwordRecipes.SetValue(0)
					CCO_WeapWarAxeRecipes.SetValue(0)
					CCO_WeapMaceRecipes.SetValue(0)
					CCO_WeapGreatswordRecipes.SetValue(1)
					CCO_WeapBattleaxeRecipes.SetValue(1)
					CCO_WeapWarhammerRecipes.SetValue(1)
					CCO_WeapBowRecipes.SetValue(0)
				endif
			endif
		else
			If OptionWeapClassGV.GetValue() == 0
				OptionWeapClassGV.SetValue(1)
				CCO_WeapGreatswordRecipes.SetValue(0)
				CCO_WeapBattleaxeRecipes.SetValue(0)
				CCO_WeapWarhammerRecipes.SetValue(0)
				CCO_WeapBowRecipes.SetValue(0)
				If OptionWeapTypeGV.GetValue() == 0
					CCO_WeapDaggerRecipes.SetValue(1)
					CCO_WeapSwordRecipes.SetValue(1)
					CCO_WeapWarAxeRecipes.SetValue(1)
					CCO_WeapMaceRecipes.SetValue(1)
				elseif OptionWeapTypeGV.GetValue() == 1
					CCO_WeapDaggerRecipes.SetValue(1)
					CCO_WeapSwordRecipes.SetValue(0)
					CCO_WeapWarAxeRecipes.SetValue(0)
					CCO_WeapMaceRecipes.SetValue(0)
				elseif OptionWeapTypeGV.GetValue() == 2
					CCO_WeapDaggerRecipes.SetValue(0)
					CCO_WeapSwordRecipes.SetValue(1)
					CCO_WeapWarAxeRecipes.SetValue(0)
					CCO_WeapMaceRecipes.SetValue(0)
				elseif OptionWeapTypeGV.GetValue() == 3
					CCO_WeapDaggerRecipes.SetValue(0)
					CCO_WeapSwordRecipes.SetValue(0)
					CCO_WeapWarAxeRecipes.SetValue(1)
					CCO_WeapMaceRecipes.SetValue(0)
				elseif OptionWeapTypeGV.GetValue() == 4
					CCO_WeapDaggerRecipes.SetValue(0)
					CCO_WeapSwordRecipes.SetValue(0)
					CCO_WeapWarAxeRecipes.SetValue(0)
					CCO_WeapMaceRecipes.SetValue(1)
				endif
			elseif OptionWeapClassGV.GetValue() == 1
				OptionWeapClassGV.SetValue(2)	
				CCO_WeapDaggerRecipes.SetValue(0)
				CCO_WeapSwordRecipes.SetValue(0)
				CCO_WeapWarAxeRecipes.SetValue(0)
				CCO_WeapMaceRecipes.SetValue(0)
				CCO_WeapBowRecipes.SetValue(0)
				If OptionWeapTypeGV.GetValue() == 0
					CCO_WeapGreatswordRecipes.SetValue(1)
					CCO_WeapBattleaxeRecipes.SetValue(1)
					CCO_WeapWarhammerRecipes.SetValue(1)
				elseif OptionWeapTypeGV.GetValue() == 1
					OptionWeapTypeGV.SetValue(2)		
					CCO_WeapGreatswordRecipes.SetValue(1)
					CCO_WeapBattleaxeRecipes.SetValue(0)
					CCO_WeapWarhammerRecipes.SetValue(0)
				elseif OptionWeapTypeGV.GetValue() == 2
					CCO_WeapGreatswordRecipes.SetValue(1)
					CCO_WeapBattleaxeRecipes.SetValue(0)
					CCO_WeapWarhammerRecipes.SetValue(0)
				elseif OptionWeapTypeGV.GetValue() == 3
					CCO_WeapGreatswordRecipes.SetValue(0)
					CCO_WeapBattleaxeRecipes.SetValue(1)
					CCO_WeapWarhammerRecipes.SetValue(0)
				elseif OptionWeapTypeGV.GetValue() == 4
					CCO_WeapGreatswordRecipes.SetValue(0)
					CCO_WeapBattleaxeRecipes.SetValue(0)
					CCO_WeapWarhammerRecipes.SetValue(1)
				endif
			elseif OptionWeapClassGV.GetValue() == 2
				OptionWeapClassGV.SetValue(3)	
				CCO_WeapGreatswordRecipes.SetValue(0)
				CCO_WeapBattleaxeRecipes.SetValue(0)
				CCO_WeapWarhammerRecipes.SetValue(0)	
				CCO_WeapDaggerRecipes.SetValue(0)
				CCO_WeapSwordRecipes.SetValue(0)
				CCO_WeapWarAxeRecipes.SetValue(0)
				CCO_WeapMaceRecipes.SetValue(0)
				If OptionWeapTypeGV.GetValue() == 0
					CCO_WeapBowRecipes.SetValue(1)
				elseif OptionWeapTypeGV.GetValue() >= 1 && OptionWeapTypeGV.GetValue() <= 4 
					OptionWeapTypeGV.SetValue(5)		
					CCO_WeapBowRecipes.SetValue(1)
				elseif OptionWeapTypeGV.GetValue() == 5
					CCO_WeapBowRecipes.SetValue(1)
				endif	
			elseif OptionWeapClassGV.GetValue() == 3
				OptionWeapClassGV.SetValue(0)		
				If OptionWeapTypeGV.GetValue() == 0
					CCO_WeapDaggerRecipes.SetValue(1)
					CCO_WeapSwordRecipes.SetValue(1)
					CCO_WeapWarAxeRecipes.SetValue(1)
					CCO_WeapMaceRecipes.SetValue(1)
					CCO_WeapGreatswordRecipes.SetValue(1)
					CCO_WeapBattleaxeRecipes.SetValue(1)
					CCO_WeapWarhammerRecipes.SetValue(1)
					CCO_WeapBowRecipes.SetValue(1)
				elseif OptionWeapTypeGV.GetValue() == 1
					CCO_WeapDaggerRecipes.SetValue(1)
					CCO_WeapSwordRecipes.SetValue(0)
					CCO_WeapWarAxeRecipes.SetValue(0)
					CCO_WeapMaceRecipes.SetValue(0)
					CCO_WeapGreatswordRecipes.SetValue(0)
					CCO_WeapBattleaxeRecipes.SetValue(0)
					CCO_WeapWarhammerRecipes.SetValue(0)
					CCO_WeapBowRecipes.SetValue(0)
				elseif OptionWeapTypeGV.GetValue() == 2
					CCO_WeapDaggerRecipes.SetValue(0)
					CCO_WeapSwordRecipes.SetValue(1)
					CCO_WeapWarAxeRecipes.SetValue(0)
					CCO_WeapMaceRecipes.SetValue(0)
					CCO_WeapGreatswordRecipes.SetValue(1)
					CCO_WeapBattleaxeRecipes.SetValue(0)
					CCO_WeapWarhammerRecipes.SetValue(0)
					CCO_WeapBowRecipes.SetValue(0)
				elseif OptionWeapTypeGV.GetValue() == 3
					CCO_WeapDaggerRecipes.SetValue(0)
					CCO_WeapSwordRecipes.SetValue(0)
					CCO_WeapWarAxeRecipes.SetValue(1)
					CCO_WeapMaceRecipes.SetValue(0)
					CCO_WeapGreatswordRecipes.SetValue(0)
					CCO_WeapBattleaxeRecipes.SetValue(1)
					CCO_WeapWarhammerRecipes.SetValue(0)
					CCO_WeapBowRecipes.SetValue(0)
				elseif OptionWeapTypeGV.GetValue() == 4
					CCO_WeapDaggerRecipes.SetValue(0)
					CCO_WeapSwordRecipes.SetValue(0)
					CCO_WeapWarAxeRecipes.SetValue(0)
					CCO_WeapMaceRecipes.SetValue(1)
					CCO_WeapGreatswordRecipes.SetValue(0)
					CCO_WeapBattleaxeRecipes.SetValue(0)
					CCO_WeapWarhammerRecipes.SetValue(1)
					CCO_WeapBowRecipes.SetValue(0)
				elseif OptionWeapTypeGV.GetValue() == 5
					CCO_WeapDaggerRecipes.SetValue(0)
					CCO_WeapSwordRecipes.SetValue(0)
					CCO_WeapWarAxeRecipes.SetValue(0)
					CCO_WeapMaceRecipes.SetValue(0)
					CCO_WeapGreatswordRecipes.SetValue(0)
					CCO_WeapBattleaxeRecipes.SetValue(0)
					CCO_WeapWarhammerRecipes.SetValue(0)
					CCO_WeapBowRecipes.SetValue(1)
				endif
			endif
		endif
		Game.GetPlayer().RemoveItem(ThisItem, 1, true)
	EndIf
EndEvent
 
