Scriptname FWUtility

; Time functions
String Function GetTimeString(Float akTime, Bool akShortFormat = True, String akNegativeText = "") Global
	String sign = ""
	If (akTime < 0.0)
		If akNegativeText!=""
			Return akNegativeText
		EndIf
		sign = "-"
		akTime *= -1
	EndIf
	
	String timeString = ""
	
	; Days
	Int val = (akTime as Int)
	If val != 0
		timeString += val
		
		If akShortFormat
			timeString += "d "
		ElseIf val == 1
			timeString += "day "
		Else
			timeString += "days "
		EndIf
	EndIf
	akTime = (akTime - val) * 24
	
	; Hours
	val = (akTime as Int)
	If val != 0
		timeString += val
		
		If akShortFormat
			timeString += "h "
		ElseIf val == 1
			timeString += "hour "
		Else
			timeString += "hours "
		EndIf
	EndIf
	akTime = (akTime - val) * 60
	
	; Minutes
	val = (akTime as Int)
	If val != 0
		timeString += val
		
		If akShortFormat
			timeString += "m"
		ElseIf val == 1
			timeString += "minute"
		Else
			timeString += "minutes"
		EndIf
	EndIf
	
	Return sign + timeString
EndFunction

bool function IsModInstalled(string ModName) global
	int c = Game.GetModCount()
	while c>0
		c-=1
		string m = Game.GetModName(c)
		if m==ModName || m==ModName+".esp" || m==ModName+".esm"
			return true
		endif
	endWhile
	return false
endFunction

bool function AreModsInstalled(string[] ModNames) global
	int c = ModNames.length
	while c>0
		c-=1
		if ModNames[c]!="" && IsModInstalled(ModNames[c])==false
			return false
		endif
	endWhile
	return true
endFunction

string function ModFile(string ModName) global
	int c = Game.GetModCount()
	while c>0
		c-=1
		string m = Game.GetModName(c)
		if m==ModName || m==ModName+".esp" || m==ModName+".esm"
			return m
		endif
	endWhile
	return ""
endFunction

string function GetJsonFile(form frm) global
	;if frm as actor != none
	;	return GetJsonFileCombine(GetModFromID(frm,false), Hex((frm as actor).GetLeveledActorBase().GetFormID(), 6))
	;else
		return GetJsonFileCombine(GetModFromID(frm,false), Hex(frm.GetFormID(), 6))
	;endif
endFunction

string function GetJsonFileCombine(string Mod, string Hex) global
	return Mod + "_" + Hex + ".json"
endFunction

string function GetIniFile(form frm) global
	return GetIniFileCombine(GetModFromID(frm,false), Hex(frm.GetFormID(), 6))
endFunction

string function GetIniFileCombine(string Mod, string Hex) global
	return Mod + "_" + Hex + ".ini"
endFunction

string function GetModFromID(Form frm, bool bFileExtention = true) global
	int c = Game.GetModCount()
	int i=0
	string mName = ""
	bool bFound = false
	if (frm as Actor) !=none
		actor a = frm as Actor
		actorbase b = a.GetLeveledActorBase()
		int mID = a.GetFormID() % 0x1000000
		int nID = b.GetFormID() % 0x1000000
		Debug.Trace("Find Mod by Actor '"+b.GetName()+"' - "+mID+ "("+a.GetFormID()+") / " + nID + "("+b.GetFormID()+")")
		while i<c
			mName = Game.GetModName(i)
			if a == Game.GetFormFromFile(mID,mName) as actor
				i=c
				c=0
				bFound = true
			elseif b == Game.GetFormFromFile(nID,mName) as actorbase
				i=c
				c=0
				bFound = true
			endif
			i += 1
		endWhile
	else
		int mID = frm.GetFormID() % 0x1000000
		while i<c
			mName = Game.GetModName(i)
			if frm == Game.GetFormFromFile(mID,mName)
				i=c
				c=0
				bFound = true
			endif
			i += 1
		endWhile
	endif
	if bFound
		if bFileExtention
			return mName
		else
			int len = StringUtil.GetLength(mName) - 4
			return StringUtil.Substring(mName, 0, len)
		endif
	else
		return "unknown"
	endif
endFunction


string function GetDirectoryHash(string dir) native global
;string function GetDirectoryHash(string dir) global
;	return "000"
;endfunction

; Generates a Hex Value out of integer with the Given number of digits
; Hex( 500 , 4 ) = "01F4"
string function Hex(int value, int Digits) native global
;string function Hex(int value, int Digits) global
;	string sHex = ""
;	if Digits<=1
;		sHex = sHex + HexDigit(value,0xF)
;	elseif Digits==2
;		sHex = sHex + HexDigit(value,0xF0,4)
;		sHex = sHex + HexDigit(value,0x0F)
;	elseif Digits==3
;		sHex = sHex + HexDigit(value,0xF00,8)
;		sHex = sHex + HexDigit(value,0x0F0,4)
;		sHex = sHex + HexDigit(value,0x00F)
;	elseif Digits==4
;		sHex = sHex + HexDigit(value,0xF000,12)
;		sHex = sHex + HexDigit(value,0x0F00,8)
;		sHex = sHex + HexDigit(value,0x00F0,4)
;		sHex = sHex + HexDigit(value,0x000F)
;	elseif Digits==5
;		sHex = sHex + HexDigit(value,0xF0000,16)
;		sHex = sHex + HexDigit(value,0x0F000,12)
;		sHex = sHex + HexDigit(value,0x00F00,8)
;		sHex = sHex + HexDigit(value,0x000F0,4)
;		sHex = sHex + HexDigit(value,0x0000F)
;	elseif Digits==6
;		sHex = sHex + HexDigit(value,0xF00000,20)
;		sHex = sHex + HexDigit(value,0x0F0000,16)
;		sHex = sHex + HexDigit(value,0x00F000,12)
;		sHex = sHex + HexDigit(value,0x000F00,8)
;		sHex = sHex + HexDigit(value,0x0000F0,4)
;		sHex = sHex + HexDigit(value,0x00000F)
;	elseif Digits==7
;		sHex = sHex + HexDigit(value,0xF000000,24)
;		sHex = sHex + HexDigit(value,0x0F00000,20)
;		sHex = sHex + HexDigit(value,0x00F0000,16)
;		sHex = sHex + HexDigit(value,0x000F000,12)
;		sHex = sHex + HexDigit(value,0x0000F00,8)
;		sHex = sHex + HexDigit(value,0x00000F0,4)
;		sHex = sHex + HexDigit(value,0x000000F)
;	elseif Digits==8
;		if Digits>8
;			Debug.Trace("Max Hex digit count: 8")
;		endif
;		sHex = sHex + HexDigit(value,0xF0000000,28)
;		sHex = sHex + HexDigit(value,0x0F000000,24)
;		sHex = sHex + HexDigit(value,0x00F00000,20)
;		sHex = sHex + HexDigit(value,0x000F0000,16)
;		sHex = sHex + HexDigit(value,0x0000F000,12)
;		sHex = sHex + HexDigit(value,0x00000F00,8)
;		sHex = sHex + HexDigit(value,0x000000F0,4)
;		sHex = sHex + HexDigit(value,0x0000000F)
;	endif
;	return sHex
;endFunction

;string function HexDigit(int Value, int Max, int Shift=0) global
;	int x=0
;	if Shift<1
;		x = Math.LogicalAnd(Value, Max)
;	else
;		x = Math.RightShift( Math.LogicalAnd(Value, Max), Shift)
;	endif
;	if x >=0 && x<16
;		return StringUtil.Substring("0123456789ABCDEF",x,1)
;	else
;		return ""
;	endif
;endFunction

string function toLower(string str) global native
string function toUpper(string str) global native

bool function ScriptHasString(string script, string str) global native
int function ScriptStringCount(string script) global native
string function ScriptStringGet(string script, int num) global native
string function ScriptUser(string script) global native
string function ScriptSource(string script) global native
string function ScriptMashine(string script) global native

;string function IOReadTranslation(string Langauge) global native
;string function getLangText(string lngContent, string VarName) global native

int function GetFileCount(string argPath, string extention="json") global native
string function GetFileName(string argPath, string extention="json", int fileID=0) global native
bool function FileExists(string FilePath) global native
string function getNextAutoFile(string Directory, string FileName, string Ext) global native

string function getTypeString(int fileID=0) global native

string function getIniPath(string Type, string File) global native

string function getIniString(string Type, string File, string Variable, string Default="") global native
bool function getIniBool(string Type, string File, string Variable, bool Default=false) global native
int function getIniInt(string Type, string File, string Variable, int Default=0) global native
float function getIniFloat(string Type, string File, string Variable, float Default=0.0) global native
string function getIniCString(string Type, string File, string Categorie, string Variable, string Default="") global native
bool function getIniCBool(string Type, string File, string Categorie, string Variable, bool Default=false) global native
int function getIniCInt(string Type, string File, string Categorie, string Variable, int Default=0) global native
float function getIniCFloat(string Type, string File, string Categorie, string Variable, float Default=0.0) global native

function setIniString(string Type, string File, string Variable, string Value) global native
function setIniBool(string Type, string File, string Variable, bool Value) global native
function setIniInt(string Type, string File, string Variable, int Value) global native
function setIniFloat(string Type, string File, string Variable, float Value) global native
function setIniCString(string Type, string File, string Categorie, string Variable, string Value) global native
function setIniCBool(string Type, string File, string Categorie, string Variable, bool Value) global native
function setIniCInt(string Type, string File, string Categorie, string Variable, int Value) global native
function setIniCFloat(string Type, string File, string Categorie, string Variable, float Value) global native


form function GetFormFromString(string s) global native ; returns the Form of a string
string function GetModFromString(string s, bool bExtension = false) global native ; returns the Mod Name from a FormString (BeeingFemale_1234 => BeeingFemale)
int function GetFormIDFromString(string s) global native ; returns the Hex ID + Numeric ID from a formString (Like: BeeingFemale_1234 => 0x04001234 => Result: 67113524)
string function GetStringFromForm(form frm) global native ; returns the Form String from a form (like: "BeeingFemale_1234")
string function GetModFromForm(form frm, bool bExtension = false) global native ; returns the mod File from a form (like: "BeeingFemale")
string function GetStringFromForms(Form[] frms) global
	int i=0
	string s=""
	int c=frms.Length
	while i<c
		string tmp=GetStringFromForm(frms[i])
		if tmp!=""
			if i>0
				s+=","
			endif
			s+=tmp
		endif
		i+=1
	endWhile
	return s
endFunction
string function GetStringFromRaces(Race[] frms) global
	int i=0
	string s=""
	int c=frms.Length
	while i<c
		string tmp=GetStringFromForm(frms[i])
		if tmp!=""
			if i>0
				s+=","
			endif
			s+=tmp
		endif
		i+=1
	endWhile
	return s
endFunction
string function GetStringFromSpells(Spell[] frms) global
	int i=0
	string s=""
	int c=frms.Length
	while i<c
		string tmp=GetStringFromForm(frms[i])
		if tmp!=""
			if i>0
				s+=","
			endif
			s+=tmp
		endif
		i+=1
	endWhile
	return s
endFunction

quest function GetQuestObject(string ModName, int index) global native
int function GetQuestObjectCount(string ModName) global native


