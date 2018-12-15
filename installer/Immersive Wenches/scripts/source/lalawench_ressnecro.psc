Scriptname lalawench_ressnecro extends Actor
{ress the death.}

ACTORBASE PROPERTY lalawench_SScreature_necro_shade_random AUTO
Explosion Property fakeForceball1024 Auto
Explosion Property DA16SkullAreaExplosion Auto

Event OnDying(Actor akKiller)
	Utility.Wait(5.0)
	self.placeAtMe(lalawench_SScreature_necro_shade_random)
	self.placeAtMe(fakeForceball1024)
       self.placeAtMe(DA16SkullAreaExplosion)
       Utility.Wait(2.0)
EndEvent


