Scriptname CCO_AltSmithingExpPlayerScript extends ReferenceAlias  

globalvariable property BonusMultGV auto
globalvariable property BonusExpGV auto

formlist property LTSFormlist1 auto
formlist property LTSFormlist2 auto
formlist property LTSFormlist3 auto

keyword property CraftingSmithingForge auto
keyword property isBlacksmithForge auto
keyword property WICraftingSmithing auto
perk property LTSInitialMultPerk auto

ObjectReference furn
float SkillIncrease
float BonusMult
float BonusExp


Event OnInit()
	GoToState("")
EndEvent

Event OnPlayerLoadGame() 
	GoToState("")
EndEvent

Event OnSit(ObjectReference akFurniture)
	if akFurniture.HasKeyWord(WICraftingSmithing) || akFurniture.HasKeyWord(CraftingSmithingForge) || akFurniture.HasKeyWord(isBlacksmithForge)
		furn = akFurniture
		Game.GetPlayer().AddPerk(LTSInitialMultPerk)	;instead of giving this perk, it might be better to 0 out experience entirely and just calculate all smithing xp via script...this would allow some items to give no experience whatsoever
		BonusMult = BonusMultGV.GetValue() as float
		BonusExp = BonusExpGV.GetValue() as float
		GoToState("Crafting")
	else
		GoToState("")	
		furn = none
	endIf
EndEvent


Event OnGetUp(ObjectReference akFurniture)
	if akFurniture.HasKeyWord(WICraftingSmithing) || akFurniture.HasKeyWord(CraftingSmithingForge) || akFurniture.HasKeyWord(isBlacksmithForge)
		furn = none
		GoToState("")	
		Game.GetPlayer().RemovePerk(LTSInitialMultPerk)
	endIf
EndEvent

State Crafting
Event OnItemAdded(Form akBaseItem, Int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)
	if furn == none
		GoToState("")
	elseif akItemReference == none && akSourceContainer == none && aiItemCount == 1
		int itemvalue = akBaseItem.GetGoldValue()
		;float vanillaxp = (3 * math.pow(itemvalue, 0.65) + 25)
		float xp = math.pow((itemvalue/3*BonusMult) as float, BonusExp) 
		if LTSFormlist3.HasForm(akBaseItem)
			return
		elseif LTSFormlist2.HasForm(akBaseItem)
			Game.AdvanceSkill("Smithing", xp)
			LTSFormlist3.AddForm(akBaseItem)
		elseif LTSFormlist1.HasForm(akBaseItem)
			Game.AdvanceSkill("Smithing", xp*2)
			LTSFormlist2.AddForm(akBaseItem)
		else
			Game.AdvanceSkill("Smithing", xp*3)
			LTSFormlist1.AddForm(akBaseItem)
		endif
	endIf
EndEvent
EndState