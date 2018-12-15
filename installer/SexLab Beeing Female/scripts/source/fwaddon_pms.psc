;/ Decompiled by Champollion V1.0.1
Source   : FWAddOn_PMS.psc
Modified : 2014-06-05 14:29:02
Compiled : 2014-06-08 05:58:04
User     : Patrick
Computer : PATRICK-PC
/;
scriptName FWAddOn_PMS extends FWAddOnBase

;-- Properties --------------------------------------
spell[] property PMS_MagicEffect auto

;-- Variables ---------------------------------------

;-- Functions ---------------------------------------

; Skipped compiler generated GetState

; Skipped compiler generated GotoState

function Refresh(String strArg, FWAddOnManager sender)

	if strArg == "" || strArg == "PMS"
		if sender
			sender.RegisterPMSAddOn(self)
		elseIf AddOnManager != none
			AddOnManager.RegisterPMSAddOn(self)
		else
			debug.Trace("Beeing Female Mod Manager - RefreshAddOns PMS " + self.GetName() + " failed - Manager is none", 0)
		endIf
	endIf
endFunction
