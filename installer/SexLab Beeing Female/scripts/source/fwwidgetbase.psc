;/ Decompiled by Champollion V1.0.1
Source   : FWWidgetBase.psc
Modified : 2016-12-06 03:52:30
Compiled : 2017-01-18 08:35:01
User     : admin
Computer : PATRICK
/;
scriptName FWWidgetBase extends ski_widgetbase

;-- Properties --------------------------------------
Bool property Shown
{Set to true to show the widget}
	Bool function get()

		return _shown
	endFunction
	function set(Bool value)

		if value == true && _shown == false && CFG_Enabled == true
			self.ShowWidget(false)
			_shown = value
		elseIf value == false && _shown == true
			self.HideWidget()
			_shown = value
		endIf
	endFunction
endproperty
Bool property AllowHotkey
	Bool function get()

		return _AllowHotkey
	endFunction
	function set(Bool bAllow)

		_AllowHotkey = bAllow
		self.updateConfig()
	endFunction
endproperty
actor property Target auto hidden
String property CFG_HAnchor
	String function get()

		return self.HAnchor
	endFunction
	function set(String value)

		self.HAnchor = self.DirFormat(value)
		self.UpdateWidgetHAnchor()
	endFunction
endproperty
String property CFG_VAnchor
	String function get()

		return self.VAnchor
	endFunction
	function set(String value)

		self.VAnchor = self.DirFormat(value)
		self.UpdateWidgetVAnchor()
	endFunction
endproperty
Int property Hotkey hidden
{The hotkey used to display the widget.}
	Int function get()

		return System.cfg.KeyStateWidget
	endFunction
	function set(Int value)

		System.cfg.KeyStateWidget = value
		self.updateConfig()
	endFunction
endproperty
Int property DisplayTime
{The time the widget is displayed if control mode is set to "timedHotkey".}
	Int function get()

		return _displayTime
	endFunction
	function set(Int time)

		_displayTime = time
	endFunction
endproperty
Int property CFG_PosY auto hidden
Bool property CFG_Enabled auto hidden
Int property CFG_Alpha auto hidden
String property Script_Name
{Set this script name}
	String function get()

		return _scriptName
	endFunction
	function set(String value)

		_scriptName = value
	endFunction
endproperty
String property SWF_Name
{Set the SWF Filename like 'Widget.swf'}
	String function get()

		return _swfName
	endFunction
	function set(String value)

		_swfName = value
	endFunction
endproperty
fwsystem property System auto
Float property UpdateDelay = 5.00000 auto
Int property CFG_PosX auto hidden
Int property WidgetAlpha
{Set the alpha value of the widget (in percent 0 ... 100)}
	Int function get()

		return _widgetAlpha
	endFunction
	function set(Int value)

		_widgetAlpha = value
	endFunction
endproperty

;-- Variables ---------------------------------------
Int _displayTime = 1
Bool _shown = false
Float VisibilityStart = 0.000000
Int _widgetAlpha = 100
Int iTime = 0
Bool StayVisible = false
Float startTime = 0.000000
String _swfName = ""
String _scriptName = ""
Bool _AllowHotkey = true

;-- Functions ---------------------------------------

function ShowWidget(Bool Flash)

	if self.Ready && !_shown && CFG_Enabled as Bool
		_shown = true
		if self.AllowWidgetFor(game.GetPlayer()) == false
			return 
		endIf
		Target = game.GetPlayer()
		if Flash == true
			self.FadeTo(CFG_Alpha as Float, 0.0100000)
			self.Flash()
		else
			self.FadeTo(CFG_Alpha as Float, 0.200000)
		endIf
		self.RegisterForUpdate(UpdateDelay)
	elseIf self.Ready && Flash
		self.Flash()
	endIf
endFunction

function showTargeTimed(actor a, Bool Flash)

	if CFG_Enabled
		self.showTargetWidget(a, Flash)
		utility.Wait(3.00000)
		self.HideWidget()
	endIf
endFunction

