Scriptname DefeatComeOverHereScr extends ActiveMagicEffect  

; Resources =============================
DefeatConfig Property RessConfig Auto
ReferenceAlias Property ComeOverHereAlias Auto
;========================================

Event OnEffectStart(Actor Target, Actor Caster)
	If !ComeOverHereAlias.GetReference() && (Target.GetDistance(Caster) < 1000.0)
		ComeOverHereAlias.ForceRefTo(Target)
		Game.ForceThirdPerson()
		Debug.SendAnimationEvent(Caster, "IdleComeThisWay")
		Int i
		While ComeOverHereAlias.GetReference() && (i < 20)
			Utility.Wait(1.0)
			i += 1
		EndWhile
		ComeOverHereAlias.Clear()
		Dispel()
	Endif
EndEvent