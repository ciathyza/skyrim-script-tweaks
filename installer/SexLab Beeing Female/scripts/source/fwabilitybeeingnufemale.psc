Scriptname FWAbilityBeeingNUFemale extends ActiveMagicEffect

FWSystem property System auto
actor ActorRef

bool IsCreature = false

Event OnInit()
	RegisterForSleep()
endEvent

function OnGameLoad()
	UnregisterForSleep()
	RegisterForSleep()
endFunction

Event OnDeath(Actor akKiller)
	FWChildActor ca = akKiller as FWChildActor
	if ca!=none
		ca.AddExp(ActorRef.GetLevel() * 2)
	endif
EndEvent


; Event received when this effect is first started (OnInit may not have been run yet!)
Event OnEffectStart(Actor akTarget, Actor akCaster)
	ActorRef = akTarget
	IsCreature = akTarget.GetRace().HasKeywordString("ActorTypeCreature")
	
	if IsCreature==false
		if system!=none
			if system.cfg.NPCHaveItems
				
				if system.cfg.Difficulty==0
					GiveItems_DifficultyPainless(akTarget)
				elseif system.cfg.Difficulty==1
					GiveItems_DifficultyEasy(akTarget)
				elseif system.cfg.Difficulty==2
					GiveItems_DifficultyNormal(akTarget)
				elseif system.cfg.Difficulty==3
					GiveItems_DifficultyAdvanced(akTarget)
				elseif system.cfg.Difficulty==4
					GiveItems_DifficultyHeavy(akTarget)
				endif
				
			endif
		endif
	endif
EndEvent

function GiveItems_DifficultyPainless(actor akTarget)
	;if Utility.RandomInt(0,5)>=4
		int rnd1=Utility.RandomInt(0,20)
		int rnd2=Utility.RandomInt(0,20)
		int rnd3=Utility.RandomInt(0,50)
		if rnd1>=18
			akTarget.AddItem(system.Tampon_Normal, Utility.RandomInt(3,8), true)
		elseif rnd1>=12
			akTarget.AddItem(system.Tampon_Normal, Utility.RandomInt(2,5), true)
		else
			akTarget.AddItem(system.Tampon_Normal, 2, true)
		endif
		if rnd2>=18
			akTarget.AddItem(system.ContraceptionMid, Utility.RandomInt(1,2), true)
		elseif rnd2>=9
			akTarget.AddItem(system.ContraceptionLow, Utility.RandomInt(1,3), true)
		elseif rnd2>=3
			akTarget.AddItem(system.ContraceptionLow, 1, true)
		endif
		if rnd3>32
			akTarget.AddItem(System.CallChildren2,1,true)
		endif
	;endif
endFunction

function GiveItems_DifficultyEasy(actor akTarget)
	if Utility.RandomInt(0,7)>=4
		int rnd1=Utility.RandomInt(0,20)
		int rnd2=Utility.RandomInt(0,20)
		int rnd3=Utility.RandomInt(0,50)
		if rnd1>=18
			akTarget.AddItem(system.Tampon_Normal, Utility.RandomInt(3,8), true)
		elseif rnd1>=14
			akTarget.AddItem(system.Tampon_Normal, Utility.RandomInt(2,6), true)
		elseif rnd1>=9
			akTarget.AddItem(system.Tampon_Normal, Utility.RandomInt(1,4), true)
		elseif rnd1>=6
			akTarget.AddItem(system.Tampon_Normal, Utility.RandomInt(1,2), true)
		else
			akTarget.AddItem(system.Tampon_Normal, 1, true)
		endif
		if rnd2>=18
			akTarget.AddItem(system.ContraceptionMid, Utility.RandomInt(1,2), true)
		elseif rnd2>=12
			akTarget.AddItem(system.ContraceptionLow, Utility.RandomInt(1,3), true)
		elseif rnd2>=8
			akTarget.AddItem(system.ContraceptionLow, 1, true)
		endif
		if rnd3>39
			akTarget.AddItem(System.CallChildren2,1,true)
		endif
	endif
endFunction

function GiveItems_DifficultyNormal(actor akTarget)
	if Utility.RandomInt(0,5)>=4
		int rnd1=Utility.RandomInt(0,20)
		int rnd2=Utility.RandomInt(0,20)
		int rnd3=Utility.RandomInt(0,50)
		if rnd1>=18
			akTarget.AddItem(system.Tampon_Normal, Utility.RandomInt(2,4), true)
		elseif rnd1>=12
			akTarget.AddItem(system.Tampon_Normal, Utility.RandomInt(1,2), true)
		else
			akTarget.AddItem(system.Tampon_Normal, 1, true)
		endif
		if rnd2>=19
			akTarget.AddItem(system.ContraceptionMid, Utility.RandomInt(1,2), true)
		elseif rnd2>=14
			akTarget.AddItem(system.ContraceptionLow, Utility.RandomInt(1,3), true)
		elseif rnd2>=8
			akTarget.AddItem(system.ContraceptionLow, 1, true)
		endif
		if rnd3>45
			akTarget.AddItem(System.CallChildren2,1,true)
		endif
	endif
endFunction

function GiveItems_DifficultyAdvanced(actor akTarget)
	if Utility.RandomInt(0,9)>=8
		int rnd1=Utility.RandomInt(0,30)
		int rnd2=Utility.RandomInt(0,30)
		int rnd3=Utility.RandomInt(0,50)
		if rnd1>=27
			akTarget.AddItem(system.Tampon_Normal, Utility.RandomInt(2,4), true)
		elseif rnd1>=21
			akTarget.AddItem(system.Tampon_Normal, Utility.RandomInt(1,2), true)
		else
			akTarget.AddItem(system.Tampon_Normal, 1, true)
		endif
		if rnd2>=28
			akTarget.AddItem(system.ContraceptionMid, Utility.RandomInt(1,2), true)
		elseif rnd2>=23
			akTarget.AddItem(system.ContraceptionLow, Utility.RandomInt(1,3), true)
		elseif rnd2>=12
			akTarget.AddItem(system.ContraceptionLow, 1, true)
		endif
		if rnd3>48
			akTarget.AddItem(System.CallChildren2,1,true)
		endif
	endif
endFunction

function GiveItems_DifficultyHeavy(actor akTarget)
	; On Heavy, no items will be added
endFunction



float lastTimeGaveExp=0.0
Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
	FWChildActor ca = akAggressor as FWChildActor
	if ca!=none
		float t = Utility.GetCurrentRealTime()
		if t>lastTimeGaveExp+1
			if abPowerAttack || abSneakAttack || abBashAttack && abHitBlocked==false
				ca.AddExp(ActorRef.GetLevel() / 5)
				lastTimeGaveExp = t
			elseif abHitBlocked == true
				ca.AddExp(ActorRef.GetLevel() / 25)
				lastTimeGaveExp = t
			else
				ca.AddExp(ActorRef.GetLevel() / 15)
				lastTimeGaveExp = t
			endif
		endif
	endif
EndEvent