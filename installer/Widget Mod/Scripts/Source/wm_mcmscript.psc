Scriptname WM_MCMScript extends SKI_ConfigBase

Import FISSFactory

; -------------------------------------------------------------------------------------------------
; Properties
; -------------------------------------------------------------------------------------------------

GlobalVariable               Property WM_EssentialCounterGlobal Auto
WM_ArrowCountQuestScript     Property ArrowScript               Auto
WM_AthleticCountQuestScript  Property SpeedScript               Auto
WM_AttributeCountQuestScript Property AttributeScript           Auto
WM_BountyCountQuestScript    Property BountyScript              Auto
WM_EssentialCountQuestScript Property EssentialScript           Auto
WM_FollowerCountQuestScript  Property FollowerScript            Auto
WM_GoldCountQuestScript      Property GoldScript                Auto
WM_HorseCountQuestScript     Property HorseScript               Auto
WM_HotkeyCountQuestScript    Property HotkeyScript              Auto
WM_LightCountQuestScript     Property LightScript               Auto
WM_LockpickCountQuestScript  Property LockpickScript            Auto
WM_MasterManagerScript       Property UpdateScript              Auto
WM_SkillCountQuestScript     Property SkillScript               Auto
WM_WeightCountQuestScript    Property WeightScript              Auto


; -------------------------------------------------------------------------------------------------
; Variables
; -------------------------------------------------------------------------------------------------

Float UpdateTimerIndex
Int ArrowAlpha
Int ArrowAnchorH
Int ArrowAnchorV
Int ArrowPosX
Int ArrowPosY
Int ArrowScale
Int ArrowWidget
Int AttributeAlpha
Int AttributeAnchorH
Int AttributeAnchorV
Int AttributePosX
Int AttributePosY
Int AttributeScale
Int AttributeWidget
Int BountyAlpha
Int BountyAnchorH
Int BountyAnchorV
Int BountyPosX
Int BountyPosY
Int BountyScale
Int BountyWidget
Int EssentialAlpha
Int EssentialAnchorH
Int EssentialAnchorV
Int EssentialPosX
Int EssentialPosY
Int EssentialScale
Int EssentialWidget
Int FissLoad
Int FissSave
Int FollowerAlpha
Int FollowerAnchorH
Int FollowerAnchorV
Int FollowerPosX
Int FollowerPosY
Int FollowerScale
Int FollowerWidget
Int GoldAlpha
Int GoldAnchorH
Int GoldAnchorV
Int GoldPosX
Int GoldPosY
Int GoldScale
Int GoldWidget
Int HorseAlpha
Int HorseAnchorH
Int HorseAnchorV
Int HorsePosX
Int HorsePosY
Int HorseScale
Int HorseWidget
Int HotkeyAlpha
Int HotkeyAnchorH
Int HotkeyAnchorV
Int HotkeyPosX
Int HotkeyPosY
Int HotkeyScale
Int HotkeyWidget
Int LightAlpha
Int LightAnchorH
Int LightAnchorV
Int LightPosX
Int LightPosY
Int LightScale
Int LightWidget
Int LockpickAlpha
Int LockpickAnchorH
Int LockpickAnchorV
Int LockpickPosX
Int LockpickPosY
Int LockpickScale
Int LockpickWidget
Int SkillAlpha
Int SkillAnchorH
Int SkillAnchorV
Int SkillPosX
Int SkillPosY
Int SkillScale
Int SkillWidget
Int SpeedAlpha
Int SpeedAnchorH
Int SpeedAnchorV
Int SpeedPosX
Int SpeedPosY
Int SpeedScale
Int SpeedWidget
Int UpdateTimerInt
Int WeightAlpha
Int WeightAnchorH
Int WeightAnchorV
Int WeightPosX
Int WeightPosY
Int WeightScale
Int WeightWidget

String[] HAnchorArrowString
String[] HAnchorAttributeString
String[] HAnchorBountyString
String[] HAnchorEssentialString
String[] HAnchorFollowerString
String[] HAnchorGoldString
String[] HAnchorHorseString
String[] HAnchorHotkeyString
String[] HAnchorLightString
String[] HAnchorLockpickString
String[] HAnchorSkillString
String[] HAnchorSpeedString
String[] HAnchorWeightString
String[] VAnchorArrowString
String[] VAnchorAttributeString
String[] VAnchorBountyString
String[] VAnchorEssentialString
String[] VAnchorFollowerString
String[] VAnchorGoldString
String[] VAnchorHorseString
String[] VAnchorHotkeyString
String[] VAnchorLightString
String[] VAnchorLockpickString
String[] VAnchorSkillString
String[] VAnchorSpeedString
String[] VAnchorWeightString


; -------------------------------------------------------------------------------------------------
; MCM Events
; -------------------------------------------------------------------------------------------------

Event OnConfigInit()
	; Execution Delay.
	Utility.Wait(7.0)

	InitArrays()
	LoadUserPreset()
EndEvent


Event OnPageReset(string Page)
	If (Page == "Position")
		SetCursorFillMode(TOP_TO_BOTTOM)
		SetCursorPosition(0)
		AddHeaderOption("Arrow Counter")
		ArrowWidget = AddToggleOption("Toggle Arrow Counter", ArrowScript.Visible)
		ArrowPosX = AddSliderOption("Left/Right-Position", ArrowScript.X, "{0}")
		ArrowPosY = AddSliderOption("Up/Down-Position", ArrowScript.Y, "{0}")
		ArrowAnchorH = AddMenuOption("Horizontal-Anchor", HAnchorArrowString[HAnchorArrowString.Find(ArrowScript.HAnchor)])
		ArrowAnchorV = AddMenuOption("Vertical-Anchor", VAnchorArrowString[VAnchorArrowString.Find(ArrowScript.VAnchor)])
		AddHeaderOption("Weight Counter")
		WeightWidget = AddToggleOption("Toggle Weight Counter", WeightScript.Visible)
		WeightPosX = AddSliderOption("Left/Right-Position", WeightScript.X, "{0}")
		WeightPosY = AddSliderOption("Up/Down-Position", WeightScript.Y, "{0}")
		WeightAnchorH = AddMenuOption("Horizontal-Anchor", HAnchorWeightString[HAnchorWeightString.Find(WeightScript.HAnchor)])
		WeightAnchorV = AddMenuOption("Vertical-Anchor", VAnchorWeightString[VAnchorWeightString.Find(WeightScript.VAnchor)])
		AddHeaderOption("Skill Counter")
		SkillWidget = AddToggleOption("Toggle Skill Counter", SkillScript.Visible)
		SkillPosX = AddSliderOption("Left/Right-Position", SkillScript.X, "{0}")
		SkillPosY = AddSliderOption("Up/Down-Position", SkillScript.Y, "{0}")
		SkillAnchorH = AddMenuOption("Horizontal-Anchor", HAnchorSkillString[HAnchorSkillString.Find(SkillScript.HAnchor)])
		SkillAnchorV = AddMenuOption("Vertical-Anchor", VAnchorSkillString[VAnchorSkillString.Find(SkillScript.VAnchor)])
		AddHeaderOption("Equipment Counter")
		LockpickWidget = AddToggleOption("Toggle Equipment Counter", LockpickScript.Visible)
		LockpickPosX = AddSliderOption("Left/Right-Position", LockpickScript.X, "{0}")
		LockpickPosY = AddSliderOption("Up/Down-Position", LockpickScript.Y, "{0}")
		LockpickAnchorH = AddMenuOption("Horizontal-Anchor", HAnchorLockpickString[HAnchorLockpickString.Find(LockpickScript.HAnchor)])
		LockpickAnchorV = AddMenuOption("Vertical-Anchor", VAnchorLockpickString[VAnchorLockpickString.Find(LockpickScript.VAnchor)])
		AddHeaderOption("Hotkey Counter")
		HotkeyWidget = AddToggleOption("Toggle Hotkey Counter", HotkeyScript.Visible)
		HotkeyPosX = AddSliderOption("Left/Right-Position", HotkeyScript.X, "{0}")
		HotkeyPosY = AddSliderOption("Up/Down-Position", HotkeyScript.Y, "{0}")
		HotkeyAnchorH = AddMenuOption("Horizontal-Anchor", HAnchorHotkeyString[HAnchorHotkeyString.Find(HotkeyScript.HAnchor)])
		HotkeyAnchorV = AddMenuOption("Vertical-Anchor", VAnchorHotkeyString[VAnchorHotkeyString.Find(HotkeyScript.VAnchor)])
		AddHeaderOption("Follower Counter")
		FollowerWidget = AddToggleOption("Toggle Follower Counter", FollowerScript.Visible)
		FollowerPosX = AddSliderOption("Left/Right-Position", FollowerScript.X, "{0}")
		FollowerPosY = AddSliderOption("Up/Down-Position", FollowerScript.Y, "{0}")
		FollowerAnchorV = AddMenuOption("Vertical-Anchor", VAnchorFollowerString[VAnchorFollowerString.Find(FollowerScript.VAnchor)])		
		FollowerAnchorH = AddMenuOption("Horizontal-Anchor", HAnchorFollowerString[HAnchorFollowerString.Find(FollowerScript.HAnchor)])
		AddHeaderOption("Essential Counter")
		EssentialWidget = AddToggleOption("Toggle Essential Counter", EssentialScript.Visible)
		EssentialPosX = AddSliderOption("Left/Right-Position", EssentialScript.X, "{0}")
		EssentialPosY = AddSliderOption("Up/Down-Position", EssentialScript.Y, "{0}")
		EssentialAnchorH = AddMenuOption("Horizontal-Anchor", HAnchorEssentialString[HAnchorEssentialString.Find(EssentialScript.HAnchor)])
		EssentialAnchorV = AddMenuOption("Vertical-Anchor", VAnchorEssentialString[VAnchorEssentialString.Find(EssentialScript.VAnchor)])		
		SetCursorPosition(1)
		AddHeaderOption("Gold Counter")
		GoldWidget = AddToggleOption("Toggle Gold Counter", GoldScript.Visible)
		GoldPosX = AddSliderOption("Left/Right-Position", GoldScript.X, "{0}")
		GoldPosY = AddSliderOption("Up/Down-Position", GoldScript.Y, "{0}")
		GoldAnchorH = AddMenuOption("Horizontal-Anchor", HAnchorGoldString[HAnchorGoldString.Find(GoldScript.HAnchor)])
		GoldAnchorV = AddMenuOption("Vertical-Anchor", VAnchorGoldString[VAnchorGoldString.Find(GoldScript.VAnchor)])		
		AddHeaderOption("Bounty Counter")
		BountyWidget = AddToggleOption("Toggle Bounty Counter", BountyScript.Visible)
		BountyPosX = AddSliderOption("Left/Right-Position", BountyScript.X, "{0}")
		BountyPosY = AddSliderOption("Up/Down-Position", BountyScript.Y, "{0}")
		BountyAnchorH = AddMenuOption("Horizontal-Anchor", HAnchorBountyString[HAnchorBountyString.Find(BountyScript.HAnchor)])
		BountyAnchorV = AddMenuOption("Vertical-Anchor", VAnchorBountyString[VAnchorBountyString.Find(BountyScript.VAnchor)])
		AddHeaderOption("Speed Counter")
		SpeedWidget = AddToggleOption("Toggle Speed Counter", SpeedScript.Visible)
		SpeedPosX = AddSliderOption("Left/Right-Position", SpeedScript.X, "{0}")
		SpeedPosY = AddSliderOption("Up/Down-Position", SpeedScript.Y, "{0}")
		SpeedAnchorH = AddMenuOption("Horizontal-Anchor", HAnchorSpeedString[HAnchorSpeedString.Find(SpeedScript.HAnchor)])
		SpeedAnchorV = AddMenuOption("Vertical-Anchor", VAnchorSpeedString[VAnchorSpeedString.Find(SpeedScript.VAnchor)])
		AddHeaderOption("Light Counter")
		LightWidget = AddToggleOption("Toggle Light Counter", LightScript.Visible)
		LightPosX = AddSliderOption("Left/Right-Position", LightScript.X, "{0}")
		LightPosY = AddSliderOption("Up/Down-Position", LightScript.Y, "{0}")
		LightAnchorH = AddMenuOption("Horizontal-Anchor", HAnchorLightString[HAnchorLightString.Find(LightScript.HAnchor)])
		LightAnchorV = AddMenuOption("Vertical-Anchor", VAnchorLightString[VAnchorLightString.Find(LightScript.VAnchor)])
		AddHeaderOption("Horse Counter")
		HorseWidget = AddToggleOption("Toggle Horse Counter", HorseScript.Visible)
		HorsePosX = AddSliderOption("Left/Right-Position", HorseScript.X, "{0}")
		HorsePosY = AddSliderOption("Up/Down-Position", HorseScript.Y, "{0}")
		HorseAnchorH = AddMenuOption("Horizontal-Anchor", HAnchorHorseString[HAnchorHorseString.Find(HorseScript.HAnchor)])
		HorseAnchorV = AddMenuOption("Vertical-Anchor", VAnchorHorseString[VAnchorHorseString.Find(HorseScript.VAnchor)])
		AddHeaderOption("Attribute Counter")
		AttributeWidget = AddToggleOption("Toggle Attribute Counter", AttributeScript.Visible)
		AttributePosX = AddSliderOption("Left/Right-Position", AttributeScript.X, "{0}")
		AttributePosY = AddSliderOption("Up/Down-Position", AttributeScript.Y, "{0}")
		AttributeAnchorH = AddMenuOption("Horizontal-Anchor", HAnchorAttributeString[HAnchorAttributeString.Find(AttributeScript.HAnchor)])
		AttributeAnchorV = AddMenuOption("Vertical-Anchor", VAnchorAttributeString[VAnchorAttributeString.Find(AttributeScript.VAnchor)])		
	ElseIf (Page == "Shape")
		SetCursorFillMode(TOP_TO_BOTTOM)
		SetCursorPosition(0)
		AddHeaderOption("Arrow Counter")
		ArrowAlpha = AddSliderOption("Transparency", ArrowScript.Alpha, "{0} %")
		ArrowScale = AddSliderOption("Scale", ArrowScript.Size, "{0} %")		
		AddHeaderOption("Weight Counter")
		WeightAlpha = AddSliderOption("Transparency", WeightScript.Alpha, "{0} %")
		WeightScale = AddSliderOption("Scale", WeightScript.Size, "{0} %")
		AddHeaderOption("Speed Counter")
		SpeedAlpha = AddSliderOption("Transparency", SpeedScript.Alpha, "{0} %")
		SpeedScale = AddSliderOption("Scale", SpeedScript.Size, "{0} %")
		AddHeaderOption("Equipment Counter")
		LockpickAlpha = AddSliderOption("Transparency", LockpickScript.Alpha, "{0} %")
		LockpickScale = AddSliderOption("Scale", LockpickScript.Size, "{0} %")
		AddHeaderOption("Hotkey Counter")
		HotkeyAlpha = AddSliderOption("Transparency", HotkeyScript.Alpha, "{0} %")
		HotkeyScale = AddSliderOption("Scale", HotkeyScript.Size, "{0} %")
		AddHeaderOption("Follower Counter")
		FollowerAlpha = AddSliderOption("Transparency", FollowerScript.Alpha, "{0} %")
		FollowerScale = AddSliderOption("Scale", FollowerScript.Size, "{0} %")
		AddHeaderOption("Essential Counter")		
		EssentialAlpha = AddSliderOption("Transparency", EssentialScript.Alpha, "{0} %")
		EssentialScale = AddSliderOption("Scale", EssentialScript.Size, "{0} %")		
		SetCursorPosition(1)		
		AddHeaderOption("Gold Counter")
		GoldAlpha = AddSliderOption("Transparency", GoldScript.Alpha, "{0} %")
		GoldScale = AddSliderOption("Scale", GoldScript.Size, "{0} %")		
		AddHeaderOption("Bounty Counter")
		BountyAlpha = AddSliderOption("Transparency", BountyScript.Alpha, "{0} %")
		BountyScale = AddSliderOption("Scale", BountyScript.Size, "{0} %")
		AddHeaderOption("Skill Counter")
		SkillAlpha = AddSliderOption("Transparency", SkillScript.Alpha, "{0} %")
		SkillScale = AddSliderOption("Scale", SkillScript.Size, "{0} %")
		AddHeaderOption("Light Counter")
		LightAlpha = AddSliderOption("Transparency", LightScript.Alpha, "{0} %")
		LightScale = AddSliderOption("Scale", LightScript.Size, "{0} %")
		AddHeaderOption("Horse Counter")
		HorseAlpha = AddSliderOption("Transparency", HorseScript.Alpha, "{0} %")
		HorseScale = AddSliderOption("Scale", HorseScript.Size, "{0} %")
		AddHeaderOption("Attribute Counter")
		AttributeAlpha = AddSliderOption("Transparency", AttributeScript.Alpha, "{0} %")
		AttributeScale = AddSliderOption("Scale", AttributeScript.Size, "{0} %")		
	ElseIf (Page == "Maintenance")
		SetCursorFillMode(TOP_TO_BOTTOM)
		SetCursorPosition(0)
		AddHeaderOption("General Settings")
		UpdateTimerInt = AddSliderOption("Update Timer Interval", UpdateScript.UpdateTimer, "{0} sec.")

		Int isFISSAvailable = OPTION_FLAG_NONE
		if !FISSFactory.getFISS()
			isFISSAvailable = OPTION_FLAG_DISABLED
		EndIf
		
		FissLoad = AddTextOption("User Settings", "LOAD", isFISSAvailable)
		FissSave = AddTextOption("User Settings", "SAVE", isFISSAvailable)		
	EndIf
