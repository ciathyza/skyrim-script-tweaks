Scriptname FWSpellExtraLife extends ActiveMagicEffect

float property HealPercent auto
float property MagickaPercent auto
float property CoolDown auto
bool bCanHeal = true
actor me


; Event received when this object is hit by a source (weapon, spell, explosion) or projectile attack
Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
	CheckHealing()
endEvent

function OnUpdate()
	bCanHeal=true
endFunction

function CheckHealing()
	float h = me.GetActorValuePercentage("Health")
	if bCanHeal == true && h<0.08
		float baseHealing=0
		if h<0
			baseHealing = (h * -1) * me.GetBaseActorValue("Health")
		endif
		me.RestoreActorValue("Health", (HealPercent / 100 * me.GetBaseActorValue("Health"))+baseHealing)
		me.RestoreActorValue("Magicka", MagickaPercent / 100 * me.GetBaseActorValue("Magicka"))
		bCanHeal=false
		RegisterForSingleUpdate(CoolDown)
	endif
endFunction

; Event received when this effect is first started (OnInit may not have been run yet!)
Event OnEffectStart(Actor akTarget, Actor akCaster)
	if HealPercent<=0
		HealPercent=GetMagnitude()
	endif
	me=akTarget
endEvent