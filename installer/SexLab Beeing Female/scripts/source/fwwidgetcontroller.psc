;/ Decompiled by Champollion V1.0.1
Source   : FWWidgetController.psc
Modified : 2017-01-13 11:42:39
Compiled : 2017-01-18 08:35:00
User     : admin
Computer : PATRICK
/;
scriptName FWWidgetController extends Quest

;-- Properties --------------------------------------
fwwidgetbase property ContraceptionWidget auto
fwsystem property System auto
Bool property AllowHotkey
	Bool function get()

		return _AllowHotkey
	endFunction
	function set(Bool bAllow)

		_AllowHotkey = bAllow
		self.updateConfig()
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
fwwidgetbase property StateWidget auto
fwwidgetbase property BabyHealthWidget auto

;-- Variables ---------------------------------------
Float iTime = 0.000000
Bool _shown = false
Bool _AllowHotkey = true
Float KeyPressTime = 0.000000

;-- Functions ---------------------------------------

function updateConfig()

	self.UnregisterForAllKeys()
	if _AllowHotkey == true
		self.RegisterForKey(self.Hotkey)
	endIf
endFunction

function OnUpdate()

	self.hideWidgets()
endFunction

function OnKeyUp(Int keyCode, Float holdTime)

	if !utility.IsInMenuMode()
		if holdTime > 5.00000
			System.Controller.showRankedInfoBox(game.GetPlayer(), 100)
		elseIf holdTime > 1.20000 && _shown == false
			self.showWidgets()
		elseIf _shown == true
			self.hideWidgets()
		else
			self.showWidgets()
			self.RegisterForSingleUpdate(5.00000)
		endIf
	endIf
endFunction

function showWidgets()

	_shown = true
	StateWidget.showWidget(false)
	BabyHealthWidget.showWidget(false)
	ContraceptionWidget.showWidget(false)
endFunction

; Skipped compiler generated GetState

function updatePositions()

	StateWidget.UpdateWidgetHAnchor()
	StateWidget.UpdateWidgetVAnchor()
	StateWidget.UpdateWidgetPositionX()
	StateWidget.UpdateWidgetPositionY()
	BabyHealthWidget.UpdateWidgetHAnchor()
	BabyHealthWidget.UpdateWidgetVAnchor()
	BabyHealthWidget.UpdateWidgetPositionX()
	BabyHealthWidget.UpdateWidgetPositionY()
	ContraceptionWidget.UpdateWidgetHAnchor()
	ContraceptionWidget.UpdateWidgetVAnchor()
	ContraceptionWidget.UpdateWidgetPositionX()
	ContraceptionWidget.UpdateWidgetPositionY()
endFunction

function hideWidgets()

	_shown = false
	StateWidget.hideWidget()
	BabyHealthWidget.hideWidget()
	ContraceptionWidget.hideWidget()
endFunction

; Skipped compiler generated GotoState

function OnKeyDown(Int keyCode)

	if !_shown && !utility.IsInMenuMode()
		iTime = 0.000000
		self.updatePositions()
		StateWidget.UpdateContent()
		BabyHealthWidget.UpdateContent()
		ContraceptionWidget.UpdateContent()
	endIf
endFunction
