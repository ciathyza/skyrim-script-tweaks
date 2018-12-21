Scriptname FWStateWidget extends FWWidgetBase  


string iFillDirection = "left"
string property CFG_FillDirection
	string function get()
		return iFillDirection
	endFunction
	function set(string dir)
		iFillDirection = DirFormat(dir)
		UI.InvokeString(HUD_MENU, WidgetRoot + ".setFillDirection", dir)
	endFunction
endProperty

int iColor = 0x880044
int property CFG_Color
	int function get()
		return iColor
	endFunction
	function set(int col)
		iColor = col
		UI.InvokeInt(HUD_MENU, WidgetRoot + ".setColor", col)
	endFunction
endProperty

int iDarkColor = 0x880044
int property CFG_DarkColor
	int function get()
		return iDarkColor
	endFunction
	function set(int col)
		iDarkColor = col
		UI.InvokeInt(HUD_MENU, WidgetRoot + ".setDarkColor", col)
	endFunction
endProperty

int iFlashColor = 0xFF55CC
int property CFG_FlashColor
	int function get()
		return iFlashColor
	endFunction
	function set(int col)
		iFlashColor = col
		UI.InvokeInt(HUD_MENU, WidgetRoot + ".setFlashColor", col)
	endFunction
endProperty

string iIconPosition = "left"
string property CFG_IconPosition
	string function get()
		return iIconPosition
	endFunction
	function set(string pos)
		iIconPosition = DirFormat(pos)
		UI.InvokeString(HUD_MENU, WidgetRoot + ".setIconPosition", pos)
	endFunction
endProperty



bool function AllowWidgetFor(actor a)
	return System.IsValidateActor(a)>0 && System.cfg.Messages<System.MSG_Immersive
endfunction

function Upgrade(int oldVersion, int newVersion)
	if oldVersion<9
		X = CFG_PosX
		Y = CFG_PosY
		HAnchor = CFG_HAnchor
		VAnchor = CFG_VAnchor
	endif
endFunction

function UpdateContent()
	X = CFG_PosX
	Y = CFG_PosY
	HAnchor = CFG_HAnchor
	VAnchor = CFG_VAnchor

	if (Ready)
		UI.InvokeString(HUD_MENU, WidgetRoot + ".setFillDirection", iFillDirection)
		UI.InvokeInt(HUD_MENU, WidgetRoot + ".setColor", iColor)
		UI.InvokeInt(HUD_MENU, WidgetRoot + ".setDarkColor", iDarkColor)
		UI.InvokeInt(HUD_MENU, WidgetRoot + ".setFlashColor", iFlashColor)
		
		if System.IsValidateFemaleActor(Target)>0
			if(System.IsActorPregnantByChaurus(Target))
				; Chaurus
				UI.InvokeString(HUD_MENU, WidgetRoot + ".setPhase", System.Content.StateID21)
				UI.InvokeInt(HUD_MENU, WidgetRoot + ".setIcon", 21)
				UI.InvokeFloat(HUD_MENU, WidgetRoot + ".setPercent", 0)
				UI.InvokeString(HUD_MENU, WidgetRoot + ".setDuration", System.cfg.GetTimeString(Utility.GetCurrentGameTime() - StorageUtil.GetFloatValue(Target, "FW.PauseTime",0),true))
			else
				int stateID = System.Controller.GetFemaleState(Target)
				float xStateDelay = Utility.GetCurrentGameTime() - System.Controller.GetStateEnterTime(Target)
				string since = System.cfg.GetTimeString(xStateDelay,true)
				string s=""
				if stateID==0
					s=System.Content.StateID0
				elseif stateID==1
					s=System.Content.StateID1
				elseif stateID==2
					s=System.Content.StateID2
				elseif stateID==3
					s=System.Content.StateID3
				elseif stateID==4
					s=System.Content.StateID4
				elseif stateID==5
					s=System.Content.StateID5
				elseif stateID==6
					s=System.Content.StateID6
				elseif stateID==7
					s=System.Content.StateID7
				elseif stateID==8
					s=System.Content.StateID8
				else
					s=System.Content.StateUnknown
				endIf
				float statePerc=System.Controller.GetStatePercentage(Target)
				UI.InvokeString(HUD_MENU, WidgetRoot + ".setPhase", s)
				UI.InvokeInt(HUD_MENU, WidgetRoot + ".setIcon", stateID)
				UI.InvokeFloat(HUD_MENU, WidgetRoot + ".setPercent", statePerc)
				if StorageUtil.GetFloatValue(Target, "FW.PauseTime",0)>0
					UI.InvokeString(HUD_MENU, WidgetRoot + ".setDuration", System.Content.StateUnknown)
				else
					UI.InvokeString(HUD_MENU, WidgetRoot + ".setDuration", since)
				endif
			endif
		elseif System.IsValidateMaleActor(Target)>0
			float virility=System.Controller.GetVirility(Target)
			float dur = (System.cfg.MaleVirilityRecovery * System.Manager.ActorMaleRecoveryScale(Target)) - System.Controller.GetDaysSinceLastSex(Target)
			UI.InvokeInt(HUD_MENU, WidgetRoot + ".setIcon", 50)
			UI.InvokeString(HUD_MENU, WidgetRoot + ".setPhase", FWUtility.StringReplace(System.Content.InfoSpell_SpermVirility,"{0}", Math.Floor(virility*100)) + "%")
			if dur<0
				UI.InvokeString(HUD_MENU, WidgetRoot + ".setDuration","")
			else
				UI.InvokeString(HUD_MENU, WidgetRoot + ".setDuration",System.cfg.GetTimeString(dur,true))
			endif
			UI.InvokeFloat(HUD_MENU, WidgetRoot + ".setPercent", virility)
		endif
	endif
endFunction