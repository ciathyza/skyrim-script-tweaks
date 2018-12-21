Scriptname FWAddOnManager extends Quest
import FWUtility

FWTextContents property Contents auto


FWAddOn_Race[] property Races Auto Hidden ; Overdue - But left for downgrade compatiblity
bool[] property bRaces Auto Hidden ; Overdue - But left for downgrade compatiblity
string[] property sRaces Auto Hidden ; Overdue - But left for downgrade compatiblity
int property iRaces=0 Auto Hidden ; Overdue - But left for downgrade compatiblity

FWAddOn_CycleMagicEffect[] property CME Auto Hidden ; Overdue - But left for downgrade compatiblity
bool[] property bCME Auto Hidden ; Overdue - But left for downgrade compatiblity
string[] property sCME Auto Hidden ; Overdue - But left for downgrade compatiblity
int property iCME=0 Auto Hidden ; Overdue - But left for downgrade compatiblity

FWAddOn_Misc[] property Misc Auto Hidden
bool[] property bMisc Auto Hidden ; Overdue - But left for downgrade compatiblity
string[] property sMisc Auto Hidden
int property iMisc=0 Auto Hidden

int _LoadingState
int property LoadingState hidden
	int function get()
		return _LoadingState
	endFunction
endProperty
int _LoadingStateRace
int property LoadingStateRace hidden
	int function get()
		return _LoadingStateRace
	endFunction
endProperty
int _LoadingStateCME
int property LoadingStateCME hidden
	int function get()
		return _LoadingStateCME
	endFunction
endProperty
int _LoadingStateMisc
int property LoadingStateMisc hidden
	int function get()
		return _LoadingStateMisc
	endFunction
endProperty
string _SLoadingRace
string property SLoadingRace hidden
	string function get()
		return _SLoadingRace
	endFunction
endProperty
string _SLoadingCME
string property SLoadingCME hidden
	string function get()
		return _SLoadingCME
	endFunction
endProperty
string _SLoadingMisc
string property SLoadingMisc hidden
	string function get()
		return _SLoadingMisc
	endFunction
endProperty


string AddOnFolderHash=""



int property ADDON_TYPE_ALL = 127 AutoReadOnly
int property ADDON_TYPE_MISC = 1 AutoReadOnly
int property ADDON_TYPE_RACE = 2 AutoReadOnly
int property ADDON_TYPE_CME = 4 AutoReadOnly


function Upgrade(int oldVersion, int newVersion)
	if oldVersion<20900
		; Use the "Export"
		
	endif
endFunction

event onInit()
	Misc=new FWAddOn_Misc[128]
	sMisc=new string[128]
	OnGameLoad()
endEvent

function OnGameLoad()
	_LoadingState=1
	string H = FWUtility.GetDirectoryHash("AddOn")
	bool bAddOnMiscOK=true
	int i=0
	while i<iMisc
		if Misc[i] as FWAddOn_Misc==none
			bAddOnMiscOK=false
		endif
		i+=1
	endWhile
	if H!=AddOnFolderHash||bAddOnMiscOK==false
		RefreshAddOnH()
	endif
	bAddOnMiscOK=true
	i=0
	while i<iMisc
		if Misc[i] as FWAddOn_Misc==none
			bAddOnMiscOK=false
		endif
		i+=1
	endWhile
	
	; Raise 'OnGameLoad' on each Misc AddOn
	_LoadingState=0x80
	if bAddOnMiscOK
		i=0
		while i<iMisc
			_LoadingState=0x81
			Misc[i].OnGameLoad()
			_LoadingState=0x82
			i+=1
		endWhile
	endif
	
	; Recast CME Effects on player
	_LoadingState=0x90
	i = 0
	actor p = Game.GetPlayer()
	_LoadingState=0x91
	RecastSpell2(p, "FollicularPhase")
	_LoadingState=0x92
	RecastSpell2(p, "Ovulation")
	_LoadingState=0x93
	RecastSpell2(p, "LuthealPhase")
	_LoadingState=0x94
	RecastSpell2(p, "PMS")
	_LoadingState=0x95
	RecastSpell2(p, "Menstruation")
	_LoadingState=0x96
	RecastSpell2(p, "Trimester1")
	_LoadingState=0x97
	RecastSpell2(p, "Trimester2")
	_LoadingState=0x98
	RecastSpell2(p, "Trimester3")
	_LoadingState=0x99
	RecastSpell2(p, "Recovery")
	
	_LoadingState=0
endFunction


function RefreshAddOn(int type=127)
	RefreshAddOnH(type)
	_LoadingState=0
endFunction

function RefreshAddOnH(int type=127)
	_LoadingState=0x20
	if Math.LogicalAnd(type,2)==2
		ResetAllRaceAddOns()
	endif
	Clear(type)
	int c = FWUtility.GetFileCount("AddOn","ini")
	_LoadingState=0x21
	AddOnFolderHash=FWUtility.GetDirectoryHash("AddOn")
	_LoadingState=0x22
	
	while c>0
		_LoadingState=0x30
		c-=1
		string n = FWUtility.GetFileName("AddOn","ini",c)
		if FWUtility.getIniCBool("AddOn",n,"AddOn","enabled") || FWUtility.getIniCBool("AddOn",n,"AddOn","locked")
			_LoadingState=0x31
			string required = FWUtility.getIniCString("AddOn",n,"AddOn","required")
			bool bUse=true
			if required!=""
				string[] requiredA = StringUtil.Split(required,",")
				if FWUtility.AreModsInstalled(requiredA)==false
					bUse=false
				endif
			endif
			_LoadingState=0x32
			if bUse
				_LoadingState=0x33
				string t = FWUtility.toLower(FWUtility.getIniCString("AddOn",n,"AddOn","type"))
				_LoadingState=0x34
				if t=="misc" && Math.LogicalAnd(type,1)==1
					_LoadingState=0x40
					string modName=FWUtility.getIniCString("AddOn",n,"AddOn","modFile")
					_LoadingState=0x41
					int formID=FWUtility.getIniCInt("AddOn",n,"AddOn","form")
					_LoadingState=0x42
					if modName!="" && FWUtility.IsModInstalled(modName) && formID>0
						_LoadingState=0x43
						FWAddOn_Misc tmp=Game.GetFormFromFile(formID,modName) as FWAddOn_Misc
						if tmp as FWAddOn_Misc!=none
							sMisc[iMisc]=n
							Misc[iMisc]=tmp
							iMisc+=1
						endif
						_LoadingState=0x44
					endif
					_LoadingState=0x45
				elseif t=="race" && Math.LogicalAnd(type,2)==2
					string sRaceCount=FWUtility.getIniString("AddOn",n,"races","")
					int RaceCount=0
					if sRaceCount!=""
						RaceCount=sRaceCount as int
					endif
					if RaceCount==0
						AddRaceAddOnCat(n,"AddOn")
					else
						while RaceCount>0
							AddRaceAddOnCat(n,"Race"+RaceCount)
							RaceCount-=1
						endwhile
					endif
					
				elseif t=="cme" && Math.LogicalAnd(type,4)==4
					_LoadingState=0x70
					AddCME(n,"Always_FollicularPhase")
					AddCME(n,"Always_LaborPains")
					AddCME(n,"Always_LutealPhase")
					AddCME(n,"Always_Menstruation")
					_LoadingState=0x71
					AddCME(n,"Always_Ovulation")
					AddCME(n,"Always_PMS")
					AddCME(n,"Always_Recovery")
					_LoadingState=0x72
					AddCME(n,"Always_Trimester1")
					AddCME(n,"Always_Trimester2")
					AddCME(n,"Always_Trimester3")
					_LoadingState=0x73
					AddCME(n,"Sometimes_FollicularPhase")
					AddCME(n,"Sometimes_LaborPains")
					AddCME(n,"Sometimes_LutealPhase")
					_LoadingState=0x74
					AddCME(n,"Sometimes_Menstruation")
					AddCME(n,"Sometimes_Ovulation")
					AddCME(n,"Sometimes_PMS")
					_LoadingState=0x75
					AddCME(n,"Sometimes_Recovery")
					AddCME(n,"Sometimes_Trimester1")
					AddCME(n,"Sometimes_Trimester2")
					_LoadingState=0x76
					AddCME(n,"Sometimes_Trimester3")
				endif
			endif
		endif
	endWhile
endFunction


bool function Export(FWAddOnBase q, string Prefix="", int type=127) global
	bool bRes=false
	; Check for each type - there could be 
	if q as FWAddOn_Misc!=none && Math.LogicalAnd(type,1)==1
		if Export_Misc(q as FWAddOn_Misc,Prefix)
			bRes=true
		endif
	endif
	if q as FWAddOn_Race!=none && Math.LogicalAnd(type,2)==2
		if Export_Race(q as FWAddOn_Race,Prefix)
			bRes=true
		endif
	endif
	if q as FWAddOn_CycleMagicEffect!=none && Math.LogicalAnd(type,4)==4
		if Export_CME(q as FWAddOn_CycleMagicEffect,Prefix)
			bRes=true
		endif
	endif
	return bRes
endFunction

bool function Export_Misc(FWAddOn_Misc q, string Prefix="") global
	; Basic Ini Variables
	if q as FWAddOn_Misc == none
		return false
	endif
	string fName=Prefix+q.GetName()+".ini"
	FWUtility.setIniString("AddOn",fName,"name",q.GetName())
	FWUtility.setIniString("AddOn",fName,"description",q.AddOnDescription)
	FWUtility.setIniString("AddOn",fName,"author",q.AddOnAuthor)
	FWUtility.setIniString("AddOn",fName,"type","misc")
	FWUtility.setIniString("AddOn",fName,"required",FWUtility.GetModFromForm(q,true))
	
	FWUtility.setIniBool("AddOn",fName,"enabled",true)
	FWUtility.setIniBool("AddOn",fName,"locked",q.AddOnLocked)
	FWUtility.setIniBool("AddOn",fName,"hidden",!q.AddOnVisible)
	
	FWUtility.setIniString("AddOn",fName,"modFile",FWUtility.GetModFromForm(q,true))
	FWUtility.setIniString("AddOn",fName,"form","0x" + FWUtility.Hex(q.GetFormID() % 0x1000000,6))
	return true
endFunction

