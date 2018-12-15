;/ Decompiled by Champollion V1.0.1
Source   : QF_MakeLockLockable_01001828.psc
Modified : 2015-06-15 00:58:09
Compiled : 2015-06-15 00:58:10
User     : FLX
Computer : FLEX
/;
scriptName QF_MakeLockLockable_01001828 extends Quest hidden

;-- Properties --------------------------------------
perk property LockDoorWithKey auto

;-- Variables ---------------------------------------

;-- Functions ---------------------------------------

; Skipped compiler generated GetState

function Fragment_0()

	game.GetPlayer().AddPerk(LockDoorWithKey)
	self.Stop()
endFunction

; Skipped compiler generated GotoState
