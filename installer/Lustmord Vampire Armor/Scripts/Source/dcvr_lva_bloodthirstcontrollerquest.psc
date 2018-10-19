Scriptname DCVR_LVA_BloodthirstControllerQuest extends Quest Conditional


Int Property BloodthirstActive  Auto Conditional

ObjectReference Property BloodthirstContainer  Auto
Actor Property PlayerRef  Auto

Potion Property BloodPotion  Auto
Spell Property Bloodthirst  Auto




Event OnUpdate()

	UnregisterForUpdateGameTime()
	ConsumeBlood()

EndEvent





Event OnUpdateGameTime()

	ConsumeBlood()

EndEvent





Function ConsumeBlood()

	If (BloodthirstContainer.GetItemCount(BloodPotion) > 0) && (PlayerRef.HasSpell(Bloodthirst))
		BloodthirstContainer.RemoveItem(BloodPotion, 1)
		BloodthirstActive = 1
		RegisterForSingleUpdateGameTime(8)

	Else
		BloodthirstActive = 0
		UnregisterForUpdateGameTime()

	EndIf

EndFunction