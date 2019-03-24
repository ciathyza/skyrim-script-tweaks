; Immersive Horses by sevencardz.
ScriptName HorseAbilitiesEffectScript extends ActiveMagicEffect
{Effect attached to HorseRace which gives all horses special abilities.}
import Game
import Utility
import Debug
import IHOUtil

Quest Property IHOConfigMenuQuest Auto ; Main quest for Immersive Horses.
IHOConfigMenuScript MCM = None ; Main quest script for Immersive Horses.
Actor horseRef = None ; Horse this script is attached to.
bool playerIsRiding = false ; True if the player is riding the horse.

; Initializes the horse's various special abilities.
Event OnEffectStart(Actor akTarget, Actor akCaster)
	MCM = IHOConfigMenuQuest as IHOConfigMenuScript
	horseRef = akTarget ; Store the reference to this horse.
	horseRef.BlockActivation() ; Take control of horse activation.
	horseRef.SetNotShowOnStealthMeter(true) ; The horse will not spot the player sneaking.
	horseRef.AddInventoryEventFilter(MCM.FoodCarrot) ; Allow the horse to eat carrots.
	; Attempt to initialize the horse's breed from the INI file.
	String breedName = GetINIHorseBreedName(horseRef)
	if breedName != ""
		InitHorseBreedFromINI(horseRef, breedName)
	endIf
	; Fix blank display name bug from preventing activation by the player.
	if horseRef.GetDisplayName() == ""
		horseRef.SetDisplayName("???", force = true)
	endIf
	; Unequip any armors that should not be worn by a horse if the horse is persistent.
	if MCM.IsPersistent(horseRef)
		UnequipNonHorseArmors(horseRef)
	endIf
	; Increase the horse's carry weight if a saddle is equipped.
	if GetWornSaddle(horseRef) != None
		horseRef.AddSpell(MCM.HorseSaddleFortifyCarryAbility)
	endIf
	MCM.PersistHorseActorValues(horseRef)
EndEvent

; Deletes the horse when it unloads if it was claimed but has since been abandoned.
Event OnEffectFinish(Actor akTarget, Actor akCaster)
	if !horseRef.IsInFaction(MCM.PlayerHorseFaction) &&\
		horseRef.HasKeywordString("DeleteOnUnload")
		horseRef.Delete()
	endIf
EndEvent

; Claims or steals the horse for the player if not done already.
Function ClaimOrSteal(bool playerIsMounting = false)
	if horseRef.GetFactionOwner() == None && horseRef.GetActorOwner() == None ; Unclaimed
		MCM.ClaimHorse(horseRef)
	elseIf horseRef.IsInFaction(MCM.IHOClaimedHorseFaction)	; Reclaimed
		if playerIsMounting && horseRef.GetActorOwner() != MCM.PlayerRef.GetActorBase()
			horseRef.SetActorOwner(MCM.PlayerRef.GetActorBase())
			MCM.DisplayHorseMessage(horseRef, "$IHO_HorsePlayerOwner")
		endIf
	elseIf horseRef.IsInFaction(MCM.PlayerHorseFaction) ; Purchased or Adopted
		MCM.ClaimHorse(horseRef)
	else ; Stolen
		EnableFastTravel(false)
		MCM.DisplayHorseMessage(horseRef, "$IHO_HorseStolen")
	endIf
EndFunction

; Handles ride or dismount activation for the player.  Claims the horse for the player if necessary.
Function PlayerRideOrDismount()
	if horseRef.IsBeingRidden()
		if MCM.PlayerRef.Dismount()
			OnDismount()
		endIf
	else ; Attempt to mount.
		ClaimOrSteal(playerIsMounting = true)
		horseRef.Activate(MCM.PlayerRef, true)
		int i = 0
		int LCV = 24 ; Loop limit of 24 * 0.25s ~ 6s
		while i < LCV
			if horseRef.IsBeingRidden()
				OnMount()
				return
			else
				Wait(0.25)
			endIf
			i += 1
		endWhile
	endIf
EndFunction