bool function Export_Race(FWAddOn_Race q, string Prefix="") global
	; Basic Ini Variables
	if q as FWAddOn_Race == none
		return false
	endif
	string fName=Prefix+FWUtility.GetModFromForm(q,false)+".ini"
	FWUtility.setIniString("AddOn",fName,"name",FWUtility.GetModFromForm(q,false))
	FWUtility.setIniString("AddOn",fName,"description",q.AddOnDescription)
	FWUtility.setIniString("AddOn",fName,"author",q.AddOnAuthor)
	FWUtility.setIniString("AddOn",fName,"type","race")
	FWUtility.setIniString("AddOn",fName,"required",FWUtility.GetModFromForm(q,true))
	
	FWUtility.setIniBool("AddOn",fName,"enabled",true)
	FWUtility.setIniBool("AddOn",fName,"locked",q.AddOnLocked)
	FWUtility.setIniBool("AddOn",fName,"hidden",!q.AddOnVisible)
	
	int xRaces=FWUtility.getIniInt("AddOn",fName,"races",0)
	xRaces+=1
	FWUtility.setIniString("AddOn",fName,"races",xRaces)
	_Export_RaceHandler(q,fName,"Race"+xRaces)
	Utility.WaitMenuMode(0.1) ; Wait a short time
	return true
endFunction

function _Export_RaceHandler(FWAddOn_Race q, string fName, string cat) global
	
	FWUtility.setIniCString("AddOn",fName,cat,"id", FWUtility.GetStringFromRaces(q.RaceID))
	
	; Export Baby ActorSizeScaler/Items/Armors
	if q.BabyMesh_Female!=none
		FWUtility.setIniCString("AddOn",fName,cat,"BabyMesh_Female", FWUtility.GetStringFromForm(q.BabyMesh_Female))
	endif
	if q.BabyArmor_Female!=none
		FWUtility.setIniCString("AddOn",fName,cat,"BabyArmor_Female", FWUtility.GetStringFromForm(q.BabyArmor_Female))
	endif
	if q.BabyActor_Female!=none
		FWUtility.setIniCString("AddOn",fName,cat,"BabyActor_Female", FWUtility.GetStringFromForm(q.BabyActor_Female))
	endif
	if q.BabyActor_FemalePlayer!=none
		FWUtility.setIniCString("AddOn",fName,cat,"BabyActor_FemalePlayer", FWUtility.GetStringFromForm(q.BabyActor_FemalePlayer))
	endif
	if q.BabyMesh_Male!=none
		FWUtility.setIniCString("AddOn",fName,cat,"BabyMesh_Male", FWUtility.GetStringFromForm(q.BabyMesh_Male))
	endif
	if q.BabyArmor_Male!=none
		FWUtility.setIniCString("AddOn",fName,cat,"BabyArmor_Male", FWUtility.GetStringFromForm(q.BabyArmor_Male))
	endif
	if q.BabyActor_Male!=none
		FWUtility.setIniCString("AddOn",fName,cat,"BabyActor_Male", FWUtility.GetStringFromForm(q.BabyActor_Male))
	endif
	if q.BabyActor_MalePlayer!=none
		FWUtility.setIniCString("AddOn",fName,cat,"BabyActor_MalePlayer", FWUtility.GetStringFromForm(q.BabyActor_MalePlayer))
	endif
	
	; Export boolen variables
	if q.Female_Force_This_Baby
		FWUtility.setIniCBool("AddOn",fName,cat,"Female_Force_This_Baby", q.Female_Force_This_Baby)
	endif
	if q.DisablePregnancy
		FWUtility.setIniCBool("AddOn",fName,cat,"DisablePregnancy", q.DisablePregnancy)
	endif
	
	if q.Duration_01_Follicular>0.0 && q.Duration_01_Follicular!=1.0
		FWUtility.setIniCFloat("AddOn",fName,cat,"Duration_01_Follicular", q.Duration_01_Follicular)
	endif
	if q.Duration_02_Ovulation>0.0 && q.Duration_02_Ovulation!=1.0
		FWUtility.setIniCFloat("AddOn",fName,cat,"Duration_02_Ovulation", q.Duration_02_Ovulation)
	endif
	if q.Duration_03_Luteal>0.0 && q.Duration_03_Luteal!=1.0
		FWUtility.setIniCFloat("AddOn",fName,cat,"Duration_03_Luteal", q.Duration_03_Luteal)
	endif
	if q.Duration_04_Menstruation>0.0 && q.Duration_04_Menstruation!=1.0
		FWUtility.setIniCFloat("AddOn",fName,cat,"Duration_04_Menstruation", q.Duration_04_Menstruation)
	endif
	if q.Duration_05_Trimester1>0.0 && q.Duration_05_Trimester1!=1.0
		FWUtility.setIniCFloat("AddOn",fName,cat,"Duration_05_Trimester1", q.Duration_05_Trimester1)
	endif
	if q.Duration_06_Trimester2>0.0 && q.Duration_06_Trimester2!=1.0
		FWUtility.setIniCFloat("AddOn",fName,cat,"Duration_06_Trimester2", q.Duration_06_Trimester2)
	endif
	if q.Duration_07_Trimester3>0.0 && q.Duration_07_Trimester3!=1.0
		FWUtility.setIniCFloat("AddOn",fName,cat,"Duration_07_Trimester3", q.Duration_07_Trimester3)
	endif
	if q.Duration_08_Recovery>0.0 && q.Duration_08_Recovery!=1.0
		FWUtility.setIniCFloat("AddOn",fName,cat,"Duration_08_Recovery", q.Duration_08_Recovery)
	endif
	if q.Duration_10_SecondsBetweenLaborPains>0.0 && q.Duration_10_SecondsBetweenLaborPains!=1.0
		FWUtility.setIniCFloat("AddOn",fName,cat,"Duration_10_SecondsBetweenLaborPains", q.Duration_10_SecondsBetweenLaborPains)
	endif
	if q.Duration_11_SecondsBetweenBabySpawn>0.0 && q.Duration_11_SecondsBetweenBabySpawn!=1.0
		FWUtility.setIniCFloat("AddOn",fName,cat,"Duration_11_SecondsBetweenBabySpawn", q.Duration_11_SecondsBetweenBabySpawn)
	endif
	if q.Duration_MaleSperm>0.0 && q.Duration_MaleSperm!=1.0
		FWUtility.setIniCFloat("AddOn",fName,cat,"Duration_MaleSperm", q.Duration_MaleSperm)
	endif
	
	if q.Pain_Mittelschmerz>0.0 && q.Pain_Mittelschmerz!=1.0
		FWUtility.setIniCFloat("AddOn",fName,cat,"Pain_Mittelschmerz", q.Pain_Mittelschmerz)
	endif
	if q.Pain_Menstruation>0.0 && q.Pain_Menstruation!=1.0
		FWUtility.setIniCFloat("AddOn",fName,cat,"Pain_Menstruation", q.Pain_Menstruation)
	endif
	if q.Pain_PMS>0.0 && q.Pain_PMS!=1.0
		FWUtility.setIniCFloat("AddOn",fName,cat,"Pain_PMS", q.Pain_PMS)
	endif
	if q.Pain_LaborPains>0.0 && q.Pain_LaborPains!=1.0
		FWUtility.setIniCFloat("AddOn",fName,cat,"Pain_LaborPains", q.Pain_LaborPains)
	endif
	if q.Pain_GivingBirth>0.0 && q.Pain_GivingBirth!=1.0
		FWUtility.setIniCFloat("AddOn",fName,cat,"Pain_GivingBirth", q.Pain_GivingBirth)
	endif
	if q.Pain_Abortus>0.0 && q.Pain_Abortus!=1.0
		FWUtility.setIniCFloat("AddOn",fName,cat,"Pain_Abortus", q.Pain_Abortus)
	endif
	if q.Pain_Phase_CyclePains>0.0 && q.Pain_Phase_CyclePains!=1.0
		FWUtility.setIniCFloat("AddOn",fName,cat,"Pain_Phase_CyclePains", q.Pain_Phase_CyclePains)
	endif
	if q.Pain_Phase_PregnantPains>0.0 && q.Pain_Phase_PregnantPains!=1.0
		FWUtility.setIniCFloat("AddOn",fName,cat,"Pain_Phase_PregnantPains", q.Pain_Phase_PregnantPains)
	endif
	
	if q.Max_CME_EffectsScale>0.0 && q.Max_CME_EffectsScale!=1.0
		FWUtility.setIniCFloat("AddOn",fName,cat,"Max_CME_EffectsScale", q.Max_CME_EffectsScale)
	endif
	if q.ChanceToBecomePregnantScale>0.0 && q.ChanceToBecomePregnantScale!=1.0
		FWUtility.setIniCFloat("AddOn",fName,cat,"ChanceToBecomePregnantScale", q.ChanceToBecomePregnantScale)
	endif
	if q.Sizes_Belly_Max>0.0 && q.Sizes_Belly_Max!=1.0
		FWUtility.setIniCFloat("AddOn",fName,cat,"Sizes_Belly_Max", q.Sizes_Belly_Max)
	endif
	if q.Sizes_Breasts_Max>0.0 && q.Sizes_Breasts_Max!=1.0
		FWUtility.setIniCFloat("AddOn",fName,cat,"Sizes_Breasts_Max", q.Sizes_Breasts_Max)
	endif
	if q.Sizes_Belly_Max_Multiple>0.0 && q.Sizes_Belly_Max_Multiple!=1.0
		FWUtility.setIniCFloat("AddOn",fName,cat,"Sizes_Belly_Max_Multiple", q.Sizes_Belly_Max_Multiple)
	endif
	if q.Sizes_Breasts_Max_Multiple>0.0 && q.Sizes_Breasts_Max_Multiple!=1.0
		FWUtility.setIniCFloat("AddOn",fName,cat,"Sizes_Breasts_Max_Multiple", q.Sizes_Breasts_Max_Multiple)
	endif
	if q.Multiple_Threshold_Chance>0.0 && q.Multiple_Threshold_Chance!=1.0
		FWUtility.setIniCFloat("AddOn",fName,cat,"Multiple_Threshold_Chance", q.Multiple_Threshold_Chance)
	endif
	if q.Multiple_Threshold_Max_Babys>0.0 && q.Multiple_Threshold_Max_Babys!=1.0
		FWUtility.setIniCFloat("AddOn",fName,cat,"Multiple_Threshold_Max_Babys", q.Multiple_Threshold_Max_Babys)
	endif
	if q.Irregulation_Chance_Scale>0.0 && q.Irregulation_Chance_Scale!=1.0
		FWUtility.setIniCFloat("AddOn",fName,cat,"Irregulation_Chance_Scale", q.Irregulation_Chance_Scale)
	endif
	if q.Irregulation_Value_Scale>0.0 && q.Irregulation_Value_Scale!=1.0
		FWUtility.setIniCFloat("AddOn",fName,cat,"Irregulation_Value_Scale", q.Irregulation_Value_Scale)
	endif
	if q.ContraceptionDuration>0.0 && q.ContraceptionDuration!=1.0
		FWUtility.setIniCFloat("AddOn",fName,cat,"ContraceptionDuration", q.ContraceptionDuration)
	endif
