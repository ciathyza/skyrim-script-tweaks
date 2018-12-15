;/ Decompiled by Champollion V1.0.1
Source   : FWCoupleWidget.psc
Modified : 2016-12-06 03:52:50
Compiled : 2017-01-18 08:35:28
User     : admin
Computer : PATRICK
/;
scriptName FWCoupleWidget extends ski_widgetbase

;-- Properties --------------------------------------
String property Script_Name
{Set this script name}
	String function get()

		return _scriptName
	endFunction
	function set(String value)

		_scriptName = value
	endFunction
endproperty
Int property CFG_PosX auto hidden
String property CFG_VAnchor auto hidden
Int property CFG_Alpha auto hidden
fwsystem property System auto
Int property CFG_PosY auto hidden
String property CFG_HAnchor auto hidden
String property SWF_Name
{Set the SWF Filename like 'Widget.swf'}
	String function get()

		return _swfName
	endFunction
	function set(String value)

		_swfName = value
	endFunction
endproperty
String property JsonFile
	String function get()

		if _file == ""
			return ""
		else
			String path = "../../../BeeingFemale/Couples/"
			String Full = path + _file
			return Full
		endIf
	endFunction
endproperty
Bool property enabled
	Bool function get()

		return bEnabled
	endFunction
	function set(Bool val)

		bEnabled = val
		if val == false
			self.FadeTo(0.000000, 0.000000)
			_widgetAlpha = 0
		else
			_widgetAlpha = 100
		endIf
		self.updateConfig()
	endFunction
endproperty
actor property Female
	actor function get()

		return _female
	endFunction
	function set(actor value)

		if bIsInUpdate
			self.UnregisterForUpdate()
			bIsInUpdate = false
		endIf
		if value != none
			if value == _female
				return 
			elseIf value.GetLeveledActorBase().GetSex() == 1
				_female = value
				_name = value.GetLeveledActorBase().GetName()
				_file = self.GetWomanID()
				self.findSpouse()
				self.RefreshAll()
				self.showWidget()
				if jsonutil.HasStringValue(self.JsonFile, "Name") == false
					jsonutil.SetStringValue(self.JsonFile, "Name", _name)
				endIf
				if jsonutil.HasFormValue(self.JsonFile, "Husband") == false
					self.RegisterForUpdate(5.00000)
					bIsInUpdate = true
				elseIf jsonutil.GetFormValue(self.JsonFile, "Husband", none) == none
					self.RegisterForUpdate(5.00000)
					bIsInUpdate = true
				endIf
			else
				self.hideWidget()
			endIf
		else
			self.hideWidget()
		endIf
	endFunction
endproperty
Bool property CFG_Enabled auto hidden

;-- Variables ---------------------------------------
String _file = ""
Bool bEnabled = false
String _swfName = ""
String _mod = ""
Bool bIsInUpdate = false
actor xTarget
actor _female
String _id = ""
Int _widgetAlpha = 0
String _scriptName = ""
AssociationType spouse
String _name = ""

;-- Functions ---------------------------------------

String function GetWidgetSource()

	return "BeeingFemale/" + _swfName
endFunction

String function GetWomanID()

	_mod = fwutility.GetModFromID(_female as form, false)
	_id = fwutility.Hex(_female.GetFormID(), 6)
	return fwutility.GetJsonFileCombine(_mod, _id)
endFunction

function showWidget()

	if self.Ready && CFG_Enabled as Bool
		self.X = CFG_PosX as Float
		self.Y = CFG_PosY as Float
		self.HAnchor = CFG_HAnchor
		self.VAnchor = CFG_VAnchor
		ui.InvokeBool(self.HUD_MENU, self.WidgetRoot + ".setVisible", true)
		self.FadeTo(CFG_Alpha as Float, 0.200000)
	endIf
endFunction

function OnUpdate()

	self.findSpouse()
endFunction

String function GetWidgetType()

	return _scriptName
endFunction

Bool function IsSpouse(actor a)

	if _female != none
		if a != none
			if (a.GetRelationshipRank(_female) >= 4 || _female.GetRelationshipRank(a) >= 4) && a.IsChild() == false
				return true
			elseIf a.HasAssociation(spouse, _female) || _female.HasAssociation(spouse, a)
				return true
			endIf
		endIf
	endIf
	return false
