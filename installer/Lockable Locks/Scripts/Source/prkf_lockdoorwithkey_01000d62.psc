;/ Decompiled by Champollion V1.0.1
Source   : PRKF_LockDoorWithKey_01000D62.psc
Modified : 2015-06-15 00:23:10
Compiled : 2015-06-15 00:23:12
User     : FLX
Computer : FLEX
/;
scriptName PRKF_LockDoorWithKey_01000D62 extends Perk hidden

;-- Properties --------------------------------------
message property LockNoKey auto

;-- Variables ---------------------------------------

;-- Functions ---------------------------------------

function Fragment_7(ObjectReference akTargetRef, Actor akActor)

	if akTargetRef == none
		return 
	endIf
	key thisKey = akTargetRef.GetKey()
	if akActor.GetItemCount(thisKey as form) > 0
		akTargetRef.Lock(true, false)
	else
		LockNoKey.Show(0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000)
	endIf
endFunction

; Skipped compiler generated GetState

; Skipped compiler generated GotoState
