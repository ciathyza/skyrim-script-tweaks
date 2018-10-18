Scriptname CustomizableCamera extends SKI_ConfigBase

CustomizableCameraRunner Property CCR Auto
Actor Property PlayerRef Auto

import Utility
import Game
import Debug
import JsonUtil

; -------------------- OIDs FOR MCM -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
int IdleX_S
int IdleY_S

int MeleeX_S
int MeleeY_S
int MeleeZoom_S

int RangedX_S
int RangedY_S
int RangedZoom_S
int Ignore_LeftHand_B

int FOV_Slider_S
int Vanity_MIN_S
int Vanity_MAX_S
int Zoom_Speed_S
int Zoom_Increments_S
int Changestate_Speed_S
int Pitch_Zoom_S

int Toggle_PA_B
int Toggle_Crosshair_B
int Sneak_Height_S
int Enabled_Sneaking_B
int Enabled_ControlTweaks_B

int Swap_Side_K
int View_Mode_Key_K
int View_Mode_X_S
int View_Mode_Y_S
int View_Mode_Zoom_S
int TFC_Key_K
int TFC_Speed_S

int Load_Profile1_T
int Load_Profile2_T
int Load_Profile3_T
int Load_Profile4_T
int Load_Profile5_T
int Save_Profile1_T
int Save_Profile2_T
int Save_Profile3_T
int Save_Profile4_T
int Save_Profile5_T

int ApplySettings_T
int Toggle_Delay_B
int UnbindKeys_T

; -------------------- VARIABLES -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
float IdleX = 30.0
float IdleY = -20.0

float MeleeX = 0.0
float MeleeY = -10.0
float MeleeZoom = -20.0

float RangedX = 40.0
float RangedY = -10.0
float RangedZoom = 75.0
bool Ignore_LeftHand
bool Property isRanged Auto

float FOV_Slider = 90.0
float Vanity_MIN = 200.0
float Vanity_MAX = 1000.0
float Zoom_Speed = 20.0
float Zoom_Increments = 6.0
float Changestate_Speed = 4.0
float Pitch_Zoom = 0.0

bool Toggle_PA

bool Toggle_Crosshair

float Sneak_Height = 10.0
bool Toggled_Sneaking
bool Enabled_Sneaking = true
int Sneak_Button

bool Enabled_ControlTweaks = true

int Swap_Side = 53

int View_Mode_Key = 47
float View_Mode_X = 0.0
float View_Mode_Y = -30.0
float View_Mode_Zoom = 50.0
bool Property View_Mode_ON Auto

int TFC_Key = 0
float TFC_Speed = 0.0

bool Toggle_Delay

string Profile = "1"



; -------------------- MCM PAGES -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Function Pages()
	Pages = new string[3]
	Pages[0] = "$PagesEssentials"
	Pages[1] = "$PagesFeatures"
	Pages[2] = "$PagesProfilesHelp"
EndFunction

; -------------------- ESSENTIAL CODE -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Event OnConfigInit()
	Pages()
	ApplySettings()
EndEvent

Event OnGameReload()
parent.OnGameReload()
	Pages()
	ApplySettings()
	If (Toggle_Delay == True)
		Wait(7)
		ApplySettings()
	EndIf
EndEvent

Event OnActorAction(int actionType, Actor akActor, Form source, int slot)
 	If akActor == PlayerRef
   		CrosshairToggle()
		If View_Mode_ON == False
			ApplyALLCam()
		EndIf
 	EndIf
EndEvent

;--------------------------------------------------------------------------------------------------------------
;			MCM SCRIPTING
;--------------------------------------------------------------------------------------------------------------