string function getObjectListNames(ObjectReference[] objs, bool PrefareDisplayName=false) global
	if objs.length==0
		return ""
	else
		int c=objs.length
		int i=0
		string str=""
		bool bFirst=true
		while i<c
			if objs[i]!=none
				if bFirst==true
					bFirst=false
				else
					str+=", "
				endif
				actor a = objs[i] as actor
				; Actors are handles different
				if a!=none && PrefareDisplayName==false
					if a.GetLeveledActorBase()!=none
						str+=a.GetLeveledActorBase().GetName()
					else
						str+=a.GetDisplayName()
					endif
				else
					if PrefareDisplayName==true && objs[i].GetDisplayName()!=""
						str+=objs[i].GetDisplayName()
					else
						str+=objs[i].GetName()
					endif
				endif
			endif
			i+=1
		endWhile
		return str
	endIf
endFunction

string function getRandomName(int iSex) Global
	;Debug.Trace("BeeingFemale - getRandomName("+iSex+")")
	string lang = Utility.GetINIString("sLanguage:General")
	string path = "../../../BeeingFemale/Names/"
	string Full = path + "BeeingFemaleNames_" + lang + ".json"
	string ssex = ""
	;Debug.Trace("- Use Language: '"+lang+"'")
	;Debug.Trace("- Name File: '" + Full + "'")
	
	if iSex == 0
		ssex = "male"
	elseif iSex == 1
		ssex = "female"
	endif
	;Debug.Trace("- ssex: '" + ssex + "'")
	int Count = JsonUtil.StringListCount(Full, ssex)
	;Debug.Trace("- Name Count: '" + Count + "'")
	;JsonUtil.StringListAdd(Full, ssex, "Alex", false)
	int id = Utility.RandomInt(0, Count - 1)
	;Debug.Trace("- Random ID: '" + id + "'")
	string sName = JsonUtil.StringListGet(Full, ssex, id)
	;Debug.Trace("- Result: '" + sName+"'")
	return sName
endFunction

string function getActorListNames(Actor[] objs, bool PrefareDisplayName=false) global
	if objs.length==0
		return ""
	else
		int c=objs.length
		int i=0
		string str=""
		bool bFirst=true
		while i<c
			if objs[i]!=none
				if bFirst==true
					bFirst=false
				else
					str+=", "
				endif
				if PrefareDisplayName==false
					if objs[i].GetLeveledActorBase()!=none
						str+=objs[i].GetLeveledActorBase().GetName()
					elseif objs[i].GetDisplayName()!=""
						str+=objs[i].GetDisplayName()
					else
						str+=objs[i].GetName()
					endif
				else
					if objs[i].GetDisplayName()!=""
						str+=objs[i].GetDisplayName()
					elseif objs[i].GetLeveledActorBase()!=none
						str+=objs[i].GetLeveledActorBase().GetName()
					else
						str+=objs[i].GetName()
					endif
				endif
			endif
			i+=1
		endWhile
		return str
	endIf
endFunction

bool function OpenChildMenu(FWChildActor Child) Global
	if Child==none
		return false
	endif
	Child.OpenSkillMenu()
endFunction

string Function GetPercentage(float percentage, int Decimal=0, bool bDecimalBase=true) global
	If percentage < 0.0001
		Return "< 1"
	EndIf
	if Decimal==0 && bDecimalBase
		Return Math.Floor(percentage * 100) as string
	elseif Decimal==1 && bDecimalBase
		Return (Math.Floor(percentage * 100) as string) + "." + ((Math.Floor(percentage * 1000) % 10) as string)
	elseif Decimal==2 && bDecimalBase
		Return (Math.Floor(percentage * 100) as string) + "." + ((Math.Floor(percentage * 10000) % 100) as string)
	elseif Decimal==3 && bDecimalBase
		Return (Math.Floor(percentage * 100) as string) + "." + ((Math.Floor(percentage * 100000) % 1000) as string)
	
	elseif Decimal==0 && !bDecimalBase
		Return Math.Floor(percentage) as string
	elseif Decimal==1 && !bDecimalBase
		Return (Math.Floor(percentage) as string) + "." + ((Math.Floor(percentage * 10) % 10) as string)
	elseif Decimal==2 && !bDecimalBase
		Return (Math.Floor(percentage) as string) + "." + ((Math.Floor(percentage * 100) % 100) as string)
	elseif Decimal==3 && !bDecimalBase
		Return (Math.Floor(percentage) as string) + "." + ((Math.Floor(percentage * 1000) % 1000) as string)
	elseif Decimal==4 && !bDecimalBase
		Return (Math.Floor(percentage) as string) + "." + ((Math.Floor(percentage * 10000) % 10000) as string)
	elseif Decimal==5 && !bDecimalBase
		Return (Math.Floor(percentage) as string) + "." + ((Math.Floor(percentage * 100000) % 100000) as string)
	endif
EndFunction

;string function StringReplace(string Text, string Find, string Replace) global
;	bool bRunning=true
;	int FindLen = StringUtil.GetLength(Find)
;	int TextLen = StringUtil.GetLength(Text)
;	int pos=0
;	while bRunning
;		pos = StringUtil.Find(Text, Find,0)
;		if pos==-1
;			bRunning=false
;		elseif pos==0
;			Text = Replace + StringUtil.Substring(Text,pos + FindLen)
;		elseif pos+FindLen>=TextLen
;			Text = StringUtil.Substring(Text,0,pos) + Replace
;		else
;			Text = StringUtil.Substring(Text,0,pos) + Replace + StringUtil.Substring(Text,pos + FindLen)
;		endIf
;	endWhile
;	pos=0
;	bRunning=true
;	while bRunning
;		pos = StringUtil.Find(Text, "\\n",0)
;		if pos<0
;			bRunning=false
;		elseif pos==0
;			Text = "\n" + StringUtil.Substring(Text,pos + 2)
;		elseif pos+3>=TextLen
;			Text = StringUtil.Substring(Text,0,pos) + "\n"
;		else
;			Text = StringUtil.Substring(Text,0,pos) + "\n" + StringUtil.Substring(Text,pos + 2)
;		endIf
;	endWhile
;	return Text
;endFunction
string function StringReplace(string Text, string Find, string Replace) global native

string function ArrayReplace(string Text, string[] Replace) global
	int c=Replace.Length
	while c>0
		c-=1
		Text = StringReplace(Text, "{"+c+"}",Replace[c])
	endWhile
	return Text
endFunction

;string function MultiStringReplace(string Text, string Replace0="", string Replace1="", string Replace2="", string Replace3="", string Replace4="", string Replace5="") global
;	if Replace0!=""
;		Text = StringReplace(Text, "{0}",Replace0)
;	endif
;	if Replace1!=""
;		Text = StringReplace(Text, "{1}",Replace1)
;	endif
;	if Replace2!=""
;		Text = StringReplace(Text, "{2}",Replace2)
;	endif
;	if Replace3!=""
;		Text = StringReplace(Text, "{3}",Replace3)
;	endif
;	if Replace4!=""
;		Text = StringReplace(Text, "{4}",Replace4)
;	endif
;	if Replace5!=""
;		Text = StringReplace(Text, "{5}",Replace5)
;	endif
;	return Text
;endFunction
string function MultiStringReplace(string Text, string Replace0="", string Replace1="", string Replace2="", string Replace3="", string Replace4="", string Replace5="") global native

string function getIniValue(string iniContent, string Variable, string default="")
	int pos=0
	int varLen=StringUtil.GetLength(Variable)+2
	pos = StringUtil.Find(iniContent, "$"+Variable+"=",pos)
	if pos>=0
		int len1=StringUtil.Find(iniContent, StringUtil.AsChar(13),pos)
		int len2=StringUtil.Find(iniContent, StringUtil.AsChar(10),pos)
		int len=0
		if len1<len2 && len1>=0
			len=len1
		else
			len=len2
		endif
		if len==-1
			return StringUtil.Substring(iniContent,pos+varLen)
		else
			return StringUtil.Substring(iniContent,pos+varLen, len - varLen - pos)
		endif
	endIf
	return ""
endfunction

string function _getStateName_(int StateID) Global
	if StateID==0
		return "Follicular Phase"
	elseif StateID==1
		return "Ovulation"
	elseif StateID==2
		return "Luteal Phase"
	elseif StateID==3
		return "Menstruation"
	elseif StateID==4
		return "1st Pregnancy State"
	elseif StateID==5
		return "2nd Pregnancy State"
	elseif StateID==6
		return "3rd Pregnancy State"
	elseif StateID==7
		return "LaborPains"
	elseif StateID==8
		return "Recovery Phase"
	elseif StateID==20
		return "Pregnant"
	elseif StateID==21
		return "Pregnant by chaurus"
	endIf
endFunction

string function getStateNameTranslated(int StateID) Global
	return "$FW_MENU_INFO_StateName"+StateID
endFunction


; Numeric functions

Float Function ClampFloat(Float a, Float min, Float max) Global
	If a < min
		Return min
	ElseIf a > max
		Return max
	EndIf
	Return a
EndFunction

Float Function MaxFloat(Float a, Float b) Global
	If b < a
		Return a
	EndIf
	Return b
EndFunction

Float Function MinFloat(Float a, Float b) Global
	If a < b
		Return a
	EndIf
	Return b
EndFunction

float function RangedFloat(float value, float Min, float Max) global
	if value <Min
		return Min
	elseif value>Max
		return Max
	else
		return value
	endif
endFunction

Float Function SwitchFloat(Bool cond, Float a, Float b) Global
	If cond
		Return a
	EndIf
	Return b
EndFunction

Int Function ClampInt(Int a, Int min, Int max) Global
	If a < min
		Return min
	ElseIf a > max
		Return max
	EndIf
	Return a
EndFunction

Int Function MaxInt(Int a, Int b) Global
	If b < a
		Return a
	EndIf
	Return b
EndFunction

Int Function MinInt(Int a, Int b) Global
	If a < b
		Return a
	EndIf
	Return b
EndFunction

int function RangedInt(int value, int Min, int Max) global
	if value <Min
		return Min
	elseif value>Max
		return Max
	else
		return value
	endif
endFunction

Int Function SwitchInt(Bool cond, Int a, Int b) Global
	If cond
		Return a
	EndIf
	Return b
EndFunction


; String functions

String Function SwitchString(Bool cond, String a="true", String b="false") Global
	If cond
		Return a
	EndIf
	Return b
EndFunction

function UnequipItem(actor a, form item) Global
	if item != none && a!=none
		if a.IsEquipped(item)
			a.UnequipItem(item, true, true)
		endif
		a.RemoveItem(item, 1, true)
	endIf 
endFunction

function EquipItem(actor a, form item) Global
	if item != none && a!=none
		a.addItem(item, 1, true)
		if !a.IsEquipped(item)
			a.EquipItem(item, false, true)	
		endif
	endIf 
endFunction

function ActorAddSpell(actor a,Spell s, bool PlayerOnly = false, bool bIsCast = false) Global
	if s!=none && a!=none
		if ((PlayerOnly == true && Game.GetPlayer() == a) || PlayerOnly == false) && a.HasSpell(s)==false
			if bIsCast
				location curLoc = a.GetCurrentLocation()
				if curLoc!=none
					if a.Is3DLoaded() && curLoc.IsLoaded()
						s.Cast(a,a)
					endif
				endif
			else
				a.addSpell(s)
			endif
		endIf
	endif
endFunction

function ActorRemoveSpell(actor a, Spell s) Global
	if s!=none && a!=none
		if a.HasSpell(s)
			a.RemoveSpell(s)
		endIf
	endIf
endFunction

function ActorAddSpells(actor a,Spell[] sa, bool PlayerOnly=false, bool bIsCast = false) Global
	if a==none
		return
	endif
	int i=0
	int c=sa.length
	while i < c
		ActorAddSpell(a,sa[i],PlayerOnly,bIsCast)
		i+=1
	endWhile