endFunction

function hideWidget()

	if self.Ready
		self.FadeTo(0.000000, 3.00000)
	endIf
endFunction

Float function GetHeight()

	if self.Ready
		return ui.GetFloat(self.HUD_MENU, self.WidgetRoot + ".Height")
	endIf
	return 0.000000
endFunction

; Skipped compiler generated GotoState

function OnKeyDown(Int keyCode)

	if bEnabled == true
		if keyCode == 18
			xTarget = game.GetCurrentCrosshairRef() as actor
		endIf
	endIf
endFunction

function RefreshAll()

	if self.Ready
		if _name != ""
			String[] S = new String[3]
			S[0] = _name
			S[1] = _id
			S[2] = _mod
			ui.InvokeStringA(self.HUD_MENU, self.WidgetRoot + ".setNPC", S)
		endIf
	endIf
	self.RefreshHusband()
	self.RefreshAffair()
	self.RefreshPartner()
endFunction

Float function GetWidth()

	if self.Ready
		return ui.GetFloat(self.HUD_MENU, self.WidgetRoot + ".Width")
	endIf
	return 0.000000
endFunction

function findSpouse()

	if _female as Bool == false
		return 
	endIf
	if jsonutil.HasFormValue(self.JsonFile, "Husband")
		if jsonutil.GetFormValue(self.JsonFile, "Husband", none) != none
			if bIsInUpdate
				bIsInUpdate = false
				self.UnregisterForUpdate()
			endIf
			return 
		endIf
	endIf
	actor a1 = game.FindClosestActorFromRef(game.GetPlayer() as objectreference, 1000.00)
	actor a2 = game.FindClosestActorFromRef(_female as objectreference, 1000.00)
	actor a3 = game.FindRandomActorFromRef(_female as objectreference, 1000.00)
	actor a4 = game.FindRandomActorFromRef(_female as objectreference, 1000.00)
	actor a5 = game.FindRandomActorFromRef(_female as objectreference, 1000.00)
	if self.IsSpouse(a1)
		jsonutil.SetFormValue(self.JsonFile, "Husband", a1 as form)
		if self.Ready
			ui.InvokeString(self.HUD_MENU, self.WidgetRoot + ".setHusband", a1.GetLeveledActorBase().GetName())
		endIf
	elseIf self.IsSpouse(a2)
		jsonutil.SetFormValue(self.JsonFile, "Husband", a2 as form)
		if self.Ready
			ui.InvokeString(self.HUD_MENU, self.WidgetRoot + ".setHusband", a2.GetLeveledActorBase().GetName())
		endIf
	elseIf self.IsSpouse(a3)
		jsonutil.SetFormValue(self.JsonFile, "Husband", a3 as form)
		if self.Ready
			ui.InvokeString(self.HUD_MENU, self.WidgetRoot + ".setHusband", a3.GetLeveledActorBase().GetName())
		endIf
	elseIf self.IsSpouse(a4)
		jsonutil.SetFormValue(self.JsonFile, "Husband", a4 as form)
		if self.Ready
			ui.InvokeString(self.HUD_MENU, self.WidgetRoot + ".setHusband", a4.GetLeveledActorBase().GetName())
		endIf
	elseIf self.IsSpouse(a5)
		jsonutil.SetFormValue(self.JsonFile, "Husband", a5 as form)
		if self.Ready
			ui.InvokeString(self.HUD_MENU, self.WidgetRoot + ".setHusband", a5.GetLeveledActorBase().GetName())
		endIf
	endIf
endFunction

function UpdateContent()

	if self.Ready
		self.RefreshAll()
	endIf
endFunction

