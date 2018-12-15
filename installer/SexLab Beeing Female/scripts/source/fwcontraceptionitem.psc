;/ Decompiled by Champollion V1.0.1
Source   : FWContraceptionItem.psc
Modified : 2017-01-13 16:21:15
Compiled : 2017-01-18 08:35:33
User     : admin
Computer : PATRICK
/;
scriptName FWContraceptionItem extends FWSpell

;-- Properties --------------------------------------
imagespacemodifier property iModContraception6 auto
imagespacemodifier property iModContraception8 auto
imagespacemodifier property iModContraception4 auto
imagespacemodifier property iModContraception2 auto
imagespacemodifier property iModContraception9 auto
imagespacemodifier property iModContraception5 auto
imagespacemodifier property iModContraception7 auto
imagespacemodifier property iModContraception0 auto
imagespacemodifier property iModContraception1 auto
imagespacemodifier property iModContraception3 auto

;-- Variables ---------------------------------------
actor ActorRef
Bool bInit = false

;-- Functions ---------------------------------------

function OnInit()

	bInit = true
	parent.OnInit()
	self.execute()
endFunction

; Skipped compiler generated GetState

function OnWoman(actor akTarget, actor akCaster)

	ActorRef = akCaster
	self.execute()
endFunction

function execute()

	if bInit == false || ActorRef == none
		return 
	endIf
	Float mag = self.GetMagnitude()
	if mag < 2.00000
		mag = 2.00000
	endIf
	if ActorRef == game.GetPlayer() && mag > 2.00000
		Float f = 1.00000 - fwutility.floatModulo(mag, 10.0000) / 30.0000
		if mag < 10.0000
			iModContraception0.apply(f)
		elseIf mag < 20.0000
			iModContraception1.apply(f)
		elseIf mag < 30.0000
			iModContraception2.apply(f)
		elseIf mag < 40.0000
			iModContraception3.apply(f)
		elseIf mag < 50.0000
			iModContraception4.apply(f)
		elseIf mag < 60.0000
			iModContraception5.apply(f)
		elseIf mag < 70.0000
			iModContraception6.apply(f)
		elseIf mag < 80.0000
			iModContraception7.apply(f)
		elseIf mag < 90.0000
			iModContraception8.apply(f)
		else
			iModContraception9.apply(f)
		endIf
	endIf
	System.Controller.AddContraception(ActorRef, mag)
	System.Controller.DamageBaby(ActorRef, mag)
endFunction

; Skipped compiler generated GotoState
