;/ Decompiled by Champollion V1.0.1
Source   : BFA_AbilityHungry.psc
Modified : 2016-12-06 03:52:11
Compiled : 2017-01-15 06:28:37
User     : admin
Computer : PATRICK
/;
scriptName BFA_AbilityHungry extends ActiveMagicEffect

;-- Properties --------------------------------------
sound property FoodEat auto
formlist property FoodList auto
spell property StomachGrowl auto

;-- Variables ---------------------------------------
Float lastEatenTime
Actor PlayerRef
Bool NeedToCheck = true
faction _SNHungryFaction
Float lastEatenGTime
Bool bIsPlayer = false

;-- Functions ---------------------------------------

; Skipped compiler generated GetState

function OnEffectFinish(Actor akTarget, Actor akCaster)

	self.UnregisterForModEvent("_SN_PlayerConsumes")
	self.UnregisterForUpdate()
endFunction

Bool function CheckInventoryForFood()

	Int c = PlayerRef.GetNumItems()
	if NeedToCheck == true
		Bool bFound = false
		Int HungerChance = utility.RandomInt(0, 40)
		Int ItemsToEat = 1
		if HungerChance > 38
			ItemsToEat = utility.RandomInt(2, 4)
		elseIf HungerChance > 35
			ItemsToEat = utility.RandomInt(2, 3)
		elseIf HungerChance > 30
			ItemsToEat = utility.RandomInt(1, 3)
		elseIf HungerChance > 20
			ItemsToEat = utility.RandomInt(1, 2)
		endIf
		while ItemsToEat > 0
			while c > 0
				c -= 1
				if self.Eat(PlayerRef.GetNthForm(c))
					c = 0
					bFound = true
				endIf
			endWhile
			ItemsToEat -= 1
		endWhile
		if bFound
			return true
		endIf
	endIf
	NeedToCheck = false
	if StomachGrowl != none && bIsPlayer as Bool
		StomachGrowl.Cast(PlayerRef as objectreference, none)
		PlayerRef.CreateDetectionEvent(PlayerRef, utility.RandomInt(20, 100))
		return false
	endIf
endFunction

function OnEffectStart(Actor akTarget, Actor akCaster)

	PlayerRef = akTarget
	bIsPlayer = PlayerRef == game.GetPlayer()
	self.RegisterForSingleUpdate(10.0000)
	self.RegisterForModEvent("_SN_PlayerConsumes", "OnPlayerEaten")
endFunction

function OnPlayerEaten(String hookName, String argString, Float argNum, form sender)

	if PlayerRef == game.GetPlayer()
		lastEatenTime = utility.GetCurrentRealTime()
		lastEatenGTime = utility.GetCurrentGameTime()
	endIf
endFunction

; Skipped compiler generated GotoState

Bool function Eat(form itm)

	if itm as potion != none
		potion p = itm as potion
		if p.IsFood() == true
			if p.IsHostile() == false
				if FoodList.Find(p as form) >= 0
					if PlayerRef.GetItemCount(p as form) > 0
						lastEatenTime = utility.GetCurrentRealTime()
						lastEatenGTime = utility.GetCurrentGameTime()
						self.CastEffects(p)
						PlayerRef.OnSpellCast(p as form)
						PlayerRef.RemoveItem(p as form, 1, true, none)
						FoodEat.Play(PlayerRef as objectreference)
						if _SNHungryFaction != none
							PlayerRef.RemoveFromFaction(_SNHungryFaction)
						endIf
						return true
					endIf
				endIf
			endIf
		endIf
	endIf
	return false
endFunction

function OnSpellCast(form akSpell)

	if akSpell as potion != none
		if FoodList.Find(akSpell) as Bool || (akSpell as potion).IsFood() && (akSpell as potion).IsPoison() == false
			lastEatenTime = utility.GetCurrentRealTime()
			lastEatenGTime = utility.GetCurrentGameTime()
		endIf
	endIf
endFunction

function OnItemAdded(form akBaseItem, Int aiItemCount, objectreference akItemReference, objectreference akSourceContainer)

	if FoodList.Find(akBaseItem) >= 0
		NeedToCheck = true
	endIf
endFunction

function CastEffects(potion itm)

	Int c = itm.GetNumEffects()
	while c > 0
		c -= 1
		magiceffect mfx = itm.GetNthEffectMagicEffect(c)
		Float mag = itm.GetNthEffectMagnitude(c)
		Int mid = mfx.GetFormID()
		if mid == 996299
			PlayerRef.RestoreActorValue("Health", mag)
		elseIf mid == 1071266
			PlayerRef.RestoreActorValue("Health", mag)
		elseIf mid == 1071271
			PlayerRef.RestoreActorValue("Magicka", mag)
		elseIf mid == 996300
			PlayerRef.RestoreActorValue("Stamina", mag)
		elseIf mid == 1071267
			PlayerRef.RestoreActorValue("Stamina", mag)
		endIf
	endWhile
endFunction

function OnUpdate()

	Float t = utility.GetCurrentRealTime()
	Float g = utility.GetCurrentGameTime()
	Float w = 90.0000
	if t >= lastEatenTime + w || g > lastEatenGTime + 2.00000
		if self.CheckInventoryForFood()
			self.RegisterForSingleUpdate(w * 0.650000)
		else
			self.RegisterForSingleUpdate(utility.RandomFloat(w * 0.500000, w * 1.50000))
		endIf
	else
		self.RegisterForSingleUpdate(10.0000)
	endIf
endFunction