; -------------------- MCM INTERFACE -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Event OnPageReset(string page)
	If (page == "$PagesEssentials") || (page == "")
		SetCursorFillMode(TOP_TO_BOTTOM)

		SetCursorPosition(0)
		AddHeaderOption("$HeaderCamera")
		IdleX_S = AddSliderOption("$SliderHorizontal", IdleX, "{0}")
		IdleY_S = AddSliderOption("$SliderVertical", IdleY, "{0}")
		AddHeaderOption("Melee Camera")
		MeleeX_S = AddSliderOption("$SliderHorizontal", MeleeX, "{0}")
		MeleeY_S = AddSliderOption("$SliderVertical", MeleeY, "{0}")
		MeleeZoom_S = AddSliderOption("$SliderZoom", MeleeZoom, "{0}")
		AddHeaderOption("Ranged Camera")
		RangedX_S = AddSliderOption("$SliderHorizontal", RangedX, "{0}")
		RangedY_S = AddSliderOption("$SliderVertical", RangedY, "{0}")
		RangedZoom_S = AddSliderOption("$SliderZoom", RangedZoom, "{0}")
		Ignore_LeftHand_B = AddToggleOption("$OptionIgnoreLeftHand", Ignore_LeftHand)

		SetCursorPosition(1)
		AddHeaderOption("")
		FOV_Slider_S = AddSliderOption("$SliderFOV", FOV_Slider, "{0}")
		AddEmptyOption()
		Vanity_MIN_S = AddSliderOption("$SliderMinDistance", Vanity_MIN, "{0}")
		Vanity_MAX_S = AddSliderOption("$SliderMaxDistance", Vanity_MAX, "{0}")
		Zoom_Speed_S = AddSliderOption("$SliderZoomSpeed", Zoom_Speed, "{0}")
		Zoom_Increments_S = AddSliderOption("$SliderZoomIncrements", Zoom_Increments, "{0}")
		AddEmptyOption()
		Changestate_Speed_S = AddSliderOption("$SliderCameraChangingSpeed", Changestate_Speed, "{0}")
		Pitch_Zoom_S = AddSliderOption("$SliderPitchDownZoom", Pitch_Zoom, "{0}")

	ElseIf (page == "$PagesFeatures")
		SetCursorFillMode(TOP_TO_BOTTOM)

		SetCursorPosition(0)
		AddHeaderOption("$PagesFeatures")
		Toggle_PA_B = AddToggleOption("$OptionProperAiming", Toggle_PA)
		AddEmptyOption()
		Toggle_Crosshair_B = AddToggleOption("$OptionAdaptiveCrosshair", Toggle_Crosshair)
		AddEmptyOption()
		Enabled_Sneaking_B = AddToggleOption("$OptionAdaptiveSneaking", Enabled_Sneaking)
		Sneak_Height_S = AddSliderOption("$SliderAdaptiveSneakingHeight", Sneak_Height, "{0}")
		AddEmptyOption()
		Enabled_ControlTweaks_B = AddToggleOption("$OptionControlTweaks", Enabled_ControlTweaks)

		SetCursorPosition(1)
		AddHeaderOption("")
		Swap_Side_K = AddKeyMapOption("$HotkeySwapSideKey", Swap_Side)
		AddEmptyOption()
		View_Mode_Key_K = AddKeyMapOption("$HotkeyViewModeKey", View_Mode_Key)
		View_Mode_X_S = AddSliderOption("$SliderViewModeX", View_Mode_X, "{0}")
		View_Mode_Y_S = AddSliderOption("$SliderViewModeY", View_Mode_Y, "{0}")
		View_Mode_Zoom_S = AddSliderOption("$SliderViewModeZoom", View_Mode_Zoom, "{0}")
		AddEmptyOption()
		TFC_Key_K = AddKeyMapOption("$HotkeyTFCModeKey", TFC_Key)
		TFC_Speed_S = AddSliderOption("$SliderTFCModeSpeed", TFC_Speed, "{1}")

	ElseIf (page == "$PagesProfilesHelp")
		SetCursorFillMode(TOP_TO_BOTTOM)

		SetCursorPosition(0)
		AddHeaderOption("$HeaderLoadProfiles")
		Load_Profile1_T = AddTextOption("$Profile1", "Load")
		Load_Profile2_T = AddTextOption("$Profile2", "Load")
		Load_Profile3_T = AddTextOption("$Profile3", "Load")
		Load_Profile4_T = AddTextOption("$Profile4", "Load")
		Load_Profile5_T = AddTextOption("$Profile5", "Load")
		AddHeaderOption("$HeaderTroubleshooting")
		ApplySettings_T = AddTextOption("$OptionApplyCurrentSettings", "")
		UnbindKeys_T = AddTextOption("$OptionUnbindHotkeys", "")

		SetCursorPosition(1)
		AddHeaderOption("$HeaderSaveProfiles")
		Save_Profile1_T = AddTextOption("$Profile1", "Save")
		Save_Profile2_T = AddTextOption("$Profile2", "Save")
		Save_Profile3_T = AddTextOption("$Profile3", "Save")
		Save_Profile4_T = AddTextOption("$Profile4", "Save")
		Save_Profile5_T = AddTextOption("$Profile5", "Save")
		AddHeaderOption("")
		Toggle_Delay_B = AddToggleOption("$OptionDelayedOverride", Toggle_Delay)
	EndIf
EndEvent


; -------------------- TOGGLES OPTIONS -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Event OnOptionSelect(int option)

	If (option == Ignore_LeftHand_B)
		Ignore_LeftHand = !Ignore_LeftHand
		SetToggleOptionValue(Ignore_LeftHand_B, Ignore_LeftHand)
		DetectRanged()
		If View_Mode_ON == False
			ApplyALLCam()
		EndIf
	EndIf

	If (option == Toggle_PA_B)
		Toggle_PA = !Toggle_PA
		SetToggleOptionValue(Toggle_PA_B, Toggle_PA)
		ProperAiming()
	EndIf

	If (option == Toggle_Crosshair_B)
		Toggle_Crosshair = !Toggle_Crosshair
		SetToggleOptionValue(Toggle_Crosshair_B, Toggle_Crosshair)
		CrosshairToggle()
	EndIf

	If (option == Enabled_Sneaking_B)
		Enabled_Sneaking = !Enabled_Sneaking
		SetToggleOptionValue(Enabled_Sneaking_B, Enabled_Sneaking)
		AdaptiveSneaking()
		If View_Mode_ON == False
			ApplyVerticalCam()
		EndIf
	EndIf

	If (option == Enabled_ControlTweaks_B)
		Enabled_ControlTweaks = !Enabled_ControlTweaks
		SetToggleOptionValue(Enabled_ControlTweaks_B, Enabled_ControlTweaks)
		ImprovedControls()
	EndIf

	If (option == ApplySettings_T)
		MessageBox("Settings have been applied.")
		ApplySettings()
	EndIf

	If (option == UnbindKeys_T)
		MessageBox("Customizable Camera hotkeys are unbound.")
		UnRegisterForKey(swap_side)
		UnRegisterForKey(TFC_Key)
		UnRegisterForKey(View_Mode_Key)
		swap_side = 0
		TFC_Key = 0
		View_Mode_Key = 0
		If View_Mode_ON == True
		View_Mode_ON = False
		ApplyMiscCamera()
		ApplyALLCam()
		EndIf
	EndIf

	If (option == Toggle_Delay_B)
		Toggle_Delay = !Toggle_Delay
		SetToggleOptionValue(Toggle_Delay_B, Toggle_Delay)
	EndIf

	If (option == Save_Profile1_T)
		Profile = "1"
		LoadSaveProfile(False)
	ElseIf (option == Load_Profile1_T)
		Profile = "1"
		LoadSaveProfile(True)
	EndIf
	If (option == Save_Profile2_T)
		Profile = "2"
		LoadSaveProfile(False)
	ElseIf (option == Load_Profile2_T)
		Profile = "2"
		LoadSaveProfile(True)
	EndIf
	If (option == Save_Profile3_T)
		Profile = "3"
		LoadSaveProfile(False)
	ElseIf (option == Load_Profile3_T)
		Profile = "3"
		LoadSaveProfile(True)
	EndIf
	If (option == Save_Profile4_T)
		Profile = "4"
		LoadSaveProfile(False)
	ElseIf (option == Load_Profile4_T)
		Profile = "4"
		LoadSaveProfile(True)
	EndIf
	If (option == Save_Profile5_T)
		Profile = "5"
		LoadSaveProfile(False)
	ElseIf (option == Load_Profile5_T)
		Profile = "5"
		LoadSaveProfile(True)
	EndIf
EndEvent


