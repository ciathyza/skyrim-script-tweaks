Scriptname lalawench_cleandeath extends Actor  

{Handles the summoned creatures}
	
	EVENT onLoad()
      		utility.wait(118.0)
		self.Kill()
             self.SetCriticalStage(self.CritStage_DisintegrateStart)	
		self.SetAlpha (0.0,True)
		utility.wait(1.0)		
		self.SetCriticalStage(self.CritStage_DisintegrateEnd)
	ENDEVENt

	EVENT onDying(actor myKiller)
             self.Delete()
	ENDEVENT