String function DirFormat(String value)

	if value == "Left" || value == "Left"
		return "Left"
	endIf
	if value == "Right" || value == "Right"
		return "Right"
	endIf
	if value == "Top" || value == "Top"
		return "Top"
	endIf
	if value == "Bottom" || value == "Bottom"
		return "Bottom"
	endIf
	if value == "Both" || value == "Both"
		return "Both"
	endIf
	if value == "Center" || value == "Center"
		return "Center"
	endIf
	if value == "True" || value == "True"
		return "True"
	endIf
	if value == "False" || value == "False"
		return "False"
	endIf
	return value
endFunction

function showTimed(Bool Flash)

	self.ShowWidget(Flash)
	utility.Wait(3.00000)
	self.HideWidget()
endFunction

function Upgrade(Int oldVersion, Int newVersion)

	; Empty function
endFunction

function showTargetWidget(actor a, Bool Flash)

	if self.Ready && !_shown && CFG_Enabled as Bool
		_shown = true
		if self.AllowWidgetFor(game.GetPlayer()) == false
			return 
		endIf
		Target = a
		if Flash == true
			self.FadeTo(CFG_Alpha as Float, 0.0100000)
			self.Flash()
		else
			self.FadeTo(CFG_Alpha as Float, 0.200000)
		endIf
		self.RegisterForUpdate(UpdateDelay)
	elseIf self.Ready && Flash
		self.Flash()
	endIf
endFunction

function OnWidgetLoad()

	_shown = false
	iTime = 0
	startTime = 0.000000
	parent.OnWidgetLoad()
	self.OnWidgetReset()
endFunction

Bool function AllowWidgetFor(actor a)

	return CFG_Enabled
endFunction

; Skipped compiler generated GotoState

function Flash()

	ui.Invoke(self.HUD_MENU, self.WidgetRoot + ".startFlash")
endFunction

function OnUpdate()

	self.UpdateContent()
endFunction

function updateConfig()

	if self.GetType() == 77
		self.UnregisterForAllKeys()
		self.UnregisterForModEvent("BeeingFemale")
		self.RegisterForModEvent("BeeingFemale", "BeeingFemaleEvent")
	endIf
endFunction

String function GetWidgetType()

	return _scriptName
endFunction

String function GetWidgetSource()

	return "BeeingFemale/" + _swfName
endFunction

Float[] function GetDimensions()
{Return the dimensions of the widget (width,height).}

	Float[] dim = new Float[2]
	dim[0] = self.GetWidth()
	dim[1] = self.GetHeight()
	return dim
endFunction

function BeeingFemaleEvent(String eventName, String strArg, Float numArg, Form sender)

	if eventName == "BeeingFemale" && strArg == "ResetWidgets"
		self.UnregisterForUpdate()
		if self.Ready
			self.FadeTo(0.000000, 3.00000)
		endIf
		_shown = false
		iTime = 0
		startTime = 0.000000
		self.updateConfig()
		self.UpdateContent()
	endIf
endFunction

Float function GetHeight()

	if self.Ready
		return ui.GetFloat(self.HUD_MENU, self.WidgetRoot + ".Height")
	endIf
	return 0.000000
endFunction

Float function GetWidth()

	if self.Ready
		return ui.GetFloat(self.HUD_MENU, self.WidgetRoot + ".Width")
	endIf
	return 0.000000
endFunction

; Skipped compiler generated GetState

function OnWidgetReset()

	parent.OnWidgetReset()
	_shown = false
	_AllowHotkey = true
	iTime = 0
	startTime = 0.000000
	self.updateConfig()
	self.UpdateContent()
endFunction

function HideWidget()

	if self.GetType() == 77
		self.UnregisterForUpdate()
	endIf
	if self.Ready
		self.FadeTo(0.000000, 3.00000)
	endIf
	_shown = false
endFunction

function OnKeyUp(Int keyCode, Float holdTime)

	; Empty function
endFunction

function UpdateContent()

	; Empty function
endFunction

Bool function AllowToHide()

	return true
endFunction