endFunction

bool function Export_CME(FWAddOn_CycleMagicEffect q, string Prefix="") global
	; Basic Ini Variables
	if q as FWAddOn_CycleMagicEffect == none
		return false
	endif
	string fName=Prefix+q.GetName()+".ini"
	FWUtility.setIniString("AddOn",fName,"name",q.GetName())
	FWUtility.setIniString("AddOn",fName,"description",q.AddOnDescription)
	FWUtility.setIniString("AddOn",fName,"author",q.AddOnAuthor)
	FWUtility.setIniString("AddOn",fName,"type","cme")
	FWUtility.setIniString("AddOn",fName,"required",FWUtility.GetModFromForm(q,true))
	
	FWUtility.setIniBool("AddOn",fName,"enabled",true)
	FWUtility.setIniBool("AddOn",fName,"locked",q.AddOnLocked)
	FWUtility.setIniBool("AddOn",fName,"hidden",!q.AddOnVisible)
	
	if q.Always_FollicularPhase.length>0
		FWUtility.setIniString("AddOn",fName,"Always_FollicularPhase",FWUtility.GetStringFromSpells(q.Always_FollicularPhase))
	endif
	if q.Always_Ovulation.length>0
		FWUtility.setIniString("AddOn",fName,"Always_Ovulation",FWUtility.GetStringFromSpells(q.Always_Ovulation))
	endif
	if q.Always_LuthealPhase.length>0
		FWUtility.setIniString("AddOn",fName,"Always_LuthealPhase",FWUtility.GetStringFromSpells(q.Always_LuthealPhase))
	endif
	if q.Always_PMS.length>0
		FWUtility.setIniString("AddOn",fName,"Always_PMS",FWUtility.GetStringFromSpells(q.Always_PMS))
	endif
	if q.Always_Menstruation.length>0
		FWUtility.setIniString("AddOn",fName,"Always_Menstruation",FWUtility.GetStringFromSpells(q.Always_Menstruation))
	endif
	if q.Always_Trimester1.length>0
		FWUtility.setIniString("AddOn",fName,"Always_Trimester1",FWUtility.GetStringFromSpells(q.Always_Trimester1))
	endif
	if q.Always_Trimester2.length>0
		FWUtility.setIniString("AddOn",fName,"Always_Trimester2",FWUtility.GetStringFromSpells(q.Always_Trimester2))
	endif
	if q.Always_Trimester3.length>0
		FWUtility.setIniString("AddOn",fName,"Always_Trimester3",FWUtility.GetStringFromSpells(q.Always_Trimester3))
	endif
	if q.Always_LaborPains.length>0
		FWUtility.setIniString("AddOn",fName,"Always_LaborPains",FWUtility.GetStringFromSpells(q.Always_LaborPains))
	endif
	if q.Always_Recovery.length>0
		FWUtility.setIniString("AddOn",fName,"Always_Recovery",FWUtility.GetStringFromSpells(q.Always_Recovery))
	endif
	
	if q.Sometimes_FollicularPhase.length>0
		FWUtility.setIniString("AddOn",fName,"Sometimes_FollicularPhase",FWUtility.GetStringFromSpells(q.Sometimes_FollicularPhase))
	endif
	if q.Sometimes_Ovulation.length>0
		FWUtility.setIniString("AddOn",fName,"Sometimes_Ovulation",FWUtility.GetStringFromSpells(q.Sometimes_Ovulation))
	endif
	if q.Sometimes_LuthealPhase.length>0
		FWUtility.setIniString("AddOn",fName,"Sometimes_LuthealPhase",FWUtility.GetStringFromSpells(q.Sometimes_LuthealPhase))
	endif
	if q.Sometimes_PMS.length>0
		FWUtility.setIniString("AddOn",fName,"Sometimes_PMS",FWUtility.GetStringFromSpells(q.Sometimes_PMS))
	endif
	if q.Sometimes_Menstruation.length>0
		FWUtility.setIniString("AddOn",fName,"Sometimes_Menstruation",FWUtility.GetStringFromSpells(q.Sometimes_Menstruation))
	endif
	if q.Sometimes_Trimester1.length>0
		FWUtility.setIniString("AddOn",fName,"Sometimes_Trimester1",FWUtility.GetStringFromSpells(q.Sometimes_Trimester1))
	endif
	if q.Sometimes_Trimester2.length>0
		FWUtility.setIniString("AddOn",fName,"Sometimes_Trimester2",FWUtility.GetStringFromSpells(q.Sometimes_Trimester2))
	endif
	if q.Sometimes_Trimester3.length>0
		FWUtility.setIniString("AddOn",fName,"Sometimes_Trimester3",FWUtility.GetStringFromSpells(q.Sometimes_Trimester3))
	endif
	if q.Sometimes_LaborPains.length>0
		FWUtility.setIniString("AddOn",fName,"Sometimes_LaborPains",FWUtility.GetStringFromSpells(q.Sometimes_LaborPains))
	endif
	if q.Sometimes_Recovery.length>0
		FWUtility.setIniString("AddOn",fName,"Sometimes_Recovery",FWUtility.GetStringFromSpells(q.Sometimes_Recovery))
	endif
	return true
endFunction


function AddCME(string n, string valueName)
	string s=FWUtility.getIniCString("AddOn",n,"AddOn",valueName)
	if s!=""
		string[] ss = StringUtil.Split(s,",")
		int c=ss.Length
		while c>0
			c-=1
			spell itm = FWUtility.GetFormFromString(ss[c]) as spell
			if itm!=none
				StorageUtil.FormListAdd(none,"FW.AddOn."+valueName,itm)
			endif
		endWhile
	endif
endFunction

function AddRaceAddOnValue(race r, string n, string cat,string valueName)
	float v=FWUtility.getIniCFloat("AddOn",n,cat,valueName,1.0)
	if v>0 && v<10
		float oldVal = StorageUtil.GetFloatValue(r,"FW.AddOn."+valueName,1.0)
		StorageUtil.SetFloatValue(r, "FW.AddOn."+valueName, oldVal * v)
	endif
endFunction

function AddRaceAddOnArrayToList(race r, string n, string cat,string valueName)
	string s = FWUtility.getIniCString("AddOn",n,cat,valueName,"")
	if s!=""
		string[] ss=StringUtil.Split(s,",")
		int c=ss.length
		if StorageUtil.GetIntValue(r,"FW.AddOn.Female_Force_This_Baby",0)==0
			while c>0
				c-=1
				if ss[c]!=""
					form itm = FWUtility.GetFormFromString(ss[c])
					if itm!=none
						if StorageUtil.FormListHas(r,"FW.AddOn."+valueName,itm)==false
							StorageUtil.FormListAdd(r,"FW.AddOn."+valueName,itm)
						endif
					endif
				endif
			endWhile
		else
			while c>0
				c-=1
				if ss[c]!=""
					form itm = FWUtility.GetFormFromString(ss[c])
					if itm!=none
						StorageUtil.FormListClear(r,"FW.AddOn."+valueName)
						StorageUtil.FormListAdd(r,"FW.AddOn."+valueName,itm)
					endif
				endif
			endWhile
		endif
	endif
endFunction

function AddRaceAddOnCat(string n, string cat)
	string ids=FWUtility.getIniCString("AddOn",n,cat,"id","")
	if ids!=""
		string[] saRaces=StringUtil.Split(ids,",")
		int c2=saRaces.length
		while c2>0
			c2-=1
			race r=FWUtility.GetFormFromString(saRaces[c2]) as Race
			if r!=none
				AddRaceAddOn(r,n,cat)
			endif
		endWhile
	endif
