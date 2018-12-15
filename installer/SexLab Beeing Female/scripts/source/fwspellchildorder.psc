;/ Decompiled by Champollion V1.0.1
Source   : FWSpellChildOrder.psc
Modified : 2017-01-13 11:43:01
Compiled : 2017-01-18 08:35:13
User     : admin
Computer : PATRICK
/;
scriptName FWSpellChildOrder extends ActiveMagicEffect
{Area Type: 0 = same Location; 1 = all}

;-- Properties --------------------------------------
Int property AreaType = 0 auto
{TeleportTo: 0 = don't teleport; 1 = to caster; 2 = to spoon; 3 = to home; 4 = to meet point}
Int property TeleportTo = 0 auto
{the Order the child should have}
Int property Order_ID = 0 auto

;-- Variables ---------------------------------------

;-- Functions ---------------------------------------

; Skipped compiler generated GetState

; Skipped compiler generated GotoState

function OnEffectStart(Actor akTarget, Actor akCaster)

	quest q = none
	if TeleportTo > 1
		Int cq = game.GetModCount()
		String modName = ""
		while cq > 0
			cq -= 1
			String t = game.GetModName(cq)
			if t == "BeeingFemale.esp"
				modName = "BeeingFemale.esp"
				cq = 0
			elseIf t == "BeeingFemale.esm"
				modName = "BeeingFemale.esm"
				cq = 0
			endIf
		endWhile
		if modName != ""
			q = game.GetFormFromFile(109752, modName) as quest
		endIf
	endIf
	Int c = storageutil.FormListCount(none, "FW.Babys")
	while c > 0
		c -= 1
		fwchildactor ca = storageutil.FormListGet(none, "FW.Babys", c) as fwchildactor
		if ca != none
			if storageutil.GetFormValue(ca as form, "FW.Child.Mother", none) == akCaster as form || storageutil.GetFormValue(ca as form, "FW.Child.Father", none) == akCaster as form
				if AreaType == 1 || ca.IsInLocation(akCaster.GetCurrentLocation())
					if TeleportTo == 1
						ca.MoveTo(akCaster as objectreference, 0.000000, 0.000000, 0.000000, true)
					elseIf TeleportTo == 2 && q != none
						self.TeleportTo(ca as Actor, q, "PlayerHome")
					elseIf TeleportTo == 3 && q != none
						self.TeleportTo(ca as Actor, q, "OtherParent")
					elseIf TeleportTo == 4 && q != none
						self.TeleportTo(ca as Actor, q, "MeetPoint")
					endIf
					ca.Order = Order_ID
					ca.EvaluatePackage()
				endIf
			endIf
		endIf
	endWhile
endFunction

function TeleportTo(Actor c, quest q, String AliasName)

	alias a = q.GetAliasByName(AliasName)
	if a != none
		referencealias ra = a as referencealias
		locationalias la = a as locationalias
		if ra != none
			c.MoveTo(ra.GetRef(), 0.000000, 0.000000, 0.000000, true)
		endIf
	endIf
endFunction
