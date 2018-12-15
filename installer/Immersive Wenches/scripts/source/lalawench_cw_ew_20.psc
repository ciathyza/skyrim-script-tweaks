Scriptname lalawench_CW_EW_20 extends ObjectReference  


Actor Property PlayerRef Auto
Quest Property lalawench_introquest Auto
GlobalVariable Property lalawench_CWintro_noteread_2 Auto
GlobalVariable Property lalawench_CWintro_noteread Auto
GlobalVariable Property lalawench_CW_got1stnote Auto


Event OnContainerChanged(ObjectReference newContainer, ObjectReference oldContainer)
lalawench_CW_got1stnote.setvalue(1)
EndEvent

Event OnEquipped(Actor reader)
If (lalawench_CWintro_noteread_2.GetValueInt() == 0)
	if (reader != PlayerRef)
		return
	endif
       lalawench_introquest.SetObjectiveDisplayed(10,false)
       lalawench_introquest.SetObjectiveDisplayed(20,true)
       lalawench_introquest.SetObjectiveDisplayed(15,true)
       lalawench_introquest.SetObjectiveDisplayed(14,true)
       lalawench_introquest.SetObjectiveDisplayed(13,true)
       lalawench_introquest.SetObjectiveDisplayed(12,true)
       lalawench_introquest.SetObjectiveDisplayed(11,true)
       lalawench_introquest.SetStage(20)
lalawench_CWintro_noteread.setvalue(1)
lalawench_CWintro_noteread_2.setvalue(1)
Endif
EndEvent

Event OnActivate(ObjectReference reader)
If (lalawench_CWintro_noteread_2.GetValueInt() == 0)
	if (reader != PlayerRef)
		return
	endif
       lalawench_introquest.SetObjectiveDisplayed(10,false)
       lalawench_introquest.SetObjectiveDisplayed(20,true)
       lalawench_introquest.SetObjectiveDisplayed(15,true)
       lalawench_introquest.SetObjectiveDisplayed(14,true)
       lalawench_introquest.SetObjectiveDisplayed(13,true)
       lalawench_introquest.SetObjectiveDisplayed(12,true)
       lalawench_introquest.SetObjectiveDisplayed(11,true)
       lalawench_introquest.SetStage(20)
lalawench_CWintro_noteread.setvalue(1)
lalawench_CWintro_noteread_2.setvalue(1)
Endif
EndEvent  