endFunction
function AddRaceAddOn(race r, string n, string cat)
	if !StorageUtil.FormListHas(none,"FW.AddOn.Races",r)
		StorageUtil.FormListAdd(none,"FW.AddOn.Races",r)
	endif
	
	if FWUtility.getIniCBool("AddOn",n,cat,"Female_Force_This_Baby",false)
		StorageUtil.SetIntValue(r,"FW.AddOn.Female_Force_This_Baby",1)
	endif
	if FWUtility.getIniCBool("AddOn",n,cat,"DisablePregnancy",false)
		StorageUtil.SetIntValue(r,"FW.AddOn.DisablePregnancy",1)
	endif
	
	AddRaceAddOnArrayToList(r,n,cat,"BabyActor_Female")
	AddRaceAddOnArrayToList(r,n,cat,"BabyActor_Male")
	AddRaceAddOnArrayToList(r,n,cat,"BabyActor_FemalePlayer")
	AddRaceAddOnArrayToList(r,n,cat,"BabyActor_MalePlayer")
	AddRaceAddOnArrayToList(r,n,cat,"BabyArmor_Female")
	AddRaceAddOnArrayToList(r,n,cat,"BabyArmor_Male")
	
	AddRaceAddOnValue(r,n,cat,"ChanceToBecomePregnant")
	AddRaceAddOnValue(r,n,cat,"ContraceptionDuration")
	AddRaceAddOnValue(r,n,cat,"Duration_01_Follicular")
	AddRaceAddOnValue(r,n,cat,"Duration_02_Ovulation")
	AddRaceAddOnValue(r,n,cat,"Duration_03_Luteal")
	AddRaceAddOnValue(r,n,cat,"Duration_04_Menstruation")
	AddRaceAddOnValue(r,n,cat,"Duration_05_Trimester1")
	AddRaceAddOnValue(r,n,cat,"Duration_06_Trimester2")
	AddRaceAddOnValue(r,n,cat,"Duration_07_Trimester3")
	AddRaceAddOnValue(r,n,cat,"Duration_08_Recovery")
	AddRaceAddOnValue(r,n,cat,"Duration_10_SecondsBetweenLaborPains")
	AddRaceAddOnValue(r,n,cat,"Duration_11_SecondsBetweenBabySpawn")
	AddRaceAddOnValue(r,n,cat,"Duration_MaleSperm")
	AddRaceAddOnValue(r,n,cat,"Irregulation_Chance_Scale")
	AddRaceAddOnValue(r,n,cat,"Irregulation_Value_Scale")
	AddRaceAddOnValue(r,n,cat,"Max_CME_EffectScale")
	AddRaceAddOnValue(r,n,cat,"Multiple_Threshold_Chance")
	AddRaceAddOnValue(r,n,cat,"Multiple_Threshold_Max_Babys")
	AddRaceAddOnValue(r,n,cat,"Pain_Abortus")
	AddRaceAddOnValue(r,n,cat,"Pain_GivingBirth")
	AddRaceAddOnValue(r,n,cat,"Pain_LaborPains")
	AddRaceAddOnValue(r,n,cat,"Pain_Menstruation")
	AddRaceAddOnValue(r,n,cat,"Pain_Mittelschmerz")
	AddRaceAddOnValue(r,n,cat,"Pain_Phase_CyclePains")
	AddRaceAddOnValue(r,n,cat,"Pain_Phase_PregnantPains")
	AddRaceAddOnValue(r,n,cat,"Pain_PMS")
	AddRaceAddOnValue(r,n,cat,"PMS_ChanceScale")
	AddRaceAddOnValue(r,n,cat,"Size_Belly_Max")
	AddRaceAddOnValue(r,n,cat,"Size_Belly_Max_Multiple")
	AddRaceAddOnValue(r,n,cat,"Size_Breasts_Max")
	AddRaceAddOnValue(r,n,cat,"Size_Breasts_Max_Multiple")
	
	AddRaceAddOnValue(r,n,cat,"Sperm_Amount_Scale")
	AddRaceAddOnValue(r,n,cat,"Baby_Healing_Scale")
	AddRaceAddOnValue(r,n,cat,"Baby_Damage_Scale")
	AddRaceAddOnValue(r,n,cat,"Male_Recovery_Scale")
endFunction

function Clear(int type=7)
	AddOnFolderHash=""
	if Math.LogicalAnd(type,1)==1
		ClearMiscAddOns()
	endif
	if Math.LogicalAnd(type,2)==2
		ClearRaceAddOns()
	endif
	if Math.LogicalAnd(type,4)==4
		ClearCMEAddOns()
	endif
endFunction

function ClearMiscAddOns()
	Misc=new FWAddOn_Misc[128]
	sMisc=new string[128]
	bMisc=new bool[128]
	iMisc=0
endFunction

function ClearCMEAddOns()
	StorageUtil.FormListClear(none,"FW.AddOn.Always_FollicularPhase")
	StorageUtil.FormListClear(none,"FW.AddOn.Always_LaborPains")
	StorageUtil.FormListClear(none,"FW.AddOn.Always_LutealPhase")
	StorageUtil.FormListClear(none,"FW.AddOn.Always_Menstruation")
	StorageUtil.FormListClear(none,"FW.AddOn.Always_Ovulation")
	StorageUtil.FormListClear(none,"FW.AddOn.Always_PMS")
	StorageUtil.FormListClear(none,"FW.AddOn.Always_Recovery")
	StorageUtil.FormListClear(none,"FW.AddOn.Always_Trimester1")
	StorageUtil.FormListClear(none,"FW.AddOn.Always_Trimester2")
	StorageUtil.FormListClear(none,"FW.AddOn.Always_Trimester3")
	StorageUtil.FormListClear(none,"FW.AddOn.Sometimes_FollicularPhase")
	StorageUtil.FormListClear(none,"FW.AddOn.Sometimes_LaborPains")
	StorageUtil.FormListClear(none,"FW.AddOn.Sometimes_LutealPhase")
	StorageUtil.FormListClear(none,"FW.AddOn.Sometimes_Menstruation")
	StorageUtil.FormListClear(none,"FW.AddOn.Sometimes_Ovulation")
	StorageUtil.FormListClear(none,"FW.AddOn.Sometimes_PMS")
	StorageUtil.FormListClear(none,"FW.AddOn.Sometimes_Recovery")
	StorageUtil.FormListClear(none,"FW.AddOn.Sometimes_Trimester1")
	StorageUtil.FormListClear(none,"FW.AddOn.Sometimes_Trimester2")
	StorageUtil.FormListClear(none,"FW.AddOn.Sometimes_Trimester3")
endFunction

Function ResetAllRaceAddOns()
	int c = StorageUtil.FormListCount(none, "FW.AddOn.Races")
	while c>0
		c-=1
		race r = StorageUtil.FormListGet(none, "FW.AddOn.Races",c) as race
		ResetRaceAddOns(r)
	endWhile
endFunction

function ResetRaceAddOns(race r)
	if r!=none
		StorageUtil.FormListClear(r,"FW.AddOn.BabyActor_Female")
		StorageUtil.FormListClear(r,"FW.AddOn.BabyActor_Male")
		StorageUtil.FormListClear(r,"FW.AddOn.BabyActor_FemalePlayer")
		StorageUtil.FormListClear(r,"FW.AddOn.BabyActor_MalePlayer")
		StorageUtil.FormListClear(r,"FW.AddOn.BabyArmor_Female")
		StorageUtil.FormListClear(r,"FW.AddOn.BabyArmor_Male")
		
		StorageUtil.SetIntValue(r,"FW.AddOn.DisablePregnancy",0)
		StorageUtil.SetIntValue(r,"FW.AddOn.Female_Force_This_Baby",0)
		
		StorageUtil.SetFloatValue(r,"FW.AddOn.ChanceToBecomePregnant",1)
		StorageUtil.SetFloatValue(r,"FW.AddOn.ContraceptionDuration",1)
		StorageUtil.SetFloatValue(r,"FW.AddOn.Duration_01_Follicular",1)
		StorageUtil.SetFloatValue(r,"FW.AddOn.Duration_02_Ovulation",1)
		StorageUtil.SetFloatValue(r,"FW.AddOn.Duration_03_Luteal",1)
		StorageUtil.SetFloatValue(r,"FW.AddOn.Duration_04_Menstruation",1)
		StorageUtil.SetFloatValue(r,"FW.AddOn.Duration_05_Trimester1",1)
		StorageUtil.SetFloatValue(r,"FW.AddOn.Duration_06_Trimester2",1)
		StorageUtil.SetFloatValue(r,"FW.AddOn.Duration_07_Trimester3",1)
		StorageUtil.SetFloatValue(r,"FW.AddOn.Duration_08_Recovery",1)
		StorageUtil.SetFloatValue(r,"FW.AddOn.Duration_10_SecondsBetweenLaborPains",1)
		StorageUtil.SetFloatValue(r,"FW.AddOn.Duration_11_SecondsBetweenBabySpawn",1)
		StorageUtil.SetFloatValue(r,"FW.AddOn.Duration_MaleSperm",1)
		StorageUtil.SetFloatValue(r,"FW.AddOn.Irregulation_Chance_Scale",1)
		StorageUtil.SetFloatValue(r,"FW.AddOn.Irregulation_Value_Scale",1)
		StorageUtil.SetFloatValue(r,"FW.AddOn.Max_CME_EffectScale",1)
		StorageUtil.SetFloatValue(r,"FW.AddOn.Multiple_Threshold_Chance",1)
		StorageUtil.SetFloatValue(r,"FW.AddOn.Multiple_Threshold_Max_Babys",1)
		StorageUtil.SetFloatValue(r,"FW.AddOn.Pain_Abortus",1)
		StorageUtil.SetFloatValue(r,"FW.AddOn.Pain_GivingBirth",1)
		StorageUtil.SetFloatValue(r,"FW.AddOn.Pain_LaborPains",1)
		StorageUtil.SetFloatValue(r,"FW.AddOn.Pain_Menstruation",1)
		StorageUtil.SetFloatValue(r,"FW.AddOn.Pain_Mittelschmerz",1)
		StorageUtil.SetFloatValue(r,"FW.AddOn.Pain_Phase_CyclePains",1)
		StorageUtil.SetFloatValue(r,"FW.AddOn.Pain_Phase_PregnantPains",1)
		StorageUtil.SetFloatValue(r,"FW.AddOn.Pain_PMS",1)
		StorageUtil.SetFloatValue(r,"FW.AddOn.PMS_ChanceScale",1)
		StorageUtil.SetFloatValue(r,"FW.AddOn.Size_Belly_Max",1)
		StorageUtil.SetFloatValue(r,"FW.AddOn.Size_Belly_Max_Multiple",1)
		StorageUtil.SetFloatValue(r,"FW.AddOn.Size_Breasts_Max",1)
		StorageUtil.SetFloatValue(r,"FW.AddOn.Size_Breasts_Max_Multiple",1)
	
		StorageUtil.SetFloatValue(r,"FW.AddOn.Sperm_Amount_Scale",1)
		StorageUtil.SetFloatValue(r,"FW.AddOn.Baby_Healing_Scale",1)
		StorageUtil.SetFloatValue(r,"FW.AddOn.Baby_Damage_Scale",1)
		StorageUtil.SetFloatValue(r,"FW.AddOn.Male_Recovery_Scale",1)
	endif
