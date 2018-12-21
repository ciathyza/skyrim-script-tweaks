Scriptname FWBabyHealth extends FWSpell

bool property StartCombat = false auto
bool property DamageBaby = false auto

Event OnWoman(Actor akTarget, Actor akCaster)
	if akTarget==none
		return
	endif
	float mag = GetMagnitude()
	
	if DamageBaby==true
		if mag>0
			System.Controller.DamageBaby(akTarget, mag)
			; Start combat
			if akTarget!=akCaster && akCaster!=none && StartCombat==true
				akTarget.StartCombat(akCaster)
			endif
		elseif mag<0
			System.Controller.HealBaby(akTarget, mag * -1)
		endif
	else
		if mag<0
			System.Controller.DamageBaby(akTarget, mag * -1)
			; Start combat
			if akTarget!=akCaster && akCaster!=none && StartCombat==true
				akTarget.StartCombat(akCaster)
			endif
		elseif mag>0
			System.Controller.HealBaby(akTarget, mag)
		endif
	endif
endEvent