; Finalizes the horse being mounted by the player.  Assumes the horse is being ridden.
Event OnMount()
	playerIsRiding = true
	MCM.ApplyLastRiddenHorse(horseRef, playerIsRiding)
	RegisterForKey(MCM.TrotOrCanterKeyCode)
	RegisterForKey(MCM.TalkKeyCode)
	RegisterForKey(MCM.HorseAttack2KeyCode)
	RegisterForKey(MCM.HorsePivotLeftKeyCode)
	RegisterForKey(MCM.HorsePivotRightKeyCode)
	RegisterForKey(MCM.NormalDismountKeyCode)
	RegisterForKey(MCM.FastRearDismountKeyCode)
	RegisterForKey(MCM.FastLeftDismountKeyCode)
	RegisterForKey(MCM.FastRightDismountKeyCode)
	if IsTrue(MCM.IHOMountedSpellCasting)
		RegisterForControl("Left Attack/Block")
		RegisterForControl("Right Attack/Block")
		RegisterForControl("Shout")
	endIf
	if !IsTrue(MCM.IHODisableKickEffect)
		RegisterForAnimationEvent(horseRef, "JumpBegin") ; Horse begins to jump or fall.
		RegisterForAnimationEvent(horseRef, "LandEnd") ; Horse lands from a jump or fall.
	endIf
	if !IsTrue(MCM.IHODisableTrampleEffect)
		RegisterForAnimationEvent(horseRef, "HorseSprint") ; Horse starts sprinting.
		RegisterForAnimationEvent(horseRef, "HorseLocomotion") ; Horse stops sprinting.
	endIf
EndEvent

; Finalizes the horse being dismounted by the player.  Assumes the horse is NOT being ridden.
Event OnDismount()
	playerIsRiding = false
	MCM.ApplyLastRiddenHorse(horseRef, playerIsRiding)
	UnregisterForAllKeys()
	UnregisterForAllControls()
	UnregisterForAnimationEvent(horseRef, "JumpBegin") ; Horse begins to jump or fall.
	UnregisterForAnimationEvent(horseRef, "LandEnd") ; Horse lands from a jump or fall.
	UnregisterForAnimationEvent(horseRef, "HorseSprint") ; Horse starts sprinting.
	UnregisterForAnimationEvent(horseRef, "HorseLocomotion") ; Horse stops sprinting.
	EnableFastTravel(true)
	; No need to adjust speed, ownership, or follow/wait if the horse is dead.
	if horseRef.IsDead()
		return
	endIf
	; Restore the horse to normal speed when dismounted if not harnessed.
	if !horseRef.IsEquipped(MCM.HorseHarness)
		RestoreSpeedMult(horseRef)
	endIf
	; Claim the horse if it was stolen and then dismounted in a new location.
	if !horseRef.IsInFaction(MCM.IHOClaimedHorseFaction) && !IsTrue(MCM.IHOPermaStolenHorses)
		if horseRef.GetCurrentLocation() != horseRef.GetEditorLocation()
			MCM.ClaimHorse(horseRef)
		endIf
	endIf
	; The horse is set to wait once dismounted if claimed by the player.
	if IsTrue(MCM.IHOHorsesWaitOnDismount) && horseRef.IsInFaction(MCM.IHOClaimedHorseFaction)
		MCM.CommandHerd(MCM.OptionHerdWait)
	endIf
EndEvent

; Executes the mounted horse's kick and trample abilities during the appropriate animation events.
Event OnAnimationEvent(ObjectReference akSource, String asEventName)
	if asEventName == "JumpBegin" || asEventName == "LandEnd"
		MCM.HorseJumpKickAbility.RemoteCast(horseRef, MCM.PlayerRef)
		horseRef.DamageActorValue("Stamina", 10) ; Jumping costs the horse stamina.
	endIf
	if asEventName == "HorseSprint"
		horseRef.AddSpell(MCM.HorseTrampleCloakAbility)
		RestoreSpeedMult(horseRef) ; Prevent slow galloping.
	elseIf asEventName == "HorseLocomotion"
		horseRef.RemoveSpell(MCM.HorseTrampleCloakAbility)
	endIf
EndEvent

; Allows the player to access specialized horse options.
Event OnActivate(ObjectReference akActionRef)
	; The horse is off-limits, so check for self-activation and then quit.
	if horseRef.GetActorValue("WaitingForPlayer") == -1
		; Self-activation allows a separate mod to control when the horse is available.
		if akActionRef == horseRef
			MCM.AbandonHorse(horseRef)
		endIf
		return
	endIf
	; Quit if the horse was not activated by the player or if it has a harness on.
	if akActionRef != MCM.PlayerRef || horseRef.IsEquipped(MCM.HorseHarness)
		return
	endIf
	; Trigger a dismount if the player somehow mounted the horse outside of this script.
	if !playerIsRiding && MCM.PlayerRef.IsOnMount() && horseRef.IsBeingRidden()
		MCM.PlayerRef.Dismount()
		return
	endIf
	; Finalize the last dismount if it did not get triggered normally (horse ragdolled or died).
	if playerIsRiding && (!MCM.PlayerRef.IsOnMount() || MCM.PlayerHorseRef != horseRef)
		OnDismount()
	endIf
	int choice = MCM.GetPlayerActivationChoice(horseRef, playerIsRiding)
	if choice == MCM.OptionRide
		PlayerRideOrDismount()
	elseIf choice == MCM.OptionTalk
		MCM.MountedTalkOrSearch()
	elseIf choice == MCM.OptionFollow
		ClaimOrSteal(playerIsMounting = false)
		MCM.FollowOrWait(horseRef)
	elseIf choice == MCM.OptionInventory
		ClaimOrSteal(playerIsMounting = false)
		MCM.HorseInventory(horseRef)
	elseIf choice == MCM.OptionStats
		IHOStats.ShowHorseStats(horseRef, MCM.IsPersistent(horseRef))
	elseIf choice == MCM.OptionDismiss
		MCM.DismissHorse(horseRef)
	elseIf choice == MCM.OptionManage
		MCM.UpdateHorseListMenu()
		MCM.ShowHorseListMenu()
	elseIf choice == MCM.OptionAdopt
		MCM.AdoptHorse(horseRef)
	endIf
