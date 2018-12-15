;/ Decompiled by Champollion V1.0.1
Source   : FWProgressWidget.psc
Modified : 2017-01-03 08:19:43
Compiled : 2017-01-18 08:35:19
User     : admin
Computer : PATRICK
/;
scriptName FWProgressWidget extends SKI_WidgetBase

;-- Properties --------------------------------------
String property ICN_Utherus2
	String function get()

		return "Utherus2"
	endFunction
endproperty
String property ICN_Pregnancy2
	String function get()

		return "Pregnancy2"
	endFunction
endproperty
String property CFG_HAnchor auto hidden
String property ICN_Text
	String function get()

		return "Text"
	endFunction
endproperty
String property ICN_File
	String function get()

		return "File"
	endFunction
endproperty
String property ICN_Sound
	String function get()

		return "Sound"
	endFunction
endproperty
String property ICN_Animation
	String function get()

		return "Animation"
	endFunction
endproperty
Int property Percent hidden
	Int function get()

		return ui.GetInt(self.HUD_MENU, self.WidgetRoot + ".getPercent")
	endFunction
	function set(Int value)

		ui.InvokeInt(self.HUD_MENU, self.WidgetRoot + ".setPercent", value)
		lastPercent = value
	endFunction
endproperty
String property ICN_Failed
	String function get()

		return "Failed"
	endFunction
endproperty
String property ICN_Utherus
	String function get()

		return "Utherus"
	endFunction
endproperty
String property ICN_Compatibility
	String function get()

		return "Compatibility"
	endFunction
endproperty
String property ICN_Pregnancy4
	String function get()

		return "Pregnancy4"
	endFunction
endproperty
String property ICN_Init
	String function get()

		return "Init"
	endFunction
endproperty
String property ICN_Drip
	String function get()

		return "Drip"
	endFunction
endproperty
String property ICN_FileCheck
	String function get()

		return "FileCheck"
	endFunction
endproperty
Bool property AboutToClose hidden
	Bool function get()

		return _bAboutToClose
	endFunction
	function set(Bool value)

		if value == true && _bAboutToClose == false
			self.Flash()
			self.RegisterForSingleUpdate(3.00000)
		elseIf value == false && _bAboutToClose == true
			self.UnregisterForUpdate()
		endIf
		_bAboutToClose = value
	endFunction
endproperty
String property Icon hidden
	String function get()

		return ui.GetString(self.HUD_MENU, self.WidgetRoot + ".getIcon")
	endFunction
	function set(String value)

		ui.InvokeString(self.HUD_MENU, self.WidgetRoot + ".setIcon", value)
		lastIcon = value
	endFunction
endproperty
String property ICN_Replanish
	String function get()

		return "Replanish"
	endFunction
endproperty
String property ICN_Pregnancy3
	String function get()

		return "Pregnancy3"
	endFunction
endproperty
String property CFG_VAnchor auto hidden
String property Job hidden
	String function get()

		return ui.GetString(self.HUD_MENU, self.WidgetRoot + ".getPhase")
	endFunction
	function set(String value)

		ui.InvokeString(self.HUD_MENU, self.WidgetRoot + ".setPhase", value)
		lastMessage = value
	endFunction
endproperty
String property ICN_Folicular
	String function get()

		return "Folicular"
	endFunction
endproperty
String property ICN_Voice
	String function get()

		return "Voice"
	endFunction
endproperty
String property ICN_Update
	String function get()

		return "Update"
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
Int property CFG_PosY auto hidden
Bool property Shown hidden
{Set to true to show the widget}
	Bool function get()

		return _shown
	endFunction
	function set(Bool value)

		if value == true && CFG_Enabled == true
			self.X = CFG_PosX as Float
			self.Y = CFG_PosY as Float
			self.HAnchor = CFG_HAnchor
			self.VAnchor = CFG_VAnchor
			_bAboutToClose = false
			_bAboutToShow = true
			self.Alpha = CFG_Alpha as Float
			_shown = value
		elseIf value == false
			_bAboutToClose = true
			_bAboutToShow = false
			self.FadeTo(0.000000, 1.50000)
			_shown = value
		endIf
	endFunction
endproperty
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
String property ICN_Wait
	String function get()

		return "Wait"
	endFunction
endproperty
String property ICN_Checked
	String function get()

		return "Checked"
	endFunction
endproperty
String property ICN_Sperm
	String function get()

		return "Sperm"
	endFunction
endproperty
String property ICN_AddOn
	String function get()

		return "AddOn"
	endFunction
endproperty
Bool property CFG_Enabled auto hidden
String property ICN_Pregnancy
	String function get()

		return "Pregnancy"
	endFunction
endproperty
String property ICN_Search
	String function get()

		return "Search"
	endFunction
endproperty
String property ICN_Progress
	String function get()

		return "Progress"
	endFunction
endproperty
Int property CFG_PosX auto hidden

;-- Variables ---------------------------------------
Int lastPercent = 0
String lastMessage = ""
Bool _bAboutToShow = false
String lastIcon = ""
String _swfName = ""
String _scriptName = ""
Bool _bAboutToClose = false
Bool _shown = false
Int _widgetAlpha = 100

;-- Functions ---------------------------------------

Float[] function GetDimensions()
{Return the dimensions of the widget (width,height).}

	Float[] dim = new Float[2]
	dim[0] = self.GetWidth()
	dim[1] = self.GetHeight()
	return dim
endFunction

String function GetWidgetSource()

	return "BeeingFemale/" + _swfName
endFunction

function OnUpdate()

	if _bAboutToClose == true
		self.Shown = false
	elseIf _bAboutToShow == true
		self.Shown = true
	endIf
endFunction

; Skipped compiler generated GotoState

function Flash()

	ui.Invoke(self.HUD_MENU, self.WidgetRoot + ".startFlash")
endFunction

function set(String sJob, Int iPercent, String sIcon, Bool bClose)

	if sJob != ""
		self.Job = sJob
	endIf
	if iPercent >= 0
		self.Percent = iPercent
	endIf
	if sIcon != ""
		self.Icon = sIcon
	endIf
	if bClose == true
		self.AboutToClose = true
	elseIf _shown == false
		self.Shown = true
	endIf
endFunction

String function GetWidgetType()

	return _scriptName
endFunction

Float function GetWidth()

	if self.Ready
		return ui.GetFloat(self.HUD_MENU, self.WidgetRoot + ".Width")
	endIf
	return 0.000000
endFunction

Float function GetHeight()

	if self.Ready
		return ui.GetFloat(self.HUD_MENU, self.WidgetRoot + ".Height")
	endIf
	return 0.000000
endFunction

function OnWidgetLoad()

	_bAboutToClose = true
	_bAboutToShow = false
	self.FadeTo(0.000000, 0.0100000)
	_shown = false
	parent.OnWidgetLoad()
	self.OnWidgetReset()
endFunction

function OnWidgetReset()

	self.X = CFG_PosX as Float
	self.Y = CFG_PosY as Float
	self.HAnchor = CFG_HAnchor
	self.VAnchor = CFG_VAnchor
	parent.OnWidgetReset()
	ui.InvokeString(self.HUD_MENU, self.WidgetRoot + ".setPhase", lastMessage)
	ui.InvokeString(self.HUD_MENU, self.WidgetRoot + ".setIcon", lastIcon)
	ui.InvokeInt(self.HUD_MENU, self.WidgetRoot + ".setPercent", lastPercent)
endFunction

function showWidget()

	if CFG_Enabled
		self.Shown = true
	endIf
endFunction

function hideWidget()

	self.Shown = false
endFunction

; Skipped compiler generated GetState
