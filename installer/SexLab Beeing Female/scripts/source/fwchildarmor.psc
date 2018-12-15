;/ Decompiled by Champollion V1.0.1
Source   : FWChildArmor.psc
Modified : 2017-01-14 16:10:37
Compiled : 2017-01-18 08:35:40
User     : admin
Computer : PATRICK
/;
scriptName FWChildArmor extends ObjectReference

;-- Properties --------------------------------------
Float property DayOfBirth hidden
	Float function get()

		return dob
	endFunction
endproperty
spell property BabyDrink auto
actor property Mother hidden
	actor function get()

		return _Mother
	endFunction
endproperty
spell property BabySupprised auto
String property Name hidden
	String function get()

		return _xName
	endFunction
	function set(String value)

		if value == ""
			return 
		endIf
		String LastName = self.GetLastName()
		storageutil.SetStringValue(self as form, "FW.Child.Name", value)
		if value == _xName
			return 
		endIf
		_xName = value
		self.SetName(_xName)
		String _lName = LastName
		if _xName == "" && _lName == ""
			self.SetDisplayName(Content.BabyBlankName, false)
		elseIf _xName == ""
			self.SetDisplayName(fwutility.MultiStringReplace(Content.BabyName, _lName, "", "", "", "", ""), false)
		elseIf _lName == ""
			self.SetDisplayName(fwutility.MultiStringReplace(Content.BabyName, _xName, "", "", "", "", ""), false)
		else
			self.SetDisplayName(fwutility.MultiStringReplace(Content.BabyName, _xName, _lName, "", "", "", ""), false)
		endIf
	endFunction
endproperty
actor property Father hidden
	actor function get()

		return _Father
	endFunction
endproperty
formlist property ItemListHappy auto
spell property BabyHiccup auto
spell property BabyHappy auto
spell property BabyCry auto
fwtextcontents property Content auto
Float property SizeDuration = 30.0000 auto
Float property SmallSizeScale = 0.600000 auto
Bool property IsFemale hidden
	Bool function get()

		return iSex == 1
	endFunction
	function set(Bool value)

		if value == true
			iSex = 1
		else
			iSex = 0
		endIf
	endFunction
endproperty
spell property BabyAmuse auto
Bool property IsMale hidden
	Bool function get()

		return iSex == 1
	endFunction
	function set(Bool value)

		if value == true
			iSex = 0
		else
			iSex = 1
		endIf
	endFunction
endproperty
spell property BabyTalk auto
Bool property UseFathersLastName hidden
	Bool function get()

		return bUseFathersLastName
	endFunction
	function set(Bool value)

		Int xflag = storageutil.GetIntValue(self as form, "FW.Child.Flag", 0)
		if value == true
			storageutil.SetIntValue(self as form, "FW.Child.Flag", math.LogicalOr(xflag, 32))
		else
			storageutil.SetIntValue(self as form, "FW.Child.Flag", math.LogicalXor(xflag, 32))
		endIf
		if self.Name == ""
			return 
		endIf
		String LastName = self.GetLastName()
		self.SetName(self.Name)
		bUseFathersLastName = value
	endFunction
endproperty
race property ChildRace hidden
	race function get()

		return storageutil.GetFormValue(self as form, "FW.Child.Race", none) as race
	endFunction
	function set(race value)

		storageutil.SetFormValue(self as form, "FW.Child.Race", value as form)
	endFunction
endproperty
Float property Age hidden
	Float function get()

		return utility.GetCurrentGameTime() - dob
	endFunction
endproperty
spell property BabyGiggle auto
spell property BabyFear auto
formlist property ItemListSupprised auto
formlist property ItemListFear auto
spell property BabyLaugh auto

;-- Variables ---------------------------------------
actor _Father
Bool bUseFathersLastName
Float dob = 0.000000
Int iSex
ColorForm HairColor
actor User
actor _Mother
Bool bIsVampire = false
String _xName = ""

;-- Functions ---------------------------------------

; Skipped compiler generated GotoState