EndEvent

; Allows the player to give the horse a carrot to restore its stamina.
Event OnItemAdded(Form akBaseItem, int aiItemCount, ObjectReference akItemReference,\
ObjectReference akSourceContainer)
	; Filter only for items given by the player to the horse.
	if akSourceContainer == MCM.PlayerRef
		if akBaseItem == MCM.FoodCarrot && horseRef.GetActorValuePercentage("Stamina") < 0.9
			horseRef.EquipItem(akBaseItem) ; Nom nom nom nom.
			horseRef.RestoreActorValue("Stamina", 1000)
		endIf
	endIf
EndEvent

; Applies changes to the horse when certain objects are equipped.
Event OnObjectEquipped(Form akBaseObject, ObjectReference akReference)
	; Slow the horse to a trot when harnessed.
	if akBaseObject == MCM.HorseHarness
		horseRef.SetActorValue("SpeedMult", MCM.TrotSpeedMult)
		horseRef.ModActorValue("CarryWeight", -0.001) ; Apply speed changes.
	; Unequip the armor item if it is not meant to be worn by a horse and the horse is persistent.
	elseIf !IsHorseArmorItem(akBaseObject) && MCM.IsPersistent(horseRef)
		horseRef.UnequipItem(akBaseObject)
	; Fortify the horse's carry weight when saddled.
	elseIf IsSaddle(akBaseObject)
		horseRef.AddSpell(MCM.HorseSaddleFortifyCarryAbility)
	endIf
EndEvent

; Applies changes to the horse when certain objects are unequipped.
Event OnObjectUnequipped(Form akBaseObject, ObjectReference akReference)
	; Restore the horse to normal speed when not harnessed.
	if akBaseObject == MCM.HorseHarness
		RestoreSpeedMult(horseRef)
	; Remove the horse's fortified carry weight when unsaddled.
	elseIf IsSaddle(akBaseObject)
		horseRef.RemoveSpell(MCM.HorseSaddleFortifyCarryAbility)
	endIf
EndEvent

; Handles execution of mounted hotkeys.
Event OnKeyDown(int keyCode)
	; Do nothing if the key is unmapped or if a menu is open or if text input is enabled.
	if keyCode == -1 || IsInMenuMode() || UI.IsTextInputEnabled()
		return
	endIf
	; Finalize the last dismount if it did not get triggered properly (horse ragdolled or died).
	if playerIsRiding && (!MCM.PlayerRef.IsOnMount() || MCM.PlayerHorseRef != horseRef)
		OnDismount()
		return
	endIf
	if keyCode == MCM.TrotOrCanterKeyCode
		if horseRef.GetActorValue("SpeedMult") == MCM.TrotSpeedMult
			RestoreSpeedMult(horseRef)
			horseRef.ModActorValue("CarryWeight", 0.001) ; Apply speed changes.
		else
			horseRef.SetActorValue("SpeedMult", MCM.TrotSpeedMult)
			horseRef.ModActorValue("CarryWeight", -0.001) ; Apply speed changes.
		endIf
	elseIf keyCode == MCM.TalkKeyCode
		MCM.MountedTalkOrSearch()
	elseIf keyCode == MCM.HorseAttack2KeyCode
		SendAnimationEvent(horseRef, "cannedTurnStop")
		SendAnimationEvent(horseRef, "attackStart_Attack2") ; Horse does a head bash attack.
	elseIf keyCode == MCM.HorsePivotLeftKeyCode
		SendAnimationEvent(horseRef, "cannedTurnStop")
		SendAnimationEvent(horseRef, "cannedTurnLeft180")
	elseIf keyCode == MCM.HorsePivotRightKeyCode
		SendAnimationEvent(horseRef, "cannedTurnStop")
		SendAnimationEvent(horseRef, "cannedTurnRight180")
	elseIf keyCode == MCM.NormalDismountKeyCode
		PlayerRideOrDismount()
	elseIf keyCode == MCM.FastRearDismountKeyCode
		HandleFastDismount(0)
	elseIf keyCode == MCM.FastLeftDismountKeyCode
		HandleFastDismount(1)
	elseIf keyCode == MCM.FastRightDismountKeyCode
		HandleFastDismount(-1)
	endIf
