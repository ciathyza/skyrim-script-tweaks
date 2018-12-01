Scriptname aaaEssentialPlayerQuestScript extends Quest Conditional

; -------------------------------------------------------------------------------------------------
; Properties
; -------------------------------------------------------------------------------------------------

int property isEnabled = 0 auto conditional

; Modes
; 0 essential only
; 1 essential and ghost mode
; 2 hardcore essential and ghost mode
; 3 disabled
int property mode = 0 auto conditional

; 0 normal ghost
; 1 hardcore ghost
; 2 easy ghost
int property ESSENTIALMODE = 0 autoreadonly
int property NORMALMODE = 1 autoreadonly
int property HARDCOREMODE = 2 autoreadonly
int property DISABLED = 3 autoreadonly
int property GHOSTMODE = 4 autoreadonly

int property NORMALGHOST = 0 autoreadonly
int property HARDCOREGHOST = 1 autoreadonly
int property EASYGHOST = 2 autoreadonly

int property ishardcore = 0 auto conditional

; 0 First person knock down
; 1 Third person knock down - Can break player animation
int property FIRSTPERSON = 0 autoreadonly
int property THIRDPERSON = 1 autoreadonly

int property essentialtype = 1 auto conditional
int property disableinjuries = 0 auto conditional
int property healthToHeal = 25 auto
int property losemoney = 0 auto conditional

bool property disableConfigSpell = false auto
bool property enableMoveEssential = true auto
bool property uninstall = false auto

Message property uninstallMessage auto
Quest property aaaUninstallQuest auto


; -------------------------------------------------------------------------------------------------
; Events
; -------------------------------------------------------------------------------------------------

Event OnUpdate()
	if (uninstall)
		Game.DisablePlayerControls()
		mode = DISABLED
		
		Self.stop()

		aaaUninstallQuest.start()
		Utility.wait(1)
		Game.GetPlayer().SetNoBleedoutRecovery(true)
		Game.GetPlayer().EndDeferredKill()
		Utility.wait(5)
		Game.GetPlayer().SetNoBleedoutRecovery(false)
		Game.GetPlayer().damageAV("Health", 1)
		Game.GetPlayer().restoreAV("Health", 100)
		Utility.wait(5)

		Form leftHand = Game.GetPlayer().GetEquippedObject(0)
		Form rightHand = Game.GetPlayer().GetEquippedObject(1)

		if (leftHand)
			Game.GetPlayer().UnequipItemEx(leftHand, 0)
			Game.GetPlayer().EquipItemEx(leftHand, 0)
		endif

		if (rightHand)
			Game.GetPlayer().UnequipItemEx(rightHand, 0)
			Game.GetPlayer().EquipItemEx(rightHand, 1)
		endif

		aaaUninstallQuest.stop()
		Game.EnablePlayerControls()
		uninstallMessage.show()
	endif
EndEvent