; -------------------- HOTKEYS SETTINGS -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Event OnOptionKeyMapChange(int option, int keyCode, string conflictControl, string conflictName)
	If (option == View_Mode_Key_K)
		UnRegisterForKey(View_Mode_Key)
		View_Mode_Key = keyCode
		If View_Mode_Key == 1
			SetKeymapOptionValue(View_Mode_Key_K, View_Mode_Key)
			View_Mode_Key = 0
		Else
			SetKeymapOptionValue(View_Mode_Key_K, View_Mode_Key)
			RegisterForKey(View_Mode_Key)
		EndIf
	ElseIf (option == TFC_Key_K)
		If PapyrusUtil.GetVersion() > 1
			UnRegisterForKey(TFC_Key)
			TFC_Key = keyCode
			If TFC_Key == 1
				SetKeymapOptionValue(TFC_Key_K, TFC_Key)
				TFC_Key = 0
			Else
				SetKeymapOptionValue(TFC_Key_K, TFC_Key)
				RegisterForKey(TFC_Key)
			EndIf
		Else
			MessageBox("PapyrusUtil needs to be installed for TFC Mode to work.")
		Endif		
	ElseIf (option == Swap_Side_K)
		UnRegisterForKey(swap_side)
		Swap_Side = keyCode
		If Swap_Side == 1
			SetKeymapOptionValue(Swap_Side_K, Swap_Side)
			Swap_Side = 0
		Else
			SetKeymapOptionValue(Swap_Side_K, Swap_Side)
			RegisterForKey(swap_side)
		EndIf
	EndIf
EndEvent


; --------------------KEY PRESS DOWN -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Event OnKeyDown(Int KeyCode)
If (!IsInMenuMode())

	If KeyCode == swap_side
		If View_Mode_ON == False
			idleX = -idleX
			meleeX = -meleeX
			rangedX = -rangedX
			ApplyHorizontalCam()
		Else
			View_Mode_X = -View_Mode_X
			SetINIFloat("fOverShoulderPosX:Camera", View_Mode_X)
			SetINIFloat("fOverShoulderCombatPosX:Camera", View_Mode_X)
			UpdateThirdPerson()
		EndIf
	EndIf

	If KeyCode == View_Mode_Key
		View_Mode_ON = !View_Mode_ON
		If (View_Mode_ON == True)
			SetINIFloat("fOverShoulderCombatAddY:Camera", 0.0)
			SetINIFloat("fOverShoulderPosX:Camera", View_Mode_X)
			SetINIFloat("fOverShoulderPosZ:Camera", View_Mode_Y)
			SetINIFloat("fOverShoulderCombatPosX:Camera", View_Mode_X)
			SetINIFloat("fOverShoulderCombatPosZ:Camera", View_Mode_Y)
			UpdateThirdPerson()
			SetINIFloat("fVanityModeMaxDist:Camera", View_Mode_Zoom)
			SetINIFloat("fVanityModeMinDist:Camera", View_Mode_Zoom)
			CrosshairToggle(True)
		Else
			ApplyALLCam()
			ApplyMiscCamera()
		EndIf
	EndIf

	If Keycode == Sneak_Button
		If View_Mode_ON == False && PlayerRef.IsSwimming() == False
			If PlayerRef.IsSneaking() == True
				Toggled_Sneaking = True
				RegisterForSingleUpdate(0.75)
			Else
				Toggled_Sneaking = False
			EndIf
			ApplyVerticalCam()
		EndIf
	EndIf

	If KeyCode == TFC_Key
		MiscUtil.ToggleFreeCamera()
	EndIf

EndIf
EndEvent


; -------------------- OnUpdate SNEAKING FIXER -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;In case player gets out of sneaking without pressing button, example: mining, swimming. 
;Runs only when sneaking and Adaptive Sneaking enabled.

Event OnUpdate()
	If Toggled_Sneaking == True && GetPlayer().IsSneaking() == False
		If GetPlayer().IsSwimming() == False && View_Mode_ON == False
			Toggled_Sneaking = False
			ApplyALLCam()
		Else
			RegisterForSingleUpdate(0.75)
		EndIf
	ElseIf Toggled_Sneaking == True && GetPlayer().IsSneaking() == True
		RegisterForSingleUpdate(0.75)
	EndIf
EndEvent


