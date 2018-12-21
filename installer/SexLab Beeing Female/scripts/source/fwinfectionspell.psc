Scriptname FWInfectionSpell extends FWSpell  

;FWSystem property System auto
Potion[] property HealDrink auto
float CurDamage = 1.0
actor ActorRef

Event OnWoman(Actor akTarget, Actor akCaster)
	ActorRef=akTarget
	RegisterForSingleUpdateGameTime(1)
endEvent

Event OnMan(Actor akTarget, Actor akCaster)
	Dispel()
endEvent

Event OnUpdateGameTime()
	;doDamage(actor A, float Percentage, bool Silent = false, bool DoBleedOut = true, ImageSpaceModifier Effect = none)
	System.doDamage(ActorRef, CurDamage * System.getDamageScale(5,ActorRef), 13)
	if CurDamage < 15
		CurDamage+=1.0
	elseif CurDamage>=15 && CurDamage < 35
		CurDamage+=1.2
	elseif CurDamage>=35 && CurDamage < 50
		CurDamage+=1.8
	elseif CurDamage>=50
		CurDamage+=2.5
	else
		CurDamage+=1.0
	endif
	RegisterForSingleUpdateGameTime(1)
endEvent

Event OnSpellCast(Form akSpell)
	int i=HealDrink.length
	while i>0
		i-=1
		if akSpell==HealDrink[i]
			Dispel()
		endif
	endWhile
endEvent