EndEvent


Event OnOptionHighlight(Int Option)
	If (Option == ArrowWidget)
		SetInfoText("Turn on/off Arrow Counter! Default: on")
	ElseIf (Option == ArrowPosX)
		SetInfoText("Set the horizontal position of the Arrow Widget!")
	ElseIf (Option == ArrowPosY)
		SetInfoText("Set the vertical position of the Arrow Widget!")
	ElseIf (Option == ArrowAnchorH)
		SetInfoText("Set the horizontal anchor of the Arrow Widget! Used for faster replacement ")
	ElseIf (Option == ArrowAnchorV)
		SetInfoText("Set the vertical anchor of the Arrow Widget! Used for faster replacement ")
	ElseIf (Option == WeightWidget)
		SetInfoText("Turn on/off Weight Counter! Default: on")
	ElseIf (Option == WeightPosX)
		SetInfoText("Set the horizontal position of the Weight Widget!")
	ElseIf (Option == WeightPosY)
		SetInfoText("Set the vertical position of the Weight Widget!")
	ElseIf (Option == WeightAnchorH)
		SetInfoText("Set the horizontal anchor of the Weight Widget! Used for faster replacement ")
	ElseIf (Option == WeightAnchorV)
		SetInfoText("Set the vertical anchor of the Weight Widget! Used for faster replacement ")		
	ElseIf (Option == GoldWidget)
		SetInfoText("Turn on/off Gold Counter! Default: on")
	ElseIf (Option == GoldPosX)
		SetInfoText("Set the horizontal position of the Gold Widget!")
	ElseIf (Option == GoldPosY)
		SetInfoText("Set the vertical position of the Gold Widget!")
	ElseIf (Option == GoldAnchorH)
		SetInfoText("Set the horizontal anchor of the Gold Widget! Used for faster replacement ")
	ElseIf (Option == GoldAnchorV)
		SetInfoText("Set the vertical anchor of the Gold Widget! Used for faster replacement ")		
	ElseIf (Option == BountyWidget)
		SetInfoText("Turn on/off Bounty Counter! Default: on")
	ElseIf (Option == BountyPosX)
		SetInfoText("Set the horizontal position of the Bounty Widget!")
	ElseIf (Option == BountyPosY)
		SetInfoText("Set the vertical position of the Bounty Widget!")
	ElseIf (Option == BountyAnchorH)
		SetInfoText("Set the horizontal anchor of the Bounty Widget! Used for faster replacement ")
	ElseIf (Option == BountyAnchorV)
		SetInfoText("Set the vertical anchor of the Bounty Widget! Used for faster replacement ")
	ElseIf (Option == SkillWidget)
		SetInfoText("Turn on/off Skill Counter! Default: on")
	ElseIf (Option == SkillPosX)
		SetInfoText("Set the horizontal position of the Skill Widget!")
	ElseIf (Option == SkillPosY)
		SetInfoText("Set the vertical position of the Skill Widget!")
	ElseIf (Option == SkillAnchorH)
		SetInfoText("Set the horizontal anchor of the Skill Widget! Used for faster replacement ")
	ElseIf (Option == SkillAnchorV)
		SetInfoText("Set the vertical anchor of the Skill Widget! Used for faster replacement ")
	ElseIf (Option == SpeedWidget)
		SetInfoText("Turn on/off Speed Counter! Default: on")
	ElseIf (Option == SpeedPosX)
		SetInfoText("Set the horizontal position of the Speed Widget!")
	ElseIf (Option == SpeedPosY)
		SetInfoText("Set the vertical position of the Speed Widget!")
	ElseIf (Option == SpeedAnchorH)
		SetInfoText("Set the horizontal anchor of the Speed Widget! Used for faster replacement ")
	ElseIf (Option == SpeedAnchorV)
		SetInfoText("Set the vertical anchor of the Speed Widget! Used for faster replacement ")
	ElseIf (Option == LockpickWidget)
		SetInfoText("Turn on/off Equipment Counter! Default: on")
	ElseIf (Option == LockpickPosX)
		SetInfoText("Set the horizontal position of the Equipment Widget!")
	ElseIf (Option == LockpickPosY)
		SetInfoText("Set the vertical position of the Equipment Widget!")
	ElseIf (Option == LockpickAnchorH)
		SetInfoText("Set the horizontal anchor of the Equipment Widget! Used for faster replacement ")
	ElseIf (Option == LockpickAnchorV)
		SetInfoText("Set the vertical anchor of the Equipment Widget! Used for faster replacement ")
	ElseIf (Option == LightWidget)
		SetInfoText("Turn on/off Light Counter! Default: on")
	ElseIf (Option == LightPosX)
		SetInfoText("Set the horizontal position of the Light Widget!")
	ElseIf (Option == LightPosY)
		SetInfoText("Set the vertical position of the Light Widget!")
	ElseIf (Option == LightAnchorH)
		SetInfoText("Set the horizontal anchor of the Light Widget! Used for faster replacement ")
	ElseIf (Option == LightAnchorV)
		SetInfoText("Set the vertical anchor of the Light Widget! Used for faster replacement ")
	ElseIf (Option == HotkeyWidget)
		SetInfoText("Turn on/off Hotkey Counter! Default: on")
	ElseIf (Option == HotkeyPosX)
		SetInfoText("Set the horizontal position of the Hotkey Widget!")
	ElseIf (Option == HotkeyPosY)
		SetInfoText("Set the vertical position of the Hotkey Widget!")
	ElseIf (Option == HotkeyAnchorH)
		SetInfoText("Set the horizontal anchor of the Hotkey Widget! Used for faster replacement ")
	ElseIf (Option == HotkeyAnchorV)
		SetInfoText("Set the vertical anchor of the Hotkey Widget! Used for faster replacement ")
	ElseIf (Option == HorseWidget)
		SetInfoText("Turn on/off Horse Counter! Default: on")
	ElseIf (Option == HorsePosX)
		SetInfoText("Set the horizontal position of the Horse Widget!")
	ElseIf (Option == HorsePosY)
		SetInfoText("Set the vertical position of the Horse Widget!")
	ElseIf (Option == HorseAnchorH)
		SetInfoText("Set the horizontal anchor of the Horse Widget! Used for faster replacement ")
	ElseIf (Option == HorseAnchorV)
		SetInfoText("Set the vertical anchor of the Horse Widget! Used for faster replacement ")
	ElseIf (Option == FollowerWidget)
		SetInfoText("Turn on/off Follower Counter! Default: on")
	ElseIf (Option == FollowerPosX)
		SetInfoText("Set the horizontal position of the Follower Widget!")
	ElseIf (Option == FollowerPosY)
		SetInfoText("Set the vertical position of the Follower Widget!")
	ElseIf (Option == FollowerAnchorH)
		SetInfoText("Set the horizontal anchor of the Follower Widget! Used for faster replacement ")
	ElseIf (Option == FollowerAnchorV)
		SetInfoText("Set the vertical anchor of the Follower Widget! Used for faster replacement ")
	ElseIf (Option == AttributeWidget)
		SetInfoText("Turn on/off Attribute Counter! Default: on")
	ElseIf (Option == AttributePosX)
		SetInfoText("Set the horizontal position of the Attribute Widget!")
	ElseIf (Option == AttributePosY)
		SetInfoText("Set the vertical position of the Attribute Widget!")
	ElseIf (Option == AttributeAnchorH)
		SetInfoText("Set the horizontal anchor of the Attribute Widget! Used for faster replacement ")
	ElseIf (Option == AttributeAnchorV)
		SetInfoText("Set the vertical anchor of the Attribute Widget! Used for faster replacement ")
	ElseIf (Option == EssentialWidget)
		SetInfoText("Turn on/off Essential Counter! Default: on")
	ElseIf (Option == EssentialPosX)
		SetInfoText("Set the horizontal position of the Essential Widget!")
	ElseIf (Option == EssentialPosY)
		SetInfoText("Set the vertical position of the Essential Widget!")
	ElseIf (Option == EssentialAnchorH)
		SetInfoText("Set the horizontal anchor of the Essential Widget! Used for faster replacement ")
	ElseIf (Option == EssentialAnchorV)
		SetInfoText("Set the vertical anchor of the Essential Widget! Used for faster replacement ")		
	ElseIf (Option == ArrowAlpha)
		SetInfoText("Set the transparency of the Arrow Widget!")
	ElseIf (Option == WeightAlpha)
		SetInfoText("Set the transparency of the Weight Widget!")
	ElseIf (Option == GoldAlpha)
		SetInfoText("Set the transparency of the Gold Widget!")
	ElseIf (Option == BountyAlpha)
		SetInfoText("Set the transparency of the Bounty Widget!")
	ElseIf (Option == SkillAlpha)
		SetInfoText("Set the transparency of the Skill Widget!")
	ElseIf (Option == SpeedAlpha)
		SetInfoText("Set the transparency of the Speed Widget!")
	ElseIf (Option == LockpickAlpha)
		SetInfoText("Set the transparency of the Lockpick Widget!")
	ElseIf (Option == LightAlpha)
		SetInfoText("Set the transparency of the Light Widget!")
	ElseIf (Option == HotkeyAlpha)
		SetInfoText("Set the transparency of the Hotkey Widget!")
	ElseIf (Option == HorseAlpha)
		SetInfoText("Set the transparency of the Horse Widget!")
	ElseIf (Option == FollowerAlpha)
		SetInfoText("Set the transparency of the Follower Widget!")	
	ElseIf (Option == AttributeAlpha)
		SetInfoText("Set the transparency of the Attribute Widget!")
	ElseIf (Option == EssentialAlpha)
		SetInfoText("Set the transparency of the Essential Widget!")		
	ElseIf (Option == ArrowScale)
		SetInfoText("Set the size of the Arrow Widget!")
	ElseIf (Option == WeightScale)
		SetInfoText("Set the size of the Weight Widget!")
	ElseIf (Option == GoldScale)
		SetInfoText("Set the size of the Gold Widget!")
	ElseIf (Option == BountyScale)
		SetInfoText("Set the size of the Bounty Widget!")
	ElseIf (Option == SkillScale)
		SetInfoText("Set the size of the Skill Widget!")
	ElseIf (Option == SpeedScale)
		SetInfoText("Set the size of the Speed Widget!")
	ElseIf (Option == LockpickScale)
		SetInfoText("Set the size of the Lockpick Widget!")
	ElseIf (Option == LightScale)
		SetInfoText("Set the size of the Light Widget!")
	ElseIf (Option == HotkeyScale)
		SetInfoText("Set the size of the Hotkey Widget!")
	ElseIf (Option == HorseScale)
		SetInfoText("Set the size of the Horse Widget!")
	ElseIf (Option == FollowerScale)
		SetInfoText("Set the size of the Follower Widget!")	
	ElseIf (Option == AttributeScale)
		SetInfoText("Set the size of the Attribute Widget!")
	ElseIf (Option == EssentialScale)
		SetInfoText("Set the size of the Essential Widget!")		
	ElseIf (Option == UpdateTimerInt)
		SetInfoText("Set the interval of the update script in seconds!")
	ElseIf (Option == FissLoad)
		SetInfoText("Load user preset from .xml!")
	ElseIf (Option == FissSave)
		SetInfoText("Save user preset to .xml!")		
	EndIf
