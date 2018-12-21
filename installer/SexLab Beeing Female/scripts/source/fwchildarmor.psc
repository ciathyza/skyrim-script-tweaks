Scriptname FWChildArmor extends ObjectReference
import Armor

spell property BabyCry auto
spell property BabyFear auto
spell property BabyTalk auto
spell property BabyDrink auto
spell property BabyHappy auto
spell property BabyLaugh auto
spell property BabyAmuse auto
spell property BabyGiggle auto
spell property BabyHiccup auto
spell property BabySupprised auto

FormList property ItemListHappy auto
FormList property ItemListFear auto
FormList property ItemListSupprised auto

FWTextContents property Content auto

actor User

actor property Mother hidden
	actor function get()
		return _Mother
	endFunction
endProperty

actor property Father hidden
	actor function get()
		return _Father
	endFunction
endProperty

float property Age hidden
	float function get()
		return Utility.GetCurrentGameTime() - dob
	endFunction
endProperty

float property DayOfBirth hidden
	float function get()
		return dob
	endFunction
endProperty

race property ChildRace hidden
	race function get()
		return StorageUtil.GetFormValue(self, "FW.Child.Race" ) as race
	endFunction
	
	function set(race value)
		StorageUtil.SetFormValue(self, "FW.Child.Race", value )
	endFunction
endProperty

bool bUseFathersLastName
bool property UseFathersLastName hidden
	bool function get()
		return bUseFathersLastName
	endFunction
	function set(bool value)
		int xflag = StorageUtil.GetIntValue(self, "FW.Child.Flag", 0)
		if value==true
			StorageUtil.SetIntValue(self, "FW.Child.Flag", Math.LogicalOr(xflag,32) )
		else
			StorageUtil.SetIntValue(self, "FW.Child.Flag", Math.LogicalXor(xflag,32) )
		endif
		if Name==""
			return
		endif
		string LastName = GetLastName()
		;Debug.Notification("UseFathersLastName: 1. '"+_Name+"' 2. '"+LastName+"'")
		SetName(Name)
		bUseFathersLastName = value
	endFunction
endProperty

string _xName = ""
string property Name hidden
	string function get()
		return _xName
	endFunction
	function set(string value)
		if value==""
			return
		endif
		string LastName = GetLastName()
		StorageUtil.SetStringValue(self,"FW.Child.Name",value)
		if value==_xName
			return
		endif
		_xName=value
		;Debug.Notification("Name: 1. '"+_Name+"' 2. '"+LastName+"'")
		SetName(_xName)
		string _lName = LastName
		if(_xName=="" && _lName=="")
			SetDisplayName(Content.BabyBlankName)
		elseif(_xName=="")
			SetDisplayName(FWUtility.MultiStringReplace(Content.BabyName, _lName, ""))
		elseif(_lName=="")
			SetDisplayName(FWUtility.MultiStringReplace(Content.BabyName, _xName, ""))
		else
			SetDisplayName(FWUtility.MultiStringReplace(Content.BabyName, _xName, _lName))
		endif
	endFunction
endProperty

bool property IsFemale hidden
	bool function get()
		return iSex==1
	endFunction
	function Set(bool value)
		if value==true
			iSex=1
		else
			iSex=0
		endif
	endFunction
endProperty

bool property IsMale hidden
	bool function get()
		return iSex==1
	endFunction
	function Set(bool value)
		if value==true
			iSex=0
		else
			iSex=1
		endif
	endFunction
endProperty


actor _Mother
actor _Father
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
	Parent.SetName(newName + " " + GetLastName())
	Name = newName
EndFunction

Event OnLoad()
	;Debug.Trace("FWChildArmor::OnLoad()")
	;Debug.Notification("Baby Name01: "+_xName + ";"+StorageUtil.GetStringValue(self,"FW.Child.Name","none")+";"+GetDisplayName()+";"+GetName())
	;Debug.Trace("Baby Name01: "+_xName + ";"+StorageUtil.GetStringValue(self,"FW.Child.Name","none")+";"+GetDisplayName()+";"+GetName())
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
	;OnUpdateGameTime()
EndEvent

function SetParent(actor Mother, actor Father)
	StorageUtil.SetFormValue(self,"FW.Child.Father",Father)
	StorageUtil.SetFormValue(self,"FW.Child.Mother",Mother)
	StorageUtil.SetFloatValue(self,"FW.Child.LastUpdate",Utility.GetCurrentGameTime())
	_Father=Father
	_Mother=Mother
