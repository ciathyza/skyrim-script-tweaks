Scriptname DefeatQTEMeter extends SKI_WidgetBase

DefeatMCMscr Property McmConfig Auto

float	_width
float	_height
int		_primaryColor
;int		_flashColor
string 	_fillDirection
float	_percent

; @override SKI_WidgetBase
Event OnWidgetReset()
	parent.OnWidgetReset()
	Percent 		= 0.0
	PrimaryColor 	= McmConfig.QTEColorBar ; 0xFFFFFF 
;	FlashColor		= -1
	Width 			= McmConfig.MeterWidth ; 250.0
	Height 			= McmConfig.MeterHeight ; 50.0
	HAnchor			= "center"
	VAnchor			= "center"
	X				= McmConfig.AxisX ; 640.0
	Y				= McmConfig.AxisY ; 650.0
	FillDirection 	= "Right"
	UI.Invoke(HUD_MENU, WidgetRoot + ".initCommit")
EndEvent
; @overrides SKI_WidgetBase
String Function GetWidgetSource()
	Return "Skyui/meter.swf"
EndFunction
; @overrides SKI_WidgetBase
String Function GetWidgetType()
	; Must be the same as scriptname
	Return "DefeatQTEMeter"
EndFunction
Float Property Width
	{Width of the meter in pixels at a resolution of 1280x720. Default: 292.8}
	Float Function get()
		Return _width
	EndFunction

	Function set(Float a_val)
		_width = a_val
		If (Ready)
			UI.InvokeFloat(HUD_MENU, WidgetRoot + ".setWidth", _width)
		Endif
	EndFunction
EndProperty
Float Property Height
	{Height of the meter in pixels at a resolution of 1280x720. Default: 25.2}
	Float Function get()
		Return _height
	EndFunction

	Function set(Float a_val)
		_height = a_val
		If (Ready)
			UI.InvokeFloat(HUD_MENU, WidgetRoot + ".setHeight", _height)
		Endif
	EndFunction
EndProperty
int Property PrimaryColor
	{Primary color of the meter gradient RRGGBB [0x000000, 0xFFFFFF]. Default: 0xFF0000. Convert to decimal when editing this in the CK}
	int Function get()
		Return _primaryColor
	EndFunction

	Function set(int a_val)
		_primaryColor = a_val
		If (Ready)
			UI.InvokeInt(HUD_MENU, WidgetRoot + ".setColor", _primaryColor)
		Endif
	EndFunction
EndProperty
;int Property FlashColor
;	{Color of the meter warning flash, -1 = automatic. RRGGBB [0x000000, 0xFFFFFF]. Default: -1. Convert to decimal when editing this in the CK}
;	int Function get()
;		Return _flashColor
;	EndFunction
;
;	Function set(int a_val)
;		_flashColor = a_val
;		If (Ready)
;			UI.InvokeInt(HUD_MENU, WidgetRoot + ".setFlashColor", _flashColor)
;		Endif
;	EndFunction
;EndProperty
string Property FillDirection
	{The position at which the meter fills from, ["left", "center", "right"] . Default: center}
	string Function get()
		Return _fillDirection
	EndFunction

	Function set(String a_val)
		_fillDirection = a_val
		If (Ready)
			UI.InvokeString(HUD_MENU, WidgetRoot + ".setFillDirection", _fillDirection)
		Endif
	EndFunction
EndProperty
float Property Percent
	{Percent of the meter [0.0, 1.0]. Default: 0.0}
	float Function get()
		Return _percent
	EndFunction

	Function set(Float a_val)
		_percent = a_val
		If (Ready)
			UI.InvokeFloat(HUD_MENU, WidgetRoot + ".setPercent", _percent)
		Endif
	EndFunction
EndProperty