EndEvent


Event OnOptionSelect(Int Option)
	If (Option == ArrowWidget)
		ArrowScript.Visible = !ArrowScript.Visible
		SetToggleOptionValue(Option, ArrowScript.Visible)
	ElseIf (Option == WeightWidget)
		WeightScript.Visible = !WeightScript.Visible
		SetToggleOptionValue(Option, WeightScript.Visible)
	ElseIf (Option == GoldWidget)
		GoldScript.Visible = !GoldScript.Visible
		SetToggleOptionValue(Option, GoldScript.Visible)
	ElseIf (Option == BountyWidget)
		BountyScript.Visible = !BountyScript.Visible
		SetToggleOptionValue(Option, BountyScript.Visible)
	ElseIf (Option == SkillWidget)
		SkillScript.Visible = !SkillScript.Visible
		SetToggleOptionValue(Option, SkillScript.Visible)
	ElseIf (Option == SpeedWidget)
		SpeedScript.Visible = !SpeedScript.Visible
		SetToggleOptionValue(Option, SpeedScript.Visible)
	ElseIf (Option == LockpickWidget)
		LockpickScript.Visible = !LockpickScript.Visible
		SetToggleOptionValue(Option, LockpickScript.Visible)
	ElseIf (Option == LightWidget)
		LightScript.Visible = !LightScript.Visible
		SetToggleOptionValue(Option, LightScript.Visible)		
	ElseIf (Option == HotkeyWidget)
		HotkeyScript.Visible = !HotkeyScript.Visible
		SetToggleOptionValue(Option, HotkeyScript.Visible)
	ElseIf (Option == HorseWidget)
		HorseScript.Visible = !HorseScript.Visible
		SetToggleOptionValue(Option, HorseScript.Visible)
	ElseIf (Option == FollowerWidget)
		FollowerScript.Visible = !FollowerScript.Visible
		SetToggleOptionValue(Option, FollowerScript.Visible)
	ElseIf (Option == AttributeWidget)
		AttributeScript.Visible = !AttributeScript.Visible
		SetToggleOptionValue(Option, AttributeScript.Visible)
	ElseIf (Option == EssentialWidget)
		EssentialScript.Visible = !EssentialScript.Visible
		SetToggleOptionValue(Option, EssentialScript.Visible)	
		WM_EssentialCounterGlobal.SetValueInt(1)	
		If !EssentialScript.Visible
			WM_EssentialCounterGlobal.SetValueInt(0)
		EndIf
	ElseIf (Option == FissLoad)
		String result = LoadUserPreset()
		SetTextOptionValue(Option, result)
	ElseIf (Option == FissSave)
		String result = SaveUserPreset()
		SetTextOptionValue(Option, result)
	EndIf
EndEvent


