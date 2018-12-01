Scriptname aaaEssentialPlayerScript extends ReferenceAlias 

; -------------------------------------------------------------------------------------------------
; Properties
; -------------------------------------------------------------------------------------------------

aaaEssentialPlayerQuestScript property essentialQuest auto
Armor property ClothesPrisonerTunic auto
Armor property UnPlayableColthesPrisonerTunic auto
FormList property injuryPowers auto
Idle property bleedoutstart auto
Idle property bleedoutstop auto
Idle property idlestoploose auto
ImpactDataSet property bleedImpact auto
MiscObject property Gold001 auto
Quest property warewolfquest auto
Race property VampireLordRace auto
Race property WerewolfBeastRace auto
Spell property aaaGhost auto
Spell property configSpell auto


; -------------------------------------------------------------------------------------------------
; Variables
; -------------------------------------------------------------------------------------------------

Actor deadplayer
bool bleedingOut = false
bool updated = false
float injuryrecovertime = 0.0
float originalHealth = -1.0
int count = 0
int ghostthreshold = 1
int injuries = 0
int previousCameraState = 0


; -------------------------------------------------------------------------------------------------
; Events
; -------------------------------------------------------------------------------------------------

Event OnInit()
	RegisterForSingleUpdate(1)
EndEvent


Event OnPlayerLoadGame()
	RegisterForSingleUpdate(1)
EndEvent


Event OnUpdate()
	if (!GetActorReference().hasSpell(configSpell) && !essentialQuest.disableConfigSpell)
		GetActorReference().addSpell(configSpell, false)
	endif
	GetActorReference().StartDeferredKill()
	if (essentialQuest.mode != essentialQuest.ESSENTIALMODE)
		ghostthreshold = 1
	elseif (essentialQuest.mode == essentialQuest.ESSENTIALMODE)
		ghostthreshold = -1
	endif
	if (essentialQuest.mode == essentialQuest.HARDCOREMODE)
		essentialQuest.mode = essentialQuest.NORMALMODE
	endif
	if (!updated)
		GetActorReference().SetNoBleedoutRecovery(false)	
		updated = true
	endif
	updateLogic()
	if (GetActorReference().getActorValue("Health") <= 0 && !getActorReference().isGhost() && !GetActorReference().isInKillMove())
		applyDyingLogic()
	endif
EndEvent


Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
	if (getActorReference().isGhost())
		return
	endif
	if (getActorReference().isInKillMove())
		return
	endif
	if (GetActorReference().getActorValue("Health") <= 0)
		applyDyingLogic()
	endif
EndEvent


; -------------------------------------------------------------------------------------------------
; Functions
; -------------------------------------------------------------------------------------------------

Function applyDyingLogic()
	GotoState("HandleBleedOut")
	GetActorReference().setGhost(true)
	if (essentialQuest.losemoney > 0)
		int totalgold = GetActorReference().getItemCount(Gold001)
		if (totalgold > 0)
			int goldtoremove = totalgold / (100 / essentialQuest.losemoney)
			GetActorReference().removeItem(Gold001, goldtoremove)
		endif
	endif

	injuries = injuries + 1
	injuryrecovertime = Utility.getCurrentRealTime()
	GetActorReference().StopCombatAlarm()
	If (isGhostMode())
		setHealthAfterBleedOut(true)
		makeGhost()
	else
		bleedingOut = true
		Game.DisablePlayerControls()
		if (isFirstPerson())
			GetActorReference().SetUnconscious(true);
			previousCameraState = Game.GetCameraState()
			if (isSafeCamera(previousCameraState) && previousCameraState != 0 && !isMorphed())
				Game.ForceFirstPerson()
				Game.ShakeCamera(none, 0.5, 5)
			endif	
		else
			previousCameraState = Game.GetCameraState()
			if (isSafeCamera(previousCameraState) && previousCameraState != 8 && previousCameraState != 9)
				Game.ForceThirdPerson()
			endif
			GetActorReference().PlayIdle(bleedoutstart)
		endif
	endif
	RegisterForSingleUpdate(0.1)
endFunction


Function recoverBleedOut()
	setHealthAfterBleedOut(false)
	int camerastate = Game.GetCameraState()
	if (isFirstPerson())
		if (isSafeCamera(camerastate) && (previousCameraState == 8 || previousCameraState == 9))
			Game.ForceThirdPerson()
		endif
	else
		GetActorReference().PlayIdle(bleedoutstop)
		Utility.wait(2) ; Ensure animation has time to recover player
		if (isSafeCamera(camerastate) && previousCameraState == 0)
			Game.ForceFirstPerson()
		endif
		Form leftHand = GetActorReference().GetEquippedObject(0)
		Form rightHand = GetActorReference().GetEquippedObject(1)
		if (leftHand as Spell != none)
			GetActorReference().UnequipSpell((leftHand as Spell), 0)
			GetActorReference().EquipSpell((leftHand as Spell), 0)
		elseif (leftHand != none)
			GetActorReference().UnequipItemEx(leftHand, 2)
			GetActorReference().EquipItemEx(leftHand, 2)
		endif
		if (rightHand as Spell != none)
			GetActorReference().UnequipSpell((rightHand as Spell), 1)
			GetActorReference().EquipSpell((rightHand as Spell), 1)
		elseif (rightHand != none)
			GetActorReference().UnequipItemEx(rightHand, 1)
			GetActorReference().EquipItemEx(rightHand, 1)
		endif
	endif

	GetActorReference().setGhost(false)
	Game.EnablePlayerControls()
	GetActorReference().SetUnconscious(false)
	addInjury()
	setHealthAfterBleedOut(false) ; double check incase an injury kills the player again
	GotoState("")
	GetActorReference().PlayIdle(idlestoploose)