EndEvent

; Inititates casting of concentration spells while mounted.
Event OnControlDown(String control)
	; Do nothing if a menu is open or if text input is enabled.
	if IsInMenuMode() || UI.IsTextInputEnabled()
		return
	endIf
	; Finalize the last dismount if it did not get triggered properly (horse ragdolled or died).
	if playerIsRiding && (!MCM.PlayerRef.IsOnMount() || MCM.PlayerHorseRef != horseRef)
		OnDismount()
		return
	endIf
	if control == "Left Attack/Block"
		Spell leftHandSpell = MCM.PlayerRef.GetEquippedObject(0) as Spell
		if leftHandSpell != None
			if IsConcentrationSpell(leftHandSpell)
				leftHandSpell.Cast(MCM.PlayerRef)
			endIf
		endIf
	elseIf control == "Right Attack/Block"
		Spell rightHandSpell = MCM.PlayerRef.GetEquippedObject(1) as Spell
		if rightHandSpell != None
			if IsConcentrationSpell(rightHandSpell)
				rightHandSpell.Cast(MCM.PlayerRef)
			endIf
		endIf
	endIf
EndEvent

; Handles casting of spells and powers and ends casting of concentration spells while mounted.
Event OnControlUp(String control, float holdTime)
	; Do nothing if a menu is open or if text input is enabled.
	if IsInMenuMode() || UI.IsTextInputEnabled()
		return
	endIf
	; Finalize the last dismount if it did not get triggered properly (horse ragdolled or died).
	if playerIsRiding && (!MCM.PlayerRef.IsOnMount() || MCM.PlayerHorseRef != horseRef)
		OnDismount()
		return
	endIf
	if control == "Left Attack/Block"
		Spell leftHandSpell = MCM.PlayerRef.GetEquippedObject(0) as Spell
		if leftHandSpell != None
			if IsConcentrationSpell(leftHandSpell)
				MCM.PlayerRef.InterruptCast()
			else
				AttemptPlayerSpellCast(leftHandSpell, holdTime)
			endIf
		endIf
	elseIf control == "Right Attack/Block"
		Spell rightHandSpell = MCM.PlayerRef.GetEquippedObject(1) as Spell
		if rightHandSpell != None
			if IsConcentrationSpell(rightHandSpell)
				MCM.PlayerRef.InterruptCast()
			else
				AttemptPlayerSpellCast(rightHandSpell, holdTime)
			endIf
		endIf
	elseIf control == "Shout"
		Spell shoutSpell = MCM.PlayerRef.GetEquippedObject(2) as Spell
		if shoutSpell != None && shoutSpell.HasKeywordString("PowerInstantRecovery")
			shoutSpell.Cast(MCM.PlayerRef)
		endIf
	endIf
EndEvent

; Handles fast dismount for the player.
Function HandleFastDismount(int dismountPosition = 0)
	FastDismount(horseRef, dismountPosition, IsTrue(MCM.IHOFastDismountDrawWeapon))
	if !horseRef.IsBeingRidden() ; Fast dismount was successful.
		OnDismount()
	endIf
EndFunction

; The horse returns to the Stoic state if it is no longer in combat and unaggressive.
Event OnCombatStateChanged(Actor akTarget, int aeCombatState)
	if horseRef.IsInFaction(MCM.CurrentFollowerFaction)
		if IsTrue(MCM.IHOHorsesIgnoreCombat) || horseRef.GetActorValue("Aggression") == 0
			ResetFactionRank(horseRef, MCM.CurrentFollowerFaction, MCM.StoicHorseRank)
		else ; Use your aggressive feelings, boy.
			ResetFactionRank(horseRef, MCM.CurrentFollowerFaction, MCM.CombatHorseRank)
		endIf
		horseRef.EvaluatePackage()
	endIf
EndEvent

; The horse ignores combat unless it has been hit.
Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile,\
bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
	if !IsTrue(MCM.IHOHorsesIgnoreCombat)
		ResetFactionRank(horseRef, MCM.CurrentFollowerFaction, MCM.CombatHorseRank)
		horseRef.EvaluatePackage()
	endIf
EndEvent

; Removes the horse's special abilities when the horse dies.
Event OnDying(Actor akKiller)
	horseRef.BlockActivation(false) ; Release control of horse activation.
	OnDismount()
	if MCM.AbandonHorse(horseRef)
		MCM.DisplayHorseMessage(horseRef, "$IHO_HorseDead")
	endIf
	Dispel()
EndEvent