Event OnOptionSliderOpen(Int Option)
	If (Option == ArrowPosX)
		SetSliderDialogStartValue(ArrowScript.X)
		SetSliderDialogRange(-100.00, 1380.00)
		SetSliderDialogInterval(1.00)
		SetSliderDialogDefaultValue(10.00)
	ElseIf (Option == ArrowPosY)
		SetSliderDialogStartValue(ArrowScript.Y)
		SetSliderDialogRange(-100.00, 820.00)
		SetSliderDialogInterval(1.00)
		SetSliderDialogDefaultValue(710.00)
	ElseIf (Option == WeightPosX)
		SetSliderDialogStartValue(WeightScript.X)
		SetSliderDialogRange(-100.00, 1380.00)
		SetSliderDialogInterval(1.00)
		SetSliderDialogDefaultValue(60.00)
	ElseIf (Option == WeightPosY)
		SetSliderDialogStartValue(WeightScript.Y)
		SetSliderDialogRange(-100.00, 820.00)
		SetSliderDialogInterval(1.00)
		SetSliderDialogDefaultValue(710.00)
	ElseIf (Option == GoldPosX)
		SetSliderDialogStartValue(GoldScript.X)
		SetSliderDialogRange(-100.00, 1380.00)
		SetSliderDialogInterval(1.00)
		SetSliderDialogDefaultValue(118.00)
	ElseIf (Option == GoldPosY)
		SetSliderDialogStartValue(GoldScript.Y)
		SetSliderDialogRange(-100.00, 820.00)
		SetSliderDialogInterval(1.00)
		SetSliderDialogDefaultValue(711.00)
	ElseIf (Option == BountyPosX)
		SetSliderDialogStartValue(BountyScript.X)
		SetSliderDialogRange(-100.00, 1380.00)
		SetSliderDialogInterval(1.00)
		SetSliderDialogDefaultValue(165.00)
	ElseIf (Option == BountyPosY)
		SetSliderDialogStartValue(BountyScript.Y)
		SetSliderDialogRange(-100.00, 820.00)
		SetSliderDialogInterval(1.00)
		SetSliderDialogDefaultValue(712.00)
	ElseIf (Option == SkillPosX)
		SetSliderDialogStartValue(SkillScript.X)
		SetSliderDialogRange(-100.00, 1380.00)
		SetSliderDialogInterval(1.00)
		SetSliderDialogDefaultValue(165.00)
	ElseIf (Option == SkillPosY)
		SetSliderDialogStartValue(SkillScript.Y)
		SetSliderDialogRange(-100.00, 820.00)
		SetSliderDialogInterval(1.00)
		SetSliderDialogDefaultValue(712.00)
	ElseIf (Option == SpeedPosX)
		SetSliderDialogStartValue(SpeedScript.X)
		SetSliderDialogRange(-100.00, 1380.00)
		SetSliderDialogInterval(1.00)
		SetSliderDialogDefaultValue(165.00)
	ElseIf (Option == SpeedPosY)
		SetSliderDialogStartValue(SpeedScript.Y)
		SetSliderDialogRange(-100.00, 820.00)
		SetSliderDialogInterval(1.00)
		SetSliderDialogDefaultValue(712.00)
	ElseIf (Option == LockpickPosX)
		SetSliderDialogStartValue(LockpickScript.X)
		SetSliderDialogRange(-100.00, 1380.00)
		SetSliderDialogInterval(1.00)
		SetSliderDialogDefaultValue(165.00)
	ElseIf (Option == LockpickPosY)
		SetSliderDialogStartValue(LockpickScript.Y)
		SetSliderDialogRange(-100.00, 820.00)
		SetSliderDialogInterval(1.00)
		SetSliderDialogDefaultValue(712.00)
	ElseIf (Option == LightPosX)
		SetSliderDialogStartValue(LightScript.X)
		SetSliderDialogRange(-100.00, 1380.00)
		SetSliderDialogInterval(1.00)
		SetSliderDialogDefaultValue(165.00)
	ElseIf (Option == LightPosY)
		SetSliderDialogStartValue(LightScript.Y)
		SetSliderDialogRange(-100.00, 820.00)
		SetSliderDialogInterval(1.00)
		SetSliderDialogDefaultValue(712.00)
	ElseIf (Option == HotkeyPosX)
		SetSliderDialogStartValue(HotkeyScript.X)
		SetSliderDialogRange(-100.00, 1380.00)
		SetSliderDialogInterval(1.00)
		SetSliderDialogDefaultValue(165.00)
	ElseIf (Option == HotkeyPosY)
		SetSliderDialogStartValue(HotkeyScript.Y)
		SetSliderDialogRange(-100.00, 820.00)
		SetSliderDialogInterval(1.00)
		SetSliderDialogDefaultValue(712.00)	
	ElseIf (Option == HorsePosX)
		SetSliderDialogStartValue(HorseScript.X)
		SetSliderDialogRange(-100.00, 1380.00)
		SetSliderDialogInterval(1.00)
		SetSliderDialogDefaultValue(165.00)
	ElseIf (Option == HorsePosY)
		SetSliderDialogStartValue(HorseScript.Y)
		SetSliderDialogRange(-100.00, 820.00)
		SetSliderDialogInterval(1.00)
		SetSliderDialogDefaultValue(712.00)	
	ElseIf (Option == FollowerPosX)
		SetSliderDialogStartValue(FollowerScript.X)
		SetSliderDialogRange(-100.00, 1380.00)
		SetSliderDialogInterval(1.00)
		SetSliderDialogDefaultValue(165.00)
	ElseIf (Option == FollowerPosY)
		SetSliderDialogStartValue(FollowerScript.Y)
		SetSliderDialogRange(-100.00, 820.00)
		SetSliderDialogInterval(1.00)
		SetSliderDialogDefaultValue(712.00)
	ElseIf (Option == AttributePosX)
		SetSliderDialogStartValue(AttributeScript.X)
		SetSliderDialogRange(-100.00, 1380.00)
		SetSliderDialogInterval(1.00)
		SetSliderDialogDefaultValue(165.00)
	ElseIf (Option == AttributePosY)
		SetSliderDialogStartValue(AttributeScript.Y)
		SetSliderDialogRange(-100.00, 820.00)
		SetSliderDialogInterval(1.00)
		SetSliderDialogDefaultValue(712.00)	
	ElseIf (Option == EssentialPosX)
		SetSliderDialogStartValue(EssentialScript.X)
		SetSliderDialogRange(-100.00, 1380.00)
		SetSliderDialogInterval(1.00)
		SetSliderDialogDefaultValue(165.00)
	ElseIf (Option == EssentialPosY)
		SetSliderDialogStartValue(EssentialScript.Y)
		SetSliderDialogRange(-100.00, 820.00)
		SetSliderDialogInterval(1.00)
		SetSliderDialogDefaultValue(712.00)			
	ElseIf (Option == ArrowAlpha)
		SetSliderDialogStartValue(ArrowScript.Alpha)
		SetSliderDialogRange(0.00, 100.00)
		SetSliderDialogInterval(1.00)
		SetSliderDialogDefaultValue(100.00)
	ElseIf (Option == WeightAlpha)
		SetSliderDialogStartValue(WeightScript.Alpha)
		SetSliderDialogRange(0.00, 100.00)
		SetSliderDialogInterval(1.00)
		SetSliderDialogDefaultValue(100.00)
	ElseIf (Option == GoldAlpha)
		SetSliderDialogStartValue(GoldScript.Alpha)
		SetSliderDialogRange(0.00, 100.00)
		SetSliderDialogInterval(1.00)
		SetSliderDialogDefaultValue(100.00)
	ElseIf (Option == BountyAlpha)
		SetSliderDialogStartValue(BountyScript.Alpha)
		SetSliderDialogRange(0.00, 100.00)
		SetSliderDialogInterval(1.00)
		SetSliderDialogDefaultValue(100.00)
	ElseIf (Option == SkillAlpha)
		SetSliderDialogStartValue(SkillScript.Alpha)
		SetSliderDialogRange(0.00, 100.00)
		SetSliderDialogInterval(1.00)
		SetSliderDialogDefaultValue(100.00)
	ElseIf (Option == SpeedAlpha)
		SetSliderDialogStartValue(SpeedScript.Alpha)
		SetSliderDialogRange(0.00, 100.00)
		SetSliderDialogInterval(1.00)
		SetSliderDialogDefaultValue(100.00)
	ElseIf (Option == LockpickAlpha)
		SetSliderDialogStartValue(LockpickScript.Alpha)
		SetSliderDialogRange(0.00, 100.00)
		SetSliderDialogInterval(1.00)
		SetSliderDialogDefaultValue(100.00)
	ElseIf (Option == LightAlpha)
		SetSliderDialogStartValue(LightScript.Alpha)
		SetSliderDialogRange(0.00, 100.00)
		SetSliderDialogInterval(1.00)
		SetSliderDialogDefaultValue(100.00)
	ElseIf (Option == HotkeyAlpha)
		SetSliderDialogStartValue(HotkeyScript.Alpha)
		SetSliderDialogRange(0.00, 100.00)
		SetSliderDialogInterval(1.00)
		SetSliderDialogDefaultValue(100.00)	
	ElseIf (Option == HorseAlpha)
		SetSliderDialogStartValue(HorseScript.Alpha)
		SetSliderDialogRange(0.00, 100.00)
		SetSliderDialogInterval(1.00)
		SetSliderDialogDefaultValue(100.00)	
	ElseIf (Option == FollowerAlpha)
		SetSliderDialogStartValue(FollowerScript.Alpha)
		SetSliderDialogRange(0.00, 100.00)
		SetSliderDialogInterval(1.00)
		SetSliderDialogDefaultValue(100.00)
	ElseIf (Option == AttributeAlpha)
		SetSliderDialogStartValue(AttributeScript.Alpha)
		SetSliderDialogRange(0.00, 100.00)
		SetSliderDialogInterval(1.00)
		SetSliderDialogDefaultValue(100.00)	
	ElseIf (Option == EssentialAlpha)
		SetSliderDialogStartValue(EssentialScript.Alpha)
		SetSliderDialogRange(0.00, 100.00)
		SetSliderDialogInterval(1.00)
		SetSliderDialogDefaultValue(100.00)		
	ElseIf (Option == ArrowScale)
		SetSliderDialogStartValue(ArrowScript.Size)
		SetSliderDialogRange(1.00, 1000.00)
		SetSliderDialogInterval(1.00)
		SetSliderDialogDefaultValue(100.00)
	ElseIf (Option == WeightScale)
		SetSliderDialogStartValue(WeightScript.Size)
		SetSliderDialogRange(1.00, 1000.00)
		SetSliderDialogInterval(1.00)
		SetSliderDialogDefaultValue(100.00)
	ElseIf (Option == GoldScale)
		SetSliderDialogStartValue(GoldScript.Size)
		SetSliderDialogRange(1.00, 1000.00)
		SetSliderDialogInterval(1.00)
		SetSliderDialogDefaultValue(100.00)
	ElseIf (Option == BountyScale)
		SetSliderDialogStartValue(BountyScript.Size)
		SetSliderDialogRange(1.00, 1000.00)
		SetSliderDialogInterval(1.00)
		SetSliderDialogDefaultValue(100.00)
	ElseIf (Option == SkillScale)
		SetSliderDialogStartValue(SkillScript.Size)
		SetSliderDialogRange(1.00, 1000.00)
		SetSliderDialogInterval(1.00)
		SetSliderDialogDefaultValue(100.00)
	ElseIf (Option == SpeedScale)
		SetSliderDialogStartValue(SpeedScript.Size)
		SetSliderDialogRange(1.00, 1000.00)
		SetSliderDialogInterval(1.00)
		SetSliderDialogDefaultValue(100.00)
	ElseIf (Option == LockpickScale)
		SetSliderDialogStartValue(LockpickScript.Size)
		SetSliderDialogRange(1.00, 1000.00)
		SetSliderDialogInterval(1.00)
		SetSliderDialogDefaultValue(100.00)
	ElseIf (Option == LightScale)
		SetSliderDialogStartValue(LightScript.Size)
		SetSliderDialogRange(1.00, 1000.00)
		SetSliderDialogInterval(1.00)
		SetSliderDialogDefaultValue(100.00)
	ElseIf (Option == HotkeyScale)
		SetSliderDialogStartValue(HotkeyScript.Size)
		SetSliderDialogRange(1.00, 1000.00)
		SetSliderDialogInterval(1.00)
		SetSliderDialogDefaultValue(100.00)
	ElseIf (Option == HorseScale)
		SetSliderDialogStartValue(HorseScript.Size)
		SetSliderDialogRange(1.00, 1000.00)
		SetSliderDialogInterval(1.00)
		SetSliderDialogDefaultValue(100.00)	
	ElseIf (Option == FollowerScale)
		SetSliderDialogStartValue(FollowerScript.Size)
		SetSliderDialogRange(1.00, 1000.00)
		SetSliderDialogInterval(1.00)
		SetSliderDialogDefaultValue(100.00)
	ElseIf (Option == AttributeScale)
		SetSliderDialogStartValue(AttributeScript.Size)
		SetSliderDialogRange(1.00, 1000.00)
		SetSliderDialogInterval(1.00)
		SetSliderDialogDefaultValue(100.00)
	ElseIf (Option == EssentialScale)
		SetSliderDialogStartValue(EssentialScript.Size)
		SetSliderDialogRange(1.00, 1000.00)
		SetSliderDialogInterval(1.00)
		SetSliderDialogDefaultValue(100.00)		
	ElseIf (Option == UpdateTimerInt)
		SetSliderDialogStartValue(UpdateScript.UpdateTimer)
		SetSliderDialogRange(0.1, 10.00)
		SetSliderDialogInterval(0.1)
		SetSliderDialogDefaultValue(0.25)			
	EndIf
EndEvent


Event OnOptionSliderAccept(Int Option, Float Value)
	If (Option == ArrowPosX)
		ArrowScript.SetX(Value)
		SetSliderOptionValue(Option, ArrowScript.X, "{0}")
	ElseIf (Option == ArrowPosY)
		ArrowScript.SetY(Value)
		SetSliderOptionValue(Option, ArrowScript.Y, "{0}")
	ElseIf (Option == WeightPosX)
		WeightScript.SetX(Value)
		SetSliderOptionValue(Option, WeightScript.X, "{0}")
	ElseIf (Option == WeightPosY)
		WeightScript.SetY(Value)
		SetSliderOptionValue(Option, WeightScript.Y, "{0}")
	ElseIf (Option == GoldPosX)
		GoldScript.SetX(Value)
		SetSliderOptionValue(Option, GoldScript.X, "{0}")
	ElseIf (Option == GoldPosY)
		GoldScript.SetY(Value)
		SetSliderOptionValue(Option, GoldScript.Y, "{0}")
	ElseIf (Option == BountyPosX)
		BountyScript.SetX(Value)
		SetSliderOptionValue(Option, BountyScript.X, "{0}")
	ElseIf (Option == BountyPosY)
		BountyScript.SetY(Value)
		SetSliderOptionValue(Option, BountyScript.Y, "{0}")
	ElseIf (Option == SkillPosX)
		SkillScript.SetX(Value)
		SetSliderOptionValue(Option, SkillScript.X, "{0}")
	ElseIf (Option == SkillPosY)
		SkillScript.SetY(Value)
		SetSliderOptionValue(Option, SkillScript.Y, "{0}")
	ElseIf (Option == SpeedPosX)
		SpeedScript.SetX(Value)
		SetSliderOptionValue(Option, SpeedScript.X, "{0}")
	ElseIf (Option == SpeedPosY)
		SpeedScript.SetY(Value)
		SetSliderOptionValue(Option, SpeedScript.Y, "{0}")
	ElseIf (Option == LockpickPosX)
		LockpickScript.SetX(Value)
		SetSliderOptionValue(Option, LockpickScript.X, "{0}")
	ElseIf (Option == LockpickPosY)
		LockpickScript.SetY(Value)
		SetSliderOptionValue(Option, LockpickScript.Y, "{0}")
	ElseIf (Option == LightPosX)
		LightScript.SetX(Value)
		SetSliderOptionValue(Option, LightScript.X, "{0}")
	ElseIf (Option == LightPosY)
		LightScript.SetY(Value)
		SetSliderOptionValue(Option, LightScript.Y, "{0}")
	ElseIf (Option == HotkeyPosX)
		HotkeyScript.SetX(Value)
		SetSliderOptionValue(Option, HotkeyScript.X, "{0}")
	ElseIf (Option == HotkeyPosY)
		HotkeyScript.SetY(Value)
		SetSliderOptionValue(Option, HotkeyScript.Y, "{0}")	
	ElseIf (Option == HorsePosX)
		HorseScript.SetX(Value)
		SetSliderOptionValue(Option, HorseScript.X, "{0}")
	ElseIf (Option == HorsePosY)
		HorseScript.SetY(Value)
		SetSliderOptionValue(Option, HorseScript.Y, "{0}")	
	ElseIf (Option == FollowerPosX)
		FollowerScript.SetX(Value)
		SetSliderOptionValue(Option, FollowerScript.X, "{0}")
	ElseIf (Option == FollowerPosY)
		FollowerScript.SetY(Value)
		SetSliderOptionValue(Option, FollowerScript.Y, "{0}")
	ElseIf (Option == AttributePosX)
		AttributeScript.SetX(Value)
		SetSliderOptionValue(Option, AttributeScript.X, "{0}")
	ElseIf (Option == AttributePosY)
		AttributeScript.SetY(Value)
		SetSliderOptionValue(Option, AttributeScript.Y, "{0}")
	ElseIf (Option == EssentialPosX)
		EssentialScript.SetX(Value)
		SetSliderOptionValue(Option, EssentialScript.X, "{0}")
	ElseIf (Option == EssentialPosY)
		EssentialScript.SetY(Value)
		SetSliderOptionValue(Option, EssentialScript.Y, "{0}")		
	ElseIf (Option == ArrowAlpha)
		ArrowScript.SetTransparency(Value)
		SetSliderOptionValue(Option, ArrowScript.Alpha, "{0}")
	ElseIf (Option == WeightAlpha)
		WeightScript.SetTransparency(Value)
		SetSliderOptionValue(Option, WeightScript.Alpha, "{0}")
	ElseIf (Option == GoldAlpha)
		GoldScript.SetTransparency(Value)
		SetSliderOptionValue(Option, GoldScript.Alpha, "{0}")
	ElseIf (Option == BountyAlpha)
		BountyScript.SetTransparency(Value)
		SetSliderOptionValue(Option, BountyScript.Alpha, "{0}")
	ElseIf (Option == SkillAlpha)
		SkillScript.SetTransparency(Value)
		SetSliderOptionValue(Option, SkillScript.Alpha, "{0}")
	ElseIf (Option == SpeedAlpha)
		SpeedScript.SetTransparency(Value)
		SetSliderOptionValue(Option, SpeedScript.Alpha, "{0}")
	ElseIf (Option == LockpickAlpha)
		LockpickScript.SetTransparency(Value)
		SetSliderOptionValue(Option, LockpickScript.Alpha, "{0}")
	ElseIf (Option == LightAlpha)
		LightScript.SetTransparency(Value)
		SetSliderOptionValue(Option, LightScript.Alpha, "{0}")
	ElseIf (Option == HotkeyAlpha)
		HotkeyScript.SetTransparency(Value)
		SetSliderOptionValue(Option, HotkeyScript.Alpha, "{0}")	
	ElseIf (Option == HorseAlpha)
		HorseScript.SetTransparency(Value)
		SetSliderOptionValue(Option, HorseScript.Alpha, "{0}")	
	ElseIf (Option == FollowerAlpha)
		FollowerScript.SetTransparency(Value)
		SetSliderOptionValue(Option, FollowerScript.Alpha, "{0}")
	ElseIf (Option == AttributeAlpha)
		AttributeScript.SetTransparency(Value)
		SetSliderOptionValue(Option, AttributeScript.Alpha, "{0}")
	ElseIf (Option == EssentialAlpha)
		EssentialScript.SetTransparency(Value)
		SetSliderOptionValue(Option, EssentialScript.Alpha, "{0}")		
	ElseIf (Option == ArrowScale)
		ArrowScript.Size = Value as Int
		SetSliderOptionValueST(Option, ArrowScript.Size, "{0}%")
		ForcePageReset()
	ElseIf (Option == WeightScale)
		WeightScript.Size = Value as Int
		SetSliderOptionValue(Option, WeightScript.Size, "{0}%")
		ForcePageReset()
	ElseIf (Option == GoldScale)
		GoldScript.Size = Value as Int
		SetSliderOptionValue(Option, GoldScript.Size, "{0}%")
		ForcePageReset()
	ElseIf (Option == BountyScale)
		BountyScript.Size = Value as Int
		SetSliderOptionValue(Option, BountyScript.Size, "{0}%")
		ForcePageReset()
	ElseIf (Option == SkillScale)
		SkillScript.Size = Value as Int
		SetSliderOptionValue(Option, SkillScript.Size, "{0}%")
		ForcePageReset()
	ElseIf (Option == SpeedScale)
		SpeedScript.Size = Value as Int
		SetSliderOptionValue(Option, SpeedScript.Size, "{0}%")
		ForcePageReset()
	ElseIf (Option == LockpickScale)
		LockpickScript.Size = Value as Int
		SetSliderOptionValue(Option, LockpickScript.Size, "{0}%")
		ForcePageReset()
	ElseIf (Option == LightScale)
		LightScript.Size = Value as Int
		SetSliderOptionValue(Option, LightScript.Size, "{0}%")
		ForcePageReset()
	ElseIf (Option == HotkeyScale)
		HotkeyScript.Size = Value as Int
		SetSliderOptionValue(Option, HotkeyScript.Size, "{0}%")
		ForcePageReset()
	ElseIf (Option == HorseScale)
		HorseScript.Size = Value as Int
		SetSliderOptionValue(Option, HorseScript.Size, "{0}%")
		ForcePageReset()
	ElseIf (Option == FollowerScale)
		FollowerScript.Size = Value as Int
		SetSliderOptionValue(Option, FollowerScript.Size, "{0}%")
		ForcePageReset()
	ElseIf (Option == AttributeScale)
		AttributeScript.Size = Value as Int
		SetSliderOptionValue(Option, AttributeScript.Size, "{0}%")
		ForcePageReset()
	ElseIf (Option == EssentialScale)
		EssentialScript.Size = Value as Int
		SetSliderOptionValue(Option, EssentialScript.Size, "{0}%")
		ForcePageReset()		
	ElseIf (Option == UpdateTimerInt)
		UpdateScript.UpdateTimer = Value
		SetSliderOptionValue(Option, UpdateScript.UpdateTimer, "{0} sec.")
		ForcePageReset()		
	EndIf
