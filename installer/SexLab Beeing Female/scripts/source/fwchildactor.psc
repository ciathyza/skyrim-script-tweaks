;/ Decompiled by Champollion V1.0.1
Source   : FWChildActor.psc
Modified : 2017-01-14 16:10:51
Compiled : 2017-01-18 08:35:43
User     : admin
Computer : PATRICK
/;
scriptName FWChildActor extends Actor conditional

;-- Properties --------------------------------------
Int property GetOtherParentRank hidden
	Int function get()

		if ChildSettings.Faction_OtherParent == none
			return 0
		else
			return self.GetFactionRank(ChildSettings.Faction_OtherParent)
		endIf
	endFunction
endproperty
Float property Age hidden
	Float function get()

		if dob == 0.000000
			dob = storageutil.GetFloatValue(self as form, "FW.Child.DOB", 0.000000)
		endIf
		return utility.GetCurrentGameTime() - dob
	endFunction
endproperty
Actor property Follow auto conditional hidden
Float property DayOfBirth hidden
	Float function get()

		if dob == 0.000000
			dob = storageutil.GetFloatValue(self as form, "FW.Child.DOB", 0.000000)
		endIf
		return dob
	endFunction
	function set(Float value)

		dob = value
		storageutil.SetFloatValue(self as form, "FW.Child.DOB", value)
	endFunction
endproperty
Float property SizeDuration
	Float function get()

		return _SizeDuration
	endFunction
	function set(Float value)

		_SizeDuration = value
		self.UpdateSize()
	endFunction
endproperty
Int property Sex hidden
	Int function get()

		return iSex
	endFunction
	function set(Int value)

		iSex = value
	endFunction
endproperty
Bool property HasMagicka = false auto
Bool property IsVampire hidden
	Bool function get()

		return bIsVampire
	endFunction
	function set(Bool value)

		Int xflag = storageutil.GetIntValue(self as form, "FW.Child.Flag", 0)
		if math.LogicalAnd(xflag, 1) == 1 && value == false
			storageutil.SetIntValue(self as form, "FW.Child.Flag", math.LogicalXor(xflag, 1))
		elseIf math.LogicalAnd(xflag, 1) == 0 && value == true
			storageutil.SetIntValue(self as form, "FW.Child.Flag", math.LogicalOr(xflag, 1))
		endIf
		bIsVampire = value
	endFunction
endproperty
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
race property ChildRace hidden
	race function get()

		return storageutil.GetFormValue(self as form, "FW.Child.Race", none) as race
	endFunction
	function set(race value)

		storageutil.SetFormValue(self as form, "FW.Child.Race", value as form)
	endFunction
endproperty
Bool property IsLearning
	Bool function get()

		return bIsLearning
	endFunction
endproperty
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
Actor property Mother hidden
	Actor function get()

		if _Mother == none
			_Mother = storageutil.GetFormValue(self as form, "FW.Child.Mother", none) as Actor
		endIf
		return _Mother
	endFunction
	function set(Actor value)

		if _Mother != none
			self.SetRelationshipRank(_Mother, 0)
			self.Mother.SetRelationshipRank(self as Actor, 0)
		endIf
		storageutil.SetFormValue(self as form, "FW.Child.Mother", value as form)
		if _Mother == game.GetPlayer()
			ChildSettings.RemovePlayerChild(self)
		endIf
		_Mother = value
		if value == game.GetPlayer()
			ChildSettings.AddPlayerChild(self)
		endIf
		if _Mother != none
			self.SetRelationshipRank(_Mother, ChildSettings.ParentRelationShipLevel)
			_Mother.SetRelationshipRank(_Mother, ChildSettings.ParentRelationShipLevel)
		endIf
	endFunction
endproperty
Float property PlayerLastSeen = 0.000000 auto hidden
Bool property CanWearWeapons = false auto
Int property Order hidden
	Int function get()

		return _order
	endFunction
	function set(Int value)

		if value == 0
			self.Order_Wait()
		elseIf value == 1
			self.Order_WaitAndPlay()
		elseIf value == 10
			self.Order_FollowAndPlayOther()
		elseIf value == 11
			self.Order_GoHome()
		elseIf value == 12
			self.Order_MeetPlace()
		elseIf value == 30
			if _Mother == game.GetPlayer() || _Father == game.GetPlayer()
				self.Order_Follow(game.GetPlayer())
			endIf
		elseIf value == 31
			if _Mother == game.GetPlayer() || _Father == game.GetPlayer()
				self.Order_FollowAndPlay(game.GetPlayer())
			endIf
		elseIf value == 99
			self.Order_LeaveMeAlone()
		else
			_order = value
			self.RefreshAI()
		endIf
	endFunction
endproperty
Float property SmallSizeScale
	Float function get()

		return _SmallSizeScale
	endFunction
	function set(Float value)

		_SmallSizeScale = value
		self.UpdateSize()
	endFunction
endproperty
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
		if _Name == ""
			return 
		endIf
		String LastName = self.GetLastName()
		parent.SetName(_Name)
		self.SetDisplayName(_Name + LastName, true)
		bUseFathersLastName = value
	endFunction
endproperty
fwchildsettings property ChildSettings auto
String property Name hidden
	String function get()

		return _Name
	endFunction
	function set(String value)

		if value == ""
			return 
		endIf
		_Name = value
		String LastName = self.GetLastName()
		parent.SetName(_Name)
		self.SetDisplayName(_Name + LastName, true)
	endFunction
endproperty
Actor property Father hidden
	Actor function get()

		if _Father == none
			_Father = storageutil.GetFormValue(self as form, "FW.Child.Father", none) as Actor
		endIf
		return _Father
	endFunction
	function set(Actor value)

		if _Father != none
			self.SetRelationshipRank(_Father, 0)
			_Father.SetRelationshipRank(self as Actor, 0)
		endIf
		storageutil.SetFormValue(self as form, "FW.Child.Father", value as form)
		if _Father == game.GetPlayer()
			ChildSettings.RemovePlayerChild(self)
		endIf
		_Father = value
		if value == game.GetPlayer()
			ChildSettings.AddPlayerChild(self)
		endIf
		if _Father != none
			self.SetRelationshipRank(_Father, ChildSettings.ParentRelationShipLevel)
			_Father.SetRelationshipRank(self as Actor, ChildSettings.ParentRelationShipLevel)
		endIf
	endFunction
