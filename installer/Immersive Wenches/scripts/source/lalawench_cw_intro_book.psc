Scriptname lalawench_CW_intro_book extends ObjectReference  


Actor Property PlayerRef Auto
Quest Property lalawench_introquest Auto
GlobalVariable Property lalawench_CWintro_noteread Auto

Event OnEquipped(Actor reader)
If (lalawench_CWintro_noteread.GetValueInt() == 0)
	if (reader != PlayerRef)
		return
	endif
       lalawench_introquest.SetObjectiveDisplayed(10)
       lalawench_introquest.SetStage(10)
lalawench_CWintro_noteread.setvalue(1)
Endif
EndEvent

Event OnActivate(ObjectReference reader)
If (lalawench_CWintro_noteread.GetValueInt() == 0)
	if (reader != PlayerRef)
		return
	endif
       lalawench_introquest.SetObjectiveDisplayed(10)
       lalawench_introquest.SetStage(10)
lalawench_CWintro_noteread.setvalue(1)
Endif
EndEvent  