EndEvent


Event OnOptionMenuOpen(Int Option)
	If (Option == ArrowAnchorH)
		SetMenuDialogStartIndex(HAnchorArrowString.Find(ArrowScript.HAnchor))
		SetMenuDialogDefaultIndex(0)
		SetMenuDialogOptions(HAnchorArrowString)
	ElseIf (Option == ArrowAnchorV)
		SetMenuDialogStartIndex(VAnchorArrowString.Find(ArrowScript.VAnchor))
		SetMenuDialogDefaultIndex(0)
		SetMenuDialogOptions(VAnchorArrowString)
	ElseIf (Option == WeightAnchorH)
		SetMenuDialogStartIndex(HAnchorWeightString.Find(WeightScript.HAnchor))
		SetMenuDialogDefaultIndex(0)
		SetMenuDialogOptions(HAnchorWeightString)
	ElseIf (Option == WeightAnchorV)
		SetMenuDialogStartIndex(VAnchorWeightString.Find(WeightScript.VAnchor))
		SetMenuDialogDefaultIndex(0)
		SetMenuDialogOptions(VAnchorWeightString)
	ElseIf (Option == GoldAnchorH)
		SetMenuDialogStartIndex(HAnchorGoldString.Find(GoldScript.HAnchor))
		SetMenuDialogDefaultIndex(0)
		SetMenuDialogOptions(HAnchorGoldString)
	ElseIf (Option == GoldAnchorV)
		SetMenuDialogStartIndex(VAnchorGoldString.Find(GoldScript.VAnchor))
		SetMenuDialogDefaultIndex(0)
		SetMenuDialogOptions(VAnchorGoldString)
	ElseIf (Option == BountyAnchorH)
		SetMenuDialogStartIndex(HAnchorBountyString.Find(BountyScript.HAnchor))
		SetMenuDialogDefaultIndex(0)
		SetMenuDialogOptions(HAnchorBountyString)
	ElseIf (Option == BountyAnchorV)
		SetMenuDialogStartIndex(VAnchorBountyString.Find(BountyScript.VAnchor))
		SetMenuDialogDefaultIndex(0)
		SetMenuDialogOptions(VAnchorBountyString)
	ElseIf (Option == SkillAnchorH)
		SetMenuDialogStartIndex(HAnchorSkillString.Find(SkillScript.HAnchor))
		SetMenuDialogDefaultIndex(0)
		SetMenuDialogOptions(HAnchorSkillString)
	ElseIf (Option == SkillAnchorV)
		SetMenuDialogStartIndex(VAnchorSkillString.Find(SkillScript.VAnchor))
		SetMenuDialogDefaultIndex(0)
		SetMenuDialogOptions(VAnchorSkillString)
	ElseIf (Option == SpeedAnchorH)
		SetMenuDialogStartIndex(HAnchorSpeedString.Find(SpeedScript.HAnchor))
		SetMenuDialogDefaultIndex(0)
		SetMenuDialogOptions(HAnchorSpeedString)
	ElseIf (Option == SpeedAnchorV)
		SetMenuDialogStartIndex(VAnchorSpeedString.Find(SpeedScript.VAnchor))
		SetMenuDialogDefaultIndex(0)
		SetMenuDialogOptions(VAnchorSpeedString)
	ElseIf (Option == LockpickAnchorH)
		SetMenuDialogStartIndex(HAnchorLockpickString.Find(LockpickScript.HAnchor))
		SetMenuDialogDefaultIndex(0)
		SetMenuDialogOptions(HAnchorLockpickString)
	ElseIf (Option == LockpickAnchorV)
		SetMenuDialogStartIndex(VAnchorLockpickString.Find(LockpickScript.VAnchor))
		SetMenuDialogDefaultIndex(0)
		SetMenuDialogOptions(VAnchorLockpickString)
	ElseIf (Option == LightAnchorH)
		SetMenuDialogStartIndex(HAnchorLightString.Find(LightScript.HAnchor))
		SetMenuDialogDefaultIndex(0)
		SetMenuDialogOptions(HAnchorLightString)
	ElseIf (Option == LightAnchorV)
		SetMenuDialogStartIndex(VAnchorLightString.Find(LightScript.VAnchor))
		SetMenuDialogDefaultIndex(0)
		SetMenuDialogOptions(VAnchorLightString)
	ElseIf (Option == HotkeyAnchorH)
		SetMenuDialogStartIndex(HAnchorHotkeyString.Find(HotkeyScript.HAnchor))
		SetMenuDialogDefaultIndex(0)
		SetMenuDialogOptions(HAnchorHotkeyString)
	ElseIf (Option == HotkeyAnchorV)
		SetMenuDialogStartIndex(VAnchorHotkeyString.Find(HotkeyScript.VAnchor))
		SetMenuDialogDefaultIndex(0)
		SetMenuDialogOptions(VAnchorHotkeyString)
	ElseIf (Option == HorseAnchorH)
		SetMenuDialogStartIndex(HAnchorHorseString.Find(HorseScript.HAnchor))
		SetMenuDialogDefaultIndex(0)
		SetMenuDialogOptions(HAnchorHorseString)
	ElseIf (Option == HorseAnchorV)
		SetMenuDialogStartIndex(VAnchorHorseString.Find(HorseScript.VAnchor))
		SetMenuDialogDefaultIndex(0)
		SetMenuDialogOptions(VAnchorHorseString)
	ElseIf (Option == FollowerAnchorH)
		SetMenuDialogStartIndex(HAnchorFollowerString.Find(FollowerScript.HAnchor))
		SetMenuDialogDefaultIndex(0)
		SetMenuDialogOptions(HAnchorFollowerString)
	ElseIf (Option == FollowerAnchorV)
		SetMenuDialogStartIndex(VAnchorFollowerString.Find(FollowerScript.VAnchor))
		SetMenuDialogDefaultIndex(0)
		SetMenuDialogOptions(VAnchorFollowerString)	
	ElseIf (Option == AttributeAnchorH)
		SetMenuDialogStartIndex(HAnchorAttributeString.Find(AttributeScript.HAnchor))
		SetMenuDialogDefaultIndex(0)
		SetMenuDialogOptions(HAnchorAttributeString)
	ElseIf (Option == AttributeAnchorV)
		SetMenuDialogStartIndex(VAnchorAttributeString.Find(AttributeScript.VAnchor))
		SetMenuDialogDefaultIndex(0)
		SetMenuDialogOptions(VAnchorAttributeString)
	ElseIf (Option == EssentialAnchorH)
		SetMenuDialogStartIndex(HAnchorEssentialString.Find(EssentialScript.HAnchor))
		SetMenuDialogDefaultIndex(0)
		SetMenuDialogOptions(HAnchorEssentialString)
	ElseIf (Option == EssentialAnchorV)
		SetMenuDialogStartIndex(VAnchorEssentialString.Find(EssentialScript.VAnchor))
		SetMenuDialogDefaultIndex(0)
		SetMenuDialogOptions(VAnchorEssentialString)		
	EndIf
EndEvent