; -------------------- SLIDERS SETTINGS -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Event OnOptionSliderAccept(int option, float value)
	If (option == IdleX_S)
		IdleX = value
		SetSliderOptionValue(IdleX_S, IdleX, "{0}")
		ApplyALLCam()
	ElseIf (option == IdleY_S)
		IdleY = value
		SetSliderOptionValue(IdleY_S, IdleY, "{0}")
		ApplyALLCam()
	ElseIf (option == MeleeX_S)
		MeleeX = value
		SetSliderOptionValue(MeleeX_S, MeleeX, "{0}")
		ApplyALLCam()
	ElseIf (option == MeleeY_S)
		MeleeY = value
		SetSliderOptionValue(MeleeY_S, MeleeY, "{0}")
		ApplyALLCam()
	ElseIf (option == MeleeZoom_S)
		MeleeZoom = value
		SetSliderOptionValue(MeleeZoom_S, MeleeZoom, "{0}")
		ApplyALLCam()
	ElseIf (option == RangedX_S)
		RangedX = value
		SetSliderOptionValue(RangedX_S, RangedX, "{0}")
		ApplyALLCam()
	ElseIf (option == RangedY_S)
		RangedY = value
		SetSliderOptionValue(RangedY_S, RangedY, "{0}")
		ApplyALLCam()
	ElseIf (option == RangedZoom_S)
		RangedZoom = value
		SetSliderOptionValue(RangedZoom_S, RangedZoom, "{0}")
		ApplyALLCam()
	ElseIf (option == FOV_Slider_S)
		FOV_Slider = value
		SetSliderOptionValue(FOV_Slider_S, FOV_Slider, "{0}")
		ApplyMiscCamera()
	ElseIf (option == Vanity_MAX_S)
		Vanity_MAX = value
		SetSliderOptionValue(Vanity_MAX_S, Vanity_MAX, "{0}")
		ApplyMiscCamera()
	ElseIf (option == Vanity_MIN_S)
		Vanity_MIN = value
		SetSliderOptionValue(Vanity_MIN_S, Vanity_MIN, "{0}")
		ApplyMiscCamera()
	ElseIf (option == Zoom_Speed_S)
		Zoom_Speed = value
		SetSliderOptionValue(Zoom_Speed_S, Zoom_Speed, "{0}")
		ApplyMiscCamera()
	ElseIf (option == Zoom_Increments_S)
		Zoom_Increments = value
		SetSliderOptionValue(Zoom_Increments_S, Zoom_Increments, "{0}")
		ZoomIncrement()
	ElseIf (option == Pitch_Zoom_S)
		Pitch_Zoom = value
		SetSliderOptionValue(Pitch_Zoom_S, Pitch_Zoom, "{0}")
		ApplyMiscCamera()
	ElseIf (option == Changestate_Speed_S)
		Changestate_Speed = value
		SetSliderOptionValue(Changestate_Speed_S, Changestate_Speed, "{0}")
		ApplyMiscCamera()
	ElseIf (option == Sneak_Height_S)
		Sneak_Height = value
		SetSliderOptionValue(Sneak_Height_S, Sneak_Height, "{0}")
		ApplyALLCam()
	ElseIf (option == View_Mode_X_S)
		View_Mode_X = value
		SetSliderOptionValue(View_Mode_X_S, View_Mode_X, "{0}")
		If (View_Mode_ON == True)
			SetINIFloat("fOverShoulderPosX:Camera", View_Mode_X)
			SetINIFloat("fOverShoulderCombatPosX:Camera", View_Mode_X)
			UpdateThirdPerson()
		EndIf
	ElseIf (option == View_Mode_Y_S)
		View_Mode_Y = value
		SetSliderOptionValue(View_Mode_Y_S, View_Mode_Y, "{0}")
		If (View_Mode_ON == True)
			SetINIFloat("fOverShoulderPosZ:Camera", View_Mode_Y)
			SetINIFloat("fOverShoulderCombatPosZ:Camera", View_Mode_Y)
			UpdateThirdPerson()
		EndIf
	ElseIf (option == View_Mode_Zoom_S)
		View_Mode_Zoom = value
		SetSliderOptionValue(View_Mode_Zoom_S, View_Mode_Zoom, "{0}")
		If (View_Mode_ON == True)
			SetINIFloat("fVanityModeMaxDist:Camera", View_Mode_Zoom)
			SetINIFloat("fVanityModeMinDist:Camera", View_Mode_Zoom)
			SetINIFloat("fOverShoulderCombatAddY:Camera", 0.0)
			UpdateThirdPerson()
		EndIf
	ElseIf (option == TFC_Speed_S)
		If PapyrusUtil.GetVersion() > 1
			TFC_Speed = value
			SetSliderOptionValue(TFC_Speed_S, TFC_Speed, "{1}")
			If TFC_Speed == 0.0
				MiscUtil.SetFreeCameraSpeed(5.0)
			Else
				MiscUtil.SetFreeCameraSpeed(TFC_Speed)
			EndIf
		Else
			MessageBox("PapyrusUtil needs to be installed for TFC Mode to work.")
		EndIf
	EndIf
EndEvent


; -------------------- SLIDERS > DEFAULT / MIN / MAX -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Event OnOptionSliderOpen(int option)
	If (option == IdleX_S)
		SetSliderDialogStartValue(IdleX)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-100.0, 100.0)
		SetSliderDialogInterval(1.0)

	ElseIf (option == IdleY_S)
		SetSliderDialogStartValue(IdleY)
		SetSliderDialogDefaultValue(-20.0)
		SetSliderDialogRange(-100.0, 100.0)
		SetSliderDialogInterval(1.0)

	ElseIf (option == MeleeX_S)
		SetSliderDialogStartValue(MeleeX)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-100.0, 100.0)
		SetSliderDialogInterval(1.0)

	ElseIf (option == MeleeY_S)
		SetSliderDialogStartValue(MeleeY)
		SetSliderDialogDefaultValue(-10.0)
		SetSliderDialogRange(-100.0, 100.0)
		SetSliderDialogInterval(1.0)

    ElseIf (option == MeleeZoom_S)
		SetSliderDialogStartValue(MeleeZoom)
		SetSliderDialogDefaultValue(-20.0)
		SetSliderDialogRange(-500.0, 500.0)
		SetSliderDialogInterval(1.0)

	ElseIf (option == RangedX_S)
		SetSliderDialogStartValue(RangedX)
		SetSliderDialogDefaultValue(40.0)
		SetSliderDialogRange(-100.0, 100.0)
		SetSliderDialogInterval(1.0)

	ElseIf (option == RangedY_S)
		SetSliderDialogStartValue(RangedY)
		SetSliderDialogDefaultValue(-10.0)
		SetSliderDialogRange(-100.0, 100.0)
		SetSliderDialogInterval(1.0)

    ElseIf (option == RangedZoom_S)
		SetSliderDialogStartValue(RangedZoom)
		SetSliderDialogDefaultValue(75.0)
		SetSliderDialogRange(-500.0, 500.0)
		SetSliderDialogInterval(1.0)

	ElseIf (option == FOV_Slider_S)
		SetSliderDialogStartValue(FOV_Slider)
		SetSliderDialogDefaultValue(65.0)
		SetSliderDialogRange(10.0, 150.0)
		SetSliderDialogInterval(1.0)

	ElseIf (option == Vanity_MAX_S)
		SetSliderDialogStartValue(Vanity_MAX)
		SetSliderDialogDefaultValue(280.0)
		SetSliderDialogRange(0.0, 1000.0)
		SetSliderDialogInterval(1.0)

	ElseIf (option == Vanity_MIN_S)
		SetSliderDialogStartValue(Vanity_MIN)
		SetSliderDialogDefaultValue(185.0)
		SetSliderDialogRange(0.0, 1000.0)
		SetSliderDialogInterval(1.0)

	ElseIf (option == Zoom_Speed_S)
		SetSliderDialogStartValue(Zoom_Speed)
		SetSliderDialogDefaultValue(5.0)
		SetSliderDialogRange(1.0, 20.0)
		SetSliderDialogInterval(1.0)

	ElseIf (option == Zoom_Increments_S)
		SetSliderDialogStartValue(Zoom_Increments)
		SetSliderDialogDefaultValue(3.0)
		SetSliderDialogRange(1.0, 7.0)
		SetSliderDialogInterval(1.0)

	ElseIf (option == Pitch_Zoom_S)
		SetSliderDialogStartValue(Pitch_Zoom)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-500.0, 500.0)
		SetSliderDialogInterval(1.0)

	ElseIf (option == Changestate_Speed_S)
		SetSliderDialogStartValue(Changestate_Speed)
		SetSliderDialogDefaultValue(4.0)
		SetSliderDialogRange(1.0, 20.0)
		SetSliderDialogInterval(1.0)

	ElseIf (option == Sneak_Height_S)
		SetSliderDialogStartValue(Sneak_Height)
		SetSliderDialogDefaultValue(30.0)
		SetSliderDialogRange(-100.0, 100.0)
		SetSliderDialogInterval(1.0)

	elseIf (option == View_Mode_X_S)
		SetSliderDialogStartValue(View_Mode_X)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-200.0, 200.0)
		SetSliderDialogInterval(1.0)

	elseIf (option == View_Mode_Y_S)
		SetSliderDialogStartValue(View_Mode_Y)
		SetSliderDialogDefaultValue(-10.0)
		SetSliderDialogRange(-100.0, 1000.0)
		SetSliderDialogInterval(1.0)

	elseIf (option == View_Mode_Zoom_S)
		SetSliderDialogStartValue(View_Mode_Zoom)
		SetSliderDialogDefaultValue(70.0)
		SetSliderDialogRange(0.0, 100000.0)
		SetSliderDialogInterval(5.0)

	ElseIf (option == TFC_Speed_S)
		SetSliderDialogStartValue(TFC_Speed)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(0.0, 20.0)
		SetSliderDialogInterval(0.5)
	EndIf
