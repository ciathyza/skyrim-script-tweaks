; Immersive Horses by sevencardz.
ScriptName IHOHorseOwnershipEffectScript extends ActiveMagicEffect  
{Effect attached to the Horse Ownership lesser power.}
import IHOUtil
UILIB_1 SkyUILib

Quest Property IHOConfigMenuQuest Auto
IHOConfigMenuScript MCM = None

; Handles horse ownership depending on whether it is cast on a horse or humanoid actor.
Event OnEffectStart(Actor akTarget, Actor akCaster)
	SkyUILib = (IHOConfigMenuQuest as Form) as UILIB_1
	MCM = IHOConfigMenuQuest as IHOConfigMenuScript
	
	; Show the horse ownership menu or adopt the horse if cast on a horse owned by the player.
	if akTarget.GetRace() == MCM.HorseRace && akTarget.IsInFaction(MCM.PlayerHorseFaction)
		if MCM.IsPersistent(akTarget)
			MCM.ShowHorseOwnershipMenu(akTarget)
		else ; Temporary
			MCM.AdoptHorse(akTarget)
		endIf
	; Show the horse list menu to choose a horse to give away if cast on a humanoid actor.
	elseIf akTarget.HasKeyword(MCM.ActorTypeNPC) ; Humanoid
		MCM.UpdateHorseListMenu()
		if MCM.PlayerHorseList.Length == 0
			MCM.DisplayGeneralMessage("$IHO_PlayerNoHorse", forceDisplay = true)
			return
		endIf
		int index = 1
		while index == 1 ; Hack to stop the player from giving away the entire herd.
			String title = "$IHO_HorseChoose{" + akTarget.GetDisplayName() + "}"
			index = SkyUILib.ShowList(title, MCM.HorseListMenu, aiStartIndex = 0, aiDefaultIndex = 0)
		endWhile
		if index == 0 ; Cancel
			return
		endIf
		int chosenHorseIndex = index - MCM.HorseListMenuOffset
		Actor horseRef = MCM.PlayerHorseList[chosenHorseIndex] as Actor
		horseRef.SetActorOwner(akTarget.GetLeveledActorBase())
		if IsTrue(MCM.IHOShowStatusMessages)
			String msg = "$IHO_HorseOtherOwner{" + horseRef.GetDisplayName() + "}{" + akTarget.GetDisplayName() + "}"
			Debug.Notification(msg)
		endIf
	endIf
EndEvent
