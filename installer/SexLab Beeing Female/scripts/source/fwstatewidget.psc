;/ Decompiled by Champollion V1.0.1
Source   : FWStateWidget.psc
Modified : 2017-01-02 21:18:46
Compiled : 2017-01-18 08:35:11
User     : admin
Computer : PATRICK
/;
scriptName FWStateWidget extends FWWidgetBase

;-- Properties --------------------------------------
Int property CFG_FlashColor
	Int function get()

		return iFlashColor
	endFunction
	function set(Int col)

		iFlashColor = col
		ui.InvokeInt(self.HUD_MENU, self.WidgetRoot + ".setFlashColor", col)
	endFunction
endproperty
Int property CFG_DarkColor
	Int function get()

		return iDarkColor
	endFunction
	function set(Int col)

		iDarkColor = col
		ui.InvokeInt(self.HUD_MENU, self.WidgetRoot + ".setDarkColor", col)
	endFunction
endproperty
Int property CFG_Color
	Int function get()

		return iColor
	endFunction
	function set(Int col)

		iColor = col
		ui.InvokeInt(self.HUD_MENU, self.WidgetRoot + ".setColor", col)
	endFunction
endproperty
String property CFG_FillDirection
	String function get()

		return iFillDirection
	endFunction
	function set(String dir)

		iFillDirection = self.DirFormat(dir)
		ui.InvokeString(self.HUD_MENU, self.WidgetRoot + ".setFillDirection", dir)
	endFunction
endproperty
String property CFG_IconPosition
	String function get()

		return iIconPosition
	endFunction
	function set(String pos)

		iIconPosition = self.DirFormat(pos)
		ui.InvokeString(self.HUD_MENU, self.WidgetRoot + ".setIconPosition", pos)
	endFunction
endproperty

;-- Variables ---------------------------------------
Int iFlashColor = 16733644
String iIconPosition = "left"
Int iColor = 8912964
Int iDarkColor = 8912964
String iFillDirection = "left"

;-- Functions ---------------------------------------

; Skipped compiler generated GetState

; Skipped compiler generated GotoState

function UpdateContent()

	self.X = CFG_PosX as Float
	self.Y = CFG_PosY as Float
	self.HAnchor = self.CFG_HAnchor
	self.VAnchor = self.CFG_VAnchor
	if self.Ready
		ui.InvokeString(self.HUD_MENU, self.WidgetRoot + ".setFillDirection", iFillDirection)
		ui.InvokeInt(self.HUD_MENU, self.WidgetRoot + ".setColor", iColor)
		ui.InvokeInt(self.HUD_MENU, self.WidgetRoot + ".setDarkColor", iDarkColor)
		ui.InvokeInt(self.HUD_MENU, self.WidgetRoot + ".setFlashColor", iFlashColor)
		if System.IsValidateFemaleActor(Target, false) > 0
			if System.IsActorPregnantByChaurus(Target)
				ui.InvokeString(self.HUD_MENU, self.WidgetRoot + ".setPhase", System.Content.StateID21)
				ui.InvokeInt(self.HUD_MENU, self.WidgetRoot + ".setIcon", 21)
				ui.InvokeFloat(self.HUD_MENU, self.WidgetRoot + ".setPercent", 0.000000)
				ui.InvokeString(self.HUD_MENU, self.WidgetRoot + ".setDuration", System.cfg.GetTimeString(utility.GetCurrentGameTime() - storageutil.GetFloatValue(Target as form, "FW.PauseTime", 0.000000), true, "", true))
			else
				Int stateID = System.Controller.GetFemaleState(Target)
				Float xStateDelay = utility.GetCurrentGameTime() - System.Controller.GetStateEnterTime(Target)
				String since = System.cfg.GetTimeString(xStateDelay, true, "", true)
				String S = ""
				if stateID == 0
					S = System.Content.StateID0
				elseIf stateID == 1
					S = System.Content.StateID1
				elseIf stateID == 2
					S = System.Content.StateID2
				elseIf stateID == 3
					S = System.Content.StateID3
				elseIf stateID == 4
					S = System.Content.StateID4
				elseIf stateID == 5
					S = System.Content.StateID5
				elseIf stateID == 6
					S = System.Content.StateID6
				elseIf stateID == 7
					S = System.Content.StateID7
				elseIf stateID == 8
					S = System.Content.StateID8
				else
					S = System.Content.StateUnknown
				endIf
				Float statePerc = System.Controller.GetStatePercentage(Target)
				ui.InvokeString(self.HUD_MENU, self.WidgetRoot + ".setPhase", S)
				ui.InvokeInt(self.HUD_MENU, self.WidgetRoot + ".setIcon", stateID)
				ui.InvokeFloat(self.HUD_MENU, self.WidgetRoot + ".setPercent", statePerc)
				if storageutil.GetFloatValue(Target as form, "FW.PauseTime", 0.000000) > 0.000000
					ui.InvokeString(self.HUD_MENU, self.WidgetRoot + ".setDuration", System.Content.StateUnknown)
				else
					ui.InvokeString(self.HUD_MENU, self.WidgetRoot + ".setDuration", since)
				endIf
			endIf
		elseIf System.IsValidateMaleActor(Target, false) > 0
			Float virility = System.Controller.GetVirility(Target)
			Float dur = System.cfg.MaleVirilityRecovery * System.Manager.ActorMaleRecoveryScale(Target) - System.Controller.GetDaysSinceLastSex(Target)
			ui.InvokeInt(self.HUD_MENU, self.WidgetRoot + ".setIcon", 50)
			ui.InvokeString(self.HUD_MENU, self.WidgetRoot + ".setPhase", fwutility.StringReplace(System.Content.InfoSpell_SpermVirility, "{0}", math.Floor(virility * 100.000) as String) + "%")
			if dur < 0.000000
				ui.InvokeString(self.HUD_MENU, self.WidgetRoot + ".setDuration", "")
			else
				ui.InvokeString(self.HUD_MENU, self.WidgetRoot + ".setDuration", System.cfg.GetTimeString(dur, true, "", true))
			endIf
			ui.InvokeFloat(self.HUD_MENU, self.WidgetRoot + ".setPercent", virility)
		endIf
	endIf
endFunction

Bool function AllowWidgetFor(actor a)

	return System.IsValidateActor(a, false) > 0 && System.cfg.Messages < System.MSG_Immersive
endFunction

function Upgrade(Int oldVersion, Int newVersion)

	if oldVersion < 9
		self.X = CFG_PosX as Float
		self.Y = CFG_PosY as Float
		self.HAnchor = self.CFG_HAnchor
		self.VAnchor = self.CFG_VAnchor
	endIf
endFunction
