Scriptname WCT_ConfigurationPower_Script extends activemagiceffect  

; -----

GlobalVariable[] Property WCT_Global Auto
Message[] Property WCT_Message Auto
Int[] Property WCT_Mult Auto
Message Property WCT_ConfigurationPower_Message_DisableConfigurationPower Auto
Spell Property WCT_ConfigurationPower_Spell Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	Bool Skip = false
	Int ValueSetter
	Int i = 0
	While i < WCT_Global.Length
		ValueSetter = WCT_Message[i].Show()
		If i == 14 || i == 15
			WCT_Global[i].SetValue((ValueSetter * (WCT_Mult[i] as Float))/100)
			Debug.Notification("HELP " + (ValueSetter * (WCT_Mult[i] as Float))/100)
		Else
			WCT_Global[i].SetValue(ValueSetter * WCT_Mult[i])
		EndIf
		If ValueSetter == 1
			If i == 0
				; skip dynamic combat
				i = 18
			ElseIf i == 9
				; skip injuries
				i = 16
			ElseIf i == 10
				; skip threshold
				Skip = true
			EndIf
		Else
			If i == 10
				; skip rekt-o-meter
				i = 12
			EndIf
		EndIf
		i += 1
		If Skip && i == 13
			i = 16
		EndIf
	EndWhile

	If WCT_ConfigurationPower_Message_DisableConfigurationPower.Show() == 1
		Game.GetPlayer().RemoveSpell(WCT_ConfigurationPower_Spell)
	EndIf

EndEvent

; -----