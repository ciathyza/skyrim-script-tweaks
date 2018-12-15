Scriptname lalawench_bottlemerchant extends activemagiceffect  

ObjectReference Property EbonyWenchRef  Auto  
ObjectReference Property EbonyWenchMarker  Auto   
ImageSpaceModifier property ConjureImageSpace Auto
Explosion Property ExplosionIllusionDark01 Auto

Event OnEffectStart(actor akTarget, actor akCaster)
	(EbonyWenchRef as actor).StopCombat()
	EbonyWenchRef.Moveto(game.GetPlayer())
	ConjureImageSpace.Apply()
	EbonyWenchRef.placeAtMe(ExplosionIllusionDark01)
EndEvent

Event OnEffectFinish(actor akTarget, actor akCaster)
	EbonyWenchRef.placeAtMe(ExplosionIllusionDark01)
	EbonyWenchRef.Disable(true)
	utility.wait(1)	
	EbonyWenchRef.MoveTo(EbonyWenchMarker)
	(EbonyWenchRef as actor).StopCombat()
	EbonyWenchRef.Enable()
EndEvent  