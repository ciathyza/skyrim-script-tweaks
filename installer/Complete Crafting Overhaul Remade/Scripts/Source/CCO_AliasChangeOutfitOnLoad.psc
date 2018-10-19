Scriptname CCO_AliasChangeOutfitOnLoad extends ReferenceAlias  

;This script is based off of one created by PrinceShroob.  It has been used with his permission.

Int Property Condition = -1 Auto  
; -1 = whenever loaded, 1 = certain stage reached, 2 = certain stage not yet reached, 3 = if in a certain job faction, 4 = if checking GV.

Outfit Property NewOutfit  Auto  		;New outfit to change into.
Outfit Property OldOutfit  Auto  			;Actor's original outfit.
Quest Property myQST  Auto  			;Check the stages of this quest.
Int Property preReqStage = -1 Auto  	;Either the stage that must have been reached or not reached, depending on the trigger type.
Faction Property preReqFaction  Auto	;Required faction for change.
GlobalVariable Property CheckGV Auto	;Check this GV
Int Property myVal Auto					;Check if GV matches this number
Int Property WhatToDo = 0 Auto			; 0 = switch outfit; 1 = add armor item 
Armor Property NewArmor Auto
Int Property AmtToAdd = 1 Auto
bool Added = false

auto STATE waiting
Event OnLoad()
	Actor selfRef = GetActorReference()
;	if !selfRef.IsInFaction(CurrentFollowerFaction) && !selfRef.IsInFaction(PlayerMarriedFaction)
	if  (Condition == 1) && (myQST.GetStage() >= preReqStage)
		gotoState("done")
		selfRef.SetOutfit(NewOutfit)
	elseif (Condition == 2) && (myQST.GetStage() < preReqStage)
		gotoState("done")
		selfRef.SetOutfit(NewOutfit)
	elseif  (Condition == 3) && (GetActorRef().IsInFaction(preReqFaction))
		gotoState("done")
		selfRef.SetOutfit(NewOutfit)
	elseif (Condition == 4) && (CheckGV.GetValue() as int == myVal) && (Added == false)
		if WhatToDo == 0
			selfRef.SetOutfit(NewOutfit)
		else
			selfRef.AddItem(NewArmor, AmtToAdd)
		endif
		Added = true
	elseif (Condition == 4) && (Added == true)
		if WhatToDo == 0
			selfRef.SetOutfit(OldOutfit)		
		else
			if selfRef.GetItemCount(NewArmor) >= AmtToAdd
				selfRef.RemoveItem(NewArmor, AmtToAdd)
			endif
		endif		
		Added == false
	elseif (Condition == -1) 
		gotoState("done")
		selfRef.SetOutfit(NewOutfit)
	endif
endEvent

Event OnDeath(Actor akKiller)
	gotoState("done")
endEvent
endState

STATE done
endState