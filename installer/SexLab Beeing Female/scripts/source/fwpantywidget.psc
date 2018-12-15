;/ Decompiled by Champollion V1.0.1
Source   : FWPantyWidget.psc
Modified : 2017-01-13 12:05:24
Compiled : 2017-01-18 08:35:22
User     : admin
Computer : PATRICK
/;
scriptName FWPantyWidget extends ski_widgetbase

;-- Properties --------------------------------------
String property Script_Name
{Set this script name}
	String function get()

		return _scriptName
	endFunction
	function set(String value)

		_scriptName = value
	endFunction
endproperty
Int property STATUS_BLOODY
	Int function get()

		return 2
	endFunction
endproperty
fwsystem property System auto
Bool property CFG_Enabled auto hidden
Int property STATUS_NEEDED
	Int function get()

		return 1
	endFunction
endproperty
Int property CFG_Alpha auto hidden
Int property STATUS_NORMAL
	Int function get()

		return 0
	endFunction
endproperty
Int property Icon hidden
	Int function get()

		return ui.GetInt(self.HUD_MENU, self.WidgetRoot + ".getIcon")
	endFunction
	function set(Int value)

		ui.InvokeInt(self.HUD_MENU, self.WidgetRoot + ".setIcon", value)
	endFunction
endproperty
Bool property Shown hidden
{Set to true to show the widget}
	Bool function get()

		return _shown
	endFunction
	function set(Bool value)

		if value == true && CFG_Enabled as Bool
			self.ShowWidget()
		elseIf value == false
			self.HideWidget()
		endIf
		_shown = value
	endFunction
endproperty
String property CFG_HAnchor auto hidden
String property SWF_Name
{Set the SWF Filename like 'Widget.swf'}
	String function get()

		return _swfName
	endFunction
	function set(String value)

		_swfName = value
	endFunction
endproperty
Int property CFG_PosX auto hidden
String property CFG_VAnchor auto hidden
Int property CFG_PosY auto hidden

;-- Variables ---------------------------------------
String _swfName = ""
Int _widgetAlpha = 100
String _scriptName = ""
Bool _shown = false

;-- Functions ---------------------------------------

Float function GetHeight()

	if self.Ready
		return ui.GetFloat(self.HUD_MENU, self.WidgetRoot + ".Height")
	endIf
	return 0.000000
endFunction

String function GetWidgetType()

	return _scriptName
endFunction

function UpdateContent()

	self.X = CFG_PosX as Float
	self.Y = CFG_PosY as Float
	self.HAnchor = CFG_HAnchor
	self.VAnchor = CFG_VAnchor
	if System == none
		debug.Trace("FWPantyWidget::UpdateContent - System is none", 0)
	endIf
	if System.Sanitary_Napkin_Bloody == none
		debug.Trace("FWPantyWidget::UpdateContent - Sanitary_Napkin_Bloody is none", 0)
	endIf
	if System.Tampon_Bloody == none
		debug.Trace("FWPantyWidget::UpdateContent - Tampon_Bloody is none", 0)
	endIf
	if System.Sanitary_Napkin_Normal == none
		debug.Trace("FWPantyWidget::UpdateContent - Sanitary_Napkin_Normal is none", 0)
	endIf
	if System.Tampon_Normal == none
		debug.Trace("FWPantyWidget::UpdateContent - Tampon_Normal is none", 0)
	endIf
	if System != none
		if System.Player as Bool && System.GlobalMenstruating.GetValueInt() == 1
			if game.GetPlayer().GetWornForm(System.Sanitary_Napkin_Bloody.GetSlotMask()) == System.Sanitary_Napkin_Bloody as form
				self.Icon = self.STATUS_BLOODY
				self.Shown = true
			elseIf game.GetPlayer().GetWornForm(System.Tampon_Bloody.GetSlotMask()) == System.Tampon_Bloody as form
				self.Icon = self.STATUS_BLOODY
				self.Shown = true
			elseIf System.Player.currentState == 3
				if game.GetPlayer().GetWornForm(System.Sanitary_Napkin_Normal.GetSlotMask()) == System.Sanitary_Napkin_Normal as form
					self.Icon = self.STATUS_NORMAL
					self.Shown = false
				elseIf game.GetPlayer().GetWornForm(System.Tampon_Normal.GetSlotMask()) == System.Tampon_Normal as form
					self.Icon = self.STATUS_NORMAL
					self.Shown = false
				else
					self.Icon = self.STATUS_NEEDED
					self.Shown = true
				endIf
			else
				self.Icon = self.STATUS_NORMAL
				self.Shown = false
			endIf
		else
			self.Icon = self.STATUS_NORMAL
			self.Shown = false
		endIf
	endIf
endFunction

function OnUpdateGameTime()

	self.UpdateContent()
	self.RegisterForSingleUpdateGameTime(1.00000)
endFunction

function OnWidgetLoad()

	self.Shown = false
	parent.OnWidgetLoad()
	self.OnWidgetReset()
	if self.GetType() == 77
		self.RegisterForSingleUpdateGameTime(1.00000)
	endIf
	self.UpdateContent()
endFunction

function ShowWidget()

	if self.Ready && CFG_Enabled as Bool
		utility.Wait(0.100000)
		self.FadeTo(CFG_Alpha as Float, 0.0100000)
		if _shown == false
			self.Flash()
		endIf
		_shown = true
	endIf
endFunction

function Upgrade(Int oldVersion, Int newVersion)

	System = game.GetFormFromFile(3426, "BeeingFemale.esm") as fwsystem
endFunction

; Skipped compiler generated GotoState

Float[] function GetDimensions()
{Return the dimensions of the widget (width,height).}

	Float[] dim = new Float[2]
	dim[0] = self.GetWidth()
	dim[1] = self.GetHeight()
	return dim
endFunction

function OnWidgetReset()

	parent.OnWidgetReset()
	self.X = CFG_PosX as Float
	self.Y = CFG_PosY as Float
	self.HAnchor = CFG_HAnchor
	self.VAnchor = CFG_VAnchor
	self.Alpha = 0.000000
endFunction

function Flash()

	ui.Invoke(self.HUD_MENU, self.WidgetRoot + ".startFlash")
endFunction

; Skipped compiler generated GetState

function HideWidget()

	if self.Ready
		self.FadeTo(0.000000, 3.00000)
	endIf
	_shown = false
endFunction

Float function GetWidth()

	if self.Ready
		return ui.GetFloat(self.HUD_MENU, self.WidgetRoot + ".Width")
	endIf
	return 0.000000
endFunction

String function GetWidgetSource()

	return "BeeingFemale/" + _swfName
endFunction