EndEvent


; -------------------- HIGHLIGHTED OPTION DESCRIPTIONS -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Event OnOptionHighlight(int option)
	If (option == IdleX_S)
		SetInfoText("$DescriptionIdleX")
	ElseIf (option == IdleY_S)
		SetInfoText("$DescriptionIdleY")
	ElseIf (option == MeleeX_S)
		SetInfoText("$DescriptionMeleeX")
	ElseIf (option == MeleeY_S)
		SetInfoText("$DescriptionMeleeY")
	ElseIf (option == MeleeZoom_S)
		SetInfoText("$DescriptionMeleeZo")
	ElseIf (option == RangedX_S)
		SetInfoText("$DescriptionRangedX")
	ElseIf (option == RangedY_S)
		SetInfoText("$DescriptionRangedY")
	ElseIf (option == RangedZoom_S)
		SetInfoText("$DescriptionRangedZo")
	ElseIf (option == Ignore_LeftHand_B)
		SetInfoText("$DescriptionIgnoreLeftHand")
	ElseIf (option == FOV_Slider_S)
		SetInfoText("$DescriptionFOV")
	ElseIf (option == Vanity_MAX_S)
		SetInfoText("$DescriptionMaxDist")
	ElseIf (option == Vanity_MIN_S)
		SetInfoText("$DescriptionMinDist")
	ElseIf (option == Zoom_Speed_S)
		SetInfoText("$DescriptionZoomSpeed")
	ElseIf (option == Zoom_Increments_S)
		SetInfoText("$DescriptionZoomIncrements")
	ElseIf (option == Pitch_Zoom_S)
		SetInfoText("$DescriptionPitchDownZoom")
	ElseIf (option == Changestate_Speed_S)
		SetInfoText("$DescriptionCameraChangingSpeed")
	ElseIf (option == View_Mode_Key_K)
		SetInfoText("$DescriptionVIewModeKey")
	ElseIf (option == View_Mode_X_S)
		SetInfoText("$DescriptionVIewModeX")
	ElseIf (option == View_Mode_Y_S)
		SetInfoText("$DescriptionVIewModeY")
	ElseIf (option == View_Mode_Zoom_S)
		SetInfoText("$DescriptionVIewModeZo")
	ElseIf (option == TFC_Key_K)
		SetInfoText("$DescriptionTFCModeKey")
	ElseIf (option == TFC_Speed_S)
		SetInfoText("$DescriptionTFCModeSpeed")
	ElseIf (option == Swap_Side_K)
		SetInfoText("$DescriptionSwapSideKey")
	ElseIf (option == Enabled_Sneaking_B)
		SetInfoText("$DescriptionAdaptiveSneaking")
	ElseIf (option == Sneak_Height_S)
		SetInfoText("$DescriptionAdaptiveSneakingHeight")
	ElseIf (option == Toggle_Crosshair_B)
		SetInfoText("$DescriptionAdaptiveCrosshair")
	ElseIf (option == Toggle_PA_B)
		SetInfoText("$DescriptionProperAiming")
	ElseIf (option == Enabled_ControlTweaks_B)
		SetInfoText("$DescriptionControlTweaks")
	ElseIf (option == ApplySettings_T)
		SetInfoText("$DescriptionApplySettings")
	ElseIf (option == UnbindKeys_T)
		SetInfoText("$DescriptionUnbindHotkeys")
	ElseIf (option == Toggle_Delay_B)
		SetInfoText("$DescriptionDelayedOverride")
	ElseIf (option == Load_Profile1_T) || (option == Load_Profile2_T) || (option == Load_Profile3_T) || (option == Load_Profile4_T) || (option == Load_Profile5_T)
		SetInfoText("$DescriptionLoadProfiles")
	ElseIf (option == Save_Profile1_T) || (option == Save_Profile2_T) || (option == Save_Profile3_T) || (option == Save_Profile4_T) || (option == Save_Profile5_T)
		SetInfoText("$DescriptionSaveProfiles")
	EndIf
EndEvent



;--------------------------------------------------------------------------------------------------------------
;			FUNCTIONS
;--------------------------------------------------------------------------------------------------------------



; -------------------- APPLY SETTINGS -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
float CrosshairValue
float CrosshairValueAlert

Function ApplySettings()

		View_Mode_ON = False

		DetectRanged()
		ApplyMiscCamera()
		ApplyALLCam()

		RegisterForActorAction(8)
		RegisterForActorAction(10)

		If swap_side != 0
		UnRegisterForKey(swap_side)
		RegisterForKey(swap_side)
		EndIf

		If View_Mode_Key != 0
		UnRegisterForKey(View_Mode_Key)
		RegisterForKey(View_Mode_Key)
		EndIf

		If TFC_Key != 0
		UnRegisterForKey(TFC_Key)
		RegisterForKey(TFC_Key)
		EndIf
		If TFC_Speed > 0.0
		MiscUtil.SetFreeCameraSpeed(TFC_Speed)
		EndIf

		ProperAiming(True)
		AdaptiveSneaking()
		ImprovedControls()

