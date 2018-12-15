;/ Decompiled by Champollion V1.0.1
Source   : FWBabyHealthWidget.psc
Modified : 2016-12-06 03:53:06
Compiled : 2017-01-18 08:35:47
User     : admin
Computer : PATRICK
/;
scriptName FWBabyHealthWidget extends FWWidgetBase

;-- Properties --------------------------------------

;-- Variables ---------------------------------------

;-- Functions ---------------------------------------

Bool function AllowWidgetFor(actor a)

	if CFG_Enabled as Bool && System.IsValidateFemaleActor(a, false) > 0
		if System.Controller.GetFemaleState(Target) < 4 && System.cfg.Messages >= System.MSG_Immersive
			return false
		endIf
		return true
	endIf
	return false
endFunction

; Skipped compiler generated GetState

function UpdateContent()

	self.X = CFG_PosX as Float
	self.Y = CFG_PosY as Float
	self.HAnchor = self.CFG_HAnchor
	self.VAnchor = self.CFG_VAnchor
	if self.Ready
		Int stateID = System.Controller.GetFemaleState(Target)
		if stateID < 4
			ui.InvokeInt(self.HUD_MENU, self.WidgetRoot + ".setState", 1)
			ui.InvokeInt(self.HUD_MENU, self.WidgetRoot + ".setValue", math.Floor(System.Controller.getRelativePregnancyChance(Target, none)))
		else
			ui.InvokeInt(self.HUD_MENU, self.WidgetRoot + ".setState", 2)
			if storageutil.GetIntValue(Target as form, "FW.Abortus", 0) > 1
				ui.InvokeInt(self.HUD_MENU, self.WidgetRoot + ".setValue", 0)
				return 
			endIf
			Float hp = storageutil.GetFloatValue(Target as form, "FW.UnbornHealth", 100.000)
			ui.InvokeFloat(self.HUD_MENU, self.WidgetRoot + ".setValue", hp)
		endIf
	endIf
endFunction

function OnWidgetReset()

	parent.OnWidgetReset()
	self.X = CFG_PosX as Float
	self.Y = CFG_PosY as Float
	self.HAnchor = self.CFG_HAnchor
	self.VAnchor = self.CFG_VAnchor
endFunction

; Skipped compiler generated GotoState

Bool function AllowToHide()

	if System.Controller.GetFemaleState(Target) < 4
		return true
	endIf
	return Target != game.GetPlayer() || storageutil.GetFloatValue(Target as form, "FW.UnbornHealth", 100.000) > 8.00000
endFunction