endFunction

function ActorAddSpellsS(actor a,string sa, bool PlayerOnly=false, bool bIsCast = false) Global
	if a==none
		return
	endif
	int c=StorageUtil.FormListCount(none,"FW.AddOn."+sa)
	while c>0
		c-=1
		spell s = StorageUtil.FormListGet(none,"FW.AddOn."+sa,c) as spell
		if s!=none
			ActorAddSpell(a,s,PlayerOnly,bIsCast)
		endif
	endWhile
endFunction

function ActorRemoveSpells(actor a,Spell[] sa) Global
	if a==none
		return
	endif
	int i=0
	int c=sa.length
	while i < c
		ActorRemoveSpell(a,sa[i])
		i+=1
	endWhile
endFunction

function ActorRemoveSpellsS(actor a,string sa) Global
	if a==none
		return
	endif
	int c=StorageUtil.FormListCount(none,"FW.AddOn."+sa)
	while c>0
		c-=1
		spell s = StorageUtil.FormListGet(none,"FW.AddOn."+sa,c) as spell
		ActorRemoveSpell(a,s)
	endWhile
endFunction

function LockPlayer() global
	actor PlayerRef=Game.GetPlayer()
	Game.ForceThirdPerson()
	Game.SetPlayerAIDriven(true)
	Game.SetInChargen(true, true, false)
	;PlayerRef.SetDontMove(true)
	;PlayerRef.SetRestrained(true)
endFunction

function UnlockPlayer() global
	actor PlayerRef=Game.GetPlayer()
	Game.SetPlayerAIDriven(false)
	;PlayerRef.SetDontMove(false)
	;PlayerRef.SetRestrained(false)
	Game.SetInChargen(false, false, false)
endFunction


string function GetNames(actor[] Actors) global
	string tmp=""
	int i=0
	int c=Actors.length
	bool bFirst=true
	while i<c
		if Actors[i]!=none && Actors[i].GetLeveledActorBase()!=none && Actors[i].GetLeveledActorBase().GetName() != ""
			if bFirst==false
				tmp+=", "
			endif
			tmp+=Actors[i].GetLeveledActorBase().GetName()
			bFirst=false
		endif
		i+=1
	endwhile
	return tmp
endfunction

float function floatModulo(float Value, float Mod) global
	float tmpval=Value
	while tmpval >=Mod
		tmpval-=Mod
	endwhile
	return tmpval
endfunction

Form[] function FormArrayConcat(Form[] f1, Form[] f2) global
	if f1.Length==0
		return f2
	elseif f2.length==0
		return f1
	else
		int n = f1.length + f2.Length
		int f1l = f1.length
		int f2l = f2.length
		if n>128
			f2l=128-f1l
		endif
		Form[] fn = FormArray(n)
		int i = 0
		while i<f1l
			fn[f1l]=f1[f1l]
			i+=1
		endwhile
		i=0
		while i<f2l
			fn[i+f2l]=f2[i]
			i+=1
		endwhile
	endif
endFunction

Actor[] function removeDuplicatedActors(Actor[] list) global
	int i=0
	int j=0
	int c=list.length
	int s=0
	while i<c - 1
		j=i+1
		while j<c
			if list[i]==list[j]
				list[j]=none
				s+=1
			endif
			j+=1
		endwhile
		i+=1
	endwhile
	Actor[] res=ActorArray(s)
	i=0
	j=0
	while i<c
		if list[i]!=none
			res[j]=list[i]
		endif
		i+=1
	endwhile
	return res
endfunction


Actor[] function ActorArrayAppend(Actor[] OldArray, actor Append, int Count=1) global
;	if OldArray==none
;		actor[] t = ActorArray(Count)
;		while Count>0
;			Count-=1
;			t[Count]=Append
;		endwhile
;		return t
;	endif
	int c=OldArray.length
	if c==0
		actor[] t=ActorArray(Count)
		while Count>0
			Count-=1
			t[Count]=Append
		endwhile
		return t
	elseif c>127
		return OldArray
	endif
	if c+Count>127
		Count = 127
	endif
	actor[] na= ActorArray(c + Count)
	while Count>0
		Count-=1
		na[c+Count]=Append
	endwhile
	while c>0
		c-=1
		na[c]=OldArray[c]
	endwhile
	return na
endfunction

Actor[] function ActorArrayResize(Actor[] OldArray, int NewSize) global
	Actor[] res = ActorArray(NewSize)
	int i=0
	while i<NewSize && i<OldArray.length
		res[i]=OldArray[i]
		i+=1
	endwhile
	return res
endFunction

Actor[] function ActorArrayUnique(Actor[] a) global
	if a.length<2
		return a
	endif
	int newLen = a.length
	int c=a.length
	int i=0
	while i<c - 1
		if a.find(a[i],i+1) != -1
			a[i]=none
			newLen-=1
		endif
		i+=1
	endWhile
	Actor[] new_a = ActorArray(newLen)
	i=0
	int ni = 0
	while i<c
		if a[i]!=none
			new_a[ni]=a[i]
			ni+=1
		endif
		i+=1
	endWhile
	return new_a
endfunction


Float[] function FloatArrayAppend(Float[] OldArray, Float Append) global
	int c=OldArray.length
	if c==0
		Float[] t=new Float[1]
		t[0]=Append
		return t
	elseif c>127
		return OldArray
	endif
	Float[] na= FloatArray(c + 1)
	na[c]=Append
	while c>0
		c-=1
		na[c]=OldArray[c]
	endwhile
	return na
endfunction

Float[] function FloatArrayResize(Float[] OldArray, int NewSize) global
	Float[] res = FloatArray(NewSize)
	int i=0
	while i<NewSize && i<OldArray.length
		res[i]=OldArray[i]
		i+=1
	endwhile
	return res
endFunction

int[] function IntArrayAppend(int[] OldArray, int Append) global
	int c=OldArray.length
	if c==0
		int[] t=new int[1]
		t[0]=Append
		return t
	elseif c>127
		return OldArray
	endif
	int[] na= IntArray(c + 1)
	na[c]=Append
	while c>0
		c-=1
		na[c]=OldArray[c]
	endwhile
	return na
endfunction

int[] function IntArrayResize(int[] OldArray, int NewSize) global
	int[] res = IntArray(NewSize)
	int i=0
	while i<NewSize && i<OldArray.length
		res[i]=OldArray[i]
		i+=1
	endwhile
	return res
endFunction


; Array Functions

Actor[] Function ActorArray(Int size) Global
	size = ClampInt(size, 1, 128)
	
	If size > 64
		If size > 96
			If size > 112
				If size > 120
					If size > 124
						If size > 126
							If size == 128
								Return New Actor[128]
							Else
								Return New Actor[127]
							EndIf
						Else
							If size == 126
								Return New Actor[126]
							Else
								Return New Actor[125]
							EndIf
						EndIf
					Else
						If size > 122
							If size == 124
								Return New Actor[124]
							Else
								Return New Actor[123]
							EndIf
						Else
							If size == 122
								Return New Actor[122]
							Else
								Return New Actor[121]
							EndIf
						EndIf
					EndIf
				Else
					If size > 116
						If size > 118
							If size == 120
								Return New Actor[120]
							Else
								Return New Actor[119]
							EndIf
						Else
							If size == 118
								Return New Actor[118]
							Else
								Return New Actor[117]
							EndIf
						EndIf
					Else
						If size > 114
							If size == 116
								Return New Actor[116]
							Else
								Return New Actor[115]
							EndIf
						Else
							If size == 114
								Return New Actor[114]
							Else
								Return New Actor[113]
							EndIf
						EndIf
					EndIf
				EndIf
			Else
				If size > 104
					If size > 108
						If size > 110
							If size == 112
								Return New Actor[112]
							Else
								Return New Actor[111]
							EndIf
						Else
							If size == 110
								Return New Actor[110]
							Else
								Return New Actor[109]
							EndIf
						EndIf
					Else
						If size > 106
							If size == 108
								Return New Actor[108]
							Else
								Return New Actor[107]
							EndIf
						Else
							If size == 106
								Return New Actor[106]
							Else
								Return New Actor[105]
							EndIf
						EndIf
					EndIf
				Else
					If size > 100
						If size > 102
							If size == 104
								Return New Actor[104]
							Else
								Return New Actor[103]
							EndIf
						Else
							If size == 102
								Return New Actor[102]
							Else
								Return New Actor[101]
							EndIf
						EndIf
					Else
						If size > 98
							If size == 100
								Return New Actor[100]
							Else
								Return New Actor[99]
							EndIf
						Else
							If size == 98
								Return New Actor[98]
							Else
								Return New Actor[97]
							EndIf
						EndIf
					EndIf
				EndIf
			EndIf
		Else
			If size > 80
				If size > 88
					If size > 92
						If size > 94
							If size == 96
								Return New Actor[96]
							Else
								Return New Actor[95]
							EndIf
						Else
							If size == 94
								Return New Actor[94]
							Else
								Return New Actor[93]
							EndIf
						EndIf
					Else
						If size > 90
							If size == 92
								Return New Actor[92]
							Else
								Return New Actor[91]
							EndIf
						Else
							If size == 90
								Return New Actor[90]
							Else
								Return New Actor[89]
							EndIf
						EndIf
					EndIf
				Else
					If size > 84
						If size > 86
							If size == 88
								Return New Actor[88]
							Else
								Return New Actor[87]
							EndIf
						Else
							If size == 86
								Return New Actor[86]
							Else
								Return New Actor[85]
							EndIf
						EndIf
					Else
						If size > 82
							If size == 84
								Return New Actor[84]
							Else
								Return New Actor[83]
							EndIf
						Else
							If size == 82
								Return New Actor[82]
							Else
								Return New Actor[81]
							EndIf
						EndIf
					EndIf
				EndIf
			Else
				If size > 72
					If size > 76
						If size > 78
							If size == 80
								Return New Actor[80]
							Else
								Return New Actor[79]
							EndIf
						Else
							If size == 78
								Return New Actor[78]
							Else
								Return New Actor[77]
							EndIf
						EndIf
					Else
						If size > 74
							If size == 76
								Return New Actor[76]
							Else
								Return New Actor[75]
							EndIf
						Else
							If size == 74
								Return New Actor[74]
							Else
								Return New Actor[73]
							EndIf
						EndIf
					EndIf
				Else
					If size > 68
						If size > 70
							If size == 72
								Return New Actor[72]
							Else
								Return New Actor[71]
							EndIf
						Else
							If size == 70
								Return New Actor[70]
							Else
								Return New Actor[69]
							EndIf
						EndIf
					Else
						If size > 66
							If size == 68
								Return New Actor[68]
							Else
								Return New Actor[67]
							EndIf
						Else
							If size == 66
								Return New Actor[66]
							Else
								Return New Actor[65]
							EndIf
						EndIf
					EndIf
				EndIf
			EndIf
		EndIf
	Else
		If size > 32
			If size > 48
				If size > 56
					If size > 60
						If size > 62
							If size == 64
								Return New Actor[64]
							Else
								Return New Actor[63]
							EndIf
						Else
							If size == 62
								Return New Actor[62]
							Else
								Return New Actor[61]
							EndIf
						EndIf
					Else
						If size > 58
							If size == 60
								Return New Actor[60]
							Else
								Return New Actor[59]
							EndIf
						Else
							If size == 58
								Return New Actor[58]
							Else
								Return New Actor[57]
							EndIf
						EndIf
					EndIf
				Else
					If size > 52
						If size > 54
							If size == 56
								Return New Actor[56]
							Else
								Return New Actor[55]
							EndIf
						Else
							If size == 54
								Return New Actor[54]
							Else
								Return New Actor[53]
							EndIf
						EndIf
					Else
						If size > 50
							If size == 52
								Return New Actor[52]
							Else
								Return New Actor[51]
							EndIf
						Else
							If size == 50
								Return New Actor[50]
							Else
								Return New Actor[49]
							EndIf
						EndIf
					EndIf
				EndIf
			Else
				If size > 40
					If size > 44
						If size > 46
							If size == 48
								Return New Actor[48]
							Else
								Return New Actor[47]
							EndIf
						Else
							If size == 46
								Return New Actor[46]
							Else
								Return New Actor[45]
							EndIf
						EndIf
					Else
						If size > 42
							If size == 44
								Return New Actor[44]
							Else
								Return New Actor[43]
							EndIf
						Else
							If size == 42
								Return New Actor[42]
							Else
								Return New Actor[41]
							EndIf
						EndIf
					EndIf
				Else
					If size > 36
						If size > 38
							If size == 40
								Return New Actor[40]
							Else
								Return New Actor[39]
							EndIf
						Else
							If size == 38
								Return New Actor[38]
							Else
								Return New Actor[37]
							EndIf
						EndIf
					Else
						If size > 34
							If size == 36
								Return New Actor[36]
							Else
								Return New Actor[35]
							EndIf
						Else
							If size == 34
								Return New Actor[34]
							Else
								Return New Actor[33]
							EndIf
						EndIf
					EndIf
				EndIf
			EndIf
		Else
			If size > 16
				If size > 24
					If size > 28
						If size > 30
							If size == 32
								Return New Actor[32]
							Else
								Return New Actor[31]
							EndIf
						Else
							If size == 30
								Return New Actor[30]
							Else
								Return New Actor[29]
							EndIf
						EndIf
					Else
						If size > 26
							If size == 28
								Return New Actor[28]
							Else
								Return New Actor[27]
							EndIf
						Else
							If size == 26
								Return New Actor[26]
							Else
								Return New Actor[25]
							EndIf
						EndIf
					EndIf
				Else
					If size > 20
						If size > 22
							If size == 24
								Return New Actor[24]
							Else
								Return New Actor[23]
							EndIf
						Else
							If size == 22
								Return New Actor[22]
							Else
								Return New Actor[21]
							EndIf
						EndIf
					Else
						If size > 18
							If size == 20
								Return New Actor[20]
							Else
								Return New Actor[19]
							EndIf
						Else
							If size == 18
								Return New Actor[18]
							Else
								Return New Actor[17]
							EndIf
						EndIf
					EndIf
				EndIf
			Else
				If size > 8
					If size > 12
						If size > 14
							If size == 16
								Return New Actor[16]
							Else
								Return New Actor[15]
							EndIf
						Else
							If size == 14
								Return New Actor[14]
							Else
								Return New Actor[13]
							EndIf
						EndIf
					Else
						If size > 10
							If size == 12
								Return New Actor[12]
							Else
								Return New Actor[11]
							EndIf
						Else
							If size == 10
								Return New Actor[10]
							Else
								Return New Actor[9]
							EndIf
						EndIf
					EndIf
				Else
					If size > 4
						If size > 6
							If size == 8
								Return New Actor[8]
							Else
								Return New Actor[7]
							EndIf
						Else
							If size == 6
								Return New Actor[6]
							Else
								Return New Actor[5]
							EndIf
						EndIf
					Else
						If size > 2
							If size == 4
								Return New Actor[4]
							Else
								Return New Actor[3]
							EndIf
						Else
							If size == 2
								Return New Actor[2]
							Else
								Return New Actor[1]
							EndIf
						EndIf
					EndIf
				EndIf
			EndIf
		EndIf
	EndIf