EndFunction



Function ApplyMiscCamera()
		SetINIFloat("fVanityModeMinDist:Camera", Vanity_MIN)
		SetINIFloat("fVanityModeMaxDist:Camera", Vanity_MAX)
		SetINIFloat("fMouseWheelZoomSpeed:Camera", Zoom_Speed)
		ZoomIncrement()
		SetINIFloat("fPitchZoomOutMaxDist:Camera", Pitch_Zoom)
		SetINIFloat("fDefaultWorldFOV:Display", FOV_Slider)
		SetINIFloat("fDefault1stPersonFOV:Display", FOV_Slider)
		SetINIFloat("fShoulderDollySpeed:Camera", Changestate_Speed)
		UpdateThirdPerson()
EndFunction



Function ApplyHorizontalCam()
	SetINIFloat("fOverShoulderPosX:Camera", idleX)
	If isRanged == True
		SetINIFloat("fOverShoulderCombatPosX:Camera", rangedX)
		UpdateThirdPerson()
		Return
	EndIf
	SetINIFloat("fOverShoulderCombatPosX:Camera", meleeX)
	UpdateThirdPerson()
EndFunction



Function ApplyVerticalCam()
	If PlayerRef.IsSneaking() == True && Enabled_Sneaking == True
		SetINIFloat("fOverShoulderPosZ:Camera", idleY + sneak_height)
	Else
		SetINIFloat("fOverShoulderPosZ:Camera", idleY)
	EndIf

	If isRanged == True
		If PlayerRef.IsSneaking() == True && Enabled_Sneaking == True
			SetINIFloat("fOverShoulderCombatPosZ:Camera", rangedY + sneak_height)
		Else
			SetINIFloat("fOverShoulderCombatPosZ:Camera", rangedY)
		EndIf
		UpdateThirdPerson()
		Return
	EndIf

	If PlayerRef.IsSneaking() == True && Enabled_Sneaking == True
		SetINIFloat("fOverShoulderCombatPosZ:Camera", meleeY + sneak_height)
	Else
		SetINIFloat("fOverShoulderCombatPosZ:Camera", meleeY)
	EndIf
	UpdateThirdPerson()
EndFunction



Function ApplyALLCam()
	SetINIFloat("fOverShoulderPosX:Camera", idleX)
    If PlayerRef.IsSneaking() == True && Enabled_Sneaking == True
		SetINIFloat("fOverShoulderPosZ:Camera", idleY + sneak_height)
	Else
		SetINIFloat("fOverShoulderPosZ:Camera", idleY)
	EndIf
	;---RANGED + MAGIC
	If isRanged == True 
		SetINIFloat("fOverShoulderCombatPosX:Camera", rangedX)
		If PlayerRef.IsSneaking() == True && Enabled_Sneaking == True
			SetINIFloat("fOverShoulderCombatPosZ:Camera", rangedY + sneak_height)
		Else
			SetINIFloat("fOverShoulderCombatPosZ:Camera", rangedY)
		EndIf
		SetINIFloat("fOverShoulderCombatAddY:Camera", rangedZoom)
		UpdateThirdPerson()
		CrosshairToggle()
		Return
	EndIf
	;---MELEE
	SetINIFloat("fOverShoulderCombatPosX:Camera", meleeX)
	If PlayerRef.IsSneaking() == True && Enabled_Sneaking == True
		SetINIFloat("fOverShoulderCombatPosZ:Camera", meleeY + sneak_height)
	Else
		SetINIFloat("fOverShoulderCombatPosZ:Camera", meleeY)
	EndIf
	SetINIFloat("fOverShoulderCombatAddY:Camera", meleeZoom)
	UpdateThirdPerson()
	CrosshairToggle()
EndFunction



Function ZoomIncrement()
	SetINIFloat("fMouseWheelZoomIncrement:Camera", Zoom_Increments)
	If Zoom_Increments == 1.0
		SetINIFloat("fMouseWheelZoomIncrement:Camera", 1.5)
		Return
	ElseIf Zoom_Increments == 2.0
		SetINIFloat("fMouseWheelZoomIncrement:Camera", 0.604)
		Return
	ElseIf Zoom_Increments == 3.0
		SetINIFloat("fMouseWheelZoomIncrement:Camera", 0.402)
		Return
	ElseIf Zoom_Increments == 4.0
		SetINIFloat("fMouseWheelZoomIncrement:Camera", 0.202)
		Return
	ElseIf Zoom_Increments == 5.0
		SetINIFloat("fMouseWheelZoomIncrement:Camera", 0.075)
		Return
	ElseIf Zoom_Increments == 6.0
		SetINIFloat("fMouseWheelZoomIncrement:Camera", 0.0375)
		Return
	ElseIf Zoom_Increments == 7.0
		SetINIFloat("fMouseWheelZoomIncrement:Camera", 0.01)
		Return
	EndIf
EndFunction


; -------------------- CROSSHAIR and RANGED CHECK -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

int LeftArm

Function DetectRanged()
	LeftArm = PlayerRef.GetEquippedItemType(0)
	
	If PlayerRef.GetEquippedItemType(1) >= 7
		isRanged = True
		Return
	EndIf

	If Ignore_LeftHand == False
		If LeftArm == 9
			isRanged = True
			Return
		ElseIf LeftArm == 8
			isRanged = True
			Return
		EndIf
	EndIf

	isRanged = False
EndFunction



