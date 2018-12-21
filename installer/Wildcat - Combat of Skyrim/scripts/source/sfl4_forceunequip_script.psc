Scriptname SFL4_ForceUnequip_Script extends activemagiceffect  

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	Weapon EquippedWeapon

	EquippedWeapon = akTarget.GetEquippedWeapon(0)
	If EquippedWeapon
		akTarget.UnequipItem(EquippedWeapon)
	EndIf

	EquippedWeapon = akTarget.GetEquippedWeapon(1)
	If EquippedWeapon
		akTarget.UnequipItem(EquippedWeapon)
	EndIf

EndEvent

; -----