EndFunction

ActorBase[] Function ActorBaseArray(Int size) Global
	size = ClampInt(size, 1, 128)
	
	If size > 64
		If size > 96
			If size > 112
				If size > 120
					If size > 124
						If size > 126
							If size == 128
								Return New ActorBase[128]
							Else
								Return New ActorBase[127]
							EndIf
						Else
							If size == 126
								Return New ActorBase[126]
							Else
								Return New ActorBase[125]
							EndIf
						EndIf
					Else
						If size > 122
							If size == 124
								Return New ActorBase[124]
							Else
								Return New ActorBase[123]
							EndIf
						Else
							If size == 122
								Return New ActorBase[122]
							Else
								Return New ActorBase[121]
							EndIf
						EndIf
					EndIf
				Else
					If size > 116
						If size > 118
							If size == 120
								Return New ActorBase[120]
							Else
								Return New ActorBase[119]
							EndIf
						Else
							If size == 118
								Return New ActorBase[118]
							Else
								Return New ActorBase[117]
							EndIf
						EndIf
					Else
						If size > 114
							If size == 116
								Return New ActorBase[116]
							Else
								Return New ActorBase[115]
							EndIf
						Else
							If size == 114
								Return New ActorBase[114]
							Else
								Return New ActorBase[113]
							EndIf
						EndIf
					EndIf
				EndIf
			Else
				If size > 104
					If size > 108
						If size > 110
							If size == 112
								Return New ActorBase[112]
							Else
								Return New ActorBase[111]
							EndIf
						Else
							If size == 110
								Return New ActorBase[110]
							Else
								Return New ActorBase[109]
							EndIf
						EndIf
					Else
						If size > 106
							If size == 108
								Return New ActorBase[108]
							Else
								Return New ActorBase[107]
							EndIf
						Else
							If size == 106
								Return New ActorBase[106]
							Else
								Return New ActorBase[105]
							EndIf
						EndIf
					EndIf
				Else
					If size > 100
						If size > 102
							If size == 104
								Return New ActorBase[104]
							Else
								Return New ActorBase[103]
							EndIf
						Else
							If size == 102
								Return New ActorBase[102]
							Else
								Return New ActorBase[101]
							EndIf
						EndIf
					Else
						If size > 98
							If size == 100
								Return New ActorBase[100]
							Else
								Return New ActorBase[99]
							EndIf
						Else
							If size == 98
								Return New ActorBase[98]
							Else
								Return New ActorBase[97]
							EndIf
						EndIf
					EndIf
				EndIf
			EndIf
		Else
			If size > 80
				If size > 88
					If size > 92
						If size > 94
							If size == 96
								Return New ActorBase[96]
							Else
								Return New ActorBase[95]
							EndIf
						Else
							If size == 94
								Return New ActorBase[94]
							Else
								Return New ActorBase[93]
							EndIf
						EndIf
					Else
						If size > 90
							If size == 92
								Return New ActorBase[92]
							Else
								Return New ActorBase[91]
							EndIf
						Else
							If size == 90
								Return New ActorBase[90]
							Else
								Return New ActorBase[89]
							EndIf
						EndIf
					EndIf
				Else
					If size > 84
						If size > 86
							If size == 88
								Return New ActorBase[88]
							Else
								Return New ActorBase[87]
							EndIf
						Else
							If size == 86
								Return New ActorBase[86]
							Else
								Return New ActorBase[85]
							EndIf
						EndIf
					Else
						If size > 82
							If size == 84
								Return New ActorBase[84]
							Else
								Return New ActorBase[83]
							EndIf
						Else
							If size == 82
								Return New ActorBase[82]
							Else
								Return New ActorBase[81]
							EndIf
						EndIf
					EndIf
				EndIf
			Else
				If size > 72
					If size > 76
						If size > 78
							If size == 80
								Return New ActorBase[80]
							Else
								Return New ActorBase[79]
							EndIf
						Else
							If size == 78
								Return New ActorBase[78]
							Else
								Return New ActorBase[77]
							EndIf
						EndIf
					Else
						If size > 74
							If size == 76
								Return New ActorBase[76]
							Else
								Return New ActorBase[75]
							EndIf
						Else
							If size == 74
								Return New ActorBase[74]
							Else
								Return New ActorBase[73]
							EndIf
						EndIf
					EndIf
				Else
					If size > 68
						If size > 70
							If size == 72
								Return New ActorBase[72]
							Else
								Return New ActorBase[71]
							EndIf
						Else
							If size == 70
								Return New ActorBase[70]
							Else
								Return New ActorBase[69]
							EndIf
						EndIf
					Else
						If size > 66
							If size == 68
								Return New ActorBase[68]
							Else
								Return New ActorBase[67]
							EndIf
						Else
							If size == 66
								Return New ActorBase[66]
							Else
								Return New ActorBase[65]
							EndIf
						EndIf
					EndIf
				EndIf
			EndIf
		EndIf
	Else
		If size > 32
			If size > 48
				If size > 56
					If size > 60
						If size > 62
							If size == 64
								Return New ActorBase[64]
							Else
								Return New ActorBase[63]
							EndIf
						Else
							If size == 62
								Return New ActorBase[62]
							Else
								Return New ActorBase[61]
							EndIf
						EndIf
					Else
						If size > 58
							If size == 60
								Return New ActorBase[60]
							Else
								Return New ActorBase[59]
							EndIf
						Else
							If size == 58
								Return New ActorBase[58]
							Else
								Return New ActorBase[57]
							EndIf
						EndIf
					EndIf
				Else
					If size > 52
						If size > 54
							If size == 56
								Return New ActorBase[56]
							Else
								Return New ActorBase[55]
							EndIf
						Else
							If size == 54
								Return New ActorBase[54]
							Else
								Return New ActorBase[53]
							EndIf
						EndIf
					Else
						If size > 50
							If size == 52
								Return New ActorBase[52]
							Else
								Return New ActorBase[51]
							EndIf
						Else
							If size == 50
								Return New ActorBase[50]
							Else
								Return New ActorBase[49]
							EndIf
						EndIf
					EndIf
				EndIf
			Else
				If size > 40
					If size > 44
						If size > 46
							If size == 48
								Return New ActorBase[48]
							Else
								Return New ActorBase[47]
							EndIf
						Else
							If size == 46
								Return New ActorBase[46]
							Else
								Return New ActorBase[45]
							EndIf
						EndIf
					Else
						If size > 42
							If size == 44
								Return New ActorBase[44]
							Else
								Return New ActorBase[43]
							EndIf
						Else
							If size == 42
								Return New ActorBase[42]
							Else
								Return New ActorBase[41]
							EndIf
						EndIf
					EndIf
				Else
					If size > 36
						If size > 38
							If size == 40
								Return New ActorBase[40]
							Else
								Return New ActorBase[39]
							EndIf
						Else
							If size == 38
								Return New ActorBase[38]
							Else
								Return New ActorBase[37]
							EndIf
						EndIf
					Else
						If size > 34
							If size == 36
								Return New ActorBase[36]
							Else
								Return New ActorBase[35]
							EndIf
						Else
							If size == 34
								Return New ActorBase[34]
							Else
								Return New ActorBase[33]
							EndIf
						EndIf
					EndIf
				EndIf
			EndIf
		Else
			If size > 16
				If size > 24
					If size > 28
						If size > 30
							If size == 32
								Return New ActorBase[32]
							Else
								Return New ActorBase[31]
							EndIf
						Else
							If size == 30
								Return New ActorBase[30]
							Else
								Return New ActorBase[29]
							EndIf
						EndIf
					Else
						If size > 26
							If size == 28
								Return New ActorBase[28]
							Else
								Return New ActorBase[27]
							EndIf
						Else
							If size == 26
								Return New ActorBase[26]
							Else
								Return New ActorBase[25]
							EndIf
						EndIf
					EndIf
				Else
					If size > 20
						If size > 22
							If size == 24
								Return New ActorBase[24]
							Else
								Return New ActorBase[23]
							EndIf
						Else
							If size == 22
								Return New ActorBase[22]
							Else
								Return New ActorBase[21]
							EndIf
						EndIf
					Else
						If size > 18
							If size == 20
								Return New ActorBase[20]
							Else
								Return New ActorBase[19]
							EndIf
						Else
							If size == 18
								Return New ActorBase[18]
							Else
								Return New ActorBase[17]
							EndIf
						EndIf
					EndIf
				EndIf
			Else
				If size > 8
					If size > 12
						If size > 14
							If size == 16
								Return New ActorBase[16]
							Else
								Return New ActorBase[15]
							EndIf
						Else
							If size == 14
								Return New ActorBase[14]
							Else
								Return New ActorBase[13]
							EndIf
						EndIf
					Else
						If size > 10
							If size == 12
								Return New ActorBase[12]
							Else
								Return New ActorBase[11]
							EndIf
						Else
							If size == 10
								Return New ActorBase[10]
							Else
								Return New ActorBase[9]
							EndIf
						EndIf
					EndIf
				Else
					If size > 4
						If size > 6
							If size == 8
								Return New ActorBase[8]
							Else
								Return New ActorBase[7]
							EndIf
						Else
							If size == 6
								Return New ActorBase[6]
							Else
								Return New ActorBase[5]
							EndIf
						EndIf
					Else
						If size > 2
							If size == 4
								Return New ActorBase[4]
							Else
								Return New ActorBase[3]
							EndIf
						Else
							If size == 2
								Return New ActorBase[2]
							Else
								Return New ActorBase[1]
							EndIf
						EndIf
					EndIf
				EndIf
			EndIf
		EndIf
	EndIf