Function CrosshairToggle(bool Bypass = False)

	If Bypass == True
		UI.SetNumber("HUD Menu", "_root.HUDMovieBaseInstance.CrosshairInstance._y", -115.300003 - 5000.0)
		UI.SetNumber("HUD Menu", "_root.HUDMovieBaseInstance.CrosshairAlert._visible", -115.300003 - 5000.0)
		Return
	EndIf

	If Toggle_Crosshair == True
		If View_Mode_ON == False
			If PlayerRef.IsWeaponDrawn() == False
					UI.SetNumber("HUD Menu", "_root.HUDMovieBaseInstance.CrosshairInstance._y", -115.300003 - 5000.0)
					UI.SetNumber("HUD Menu", "_root.HUDMovieBaseInstance.CrosshairAlert._visible", -115.300003 - 5000.0)
					Return
			ElseIf PlayerRef.IsWeaponDrawn() == True
				If isRanged == True
					UI.SetNumber("HUD Menu", "_root.HUDMovieBaseInstance.CrosshairInstance._y", -115.300003)
					UI.SetNumber("HUD Menu", "_root.HUDMovieBaseInstance.CrosshairAlert._y", -115.300003)
					Return
				EndIf
				UI.SetNumber("HUD Menu", "_root.HUDMovieBaseInstance.CrosshairInstance._y", -115.300003 - 5000.0)
				UI.SetNumber("HUD Menu", "_root.HUDMovieBaseInstance.CrosshairAlert._visible", -115.300003 - 5000.0)
			EndIf
		Else ;If View_Mode_ON == True
			UI.SetNumber("HUD Menu", "_root.HUDMovieBaseInstance.CrosshairInstance._y", -115.300003 - 5000.0)
			UI.SetNumber("HUD Menu", "_root.HUDMovieBaseInstance.CrosshairAlert._visible", -115.300003 - 5000.0)
		EndIf
	Else
		If View_Mode_ON == False
			UI.SetNumber("HUD Menu", "_root.HUDMovieBaseInstance.CrosshairInstance._y", -115.300003)
			UI.SetNumber("HUD Menu", "_root.HUDMovieBaseInstance.CrosshairAlert._y", -115.300003)
		EndIf
	EndIf
EndFunction



; -------------------- MISC FUNCTIONS -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Function ProperAiming(bool IgnoreOff = False)
			If Toggle_PA == True
				SetGameSettingFloat("fAutoAimMaxDegrees", 10.0)
				SetGameSettingFloat("fAutoAimMaxDistance", 8000.0)
				SetGameSettingFloat("fAutoAimScreenPercentage", 0.0)
				SetGameSettingFloat("fAutoAimMaxDegrees3rdPerson", 20.0)
				Return
			ElseIf Toggle_PA == False && IgnoreOff == False
				SetGameSettingFloat("fAutoAimMaxDegrees", 1.0)
				SetGameSettingFloat("fAutoAimMaxDistance", 1800.0)
				SetGameSettingFloat("fAutoAimScreenPercentage", 6.0)
				SetGameSettingFloat("fAutoAimMaxDegrees3rdPerson", 2.0)
			EndIf
		EndFunction

		Function AdaptiveSneaking()
			If Enabled_Sneaking == True
				UnRegisterForKey(Sneak_Button)
				Sneak_Button = Input.GetMappedKey("Sneak")
				RegisterForKey(Sneak_Button)
			Else
				UnRegisterForKey(Sneak_Button)
			EndIf
		EndFunction

Function ImprovedControls()
	If Enabled_ControlTweaks == True
		SetINIFloat("fControllerBufferDepth:Controls", 0.01)
		SetINIFloat("fFreezeDirectionDefaultAngleThreshold:Controls", 0.0)
		SetINIFloat("fFreezeDirectionDefaultSpeedThreshold:Controls", 0.0)
		SetINIFloat("fMaxMoveRampDownDelta:Controls", 1000.0)
		SetINIFloat("fReverseDirThreshold:Controls", 0.0)
		SetINIFloat("fChaseCameraMaxAngle:Camera", 0.0)
		SetINIFloat("fChaseCameraSpeed:Camera", 100.0)
		SetINIFloat("fPCDialogueLookSpeed:Controls", 27.0)
		SetINIFloat("fDialogueHardStopAngle3P:Controls", 360.0)
		SetINIFloat("fDialogueSoftStopAngle3P:Controls", 360.0)
		Return
	Else
		SetINIFloat("fControllerBufferDepth:Controls", 0.14)
		SetINIFloat("fFreezeDirectionDefaultAngleThreshold:Controls", 60.0)
		SetINIFloat("fFreezeDirectionDefaultSpeedThreshold:Controls", 100.0)
		SetINIFloat("fMaxMoveRampDownDelta:Controls", 500.0)
		SetINIFloat("fReverseDirThreshold:Controls", 0.3)
		SetINIFloat("fChaseCameraMaxAngle:Camera", 30.0)
		SetINIFloat("fChaseCameraSpeed:Camera", 10.0)
		SetINIFloat("fPCDialogueLookSpeed:Controls", 10.0)
		SetINIFloat("fDialogueHardStopAngle3P:Controls", 55.0)
		SetINIFloat("fDialogueSoftStopAngle3P:Controls", 25.0)
		Return
	EndIf
EndFunction


