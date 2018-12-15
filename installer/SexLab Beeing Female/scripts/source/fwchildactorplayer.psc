;/ Decompiled by Champollion V1.0.1
Source   : FWChildActorPlayer.psc
Modified : 2016-12-06 03:53:00
Compiled : 2017-01-18 08:35:41
User     : admin
Computer : PATRICK
/;
scriptName FWChildActorPlayer extends FWChildActor

;-- Properties --------------------------------------

;-- Variables ---------------------------------------
Float SearchStartTime = 0.000000
Float InCombatStartTime = 0.000000

;-- Functions ---------------------------------------

function Upgrade(Int oldVersion, Int newVersion)

	if oldVersion < 9
		self.RemoveFromFaction(game.GetFormFromFile(378958, "Skyrim.esm") as faction)
	endIf
endFunction

function OnPlayerLoadGame()

	parent.OnPlayerLoadGame()
	parent.SetActorValue("Destruction", self.GetActorValue("Destruction"))
	parent.SetActorValue("Illusion", self.GetActorValue("Illusion"))
	parent.SetActorValue("Conjuration", self.GetActorValue("Conjuration"))
	parent.SetActorValue("OneHanded", self.GetActorValue("OneHanded"))
	parent.SetActorValue("TwoHanded", self.GetActorValue("TwoHanded"))
	parent.SetActorValue("Marksman", self.GetActorValue("Marksman"))
	parent.SetActorValue("Health", self.GetActorValue("Health"))
	parent.SetActorValue("Sneak", self.GetActorValue("Sneak"))
	parent.SetActorValue("Magicka", self.GetActorValue("Magicka"))
	parent.SetActorValue("Restoration", self.GetActorValue("Restoration"))
	parent.SetActorValue("Alteration", self.GetActorValue("Alteration"))
	parent.SetActorValue("Block", self.GetActorValue("Block"))
	parent.SetActorValue("SpeedMult", self.GetActorValue("SpeedMult"))
	parent.SetActorValue("CarryWeight", self.GetActorValue("CarryWeight"))
	self.GivePerks()
endFunction

; Skipped compiler generated GotoState

function OnCombatStateChanged(actor akTarget, Int aeCombatState)

	Float curTime = utility.GetCurrentRealTime()
	if SearchStartTime > 0.000000
		self.AddExp((curTime - SearchStartTime) / 20.0000)
	endIf
	if InCombatStartTime > 0.000000
		self.AddExp((curTime - InCombatStartTime) / 10.0000)
	endIf
	SearchStartTime = 0.000000
	InCombatStartTime = 0.000000
	if akTarget != none
		if akTarget.IsPlayerTeammate()
			self.StopCombat()
			self.SetRelationshipRank(akTarget, 3)
			akTarget.SetRelationshipRank(self as actor, 3)
		endIf
	endIf
	if aeCombatState == 0
		if self.GetActorValuePercentage("Health") <= 0.000000
			self.RestoreActorValue("Health", self.GetActorValue("Health") * 99999.0)
			self.DamageActorValue("Health", self.GetActorValue("Health") - 10.0000)
		endIf
	elseIf aeCombatState == 1
		SearchStartTime = 0.000000
		InCombatStartTime = curTime
	elseIf aeCombatState == 2
		SearchStartTime = curTime
		InCombatStartTime = 0.000000
	endIf
endFunction

; Skipped compiler generated GetState

function onHit(ObjectReference akAggressor, form akSource, Projectile akProjectile, Bool abPowerAttack, Bool abSneakAttack, Bool abBashAttack, Bool abHitBlocked)

	actor ak = akAggressor as actor
	if ak != none
		if abHitBlocked == true
			self.AddExp((ak.GetLevel() / 10) as Float)
		endIf
	endIf
endFunction

function OnInit()

	parent.SetActorValue("Destruction", self.GetActorValue("Destruction"))
	parent.SetActorValue("Illusion", self.GetActorValue("Illusion"))
	parent.SetActorValue("Conjuration", self.GetActorValue("Conjuration"))
	parent.SetActorValue("OneHanded", self.GetActorValue("OneHanded"))
	parent.SetActorValue("TwoHanded", self.GetActorValue("TwoHanded"))
	parent.SetActorValue("Marksman", self.GetActorValue("Marksman"))
	parent.SetActorValue("Health", self.GetActorValue("Health"))
	parent.SetActorValue("Sneak", self.GetActorValue("Sneak"))
	parent.SetActorValue("Magicka", self.GetActorValue("Magicka"))
	parent.SetActorValue("Restoration", self.GetActorValue("Restoration"))
	parent.SetActorValue("Alteration", self.GetActorValue("Alteration"))
	parent.SetActorValue("Block", self.GetActorValue("Block"))
	parent.SetActorValue("SpeedMult", self.GetActorValue("SpeedMult"))
	parent.SetActorValue("CarryWeight", self.GetActorValue("CarryWeight"))
	Int sc = storageutil.FormListCount(self as form, "FW.Child.Perks")
	self.GivePerks()
	parent.OnInit()
endFunction