EndFunction

Bool[] Function BoolArray(Int size) Global
	size = ClampInt(size, 1, 128)
	
	If size > 64
		If size > 96
			If size > 112
				If size > 120
					If size > 124
						If size > 126
							If size == 128
								Return New Bool[128]
							Else
								Return New Bool[127]
							EndIf
						Else
							If size == 126
								Return New Bool[126]
							Else
								Return New Bool[125]
							EndIf
						EndIf
					Else
						If size > 122
							If size == 124
								Return New Bool[124]
							Else
								Return New Bool[123]
							EndIf
						Else
							If size == 122
								Return New Bool[122]
							Else
								Return New Bool[121]
							EndIf
						EndIf
					EndIf
				Else
					If size > 116
						If size > 118
							If size == 120
								Return New Bool[120]
							Else
								Return New Bool[119]
							EndIf
						Else
							If size == 118
								Return New Bool[118]
							Else
								Return New Bool[117]
							EndIf
						EndIf
					Else
						If size > 114
							If size == 116
								Return New Bool[116]
							Else
								Return New Bool[115]
							EndIf
						Else
							If size == 114
								Return New Bool[114]
							Else
								Return New Bool[113]
							EndIf
						EndIf
					EndIf
				EndIf
			Else
				If size > 104
					If size > 108
						If size > 110
							If size == 112
								Return New Bool[112]
							Else
								Return New Bool[111]
							EndIf
						Else
							If size == 110
								Return New Bool[110]
							Else
								Return New Bool[109]
							EndIf
						EndIf
					Else
						If size > 106
							If size == 108
								Return New Bool[108]
							Else
								Return New Bool[107]
							EndIf
						Else
							If size == 106
								Return New Bool[106]
							Else
								Return New Bool[105]
							EndIf
						EndIf
					EndIf
				Else
					If size > 100
						If size > 102
							If size == 104
								Return New Bool[104]
							Else
								Return New Bool[103]
							EndIf
						Else
							If size == 102
								Return New Bool[102]
							Else
								Return New Bool[101]
							EndIf
						EndIf
					Else
						If size > 98
							If size == 100
								Return New Bool[100]
							Else
								Return New Bool[99]
							EndIf
						Else
							If size == 98
								Return New Bool[98]
							Else
								Return New Bool[97]
							EndIf
						EndIf
					EndIf
				EndIf
			EndIf
		Else
			If size > 80
				If size > 88
					If size > 92
						If size > 94
							If size == 96
								Return New Bool[96]
							Else
								Return New Bool[95]
							EndIf
						Else
							If size == 94
								Return New Bool[94]
							Else
								Return New Bool[93]
							EndIf
						EndIf
					Else
						If size > 90
							If size == 92
								Return New Bool[92]
							Else
								Return New Bool[91]
							EndIf
						Else
							If size == 90
								Return New Bool[90]
							Else
								Return New Bool[89]
							EndIf
						EndIf
					EndIf
				Else
					If size > 84
						If size > 86
							If size == 88
								Return New Bool[88]
							Else
								Return New Bool[87]
							EndIf
						Else
							If size == 86
								Return New Bool[86]
							Else
								Return New Bool[85]
							EndIf
						EndIf
					Else
						If size > 82
							If size == 84
								Return New Bool[84]
							Else
								Return New Bool[83]
							EndIf
						Else
							If size == 82
								Return New Bool[82]
							Else
								Return New Bool[81]
							EndIf
						EndIf
					EndIf
				EndIf
			Else
				If size > 72
					If size > 76
						If size > 78
							If size == 80
								Return New Bool[80]
							Else
								Return New Bool[79]
							EndIf
						Else
							If size == 78
								Return New Bool[78]
							Else
								Return New Bool[77]
							EndIf
						EndIf
					Else
						If size > 74
							If size == 76
								Return New Bool[76]
							Else
								Return New Bool[75]
							EndIf
						Else
							If size == 74
								Return New Bool[74]
							Else
								Return New Bool[73]
							EndIf
						EndIf
					EndIf
				Else
					If size > 68
						If size > 70
							If size == 72
								Return New Bool[72]
							Else
								Return New Bool[71]
							EndIf
						Else
							If size == 70
								Return New Bool[70]
							Else
								Return New Bool[69]
							EndIf
						EndIf
					Else
						If size > 66
							If size == 68
								Return New Bool[68]
							Else
								Return New Bool[67]
							EndIf
						Else
							If size == 66
								Return New Bool[66]
							Else
								Return New Bool[65]
							EndIf
						EndIf
					EndIf
				EndIf
			EndIf
		EndIf
	Else
		If size > 32
			If size > 48
				If size > 56
					If size > 60
						If size > 62
							If size == 64
								Return New Bool[64]
							Else
								Return New Bool[63]
							EndIf
						Else
							If size == 62
								Return New Bool[62]
							Else
								Return New Bool[61]
							EndIf
						EndIf
					Else
						If size > 58
							If size == 60
								Return New Bool[60]
							Else
								Return New Bool[59]
							EndIf
						Else
							If size == 58
								Return New Bool[58]
							Else
								Return New Bool[57]
							EndIf
						EndIf
					EndIf
				Else
					If size > 52
						If size > 54
							If size == 56
								Return New Bool[56]
							Else
								Return New Bool[55]
							EndIf
						Else
							If size == 54
								Return New Bool[54]
							Else
								Return New Bool[53]
							EndIf
						EndIf
					Else
						If size > 50
							If size == 52
								Return New Bool[52]
							Else
								Return New Bool[51]
							EndIf
						Else
							If size == 50
								Return New Bool[50]
							Else
								Return New Bool[49]
							EndIf
						EndIf
					EndIf
				EndIf
			Else
				If size > 40
					If size > 44
						If size > 46
							If size == 48
								Return New Bool[48]
							Else
								Return New Bool[47]
							EndIf
						Else
							If size == 46
								Return New Bool[46]
							Else
								Return New Bool[45]
							EndIf
						EndIf
					Else
						If size > 42
							If size == 44
								Return New Bool[44]
							Else
								Return New Bool[43]
							EndIf
						Else
							If size == 42
								Return New Bool[42]
							Else
								Return New Bool[41]
							EndIf
						EndIf
					EndIf
				Else
					If size > 36
						If size > 38
							If size == 40
								Return New Bool[40]
							Else
								Return New Bool[39]
							EndIf
						Else
							If size == 38
								Return New Bool[38]
							Else
								Return New Bool[37]
							EndIf
						EndIf
					Else
						If size > 34
							If size == 36
								Return New Bool[36]
							Else
								Return New Bool[35]
							EndIf
						Else
							If size == 34
								Return New Bool[34]
							Else
								Return New Bool[33]
							EndIf
						EndIf
					EndIf
				EndIf
			EndIf
		Else
			If size > 16
				If size > 24
					If size > 28
						If size > 30
							If size == 32
								Return New Bool[32]
							Else
								Return New Bool[31]
							EndIf
						Else
							If size == 30
								Return New Bool[30]
							Else
								Return New Bool[29]
							EndIf
						EndIf
					Else
						If size > 26
							If size == 28
								Return New Bool[28]
							Else
								Return New Bool[27]
							EndIf
						Else
							If size == 26
								Return New Bool[26]
							Else
								Return New Bool[25]
							EndIf
						EndIf
					EndIf
				Else
					If size > 20
						If size > 22
							If size == 24
								Return New Bool[24]
							Else
								Return New Bool[23]
							EndIf
						Else
							If size == 22
								Return New Bool[22]
							Else
								Return New Bool[21]
							EndIf
						EndIf
					Else
						If size > 18
							If size == 20
								Return New Bool[20]
							Else
								Return New Bool[19]
							EndIf
						Else
							If size == 18
								Return New Bool[18]
							Else
								Return New Bool[17]
							EndIf
						EndIf
					EndIf
				EndIf
			Else
				If size > 8
					If size > 12
						If size > 14
							If size == 16
								Return New Bool[16]
							Else
								Return New Bool[15]
							EndIf
						Else
							If size == 14
								Return New Bool[14]
							Else
								Return New Bool[13]
							EndIf
						EndIf
					Else
						If size > 10
							If size == 12
								Return New Bool[12]
							Else
								Return New Bool[11]
							EndIf
						Else
							If size == 10
								Return New Bool[10]
							Else
								Return New Bool[9]
							EndIf
						EndIf
					EndIf
				Else
					If size > 4
						If size > 6
							If size == 8
								Return New Bool[8]
							Else
								Return New Bool[7]
							EndIf
						Else
							If size == 6
								Return New Bool[6]
							Else
								Return New Bool[5]
							EndIf
						EndIf
					Else
						If size > 2
							If size == 4
								Return New Bool[4]
							Else
								Return New Bool[3]
							EndIf
						Else
							If size == 2
								Return New Bool[2]
							Else
								Return New Bool[1]
							EndIf
						EndIf
					EndIf
				EndIf
			EndIf
		EndIf
	EndIf
EndFunction