endproperty

;-- Variables ---------------------------------------
Int _order = 0
Bool bIsLearning = false
Int iSex
String _Name = ""
Bool bInventoryChangedWheelLearning = false
Float dontSleepStart = 0.000000
Bool bGivePerkRunning = false
Bool bOnLoadRunning = false
Float FollowPositionX = 0.000000
Actor _Father
Float _SmallSizeScale
Float DoFavourStart = 0.000000
Bool bUseFathersLastName
Actor _Mother
ColorForm HairColor
Bool bIsVampire = false
Float _SizeDuration
Float dob = 0.000000
Float FollowPositionY = 0.000000

;-- Functions ---------------------------------------

Bool function IsNearActor(Actor akTarget, Float Distance)

	cell targetCell = self.GetParentCell()
	cell playerCell = akTarget.GetParentCell()
	if targetCell != playerCell
		if targetCell as Bool && targetCell.IsInterior() || playerCell as Bool && playerCell.IsInterior()
			return false
		elseIf akTarget.GetDistance(self as objectreference) > Distance
			return false
		else
			return true
		endIf
	else
		return true
	endIf
endFunction

function SetHairColor(ColorForm newColor)

	HairColor = newColor
	self.GetActorBase().SetHairColor(newColor)
	self.QueueNiNodeUpdate()
endFunction

function OnUpdateGameTime()

	if self.GetType() == 62
		if self.IsDead() == false
			storageutil.SetFloatValue(self as form, "FW.Child.LastUpdate", utility.GetCurrentGameTime())
			self.UpdateSize()
			self.UpdateStats()
			self.RefreshFactions()
		endIf
	endIf
endFunction

Bool function HasFamilyRelationship(Actor akOther)

	if akOther == _Mother || akOther == _Father
		return true
	else
		return parent.HasFamilyRelationship(akOther)
	endIf
endFunction

; Skipped compiler generated GetState

function AddExperience(Float Amount)

	if self.GetLevel() < game.GetPlayer().GetLevel()
		self.ModAV("Experience", Amount)
	endIf
endFunction

function OnInit()

	self.OnPlayerLoadGame()
endFunction

function AddLevel(Int Amount)

	if Amount > 0
		Int newLevel = self.GetLevel() + Amount
		if newLevel > fwchildsettings.ChildMaxLevel()
			newLevel = fwchildsettings.ChildMaxLevel()
		endIf
		storageutil.SetIntValue(self as form, "FW.Child.Level", newLevel)
	endIf
endFunction

function OnLoad()

	self.OnPlayerLoadGame()
endFunction

function Order_DontSleepNow()

	dontSleepStart = utility.GetCurrentGameTime()
	self.SetFactionRank(ChildSettings.Faction_MaySleep, 0)
	self.RefreshAI()
endFunction

Int function GetRelationshipRank(Actor akOther)

	if akOther == _Father || akOther == _Mother
		if parent.GetRelationshipRank(akOther) != ChildSettings.ParentRelationShipLevel
			self.SetRelationshipRank(akOther, ChildSettings.ParentRelationShipLevel)
		endIf
		if akOther.GetRelationshipRank(self as Actor) != ChildSettings.ParentRelationShipLevel
			akOther.SetRelationshipRank(self as Actor, ChildSettings.ParentRelationShipLevel)
		endIf
		return 2
	else
		return parent.GetRelationshipRank(akOther)
	endIf
endFunction

Float function GetBaseActorValue(String asValueName)

	if asValueName == "Comprehension"
		return 15.0000
	elseIf asValueName == "SkillPoints"
		return 0.000000
	elseIf asValueName == "PerkPoints"
		return 0.000000
	elseIf asValueName == "Experience"
		return 0.000000
	endIf
	return parent.GetBaseActorValue(asValueName)
endFunction

Int function calculateSkillPoints()

	Float BasePoints = 126.000
	Float CurPoints = 0.000000
	CurPoints += storageutil.GetFloatValue(self as form, "FW.Child.StatComprehension", self.GetAV("Comprehension"))
	CurPoints += storageutil.GetFloatValue(self as form, "FW.Child.StatDestruction", self.GetAV("Destruction"))
	CurPoints += storageutil.GetFloatValue(self as form, "FW.Child.StatIllusion", self.GetAV("Illusion"))
	CurPoints += storageutil.GetFloatValue(self as form, "FW.Child.StatConjuration", self.GetAV("Conjuration"))
	CurPoints += storageutil.GetFloatValue(self as form, "FW.Child.StatRestoration", self.GetAV("Restoration"))
	CurPoints += storageutil.GetFloatValue(self as form, "FW.Child.StatAlteration", self.GetAV("Alteration"))
	CurPoints += storageutil.GetFloatValue(self as form, "FW.Child.StatBlock", self.GetAV("Block"))
	CurPoints += storageutil.GetFloatValue(self as form, "FW.Child.StatOneHanded", self.GetAV("OneHanded"))
	CurPoints += storageutil.GetFloatValue(self as form, "FW.Child.StatTwoHanded", self.GetAV("TwoHanded"))
	CurPoints += storageutil.GetFloatValue(self as form, "FW.Child.StatMarksman", self.GetAV("Marksman"))
	CurPoints += storageutil.GetFloatValue(self as form, "FW.Child.StatSneak", self.GetAV("Sneak"))
	CurPoints += storageutil.GetFloatValue(self as form, "FW.Child.StatMagicka", self.GetAV("Magicka")) / 5.00000
	CurPoints += storageutil.GetFloatValue(self as form, "FW.Child.StatCarryWeight", self.GetAV("CarryWeight")) / 5.00000
	CurPoints += storageutil.GetFloatValue(self as form, "FW.Child.StatHealth", self.GetAV("Health")) / 5.00000
	return (self.GetLevel() - 1) * ChildSettings.SkillpointsPerLevel - (CurPoints - BasePoints) as Int
