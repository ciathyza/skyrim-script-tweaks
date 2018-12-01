Scriptname aaaDeathConfigScript extends activemagiceffect  

; -------------------------------------------------------------------------------------------------
; Properties
; -------------------------------------------------------------------------------------------------

aaaEssentialPlayerQuestScript property essentialQuest auto
Message property configMenu auto
Message property furtherConfig auto
Message property ghostMenu auto


; -------------------------------------------------------------------------------------------------
; Events
; -------------------------------------------------------------------------------------------------

Event OnEffectStart(Actor akTarget, Actor akCaster)
	int result = configMenu.show()

	if (result != 8 && !essentialQuest.isEnabled)
		essentialQuest.mode = essentialQuest.DISABLED
		return
	endIf

	; Essential Only
	if (result == 0)
		startQuest()
		while (!essentialQuest.isRunning())
			Utility.wait(1)
		endwhile
		essentialQuest.mode = essentialQuest.ESSENTIALMODE
	; Ghost Only
	elseif (result == 2)
		startQuest()
		while (!essentialQuest.isRunning())
			Utility.wait(1)
		endwhile
		essentialQuest.mode = essentialQuest.GHOSTMODE
	; Essential and Ghost
	elseif (result == 4)
		startQuest()
		while (!essentialQuest.isRunning())
			Utility.wait(1)
		endwhile
		essentialQuest.mode = essentialQuest.NORMALMODE
	; Hardcore Ghost Mode
	elseif (result == 6)
		int ghostresult = ghostMenu.show()
		if (ghostresult == 0)
			essentialQuest.ishardcore = essentialQuest.EASYGHOST
		elseif (ghostresult == 1)
			essentialQuest.ishardcore = essentialQuest.EASYGHOST
		elseif (ghostresult == 2)
			essentialQuest.ishardcore = essentialQuest.NORMALGHOST
		elseif (ghostresult == 3)
			essentialQuest.ishardcore = essentialQuest.NORMALGHOST
		elseif (ghostresult == 4)
			essentialQuest.ishardcore = essentialQuest.HARDCOREGHOST
		elseif (ghostresult == 5)
			essentialQuest.ishardcore = essentialQuest.HARDCOREGHOST
		endif
	elseif (result == 7)
		int configresult = furtherConfig.show()
		if (configresult == 0)
			essentialQuest.losemoney = 10
		elseif (configresult == 1)
			essentialQuest.losemoney = 0
		; first person knockdown
		elseif (configresult == 2)
			essentialQuest.essentialtype = essentialQuest.FIRSTPERSON
		; first person knockdown
		elseif (configresult == 3)
			essentialQuest.essentialtype = essentialQuest.FIRSTPERSON
		; third person knockdown
		elseif (configresult == 4)
			essentialQuest.essentialtype = essentialQuest.THIRDPERSON
		; third person knockdown
		elseif (configresult == 5)
			essentialQuest.essentialtype = essentialQuest.THIRDPERSON
		; enable injuries
		elseif (configresult == 6)
			essentialQuest.disableinjuries = 0
		; disable injuries
		elseif (configresult == 7)
			essentialQuest.disableinjuries = 1
		endif
	elseif (result == 8)
		essentialQuest.uninstall = true
		essentialQuest.RegisterForSingleUpdate(1)
	endif
EndEvent


; -------------------------------------------------------------------------------------------------
; Functions
; -------------------------------------------------------------------------------------------------

; Start main quest system if not already running
Function startQuest()
EndFunction