endFunction
function ClearRaceAddOns()
	int c = StorageUtil.FormListCount(none, "FW.AddOn.Races")
	while c>0
		c-=1
		race r = StorageUtil.FormListGet(none, "FW.AddOn.Races",c) as race
		if r==none
			StorageUtil.FormListClear(r,"FW.AddOn.BabyActor_Female")
			StorageUtil.FormListClear(r,"FW.AddOn.BabyActor_Male")
			StorageUtil.FormListClear(r,"FW.AddOn.BabyActor_FemalePlayer")
			StorageUtil.FormListClear(r,"FW.AddOn.BabyActor_MalePlayer")
			StorageUtil.FormListClear(r,"FW.AddOn.BabyArmor_Female")
			StorageUtil.FormListClear(r,"FW.AddOn.BabyArmor_Male")
		
			StorageUtil.UnsetIntValue(r,"FW.AddOn.DisablePregnancy")
			StorageUtil.UnsetIntValue(r,"FW.AddOn.Female_Force_This_Baby")
		
			StorageUtil.UnsetFloatValue(r,"FW.AddOn.ChanceToBecomePregnant")
			StorageUtil.UnsetFloatValue(r,"FW.AddOn.ContraceptionDuration")
			StorageUtil.UnsetFloatValue(r,"FW.AddOn.Duration_01_Follicular")
			StorageUtil.UnsetFloatValue(r,"FW.AddOn.Duration_02_Ovulation")
			StorageUtil.UnsetFloatValue(r,"FW.AddOn.Duration_03_Luteal")
			StorageUtil.UnsetFloatValue(r,"FW.AddOn.Duration_04_Menstruation")
			StorageUtil.UnsetFloatValue(r,"FW.AddOn.Duration_05_Trimester1")
			StorageUtil.UnsetFloatValue(r,"FW.AddOn.Duration_06_Trimester2")
			StorageUtil.UnsetFloatValue(r,"FW.AddOn.Duration_07_Trimester3")
			StorageUtil.UnsetFloatValue(r,"FW.AddOn.Duration_08_Recovery")
			StorageUtil.UnsetFloatValue(r,"FW.AddOn.Duration_10_SecondsBetweenLaborPains")
			StorageUtil.UnsetFloatValue(r,"FW.AddOn.Duration_11_SecondsBetweenBabySpawn")
			StorageUtil.UnsetFloatValue(r,"FW.AddOn.Duration_MaleSperm")
			StorageUtil.UnsetFloatValue(r,"FW.AddOn.Irregulation_Chance_Scale")
			StorageUtil.UnsetFloatValue(r,"FW.AddOn.Irregulation_Value_Scale")
			StorageUtil.UnsetFloatValue(r,"FW.AddOn.Max_CME_EffectScale")
			StorageUtil.UnsetFloatValue(r,"FW.AddOn.Multiple_Threshold_Chance")
			StorageUtil.UnsetFloatValue(r,"FW.AddOn.Multiple_Threshold_Max_Babys")
			StorageUtil.UnsetFloatValue(r,"FW.AddOn.Pain_Abortus")
			StorageUtil.UnsetFloatValue(r,"FW.AddOn.Pain_GivingBirth")
			StorageUtil.UnsetFloatValue(r,"FW.AddOn.Pain_LaborPains")
			StorageUtil.UnsetFloatValue(r,"FW.AddOn.Pain_Menstruation")
			StorageUtil.UnsetFloatValue(r,"FW.AddOn.Pain_Mittelschmerz")
			StorageUtil.UnsetFloatValue(r,"FW.AddOn.Pain_Phase_CyclePains")
			StorageUtil.UnsetFloatValue(r,"FW.AddOn.Pain_Phase_PregnantPains")
			StorageUtil.UnsetFloatValue(r,"FW.AddOn.Pain_PMS")
			StorageUtil.UnsetFloatValue(r,"FW.AddOn.PMS_ChanceScale")
			StorageUtil.UnsetFloatValue(r,"FW.AddOn.Size_Belly_Max")
			StorageUtil.UnsetFloatValue(r,"FW.AddOn.Size_Belly_Max_Multiple")
			StorageUtil.UnsetFloatValue(r,"FW.AddOn.Size_Breasts_Max")
			StorageUtil.UnsetFloatValue(r,"FW.AddOn.Size_Breasts_Max_Multiple")
		
			StorageUtil.UnsetFloatValue(r,"FW.AddOn.Sperm_Amount_Scale")
			StorageUtil.UnsetFloatValue(r,"FW.AddOn.Baby_Healing_Scale")
			StorageUtil.UnsetFloatValue(r,"FW.AddOn.Baby_Damage_Scale")
			StorageUtil.UnsetFloatValue(r,"FW.AddOn.Male_Recovery_Scale")
		endif
	endWhile
	StorageUtil.UnsetFloatValue(none, "FW.AddOn.Races")
endFunction


function RecastSpell2(actor a, string s)
	if StringUtil.Substring(s,0,7)=="Always_" || StringUtil.Substring(s,0,10)=="Sometimes_"
		int i = StorageUtil.FormListCount(none,"FW.AddOn."+s)
		while i>0
			i-=1
			spell spl = StorageUtil.FormListGet(none,"FW.AddOn."+s,i ) as spell
			if a.HasSpell(spl)
				a.DispelSpell(spl)
				a.AddSpell(spl)
			endif
		endwhile
	else
		int i = StorageUtil.FormListCount(none,"FW.AddOn.Always_"+s)
		while i>0
			i-=1
			spell spl = StorageUtil.FormListGet(none,"FW.AddOn.Always_"+s,i ) as spell
			if a.HasSpell(spl)
				a.DispelSpell(spl)
				a.AddSpell(spl)
			endif
		endwhile
		i = StorageUtil.FormListCount(none,"FW.AddOn.Sometimes_"+s)
		while i>0
			i-=1
			spell spl = StorageUtil.FormListGet(none,"FW.AddOn.Sometimes_"+s,i ) as spell
			if a.HasSpell(spl)
				a.DispelSpell(spl)
				a.AddSpell(spl)
			endif
		endwhile
	endif
endFunction


bool function IsAddOnActive(string AddOnName)
	bool bActive=FWUtility.getIniBool("AddOn",AddOnName+".ini","enabled",false)
	if bActive
		string t=FWUtility.getIniString("AddOn",AddOnName+".ini","type")
		if t=="Misc" || t=="misc" || t=="MISC"
			int c=iMisc
			while c>0
				c-=1
				if FWUtility.toLower(sMisc[c])==FWUtility.toLower(AddOnName)+".ini"
					if Misc[c] as FWAddOn_Misc != none
						bool bAddOnActive=Misc[c].IsActive()
						return bAddOnActive
					endif
				endif
			endWhile
			return false
		endif
	endif
	return bActive
endFunction

FWAddOn_Misc function GetMiscAddOn(string AddOnName)
	int i=0
	while i<iMisc
		if Misc[i].GetName() == AddOnName
			return Misc[i]
		endif
		i+=1
	endWhile
endFunction



MiscObject function GetBabyItem(race ParentRace,int Gender)
	MiscObject m=none
	string sGender="BabyMesh_Male"
	if Gender==1
		sGender="BabyMesh_Female"
	endif
	int c=StorageUtil.FormListCount(ParentRace, "FW.AddOn."+sGender)
	if c>0
		int r=Utility.RandomInt(0,c - 1)
		m=StorageUtil.FormListGet(ParentRace, "FW.AddOn."+sGender,r) as MiscObject
		if m!=none
			return m
		endif
		while c>0
			c-=1
			m=StorageUtil.FormListGet(ParentRace, "FW.AddOn."+sGender,c) as MiscObject
			if m!=none
				return m
			endif
		endWhile
	endif
	return none
endFunction

Armor function GetBabyArmor(race ParentRace,int Gender)
	Armor m=none
	string sGender="BabyMesh_Male"
	if Gender==1
		sGender="BabyArmor_Female"
	endif
	int c=StorageUtil.FormListCount(ParentRace, "FW.AddOn."+sGender)
	if c>0
		int r=Utility.RandomInt(0,c - 1)
		m=StorageUtil.FormListGet(ParentRace, "FW.AddOn."+sGender,r) as Armor
		if m!=none
			return m
		endif
		while c>0
			c-=1
			m=StorageUtil.FormListGet(ParentRace, "FW.AddOn."+sGender,c) as Armor
			if m!=none
				return m
			endif
		endWhile
	endif
	return none
endFunction

ActorBase function GetBabyActor(race ParentRace,int Gender)
	ActorBase m=none
	string sGender="BabyActor_Male"
	if Gender==1
		sGender="BabyActor_Female"
	endif
	int c=StorageUtil.FormListCount(ParentRace, "FW.AddOn."+sGender)
	if c>0
		int r=Utility.RandomInt(0,c - 1)
		m=StorageUtil.FormListGet(ParentRace, "FW.AddOn."+sGender,r) as ActorBase
		if m!=none
			return m
		endif
		while c>0
			c-=1
			m=StorageUtil.FormListGet(ParentRace, "FW.AddOn."+sGender,c) as ActorBase
			if m!=none
				return m
			endif
		endWhile
	endif
	return none
endFunction

ActorBase function GetPlayerBabyActor(race ParentRace,int Gender)
	ActorBase m=none
	string sGender="BabyActor_MalePlayer"
	if Gender==1
		sGender="BabyActor_FemalePlayer"
	endif
	int c=StorageUtil.FormListCount(ParentRace, "FW.AddOn."+sGender)
	if c>0
		int r=Utility.RandomInt(0,c - 1)
		m=StorageUtil.FormListGet(ParentRace, "FW.AddOn."+sGender,r) as ActorBase
		if m!=none
			return m
		endif
		while c>0
			c-=1
			m=StorageUtil.FormListGet(ParentRace, "FW.AddOn."+sGender,c) as ActorBase
			if m!=none
				return m
			endif
		endWhile
	endif
	return none
endFunction