endFunction

;Event OnUpdateGameTime()
	;StorageUtil.SetFloatValue(self,"FW.Child.LastUpdate",Utility.GetCurrentGameTime())
	;Function CreateEnchantment(float maxCharge, MagicEffect[] effects, float[] magnitudes, int[] areas, int[] durations)
	;if(GetEnchantment()==none)
	;	MagicEffect[] encm = new MagicEffect[1]
	;	float[] encf = new float[1]
	;	int[] enci1 = new int[1]
	;	int[] enci2 = new int[1]
	;	encm[0] = Game.GetFormFromFile(0x183B, "BeeingFemaleBasicAddOn.esp")
	;	encf[0] = 1.0
	;	enci1[0]= 0.0
	;	enci2[0]= 0.0
	;	CreateEnchantment(1, encm, encf, enci1, enci2)
	;endif
	;UpdateSize()
;endEvent

;function UpdateSize()
	
;endFunction

function Delete()
	StorageUtil.UnsetFloatValue(self,"FW.Child.LastUpdate")
	StorageUtil.UnsetFormValue(self, "FW.Child.Father")
	StorageUtil.UnsetFormValue(self, "FW.Child.Mother")
	StorageUtil.UnsetStringValue(self, "FW.Child.Name")
	StorageUtil.UnsetIntValue(self, "FW.Child.Flag")
endFunction

string Function GetLastName()
	string LastName = ""
	int xflag = StorageUtil.GetIntValue(self, "FW.Child.Flag", 0)
	
	if Mother==Game.GetPlayer() || Father==Game.GetPlayer()
		return " Dovahkiir"
	endif
	
	if (Math.LogicalAnd(xflag,32) == 32)
		LastName = GetActorsLastName(Father)
	endif
	
	if LastName==""
		LastName = GetActorsLastName(Mother)
	endif
	return LastName
endFunction

string function GetActorsLastName(actor a)
	if a==none
		return ""
	endif
	string Name1 = a.GetName()
	string Name2 = a.GetDisplayName()
	ActorBase ab = a.GetLeveledActorBase()
	if ab!=none
		if StringUtil.GetLength(ab.GetName())>StringUtil.GetLength(Name1)
			Name1 = ab.GetName()
		endif
	endif
	int lName1 = StringUtil.GetLength(Name1)
	int lName2 = StringUtil.GetLength(Name2)
	if lName1 > lName2
		return StringUtil.Substring(Name1,lName2)
	elseif lName1 < lName2
		return StringUtil.Substring(Name2,lName1)
	endif
	return ""
endFunction

; Event received when this object is equipped by an actor
Event OnEquipped(Actor akActor)
	;Debug.Notification("Baby Name02: "+_xName + ";"+StorageUtil.GetStringValue(self,"FW.Child.Name","none")+";"+GetDisplayName()+";"+GetName())
	;Debug.Trace("Baby Name02: "+_xName + ";"+StorageUtil.GetStringValue(self,"FW.Child.Name","none")+";"+GetDisplayName()+";"+GetName())
	;Utility.Wait(3)
	;Debug.Trace("FWChildArmor::OnEquipped("+akActor.GetLeveledActorBase().GetName()+")")
	;Debug.Trace("Baby Name1: "+_xName)
	;Debug.Trace("Baby Name2: "+StorageUtil.GetStringValue(self,"FW.Child.Name","none"))
	;Debug.Trace("Baby Name3: "+GetDisplayName())
	;Debug.Trace("Baby Name4: "+GetName())
	if GetName()=="Baby" || GetName()=="" || \
	   GetDisplayName()=="Baby" || GetDisplayName()=="" || \
	   _xName=="Baby" || _xName=="" || \
	   StorageUtil.GetStringValue(self,"FW.Child.Name","")==""
		; Name wasn't set or an error happend
		int xflag = StorageUtil.GetIntValue(self, "FW.Child.Flag", -1)
		if xflag==-1
			;Object was never init
			FWSystem.ChildItemSetup(self)
		else
			if Math.LogicalAnd(xflag,4) == 0
				; Male name
				Name=FWSystem.getRandomChildName(0)
			elseif (Math.LogicalAnd(xflag,4) == 0)
				; Female name
				Name=FWSystem.getRandomChildName(1)
			endif
		endif
	endif
endEvent