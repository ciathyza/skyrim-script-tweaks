Scriptname FWContraceptionItem extends FWSpell 

;FWSystem property System auto

Imagespacemodifier property iModContraception0 auto
Imagespacemodifier property iModContraception1 auto
Imagespacemodifier property iModContraception2 auto
Imagespacemodifier property iModContraception3 auto
Imagespacemodifier property iModContraception4 auto
Imagespacemodifier property iModContraception5 auto
Imagespacemodifier property iModContraception6 auto
Imagespacemodifier property iModContraception7 auto
Imagespacemodifier property iModContraception8 auto
Imagespacemodifier property iModContraception9 auto

actor ActorRef
bool bInit=false

function execute()

	if bInit==false || ActorRef==none
		return
	endif
	float mag = GetMagnitude()
	if mag <2
		mag=2
	endif
	if ActorRef==Game.GetPlayer() && mag >2
		float f=1.0 - (FWUtility.floatModulo(mag,10.0)/30)
		if mag<10
			iModContraception0.apply(f)
		elseif mag<20
			iModContraception1.apply(f)
		elseif mag<30
			iModContraception2.apply(f)
		elseif mag<40
			iModContraception3.apply(f)
		elseif mag<50
			iModContraception4.apply(f)
		elseif mag<60
			iModContraception5.apply(f)
		elseif mag<70
			iModContraception6.apply(f)
		elseif mag<80
			iModContraception7.apply(f)
		elseif mag<90
			iModContraception8.apply(f)
		else
			iModContraception9.apply(f)
		endif
	endif
	System.Controller.AddContraception(ActorRef, mag)
	System.Controller.DamageBaby(ActorRef, mag)
endfunction

Event OnWoman(Actor akTarget, Actor akCaster)
	ActorRef = akCaster
	execute()
endEvent

Event OnInit()
	bInit=true
	parent.OnInit()
	execute()
endEvent