Event OnOptionMenuAccept(Int Option, Int Index)
	If (Option == ArrowAnchorH)
		ArrowScript.HAnchor = HAnchorArrowString[Index]
		SetMenuOptionValue(Option, HAnchorArrowString[HAnchorArrowString.Find(ArrowScript.HAnchor)])
		If Index == 0
			ArrowScript.X = 10
			ForcePageReset()
		ElseIf Index == 1
			ArrowScript.X = 1270
			ForcePageReset()
		ElseIf Index == 2
			ArrowScript.X = 630
			ForcePageReset()			
		EndIf
	ElseIf (Option == ArrowAnchorV)
		ArrowScript.VAnchor = VAnchorArrowString[Index]
		SetMenuOptionValue(Option, VAnchorArrowString[VAnchorArrowString.Find(ArrowScript.VAnchor)])
		If Index == 0
			ArrowScript.Y = 710
			ForcePageReset()
		ElseIf Index == 1
			ArrowScript.Y = 10
			ForcePageReset()
		ElseIf Index == 2
			ArrowScript.Y = 350
			ForcePageReset()			
		EndIf		
	ElseIf (Option == WeightAnchorH)
		WeightScript.HAnchor = HAnchorWeightString[Index]
		SetMenuOptionValue(Option, HAnchorWeightString[HAnchorWeightString.Find(WeightScript.HAnchor)])
		If Index == 0
			WeightScript.X = 10
			ForcePageReset()
		ElseIf Index == 1
			WeightScript.X = 1270
			ForcePageReset()
		ElseIf Index == 2
			WeightScript.X = 630
			ForcePageReset()			
		EndIf		
	ElseIf (Option == WeightAnchorV)
		WeightScript.VAnchor = VAnchorWeightString[Index]
		SetMenuOptionValue(Option, VAnchorWeightString[VAnchorWeightString.Find(WeightScript.VAnchor)])
		If Index == 0
			WeightScript.Y = 710
			ForcePageReset()
		ElseIf Index == 1
			WeightScript.Y = 10
			ForcePageReset()
		ElseIf Index == 2
			WeightScript.Y = 350
			ForcePageReset()			
		EndIf		
	ElseIf (Option == GoldAnchorH)
		GoldScript.HAnchor = HAnchorGoldString[Index]
		SetMenuOptionValue(Option, HAnchorGoldString[HAnchorGoldString.Find(GoldScript.HAnchor)])
		If Index == 0
			GoldScript.X = 10
			ForcePageReset()
		ElseIf Index == 1
			GoldScript.X = 1270
			ForcePageReset()
		ElseIf Index == 2
			GoldScript.X = 630
			ForcePageReset()			
		EndIf		
	ElseIf (Option == GoldAnchorV)
		GoldScript.VAnchor = VAnchorGoldString[Index]
		SetMenuOptionValue(Option, VAnchorGoldString[VAnchorGoldString.Find(GoldScript.VAnchor)])
		If Index == 0
			GoldScript.Y = 710
			ForcePageReset()
		ElseIf Index == 1
			GoldScript.Y = 10
			ForcePageReset()
		ElseIf Index == 2
			GoldScript.Y = 350
			ForcePageReset()			
		EndIf		
	ElseIf (Option == BountyAnchorH)
		BountyScript.HAnchor = HAnchorBountyString[Index]
		SetMenuOptionValue(Option, HAnchorBountyString[HAnchorBountyString.Find(BountyScript.HAnchor)])
		If Index == 0
			BountyScript.X = 10
			ForcePageReset()
		ElseIf Index == 1
			BountyScript.X = 1270
			ForcePageReset()
		ElseIf Index == 2
			BountyScript.X = 630
			ForcePageReset()			
		EndIf		
	ElseIf (Option == BountyAnchorV)
		BountyScript.VAnchor = VAnchorBountyString[Index]
		SetMenuOptionValue(Option, VAnchorBountyString[VAnchorBountyString.Find(BountyScript.VAnchor)])
		If Index == 0
			BountyScript.Y = 710
			ForcePageReset()
		ElseIf Index == 1
			BountyScript.Y = 10
			ForcePageReset()
		ElseIf Index == 2
			BountyScript.Y = 350
			ForcePageReset()			
		EndIf
	ElseIf (Option == SkillAnchorH)
		SkillScript.HAnchor = HAnchorSkillString[Index]
		SetMenuOptionValue(Option, HAnchorSkillString[HAnchorSkillString.Find(SkillScript.HAnchor)])
		If Index == 0
			SkillScript.X = 10
			ForcePageReset()
		ElseIf Index == 1
			SkillScript.X = 1270
			ForcePageReset()
		ElseIf Index == 2
			SkillScript.X = 630
			ForcePageReset()			
		EndIf		
	ElseIf (Option == SkillAnchorV)
		SkillScript.VAnchor = VAnchorSkillString[Index]
		SetMenuOptionValue(Option, VAnchorSkillString[VAnchorSkillString.Find(SkillScript.VAnchor)])
		If Index == 0
			SkillScript.Y = 710
			ForcePageReset()
		ElseIf Index == 1
			SkillScript.Y = 10
			ForcePageReset()
		ElseIf Index == 2
			SkillScript.Y = 350
			ForcePageReset()			
		EndIf
	ElseIf (Option == SpeedAnchorH)
		SpeedScript.HAnchor = HAnchorSpeedString[Index]
		SetMenuOptionValue(Option, HAnchorSpeedString[HAnchorSpeedString.Find(SpeedScript.HAnchor)])
		If Index == 0
			SpeedScript.X = 10
			ForcePageReset()
		ElseIf Index == 1
			SpeedScript.X = 1270
			ForcePageReset()
		ElseIf Index == 2
			SpeedScript.X = 630
			ForcePageReset()			
		EndIf		
	ElseIf (Option == SpeedAnchorV)
		SpeedScript.VAnchor = VAnchorSpeedString[Index]
		SetMenuOptionValue(Option, VAnchorSpeedString[VAnchorSpeedString.Find(SpeedScript.VAnchor)])
		If Index == 0
			SpeedScript.Y = 710
			ForcePageReset()
		ElseIf Index == 1
			SpeedScript.Y = 10
			ForcePageReset()
		ElseIf Index == 2
			SpeedScript.Y = 350
			ForcePageReset()			
		EndIf
	ElseIf (Option == LockpickAnchorH)
		LockpickScript.HAnchor = HAnchorLockpickString[Index]
		SetMenuOptionValue(Option, HAnchorLockpickString[HAnchorLockpickString.Find(LockpickScript.HAnchor)])
		If Index == 0
			LockpickScript.X = 10
			ForcePageReset()
		ElseIf Index == 1
			LockpickScript.X = 1270
			ForcePageReset()
		ElseIf Index == 2
			LockpickScript.X = 630
			ForcePageReset()			
		EndIf		
	ElseIf (Option == LockpickAnchorV)
		LockpickScript.VAnchor = VAnchorLockpickString[Index]
		SetMenuOptionValue(Option, VAnchorLockpickString[VAnchorLockpickString.Find(LockpickScript.VAnchor)])
		If Index == 0
			LockpickScript.Y = 710
			ForcePageReset()
		ElseIf Index == 1
			LockpickScript.Y = 10
			ForcePageReset()
		ElseIf Index == 2
			LockpickScript.Y = 350
			ForcePageReset()			
		EndIf
	ElseIf (Option == LightAnchorH)
		LightScript.HAnchor = HAnchorLightString[Index]
		SetMenuOptionValue(Option, HAnchorLightString[HAnchorLightString.Find(LightScript.HAnchor)])
		If Index == 0
			LightScript.X = 10
			ForcePageReset()
		ElseIf Index == 1
			LightScript.X = 1270
			ForcePageReset()
		ElseIf Index == 2
			LightScript.X = 630
			ForcePageReset()			
		EndIf		
	ElseIf (Option == LightAnchorV)
		LightScript.VAnchor = VAnchorLightString[Index]
		SetMenuOptionValue(Option, VAnchorLightString[VAnchorLightString.Find(LightScript.VAnchor)])
		If Index == 0
			LightScript.Y = 710
			ForcePageReset()
		ElseIf Index == 1
			LightScript.Y = 10
			ForcePageReset()
		ElseIf Index == 2
			LightScript.Y = 350
			ForcePageReset()			
		EndIf	
	ElseIf (Option == HotkeyAnchorH)
		HotkeyScript.HAnchor = HAnchorHotkeyString[Index]
		SetMenuOptionValue(Option, HAnchorHotkeyString[HAnchorHotkeyString.Find(HotkeyScript.HAnchor)])
		If Index == 0
			HotkeyScript.X = 10
			ForcePageReset()
		ElseIf Index == 1
			HotkeyScript.X = 1270
			ForcePageReset()
		ElseIf Index == 2
			HotkeyScript.X = 630
			ForcePageReset()			
		EndIf		
	ElseIf (Option == HotkeyAnchorV)
		HotkeyScript.VAnchor = VAnchorHotkeyString[Index]
		SetMenuOptionValue(Option, VAnchorHotkeyString[VAnchorHotkeyString.Find(HotkeyScript.VAnchor)])
		If Index == 0
			HotkeyScript.Y = 710
			ForcePageReset()
		ElseIf Index == 1
			HotkeyScript.Y = 10
			ForcePageReset()
		ElseIf Index == 2
			HotkeyScript.Y = 350
			ForcePageReset()			
		EndIf
	ElseIf (Option == HorseAnchorH)
		HorseScript.HAnchor = HAnchorHorseString[Index]
		SetMenuOptionValue(Option, HAnchorHorseString[HAnchorHorseString.Find(HorseScript.HAnchor)])
		If Index == 0
			HorseScript.X = 10
			ForcePageReset()
		ElseIf Index == 1
			HorseScript.X = 1270
			ForcePageReset()
		ElseIf Index == 2
			HorseScript.X = 630
			ForcePageReset()			
		EndIf		
	ElseIf (Option == HorseAnchorV)
		HorseScript.VAnchor = VAnchorHorseString[Index]
		SetMenuOptionValue(Option, VAnchorHorseString[VAnchorHorseString.Find(HorseScript.VAnchor)])
		If Index == 0
			HorseScript.Y = 710
			ForcePageReset()
		ElseIf Index == 1
			HorseScript.Y = 10
			ForcePageReset()
		ElseIf Index == 2
			HorseScript.Y = 350
			ForcePageReset()			
		EndIf		
	ElseIf (Option == FollowerAnchorH)
		FollowerScript.HAnchor = HAnchorFollowerString[Index]
		SetMenuOptionValue(Option, HAnchorFollowerString[HAnchorFollowerString.Find(FollowerScript.HAnchor)])
		If Index == 0
			FollowerScript.X = 10
			ForcePageReset()
		ElseIf Index == 1
			FollowerScript.X = 1270
			ForcePageReset()
		ElseIf Index == 2
			FollowerScript.X = 630
			ForcePageReset()			
		EndIf	
	ElseIf (Option == FollowerAnchorV)
		FollowerScript.VAnchor = VAnchorFollowerString[Index]
		SetMenuOptionValue(Option, VAnchorFollowerString[VAnchorFollowerString.Find(FollowerScript.VAnchor)])
		If Index == 0
			FollowerScript.Y = 710
			ForcePageReset()
		ElseIf Index == 1
			FollowerScript.Y = 10
			ForcePageReset()
		ElseIf Index == 2
			FollowerScript.Y = 350
			ForcePageReset()			
		EndIf		
	ElseIf (Option == AttributeAnchorH)
		AttributeScript.HAnchor = HAnchorAttributeString[Index]
		SetMenuOptionValue(Option, HAnchorAttributeString[HAnchorAttributeString.Find(AttributeScript.HAnchor)])
		If Index == 0
			AttributeScript.X = 10
			ForcePageReset()
		ElseIf Index == 1
			AttributeScript.X = 1270
			ForcePageReset()
		ElseIf Index == 2
			AttributeScript.X = 630
			ForcePageReset()			
		EndIf		
	ElseIf (Option == AttributeAnchorV)
		AttributeScript.VAnchor = VAnchorAttributeString[Index]
		SetMenuOptionValue(Option, VAnchorAttributeString[VAnchorAttributeString.Find(AttributeScript.VAnchor)])
		If Index == 0
			AttributeScript.Y = 710
			ForcePageReset()
		ElseIf Index == 1
			AttributeScript.Y = 10
			ForcePageReset()
		ElseIf Index == 2
			AttributeScript.Y = 350
			ForcePageReset()
		EndIf		
	ElseIf (Option == EssentialAnchorH)
		EssentialScript.HAnchor = HAnchorEssentialString[Index]
		SetMenuOptionValue(Option, HAnchorEssentialString[HAnchorEssentialString.Find(EssentialScript.HAnchor)])
		If Index == 0
			EssentialScript.X = 10
			ForcePageReset()
		ElseIf Index == 1
			EssentialScript.X = 1270
			ForcePageReset()
		ElseIf Index == 2
			EssentialScript.X = 630
			ForcePageReset()			
		EndIf		
	ElseIf (Option == EssentialAnchorV)
		EssentialScript.VAnchor = VAnchorEssentialString[Index]
		SetMenuOptionValue(Option, VAnchorEssentialString[VAnchorEssentialString.Find(EssentialScript.VAnchor)])
		If Index == 0
			EssentialScript.Y = 710
			ForcePageReset()
		ElseIf Index == 1
			EssentialScript.Y = 10
			ForcePageReset()
		ElseIf Index == 2
			EssentialScript.Y = 350
			ForcePageReset()						
		EndIf		
	EndIf
EndEvent


; -------------------------------------------------------------------------------------------------
; Functions
; -------------------------------------------------------------------------------------------------

