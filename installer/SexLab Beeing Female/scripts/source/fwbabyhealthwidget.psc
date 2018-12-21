Scriptname FWBabyHealthWidget extends FWWidgetBase  


bool function AllowToHide()
	if System.Controller.GetFemaleState(Target)<4
		return true
	endif
	return Target!=Game.GetPlayer() || StorageUtil.GetFloatValue(Target, "FW.UnbornHealth",100.0)>8
endFunction

bool function AllowWidgetFor(actor a)
	if CFG_Enabled && System.IsValidateFemaleActor(a)>0
		if System.Controller.GetFemaleState(Target)<4 && System.cfg.Messages>=System.MSG_Immersive
			return false
		endif
		return true
	endif
	return false
endfunction

event OnWidgetReset()
	parent.OnWidgetReset()
	X = CFG_PosX
	Y = CFG_PosY
	HAnchor = CFG_HAnchor
	VAnchor = CFG_VAnchor
endEvent

function UpdateContent()
	X = CFG_PosX
	Y = CFG_PosY
	HAnchor = CFG_HAnchor
	VAnchor = CFG_VAnchor
	if (Ready)
		int stateID=System.Controller.GetFemaleState(Target)
		if stateID<4
			UI.InvokeInt(HUD_MENU, WidgetRoot + ".setState",1) ; Set Cycle state
			UI.InvokeInt(HUD_MENU, WidgetRoot + ".setValue", Math.Floor(System.Controller.getRelativePregnancyChance(Target)))
		else
			UI.InvokeInt(HUD_MENU, WidgetRoot + ".setState",2) ; Set Pregnancy state
			
			if StorageUtil.GetIntValue(Target, "FW.Abortus",0)>1
				; Abortus has already been started
				UI.InvokeInt(HUD_MENU, WidgetRoot + ".setValue",0)
				return
			endif
			float hp = StorageUtil.GetFloatValue(Target, "FW.UnbornHealth",100.0)
			UI.InvokeFloat(HUD_MENU, WidgetRoot + ".setValue",hp)
		endif
	endif
endFunction