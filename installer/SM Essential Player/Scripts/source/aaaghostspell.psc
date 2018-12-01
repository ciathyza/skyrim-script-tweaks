Scriptname aaaGhostSpell extends activemagiceffect  

; -------------------------------------------------------------------------------------------------
; Variables
; -------------------------------------------------------------------------------------------------

bool isDisabledControls = true
Actor player
int count


; -------------------------------------------------------------------------------------------------
; Properties
; -------------------------------------------------------------------------------------------------

Spell property aaaGhost auto
Quest property playerquest auto


; -------------------------------------------------------------------------------------------------
; Events
; -------------------------------------------------------------------------------------------------

Event OnEffectStart(Actor akTarget, Actor akCaster) 
	Game.DisablePlayerControls(false, true, false, false, false, true, true, false, 0)
	isDisabledControls = true
	count = 0
	player = akTarget
	akTarget.setGhost(true)
	RegisterForSingleUpdate(5)
EndEvent


Event OnUpdate()
	player.StopCombatAlarm()
	count = count + 1
	if (count >= 6)
		isDisabledControls = false
		Game.EnablePlayerControls(false, true, false, false, false, true, true, false, 0)
	endif
	RegisterForSingleUpdate(5)
EndEvent


Event OnEffectFinish(Actor akTarget, Actor akCaster) 
	akTarget.dispelSpell(aaaGhost)
	if (isDisabledControls)
		Game.EnablePlayerControls(false, true, false, false, false, true, true, false, 0)
	endif
	akTarget.setGhost(false)
EndEvent
