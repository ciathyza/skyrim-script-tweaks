;/ Decompiled by Champollion V1.0.1
Source   : FWChildItem.psc
Modified : 2017-01-14 16:10:10
Compiled : 2017-01-18 08:35:36
User     : admin
Computer : PATRICK
/;
scriptName FWChildItem extends MiscObject

;-- Properties --------------------------------------
Float property DayOfBirth
	Float function get()

		return dob
	endFunction
endproperty
Float property Age
	Float function get()

		return utility.GetCurrentGameTime() - dob
	endFunction
endproperty
Float property SizeDuration = 30.0000 auto
Float property SmallSizeScale = 0.600000 auto
actor property Father
	actor function get()

		return _Father
	endFunction
endproperty
actor property Mother
	actor function get()

		return _Mother
	endFunction
endproperty

;-- Variables ---------------------------------------
Float dob = 0.000000
String Name = ""
actor _Mother
actor _Father
Bool bIsVampire = false
Int iSex
ColorForm HairColor

;-- Functions ---------------------------------------

function OnDeath(actor akKiller)

	storageutil.SetFloatValue(self as form, "FW.Child.LastUpdate", utility.GetCurrentGameTime())
endFunction

Bool function IsVampire()

	return bIsVampire
endFunction

function SetSex(Int Sex)

	Int xflag = storageutil.GetIntValue(self as form, "FW.Child.Flag", 0)
	if math.LogicalAnd(xflag, 4) == 4 && Sex == 0
		storageutil.SetIntValue(self as form, "FW.Child.Flag", math.LogicalXor(xflag, 4))
	elseIf math.LogicalAnd(xflag, 4) == 0 && Sex == 1
		storageutil.SetIntValue(self as form, "FW.Child.Flag", math.LogicalOr(xflag, 4))
	endIf
	if Sex == 1
		iSex = 1
	else
		iSex = 0
	endIf
endFunction

function UpdateSize()

	if self.Age >= SizeDuration
		
	elseIf self.Age < 0.000000
		
	endIf
endFunction

function SetParent(actor Mother, actor Father)

	storageutil.SetFormValue(self as form, "FW.Child.Father", self.Father as form)
	storageutil.SetFormValue(self as form, "FW.Child.Mother", self.Mother as form)
	storageutil.SetFloatValue(self as form, "FW.Child.LastUpdate", utility.GetCurrentGameTime())
	_Father = self.Father
	_Mother = self.Mother
endFunction

String function GetName()

	return Name
endFunction

function Delete()

	storageutil.UnsetFloatValue(self as form, "FW.Child.LastUpdate")
	storageutil.UnsetFormValue(self as form, "FW.Child.Father")
	storageutil.UnsetFormValue(self as form, "FW.Child.Mother")
	storageutil.UnsetStringValue(self as form, "FW.Child.Name")
	storageutil.UnsetIntValue(self as form, "FW.Child.Flag")
endFunction

function OnUpdateGameTime()

	storageutil.SetFloatValue(self as form, "FW.Child.LastUpdate", utility.GetCurrentGameTime())
	self.UpdateSize()
	self.RegisterForSingleUpdateGameTime(5.00000)
endFunction

function OnLoad()

	Int flag = storageutil.GetIntValue(self as form, "FW.Child.Flag", 0)
	bIsVampire = math.LogicalAnd(flag, 1) == 1
	if math.LogicalAnd(flag, 4) == 4
		iSex = 1
	else
		iSex = 0
	endIf
	Name = storageutil.GetStringValue(self as form, "FW.Child.Name", "")
	if math.LogicalAnd(flag, 2) == 2
		HairColor = _Father.GetLeveledActorBase().GetHairColor()
	else
		HairColor = _Mother.GetLeveledActorBase().GetHairColor()
	endIf
	_Father = storageutil.GetFormValue(self as form, "FW.Child.Father", none) as actor
	_Mother = storageutil.GetFormValue(self as form, "FW.Child.Mother", none) as actor
	self.RegisterForSingleUpdateGameTime(5.00000)
	self.OnUpdateGameTime()
endFunction

function SetName(String newName)

	Name = newName
	storageutil.SetStringValue(self as form, "FW.Child.Name", newName)
endFunction

; Skipped compiler generated GetState

; Skipped compiler generated GotoState

ColorForm function GetHairColor()

	return HairColor
endFunction

function SetVampire(Bool bVamp)

	Int xflag = storageutil.GetIntValue(self as form, "FW.Child.Flag", 0)
	if math.LogicalAnd(xflag, 1) == 1 && bVamp == false
		storageutil.SetIntValue(self as form, "FW.Child.Flag", math.LogicalXor(xflag, 1))
	elseIf math.LogicalAnd(xflag, 1) == 0 && bVamp == true
		storageutil.SetIntValue(self as form, "FW.Child.Flag", math.LogicalOr(xflag, 1))
	endIf
	bIsVampire = bVamp
endFunction

Int function GetSex()

	return iSex
endFunction