endFunction

function SetStateValue(String StateName, Float BaseValue)

	Float val1 = BaseValue
	Float val2 = BaseValue
	if self.Mother != none
		val1 = self.Mother.GetAV(StateName)
	endIf
	if self.Father != none
		val2 = self.Father.GetAV(StateName)
	endIf
	Float newVal = (val1 + val2) / 2.00000
	self.SetAV(StateName, newVal)
endFunction

function GivePerks()

	if bGivePerkRunning == true
		return 
	endIf
	bGivePerkRunning = true
	Int i = ChildSettings.ChildPerkFile.length
	while i > 0
		i -= 1
		self.handlePerk(i)
	endWhile
	bGivePerkRunning = false
endFunction

function DeleteChild()

	self.UnregisterForUpdate()
	self.RegisterForUpdate(3.00000)
	self.RemoveFromAllFactions()
	self.AllowPCDialogue(false)
	self.GotoState("MarkForDelete")
endFunction

function ForceActorValue(String asValueName, Float afNewValue)

	if self.IsSpecialAV(asValueName)
		storageutil.SetFloatValue(self as form, "FW.Child.Stat" + asValueName, afNewValue)
	endIf
	if asValueName != "Comprehension" && asValueName != "SkillPoints" && asValueName != "PerkPoints" && asValueName != "Experience"
		parent.ForceActorValue(asValueName, afNewValue)
	endIf
endFunction

function Order_GoToOtherParent()

	self.Order_FollowAndPlayOther()
	self.RefreshAI()
	self.GotoState("None")
endFunction

function Upgrade(Int oldVersion, Int newVersion)

	if oldVersion < 9
		self.RemoveFromFaction(game.GetFormFromFile(378958, "Skyrim.esm") as faction)
	endIf
endFunction

function RefreshFactions()

	if self.GetType() != 62
		return 
	elseIf !ChildSettings
		return 
	elseIf !ChildSettings.Factions_To_Transfer
		return 
	endIf
	if self.Mother
		faction[] fa = self.Mother.GetFactions(-10, 20)
		Int i = fwutility.MinInt(fa.length, 25)
		while i > 0
			i -= 1
			if fa[i]
				if ChildSettings.Factions_To_Transfer.HasForm(fa[i] as form)
					Int r1 = self.Mother.GetFactionRank(fa[i])
					Int r2 = self.GetFactionRank(fa[i])
					Int FaRank = fwutility.MaxInt(r1, r2)
					self.SetFactionRank(fa[i], FaRank)
				endIf
			endIf
		endWhile
	endIf
	if self.Father
		faction[] fa = self.Father.GetFactions(-10, 20)
		Int i = fwutility.MinInt(fa.length, 25)
		while i > 0
			i -= 1
			if fa[i]
				if ChildSettings.Factions_To_Transfer.HasForm(fa[i] as form)
					Int r1 = self.Father.GetFactionRank(fa[i])
					Int r2 = self.GetFactionRank(fa[i])
					Int farank = fwutility.MaxInt(r1, r2)
					self.SetFactionRank(fa[i], farank)
				endIf
			endIf
		endWhile
	endIf
endFunction

function handlePerk(Int p)

	if self.GetType() == 0
		return 
	endIf
	if ChildSettings == none
		return 
	endIf
	if ChildSettings.GetType() == 0
		return 
	endIf
	if ChildSettings.ChildPerkFile.length <= 0
		return 
	endIf
	if p >= 0
		if ChildSettings.ChildPerkFile[p] == ""
			return 
		endIf
		Int pos = storageutil.StringListFind(self as form, "FW.Child.Perks", ChildSettings.ChildPerkFile[p])
		if pos >= 0
			Bool bUseAllSpells = ChildSettings.ChildPerkBool[p]
			Int level = storageutil.IntListGet(self as form, "FW.Child.PerksLevel", pos)
			Int num = ChildSettings.ChildPerkRank[p]
			Int rankID = 0
			while rankID < num
				rankID += 1
				String modName = fwutility.ModFile(fwutility.getIniCString("ChildPerk", ChildSettings.ChildPerkFile[p], "Rank" + rankID as String, "modName", ""))
				Int formID = fwutility.getIniCInt("ChildPerk", ChildSettings.ChildPerkFile[p], "Rank" + rankID as String, "formID", 0)
				if modName != "" && formID > 1
					form frm = game.GetFormFromFile(formID, modName)
					if frm != none
						spell S = frm as spell
						faction f = frm as faction
						armor a = frm as armor
						shout sh = frm as shout
						if S != none
							if self.HasSpell(S as form) == false && (rankID == level || rankID < level && bUseAllSpells)
								self.AddSpell(S, true)
							elseIf self.HasSpell(S as form) == true
								if rankID > level || rankID < level && !bUseAllSpells
									self.RemoveSpell(S)
								else
									Int j = S.GetNumEffects()
									while j > 0
										j -= 1
										magiceffect me = S.GetNthEffectMagicEffect(j)
										if self.HasMagicEffect(me) == false
											j = 0
											self.RemoveSpell(S)
											self.AddSpell(S, true)
										endIf
									endWhile
								endIf
							endIf
						elseIf f != none
							if rankID == level || rankID < level && bUseAllSpells
								self.AddToFaction(f)
							elseIf rankID > level || rankID < level && !bUseAllSpells
								self.RemoveFromFaction(f)
							endIf
						elseIf a != none
							if rankID == level || rankID < level && bUseAllSpells
								if self.GetItemCount(a as form) == 0
									self.AddItem(a as form, 1, false)
								endIf
							elseIf rankID > level || rankID < level && !bUseAllSpells
								if self.GetItemCount(a as form) > 0
									self.RemoveItem(a as form, 1, false, none)
								endIf
							endIf
						elseIf sh != none
							if rankID == level || rankID < level && bUseAllSpells
								if self.HasSpell(sh as form) == false
									self.AddShout(sh)
								endIf
							elseIf rankID > level || rankID < level && !bUseAllSpells
								if self.HasSpell(sh as form) == true
									self.RemoveShout(sh)
								endIf
							endIf
						elseIf frm == none
							debug.Trace("Perk not Found: " + ChildSettings.ChildPerkFile[p] + "[" + rankID as String + "]::No Form - " + modName + " " + formID as String, 0)
						else
							debug.Trace("Perk not Found: " + ChildSettings.ChildPerkFile[p] + "[" + rankID as String + "]::" + frm.GetName(), 0)
						endIf
					else
						debug.Trace("Perk not Found: " + ChildSettings.ChildPerkFile[p] + "[" + rankID as String + "]::No Form - " + modName + " " + formID as String, 0)
					endIf
				endIf
			endWhile
		elseIf p >= 0
			Int num = ChildSettings.ChildPerkRank[p]
			String pF = ChildSettings.ChildPerkFile[p]
			Int rankid = 0
			while rankid < num
				rankid += 1
				String mf = fwutility.getIniCString("ChildPerk", pF, "Rank" + rankid as String, "modName", "")
				String mN = fwutility.ModFile(mf)
				Int formid = fwutility.getIniCInt("ChildPerk", pF, "Rank" + rankid as String, "formID", 0)
				if mN != "" && formid > 1
					form frm = game.GetFormFromFile(formid, mN)
					if frm != none
						spell s = frm as spell
						faction f = frm as faction
						armor a = frm as armor
						shout sh = frm as shout
						if s != none
							if self.HasSpell(s as form)
								self.RemoveSpell(s)
							endIf
						elseIf f != none
							self.RemoveFromFaction(f)
						elseIf a != none
							if self.GetItemCount(a as form) > 0
								self.RemoveItem(a as form, 1, false, none)
							endIf
						elseIf sh != none
							if self.HasSpell(sh as form) == true
								self.RemoveShout(sh)
							endIf
						endIf
					endIf
				endIf
			endWhile
		endIf
	endIf