Function InitArrays()
	HAnchorArrowString = new String[3]
	HAnchorArrowString[0] = "Left"
	HAnchorArrowString[1] = "Right"
	HAnchorArrowString[2] = "Center"	
	HAnchorWeightString = new String[3]
	HAnchorWeightString[0] = "Left"
	HAnchorWeightString[1] = "Right"
	HAnchorWeightString[2] = "Center"	
	HAnchorGoldString = new String[3]
	HAnchorGoldString[0] = "Left"
	HAnchorGoldString[1] = "Right"
	HAnchorGoldString[2] = "Center"	
	HAnchorBountyString = new String[3]
	HAnchorBountyString[0] = "Left"
	HAnchorBountyString[1] = "Right"
	HAnchorBountyString[2] = "Center"	
	HAnchorSkillString = new String[3]
	HAnchorSkillString[0] = "Left"
	HAnchorSkillString[1] = "Right"
	HAnchorSkillString[2] = "Center"	
	HAnchorSpeedString = new String[3]
	HAnchorSpeedString[0] = "Left"
	HAnchorSpeedString[1] = "Right"
	HAnchorSpeedString[2] = "Center"	
	HAnchorLockpickString = new String[3]
	HAnchorLockpickString[0] = "Left"
	HAnchorLockpickString[1] = "Right"
	HAnchorLockpickString[2] = "Center"	
	HAnchorLightString = new String[3]
	HAnchorLightString[0] = "Left"
	HAnchorLightString[1] = "Right"
	HAnchorLightString[2] = "Center"	
	HAnchorHotkeyString = new String[3]
	HAnchorHotkeyString[0] = "Left"
	HAnchorHotkeyString[1] = "Right"
	HAnchorHotkeyString[2] = "Center"	
	HAnchorHorseString = new String[3]
	HAnchorHorseString[0] = "Left"
	HAnchorHorseString[1] = "Right"
	HAnchorHorseString[2] = "Center"		
	HAnchorFollowerString = new String[3]
	HAnchorFollowerString[0] = "Left"
	HAnchorFollowerString[1] = "Right"
	HAnchorFollowerString[2] = "Center"	
	HAnchorAttributeString = new String[3]
	HAnchorAttributeString[0] = "Left"
	HAnchorAttributeString[1] = "Right"
	HAnchorAttributeString[2] = "Center"
	HAnchorEssentialString = new String[3]
	HAnchorEssentialString[0] = "Left"
	HAnchorEssentialString[1] = "Right"
	HAnchorEssentialString[2] = "Center"
	VAnchorArrowString = new String[3]
	VAnchorArrowString[0] = "Bottom"
	VAnchorArrowString[1] = "Top"
	VAnchorArrowString[2] = "Center"	
	VAnchorWeightString = new String[3]
	VAnchorWeightString[0] = "Bottom"
	VAnchorWeightString[1] = "Top"
	VAnchorWeightString[2] = "Center"	
	VAnchorGoldString = new String[3]
	VAnchorGoldString[0] = "Bottom"
	VAnchorGoldString[1] = "Top"
	VAnchorGoldString[2] = "Center"	
	VAnchorBountyString = new String[3]
	VAnchorBountyString[0] = "Bottom"
	VAnchorBountyString[1] = "Top"
	VAnchorBountyString[2] = "Center"	
	VAnchorSkillString = new String[3]
	VAnchorSkillString[0] = "Bottom"
	VAnchorSkillString[1] = "Top"
	VAnchorSkillString[2] = "Center"	
	VAnchorSpeedString = new String[3]
	VAnchorSpeedString[0] = "Bottom"
	VAnchorSpeedString[1] = "Top"
	VAnchorSpeedString[2] = "Center"	
	VAnchorLockpickString = new String[3]
	VAnchorLockpickString[0] = "Bottom"
	VAnchorLockpickString[1] = "Top"
	VAnchorLockpickString[2] = "Center"	
	VAnchorLightString = new String[3]
	VAnchorLightString[0] = "Bottom"
	VAnchorLightString[1] = "Top"
	VAnchorLightString[2] = "Center"	
	VAnchorHotkeyString = new String[3]
	VAnchorHotkeyString[0] = "Bottom"
	VAnchorHotkeyString[1] = "Top"
	VAnchorHotkeyString[2] = "Center"	
	VAnchorHorseString = new String[3]
	VAnchorHorseString[0] = "Bottom"
	VAnchorHorseString[1] = "Top"
	VAnchorHorseString[2] = "Center"
	VAnchorFollowerString = new String[3]
	VAnchorFollowerString[0] = "Bottom"
	VAnchorFollowerString[1] = "Top"
	VAnchorFollowerString[2] = "Center"	
	VAnchorAttributeString = new String[3]
	VAnchorAttributeString[0] = "Bottom"
	VAnchorAttributeString[1] = "Top"
	VAnchorAttributeString[2] = "Center"
	VAnchorEssentialString = new String[3]
	VAnchorEssentialString[0] = "Bottom"
	VAnchorEssentialString[1] = "Top"
	VAnchorEssentialString[2] = "Center"
EndFunction


String Function LoadUserPreset()
	FISSInterface fiss = FISSFactory.getFISS()
	If fiss
		fiss.beginLoad("WMUserSettings.xml")		
		ArrowWidget = fiss.loadInt("FISS_ArrowWidget")
		ArrowScript.Visible = fiss.loadBool("FISS_ArrowWidgetScript")
		ArrowPosX = fiss.loadInt("FISS_ArrowPosX")
		ArrowScript.X = fiss.loadFloat("FISS_ArrowPosXScript")
		ArrowPosY = fiss.loadInt("FISS_ArrowPosY")
		ArrowScript.Y = fiss.loadFloat("FISS_ArrowPosYScript")
		ArrowAlpha = fiss.loadInt("FISS_ArrowAlpha")
		ArrowScript.Alpha = fiss.loadFloat("FISS_ArrowAlphaScript")
		ArrowScale = fiss.loadInt("FISS_ArrowScale")
		ArrowScript.Size = fiss.loadInt("FISS_ArrowScaleScript")
		WeightWidget = fiss.loadInt("FISS_WeightWidget")
		WeightScript.Visible = fiss.loadBool("FISS_WeightWidgetScript")
		WeightPosX = fiss.loadInt("FISS_WeightPosX")
		WeightScript.X = fiss.loadFloat("FISS_WeightPosXScript")
		WeightPosY = fiss.loadInt("FISS_WeightPosY")
		WeightScript.Y = fiss.loadFloat("FISS_WeightPosYScript")
		WeightAlpha = fiss.loadInt("FISS_WeightAlpha")
		WeightScript.Alpha = fiss.loadFloat("FISS_WeightAlphaScript")
		WeightScale = fiss.loadInt("FISS_WeightScale")
		WeightScript.Size = fiss.loadInt("FISS_WeightScaleScript")
		GoldWidget = fiss.loadInt("FISS_GoldWidget")
		GoldScript.Visible = fiss.loadBool("FISS_GoldWidgetScript")
		GoldPosX = fiss.loadInt("FISS_GoldPosX")
		GoldScript.X = fiss.loadFloat("FISS_GoldPosXScript")
		GoldPosY = fiss.loadInt("FISS_GoldPosY")
		GoldScript.Y = fiss.loadFloat("FISS_GoldPosYScript")
		GoldAlpha = fiss.loadInt("FISS_GoldAlpha")
		GoldScript.Alpha = fiss.loadFloat("FISS_GoldAlphaScript")
		GoldScale = fiss.loadInt("FISS_GoldScale")
		GoldScript.Size = fiss.loadInt("FISS_GoldScaleScript")
		BountyWidget = fiss.loadInt("FISS_BountyWidget")
		BountyScript.Visible = fiss.loadBool("FISS_BountyWidgetScript")
		BountyPosX = fiss.loadInt("FISS_BountyPosX")
		BountyScript.X = fiss.loadFloat("FISS_BountyPosXScript")
		BountyPosY = fiss.loadInt("FISS_BountyPosY")
		BountyScript.Y = fiss.loadFloat("FISS_BountyPosYScript")
		BountyAlpha = fiss.loadInt("FISS_BountyAlpha")
		BountyScript.Alpha = fiss.loadFloat("FISS_BountyAlphaScript")
		BountyScale = fiss.loadInt("FISS_BountyScale")
		BountyScript.Size = fiss.loadInt("FISS_BountyScaleScript")
		SkillWidget = fiss.loadInt("FISS_SkillWidget")
		SkillScript.Visible = fiss.loadBool("FISS_SkillWidgetScript")
		SkillPosX = fiss.loadInt("FISS_SkillPosX")
		SkillScript.X = fiss.loadFloat("FISS_SkillPosXScript")
		SkillPosY = fiss.loadInt("FISS_SkillPosY")
		SkillScript.Y = fiss.loadFloat("FISS_SkillPosYScript")
		SkillAlpha = fiss.loadInt("FISS_SkillAlpha")
		SkillScript.Alpha = fiss.loadFloat("FISS_SkillAlphaScript")
		SkillScale = fiss.loadInt("FISS_SkillScale")
		SkillScript.Size = fiss.loadInt("FISS_SkillScaleScript")
		SpeedWidget = fiss.loadInt("FISS_SpeedWidget")
		SpeedScript.Visible = fiss.loadBool("FISS_SpeedWidgetScript")
		SpeedPosX = fiss.loadInt("FISS_SpeedPosX")
		SpeedScript.X = fiss.loadFloat("FISS_SpeedPosXScript")
		SpeedPosY = fiss.loadInt("FISS_SpeedPosY")
		SpeedScript.Y = fiss.loadFloat("FISS_SpeedPosYScript")
		SpeedAlpha = fiss.loadInt("FISS_SpeedAlpha")
		SpeedScript.Alpha = fiss.loadFloat("FISS_SpeedAlphaScript")
		SpeedScale = fiss.loadInt("FISS_SpeedScale")
		SpeedScript.Size = fiss.loadInt("FISS_SpeedScaleScript")
		LockpickWidget = fiss.loadInt("FISS_LockpickWidget")
		LockpickScript.Visible = fiss.loadBool("FISS_LockpickWidgetScript")
		LockpickPosX = fiss.loadInt("FISS_LockpickPosX")
		LockpickScript.X = fiss.loadFloat("FISS_LockpickPosXScript")
		LockpickPosY = fiss.loadInt("FISS_LockpickPosY")
		LockpickScript.Y = fiss.loadFloat("FISS_LockpickPosYScript")
		LockpickAlpha = fiss.loadInt("FISS_LockpickAlpha")
		LockpickScript.Alpha = fiss.loadFloat("FISS_LockpickAlphaScript")
		LockpickScale = fiss.loadInt("FISS_LockpickScale")
		LockpickScript.Size = fiss.loadInt("FISS_LockpickScaleScript")
		LightWidget = fiss.loadInt("FISS_LightWidget")
		LightScript.Visible = fiss.loadBool("FISS_LightWidgetScript")
		LightPosX = fiss.loadInt("FISS_LightPosX")
		LightScript.X = fiss.loadFloat("FISS_LightPosXScript")
		LightPosY = fiss.loadInt("FISS_LightPosY")
		LightScript.Y = fiss.loadFloat("FISS_LightPosYScript")
		LightAlpha = fiss.loadInt("FISS_LightAlpha")
		LightScript.Alpha = fiss.loadFloat("FISS_LightAlphaScript")
		LightScale = fiss.loadInt("FISS_LightScale")
		LightScript.Size = fiss.loadInt("FISS_LightScaleScript")
		HotkeyWidget = fiss.loadInt("FISS_HotkeyWidget")
		HotkeyScript.Visible = fiss.loadBool("FISS_HotkeyWidgetScript")
		HotkeyPosX = fiss.loadInt("FISS_HotkeyPosX")
		HotkeyScript.X = fiss.loadFloat("FISS_HotkeyPosXScript")
		HotkeyPosY = fiss.loadInt("FISS_HotkeyPosY")
		HotkeyScript.Y = fiss.loadFloat("FISS_HotkeyPosYScript")
		HotkeyAlpha = fiss.loadInt("FISS_HotkeyAlpha")
		HotkeyScript.Alpha = fiss.loadFloat("FISS_HotkeyAlphaScript")
		HotkeyScale = fiss.loadInt("FISS_HotkeyScale")
		HotkeyScript.Size = fiss.loadInt("FISS_HotkeyScaleScript")	
		HorseWidget = fiss.loadInt("FISS_HorseWidget")
		HorseScript.Visible = fiss.loadBool("FISS_HorseWidgetScript")
		HorsePosX = fiss.loadInt("FISS_HorsePosX")
		HorseScript.X = fiss.loadFloat("FISS_HorsePosXScript")
		HorsePosY = fiss.loadInt("FISS_HorsePosY")
		HorseScript.Y = fiss.loadFloat("FISS_HorsePosYScript")
		HorseAlpha = fiss.loadInt("FISS_HorseAlpha")
		HorseScript.Alpha = fiss.loadFloat("FISS_HorseAlphaScript")
		HorseScale = fiss.loadInt("FISS_HorseScale")
		HorseScript.Size = fiss.loadInt("FISS_HorseScaleScript")
		FollowerWidget = fiss.loadInt("FISS_FollowerWidget")
		FollowerScript.Visible = fiss.loadBool("FISS_FollowerWidgetScript")
		FollowerPosX = fiss.loadInt("FISS_FollowerPosX")
		FollowerScript.X = fiss.loadFloat("FISS_FollowerPosXScript")
		FollowerPosY = fiss.loadInt("FISS_FollowerPosY")
		FollowerScript.Y = fiss.loadFloat("FISS_FollowerPosYScript")
		FollowerAlpha = fiss.loadInt("FISS_FollowerAlpha")
		FollowerScript.Alpha = fiss.loadFloat("FISS_FollowerAlphaScript")
		FollowerScale = fiss.loadInt("FISS_FollowerScale")
		FollowerScript.Size = fiss.loadInt("FISS_FollowerScaleScript")
		AttributeWidget = fiss.loadInt("FISS_AttributeWidget")
		AttributeScript.Visible = fiss.loadBool("FISS_AttributeWidgetScript")
		AttributePosX = fiss.loadInt("FISS_AttributePosX")
		AttributeScript.X = fiss.loadFloat("FISS_AttributePosXScript")
		AttributePosY = fiss.loadInt("FISS_AttributePosY")
		AttributeScript.Y = fiss.loadFloat("FISS_AttributePosYScript")
		AttributeAlpha = fiss.loadInt("FISS_AttributeAlpha")
		AttributeScript.Alpha = fiss.loadFloat("FISS_AttributeAlphaScript")
		AttributeScale = fiss.loadInt("FISS_AttributeScale")
		AttributeScript.Size = fiss.loadInt("FISS_AttributeScaleScript")
		EssentialWidget = fiss.loadInt("FISS_EssentialWidget")
		EssentialScript.Visible = fiss.loadBool("FISS_EssentialWidgetScript")
		EssentialPosX = fiss.loadInt("FISS_EssentialPosX")
		EssentialScript.X = fiss.loadFloat("FISS_EssentialPosXScript")
		EssentialPosY = fiss.loadInt("FISS_EssentialPosY")
		EssentialScript.Y = fiss.loadFloat("FISS_EssentialPosYScript")
		EssentialAlpha = fiss.loadInt("FISS_EssentialAlpha")
		EssentialScript.Alpha = fiss.loadFloat("FISS_EssentialAlphaScript")
		EssentialScale = fiss.loadInt("FISS_EssentialScale")
		EssentialScript.Size = fiss.loadInt("FISS_EssentialScaleScript")	
		String loadResult = fiss.endLoad()
		if loadResult == ""
			return "Done!"
		Else
			return loadResult
		EndIf
	Else
		return "FISS not found, load aborted!"
	EndIf