; state values:
; -1 = All
; 0 = Fullicular
; 1 = Ovulating
; 2 = Lutheal
; 3 = PMS
; 4 = Menstrual
; 5 = Pregnancy 1.
; 6 = Pregnancy 2.
; 7 = Pregnancy 3.
; 8 = Labor Pains
; 9 = Replanish
function removeCME(actor a, int EffectID = -1)
	if EffectID==-1
		ActorRemoveSpellsS(a,"Always_FollicularPhase")
		ActorRemoveSpellsS(a,"Always_Ovulation")
		ActorRemoveSpellsS(a,"Always_LuthealPhase")
		ActorRemoveSpellsS(a,"Always_PMS")
		ActorRemoveSpellsS(a,"Always_Menstruation")
		ActorRemoveSpellsS(a,"Always_Trimester1")
		ActorRemoveSpellsS(a,"Always_Trimester2")
		ActorRemoveSpellsS(a,"Always_Trimester3")
		ActorRemoveSpellsS(a,"Always_LaborPains")
		ActorRemoveSpellsS(a,"Always_Recovery")
		
		ActorRemoveSpellsS(a,"Sometimes_FollicularPhase")
		ActorRemoveSpellsS(a,"Sometimes_Ovulation")
		ActorRemoveSpellsS(a,"Sometimes_LuthealPhase")
		ActorRemoveSpellsS(a,"Sometimes_PMS")
		ActorRemoveSpellsS(a,"Sometimes_Menstruation")
		ActorRemoveSpellsS(a,"Sometimes_Trimester1")
		ActorRemoveSpellsS(a,"Sometimes_Trimester2")
		ActorRemoveSpellsS(a,"Sometimes_Trimester3")
		ActorRemoveSpellsS(a,"Sometimes_LaborPains")
		ActorRemoveSpellsS(a,"Sometimes_Recovery")
	elseif EffectID==0
		ActorRemoveSpellsS(a,"Always_FollicularPhase")
		ActorRemoveSpellsS(a,"Sometimes_FollicularPhase")
	elseif EffectID==1
		ActorRemoveSpellsS(a,"Always_Ovulation")
		ActorRemoveSpellsS(a,"Sometimes_Ovulation")
	elseif EffectID==2
		ActorRemoveSpellsS(a,"Always_LuthealPhase")
		ActorRemoveSpellsS(a,"Sometimes_LuthealPhase")
	elseif EffectID==3
		ActorRemoveSpellsS(a,"Always_PMS")
		ActorRemoveSpellsS(a,"Sometimes_PMS")
	elseif EffectID==4
		ActorRemoveSpellsS(a,"Always_Menstruation")
		ActorRemoveSpellsS(a,"Sometimes_Menstruation")
	elseif EffectID==5
		ActorRemoveSpellsS(a,"Always_Trimester1")
		ActorRemoveSpellsS(a,"Sometimes_Trimester1")
	elseif EffectID==6
		ActorRemoveSpellsS(a,"Always_Trimester2")
		ActorRemoveSpellsS(a,"Sometimes_Trimester2")
	elseif EffectID==7
		ActorRemoveSpellsS(a,"Always_Trimester3")
		ActorRemoveSpellsS(a,"Sometimes_Trimester3")
	elseif EffectID==8
		ActorRemoveSpellsS(a,"Always_LaborPains")
		ActorRemoveSpellsS(a,"Sometimes_LaborPains")
	elseif EffectID==9
		ActorRemoveSpellsS(a,"Always_Recovery")
		ActorRemoveSpellsS(a,"Sometimes_Recovery")
	endif
endFunction

function castCME(actor a, int EffectID, int NumEffects)
	if EffectID==0
		FWUtility.ActorAddSpellsS(a,"Always_FollicularPhase");
	elseif EffectID==1
		FWUtility.ActorAddSpellsS(a,"Always_Ovulation");
	elseif EffectID==2
		FWUtility.ActorAddSpellsS(a,"Always_LuthealPhase");
	elseif EffectID==3
		FWUtility.ActorAddSpellsS(a,"Always_PMS");
	elseif EffectID==4
		FWUtility.ActorAddSpellsS(a,"Always_Menstruation");
	elseif EffectID==5
		FWUtility.ActorAddSpellsS(a,"Always_Trimester1");
	elseif EffectID==6
		FWUtility.ActorAddSpellsS(a,"Always_Trimester2");
	elseif EffectID==7
		FWUtility.ActorAddSpellsS(a,"Always_Trimester3");
	elseif EffectID==8
		FWUtility.ActorAddSpellsS(a,"Always_LaborPains");
	elseif EffectID==9
		FWUtility.ActorAddSpellsS(a,"Always_Recovery");
	endIf
	castCMEEffect(a, EffectID, NumEffects)
endFunction



; EffectID	State
;  0		FollicularPhase
;  1		Ovulation
;  2		LuthealPhase
;  3		PMS
;  4		Menstruation
;  5		Trimester1
;  6		Trimester2
;  7		Trimester3
;  8		LaborPains
;  9		Recovery
function castCMEEffect(Actor akActor,int EffectID, int MaxEffectNumber)
	if akActor == none
		return
	endif
	float maxEffects=Utility.RandomInt(1, MaxEffectNumber)
	; Check racial maximum PMS Effects
	race RaceID = akActor.GetLeveledActorBase().GetRace()
	maxEffects*=StorageUtil.GetFloatValue(RaceID,"FW.AddOn.Max_CME_EffectsScale",1.0)
	if maxEffects<=0
		maxEffects=1
	endIf
	
	string sName=""
	if EffectID==0
		sName="Follicular"
	elseif EffectID==1
		sName="Ovulation"
	elseif EffectID==2
		sName="LuthealPhase"
	elseif EffectID==3
		sName="PMS"
	elseif EffectID==4
		sName="Menstruation"
	elseif EffectID==5
		sName="Trimester1"
	elseif EffectID==6
		sName="Trimester2"
	elseif EffectID==7
		sName="Trimester3"
	elseif EffectID==8
		sName="LaborPains"
	elseif EffectID==9
		sName="Recovery"
	endif
	
	if sName!=""
		int cmeCount = StorageUtil.FormListCount(none,"FW.AddOn.Sometimes_"+sName)
		if cmeCount>0
			if maxEffects>=cmeCount
			; there are more effects available then needed. pick random one
				while maxEffects>0
					maxEffects-=1
					int sID=Utility.RandomInt(0,cmeCount - 1)
					spell spl = StorageUtil.FormListGet(none,"FW.AddOn.Sometimes_"+sName,sID) as spell
					if spl!=none
						FWUtility.ActorAddSpell(akActor,spl, False)
					endif
				endWhile
			else
			; There are less or equals effects available. cast all spells
				int iMaxEffects=Math.Ceiling(maxEffects)
				while iMaxEffects>0
					iMaxEffects-=1
					spell spl = StorageUtil.FormListGet(none,"FW.AddOn.Sometimes_"+sName,iMaxEffects) as spell
					if spl!=none
						FWUtility.ActorAddSpell(akActor,spl, False)
					endif
				endWhile
			endif
		endif
	endif
endFunction


; Alias for getRaceDurationScale - but with Actor-Argument
float function getActorDurationScale(int Step, Actor a)
	float result = 1.0
	if a!=none && a.GetActorBase()!=none && a.GetActorBase().GetRace()!=none
		result *= getRaceDurationScale(Step, a.GetActorBase().GetRace())
	endIf
	if result < 0.2
		return 0.2 ; return at least 20%
	else
		return result
	endIf
endFunction
float function getRaceDurationScale(int Step, race RaceID)
	if Step==7 ; Labor Pain is fixed
		return result
	endif
	;WaitRaces()
	float result = 1.0
	if Step==0
		result *= StorageUtil.GetFloatValue(RaceID,"FW.AddOn.Duration_01_Follicular",1.0)
	elseif Step==1
		result *= StorageUtil.GetFloatValue(RaceID,"FW.AddOn.Duration_02_Ovulation",1.0)
	elseif Step==2
		result *= StorageUtil.GetFloatValue(RaceID,"FW.AddOn.Duration_03_Luteal",1.0)
	elseif Step==3
		result *= StorageUtil.GetFloatValue(RaceID,"FW.AddOn.Duration_04_Menstruation",1.0)
	elseif Step==4
		result *= StorageUtil.GetFloatValue(RaceID,"FW.AddOn.Duration_05_Trimester1",1.0)
	elseif Step==5
		result *= StorageUtil.GetFloatValue(RaceID,"FW.AddOn.Duration_06_Trimester2",1.0)
	elseif Step==6
		result *= StorageUtil.GetFloatValue(RaceID,"FW.AddOn.Duration_07_Trimester3",1.0)
	elseif Step==8
		result *= StorageUtil.GetFloatValue(RaceID,"FW.AddOn.Duration_08_Recovery",1.0)
	endIf
	if result < 0.2
		return 0.2 ; return at least 20%
	else
		return result
	endIf
endFunction


float function getActorDuration_BetweenLaborPains(actor a)
	float result = 1.0
	if a && a.GetActorBase() && a.GetActorBase().GetRace()
		result *= getRaceDuration_BetweenLaborPains(a.GetActorBase().GetRace())
	endIf
	if result < 0.3
		return 0.3 ; return at least 30%
	else
		return result
	endIf
endFunction
float function getRaceDuration_BetweenLaborPains(race RaceID)
	float result = 1.0
	result *= StorageUtil.GetFloatValue(RaceID,"FW.AddOn.Duration_10_SecondsBetweenLaborPains",1.0)
	if result < 0.3
		return 0.3 ; return at least 30%
	else
		return result
	endIf
endFunction


float function getActorDuration_BabySpawn(actor a)
	float result = 1.0
	if a && a.GetActorBase() && a.GetActorBase().GetRace()
		result *= getRaceDuration_BabySpawn(a.GetActorBase().GetRace())
	endIf
	if result < 0.3
		return 0.3 ; return at least 30%
	else
		return result
	endIf
endFunction
float function getRaceDuration_BabySpawn(race RaceID)
	float result = 1.0
	result *= StorageUtil.GetFloatValue(RaceID,"FW.AddOn.Duration_11_SecondsBetweenBabySpawn",1.0)
	if result < 0.3
		return 0.3 ; return at least 30%
	else
		return result
	endIf
endFunction

float function getActorContraceptionDuration(actor a)
	float result = 1.0
	if a && a.GetActorBase() && a.GetActorBase().GetRace()
		result *= getRaceContraceptionDuration(a.GetActorBase().GetRace())
	endIf
	if result < 1.0
		return 1.0 ; return at least 1 Day
	else
		return result
	endIf
endFunction
float function getRaceContraceptionDuration(race RaceID)
	float result = 1.0
	result *= StorageUtil.GetFloatValue(RaceID,"FW.AddOn.ContraceptionDuration",1.0)
	if result < 1.0
		return 1.0 ; return at least 1 Day
	elseif result > 8.0
		return 8.0 ; return a maximum of 8 Days
	else
		return result
	endIf
endFunction



; DamageType Argument:
; 	0 = Mittelschmerz
; 	1 = Menstruation
; 	2 = PMS pains
; 	3 = Labor Pains
; 	4 = Giving Birth
;	5 = Aborts
float function getActorDamageScale(int DamageType, actor a)
	float result = 1.0
	if a && a.GetActorBase() && a.GetActorBase().GetRace()
		result *= getRaceDamageScale(DamageType, a.GetActorBase().GetRace())
	endIf
	if result < 0.05
		return 0.05
	else
		return result
	endif