endFunction

function SetExperience(Float newExp)

	self.SetAV("Experience", newExp)
endFunction

; Skipped compiler generated GotoState

function Order_FollowAndPlay(Actor ActorToFollow)

	if ActorToFollow == none
		ActorToFollow = game.GetPlayer()
	endIf
	if ActorToFollow == game.GetPlayer()
		_order = 31
		self.SetPlayerTeammate(true, true)
	else
		ChildSettings.SetOtherParentAlias(none, false)
		_order = 10
	endIf
	Follow = ActorToFollow
	self.RefreshAI()
	self.GotoState("Follow")
endFunction

function CheckInventory()

	Int c = self.GetNumItems()
	while c > 0
		if bInventoryChangedWheelLearning == true
			c = self.GetNumItems()
			bInventoryChangedWheelLearning = false
		endIf
		c -= 1
		book b = self.GetNthForm(c) as book
		if b != none
			self.learnSpell(b)
		endIf
	endWhile
	bIsLearning = false
endFunction

function SetActorValue(String asValueName, Float afValue)

	if self.IsSpecialAV(asValueName)
		storageutil.SetFloatValue(self as form, "FW.Child.Stat" + asValueName, afValue)
	endIf
	if asValueName != "Comprehension" && asValueName != "SkillPoints" && asValueName != "PerkPoints" && asValueName != "Experience"
		parent.SetActorValue(asValueName, afValue)
	endIf
	if asValueName == "Experience"
		self.CheckForLevelUp()
	endIf
endFunction

String function GetActorsLastName(Actor a)

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

function Order_Wait()

	_order = 0
	PlayerLastSeen = utility.GetCurrentGameTime()
	self.RefreshAI()
	self.GotoState("Wait")
endFunction

function Order_GoHome()

	_order = 11
	ChildSettings.SetHouseAlias()
	self.RefreshAI()
	self.GotoState("None")
endFunction

function RefreshActorValue(String ActorValue, Float BaseValue)

	if BaseValue < 0.000000
		BaseValue = self.GetBaseActorValue(ActorValue)
	endIf
	Float pav = parent.GetActorValue(ActorValue)
	Float cav = storageutil.GetFloatValue(self as form, "FW.Child.Stat" + ActorValue, pav)
	if pav != cav
		self.SetActorValue(ActorValue, cav)
		parent.SetActorValue(ActorValue, cav)
	endIf
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

function SetParent(Actor akMother, Actor akFather)

	storageutil.SetFloatValue(self as form, "FW.Child.LastUpdate", utility.GetCurrentGameTime())
	self.Father = akFather
	self.Mother = akMother
	if self.Mother == game.GetPlayer() || self.Father == game.GetPlayer()
		ChildSettings.AddPlayerChild(self)
	endIf
endFunction

Float function GetExperience()

	return self.GetAV("Experience")
endFunction

function Order_SetMeetPlace()

	ChildSettings.SetMeetPoint(none)
	if _order == 12
		self.RefreshAI()
	endIf
endFunction

function InitChild()

	_Father = storageutil.GetFormValue(self as form, "FW.Child.Father", none) as Actor
	_Mother = storageutil.GetFormValue(self as form, "FW.Child.Mother", none) as Actor
	Int flag = storageutil.GetIntValue(self as form, "FW.Child.Flag", 0)
	bIsVampire = math.LogicalAnd(flag, 1) == 1
	if math.LogicalAnd(flag, 4) == 4
		iSex = 1
	else
		iSex = 0
	endIf
	self.Name = storageutil.GetStringValue(self as form, "FW.Child.Name", "")
	if (math.LogicalAnd(flag, 2) == 2 || self.Mother == none) && self.Father != none
		HairColor = _Father.GetLeveledActorBase().GetHairColor()
	elseIf self.Mother != none
		HairColor = _Mother.GetLeveledActorBase().GetHairColor()
	endIf
	if _Mother != none
		self.SetRelationshipRank(_Mother, ChildSettings.ParentRelationShipLevel)
		_Mother.SetRelationshipRank(self as Actor, ChildSettings.ParentRelationShipLevel)
		if self.Mother == game.GetPlayer()
			ChildSettings.AddPlayerChild(self)
			self.SetFactionOwner(ChildSettings.PlayerFaction)
		endIf
	endIf
	if _Father != none
		self.SetRelationshipRank(_Father, ChildSettings.ParentRelationShipLevel)
		_Father.SetRelationshipRank(self as Actor, ChildSettings.ParentRelationShipLevel)
		if self.Father == game.GetPlayer()
			ChildSettings.AddPlayerChild(self)
			self.SetFactionOwner(ChildSettings.PlayerFaction)
		endIf
	endIf
	self.Order = storageutil.GetIntValue(self as form, "FW.Child.Order", 0)
	self.RefreshFactions()
	if bGivePerkRunning == false
		self.GivePerks()
	endIf
	self.RefreshAI()
	self.UpdateSize()