ColorForm function GetHairColor()

	return HairColor
endFunction

; Skipped compiler generated GetState

function OnEquipped(actor akActor)

	if self.GetName() == "Baby" || self.GetName() == "" || self.GetDisplayName() == "Baby" || self.GetDisplayName() == "" || _xName == "Baby" || _xName == "" || storageutil.GetStringValue(self as form, "FW.Child.Name", "") == ""
		Int xflag = storageutil.GetIntValue(self as form, "FW.Child.Flag", -1)
		if xflag == -1
			fwsystem.ChildItemSetup(self as form, -1, none, none)
		elseIf math.LogicalAnd(xflag, 4) == 0
			self.Name = fwsystem.getRandomChildName(0)
		elseIf math.LogicalAnd(xflag, 4) == 0
			self.Name = fwsystem.getRandomChildName(1)
		endIf
	endIf
endFunction

function OnLoad()

	Int flag = storageutil.GetIntValue(self as form, "FW.Child.Flag", 0)
	bIsVampire = math.LogicalAnd(flag, 1) == 1
	if math.LogicalAnd(flag, 4) == 4
		iSex = 1
	else
		iSex = 0
	endIf
	self.Name = storageutil.GetStringValue(self as form, "FW.Child.Name", "")
	if math.LogicalAnd(flag, 2) == 2
		HairColor = _Father.GetLeveledActorBase().GetHairColor()
	else
		HairColor = _Mother.GetLeveledActorBase().GetHairColor()
	endIf
	_Father = storageutil.GetFormValue(self as form, "FW.Child.Father", none) as actor
	_Mother = storageutil.GetFormValue(self as form, "FW.Child.Mother", none) as actor
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

String function GetName()

	return self.Name
endFunction

Int function GetSex()

	return iSex
endFunction

String function GetLastName()

	String LastName = ""
	Int xflag = storageutil.GetIntValue(self as form, "FW.Child.Flag", 0)
	if self.Mother == game.GetPlayer() || self.Father == game.GetPlayer()
		return " Dovahkiir"
	endIf
	if math.LogicalAnd(xflag, 32) == 32
		LastName = self.GetActorsLastName(self.Father)
	endIf
	if LastName == ""
		LastName = self.GetActorsLastName(self.Mother)
	endIf
	return LastName
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

function SetName(String newName)

	parent.SetName(newName + " " + self.GetLastName())
	self.Name = newName
endFunction

function SetParent(actor Mother, actor Father)

	storageutil.SetFormValue(self as form, "FW.Child.Father", self.Father as form)
	storageutil.SetFormValue(self as form, "FW.Child.Mother", self.Mother as form)
	storageutil.SetFloatValue(self as form, "FW.Child.LastUpdate", utility.GetCurrentGameTime())
	_Father = self.Father
	_Mother = self.Mother
endFunction

function Delete()

	storageutil.UnsetFloatValue(self as form, "FW.Child.LastUpdate")
	storageutil.UnsetFormValue(self as form, "FW.Child.Father")
	storageutil.UnsetFormValue(self as form, "FW.Child.Mother")
	storageutil.UnsetStringValue(self as form, "FW.Child.Name")
	storageutil.UnsetIntValue(self as form, "FW.Child.Flag")
endFunction

Bool function IsVampire()

	return bIsVampire
endFunction

String function GetActorsLastName(actor a)

	if a == none
		return ""
	endIf
	String Name1 = a.GetName()
	String Name2 = a.GetDisplayName()
	actorbase ab = a.GetLeveledActorBase()
	if ab != none
		if stringutil.GetLength(ab.GetName()) > stringutil.GetLength(Name1)
			Name1 = ab.GetName()
		endIf
	endIf
	Int lName1 = stringutil.GetLength(Name1)
	Int lName2 = stringutil.GetLength(Name2)
	if lName1 > lName2
		return stringutil.Substring(Name1, lName2, 0)
	elseIf lName1 < lName2
		return stringutil.Substring(Name2, lName1, 0)
	endIf
	return ""
endFunction