EndFunction


String Function SaveUserPreset()
	FISSInterface fiss = FISSFactory.getFISS()
	If fiss
		fiss.beginSave("WMUserSettings.xml", "Widget Mod")
		fiss.saveInt("FISS_ArrowWidget", ArrowWidget)
		fiss.saveBool("FISS_ArrowWidgetScript", ArrowScript.Visible)
		fiss.saveInt("FISS_ArrowPosX", ArrowPosX)
		fiss.saveFloat("FISS_ArrowPosXScript", ArrowScript.X)
		fiss.saveInt("FISS_ArrowPosY", ArrowPosY)
		fiss.saveFloat("FISS_ArrowPosYScript", ArrowScript.Y)
		fiss.saveInt("FISS_ArrowAlpha", ArrowAlpha)
		fiss.saveFloat("FISS_ArrowAlphaScript", ArrowScript.Alpha)
		fiss.saveInt("FISS_ArrowScale", ArrowScale)
		fiss.saveInt("FISS_ArrowScaleScript", ArrowScript.Size)
		fiss.saveInt("FISS_WeightWidget", WeightWidget)
		fiss.saveBool("FISS_WeightWidgetScript", WeightScript.Visible)
		fiss.saveInt("FISS_WeightPosX", WeightPosX)
		fiss.saveFloat("FISS_WeightPosXScript", WeightScript.X)
		fiss.saveInt("FISS_WeightPosY", WeightPosY)
		fiss.saveFloat("FISS_WeightPosYScript", WeightScript.Y)
		fiss.saveInt("FISS_WeightAlpha", WeightAlpha)
		fiss.saveFloat("FISS_WeightAlphaScript", WeightScript.Alpha)
		fiss.saveInt("FISS_WeightScale", WeightScale)
		fiss.saveInt("FISS_WeightScaleScript", WeightScript.Size)
		fiss.saveInt("FISS_GoldWidget", GoldWidget)
		fiss.saveBool("FISS_GoldWidgetScript", GoldScript.Visible)
		fiss.saveInt("FISS_GoldPosX", GoldPosX)
		fiss.saveFloat("FISS_GoldPosXScript", GoldScript.X)
		fiss.saveInt("FISS_GoldPosY", GoldPosY)
		fiss.saveFloat("FISS_GoldPosYScript", GoldScript.Y)
		fiss.saveInt("FISS_GoldAlpha", GoldAlpha)
		fiss.saveFloat("FISS_GoldAlphaScript", GoldScript.Alpha)
		fiss.saveInt("FISS_GoldScale", GoldScale)
		fiss.saveInt("FISS_GoldScaleScript", GoldScript.Size)
		fiss.saveInt("FISS_BountyWidget", BountyWidget)
		fiss.saveBool("FISS_BountyWidgetScript", BountyScript.Visible)
		fiss.saveInt("FISS_BountyPosX", BountyPosX)
		fiss.saveFloat("FISS_BountyPosXScript", BountyScript.X)
		fiss.saveInt("FISS_BountyPosY", BountyPosY)
		fiss.saveFloat("FISS_BountyPosYScript", BountyScript.Y)
		fiss.saveInt("FISS_BountyAlpha", BountyAlpha)
		fiss.saveFloat("FISS_BountyAlphaScript", BountyScript.Alpha)
		fiss.saveInt("FISS_BountyScale", BountyScale)
		fiss.saveInt("FISS_BountyScaleScript", BountyScript.Size)
		fiss.saveInt("FISS_SkillWidget", SkillWidget)
		fiss.saveBool("FISS_SkillWidgetScript", SkillScript.Visible)
		fiss.saveInt("FISS_SkillPosX", SkillPosX)
		fiss.saveFloat("FISS_SkillPosXScript", SkillScript.X)
		fiss.saveInt("FISS_SkillPosY", SkillPosY)
		fiss.saveFloat("FISS_SkillPosYScript", SkillScript.Y)
		fiss.saveInt("FISS_SkillAlpha", SkillAlpha)
		fiss.saveFloat("FISS_SkillAlphaScript", SkillScript.Alpha)
		fiss.saveInt("FISS_SkillScale", SkillScale)
		fiss.saveInt("FISS_SkillScaleScript", SkillScript.Size)
		fiss.saveInt("FISS_SpeedWidget", SpeedWidget)
		fiss.saveBool("FISS_SpeedWidgetScript", SpeedScript.Visible)
		fiss.saveInt("FISS_SpeedPosX", SpeedPosX)
		fiss.saveFloat("FISS_SpeedPosXScript", SpeedScript.X)
		fiss.saveInt("FISS_SpeedPosY", SpeedPosY)
		fiss.saveFloat("FISS_SpeedPosYScript", SpeedScript.Y)
		fiss.saveInt("FISS_SpeedAlpha", SpeedAlpha)
		fiss.saveFloat("FISS_SpeedAlphaScript", SpeedScript.Alpha)
		fiss.saveInt("FISS_SpeedScale", SpeedScale)
		fiss.saveInt("FISS_SpeedScaleScript", SpeedScript.Size)
		fiss.saveInt("FISS_LockpickWidget", LockpickWidget)
		fiss.saveBool("FISS_LockpickWidgetScript", LockpickScript.Visible)
		fiss.saveInt("FISS_LockpickPosX", LockpickPosX)
		fiss.saveFloat("FISS_LockpickPosXScript", LockpickScript.X)
		fiss.saveInt("FISS_LockpickPosY", LockpickPosY)
		fiss.saveFloat("FISS_LockpickPosYScript", LockpickScript.Y)
		fiss.saveInt("FISS_LockpickAlpha", LockpickAlpha)
		fiss.saveFloat("FISS_LockpickAlphaScript", LockpickScript.Alpha)
		fiss.saveInt("FISS_LockpickScale", LockpickScale)
		fiss.saveInt("FISS_LockpickScaleScript", LockpickScript.Size)
		fiss.saveInt("FISS_LightWidget", LightWidget)
		fiss.saveBool("FISS_LightWidgetScript", LightScript.Visible)
		fiss.saveInt("FISS_LightPosX", LightPosX)
		fiss.saveFloat("FISS_LightPosXScript", LightScript.X)
		fiss.saveInt("FISS_LightPosY", LightPosY)
		fiss.saveFloat("FISS_LightPosYScript", LightScript.Y)
		fiss.saveInt("FISS_LightAlpha", LightAlpha)
		fiss.saveFloat("FISS_LightAlphaScript", LightScript.Alpha)
		fiss.saveInt("FISS_LightScale", LightScale)
		fiss.saveInt("FISS_LightScaleScript", LightScript.Size)
		fiss.saveInt("FISS_HotkeyWidget", HotkeyWidget)
		fiss.saveBool("FISS_HotkeyWidgetScript", HotkeyScript.Visible)
		fiss.saveInt("FISS_HotkeyPosX", HotkeyPosX)
		fiss.saveFloat("FISS_HotkeyPosXScript", HotkeyScript.X)
		fiss.saveInt("FISS_HotkeyPosY", HotkeyPosY)
		fiss.saveFloat("FISS_HotkeyPosYScript", HotkeyScript.Y)
		fiss.saveInt("FISS_HotkeyAlpha", HotkeyAlpha)
		fiss.saveFloat("FISS_HotkeyAlphaScript", HotkeyScript.Alpha)
		fiss.saveInt("FISS_HotkeyScale", HotkeyScale)
		fiss.saveInt("FISS_HotkeyScaleScript", HotkeyScript.Size)
		fiss.saveInt("FISS_HorseWidget", HorseWidget)
		fiss.saveBool("FISS_HorseWidgetScript", HorseScript.Visible)
		fiss.saveInt("FISS_HorsePosX", HorsePosX)
		fiss.saveFloat("FISS_HorsePosXScript", HorseScript.X)
		fiss.saveInt("FISS_HorsePosY", HorsePosY)
		fiss.saveFloat("FISS_HorsePosYScript", HorseScript.Y)
		fiss.saveInt("FISS_HorseAlpha", HorseAlpha)
		fiss.saveFloat("FISS_HorseAlphaScript", HorseScript.Alpha)
		fiss.saveInt("FISS_HorseScale", HorseScale)
		fiss.saveInt("FISS_HorseScaleScript", HorseScript.Size)
		fiss.saveInt("FISS_FollowerWidget", FollowerWidget)
		fiss.saveBool("FISS_FollowerWidgetScript", FollowerScript.Visible)
		fiss.saveInt("FISS_FollowerPosX", FollowerPosX)
		fiss.saveFloat("FISS_FollowerPosXScript", FollowerScript.X)
		fiss.saveInt("FISS_FollowerPosY", FollowerPosY)
		fiss.saveFloat("FISS_FollowerPosYScript", FollowerScript.Y)
		fiss.saveInt("FISS_FollowerAlpha", FollowerAlpha)
		fiss.saveFloat("FISS_FollowerAlphaScript", FollowerScript.Alpha)
		fiss.saveInt("FISS_FollowerScale", FollowerScale)
		fiss.saveInt("FISS_FollowerScaleScript", FollowerScript.Size)
		fiss.saveInt("FISS_AttributeWidget", AttributeWidget)
		fiss.saveBool("FISS_AttributeWidgetScript", AttributeScript.Visible)
		fiss.saveInt("FISS_AttributePosX", AttributePosX)
		fiss.saveFloat("FISS_AttributePosXScript", AttributeScript.X)
		fiss.saveInt("FISS_AttributePosY", AttributePosY)
		fiss.saveFloat("FISS_AttributePosYScript", AttributeScript.Y)
		fiss.saveInt("FISS_AttributeAlpha", AttributeAlpha)
		fiss.saveFloat("FISS_AttributeAlphaScript", AttributeScript.Alpha)
		fiss.saveInt("FISS_AttributeScale", AttributeScale)
		fiss.saveInt("FISS_AttributeScaleScript", AttributeScript.Size)		
		fiss.saveInt("FISS_EssentialWidget", EssentialWidget)
		fiss.saveBool("FISS_EssentialWidgetScript", EssentialScript.Visible)
		fiss.saveInt("FISS_EssentialPosX", EssentialPosX)
		fiss.saveFloat("FISS_EssentialPosXScript", EssentialScript.X)
		fiss.saveInt("FISS_EssentialPosY", EssentialPosY)
		fiss.saveFloat("FISS_EssentialPosYScript", EssentialScript.Y)
		fiss.saveInt("FISS_EssentialAlpha", EssentialAlpha)
		fiss.saveFloat("FISS_EssentialAlphaScript", EssentialScript.Alpha)
		fiss.saveInt("FISS_EssentialScale", EssentialScale)
		fiss.saveInt("FISS_EssentialScaleScript", EssentialScript.Size)		
		String saveResult = fiss.endSave()	
		if saveResult == ""
			return "Done!"
		Else
			return saveResult
		EndIf
	Else
		return "FISS not found, save aborted!"
	EndIf
EndFunction