endFunction

function Order_Follow(Actor ActorToFollow)

	if ActorToFollow == none
		ActorToFollow = game.GetPlayer()
	endIf
	if ActorToFollow == game.GetPlayer()
		_order = 30
	else
		ChildSettings.SetOtherParentAlias(none, true)
		_order = 10
	endIf
	Follow = ActorToFollow
	self.RefreshAI()
	self.GotoState("Follow")
endFunction

function ForceAV(String asValueName, Float afNewValue)

	self.ForceActorValue(asValueName, afNewValue)
endFunction

function SetAV(String asValueName, Float afValue)

	self.SetActorValue(asValueName, afValue)
endFunction

function DebugFactions()

	faction[] f = self.GetFactions(-10, 20)
	faction[] fp = game.GetPlayer().GetFactions(-10, 20)
	faction[] fm = _Mother.GetFactions(-10, 20)
	faction[] ff = _Mother.GetFactions(-10, 20)
	Int c = f.length
	debug.Trace("DebugFactions() " + self.GetDisplayName(), 0)
	while c > 0
		c -= 1
		String logStr = "- [" + f[c].GetFormID() as String + "] " + f[c].GetName() + " " + self.GetFactionRank(f[c]) as String + ": "
		logStr += "[Infamy: " + f[c].GetInfamy() as String + ";" + f[c].GetInfamyNonViolent() as String + ";" + f[c].GetInfamyViolent() as String + "]"
		logStr += "[PlayerReact: " + f[c].GetReaction(ChildSettings.PlayerFaction) as String + "]"
		debug.Notification(logStr)
		debug.Trace("- [" + f[c].GetFormID() as String + "] " + f[c].GetName() + " " + self.GetFactionRank(f[c]) as String + ":", 0)
		debug.Trace("  - Infamy: " + f[c].GetInfamy() as String + ";" + f[c].GetInfamyNonViolent() as String + ";" + f[c].GetInfamyViolent() as String, 0)
		debug.Trace("  - PlayerReact: " + f[c].GetReaction(ChildSettings.PlayerFaction) as String, 0)
		debug.Trace("  - Player Factions:", 0)
		Int cp = fp.length
		while cp > 0
			cp -= 1
			debug.Trace("  - - [" + fp[cp].GetFormID() as String + "] " + fp[cp].GetName() + ": " + f[c].GetReaction(fp[cp]) as String + " / " + fp[cp].GetReaction(f[c]) as String, 0)
		endWhile
		debug.Trace("  - Mother Factions:", 0)
		Int cm = fm.length
		while cm > 0
			cm -= 1
			debug.Trace("  - - [" + fm[cm].GetFormID() as String + "] " + fm[cm].GetName() + ": " + f[c].GetReaction(fm[cm]) as String + " / " + fm[cm].GetReaction(f[c]) as String, 0)
		endWhile
		debug.Trace("  - Father Factions:", 0)
		Int cf = ff.length
		while cf > 0
			cf -= 1
			debug.Trace("  - - [" + ff[cf].GetFormID() as String + "] " + ff[cf].GetName() + ": " + f[c].GetReaction(ff[cf]) as String + " / " + ff[cf].GetReaction(f[c]) as String, 0)
		endWhile
	endWhile
endFunction

function OnActivate(objectreference akActionRef)

	Actor a = akActionRef as Actor
	if a.GetType() == 62 && self.GetType() == 62
		if self.IsBleedingOut() == true
			if a.IsInCombat() == false
				self.RestoreActorValue("Health", 9999.00)
				self.DamageActorValue("Health", self.GetActorValue("Health") - 10.0000)
			endIf
		endIf
		if a == _Father || a == _Mother
			self.SetRelationshipRank(a, ChildSettings.ParentRelationShipLevel)
			a.SetRelationshipRank(self as Actor, ChildSettings.ParentRelationShipLevel)
		else
			self.SetRelationshipRank(a, 0)
		endIf
		self.EvaluatePackage()
	endIf
	if storageutil.FormListHas(none, "FW.Babys", self as form) == false
		storageutil.FormListAdd(none, "FW.Babys", self as form, true)
	endIf
endFunction

FWChildActorBase function GetChildActorBase()

	return self.GetBaseObject() as FWChildActorBase
endFunction

String function GetName()

	return _Name
endFunction

function CheckForLevelUp()

	Int LevelUpCount = 0
	Int level = self.GetLevel()
	Int PlayerLevel = game.GetPlayer().GetLevel()
	Float exp = self.GetExp()
	Bool bRunning = true
	Int max = 30
	while bRunning
		Float expForLevel = ChildSettings.GetExperience(level)
		if exp < expForLevel
			bRunning = false
		endIf
		if level >= fwchildsettings.ChildMaxLevel()
			bRunning = false
		endIf
		if level > PlayerLevel
			bRunning = false
		endIf
		if bRunning == true
			exp -= expForLevel
			level += 1
			LevelUpCount += 1
		endIf
		if max <= 0
			bRunning = false
		endIf
		max -= 1
	endWhile
	if LevelUpCount > 0
		storageutil.SetFloatValue(self as form, "FW.Child.StatExperience", exp)
		self.SetLevel(level)
		if bIsLearning == false
			self.CheckInventory()
		endIf
	endIf
endFunction

