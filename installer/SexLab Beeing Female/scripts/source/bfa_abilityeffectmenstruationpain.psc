Scriptname BFA_AbilityEffectMenstruationPain extends activemagiceffect  

FWSystem property System Auto

float DamageScale
float BaseDamageScale
Actor PlayerRef

Event OnEffectStart(Actor target, Actor caster)
	PlayerRef = target
	
	If PlayerRef
		RegisterForSingleUpdateGameTime(2.6)
		BaseDamageScale = Utility.RandomFloat(0.1, 2.5) ; How hard the Pains are this time
		if PlayerRef==Game.GetPlayer()
			BaseDamageScale=System.Player.stateDamageScale
		endif
	Else
		Dispel()
	EndIf
endEvent

Event  OnUpdateGameTime()
	If PlayerRef
		if System.cfg.MenstrualCramps > Utility.RandomFloat(0, 99)
			DamageScale = Utility.RandomFloat(0.1, 1.5) * BaseDamageScale
			if DamageScale<0.1
				DamageScale = 0.1 ; At least 10% Damage
			endIf
		
			int c = Utility.RandomInt(0, 10)
			if c >= 9 ; Damage with sound
				;System.DoDamage(PlayerRef, 6 * DamageScale) ; screem damage
				System.doDamage(PlayerRef, 6, 3)
				System.PlayPainSound(PlayerRef)
			elseif c >= 6
				;System.DoDamage(PlayerRef, 4 * DamageScale, true) ; Silent Damage
				System.doDamage(PlayerRef, 4, 3)
			endif
		endIf
		RegisterForSingleUpdateGameTime(2.6)
	Else
		Dispel()
	EndIf
endEvent