function OnKeyUp(Int keyCode, Float holdTime)

	if bEnabled == false
		return 
	endIf
	actor targetNpc = game.GetCurrentCrosshairRef() as actor
	if targetNpc == none
		if xTarget != none
			targetNpc = xTarget
		endIf
	endIf
	xTarget = none
	if targetNpc == none
		if keyCode == 18
			if holdTime > 1.50000
				self.Female = none
			endIf
		endIf
		return 
	endIf
	if jsonutil.HasFormValue(self.JsonFile, "Husband") == false
		if self.IsSpouse(targetNpc)
			if bIsInUpdate
				bIsInUpdate = false
				self.UnregisterForUpdate()
			endIf
			jsonutil.SetFormValue(self.JsonFile, "Husband", targetNpc as form)
			if self.Ready
				ui.InvokeString(self.HUD_MENU, self.WidgetRoot + ".setHusband", targetNpc.GetLeveledActorBase().GetName())
			endIf
		endIf
	elseIf jsonutil.GetFormValue(self.JsonFile, "Husband", none) == none
		if self.IsSpouse(targetNpc)
			if bIsInUpdate
				bIsInUpdate = false
				self.UnregisterForUpdate()
			endIf
			jsonutil.SetFormValue(self.JsonFile, "Husband", targetNpc as form)
			if self.Ready
				ui.InvokeString(self.HUD_MENU, self.WidgetRoot + ".setHusband", targetNpc.GetLeveledActorBase().GetName())
			endIf
		endIf
	endIf
	if keyCode == 18
		if holdTime > 1.50000 && targetNpc != none && System.IsValidateFemaleActor(targetNpc, false) as Bool
			self.Female = targetNpc
		elseIf holdTime > 1.00000
			self.Female = none
		endIf
	elseIf keyCode == 35 && holdTime > 1.50000 && _name != "" && targetNpc != none
		if System.IsValidateMaleActor(targetNpc, false) as Bool && _female.GetRelationshipRank(targetNpc) >= 0
			if jsonutil.GetFormValue(self.JsonFile, "Husband", none) == targetNpc as form
				if bIsInUpdate == false
					bIsInUpdate = true
					self.RegisterForUpdate(5.00000)
				endIf
				jsonutil.UnsetFormValue(self.JsonFile, "Husband")
			else
				if bIsInUpdate
					bIsInUpdate = false
					self.UnregisterForUpdate()
				endIf
				jsonutil.SetFormValue(self.JsonFile, "Husband", targetNpc as form)
				if self.Ready
					ui.InvokeString(self.HUD_MENU, self.WidgetRoot + ".setHusband", targetNpc.GetLeveledActorBase().GetName())
				endIf
			endIf
		elseIf !System.IsValidateMaleActor(targetNpc, false) && _female.GetRelationshipRank(targetNpc) >= 0
			jsonutil.UnsetFormValue(self.JsonFile, "Husband")
		endIf
	elseIf keyCode == 34 && holdTime > 1.50000 && _name != "" && targetNpc != none
		if System.IsValidateActor(targetNpc, false) as Bool && _female.GetRelationshipRank(targetNpc) >= 0
			if jsonutil.FormListHas(self.JsonFile, "Affairs", targetNpc as form)
				jsonutil.FormListRemove(self.JsonFile, "Affairs", targetNpc as form, true)
				self.RefreshAffair()
			else
				jsonutil.FormListAdd(self.JsonFile, "Affairs", targetNpc as form, true)
				if self.Ready
					ui.InvokeString(self.HUD_MENU, self.WidgetRoot + ".addAffair", targetNpc.GetLeveledActorBase().GetName())
				endIf
			endIf
		endIf
	elseIf keyCode == 25 && holdTime > 1.50000 && _name != "" && targetNpc != none
		if System.IsValidateActor(targetNpc, false) as Bool && _female.GetRelationshipRank(targetNpc) >= 0
			if jsonutil.FormListHas(self.JsonFile, "Partners", targetNpc as form)
				jsonutil.FormListRemove(self.JsonFile, "Partners", targetNpc as form, true)
				self.RefreshPartner()
			else
				jsonutil.FormListAdd(self.JsonFile, "Partners", targetNpc as form, true)
				if self.Ready
					ui.InvokeString(self.HUD_MENU, self.WidgetRoot + ".addPartner", targetNpc.GetLeveledActorBase().GetName())
				endIf
			endIf
		endIf
	endIf
endFunction

function RefreshPartner()

	if self.Ready
		ui.InvokeString(self.HUD_MENU, self.WidgetRoot + ".setPartner", "")
		if _name != ""
			Int i = jsonutil.FormListCount(self.JsonFile, "Partners")
			while i > 0
				i -= 1
				actor Partner = jsonutil.FormListGet(self.JsonFile, "Partners", i) as actor
				if Partner != none
					ui.InvokeString(self.HUD_MENU, self.WidgetRoot + ".addPartner", Partner.GetLeveledActorBase().GetName())
				endIf
			endWhile
		endIf
	endIf