Bool function IsSpecialAV(String av)

	if av == "Comprehension"
		return true
	elseIf av == "Destruction"
		return true
	elseIf av == "Illusion"
		return true
	elseIf av == "Conjuration"
		return true
	elseIf av == "Magicka"
		return true
	elseIf av == "CarryWeight"
		return true
	elseIf av == "Alteration"
		return true
	elseIf av == "Block"
		return true
	elseIf av == "Restoration"
		return true
	elseIf av == "OneHanded"
		return true
	elseIf av == "TwoHanded"
		return true
	elseIf av == "Marksman"
		return true
	elseIf av == "Health"
		return true
	elseIf av == "Sneak"
		return true
	elseIf av == "Experience"
		return true
	elseIf av == "SkillPoints"
		return true
	elseIf av == "PerkPoints"
		return true
	endIf
	return false
endFunction

function SetExp(Float newExp)

	self.SetExperience(newExp)
endFunction

Float function GetBaseAV(String asValueName)

	return self.GetBaseActorValue(asValueName)
endFunction

function ModAV(String asValueName, Float afAmount)

	self.ModActorValue(asValueName, afAmount)
endFunction

Float function GetActorValue(String asValueName)

	if asValueName != "Comprehension"
		return storageutil.GetFloatValue(self as form, "FW.Child.Stat" + asValueName, 0.000000)
	elseIf asValueName != "SkillPoints"
		return storageutil.GetFloatValue(self as form, "FW.Child.Stat" + asValueName, 0.000000)
	elseIf asValueName != "PerkPoints"
		return storageutil.GetFloatValue(self as form, "FW.Child.Stat" + asValueName, 0.000000)
	endIf
	if asValueName != "Comprehension" && asValueName != "SkillPoints" && asValueName != "PerkPoints" && asValueName != "Experience"
		return parent.GetActorValue(asValueName)
	endIf
endFunction

Float function GetActorValuePercentage(String asValueName)

	if asValueName == "Comprehension"
		return self.GetActorValue(asValueName) / 100.000
	elseIf asValueName == "SkillPoints"
		return self.GetActorValue(asValueName) / (self.GetLevel() * 5) as Float
	elseIf asValueName == "PerkPoints"
		return self.GetActorValue(asValueName) / self.GetLevel() as Float
	elseIf asValueName == "Experience"
		return self.GetActorValue(asValueName) / ChildSettings.GetExperience(self.GetLevel())
	endIf
	if asValueName != "Comprehension" && asValueName != "SkillPoints" && asValueName != "PerkPoints"
		return parent.GetActorValuePercentage(asValueName)
	endIf
endFunction

Int function calculatePerkPoints()

	self.GivePerks()
	Int i = 0
	Int BasePoints = self.GetLevel() - 1
	while i < 128
		String p = ChildSettings.ChildPerkFile[i]
		if p != "" && ChildSettings.ChildPerkEnabled[i] == true
			Int pos = storageutil.StringListFind(self as form, "FW.Child.Perks", p)
			if pos >= 0
				Int currentRank = storageutil.IntListGet(self as form, "FW.Child.PerksLevel", pos)
				BasePoints -= currentRank
			endIf
		endIf
		i += 1
	endWhile
	return BasePoints
endFunction

Float function GetAV(String asValueName)

	return self.GetActorValue(asValueName)
endFunction

function Order_ShowInventory()

	self.OpenInventory(false)
endFunction

Bool function learnSpell(book iBook)

	if HasMagicka == false
		return false
	endIf
	bIsLearning = true
	Bool bLearndSuccess = false
	spell iBookSpell = iBook.GetSpell()
	if iBookSpell != none
		if self.HasSpell(iBookSpell as form) == false && self.IsAllowedSpell(iBookSpell)
			EffectShader ShaderTarget
			EffectShader ShaderSelf
			Float comp = self.GetActorValue("Comprehension")
			utility.Wait(1.00000)
			self.AllowPCDialogue(false)
			if self.IsOnMount() == true
				self.Dismount()
				self.SetVehicle(none)
				utility.Wait(3.00000)
			endIf
			self.SetDontMove(true)
			Float wfp = self.GetActorValue("WaitingForPlayer")
			Float v03 = self.GetActorValue(ChildSettings.OrderAV())
			self.SetActorValue("WaitingForPlayer", 1.00000)
			self.SetActorValue(ChildSettings.OrderAV(), 0.000000)
			self.EvaluatePackage()
			Int HighestRating = 0
			Int i = iBookSpell.GetNumEffects()
			while i > 0
				i -= 1
				magiceffect mFX = iBookSpell.GetNthEffectMagicEffect(i)
				if mFX.GetSkillLevel() > HighestRating
					HighestRating = mFX.GetSkillLevel()
				endIf
				if mFX.GetHitShader() != none
					Int deliv = mFX.GetDeliveryType()
					if deliv == 0
						ShaderSelf = mFX.GetHitShader()
					elseIf deliv == 2 || deliv == 3
						ShaderTarget = mFX.GetHitShader()
					endIf
				endIf
			endWhile
			Float HR = utility.RandomFloat(HighestRating as Float * 0.800000, HighestRating as Float * 1.20000)
			if HR > 100.000
				HR = 100.000
			endIf
			debug.SendAnimationEvent(self as objectreference, "ChildReadBook")
			Float hrDuration = (comp - HighestRating as Float) / 2.00000
			if hrDuration < 0.000000
				hrDuration = 0.000000
			endIf
			utility.Wait(3.00000 + 50.0000 - comp / 2.00000 + hrDuration)
			debug.SendAnimationEvent(self as objectreference, "IdleForceDefaultState")
			utility.Wait(1.00000)
			if comp >= HR
				bLearndSuccess = true
			endIf
			if bLearndSuccess
				self.AddSpell(iBookSpell, true)
				Int j = iBookSpell.GetNumEffects()
				while j > 0
					j -= 1
					magiceffect me = iBookSpell.GetNthEffectMagicEffect(j)
					self.AddExp((me.GetSkillLevel() / 2) as Float)
				endWhile
				self.EquipSpell(iBookSpell, 1)
				self.DrawWeapon()
				utility.Wait(3.00000)
				debug.SendAnimationEvent(self as objectreference, "ChildCastSpell")
				utility.Wait(8.00000)
				if ShaderSelf != none
					ShaderSelf.Play(self as objectreference, 6.00000)
				endIf
				if ShaderTarget != none
					if self.GetDistance(_Mother as objectreference) < 900.000
						ShaderTarget.Play(_Mother as objectreference, 4.00000)
					elseIf self.GetDistance(_Father as objectreference) < 900.000
						ShaderTarget.Play(_Father as objectreference, 4.00000)
					endIf
				endIf
				utility.Wait(4.00000)
			endIf
			self.UnequipSpell(iBookSpell, 1)
			utility.Wait(1.00000)
			debug.SendAnimationEvent(self as objectreference, "ChildSweat")
			utility.Wait(2.00000)
			debug.SendAnimationEvent(self as objectreference, "IdleForceDefaultState")
			self.SetActorValue("WaitingForPlayer", wfp)
			self.SetActorValue(ChildSettings.OrderAV(), v03)
			self.SetDontMove(false)
			self.AllowPCDialogue(true)
			self.EvaluatePackage()
			self.RemoveItem(iBook as form, 1, false, none)
			utility.Wait(1.00000)
		endIf
	endIf
	bIsLearning = false
	return bLearndSuccess
