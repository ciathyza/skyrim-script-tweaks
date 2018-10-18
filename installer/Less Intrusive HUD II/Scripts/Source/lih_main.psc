;/ Decompiled by Champollion V1.0.0
Source   : LIH_Main.psc
Modified : 2013-05-02 03:21:30
Compiled : 2013-05-02 03:21:32
User     : POL
Computer : POL-I7
/;
scriptName LIH_Main extends SKI_QuestBase

; -------------------------------------------------------------------------------------------------
; Properties
; -------------------------------------------------------------------------------------------------

globalvariable property _LIH_Default      auto
globalvariable property _LIH_DownKey      auto
globalvariable property _LIH_Enabled      auto
globalvariable property _LIH_Key          auto
globalvariable property _LIH_LeftKey      auto
globalvariable property _LIH_NextKey      auto
globalvariable property _LIH_PrevKey      auto
globalvariable property _LIH_ResetKey     auto
globalvariable property _LIH_RightKey     auto
globalvariable property _LIH_RotateKey    auto
globalvariable property _LIH_ScaleDownKey auto
globalvariable property _LIH_ScaleUpKey   auto
globalvariable property _LIH_Selected     auto
globalvariable property _LIH_StepKey      auto
globalvariable property _LIH_UpKey        auto
lih_configmenu property ConfigMenu        auto


; -------------------------------------------------------------------------------------------------
; Properties
; -------------------------------------------------------------------------------------------------

Bool active


; -------------------------------------------------------------------------------------------------
; Events
; -------------------------------------------------------------------------------------------------

function OnUpdate()
endFunction


function OnMenuClose(String a_menuName)
	if a_menuName == "INVENTORY_MENU"
	endIf
endFunction


function OnKeyUp(Int keyCode, Float holdTime)
	if utility.IsInMenuMode()
		return 
	endIf

	if !self.isActive()
		self.deactivate()
		return 
	endIf

	Int isKey = keyCode
	if isKey == _LIH_Key.GetValueInt()
		ConfigMenu.ToggleHUD()
	endIf
	
	if _LIH_Selected.GetValueInt() > 0
		if _LIH_Default.GetValueInt() < 2
			_LIH_Default.SetValueInt(2)
		endIf
		if isKey == _LIH_LeftKey.GetValueInt()
			ConfigMenu.MoveLeft()
		elseIf isKey == _LIH_RightKey.GetValueInt()
			ConfigMenu.MoveRight()
		elseIf isKey == _LIH_UpKey.GetValueInt()
			ConfigMenu.MoveUp()
		elseIf isKey == _LIH_DownKey.GetValueInt()
			ConfigMenu.MoveDown()
		elseIf isKey == _LIH_ScaleUpKey.GetValueInt()
			ConfigMenu.ZoomIn()
		elseIf isKey == _LIH_ScaleDownKey.GetValueInt()
			ConfigMenu.ZoomOut()
		elseIf isKey == _LIH_NextKey.GetValueInt()
			ConfigMenu.NextItem()
		elseIf isKey == _LIH_PrevKey.GetValueInt()
			ConfigMenu.PreviousItem()
		elseIf isKey == _LIH_StepKey.GetValueInt()
			ConfigMenu.ToggleStep()
		elseIf isKey == _LIH_ResetKey.GetValueInt()
			ConfigMenu.ResetItem()
		elseIf isKey == _LIH_RotateKey.GetValueInt()
			ConfigMenu.RotateAlign()
		endIf
	endIf
endFunction


function OnInit()
	self.OnGameReload()
endFunction


function OnMenuOpen(String a_menuName)
	if a_menuName == "INVENTORY_MENU"
	endIf
endFunction


function OnGameReload()
	self.reset()
endFunction


; -------------------------------------------------------------------------------------------------
; Functions
; -------------------------------------------------------------------------------------------------

function deactivate()
	self.UnregisterForAllKeys()
endFunction


Bool function isActive()
	return _LIH_Enabled.GetValueInt() > 0
endFunction


function reset()
	self.UnRegisterForUpdate()
	if self.isActive()
	else
		self.deactivate()
	endIf

	self.RegisterForKey(_LIH_Key.GetValueInt())
	self.RegisterForKey(_LIH_LeftKey.GetValueInt())
	self.RegisterForKey(_LIH_RightKey.GetValueInt())
	self.RegisterForKey(_LIH_UpKey.GetValueInt())
	self.RegisterForKey(_LIH_DownKey.GetValueInt())
	self.RegisterForKey(_LIH_ScaleUpKey.GetValueInt())
	self.RegisterForKey(_LIH_ScaleDownKey.GetValueInt())
	self.RegisterForKey(_LIH_NextKey.GetValueInt())
	self.RegisterForKey(_LIH_PrevKey.GetValueInt())
	self.RegisterForKey(_LIH_StepKey.GetValueInt())
	self.RegisterForKey(_LIH_ResetKey.GetValueInt())
	self.RegisterForKey(_LIH_RotateKey.GetValueInt())
endFunction


function Error(Int a_errId, String a_msg)
	debug.MessageBox("SKYUI ERROR CODE " + a_errId as String + "\n\n" + a_msg + "\n\nFor help, see the SkyUI mod description.")
endFunction


; -------------------------------------------------------------------------------------------------
; States
; -------------------------------------------------------------------------------------------------

state polling

	function OnUpdate()
		if !self.isActive()
			self.deactivate()
			return 
		endIf

		if !utility.IsInMenuMode()
		endIf

		self.RegisterForSingleUpdate(0 as Float)
	endFunction

endState