endFunction

function RefreshAffair()

	if self.Ready
		ui.InvokeString(self.HUD_MENU, self.WidgetRoot + ".setAffair", "")
		if _name != ""
			Int i = jsonutil.FormListCount(self.JsonFile, "Affairs")
			while i > 0
				i -= 1
				actor Affair = jsonutil.FormListGet(self.JsonFile, "Affairs", i) as actor
				if Affair != none
					ui.InvokeString(self.HUD_MENU, self.WidgetRoot + ".addAffair", Affair.GetLeveledActorBase().GetName())
				endIf
			endWhile
		endIf
	endIf
endFunction

function RefreshHusband()

	if self.Ready
		ui.InvokeString(self.HUD_MENU, self.WidgetRoot + ".setHusband", "")
		if _name != ""
			actor Husband = jsonutil.GetFormValue(self.JsonFile, "Husband", none) as actor
			if Husband != none
				ui.InvokeString(self.HUD_MENU, self.WidgetRoot + ".setHusband", Husband.GetLeveledActorBase().GetName())
			endIf
		endIf
	endIf
endFunction

Float[] function GetDimensions()
{Return the dimensions of the widget (width,height).}

	Float[] dim = new Float[2]
	dim[0] = self.GetWidth()
	dim[1] = self.GetHeight()
	return dim
endFunction

; Skipped compiler generated GetState

function ConvertAllFromActorBase()

	Int c = storageutil.FormListCount(none, "FW.SavedNPCs")
	debug.Notification("Start converting: " + c as String + " NPCs")
	String xp1 = "../../../BeeingFemale/Couples/ActorBase/"
	String xp2 = "../../../BeeingFemale/Couples/"
	while c > 0
		c -= 1
		actor a = storageutil.FormListGet(none, "FW.SavedNPCs", c) as actor
		String _m = fwutility.GetModFromID(a as form, false)
		String _h = fwutility.Hex(a.GetLeveledActorBase().GetFormID(), 6)
		String _h1 = xp1 + fwutility.GetJsonFileCombine(_m, _h)
		if jsonutil.HasFormValue(_h1, "Husband") || jsonutil.FormListCount(_h1, "Affairs") > 0 || jsonutil.FormListCount(_h1, "Partners") > 0
			debug.Notification("convert " + a.GetLeveledActorBase().GetName())
			String _h2 = xp2 + fwutility.GetJsonFileCombine(_m, fwutility.Hex(a.GetFormID(), 6))
			jsonutil.SetFormValue(_h2, "Husband", jsonutil.GetFormValue(_h1, "Husband", none))
			Int c2 = jsonutil.FormListCount(_h1, "Affairs")
			while c2 > 0
				c2 -= 1
				jsonutil.FormListAdd(_h2, "Affairs", jsonutil.FormListGet(_h1, "Affairs", c2), true)
			endWhile
			c2 = jsonutil.FormListCount(_h1, "Partners")
			while c2 > 0
				c2 -= 1
				jsonutil.FormListAdd(_h2, "Partners", jsonutil.FormListGet(_h1, "Partners", c2), true)
			endWhile
			jsonutil.Save(_h2, false)
		endIf
	endWhile
	debug.MessageBox("Convert done")
endFunction

function OnWidgetReset()

	self.X = CFG_PosX as Float
	self.Y = CFG_PosY as Float
	self.HAnchor = CFG_HAnchor
	self.VAnchor = CFG_VAnchor
	self.Female = none
	_name = ""
	spouse = game.GetFormFromFile(82634, "Skyrim.esm") as AssociationType
	parent.OnWidgetReset()
	self.updateConfig()
	self.UpdateContent()
endFunction

function OnWidgetLoad()

	parent.OnWidgetLoad()
	self.OnWidgetReset()
endFunction

function updateConfig()

	if self.GetType() == 77
		self.UnregisterForAllKeys()
		if bEnabled
			self.RegisterForKey(18)
			self.RegisterForKey(35)
			self.RegisterForKey(34)
			self.RegisterForKey(25)
			debug.Notification("Couple Widget Key-Events registrated")
		endIf
	endIf
endFunction