endfunction


Function updateLogic()
	if (injuries > 0)
		if (Utility.getCurrentRealTime() - injuryrecovertime >= 30)
			; Disable going into ghost mode
			injuries = 0
		endif
	endif
	RegisterForSingleUpdate(1)
EndFunction


function makeGhost()
	injuries = 0
	GetActorReference().StopCombatAlarm()
	GetActorReference().setGhost(false)
	GetActorReference().DoCombatSpellApply(aaaGhost,GetActorReference())

	if (deadplayer != none && deadplayer.isEnabled())
		if (essentialQuest.ishardcore != essentialQuest.HARDCOREGHOST)
			deadplayer.removeAllItems(GetActorReference(), true, false)
		endif
		deadplayer.disableNoWait(true)
		deadplayer.delete()
	endif
	
	int i = 0
	Actor tmpdeadplayer = GetActorReference().PlaceAtMe(GetActorReference().getActorBase(), 1, true, false) as Actor
	tmpdeadplayer.removeAllItems()
	
	if (essentialQuest.ishardcore != essentialQuest.EASYGHOST)
		GetActorReference().unequipAll()
	endif
	
	if (essentialQuest.ishardcore == essentialQuest.HARDCOREGHOST)
		GetActorReference().removeAllItems()
	elseif (essentialQuest.ishardcore == essentialQuest.NORMALGHOST)
		GetActorReference().removeAllItems(tmpdeadplayer, true, false)
	endif
	
	tmpdeadplayer.enableNoWait(true)
	tmpdeadplayer.kill()
	deadplayer = tmpdeadplayer
	
	if (essentialQuest.ishardcore == essentialQuest.HARDCOREGHOST)
		GetActorReference().addItem(ClothesPrisonerTunic, 1, true)
		GetActorReference().equipItem(ClothesPrisonerTunic, false, true)
	endif
	
	GoToState("")
	GetActorReference().PlayIdle(idlestoploose)
endfunction


function addInjury()
	if (essentialQuest.mode == essentialQuest.ESSENTIALMODE)
		injuries = 0
	endif
	if (essentialQuest.disableinjuries == 0)
		int chosen = Utility.RandomInt(0, injuryPowers.getSize() - 1)
		Spell injury = injuryPowers.getAt(chosen) as Spell
		GetActorReference().DoCombatSpellApply(injury,GetActorReference())
	endif
endfunction


; Check camera is not doing some weird unknown camera where forcing the camera mode can break things
bool function isSafeCamera(int cameramode)
	return cameramode == 0 || cameramode == 8 || cameramode == 9
endfunction


bool function isGhostMode()
	return (essentialQuest.mode == essentialQuest.GHOSTMODE || (ghostthreshold != -1 && injuries > ghostthreshold))
endfunction


bool function isFirstPerson()
	return (essentialQuest.essentialtype == essentialQuest.FIRSTPERSON || isMorphed()) 
endfunction


bool function isMorphed()
	Race playerRace = GetActorReference().getRace()
	return playerRace == WerewolfBeastRace || playerRace == VampireLordRace 
endfunction


function setHealthAfterBleedOut(bool maxhealth)
	GetActorReference().damageav("Health", 1)
	float health = GetActorReference().getActorValue("Health")
	if (maxhealth)
		GetActorReference().restoreav("Health",GetActorReference().getBaseActorValue("Health"))
	else
		int toheal = (GetActorReference().getBaseActorValue("Health") / (100 / essentialQuest.healthToHeal)) as int
		if (health < 0)
			GetActorReference().restoreav("Health", (health * -1) + toheal)
		elseif (health > toheal)
			GetActorReference().damageav("Health", health - toheal)
			GetActorReference().restoreav("Health",1)
		else
			GetActorReference().restoreav("Health", (toheal - health) + 1)
		endif
	endif
	bleedingOut = false
	count = 0
EndFunction


; -------------------------------------------------------------------------------------------------
; States
; -------------------------------------------------------------------------------------------------

State HandlingKillMove
	Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
		;Do Nothing
	EndEvent
EndState


State HandleBleedOut
	Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
		;Do Nothing
	EndEvent

	Function updateLogic()
		if (bleedingOut)
			; First death does not auto heal wait 5 seconds then heal player
			count = count + 1
			if (count >= 50)
				recoverBleedOut()
			elseif (isFirstPerson())
				GetActorReference().PlayImpactEffect(bleedImpact);
			endif
		endif
		RegisterForSingleUpdate(0.1)
	EndFunction
	
	Function applyDyingLogic()
		; do nothing
	endFunction
EndState
