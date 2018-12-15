Scriptname lalawench_onfx extends Actor  

Explosion Property lalawench_ExplosionIllusionDark01 Auto
Spell Property lalawench_bless_bottle Auto
Spell Property lalawench_bottle_ability Auto

	EVENT onLoad()
        if self.Hasspell(lalawench_bottle_ability) == False
             self.placeAtMe(lalawench_ExplosionIllusionDark01)
             lalawench_bless_bottle.Cast(self,self)
             Utility.Wait(1.0) 
             self.AddSpell(lalawench_bottle_ability)
        else
             ;nothing
        endif
	ENDEVENt