endFunction
float function getRaceDamageScale(int DamageType, race RaceID)
	float result = 1.0
	if DamageType == 0
		result *= StorageUtil.GetFloatValue(RaceID,"FW.AddOn.Pain_Mittelschmerz",1.0)
		result *= StorageUtil.GetFloatValue(RaceID,"FW.AddOn.Pain_Phase_CyclePains",1.0)
	elseif DamageType==1
		result *= StorageUtil.GetFloatValue(RaceID,"FW.AddOn.Pain_Mittelschmerz",1.0)
		result *= StorageUtil.GetFloatValue(RaceID,"FW.AddOn.Pain_Phase_CyclePains",1.0)
	elseif DamageType==2
		result *= StorageUtil.GetFloatValue(RaceID,"FW.AddOn.Pain_PMS",1.0)
		result *= StorageUtil.GetFloatValue(RaceID,"FW.AddOn.Pain_Phase_CyclePains",1.0)
	elseif DamageType==3
		result *= StorageUtil.GetFloatValue(RaceID,"FW.AddOn.Pain_LaborPains",1.0)
		result *= StorageUtil.GetFloatValue(RaceID,"FW.AddOn.Pain_Phase_PregnantPains",1.0)
	elseif DamageType==4
		result *= StorageUtil.GetFloatValue(RaceID,"FW.AddOnPain_GivingBirthPain_PMS",1.0)
		result *= StorageUtil.GetFloatValue(RaceID,"FW.AddOn.Pain_Phase_PregnantPains",1.0)
	elseif DamageType==5
		result *= StorageUtil.GetFloatValue(RaceID,"FW.AddOn.Pain_Abortus",1.0)
		result *= StorageUtil.GetFloatValue(RaceID,"FW.AddOn.Pain_Phase_PregnantPains",1.0)
	endIf
	if result <0.05
		return 0.05 ; Return at least 5%
	else
		return result
	endif
endFunction


; Get the PMS Chance
float function PMSChanceActorScale(actor a)
	float result = 1.0
	if a && a.GetActorBase() && a.GetActorBase().GetRace()
		result *= PMSChanceRaceScale(a.GetActorBase().GetRace())
	endIf
	if result < 0.1
		return 0.1
	else
		return result
	endif
endfunction
float function PMSChanceRaceScale(race RaceID)
	float result = 1.0;
	result *= StorageUtil.GetFloatValue(RaceID,"FW.AddOn.PMS_ChanceScale",1.0)
	if result < 0.1
		return 0.1
	else
		return result
	endif
endfunction


; Get the "BecomePregnant" Chance
float function PregnancyChanceActorScale(actor a)
	float result = 1.0
	if a && a.GetActorBase() && a.GetActorBase().GetRace()
		result *= PMSChanceRaceScale(a.GetActorBase().GetRace())
	endIf
	if result < 0.1
		return 0.1
	else
		return result
	endif
endfunction
float function PregnancyChanceRaceScale(race RaceID)
	float result = 1.0;
	result *= StorageUtil.GetFloatValue(RaceID,"FW.AddOn.ChanceToBecomePregnantScale",1.0)
	if result < 0.1
		return 0.1
	else
		return result
	endif
endfunction


; Get Is canBecomePregnant is Disabled
bool function ActorCanBecomePregnant(actor a)
	if a && a.GetActorBase() && a.GetActorBase().GetRace()
		return RaceCanBecomePregnant(a.GetActorBase().GetRace())
	endIf
	return 1.0
endfunction
bool function RaceCanBecomePregnant(race RaceID)
	;WaitRaces()
	return StorageUtil.GetFloatValue(RaceID,"FW.AddOn.ChanceToBecomePregnantScale",1)==1
endfunction


; Get Max Baby count on multiple threshold
float function ActorMaxBabse(actor a)
	float result = 1.0
	if a && a.GetActorBase() && a.GetActorBase().GetRace()
		result *= RaceMaxBabse(a.GetActorBase().GetRace())
	endIf
	if result < 0.1
		return 0.1
	else
		return result
	endif
endfunction
float function RaceMaxBabse(race RaceID)
	float result = 1.0;
	result *= StorageUtil.GetFloatValue(RaceID,"FW.AddOn.Multiple_Threshold_Max_Babys",1.0)
	if result < 0.1
		return 0.1
	else
		return result
	endif
endfunction


; Get the multiple threshold chance
float function ActorMaxChance(actor a)
	float result = 1.0
	if a && a.GetActorBase() && a.GetActorBase().GetRace()
		result *= RaceMaxChance(a.GetActorBase().GetRace())
	endIf
	if result < 0.1
		return 0.1
	else
		return result
	endif
endfunction
float function RaceMaxChance(race RaceID)
	float result = 1.0;
	result *= StorageUtil.GetFloatValue(RaceID,"FW.AddOn.Multiple_Threshold_Chance",1.0)
	if result < 0.1
		return 0.1
	else
		return result
	endif
endfunction


; Get the Size Scaler
; Type Argument
; 0 = Belly Scaling
; 1 = Brest Scaling
; 2 = +Belly Scaling (on multiple threshold)
; 3 = +Brest Scaling (on multiple threshold)
float function ActorSizeScaler(int Type, actor a)
	float result = 1.0
	if a && a.GetActorBase() && a.GetActorBase().GetRace()
		result *= RaceSizeScaler(Type, a.GetActorBase().GetRace())
	endIf
	if result < 0.1
		return 0.1
	else
		return result
	endif
endfunction
float function RaceSizeScaler(int Type, race RaceID)
	float result = 1.0;
	if Type==0
		result *= StorageUtil.GetFloatValue(RaceID,"FW.AddOn.Sizes_Belly_Max",1.0)
	elseif Type==1
		result *= StorageUtil.GetFloatValue(RaceID,"FW.AddOn.Sizes_Breasts_Max",1.0)
	elseif Type==2
		result *= StorageUtil.GetFloatValue(RaceID,"FW.AddOn.Sizes_Belly_Max_Multiple",1.0)
	elseif Type==3
		result *= StorageUtil.GetFloatValue(RaceID,"FW.AddOn.Sizes_Breasts_Max_Multiple",1.0)
	endIf
	if result < 0.1
		return 0.1
	else
		return result
	endif
endfunction


float function ActorMaleSpermDurationScale(actor a)
	float result = 1.0
	if a && a.GetActorBase() && a.GetActorBase().GetRace()
		result *= RaceMaleSpermDurationScale(a.GetActorBase().GetRace())
	endIf
	if result < 0.1
		return 0.1
	else
		return result
	endif
endFunction
float function RaceMaleSpermDurationScale(race RaceID)
	float result = 1.0;
	result *= StorageUtil.GetFloatValue(RaceID,"FW.AddOn.Duration_MaleSperm",1.0)
	if result < 0.1
		return 0.1
	else
		return result
	endif
endFunction

float function IrregulationChance(actor woman, int state_number)
	int i=0
	float result = 1.0;
	race RaceID = woman.GetLeveledActorBase().GetRace()
	result *= StorageUtil.GetFloatValue(RaceID,"FW.AddOn.Irregulation_Chance_Scale",1.0)
	if result < 0.1
		return 0.1
	else
		return result
	endif
endFunction

float function IrregulationValue(actor woman, int state_number)
	int i=0
	float result = 1.0;
	race RaceID = woman.GetLeveledActorBase().GetRace()
	result *= StorageUtil.GetFloatValue(RaceID,"FW.AddOn.Irregulation_Value_Scale",1.0)
	if result < 0.1
		return 0.1
	else
		return result
	endif
endFunction


float function ActorSpermAmountScale(actor a)
	float result = 1.0
	if a && a.GetActorBase() && a.GetActorBase().GetRace()
		result *= RaceSpermAmountScale(a.GetActorBase().GetRace())
	endIf
	if result < 0.1
		return 0.1
	else
		return result
	endif
endFunction
float function RaceSpermAmountScale(race RaceID)
	float result = 1.0
	result *= StorageUtil.GetFloatValue(RaceID,"FW.AddOn.Sperm_Amount_Scale",1.0)
	if result < 0.3
		return 0.3 ; return at least 30%
	else
		return result
	endIf
endFunction


float function ActorBabyHealingScale(actor a)
	float result = 1.0
	if a && a.GetActorBase() && a.GetActorBase().GetRace()
		result *= RaceBabyHealingScale(a.GetActorBase().GetRace())
	endIf
	if result < 0.1
		return 0.1
	else
		return result
	endif
endFunction
float function RaceBabyHealingScale(race RaceID)
	float result = 1.0
	result *= StorageUtil.GetFloatValue(RaceID,"FW.AddOn.Baby_Healing_Scale",1.0)
	if result < 0.3
		return 0.3 ; return at least 30%
	else
		return result
	endIf
endFunction

float function ActorBabyDamageScale(actor a)
	float result = 1.0
	if a && a.GetActorBase() && a.GetActorBase().GetRace()
		result *= RaceBabyDamageScale(a.GetActorBase().GetRace())
	endIf
	if result < 0.1
		return 0.1
	else
		return result
	endif
endFunction
float function RaceBabyDamageScale(race RaceID)
	float result = 1.0
	result *= StorageUtil.GetFloatValue(RaceID,"FW.AddOn.Baby_Damage_Scale",1.0)
	if result < 0.3
		return 0.3 ; return at least 30%
	else
		return result
	endIf
endFunction


float function ActorMaleRecoveryScale(actor a)
	float result = 1.0
	if a && a.GetActorBase() && a.GetActorBase().GetRace()
		result *= RaceMaleRecoveryScale(a.GetActorBase().GetRace())
	endIf
	if result < 0.1
		return 0.1
	else
		return result
	endif
endFunction
float function RaceMaleRecoveryScale(race RaceID)
	float result = 1.0
	result *= StorageUtil.GetFloatValue(RaceID,"FW.AddOn.Male_Recovery_Scale",1.0)
	if result < 0.3
		return 0.3 ; return at least 30%
	else
		return result
	endIf
endFunction





;-----------------------------------------------------------------
; Misc AddOn Functions

