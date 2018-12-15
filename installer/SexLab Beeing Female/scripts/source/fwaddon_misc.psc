;/ Decompiled by Champollion V1.0.1
Source   : FWAddOn_Misc.psc
Modified : 2017-01-12 13:18:41
Compiled : 2017-01-18 08:36:18
User     : admin
Computer : PATRICK
/;
scriptName FWAddOn_Misc extends FWAddOnBase hidden

;-- Properties --------------------------------------
String property AddOnName hidden
	String function get()

		if sAddOnName == ""
			Int fID = self.GetFormID()
			Int bID = fID % 16777216
			Int mID = (fID - bID) / 16777216
			String ModName = game.GetModName(mID)
			debug.Notification(ModName + "; mID:" + mID as String + "; bID:" + bID as String)
			Int c = fwutility.GetFileCount("AddOn", "ini")
			while c > 0
				c -= 1
				String n = fwutility.GetFileName("AddOn", "ini", c)
				if fwutility.GetIniCString("AddOn", n, "AddOn", "modFile", "") == ModName
					if fwutility.GetIniCInt("AddOn", n, "AddOn", "form", 0) == bID
						self.SetAddOnName(n)
						return n
					endIf
				endIf
			endWhile
		endIf
		return sAddOnName
	endFunction
endproperty
Bool property HasCamera = false auto

;-- Variables ---------------------------------------
String sAddOnName = ""

;-- Functions ---------------------------------------

function OnGameLoad()

	; Empty function
endFunction

function OnDoDamageEnd(actor Woman, Float amount, Int DamageType, Float OptionalArgument)

	; Empty function
endFunction

function OnRegisterChildPerk(FWChildSettings childSettings)

	; Empty function
endFunction

function OnEnterState(actor akFemale, Int iState)

	; Empty function
endFunction

function OnImpregnate(actor Woman, Int NumChildren, Actor[] ChildFathers)

	; Empty function
endFunction

String function GetString(String name, String Default)

	if self.AddOnName == ""
		return Default
	else
		return fwutility.GetIniCString("AddOn", sAddOnName, "Settings", name, Default)
	endIf
endFunction

function OnExitState(actor akFemale, Int iState)

	; Empty function
endFunction

function OnAddOnDeactivate()

	; Empty function
endFunction

function OnPotionDrink(actor akMother, potion akPotion)

	; Empty function
endFunction

function OnGiveBirthEnd(actor akMother)

	; Empty function
endFunction

Bool function OnAllowFFCum(actor WomanToAdd, actor denor)

	return false
endFunction

function StopCamera()

	; Empty function
endFunction

function OnContraception(actor Woman, Float amount, Float ValueBefore, Float ValueAfter, Float TimeAgo)

	; Empty function
endFunction

function SetFloat(String name, Float value)

	if self.AddOnName != ""
		fwutility.SetIniCFloat("AddOn", sAddOnName, "Settings", name, value)
	endIf
endFunction

Int function GetInt(String name, Int Default)

	if self.AddOnName == ""
		return Default
	else
		return fwutility.GetIniCInt("AddOn", sAddOnName, "Settings", name, Default)
	endIf
endFunction

Bool function GetBool(String name, Bool Default)

	if self.AddOnName == ""
		return Default
	else
		return fwutility.GetIniCBool("AddOn", sAddOnName, "Settings", name, Default)
	endIf
endFunction

function OnLaborPain(actor akFemale)

	; Empty function
endFunction

FWController function GetController()

	return game.GetFormFromFile(6186, fwutility.modFile("BeeingFemale")) as FWController
endFunction

function SetString(String name, String value)

	if self.AddOnName != ""
		fwutility.SetIniCString("AddOn", sAddOnName, "Settings", name, value)
	endIf
endFunction

FWSystemConfig function GetConfig()

	return game.GetFormFromFile(6184, fwutility.modFile("BeeingFemale")) as FWSystemConfig
endFunction

Bool function CheckForCondome(actor Woman, actor Man)

	return false
endFunction

FWSystem function GetSystem()

	return game.GetFormFromFile(3426, fwutility.modFile("BeeingFemale")) as FWSystem
endFunction

function OnCameInside(actor akFemale, actor akMale)

	; Empty function
endFunction

Float function getSpermAmount(actor akFemale, actor akMale, Float amount)

	return amount
endFunction

function StartCamera()

	; Empty function
endFunction

function SetInt(String name, Int value)

	if self.AddOnName != ""
		fwutility.SetIniCInt("AddOn", sAddOnName, "Settings", name, value)
	endIf
endFunction

function SetAddOnName(String S)

	sAddOnName = S
endFunction

ObjectReference function OnGetBedRef(actor ActorRef)

	return none
endFunction

; Skipped compiler generated GotoState

actor function OnSleepSexStart(actor p, actor aSexPartner)

	return aSexPartner
endFunction

function OnMimik(actor ActorRef, String ExpressionName, Int Strength, Bool bClear)

	; Empty function
endFunction

function OnAddOnActivate()

	; Empty function
endFunction

Bool function OnPlayPainSound(actor ActorRef, Float Strength)

	return false
endFunction

function SetBool(String name, Bool value)

	if self.AddOnName != ""
		fwutility.SetIniCBool("AddOn", sAddOnName, "Settings", name, value)
	endIf
endFunction

function OnGiveBirth(actor akMother, Int iChildCount)

	; Empty function
endFunction

Form[] function OnStripActor(actor ActorRef)

	Form[] fAll
	return fAll
endFunction

actor function OnSleepSexStop(actor p, actor aSexPartner)

	return aSexPartner
endFunction

function OnMagicEffectApply(actor akWoman, ObjectReference akCaster, MagicEffect akEffect)

	; Empty function
endFunction

function OnDoDamageStart(actor a, Float amount, Int DamageType, Float OptionalArgument)

	; Empty function
endFunction

function OnUpdateFunction(actor akFemale, Int iState, Float StatePercentage)

	; Empty function
endFunction

Float function OnDoDamage(actor Woman, Float amount, Int DamageType, Float OptionalArgument)

	return amount
endFunction

Float function GetFloat(String name, Float Default)

	if self.AddOnName == ""
		return Default
	else
		return fwutility.GetIniCFloat("AddOn", sAddOnName, "Settings", name, Default)
	endIf
endFunction

Bool function OnPainSound(actor akMother)

	; Empty function
endFunction

function OnBabySpawn(actor akMother, actor akFather)

	; Empty function
endFunction

function OnGiveBirthStart(actor akMother)

	; Empty function
endFunction

function OnUninstall()

	; Empty function
endFunction

; Skipped compiler generated GetState

Bool function IsActive()

	return true
endFunction

function OnSpellCast(actor akMother, spell akSpell)

	; Empty function
endFunction