Float[] Function FloatArray(Int size) Global
	size = ClampInt(size, 1, 128)
	
	If size > 64
		If size > 96
			If size > 112
				If size > 120
					If size > 124
						If size > 126
							If size == 128
								Return New Float[128]
							Else
								Return New Float[127]
							EndIf
						Else
							If size == 126
								Return New Float[126]
							Else
								Return New Float[125]
							EndIf
						EndIf
					Else
						If size > 122
							If size == 124
								Return New Float[124]
							Else
								Return New Float[123]
							EndIf
						Else
							If size == 122
								Return New Float[122]
							Else
								Return New Float[121]
							EndIf
						EndIf
					EndIf
				Else
					If size > 116
						If size > 118
							If size == 120
								Return New Float[120]
							Else
								Return New Float[119]
							EndIf
						Else
							If size == 118
								Return New Float[118]
							Else
								Return New Float[117]
							EndIf
						EndIf
					Else
						If size > 114
							If size == 116
								Return New Float[116]
							Else
								Return New Float[115]
							EndIf
						Else
							If size == 114
								Return New Float[114]
							Else
								Return New Float[113]
							EndIf
						EndIf
					EndIf
				EndIf
			Else
				If size > 104
					If size > 108
						If size > 110
							If size == 112
								Return New Float[112]
							Else
								Return New Float[111]
							EndIf
						Else
							If size == 110
								Return New Float[110]
							Else
								Return New Float[109]
							EndIf
						EndIf
					Else
						If size > 106
							If size == 108
								Return New Float[108]
							Else
								Return New Float[107]
							EndIf
						Else
							If size == 106
								Return New Float[106]
							Else
								Return New Float[105]
							EndIf
						EndIf
					EndIf
				Else
					If size > 100
						If size > 102
							If size == 104
								Return New Float[104]
							Else
								Return New Float[103]
							EndIf
						Else
							If size == 102
								Return New Float[102]
							Else
								Return New Float[101]
							EndIf
						EndIf
					Else
						If size > 98
							If size == 100
								Return New Float[100]
							Else
								Return New Float[99]
							EndIf
						Else
							If size == 98
								Return New Float[98]
							Else
								Return New Float[97]
							EndIf
						EndIf
					EndIf
				EndIf
			EndIf
		Else
			If size > 80
				If size > 88
					If size > 92
						If size > 94
							If size == 96
								Return New Float[96]
							Else
								Return New Float[95]
							EndIf
						Else
							If size == 94
								Return New Float[94]
							Else
								Return New Float[93]
							EndIf
						EndIf
					Else
						If size > 90
							If size == 92
								Return New Float[92]
							Else
								Return New Float[91]
							EndIf
						Else
							If size == 90
								Return New Float[90]
							Else
								Return New Float[89]
							EndIf
						EndIf
					EndIf
				Else
					If size > 84
						If size > 86
							If size == 88
								Return New Float[88]
							Else
								Return New Float[87]
							EndIf
						Else
							If size == 86
								Return New Float[86]
							Else
								Return New Float[85]
							EndIf
						EndIf
					Else
						If size > 82
							If size == 84
								Return New Float[84]
							Else
								Return New Float[83]
							EndIf
						Else
							If size == 82
								Return New Float[82]
							Else
								Return New Float[81]
							EndIf
						EndIf
					EndIf
				EndIf
			Else
				If size > 72
					If size > 76
						If size > 78
							If size == 80
								Return New Float[80]
							Else
								Return New Float[79]
							EndIf
						Else
							If size == 78
								Return New Float[78]
							Else
								Return New Float[77]
							EndIf
						EndIf
					Else
						If size > 74
							If size == 76
								Return New Float[76]
							Else
								Return New Float[75]
							EndIf
						Else
							If size == 74
								Return New Float[74]
							Else
								Return New Float[73]
							EndIf
						EndIf
					EndIf
				Else
					If size > 68
						If size > 70
							If size == 72
								Return New Float[72]
							Else
								Return New Float[71]
							EndIf
						Else
							If size == 70
								Return New Float[70]
							Else
								Return New Float[69]
							EndIf
						EndIf
					Else
						If size > 66
							If size == 68
								Return New Float[68]
							Else
								Return New Float[67]
							EndIf
						Else
							If size == 66
								Return New Float[66]
							Else
								Return New Float[65]
							EndIf
						EndIf
					EndIf
				EndIf
			EndIf
		EndIf
	Else
		If size > 32
			If size > 48
				If size > 56
					If size > 60
						If size > 62
							If size == 64
								Return New Float[64]
							Else
								Return New Float[63]
							EndIf
						Else
							If size == 62
								Return New Float[62]
							Else
								Return New Float[61]
							EndIf
						EndIf
					Else
						If size > 58
							If size == 60
								Return New Float[60]
							Else
								Return New Float[59]
							EndIf
						Else
							If size == 58
								Return New Float[58]
							Else
								Return New Float[57]
							EndIf
						EndIf
					EndIf
				Else
					If size > 52
						If size > 54
							If size == 56
								Return New Float[56]
							Else
								Return New Float[55]
							EndIf
						Else
							If size == 54
								Return New Float[54]
							Else
								Return New Float[53]
							EndIf
						EndIf
					Else
						If size > 50
							If size == 52
								Return New Float[52]
							Else
								Return New Float[51]
							EndIf
						Else
							If size == 50
								Return New Float[50]
							Else
								Return New Float[49]
							EndIf
						EndIf
					EndIf
				EndIf
			Else
				If size > 40
					If size > 44
						If size > 46
							If size == 48
								Return New Float[48]
							Else
								Return New Float[47]
							EndIf
						Else
							If size == 46
								Return New Float[46]
							Else
								Return New Float[45]
							EndIf
						EndIf
					Else
						If size > 42
							If size == 44
								Return New Float[44]
							Else
								Return New Float[43]
							EndIf
						Else
							If size == 42
								Return New Float[42]
							Else
								Return New Float[41]
							EndIf
						EndIf
					EndIf
				Else
					If size > 36
						If size > 38
							If size == 40
								Return New Float[40]
							Else
								Return New Float[39]
							EndIf
						Else
							If size == 38
								Return New Float[38]
							Else
								Return New Float[37]
							EndIf
						EndIf
					Else
						If size > 34
							If size == 36
								Return New Float[36]
							Else
								Return New Float[35]
							EndIf
						Else
							If size == 34
								Return New Float[34]
							Else
								Return New Float[33]
							EndIf
						EndIf
					EndIf
				EndIf
			EndIf
		Else
			If size > 16
				If size > 24
					If size > 28
						If size > 30
							If size == 32
								Return New Float[32]
							Else
								Return New Float[31]
							EndIf
						Else
							If size == 30
								Return New Float[30]
							Else
								Return New Float[29]
							EndIf
						EndIf
					Else
						If size > 26
							If size == 28
								Return New Float[28]
							Else
								Return New Float[27]
							EndIf
						Else
							If size == 26
								Return New Float[26]
							Else
								Return New Float[25]
							EndIf
						EndIf
					EndIf
				Else
					If size > 20
						If size > 22
							If size == 24
								Return New Float[24]
							Else
								Return New Float[23]
							EndIf
						Else
							If size == 22
								Return New Float[22]
							Else
								Return New Float[21]
							EndIf
						EndIf
					Else
						If size > 18
							If size == 20
								Return New Float[20]
							Else
								Return New Float[19]
							EndIf
						Else
							If size == 18
								Return New Float[18]
							Else
								Return New Float[17]
							EndIf
						EndIf
					EndIf
				EndIf
			Else
				If size > 8
					If size > 12
						If size > 14
							If size == 16
								Return New Float[16]
							Else
								Return New Float[15]
							EndIf
						Else
							If size == 14
								Return New Float[14]
							Else
								Return New Float[13]
							EndIf
						EndIf
					Else
						If size > 10
							If size == 12
								Return New Float[12]
							Else
								Return New Float[11]
							EndIf
						Else
							If size == 10
								Return New Float[10]
							Else
								Return New Float[9]
							EndIf
						EndIf
					EndIf
				Else
					If size > 4
						If size > 6
							If size == 8
								Return New Float[8]
							Else
								Return New Float[7]
							EndIf
						Else
							If size == 6
								Return New Float[6]
							Else
								Return New Float[5]
							EndIf
						EndIf
					Else
						If size > 2
							If size == 4
								Return New Float[4]
							Else
								Return New Float[3]
							EndIf
						Else
							If size == 2
								Return New Float[2]
							Else
								Return New Float[1]
							EndIf
						EndIf
					EndIf
				EndIf
			EndIf
		EndIf
	EndIf
EndFunction