endFunction

function ModActorValue(String asValueName, Float afAmount)

	if self.IsSpecialAV(asValueName)
		storageutil.SetFloatValue(self as form, "FW.Child.Stat" + asValueName, self.GetActorValue(asValueName) + afAmount)
	endIf
	if asValueName == "Experience" && afAmount > 0.000000
		self.CheckForLevelUp()
	endIf
	if asValueName != "Comprehension" && asValueName != "SkillPoints" && asValueName != "PerkPoints" && asValueName != "Experience"
		parent.ModActorValue(asValueName, afAmount)
	endIf
endFunction

function DeleteStats()

	storageutil.UnsetStringValue(self as form, "FW.Child.Name")
	storageutil.UnsetIntValue(self as form, "FW.Child.Flag")
	storageutil.UnsetFloatValue(self as form, "FW.Child.LastUpdate")
	storageutil.UnsetFormValue(self as form, "FW.Child.Mother")
	storageutil.UnsetFormValue(self as form, "FW.Child.Father")
	storageutil.UnsetIntValue(self as form, "FW.Child.Level")
	storageutil.UnsetFloatValue(self as form, "FW.Child.StatExperience")
	storageutil.UnsetFloatValue(self as form, "FW.Child.StatComprehension")
	storageutil.UnsetFloatValue(self as form, "FW.Child.StatDestruction")
	storageutil.UnsetFloatValue(self as form, "FW.Child.StatIllusion")
	storageutil.UnsetFloatValue(self as form, "FW.Child.StatConjuration")
	storageutil.UnsetFloatValue(self as form, "FW.Child.StatMagicka")
	storageutil.UnsetFloatValue(self as form, "FW.Child.StatRestoration")
	storageutil.UnsetFloatValue(self as form, "FW.Child.StatAlteration")
	storageutil.UnsetFloatValue(self as form, "FW.Child.StatBlock")
	storageutil.UnsetFloatValue(self as form, "FW.Child.StatCarryWeight")
	storageutil.UnsetFloatValue(self as form, "FW.Child.StatOneHanded")
	storageutil.UnsetFloatValue(self as form, "FW.Child.StatTwoHanded")
	storageutil.UnsetFloatValue(self as form, "FW.Child.StatMarksman")
	storageutil.UnsetFloatValue(self as form, "FW.Child.StatSneak")
	storageutil.UnsetFloatValue(self as form, "FW.Child.StatHealth")
	storageutil.UnsetFloatValue(self as form, "FW.Child.StatSkillPoints")
	storageutil.UnsetFloatValue(self as form, "FW.Child.StatPerkPoints")
	storageutil.FormListClear(self as form, "FW.Child.Perks")
	storageutil.IntListClear(self as form, "FW.Child.PerksLevel")
endFunction

function Order_Dismount()

	self.Dismount()
endFunction

function SetName(String newName)

	if newName == ""
		return 
	endIf
	_Name = newName
	String LastName = self.GetLastName()
	parent.SetName(newName)
	self.SetDisplayName(newName + LastName, true)
	storageutil.SetStringValue(self as form, "FW.Child.Name", newName)
endFunction

function UpdateStats()

	self.RefreshActorValue("CarryWeight", 30.0000)
endFunction

function Order_FollowAndPlayOther()

	if _Mother == game.GetPlayer() && _Father != none
		self.Order_FollowAndPlay(_Father)
	elseIf _Mother != none
		self.Order_FollowAndPlay(_Mother)
	endIf
endFunction

Bool function Order_Heal(Actor ActorToHeal, Float Percent)

	if ActorToHeal.GetAV("Health") / ActorToHeal.GetAV("MaxHealth") < Percent && ActorToHeal.GetDistance(self as objectreference) < 500.000
		
	endIf
	return false
endFunction

Bool function IsAllowedSpell(spell SpellToLearn)

	if HasMagicka == false
		return false
	endIf
	if SpellToLearn.GetEffectiveMagickaCost(self as Actor) as Float * 1.40000 > self.GetActorValue("Magicka")
		return false
	endIf
	Int i = SpellToLearn.GetNumEffects()
	while i > 0
		i -= 1
		if SpellToLearn.GetNthEffectMagicEffect(i).GetAssociatedSkill() != ""
			if self.GetActorValue(SpellToLearn.GetNthEffectMagicEffect(i).GetAssociatedSkill()) < SpellToLearn.GetNthEffectMagicEffect(i).GetSkillLevel() as Float
				return false
			endIf
		endIf
	endWhile
	return true
endFunction

function SetSex(Int Sex)

	Int xflag = storageutil.GetIntValue(self as form, "FW.Child.Flag", 0)
	if math.LogicalAnd(xflag, 4) == 4 && self.Sex == 0
		storageutil.SetIntValue(self as form, "FW.Child.Flag", math.LogicalXor(xflag, 4))
	elseIf math.LogicalAnd(xflag, 4) == 0 && self.Sex == 1
		storageutil.SetIntValue(self as form, "FW.Child.Flag", math.LogicalOr(xflag, 4))
	endIf
	if self.Sex == 1
		iSex = 1
	else
		iSex = 0
	endIf
