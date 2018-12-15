;/ Decompiled by Champollion V1.0.1
Source   : FWContraceptionWidget.psc
Modified : 2017-01-13 12:05:28
Compiled : 2017-01-18 08:35:32
User     : admin
Computer : PATRICK
/;
scriptName FWContraceptionWidget extends FWWidgetBase

;-- Properties --------------------------------------
Int property CFG_Color
	Int function get()

		return iColor
	endFunction
	function set(Int col)

		iColor = col
		ui.InvokeInt(self.HUD_MENU, self.WidgetRoot + ".setColor", col)
	endFunction
endproperty
Int property CFG_FlashColor
	Int function get()

		return iFlashColor
	endFunction
	function set(Int col)

		iFlashColor = col
		ui.InvokeInt(self.HUD_MENU, self.WidgetRoot + ".setFlashColor", col)
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
String property CFG_FillDirection
	String function get()

		return iFillDirection
	endFunction
	function set(String dir)

		iFillDirection = self.DirFormat(dir)
		ui.InvokeString(self.HUD_MENU, self.WidgetRoot + ".setFillDirection", dir)
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

;-- Variables ---------------------------------------
String iFillDirection = "right"
String iIconPosition = "right"
Int iColor = 4456584
Int iDarkColor = 8912964
Int iFlashColor = 13391359

;-- Functions ---------------------------------------

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
			Float Contraception = System.Controller.GetContraception(Target)
			Float lastC = storageutil.GetFloatValue(Target as form, "FW.ContraceptionTime", 0.000000)
			if Contraception > 0.0200000 && lastC > 0.000000
				Float fsince = System.GetPillDuration(Target) - utility.GetCurrentGameTime() - lastC
				String since = System.cfg.GetTimeString(fsince, true, System.Content.InfoSpell_Overdue, false)
				ui.InvokeString(self.HUD_MENU, self.WidgetRoot + ".setDuration", since)
			else
				ui.InvokeString(self.HUD_MENU, self.WidgetRoot + ".setDuration", "")
			endIf
			ui.InvokeString(self.HUD_MENU, self.WidgetRoot + ".setValue", fwutility.StringReplace(System.Content.InfoSpell_Contraception, "{0}", math.Ceiling(Contraception) as String))
			ui.InvokeFloat(self.HUD_MENU, self.WidgetRoot + ".setPercent", Contraception / 100.000)
		endIf
	endIf
endFunction

; Skipped compiler generated GetState

Bool function AllowToHide()

	if Target != game.GetPlayer()
		return true
	endIf
	Float ct = storageutil.GetFloatValue(Target as form, "FW.ContraceptionTime", 0.000000)
	if ct > 0.000000
		Float gt = utility.GetCurrentGameTime() - System.GetPillDuration(Target)
		return gt - ct < -0.500000 || gt - ct > 0.500000
	else
		return true
	endIf
endFunction

function Upgrade(Int oldVersion, Int newVersion)

	System.UpdateState = 65
	if oldVersion < 9
		self.X = CFG_PosX as Float
		self.Y = CFG_PosY as Float
		self.HAnchor = self.CFG_HAnchor
		self.VAnchor = self.CFG_VAnchor
	endIf
	System.UpdateState = 66
endFunction

function OnUpdateGameTime()

	if self.AllowToHide() == false
		self.showTargeTimed(Target, false)
	endIf
endFunction

Bool function AllowWidgetFor(actor a)

	return storageutil.GetFloatValue(a as form, "FW.ContraceptionTime", 0.000000) > 0.000000 && storageutil.GetFloatValue(a as form, "FW.ContraceptionTime", 0.000000) - 8.00000 < utility.GetCurrentGameTime() && System.IsValidateFemaleActor(a, false) > 0
endFunction

function OnWidgetReset()

	parent.OnWidgetReset()
	if self.GetType() == 77
		self.RegisterForUpdateGameTime(0.250000)
	endIf
endFunction