Int[] Function IntArray(Int size) Global
	size = ClampInt(size, 1, 128)
	
	If size > 64
		If size > 96
			If size > 112
				If size > 120
					If size > 124
						If size > 126
							If size == 128
								Return New Int[128]
							Else
								Return New Int[127]
							EndIf
						Else
							If size == 126
								Return New Int[126]
							Else
								Return New Int[125]
							EndIf
						EndIf
					Else
						If size > 122
							If size == 124
								Return New Int[124]
							Else
								Return New Int[123]
							EndIf
						Else
							If size == 122
								Return New Int[122]
							Else
								Return New Int[121]
							EndIf
						EndIf
					EndIf
				Else
					If size > 116
						If size > 118
							If size == 120
								Return New Int[120]
							Else
								Return New Int[119]
							EndIf
						Else
							If size == 118
								Return New Int[118]
							Else
								Return New Int[117]
							EndIf
						EndIf
					Else
						If size > 114
							If size == 116
								Return New Int[116]
							Else
								Return New Int[115]
							EndIf
						Else
							If size == 114
								Return New Int[114]
							Else
								Return New Int[113]
							EndIf
						EndIf
					EndIf
				EndIf
			Else
				If size > 104
					If size > 108
						If size > 110
							If size == 112
								Return New Int[112]
							Else
								Return New Int[111]
							EndIf
						Else
							If size == 110
								Return New Int[110]
							Else
								Return New Int[109]
							EndIf
						EndIf
					Else
						If size > 106
							If size == 108
								Return New Int[108]
							Else
								Return New Int[107]
							EndIf
						Else
							If size == 106
								Return New Int[106]
							Else
								Return New Int[105]
							EndIf
						EndIf
					EndIf
				Else
					If size > 100
						If size > 102
							If size == 104
								Return New Int[104]
							Else
								Return New Int[103]
							EndIf
						Else
							If size == 102
								Return New Int[102]
							Else
								Return New Int[101]
							EndIf
						EndIf
					Else
						If size > 98
							If size == 100
								Return New Int[100]
							Else
								Return New Int[99]
							EndIf
						Else
							If size == 98
								Return New Int[98]
							Else
								Return New Int[97]
							EndIf
						EndIf
					EndIf
				EndIf
			EndIf
		Else
			If size > 80
				If size > 88
					If size > 92
						If size > 94
							If size == 96
								Return New Int[96]
							Else
								Return New Int[95]
							EndIf
						Else
							If size == 94
								Return New Int[94]
							Else
								Return New Int[93]
							EndIf
						EndIf
					Else
						If size > 90
							If size == 92
								Return New Int[92]
							Else
								Return New Int[91]
							EndIf
						Else
							If size == 90
								Return New Int[90]
							Else
								Return New Int[89]
							EndIf
						EndIf
					EndIf
				Else
					If size > 84
						If size > 86
							If size == 88
								Return New Int[88]
							Else
								Return New Int[87]
							EndIf
						Else
							If size == 86
								Return New Int[86]
							Else
								Return New Int[85]
							EndIf
						EndIf
					Else
						If size > 82
							If size == 84
								Return New Int[84]
							Else
								Return New Int[83]
							EndIf
						Else
							If size == 82
								Return New Int[82]
							Else
								Return New Int[81]
							EndIf
						EndIf
					EndIf
				EndIf
			Else
				If size > 72
					If size > 76
						If size > 78
							If size == 80
								Return New Int[80]
							Else
								Return New Int[79]
							EndIf
						Else
							If size == 78
								Return New Int[78]
							Else
								Return New Int[77]
							EndIf
						EndIf
					Else
						If size > 74
							If size == 76
								Return New Int[76]
							Else
								Return New Int[75]
							EndIf
						Else
							If size == 74
								Return New Int[74]
							Else
								Return New Int[73]
							EndIf
						EndIf
					EndIf
				Else
					If size > 68
						If size > 70
							If size == 72
								Return New Int[72]
							Else
								Return New Int[71]
							EndIf
						Else
							If size == 70
								Return New Int[70]
							Else
								Return New Int[69]
							EndIf
						EndIf
					Else
						If size > 66
							If size == 68
								Return New Int[68]
							Else
								Return New Int[67]
							EndIf
						Else
							If size == 66
								Return New Int[66]
							Else
								Return New Int[65]
							EndIf
						EndIf
					EndIf
				EndIf
			EndIf
		EndIf
	Else
		If size > 32
			If size > 48
				If size > 56
					If size > 60
						If size > 62
							If size == 64
								Return New Int[64]
							Else
								Return New Int[63]
							EndIf
						Else
							If size == 62
								Return New Int[62]
							Else
								Return New Int[61]
							EndIf
						EndIf
					Else
						If size > 58
							If size == 60
								Return New Int[60]
							Else
								Return New Int[59]
							EndIf
						Else
							If size == 58
								Return New Int[58]
							Else
								Return New Int[57]
							EndIf
						EndIf
					EndIf
				Else
					If size > 52
						If size > 54
							If size == 56
								Return New Int[56]
							Else
								Return New Int[55]
							EndIf
						Else
							If size == 54
								Return New Int[54]
							Else
								Return New Int[53]
							EndIf
						EndIf
					Else
						If size > 50
							If size == 52
								Return New Int[52]
							Else
								Return New Int[51]
							EndIf
						Else
							If size == 50
								Return New Int[50]
							Else
								Return New Int[49]
							EndIf
						EndIf
					EndIf
				EndIf
			Else
				If size > 40
					If size > 44
						If size > 46
							If size == 48
								Return New Int[48]
							Else
								Return New Int[47]
							EndIf
						Else
							If size == 46
								Return New Int[46]
							Else
								Return New Int[45]
							EndIf
						EndIf
					Else
						If size > 42
							If size == 44
								Return New Int[44]
							Else
								Return New Int[43]
							EndIf
						Else
							If size == 42
								Return New Int[42]
							Else
								Return New Int[41]
							EndIf
						EndIf
					EndIf
				Else
					If size > 36
						If size > 38
							If size == 40
								Return New Int[40]
							Else
								Return New Int[39]
							EndIf
						Else
							If size == 38
								Return New Int[38]
							Else
								Return New Int[37]
							EndIf
						EndIf
					Else
						If size > 34
							If size == 36
								Return New Int[36]
							Else
								Return New Int[35]
							EndIf
						Else
							If size == 34
								Return New Int[34]
							Else
								Return New Int[33]
							EndIf
						EndIf
					EndIf
				EndIf
			EndIf
		Else
			If size > 16
				If size > 24
					If size > 28
						If size > 30
							If size == 32
								Return New Int[32]
							Else
								Return New Int[31]
							EndIf
						Else
							If size == 30
								Return New Int[30]
							Else
								Return New Int[29]
							EndIf
						EndIf
					Else
						If size > 26
							If size == 28
								Return New Int[28]
							Else
								Return New Int[27]
							EndIf
						Else
							If size == 26
								Return New Int[26]
							Else
								Return New Int[25]
							EndIf
						EndIf
					EndIf
				Else
					If size > 20
						If size > 22
							If size == 24
								Return New Int[24]
							Else
								Return New Int[23]
							EndIf
						Else
							If size == 22
								Return New Int[22]
							Else
								Return New Int[21]
							EndIf
						EndIf
					Else
						If size > 18
							If size == 20
								Return New Int[20]
							Else
								Return New Int[19]
							EndIf
						Else
							If size == 18
								Return New Int[18]
							Else
								Return New Int[17]
							EndIf
						EndIf
					EndIf
				EndIf
			Else
				If size > 8
					If size > 12
						If size > 14
							If size == 16
								Return New Int[16]
							Else
								Return New Int[15]
							EndIf
						Else
							If size == 14
								Return New Int[14]
							Else
								Return New Int[13]
							EndIf
						EndIf
					Else
						If size > 10
							If size == 12
								Return New Int[12]
							Else
								Return New Int[11]
							EndIf
						Else
							If size == 10
								Return New Int[10]
							Else
								Return New Int[9]
							EndIf
						EndIf
					EndIf
				Else
					If size > 4
						If size > 6
							If size == 8
								Return New Int[8]
							Else
								Return New Int[7]
							EndIf
						Else
							If size == 6
								Return New Int[6]
							Else
								Return New Int[5]
							EndIf
						EndIf
					Else
						If size > 2
							If size == 4
								Return New Int[4]
							Else
								Return New Int[3]
							EndIf
						Else
							If size == 2
								Return New Int[2]
							Else
								Return New Int[1]
							EndIf
						EndIf
					EndIf
				EndIf
			EndIf
		EndIf
	EndIf
EndFunction

String[] Function StringArray(Int size) Global
	size = ClampInt(size, 1, 128)
	
	If size > 64
		If size > 96
			If size > 112
				If size > 120
					If size > 124
						If size > 126
							If size == 128
								Return New String[128]
							Else
								Return New String[127]
							EndIf
						Else
							If size == 126
								Return New String[126]
							Else
								Return New String[125]
							EndIf
						EndIf
					Else
						If size > 122
							If size == 124
								Return New String[124]
							Else
								Return New String[123]
							EndIf
						Else
							If size == 122
								Return New String[122]
							Else
								Return New String[121]
							EndIf
						EndIf
					EndIf
				Else
					If size > 116
						If size > 118
							If size == 120
								Return New String[120]
							Else
								Return New String[119]
							EndIf
						Else
							If size == 118
								Return New String[118]
							Else
								Return New String[117]
							EndIf
						EndIf
					Else
						If size > 114
							If size == 116
								Return New String[116]
							Else
								Return New String[115]
							EndIf
						Else
							If size == 114
								Return New String[114]
							Else
								Return New String[113]
							EndIf
						EndIf
					EndIf
				EndIf
			Else
				If size > 104
					If size > 108
						If size > 110
							If size == 112
								Return New String[112]
							Else
								Return New String[111]
							EndIf
						Else
							If size == 110
								Return New String[110]
							Else
								Return New String[109]
							EndIf
						EndIf
					Else
						If size > 106
							If size == 108
								Return New String[108]
							Else
								Return New String[107]
							EndIf
						Else
							If size == 106
								Return New String[106]
							Else
								Return New String[105]
							EndIf
						EndIf
					EndIf
				Else
					If size > 100
						If size > 102
							If size == 104
								Return New String[104]
							Else
								Return New String[103]
							EndIf
						Else
							If size == 102
								Return New String[102]
							Else
								Return New String[101]
							EndIf
						EndIf
					Else
						If size > 98
							If size == 100
								Return New String[100]
							Else
								Return New String[99]
							EndIf
						Else
							If size == 98
								Return New String[98]
							Else
								Return New String[97]
							EndIf
						EndIf
					EndIf
				EndIf
			EndIf
		Else
			If size > 80
				If size > 88
					If size > 92
						If size > 94
							If size == 96
								Return New String[96]
							Else
								Return New String[95]
							EndIf
						Else
							If size == 94
								Return New String[94]
							Else
								Return New String[93]
							EndIf
						EndIf
					Else
						If size > 90
							If size == 92
								Return New String[92]
							Else
								Return New String[91]
							EndIf
						Else
							If size == 90
								Return New String[90]
							Else
								Return New String[89]
							EndIf
						EndIf
					EndIf
				Else
					If size > 84
						If size > 86
							If size == 88
								Return New String[88]
							Else
								Return New String[87]
							EndIf
						Else
							If size == 86
								Return New String[86]
							Else
								Return New String[85]
							EndIf
						EndIf
					Else
						If size > 82
							If size == 84
								Return New String[84]
							Else
								Return New String[83]
							EndIf
						Else
							If size == 82
								Return New String[82]
							Else
								Return New String[81]
							EndIf
						EndIf
					EndIf
				EndIf
			Else
				If size > 72
					If size > 76
						If size > 78
							If size == 80
								Return New String[80]
							Else
								Return New String[79]
							EndIf
						Else
							If size == 78
								Return New String[78]
							Else
								Return New String[77]
							EndIf
						EndIf
					Else
						If size > 74
							If size == 76
								Return New String[76]
							Else
								Return New String[75]
							EndIf
						Else
							If size == 74
								Return New String[74]
							Else
								Return New String[73]
							EndIf
						EndIf
					EndIf
				Else
					If size > 68
						If size > 70
							If size == 72
								Return New String[72]
							Else
								Return New String[71]
							EndIf
						Else
							If size == 70
								Return New String[70]
							Else
								Return New String[69]
							EndIf
						EndIf
					Else
						If size > 66
							If size == 68
								Return New String[68]
							Else
								Return New String[67]
							EndIf
						Else
							If size == 66
								Return New String[66]
							Else
								Return New String[65]
							EndIf
						EndIf
					EndIf
				EndIf
			EndIf
		EndIf
	Else
		If size > 32
			If size > 48
				If size > 56
					If size > 60
						If size > 62
							If size == 64
								Return New String[64]
							Else
								Return New String[63]
							EndIf
						Else
							If size == 62
								Return New String[62]
							Else
								Return New String[61]
							EndIf
						EndIf
					Else
						If size > 58
							If size == 60
								Return New String[60]
							Else
								Return New String[59]
							EndIf
						Else
							If size == 58
								Return New String[58]
							Else
								Return New String[57]
							EndIf
						EndIf
					EndIf
				Else
					If size > 52
						If size > 54
							If size == 56
								Return New String[56]
							Else
								Return New String[55]
							EndIf
						Else
							If size == 54
								Return New String[54]
							Else
								Return New String[53]
							EndIf
						EndIf
					Else
						If size > 50
							If size == 52
								Return New String[52]
							Else
								Return New String[51]
							EndIf
						Else
							If size == 50
								Return New String[50]
							Else
								Return New String[49]
							EndIf
						EndIf
					EndIf
				EndIf
			Else
				If size > 40
					If size > 44
						If size > 46
							If size == 48
								Return New String[48]
							Else
								Return New String[47]
							EndIf
						Else
							If size == 46
								Return New String[46]
							Else
								Return New String[45]
							EndIf
						EndIf
					Else
						If size > 42
							If size == 44
								Return New String[44]
							Else
								Return New String[43]
							EndIf
						Else
							If size == 42
								Return New String[42]
							Else
								Return New String[41]
							EndIf
						EndIf
					EndIf
				Else
					If size > 36
						If size > 38
							If size == 40
								Return New String[40]
							Else
								Return New String[39]
							EndIf
						Else
							If size == 38
								Return New String[38]
							Else
								Return New String[37]
							EndIf
						EndIf
					Else
						If size > 34
							If size == 36
								Return New String[36]
							Else
								Return New String[35]
							EndIf
						Else
							If size == 34
								Return New String[34]
							Else
								Return New String[33]
							EndIf
						EndIf
					EndIf
				EndIf
			EndIf
		Else
			If size > 16
				If size > 24
					If size > 28
						If size > 30
							If size == 32
								Return New String[32]
							Else
								Return New String[31]
							EndIf
						Else
							If size == 30
								Return New String[30]
							Else
								Return New String[29]
							EndIf
						EndIf
					Else
						If size > 26
							If size == 28
								Return New String[28]
							Else
								Return New String[27]
							EndIf
						Else
							If size == 26
								Return New String[26]
							Else
								Return New String[25]
							EndIf
						EndIf
					EndIf
				Else
					If size > 20
						If size > 22
							If size == 24
								Return New String[24]
							Else
								Return New String[23]
							EndIf
						Else
							If size == 22
								Return New String[22]
							Else
								Return New String[21]
							EndIf
						EndIf
					Else
						If size > 18
							If size == 20
								Return New String[20]
							Else
								Return New String[19]
							EndIf
						Else
							If size == 18
								Return New String[18]
							Else
								Return New String[17]
							EndIf
						EndIf
					EndIf
				EndIf
			Else
				If size > 8
					If size > 12
						If size > 14
							If size == 16
								Return New String[16]
							Else
								Return New String[15]
							EndIf
						Else
							If size == 14
								Return New String[14]
							Else
								Return New String[13]
							EndIf
						EndIf
					Else
						If size > 10
							If size == 12
								Return New String[12]
							Else
								Return New String[11]
							EndIf
						Else
							If size == 10
								Return New String[10]
							Else
								Return New String[9]
							EndIf
						EndIf
					EndIf
				Else
					If size > 4
						If size > 6
							If size == 8
								Return New String[8]
							Else
								Return New String[7]
							EndIf
						Else
							If size == 6
								Return New String[6]
							Else
								Return New String[5]
							EndIf
						EndIf
					Else
						If size > 2
							If size == 4
								Return New String[4]
							Else
								Return New String[3]
							EndIf
						Else
							If size == 2
								Return New String[2]
							Else
								Return New String[1]
							EndIf
						EndIf
					EndIf
				EndIf
			EndIf
		EndIf
	EndIf