endFunction

function OnItemAdded(form akBaseItem, Int aiItemCount, objectreference akItemReference, objectreference akSourceContainer)

	book iBook = akBaseItem as book
	if iBook != none && bIsLearning == false
		bIsLearning = true
		utility.Wait(1.00000)
		self.CheckInventory()
	elseIf iBook != none
		bInventoryChangedWheelLearning = true
	endIf
endFunction

function AddExp(Float Amount)

	self.AddExperience(Amount)
endFunction

Bool function Order_ActivateShild()

	return false
endFunction

function OnDeath(Actor akKiller)

	storageutil.SetFloatValue(self as form, "FW.Child.LastUpdate", utility.GetCurrentGameTime())
endFunction

function Order_MeetPlace()

	_order = 12
	PlayerLastSeen = utility.GetCurrentGameTime()
	self.RefreshAI()
	self.GotoState("Wait")
endFunction

function Order_WaitAndPlay()

	_order = 1
	PlayerLastSeen = utility.GetCurrentGameTime()
	self.RefreshAI()
	self.GotoState("Wait")
endFunction

Bool function HasParentRelationship(Actor akOther)

	if akOther == self.Mother || akOther == self.Father
		return true
	else
		return parent.HasParentRelationship(akOther)
	endIf
endFunction

ColorForm function GetHairColor()

	return HairColor
endFunction

function SetLevel(Int newLevel)

	ChildSettings.LevelUpFX.Cast(self as objectreference, self as objectreference)
	fwsystem System = game.GetFormFromFile(3426, fwutility.ModFile("BeeingFemale")) as fwsystem
	System.Message(fwutility.MultiStringReplace(System.Content.ChildLevelUp, self.Name, newLevel as String, "", "", "", ""), System.MSG_Low, 0)
	if newLevel > fwchildsettings.ChildMaxLevel()
		storageutil.SetIntValue(self as form, "FW.Child.Level", fwchildsettings.ChildMaxLevel())
	elseIf newLevel < 1
		storageutil.SetIntValue(self as form, "FW.Child.Level", 1)
	else
		storageutil.SetIntValue(self as form, "FW.Child.Level", newLevel)
	endIf
endFunction

Float function GetExp()

	return self.GetExperience()
endFunction

function OnPlayerLoadGame()

	if bOnLoadRunning == true
		return 
	endIf
	bOnLoadRunning = true
	if _Father != none || _Mother != none
		self.InitChild()
	elseIf bGivePerkRunning == false
		self.GivePerks()
	endIf
	self.SetActorValue(ChildSettings.OrderAV(), storageutil.GetIntValue(self as form, "FW.Child.Order", 31) as Float)
	self.RegisterForUpdateGameTime(5.00000)
	self.OnUpdateGameTime()
	self.RegisterForUpdate(10.0000)
	bOnLoadRunning = false
	if _Name == "" || _Name == ChildSettings.Manager.Contents.BabyBlankName
		self.SetName(fwsystem.getRandomChildName(self.GetSex()))
	endIf
endFunction

function UpdateSize()

	if self.GetType() == 62
		if self.Age >= _SizeDuration
			self.SetScale(1.00000)
		elseIf self.Age < 0.000000
			self.SetScale(_SmallSizeScale)
		else
			self.SetScale((1.00000 - _SmallSizeScale) / _SizeDuration * self.Age + _SmallSizeScale)
		endIf
	endIf
endFunction

Int function GetSex()

	return iSex
endFunction

function OnUpdate()

	; Empty function
endFunction

function OpenSkillMenu()

	ChildSettings.OpenSkillMenu(self)
endFunction

function RefreshAI()

	if _order < 30 || _order >= 50
		self.SetActorValue("WaitingForPlayer", 1.00000)
		self.SetPlayerTeammate(false, true)
	else
		self.SetActorValue("WaitingForPlayer", 0.000000)
		self.SetPlayerTeammate(true, true)
	endIf
	Bool isPlayerChild = false
	if _Mother != none
		if _Mother == game.GetPlayer()
			isPlayerChild = true
		endIf
	endIf
	if _Father != none
		if _Father == game.GetPlayer()
			isPlayerChild = true
		endIf
	endIf
	if isPlayerChild && (_order == 1 || _order == 31 || _order >= 10 && _order < 30)
		Int rnd = utility.RandomInt(0, 10)
	endIf
	self.SetActorValue(ChildSettings.OrderAV(), _order as Float)
	storageutil.SetIntValue(self as form, "FW.Child.Order", _order)
	self.EnableAI(false)
	self.EvaluatePackage()
	self.EnableAI(true)
endFunction

function Order_DoFavour()

	DoFavourStart = utility.GetCurrentRealTime()
	self.SetDoingFavor(true)
endFunction

function Order_LeaveMeAlone()

	_order = 99
	self.RefreshAI()
	self.DeleteChild()
endFunction

Int function GetLevel()

	return storageutil.GetIntValue(self as form, "FW.Child.Level", 1)
endFunction

Float function GetAVPercentage(String asValueName)

	return self.GetActorValuePercentage(asValueName)
endFunction

;-- State -------------------------------------------
state MarkForDelete

	function OnUpdate()

		if self.IsOnMount()
			self.Dismount()
		endIf
		if self
			if self.Is3DLoaded()
				if self.HasLos(game.GetPlayer() as objectreference) == false && self.IsNearActor(game.GetPlayer(), 2000.00) == false
					self.UnregisterForUpdate()
					self.UnregisterForUpdateGameTime()
					self.Disable(true)
					self.DeleteStats()
					storageutil.FormListRemove(none, "FW.Babys", self as form, false)
					self.Delete()
				endIf
			else
				self.UnregisterForUpdate()
				self.UnregisterForUpdateGameTime()
				self.Disable(true)
				self.DeleteStats()
				storageutil.FormListRemove(none, "FW.Babys", self as form, false)
				self.Delete()
			endIf
		else
			self.DeleteStats()
			self.Delete()
		endIf
	endFunction
endState

;-- State -------------------------------------------
state Wait
endState

;-- State -------------------------------------------
state Follow
endState
