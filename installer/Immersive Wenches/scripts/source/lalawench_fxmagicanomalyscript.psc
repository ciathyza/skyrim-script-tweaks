Scriptname lalawench_FXMagicAnomalyScript extends Actor  

{Handles the fx for the magic anomaly creatures}

;===============================================
Explosion Property deathExplosion Auto
Actor Property PlayerRef auto
Spell Property lalawench_MysticHealing Auto
;===============================================
	
	EVENT onLoad()
             self.placeAtMe(deathExplosion)
		self.setScale(utility.randomFloat(0.5, 1.0))
      		utility.wait(60.0)
		self.Kill()
             self.SetCriticalStage(self.CritStage_DisintegrateStart)	
		self.SetAlpha (0.0,True)
		utility.wait(1.0)		
		self.SetCriticalStage(self.CritStage_DisintegrateEnd)
	ENDEVENt

	EVENT onDying(actor myKiller)
		self.placeAtMe(deathExplosion)
             lalawench_MysticHealing.Cast(PlayerRef,PlayerRef)
             self.Delete()
	ENDEVENT