FWAddOn_Misc usedCameraAddOn=none
function StartCamera()
	if usedCameraAddOn!=none
		Debug.Trace("There was a camera already running ("+usedCameraAddOn.GetName()+") - camera stoped")
		StopCamera()
	endIf
	FWAddOn_Misc[] cams = new FWAddOn_Misc[64]
	int i=0
	int j=0
	while i<iMisc && j<64
		if Misc[i].HasCamera
			cams[j]=Misc[i]
			j+=1
		endIf
		i+=1
	endWhile
	if j<=0
		; No Cameras found
	elseif j==1
		; 1 Camera found - Speed up and direct select this AddOn
		usedCameraAddOn=cams[0]
	else
		int camID = Utility.RandomInt(1,j) - 1
		usedCameraAddOn=cams[camID]
	endIf
	if usedCameraAddOn!=none
		Debug.Trace("Using camera "+usedCameraAddOn.GetName()+" - start it")
		usedCameraAddOn.StartCamera()
	endIf
endFunction

function StopCamera()
	if usedCameraAddOn!=none
		usedCameraAddOn.StopCamera()
		usedCameraAddOn=none
	endIf
	Debug.Trace("Camera stoped")
endFunction

function OnEnterState(actor akFemale, int iState)
	int i=0
	while i<iMisc
		if Misc[i] as FWAddOn_Misc != none
			Misc[i].OnEnterState(akFemale,iState)
		endIf
		i+=1
	endWhile
endFunction

function OnExitState(actor akFemale, int iState)
	int i=0
	while i<iMisc
		if Misc[i] as FWAddOn_Misc != none
			Misc[i].OnExitState(akFemale,iState)
		endIf
		i+=1
	endWhile
endFunction

function OnUpdateFunction(actor akFemale, int iState, float StatePercentage)
	int i=0
	while i<iMisc
		if Misc[i] as FWAddOn_Misc != none
			Misc[i].OnUpdateFunction(akFemale,iState, StatePercentage)
		endIf
		i+=1
	endWhile
endFunction

function OnCameInside(actor akFemale, actor akMale)
	int i=0
	while i<iMisc
		if Misc[i] as FWAddOn_Misc != none
			Misc[i].OnCameInside(akFemale,akMale)
		endIf
		i+=1
	endWhile
endFunction

float function getSpermAmount(actor akFemale, actor akMale, float amount)
	int i=1
	float tamount=amount
	while i<iMisc
		if Misc[i] as FWAddOn_Misc != none
			tamount=Misc[i].getSpermAmount(akFemale,akMale,tamount)
		endIf
		i+=1
	endWhile
	return tamount
endFunction

function OnLaborPain(actor akFemale)
	int i=0
	while i<iMisc
		if Misc[i] as FWAddOn_Misc != none
			Misc[i].OnLaborPain(akFemale)
		endIf
		i+=1
	endWhile
endFunction

function OnGiveBirth(actor akMother, int iChildCount)
	int i=0
	while i<iMisc
		if Misc[i] as FWAddOn_Misc != none
			Misc[i].OnGiveBirth(akMother,iChildCount)
		endIf
		i+=1
	endWhile
endFunction

function OnGiveBirthStart(actor akMother)
	int i=0
	while i<iMisc
		if Misc[i] as FWAddOn_Misc != none
			Misc[i].OnGiveBirthStart(akMother)
		endIf
		i+=1
	endWhile
endFunction

function OnGiveBirthEnd(actor akMother)
	int i=0
	while i<iMisc
		if Misc[i] as FWAddOn_Misc != none
			Misc[i].OnGiveBirthEnd(akMother)
		endIf
		i+=1
	endWhile
endFunction

bool function OnPainSound(actor akMother)
	int i=0
	while i<iMisc
		if Misc[i] as FWAddOn_Misc != none
			if Misc[i].OnPainSound(akMother)
				return true
			endif
		endIf
		i+=1
	endWhile
	return false
endFunction

function OnBabySpawn(actor akMother, actor akFather)
	int i=0
	while i<iMisc
		if Misc[i] as FWAddOn_Misc != none
			Misc[i].OnBabySpawn(akMother,akFather)
		endIf
		i+=1
	endWhile
endFunction

function OnPotionDrink(actor akMother, potion akPotion)
	int i=0
	while i<iMisc
		if Misc[i] as FWAddOn_Misc != none
			Misc[i].OnPotionDrink(akMother,akPotion)
		endIf
		i+=1
	endWhile
endFunction

function OnSpellCast(actor akMother, spell akSpell)
	int i=0
	while i<iMisc
		if Misc[i] as FWAddOn_Misc != none
			Misc[i].OnSpellCast(akMother,akSpell)
		endIf
		i+=1
	endWhile
endFunction

; Damage Type:								Optional Argument
;  0	Unknown
;  1	Mittelschmerz / Ovulation pains		strength of the pains
;  2	PMS pains							
;  3	Menstruation cramps					strength of the pains
;  4	Pregnancy 1. sickness
;  5	Pregnancy 2. sickness
;  6	Pregnancy 3. sickness
;  7	premonitory pains
;  8	first stage pains
;  9	Child-Pressing pains
; 10	bearing-down pains
; 11	afterpains
; 12	baby milk drinking pains
; 13	infection pains
; 14	abortus pains
;
; The amount is a percentage value based on the players max health. 0.0 = 0 Damage; 100.0 = instant death
float function OnDoDamage(actor Woman, float Amount, int DamageType = 0, float OptionalArgument = 0.0)
	int i=0
	float xAmount=Amount
	float tAmount
	while i<iMisc
		if Misc[i] as FWAddOn_Misc != none
			tAmount=Misc[i].OnDoDamage(Woman,xAmount,DamageType,OptionalArgument)
			if tAmount>=0
				xAmount=tAmount
			endif
		endIf
		i+=1
	endWhile
	if xAmount>=0
		return xAmount
	else
		return 0
	endif
endFunction

function OnDoDamageStart(actor Woman, float Amount, int DamageType, float OptionalArgument)
	int i=0
	while i<iMisc
		if Misc[i] as FWAddOn_Misc != none
			Misc[i].OnDoDamageStart(Woman,Amount,DamageType,OptionalArgument)
		endIf
		i+=1
	endWhile
endFunction

function OnDoDamageEnd(actor Woman, float Amount, int DamageType, float OptionalArgument)
	int i=0
	while i<iMisc
		if Misc[i] as FWAddOn_Misc != none
			Misc[i].OnDoDamageEnd(Woman,Amount,DamageType,OptionalArgument)
		endIf
		i+=1
	endWhile
endFunction

function OnContraception(actor Woman, float Amount, float ValueBefore, float ValueAfter, float TimeAgo)
	int i=0
	while i<iMisc
		if Misc[i] as FWAddOn_Misc != none
			Misc[i].OnContraception(Woman,Amount,ValueBefore, ValueAfter, TimeAgo)
		endIf
		i+=1
	endWhile
endFunction

function OnImpregnate(actor Woman, int NumChildren, Actor[] ChildFathers)
	int i=0
	while i<iMisc
		if Misc[i] as FWAddOn_Misc != none
			Misc[i].OnImpregnate(Woman,NumChildren,ChildFathers)
		endIf
		i+=1
	endWhile
endfunction

function OnUninstall()
	int i=0
	while i<iMisc
		if Misc[i] as FWAddOn_Misc != none
			Misc[i].OnUninstall()
		endIf
		i+=1
	endWhile
endfunction

bool function CheckForCondome(actor Woman, actor Man)
	int i=0
	while i<iMisc
		if Misc[i] as FWAddOn_Misc != none
			if Misc[i].CheckForCondome(Woman,Man)==true
				return true
			endif
		endIf
		i+=1
	endWhile
	return false
endfunction

function RegisterChildPerk(FWChildSettings childSettings)
	int i=0
	while i<iMisc
		if Misc[i] as FWAddOn_Misc != none
			Misc[i].OnRegisterChildPerk(childSettings)
		endIf
		i+=1
	endWhile
endfunction

function OnMagicEffectApply(Actor akWoman, ObjectReference akCaster, MagicEffect akEffect)
	int i=0
	while i<iMisc
		if Misc[i] as FWAddOn_Misc != none
			Misc[i].OnMagicEffectApply(akWoman, akCaster, akEffect)
		endIf
		i+=1
	endWhile
endfunction

Form[] function OnStripActor(Actor ActorRef)
	int i=0
	Form[] fAll
	while i<iMisc
		if Misc[i] as FWAddOn_Misc != none
			Form[] f = Misc[i].OnStripActor(ActorRef)
			fAll = FWUtility.FormArrayConcat(fAll,f)
		endIf
		i+=1
	endWhile
	return fAll
endfunction

function OnMimik(actor ActorRef, string ExpressionName = "", int Strength = 50, bool bClear = true)
	int i=0
	while i<iMisc
		if Misc[i] as FWAddOn_Misc != none
			Misc[i].OnMimik(ActorRef, ExpressionName, Strength, bClear)
		endIf
		i+=1
	endWhile
endfunction

ObjectReference function OnGetBedRef(Actor ActorRef)
	int i=0
	while i<iMisc
		if Misc[i] as FWAddOn_Misc != none
			ObjectReference or = Misc[i].OnGetBedRef(ActorRef)
			if or!=none
				return or
			endif
		endIf
		i+=1
	endWhile
	return none
endfunction

bool function OnPlayPainSound(actor ActorRef, float Strength)
	int i=0
	while i<iMisc
		if Misc[i] as FWAddOn_Misc != none
			if Misc[i].OnPlayPainSound(ActorRef,Strength)
				return true
			endif
		endIf
		i+=1
	endWhile
	return false
endfunction

bool function OnAllowFFCum(Actor WomanToAdd, Actor denor)
	int i=0
	while i<iMisc
		if Misc[i] as FWAddOn_Misc != none
			if Misc[i].OnAllowFFCum(WomanToAdd,denor)
				return true
			endif
		endIf
		i+=1
	endWhile
	return false
endfunction

actor function OnSleepSexStart(actor p, actor aSexPartner)
	int i=0
	while i<iMisc
		if Misc[i] as FWAddOn_Misc != none
			aSexPartner = Misc[i].OnSleepSexStart(p,aSexPartner)
		endif
		i+=1
	endWhile
	return aSexPartner
endFunction

actor function OnSleepSexStop(actor p, actor aSexPartner)
	int i=0
	while i<iMisc
		if Misc[i] as FWAddOn_Misc != none
			aSexPartner = Misc[i].OnSleepSexStart(p,aSexPartner)
		endif
		i+=1
	endWhile
	return aSexPartner
endFunction

