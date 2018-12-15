Scriptname lalawench_onfxC extends Actor  

Explosion Property ExplosionIllusionDark01 Auto
Spell Property lalawench_bless_bottle Auto
Actor Property PlayerRef auto
Spell Property lalawench_Mystic_DeathHealing Auto

	EVENT onLoad()
             self.placeAtMe(ExplosionIllusionDark01)
             lalawench_bless_bottle.Cast(self,self)
      		utility.wait(60.0)
		self.Kill()
             self.SetCriticalStage(self.CritStage_DisintegrateStart)	
		self.SetAlpha (0.0,True)
		utility.wait(1.0)		
		self.SetCriticalStage(self.CritStage_DisintegrateEnd)
	ENDEVENt

	EVENT onDying(actor myKiller)
		self.placeAtMe(ExplosionIllusionDark01)
             lalawench_Mystic_DeathHealing.Cast(PlayerRef,PlayerRef)
             self.Delete()
	ENDEVENT

