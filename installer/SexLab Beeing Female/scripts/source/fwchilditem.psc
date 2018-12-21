Scriptname FWChildItem extends MiscObject  

actor property Mother
	actor function get()
		return _Mother
	endFunction
endProperty

actor property Father
	actor function get()
		return _Father
	endFunction
endProperty

float property Age
	float function get()
		return Utility.GetCurrentGameTime() - dob
	endFunction
endProperty

float property DayOfBirth
	float function get()
		return dob
	endFunction
endProperty


actor _Mother
actor _Father
string Name = ""
ColorForm HairColor
bool bIsVampire = false
int iSex
float dob = 0.0 ; Day of birth

float property SmallSizeScale = 0.6 auto
float property SizeDuration = 30.0 auto

; Flags
;  1 IsVampire
;  2 Hair from Mother
;  4 IsFemale
;  8 Eyes from Mother
; 16 Nose from Mother

Bool Function IsVampire()
	return bIsVampire
EndFunction

Function SetVampire(bool bVamp)
	int xflag = StorageUtil.GetIntValue(self, "FW.Child.Flag", 0)
	if (Math.LogicalAnd(xflag,1) == 1) && bVamp==false
		StorageUtil.SetIntValue(self, "FW.Child.Flag", Math.LogicalXor(xflag,1) )
	elseif (Math.LogicalAnd(xflag,1) == 0) && bVamp==true
		StorageUtil.SetIntValue(self, "FW.Child.Flag", Math.LogicalOr(xflag,1) )
	endif
	bIsVampire = bVamp
EndFunction

int function GetSex()
	return iSex
endFunction

function SetSex(int Sex)
	int xflag = StorageUtil.GetIntValue(self, "FW.Child.Flag", 0)
	if (Math.LogicalAnd(xflag,4) == 4) && Sex==0
		StorageUtil.SetIntValue(self, "FW.Child.Flag", Math.LogicalXor(xflag,4) )
	elseif (Math.LogicalAnd(xflag,4) == 0) && Sex==1
		StorageUtil.SetIntValue(self, "FW.Child.Flag", Math.LogicalOr(xflag,4) )
	endif
	if Sex==1
		iSex=1
	else
		iSex=0
	endif
endfunction

ColorForm Function GetHairColor()
	return HairColor
EndFunction

String Function GetName()
	return Name
EndFunction

Function SetName(string newName)
	Name = newName
	StorageUtil.SetStringValue(self,"FW.Child.Name",newName)
EndFunction

Event OnLoad()
	int flag = StorageUtil.GetIntValue(self, "FW.Child.Flag", 0)
	bIsVampire = Math.LogicalAnd(flag,1) == 1
	if Math.LogicalAnd(flag,4) == 4
		iSex=1
	else
		iSex=0
	endif
	name = StorageUtil.GetStringValue(self,"FW.Child.Name","")
	if Math.LogicalAnd(flag,2)==2
		HairColor = _Father.GetLeveledActorBase().GetHairColor()
	else
		HairColor = _Mother.GetLeveledActorBase().GetHairColor()
	endif
	_Father = StorageUtil.GetFormValue(self,"FW.Child.Father",none) as Actor
	_Mother = StorageUtil.GetFormValue(self,"FW.Child.Mother",none) as Actor
	RegisterForSingleUpdateGameTime(5)
	OnUpdateGameTime()
EndEvent

function SetParent(actor Mother, actor Father)
	StorageUtil.SetFormValue(self,"FW.Child.Father",Father)
	StorageUtil.SetFormValue(self,"FW.Child.Mother",Mother)
	StorageUtil.SetFloatValue(self,"FW.Child.LastUpdate",Utility.GetCurrentGameTime())
	_Father=Father
	_Mother=Mother
endFunction

Event OnDeath(Actor akKiller)
	StorageUtil.SetFloatValue(self,"FW.Child.LastUpdate",Utility.GetCurrentGameTime())
endEvent

Event OnUpdateGameTime()
	StorageUtil.SetFloatValue(self,"FW.Child.LastUpdate",Utility.GetCurrentGameTime())
	UpdateSize()
	RegisterForSingleUpdateGameTime(5)
endEvent

function UpdateSize()
	If Age >= SizeDuration
		;SetScale(1.0)
	elseif Age < 0.0
		;SetScale(SmallSizeScale)
	else
		;SetScale((((1.0 - SmallSizeScale) / SizeDuration) * Age) + SmallSizeScale)
	endIf
endFunction

function Delete()
	StorageUtil.UnsetFloatValue(self,"FW.Child.LastUpdate")
	StorageUtil.UnsetFormValue(self, "FW.Child.Father")
	StorageUtil.UnsetFormValue(self, "FW.Child.Mother")
	StorageUtil.UnsetStringValue(self, "FW.Child.Name")
	StorageUtil.UnsetIntValue(self, "FW.Child.Flag")
endFunction