; -------------------- PROFILES -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Function LoadSaveProfile(bool Load = True)
If PapyrusUtil.GetVersion() > 1
	If Load == True
		If JsonExists("../Customizable Camera/profile" +Profile+ "")
			IdleX = GetFloatValue("../Customizable Camera/profile" +Profile+ ".json", "IdleX")
			IdleY = GetFloatValue("../Customizable Camera/profile" +Profile+ ".json", "IdleY")
			MeleeX = GetFloatValue("../Customizable Camera/profile" +Profile+ ".json", "MeleeX")
			MeleeY = GetFloatValue("../Customizable Camera/profile" +Profile+ ".json", "MeleeY")
			MeleeZoom = GetFloatValue("../Customizable Camera/profile" +Profile+ ".json", "MeleeZoom")
			RangedX = GetFloatValue("../Customizable Camera/profile" +Profile+ ".json", "RangedX")
			RangedY = GetFloatValue("../Customizable Camera/profile" +Profile+ ".json", "RangedY")
			RangedZoom = GetFloatValue("../Customizable Camera/profile" +Profile+ ".json", "RangedZoom")
			Ignore_LeftHand = GetINTValue("../Customizable Camera/profile" +Profile+ ".json", "Ignore_LeftHand")

			FOV_Slider = GetFloatValue("../Customizable Camera/profile" +Profile+ ".json", "FOV_Slider")
			Vanity_MAX = GetFloatValue("../Customizable Camera/profile" +Profile+ ".json", "Vanity_MAX")
			Vanity_MIN = GetFloatValue("../Customizable Camera/profile" +Profile+ ".json", "Vanity_MIN")
			Zoom_Speed = GetFloatValue("../Customizable Camera/profile" +Profile+ ".json", "Zoom_Speed")
			Zoom_Increments = GetFloatValue("../Customizable Camera/profile" +Profile+ ".json", "Zoom_Increments")
			Pitch_Zoom = GetFloatValue("../Customizable Camera/profile" +Profile+ ".json", "Pitch_Zoom")
			Changestate_Speed = GetFloatValue("../Customizable Camera/profile" +Profile+ ".json", "Changestate_Speed")

			Swap_Side = GetINTValue("../Customizable Camera/profile" +Profile+ ".json", "Swap_Side")
			View_Mode_Key = GetINTValue("../Customizable Camera/profile" +Profile+ ".json", "View_Mode_Key")
			View_Mode_X = GetFloatValue("../Customizable Camera/profile" +Profile+ ".json", "View_Mode_X")
			View_Mode_Y = GetFloatValue("../Customizable Camera/profile" +Profile+ ".json", "View_Mode_Y")
			View_Mode_Zoom = GetFloatValue("../Customizable Camera/profile" +Profile+ ".json", "View_Mode_Zoom")
			TFC_Key = GetINTValue("../Customizable Camera/profile" +Profile+ ".json", "TFC_Key")
			TFC_Speed = GetFloatValue("../Customizable Camera/profile" +Profile+ ".json", "TFC_Speed")
			Sneak_Height = GetFloatValue("../Customizable Camera/profile" +Profile+ ".json", "Sneak_Height")

			Toggle_PA = GetINTValue("../Customizable Camera/profile" +Profile+ ".json", "Toggle_PA")
			Toggle_Crosshair = GetINTValue("../Customizable Camera/profile" +Profile+ ".json", "Toggle_Crosshair") ;------------------------BUGGY BEHAVIOUR?
			Enabled_Sneaking = GetINTValue("../Customizable Camera/profile" +Profile+ ".json", "Enabled_Sneaking")
			Enabled_ControlTweaks = GetINTValue("../Customizable Camera/profile" +Profile+ ".json", "Enabled_ControlTweaks")

			If swap_side == 0
				UnRegisterForKey(swap_side)
			EndIf
			If View_Mode_Key == 0
				UnRegisterForKey(View_Mode_Key)
			EndIf
			If TFC_Key == 0
				UnRegisterForKey(TFC_Key)
			EndIf
			MessageBox("Profile loaded.")
			ApplySettings()
		Else
			MessageBox("Profile does not exist.")
		EndIf
	Else
		SetFloatValue("../Customizable Camera/profile" +Profile+ ".json", "IdleX", IdleX)
		SetFloatValue("../Customizable Camera/profile" +Profile+ ".json", "IdleY", IdleY)
		SetFloatValue("../Customizable Camera/profile" +Profile+ ".json", "MeleeX", MeleeX)
		SetFloatValue("../Customizable Camera/profile" +Profile+ ".json", "MeleeY", MeleeY)
		SetFloatValue("../Customizable Camera/profile" +Profile+ ".json", "MeleeZoom", MeleeZoom)
		SetFloatValue("../Customizable Camera/profile" +Profile+ ".json", "RangedX", RangedX)
		SetFloatValue("../Customizable Camera/profile" +Profile+ ".json", "RangedY", RangedY)
		SetFloatValue("../Customizable Camera/profile" +Profile+ ".json", "RangedZoom", RangedZoom)
		SetINTValue("../Customizable Camera/profile" +Profile+ ".json", "Ignore_LeftHand", Ignore_LeftHand as int)

		SetFloatValue("../Customizable Camera/profile" +Profile+ ".json", "FOV_Slider", FOV_Slider)
		SetFloatValue("../Customizable Camera/profile" +Profile+ ".json", "Vanity_MAX", Vanity_MAX)
		SetFloatValue("../Customizable Camera/profile" +Profile+ ".json", "Vanity_MIN", Vanity_MIN)
		SetFloatValue("../Customizable Camera/profile" +Profile+ ".json", "Zoom_Speed", Zoom_Speed)
		SetFloatValue("../Customizable Camera/profile" +Profile+ ".json", "Zoom_Increments", Zoom_Increments)
		SetFloatValue("../Customizable Camera/profile" +Profile+ ".json", "Pitch_Zoom", Pitch_Zoom)
		SetFloatValue("../Customizable Camera/profile" +Profile+ ".json", "Changestate_Speed", Changestate_Speed)

		SetINTValue("../Customizable Camera/profile" +Profile+ ".json", "Swap_Side", Swap_Side)
		SetINTValue("../Customizable Camera/profile" +Profile+ ".json", "View_Mode_Key", View_Mode_Key)
		SetFloatValue("../Customizable Camera/profile" +Profile+ ".json", "View_Mode_X", View_Mode_X)
		SetFloatValue("../Customizable Camera/profile" +Profile+ ".json", "View_Mode_Y", View_Mode_Y)
		SetFloatValue("../Customizable Camera/profile" +Profile+ ".json", "View_Mode_Zoom", View_Mode_Zoom)
		SetINTValue("../Customizable Camera/profile" +Profile+ ".json", "TFC_Key", TFC_Key)
		SetFloatValue("../Customizable Camera/profile" +Profile+ ".json", "TFC_Speed", TFC_Speed)
		SetFloatValue("../Customizable Camera/profile" +Profile+ ".json", "Sneak_Height", Sneak_Height)

		SetINTValue("../Customizable Camera/profile" +Profile+ ".json", "Toggle_PA", Toggle_PA as int)
		SetINTValue("../Customizable Camera/profile" +Profile+ ".json", "Toggle_Crosshair", Toggle_Crosshair as int)
		SetINTValue("../Customizable Camera/profile" +Profile+ ".json", "Enabled_Sneaking", Enabled_Sneaking as int)
		SetINTValue("../Customizable Camera/profile" +Profile+ ".json", "Enabled_ControlTweaks", Enabled_ControlTweaks as int)

		Save("../Customizable Camera/profile" +Profile+ ".json")
		MessageBox("Profile saved.")
	EndIf
Else
	MessageBox("PapyrusUtil needs to be installed for Profiles to work properly.")
EndIf
EndFunction