Scriptname _ChallengeScript  extends ReferenceAlias

Actor property Target auto
Bool property AllowFollowerHelp auto
Bool property AllowNPCJumping auto
Faction property targetFaction auto
Float property targetAggression auto
Float property targetConfidence auto
GlobalVariable Property _DuelKillEssentials  Auto  
Keyword Property WeapTypeBow Auto
Perk Property SparPerk  Auto  
Perk Property lootPerk  Auto  
Quest Property sparQuest  Auto  
Quest property FollowerQuest auto
WordOfPower property ChallengeWord auto
_SparScript Property spar  Auto  

Weapon bow
bool flee
bool overrideBrawl
bool ranOnce
float lastHealth
float melee
float startHealth


Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, \
  bool abBashAttack, bool abHitBlocked)
	if((akAggressor as Actor) == target && self.getactorref().GetAvPercentage("Health") < 0.2) ;if the target hit me
		self.getactorref().SetActorValue("Paralysis",1)
		target.PushActorAway(self.getactorref(), 0.0)
		utility.wait(1.0);
		target.stopcombat()
		getactorref().stopcombat()
		target.removefromfaction(targetFaction)
		target.stopcombat()
		getactorref().stopcombat()
		registerforsingleupdate(5.0)
		target.stopcombat()
		getactorref().stopcombat()
		target.SetActorValue("Paralysis",0)
		target.SetActorValue("confidence",targetConfidence)
		target.SetActorValue("aggression",targetAggression)
		target.setav("meleedamage", melee)
		
		if(target.getitemcount(bow) == 0)
			target.additem(bow,1)
		endif

		FollowerQuest.Stop()
		target = none
		ranOnce = false
		lastHealth = 0
		overrideBrawl = false
		flee = false

		utility.wait(5.0)
		self.getactorref().SetActorValue("Paralysis",0)
	endif
endevent


event oninit()
	utility.wait(35.0)
	game.teachword(ChallengeWord)
	game.unlockword(ChallengeWord)

	if(self.getactorref().HasPerk(lootPerk) == false)
		self.getactorref().addPerk(lootPerk)
	endif

	if(self.getactorref().HasPerk(sparPerk) == false)
		self.getactorref().addPerk(sparPerk)
	endif
endevent


function StartCombat()
	registerforsingleupdate(0.5)
	startHealth = target.getav("health")
	if(!AllowFollowerHelp)
		FollowerQuest.Start()
	endif
endfunction


event onupdate()
	if(sparQuest.IsACtive() && spar.Target == none)
		sparQuest.Stop()
	endif

	if(self.getactorref().HasPerk(lootPerk) == false)
		self.getactorref().addPerk(lootPerk)
	endif

	if(self.getactorref().HasPerk(sparPerk) == false)
		self.getactorref().addPerk(sparPerk)
	endif

	if(!AllowFollowerHelp && target.GetCombatTarget() != self.getactorref())
		target.stopcombat()
		target.startcombat(self.getactorref())
	elseif(AllowFollowerHelp )
		FollowerQuest.Stop()
		Actor randomActor = Game.FindRandomActorFromRef(self.getactorref(), 500.0)

		if(randomActor.isplayerteammate())
			randomActor.EvaluatePackage()
			randomActor.startcombat(target)
		endif
	endif

	if(target.isbleedingout())
			target.addtofaction(targetFaction)
			target.setav("confidence",4)
			target.setav("aggression", 1)
			utility.wait(0.5)
			target.startcombat(self.getactorref())
	endif

	if((_DuelKillEssentials.GetValue() == 1 || target.IsEssential() == 0) && target.getav("health") < lastHealth && target.GetActorValue("Paralysis") == 1)		

		self.getactorref().PushActorAway(target, 4.5)
		target.getactorbase().setessential(false)
		target.killEssential()
		target.SetActorValue("Paralysis",0)
	endif

	if((_DuelKillEssentials.GetValue() == 0 && target.IsEssential() == 1) && target.getav("health") < lastHealth && target.GetActorValue("Paralysis") == 1)		
		self.getactorref().PushActorAway(target, 1.0)
	endif


	if(target.IsInKillMove() == false && target.getav("health") < lastHealth && flee)		

		self.getactorref().PushActorAway(target, 2.0)
		target.SetActorValue("Paralysis",1)
	endif

	float threshold = target.getbaseav("health") - (target.getbaseav("health") * (targetConfidence/5))

	if(target.getav("health") < threshold)
		int random = Utility.RandomInt(1, 100 * 2 * (target.getav("health") / threshold) as int)

		if(random == 1)
			overrideBrawl = true
		endif
	endif

	float fleeThreshold = target.getbaseav("health") - (target.getbaseav("health") * 3 * (targetConfidence/10))

	if(target.getav("health") < fleeThreshold )
		int random = Utility.RandomInt(1, 100 * 2 * (target.getav("health") / fleeThreshold) as int)

		if(random == 1)
			flee = true
			target.setav("confidence",0)
		endif
	endif

	if(self.getactorref().GetEquippedWeapon() == none && !overrideBrawl  && (game.getplayer().GetEquippedSpell(0) == none && game.getplayer().GetEquippedSpell(1) == none) )
		if(target.GetEquippedWeapon() != none)
			melee = 0
			
			if(target.GetEquippedWeapon().HasKeyword(WeapTypeBow))	
				bow = target.GetEquippedWeapon()
				target.removeitem(bow, 1)
			endif			

			target.setav("meleedamage", -1000)
			target.unequipitem(target.GetEquippedWeapon())
			target.damageav("magicka", 10000)
		endif
	else
		if(target.GetEquippedWeapon() == none)
			target.setav("meleedamage", melee)
			if(target.getitemcount(bow) == 0)
				target.additem(bow,1)
			endif
		endif
	endif

	if(target.IsInKillMove() == false && target.GetAVPercentage("health") <= 0.2 && ranOnce == false && target.getav("health") < startHealth )
		target.SetActorValue("Paralysis",1)
		self.getactorref().PushActorAway(target, 1.0)
		ranOnce = true
	endif

	if(getactorref().GetCurrentLocation().IsSameLocation(target.GetCurrentLocation()) == false|| target.IsDead() == 1 || (target.GetActorValue("Paralysis") == 1 && self.getactorref().IsWeaponDrawn() == false) || (flee && target.GetDistance(self.getactorref()) > 800))
		target.removefromfaction(targetFaction)
		target.stopcombat()
		utility.wait(5.0)
		target.SetActorValue("Paralysis",0)
		target.SetActorValue("confidence",targetConfidence)
		target.SetActorValue("aggression",targetAggression)
		target.setav("meleedamage", melee)
		if(target.getitemcount(bow) == 0)
			target.additem(bow,1)
		endif
		
		FollowerQuest.Stop()
		target = none
		ranOnce = false
		lastHealth = 0
		overrideBrawl = false
		flee = false
	endif

	lastHealth = target.getav("health")

	if(target != none)
		registerforsingleupdate(0.5)
	endif
endevent