EndFunction

bool function IsNumber(string Char) global
	if Char == "0"
		return true
	elseif Char == "1"
		return true
	elseif Char == "2"
		return true
	elseif Char == "3"
		return true
	elseif Char == "4"
		return true
	elseif Char == "5"
		return true
	elseif Char == "6"
		return true
	elseif Char == "7"
		return true
	elseif Char == "8"
		return true
	elseif Char == "9"
		return true
	endif
	return false
endfunction

string function GetVersionString(string modDesc) global
	bool bRunning=true
	int startpos=0
	int vpos=0
	int descLen = StringUtil.GetLength(modDesc)
	while bRunning
		vpos = StringUtil.Find(modDesc,"ersion",vpos)
		if vpos > 0
			if StringUtil.GetNthChar(modDesc,vpos - 1)=="V" || StringUtil.GetNthChar(modDesc,vpos - 1)=="v"
				vpos+=6
				while StringUtil.GetNthChar(modDesc,vpos)!=":" && StringUtil.GetNthChar(modDesc,vpos)!=" " && vpos<descLen
					vpos+=1
				endwhile
				startpos=vpos
				while (IsNumber(StringUtil.Substring(modDesc,vpos,1)) || StringUtil.Substring(modDesc,vpos,1) == ".") && vpos<descLen
					vpos+=1
					;BFVersion+=StringUtil.GetNthChar(modDesc,vpos)
				endwhile
				vpos-=1
				if StringUtil.Substring(modDesc,vpos+1,1) == "b"
					return "Beta " + StringUtil.Substring(modDesc,startpos,vpos - startpos)
				else
					return StringUtil.Substring(modDesc,startpos,vpos - startpos)
				endif
			endif
		else
			bRunning = false
		endif
	endWhile
	return "Undefined"
endfunction




Form[] Function FormArray(Int size) Global
	size = ClampInt(size, 1, 128)
	
	If size > 64
		If size > 96
			If size > 112
				If size > 120
					If size > 124
						If size > 126
							If size == 128
								Return New Form[128]
							Else
								Return New Form[127]
							EndIf
						Else
							If size == 126
								Return New Form[126]
							Else
								Return New Form[125]
							EndIf
						EndIf
					Else
						If size > 122
							If size == 124
								Return New Form[124]
							Else
								Return New Form[123]
							EndIf
						Else
							If size == 122
								Return New Form[122]
							Else
								Return New Form[121]
							EndIf
						EndIf
					EndIf
				Else
					If size > 116
						If size > 118
							If size == 120
								Return New Form[120]
							Else
								Return New Form[119]
							EndIf
						Else
							If size == 118
								Return New Form[118]
							Else
								Return New Form[117]
							EndIf
						EndIf
					Else
						If size > 114
							If size == 116
								Return New Form[116]
							Else
								Return New Form[115]
							EndIf
						Else
							If size == 114
								Return New Form[114]
							Else
								Return New Form[113]
							EndIf
						EndIf
					EndIf
				EndIf
			Else
				If size > 104
					If size > 108
						If size > 110
							If size == 112
								Return New Form[112]
							Else
								Return New Form[111]
							EndIf
						Else
							If size == 110
								Return New Form[110]
							Else
								Return New Form[109]
							EndIf
						EndIf
					Else
						If size > 106
							If size == 108
								Return New Form[108]
							Else
								Return New Form[107]
							EndIf
						Else
							If size == 106
								Return New Form[106]
							Else
								Return New Form[105]
							EndIf
						EndIf
					EndIf
				Else
					If size > 100
						If size > 102
							If size == 104
								Return New Form[104]
							Else
								Return New Form[103]
							EndIf
						Else
							If size == 102
								Return New Form[102]
							Else
								Return New Form[101]
							EndIf
						EndIf
					Else
						If size > 98
							If size == 100
								Return New Form[100]
							Else
								Return New Form[99]
							EndIf
						Else
							If size == 98
								Return New Form[98]
							Else
								Return New Form[97]
							EndIf
						EndIf
					EndIf
				EndIf
			EndIf
		Else
			If size > 80
				If size > 88
					If size > 92
						If size > 94
							If size == 96
								Return New Form[96]
							Else
								Return New Form[95]
							EndIf
						Else
							If size == 94
								Return New Form[94]
							Else
								Return New Form[93]
							EndIf
						EndIf
					Else
						If size > 90
							If size == 92
								Return New Form[92]
							Else
								Return New Form[91]
							EndIf
						Else
							If size == 90
								Return New Form[90]
							Else
								Return New Form[89]
							EndIf
						EndIf
					EndIf
				Else
					If size > 84
						If size > 86
							If size == 88
								Return New Form[88]
							Else
								Return New Form[87]
							EndIf
						Else
							If size == 86
								Return New Form[86]
							Else
								Return New Form[85]
							EndIf
						EndIf
					Else
						If size > 82
							If size == 84
								Return New Form[84]
							Else
								Return New Form[83]
							EndIf
						Else
							If size == 82
								Return New Form[82]
							Else
								Return New Form[81]
							EndIf
						EndIf
					EndIf
				EndIf
			Else
				If size > 72
					If size > 76
						If size > 78
							If size == 80
								Return New Form[80]
							Else
								Return New Form[79]
							EndIf
						Else
							If size == 78
								Return New Form[78]
							Else
								Return New Form[77]
							EndIf
						EndIf
					Else
						If size > 74
							If size == 76
								Return New Form[76]
							Else
								Return New Form[75]
							EndIf
						Else
							If size == 74
								Return New Form[74]
							Else
								Return New Form[73]
							EndIf
						EndIf
					EndIf
				Else
					If size > 68
						If size > 70
							If size == 72
								Return New Form[72]
							Else
								Return New Form[71]
							EndIf
						Else
							If size == 70
								Return New Form[70]
							Else
								Return New Form[69]
							EndIf
						EndIf
					Else
						If size > 66
							If size == 68
								Return New Form[68]
							Else
								Return New Form[67]
							EndIf
						Else
							If size == 66
								Return New Form[66]
							Else
								Return New Form[65]
							EndIf
						EndIf
					EndIf
				EndIf
			EndIf
		EndIf
	Else
		If size > 32
			If size > 48
				If size > 56
					If size > 60
						If size > 62
							If size == 64
								Return New Form[64]
							Else
								Return New Form[63]
							EndIf
						Else
							If size == 62
								Return New Form[62]
							Else
								Return New Form[61]
							EndIf
						EndIf
					Else
						If size > 58
							If size == 60
								Return New Form[60]
							Else
								Return New Form[59]
							EndIf
						Else
							If size == 58
								Return New Form[58]
							Else
								Return New Form[57]
							EndIf
						EndIf
					EndIf
				Else
					If size > 52
						If size > 54
							If size == 56
								Return New Form[56]
							Else
								Return New Form[55]
							EndIf
						Else
							If size == 54
								Return New Form[54]
							Else
								Return New Form[53]
							EndIf
						EndIf
					Else
						If size > 50
							If size == 52
								Return New Form[52]
							Else
								Return New Form[51]
							EndIf
						Else
							If size == 50
								Return New Form[50]
							Else
								Return New Form[49]
							EndIf
						EndIf
					EndIf
				EndIf
			Else
				If size > 40
					If size > 44
						If size > 46
							If size == 48
								Return New Form[48]
							Else
								Return New Form[47]
							EndIf
						Else
							If size == 46
								Return New Form[46]
							Else
								Return New Form[45]
							EndIf
						EndIf
					Else
						If size > 42
							If size == 44
								Return New Form[44]
							Else
								Return New Form[43]
							EndIf
						Else
							If size == 42
								Return New Form[42]
							Else
								Return New Form[41]
							EndIf
						EndIf
					EndIf
				Else
					If size > 36
						If size > 38
							If size == 40
								Return New Form[40]
							Else
								Return New Form[39]
							EndIf
						Else
							If size == 38
								Return New Form[38]
							Else
								Return New Form[37]
							EndIf
						EndIf
					Else
						If size > 34
							If size == 36
								Return New Form[36]
							Else
								Return New Form[35]
							EndIf
						Else
							If size == 34
								Return New Form[34]
							Else
								Return New Form[33]
							EndIf
						EndIf
					EndIf
				EndIf
			EndIf
		Else
			If size > 16
				If size > 24
					If size > 28
						If size > 30
							If size == 32
								Return New Form[32]
							Else
								Return New Form[31]
							EndIf
						Else
							If size == 30
								Return New Form[30]
							Else
								Return New Form[29]
							EndIf
						EndIf
					Else
						If size > 26
							If size == 28
								Return New Form[28]
							Else
								Return New Form[27]
							EndIf
						Else
							If size == 26
								Return New Form[26]
							Else
								Return New Form[25]
							EndIf
						EndIf
					EndIf
				Else
					If size > 20
						If size > 22
							If size == 24
								Return New Form[24]
							Else
								Return New Form[23]
							EndIf
						Else
							If size == 22
								Return New Form[22]
							Else
								Return New Form[21]
							EndIf
						EndIf
					Else
						If size > 18
							If size == 20
								Return New Form[20]
							Else
								Return New Form[19]
							EndIf
						Else
							If size == 18
								Return New Form[18]
							Else
								Return New Form[17]
							EndIf
						EndIf
					EndIf
				EndIf
			Else
				If size > 8
					If size > 12
						If size > 14
							If size == 16
								Return New Form[16]
							Else
								Return New Form[15]
							EndIf
						Else
							If size == 14
								Return New Form[14]
							Else
								Return New Form[13]
							EndIf
						EndIf
					Else
						If size > 10
							If size == 12
								Return New Form[12]
							Else
								Return New Form[11]
							EndIf
						Else
							If size == 10
								Return New Form[10]
							Else
								Return New Form[9]
							EndIf
						EndIf
					EndIf
				Else
					If size > 4
						If size > 6
							If size == 8
								Return New Form[8]
							Else
								Return New Form[7]
							EndIf
						Else
							If size == 6
								Return New Form[6]
							Else
								Return New Form[5]
							EndIf
						EndIf
					Else
						If size > 2
							If size == 4
								Return New Form[4]
							Else
								Return New Form[3]
							EndIf
						Else
							If size == 2
								Return New Form[2]
							Else
								Return New Form[1]
							EndIf
						EndIf
					EndIf
				EndIf
			EndIf
		EndIf
	EndIf
EndFunction
