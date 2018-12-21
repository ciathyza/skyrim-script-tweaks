Scriptname FWChildSettings extends Quest  

string function OrderAV()
	return "JumpingBonus"
endFunction

FormList property ShildSpells auto
FormList property AttackSpells auto
FormList property SummonSpells auto
FormList property HealSpells auto

Faction property Faction_Job auto
Faction property Faction_OtherParent auto
Faction property Faction_MaySleep auto
Faction property Faction_WantsToPlay auto ; 0 = No, 1 = Hide and seek, 2 = run away

FormList property Factions_To_Transfer auto

;int property ChildMaxLevel = 150 autoReadonly
int property MaxLevelsPerCombat = 10 autoReadOnly
int property SkillpointsPerLevel = 5 autoReadOnly

idle property IdleRead auto
idle property IdleStuddy auto
idle property IdleMagic auto

Imagespacemodifier property MenuImageSpace auto

Quest property ChildDialogueQuest auto

int property ParentRelationShipLevel = 3 auto


spell property LevelUpFX auto

FWChildActor[] PlayerChildren

int[] property ChildPerkX auto hidden
int[] property ChildPerkY auto hidden
int[] property ChildPerkRank auto hidden
bool[] property ChildPerkBool auto hidden
bool[] property ChildPerkEnabled auto hidden
string[] property ChildPerkFile auto hidden
;LeveledSpell[] property ChildPerk auto hidden

FWAddOnManager property Manager auto
Faction property PlayerFaction auto

Static property MeetPointForm auto

int property LoadingState auto hidden

int function ChildMaxLevel() Global
	return 150
endFunction

function initArray()
	LoadingState=2
	if PlayerChildren.length<128
		PlayerChildren = new FWChildActor[128]
	endif
	LoadingState=3
	if ChildPerkX.length<128
		ChildPerkX = new int[128]
	endif
	LoadingState=4
	if ChildPerkY.length<128
		ChildPerkY = new int[128]
	endif
	LoadingState=5
	if ChildPerkRank.length<128
		ChildPerkRank = new int[128]
	endif
	LoadingState=6
	if ChildPerkBool.length<128
		ChildPerkBool = new bool[128]
	endif
	LoadingState=7
	if ChildPerkFile.length<128
		ChildPerkFile = new string[128]
	endif
	LoadingState=8
	if ChildPerkEnabled.length<128
		ChildPerkEnabled = new bool[128]
	endif
	LoadingState=9
endFunction

function Upgrade(int oldVersion, int newVersion)
endFunction

function ResetChildPerks()
	initArray()
	int i=0
	LoadingState=10
	while i<128
		;ChildPerk[i]=none
		ChildPerkFile[i]=""
		ChildPerkBool[i]=false
		ChildPerkRank[i]=0
		ChildPerkX[i]=0
		ChildPerkY[i]=0
		ChildPerkEnabled[i]=false
		i+=1
	endwhile
	LoadingState=11
	RegisterChildPerk()
	LoadingState=25
endFunction

function OnGameLoad()
	LoadingState=1
	ResetChildPerks()
	LoadingState=0
endfunction

function SetOtherParentAlias(ObjectReference NewOtherParent = none, bool bOnlyIfEmpty = true)
	if NewOtherParent != none
		if bOnlyIfEmpty
			(ChildDialogueQuest.GetAliasByName("OtherParent") as Referencealias).ForceRefIfEmpty(NewOtherParent)
		else
			(ChildDialogueQuest.GetAliasByName("OtherParent") as Referencealias).ForceRefTo(NewOtherParent)
		endif
	else
		Quest q = Game.GetFormFromFile(0x21382, "skyrim.esm") as quest
		if q!=none
			if bOnlyIfEmpty
				(ChildDialogueQuest.GetAliasByName("OtherParent") as Referencealias).ForceRefIfEmpty((q.GetAliasByName("LoveInterest") as Referencealias).GetReference())
			else
				(ChildDialogueQuest.GetAliasByName("OtherParent") as Referencealias).ForceRefTo((q.GetAliasByName("LoveInterest") as Referencealias).GetReference())
			endif
		endif
	endif
endFunction

function SetHouseAlias()
	int i=Game.GetModCount()
	Quest q = Game.GetFormFromFile(0x21382, "skyrim.esm") as quest
	while i>0
		i-=1
		if(Game.GetModName(i)=="HearthFires.esm")
			i=0
			Quest qHF = Game.GetFormFromFile(0x42B4, "HearthFires.esm") as quest
			if qHF!=none
				if qHF.IsActive()
					LocationAlias LocAlias = (qHF.GetAliasByName("CurrentHomeHouse") as LocationAlias)
					if(LocAlias!=none)
						(ChildDialogueQuest.GetAliasByName("PlayerHomeLoc") as LocationAlias).ForceLocationTo(LocAlias.GetLocation())
					elseif q!=none
						(ChildDialogueQuest.GetAliasByName("PlayerHomeLoc") as LocationAlias).ForceLocationTo((q.GetAliasByName("CurrentMarriageHouse") as LocationAlias).GetLocation())
					endif
					if q!=none
						(ChildDialogueQuest.GetAliasByName("PlayerHome") as Referencealias).ForceRefTo((q.GetAliasByName("HouseCenter") as Referencealias).GetReference())
					endif
					return
				endif
			endif
		endif
	endwhile
	
	if q!=none
		(ChildDialogueQuest.GetAliasByName("PlayerHomeLoc") as LocationAlias).ForceLocationTo((q.GetAliasByName("CurrentMarriageHouse") as LocationAlias).GetLocation())
		(ChildDialogueQuest.GetAliasByName("PlayerHome") as Referencealias).ForceRefTo((q.GetAliasByName("HouseCenter") as Referencealias).GetReference())
	endif
endFunction

string function GetModFile()
	int i=Game.GetModCount()
	while i>0
		i-=1
		if(Game.GetModName(i)=="BeeingFemale.esm")
			return "BeeingFemale.esm"
		elseif(Game.GetModName(i)=="BeeingFemale.esp")
			return "BeeingFemale.esp"
		endif
	endwhile
endFunction

function RegisterChildPerk()
	; Register Basic Perks
	LoadingState=12
	int c= FWUtility.GetFileCount("ChildPerk","ini")
	LoadingState=13
	while c>0
		c-=1
		string fn = FWUtility.GetFileName("ChildPerk","ini",c)
		AddChildPerk(fn)
	endWhile
	LoadingState=22
	; using the AddOn Manager
	Manager.RegisterChildPerk(self)
	LoadingState=23
	; using mod event
	SendModEvent("BeeingFemale", "RegisterChildPerk", 0)
	LoadingState=24
endFunction

function AddPlayerChild(FWChildActor NewChild)
	int i=128
	int nextInsertID=-1
	if PlayerChildren.length<128
		initArray()
	endif
	while i>0
		i-=1
		if PlayerChildren[i] == NewChild
			return
		elseif PlayerChildren[i]!=none
			nextInsertID = i
		endif
	endWhile
	if nextInsertID>-1 && nextInsertID<128
		PlayerChildren[nextInsertID]=NewChild
	endif
	UnregisterForUpdateGameTime()
	RegisterForUpdateGameTime(1)
endFunction

function RemovePlayerChild(FWChildActor ChildToRemove)
	if PlayerChildren.length<128
		return
	endif
	int i=128
	while i>0
		i-=1
		if PlayerChildren[i] == ChildToRemove
			PlayerChildren[i] = none
			return
		endif
	endWhile
endFunction

event OnUpdateGameTime()
	if PlayerChildren.length<128
		return
	endif
	
	int i=128
	while i>0
		i-=1
		if PlayerChildren[i]!=none
			if PlayerChildren[i].PlayerLastSeen >0
				if (PlayerChildren[i].GetActorValue(OrderAV()) < 10 && Utility.GetCurrentGameTime() - PlayerChildren[i].PlayerLastSeen > 1) || (PlayerChildren[i].GetActorValue(OrderAV()) == 12 && Utility.GetCurrentGameTime() - PlayerChildren[i].PlayerLastSeen > 2)
				   	Debug.Notification(PlayerChildren[i].GetDisplayName() + " is going home")
					PlayerChildren[i].Order_GoHome()
				endif
			endif
		endif
	endWhile
endEvent

function SetMeetPoint(ObjectReference or = none)
	If (MeetPointForm==none)
		MeetPointForm = Game.GetFormFromFile(0x800D9, "Skyrim.esm") as Static
	endIf
	ReferenceAlias ra = (ChildDialogueQuest.GetAliasByName("MeetPoint") as referencealias)
	ObjectReference xor = none
	if(ra==none)
		;Debug.Trace("BeeingFemale::FWChildSettings->SetMeetPoint - ra ")
		xor = Game.GetPlayer().PlaceAtMe(MeetPointForm)
	else
		xor = ra.GetReference()
	endif
	if xor!=none
		if or == none
			xor.MoveTo(or)
		else
			xor.MoveTo(Game.GetPlayer())
		endif
		(ChildDialogueQuest.GetAliasByName("MeetPoint") as referencealias).ForceRefTo(xor)
		;Debug.Trace("BeeingFemale::FWChildSettings->SetMeetPoint - Set Meet Point to: " + (ChildDialogueQuest.GetAliasByName("MeetPoint") as referencealias).GetName() + "; Name: " + (ChildDialogueQuest.GetAliasByName("MeetPoint") as referencealias).GetRef().GetName() + "; Location: " + (ChildDialogueQuest.GetAliasByName("MeetPoint") as referencealias).GetRef().GetCurrentLocation().GetName())
	else
		;Debug.Trace("BeeingFemale::FWChildSettings->SetMeetPoint - Failed Set Meet Point")
	endif
endFunction


; X = 0 - 400
; Y = 0 - 100
function AddChildPerk(string NewChildPerk)
	LoadingState=14
	if NewChildPerk==""
		;Debug.Trace("- AddChildPerk('"+NewChildPerk+"'): -Empty File string-")
		return
	endif
	LoadingState=15
	int i = 0
	if ChildPerkFile.length<128
		initArray()
	endif
	LoadingState=16
	; Check if exists
	while i<128
		if(ChildPerkFile[i]==NewChildPerk)
			return
		endif
		i+=1
	endWhile
	LoadingState=17
	
	;Debug.Trace("- AddChildPerk('"+NewChildPerk+"'): Add Perk")
	; Add perk
	i = 0
	while i<128
		LoadingState=18
		if(ChildPerkFile[i]=="")
			LoadingState=19
			ChildPerkFile[i] = NewChildperk
			ChildPerkX[i] = FWUtility.getIniCInt("ChildPerk", NewChildperk, "General","PositionX", 0)
			ChildPerkY[i] = FWUtility.getIniCInt("ChildPerk", NewChildperk, "General","PositionY", 0)
			ChildPerkRank[i] = FWUtility.getIniCInt("ChildPerk", NewChildperk, "General","Ranks", 0)
			ChildPerkBool[i] = FWUtility.getIniCBool("ChildPerk", NewChildperk, "General","UseAll", false)
			ChildPerkEnabled[i] = FWUtility.getIniCBool("ChildPerk", NewChildperk, "General","Enabled", true)
			;Debug.Trace("- - ChildPerkFile["+i+"]: '"+ChildPerkFile[i]+"'")
			;Debug.Trace("- - ChildPerkX["+i+"]: '"+ChildPerkX[i]+"'")
			;Debug.Trace("- - ChildPerkY["+i+"]: '"+ChildPerkY[i]+"'")
			;Debug.Trace("- - ChildPerkRank["+i+"]: '"+ChildPerkRank[i]+"'")
			;Debug.Trace("- - ChildPerkBool["+i+"]: '"+ChildPerkBool[i]+"'")
			;Debug.Trace("- - ChildPerkEnabled["+i+"]: '"+ChildPerkEnabled[i]+"'")
			LoadingState=20
			return
		endif
		i+=1
	endWhile
	LoadingState=21
endFunction

float function getExperience(int Level)
	; Base Formular: ((x + 60) * (x / 600) * 45) + 80
	return ((Level + 80) * (Level / 200) * 45) + 15 + (Level * 4)
endFunction




;----------------------------
; Child Skill Menu
FWChildActor menuChild
int rankIndex = 0
int lastInitPerk = 0
function OpenSkillMenu(FWChildActor ChildToUse)
	If ChildToUse==none
		return
	endIf
	ChildToUse.HasMagicka = true
	ChildToUse.CanWearWeapons = true
	
	MenuImageSpace.Apply()
	menuChild = ChildToUse
	menuChild.calculateSkillPoints() ; Recalculate Skillpoints first
	RegisterForModEvent("GetBeeingFemaleChildData", "GetBeeingFemaleChildData")
	RegisterForModEvent("GetBeeingFemaleChildStats", "GetBeeingFemaleChildStats")
	RegisterForModEvent("ChildActorSkilled","ChildActorSkilled")
	RegisterForModEvent("ChildSkillMenuClosed","ChildSkillMenuClosed")
	RegisterForModEvent("ChildActorPerk","ChildActorPerk")
	RegisterForModEvent("ChildLoadPerkData","ChildLoadPerkData")
	lastInitPerk=0
	rankIndex=0
	UI.OpenCustomMenu("BeeingFemale/BeeingFemaleChildSkill")
endFunction

int[] function getPerkRequirement(string s, int rank)
	int[] r = new int[14]
	r[0] = FWUtility.getIniCInt("ChildPerk", s, "Rank"+rank, "RequiredLevel",0)
	r[1] = FWUtility.getIniCInt("ChildPerk", s, "Rank"+rank, "RequiredAlteration",0)
	r[2] = FWUtility.getIniCInt("ChildPerk", s, "Rank"+rank, "RequiredConjuration",0)
	r[3] = FWUtility.getIniCInt("ChildPerk", s, "Rank"+rank, "RequiredDestruction",0)
	r[4] = FWUtility.getIniCInt("ChildPerk", s, "Rank"+rank, "RequiredIllusion",0)
	r[5] = FWUtility.getIniCInt("ChildPerk", s, "Rank"+rank, "RequiredRestoration",0)
	r[6] = FWUtility.getIniCInt("ChildPerk", s, "Rank"+rank, "RequiredArchery",0)
	r[7] = FWUtility.getIniCInt("ChildPerk", s, "Rank"+rank, "RequiredOneHanded",0)
	r[8] = FWUtility.getIniCInt("ChildPerk", s, "Rank"+rank, "RequiredTwoHanded",0)
	r[9] = FWUtility.getIniCInt("ChildPerk", s, "Rank"+rank, "RequiredSneak",0)
	r[10] = FWUtility.getIniCInt("ChildPerk", s, "Rank"+rank, "RequiredHealth",0)
	r[11] = FWUtility.getIniCInt("ChildPerk", s, "Rank"+rank, "RequiredMagicka",0)
	r[12] = FWUtility.getIniCInt("ChildPerk", s, "Rank"+rank, "RequiredComprehension",0)
	r[13] = FWUtility.getIniCInt("ChildPerk", s, "Rank"+rank, "RequiredBlock",0)
endFunction

string function getPerkRequirementString(string s, int rank)
	return FWUtility.getIniCInt("ChildPerk", s, "Rank"+rank, "RequiredLevel",0) + ";" + FWUtility.getIniCInt("ChildPerk", s, "Rank"+rank, "RequiredAlteration",0) + ";" + FWUtility.getIniCInt("ChildPerk", s, "Rank"+rank, "RequiredConjuration",0) + ";" +  FWUtility.getIniCInt("ChildPerk", s, "Rank"+rank, "RequiredDestruction",0) + ";"+FWUtility.getIniCInt("ChildPerk", s, "Rank"+rank, "RequiredIllusion",0) + ";"+FWUtility.getIniCInt("ChildPerk", s, "Rank"+rank, "RequiredRestoration",0) + ";"+FWUtility.getIniCInt("ChildPerk", s, "Rank"+rank, "RequiredArchery",0) + ";"+FWUtility.getIniCInt("ChildPerk", s, "Rank"+rank, "RequiredOneHanded",0) + ";"+FWUtility.getIniCInt("ChildPerk", s, "Rank"+rank, "RequiredTwoHanded",0) + ";"+FWUtility.getIniCInt("ChildPerk", s, "Rank"+rank, "RequiredSneak",0) + ";"+FWUtility.getIniCInt("ChildPerk", s, "Rank"+rank, "RequiredHealth",0) + ";"+FWUtility.getIniCInt("ChildPerk", s, "Rank"+rank, "RequiredMagicka",0) + ";"+FWUtility.getIniCInt("ChildPerk", s, "Rank"+rank, "RequiredComprehension",0) + ";"+FWUtility.getIniCInt("ChildPerk", s, "Rank"+rank, "RequiredBlock",0)
endFunction

event ChildLoadPerkData(string hookName, string argString, float argNum, form Sender)
	; Send Perk-List / Requerst next perk
	;Debug.Trace("AddChildPerk()")
	int i = lastInitPerk
	while(i<128)
		if(ChildPerkFile[i]!="" && ChildPerkEnabled[i]==true)
			
			int currentRank = 0
			int pos = StorageUtil.StringListFind(menuChild,"FW.Child.Perks",ChildPerkFile[i])
			if pos>=0
				currentRank = StorageUtil.IntListGet(menuChild, "FW.Child.PerksLevel", pos)
			endif
			
			string[] a = new string[7]
			string perkFile = ChildPerkFile[i]
			int c = ChildPerkRank[i]
			int k = 0
			
			;Debug.Trace("- Perk File: '"+perkFile+"'")
			;Debug.Trace("- Perk Ranks: '"+c+"'")
			
			while k<c
				k+=1
				string SpellModFile = FWUtility.modFile( FWUtility.getIniCString("ChildPerk", perkFile, "Rank"+k, "ModName") )
				int SpellFormID = FWUtility.getIniCInt("ChildPerk", perkFile, "Rank"+k, "FormID")
				spell s = Game.GetFormFromFile(SpellFormID, SpellModFile) as spell
				if s != none
					string[] ent = new string[5]
					string bEnabled="y"
					
					string desc = FWUtility.getIniCString("ChildPerk", perkFile, "Rank"+k, "Description",s.GetName())
					if s.GetNumEffects()>0
						desc = FWUtility.StringReplace(desc, "<mag>", "<font color='#ffffff'>"+(s.GetNthEffectMagnitude(0) as int)+"</font>")
						desc = FWUtility.StringReplace(desc, "<dur>", "<font color='#ffffff'>"+(s.GetNthEffectDuration(0) as int)+" sec</font>")
						desc = FWUtility.StringReplace(desc, "<mag%>", "<font color='#ffffff'>"+(s.GetNthEffectMagnitude(0) as int)+"%</font>")
						desc = FWUtility.StringReplace(desc, "<dur%>", "<font color='#ffffff'>"+(s.GetNthEffectDuration(0) as int)+"%</font>")
					else
						desc = FWUtility.StringReplace(desc, "<mag>", "<font color='#ffffff'>0</font>")
						desc = FWUtility.StringReplace(desc, "<dur>", "<font color='#ffffff'>0 sec</font>")
						desc = FWUtility.StringReplace(desc, "<mag%>", "<font color='#ffffff'>0%</font>")
						desc = FWUtility.StringReplace(desc, "<dur%>", "<font color='#ffffff'>0%</font>")
					endif
					int cs = 10
					while cs>0
						cs-=1
						if cs < s.GetNumEffects()
							desc = FWUtility.StringReplace(desc, "<mag "+(cs+1)+">", "<font color='#ffffff'>"+(s.GetNthEffectMagnitude(cs) as int)+"</font>")
							desc = FWUtility.StringReplace(desc, "<dur "+(cs+1)+">", "<font color='#ffffff'>"+(s.GetNthEffectDuration(cs) as int)+" sec</font>")
							desc = FWUtility.StringReplace(desc, "<mag "+(cs+1)+"%>", "<font color='#ffffff'>"+(s.GetNthEffectMagnitude(cs) as int)+"%</font>")
							desc = FWUtility.StringReplace(desc, "<dur "+(cs+1)+"%>", "<font color='#ffffff'>"+(s.GetNthEffectDuration(cs) as int)+"%</font>")
						else
							desc = FWUtility.StringReplace(desc, "<mag "+(cs+1)+">", "<font color='#ffffff'>0</font>")
							desc = FWUtility.StringReplace(desc, "<dur "+(cs+1)+">", "<font color='#ffffff'>0 sec</font>")
							desc = FWUtility.StringReplace(desc, "<mag "+(cs+1)+"%>", "<font color='#ffffff'>0%</font>")
							desc = FWUtility.StringReplace(desc, "<dur "+(cs+1)+"%>", "<font color='#ffffff'>0%</font>")
						endif
					endWhile
					
					ent[0]=rankIndex+(k - 1)
					ent[1]=FWUtility.getIniCString("ChildPerk", perkFile, "Rank"+k, "Name","")
					ent[2]=desc
					ent[3]=bEnabled
					ent[4]=getPerkRequirementString(perkFile,k)
					
					if ent[1]==""
						ent[1]=s.GetName()
					endif
				
					;Debug.Trace("- Rank "+currentRank)
					;Debug.Trace("- - ID: '"+ent[0]+"'")
					;Debug.Trace("- - Name: '"+ent[1]+"'")
					;Debug.Trace("- - Description: '"+ent[2]+"'")
					;Debug.Trace("- - bEnabled: '"+ent[3]+"'")
					;Debug.Trace("- - Perk Requirement Strings: '"+ent[4]+"'")
					UI.InvokeStringA("CustomMenu", "_root.childSkillDial.AddPerkEntry", ent)
				else
					;Debug.Trace("Perk Entry failed. File: '"+perkFile+"' on Rank "+k+". Spell not found")
					;Debug.Notification("Perk Entry failed. File: '"+perkFile+"' on Rank "+k+". Spell not found")
				endif
			endwhile
			
			a[0]=ChildPerkFile[i]
			a[1]=i
			a[2]=ChildPerkX[i]
			a[3]=ChildPerkY[i]
			a[4]=currentRank
			a[5]=rankIndex
			a[6]=ChildPerkRank[i]
			;Debug.Trace("- childSkillDial.AddPerkA('"+a[0]+"','"+a[1]+"','"+a[2]+"','"+a[3]+"','"+a[4]+"','"+a[5]+"')")
			UI.InvokeStringA("CustomMenu", "_root.childSkillDial.AddPerkA", a)
			rankIndex+=ChildPerkRank[i]
			
			
			lastInitPerk=i+1
			return
		endif
		i+=1
	endWhile
	UI.Invoke("CustomMenu", "_root.childSkillDial.PerksTransmittet")
endEvent

; Raised when leveling a perk
event ChildActorPerk(string hookName, string argString, float argNum, form Sender)
	if(Sender == menuChild)
		;int i=ChildPerk.length
		;while(i>0)
		;	i-=1
		;	LeveledSpell p = ChildPerk[i]
		;	if p!=none
		;		if p.GetFormID()==argString as int
		;			; Perk found
		;			int pos = StorageUtil.FormListFind(menuChild,"FW.Child.Perks",p)
		;			int level = 0
		;			if pos==-1
		;				StorageUtil.FormListAdd(menuChild, "FW.Child.Perks", p)
		;				StorageUtil.IntListAdd(menuChild, "FW.Child.PerksLevel", argNum as int)
		;			else
		;				StorageUtil.IntListSet(menuChild, "FW.Child.PerksLevel", pos, argNum as int)
		;			endif
		;			menuChild.handlePerk(p)
		;			i=0
		;		endif
		;	endif
		;endwhile
		
		int i = 128
		int perkIndex = -1
		while(i>0)
			i-=1
			if argString==ChildPerkFile[i]
				perkIndex = i
				i=0
			endif
		endWhile
		
		if perkIndex>=-1
			int pos = StorageUtil.StringListFind(menuChild,"FW.Child.Perks",argString)
			if pos==-1
				StorageUtil.StringListAdd(menuChild, "FW.Child.Perks", argString)
				StorageUtil.IntListAdd(menuChild, "FW.Child.PerksLevel", argNum as int)
			else
				StorageUtil.IntListSet(menuChild, "FW.Child.PerksLevel", pos, argNum as int)
			endif
			menuChild.handlePerk(perkIndex)
		endif
	endif
endEvent

event ChildActorSkilled(string hookName, string argString, float argNum, form Sender)
	if(Sender == menuChild)
		if(argString=="Regeneration")
			
		elseif argString == "SpeedBonus"
			menuChild.SetActorValue("SpeedMult", 100 + (argNum / 2))
		else
			menuChild.SetActorValue(argString, argNum)
		endif
	endif
endEvent

event ChildSkillMenuClosed(string hookName, string argString, float argNum, form Sender)
	UnregisterForModEvent("GetBeeingFemaleChildData")
	UnregisterForModEvent("GetBeeingFemaleChildStats")
	UnregisterForModEvent("ChildActorSkilled")
	UnregisterForModEvent("ChildSkillMenuClosed")
	UnregisterForModEvent("ChildLoadPerkData")
	if(menuChild.IsLearning==false)
		menuChild.CheckInventory()
	endif
	MenuImageSpace.Remove()
	menuChild=none
endEvent

event GetBeeingFemaleChildData(string hookName, string argString, float argNum, form sender)
	UnregisterForModEvent("GetBeeingFemaleChildData")
	UI.InvokeNumber("CustomMenu", "_root.childSkillDial.setPlatform", (Game.UsingGamepad() as Int))
	; Info Tab
	string[] strA = new string[15]
	strA[0]=menuChild.Name
	strA[1]=menuChild.GetLastName()
	strA[2]=""
	strA[3]=""
	if menuChild.Mother!=none && menuChild.Mother.GetLeveledActorBase()
		strA[4]=menuChild.Mother.GetLeveledActorBase().GetName()
		strA[5]=menuChild.Mother.GetLeveledActorBase().GetRace().GetName()
	else
		strA[4]="$GAME_CONTENT_InfoSpell_UnknownParent"
		strA[5]="$GAME_CONTENT_InfoSpell_UnknownParentRace"
	endif
	if menuChild.Father!=none && menuChild.Father.GetLeveledActorBase()
		strA[6]=menuChild.Father.GetLeveledActorBase().GetName()
		strA[7]=menuChild.Father.GetLeveledActorBase().GetRace().GetName()
	else
		strA[6]="$GAME_CONTENT_InfoSpell_UnknownParent"
		strA[7]="$GAME_CONTENT_InfoSpell_UnknownParentRace"
	endif
	if menuChild.HasMagicka==true
		strA[8]="y"
	else
		strA[8]="n"
	endif
	if menuChild.CanWearWeapons==true
		strA[9]="y"
	else
		strA[9]="n"
	endif
	
	; Int Function GetSpellCount() native
	; Spell Function GetNthSpell(int n) native
	string sAlteration = ""
	string sConjuration = ""
	string sDestruction = ""
	string sIllusion = ""
	string sRestoration = ""
	int c = menuChild.GetSpellCount()
	while c>0
		c-=1
		spell s = menuChild.GetNthSpell(c)
		if(s.GetNumEffects() > 0 && s.GetMagickaCost()>0)
			string sk = s.GetNthEffectMagicEffect(0).GetAssociatedSkill()
			if(sk == "Alteration")
				sAlteration += s.GetName() + "|"
			elseif(sk == "Conjuration")
				sConjuration += s.GetName() + "|"
			elseif(sk == "Destruction")
				sDestruction += s.GetName() + "|"
			elseif(sk == "Illusion")
				sIllusion += s.GetName() + "|"
			elseif(sk == "Restoration")
				sRestoration += s.GetName() + "|"
			endif
		endif
	endwhile
	strA[10] = sAlteration
	strA[11] = sConjuration
	strA[12] = sDestruction
	strA[13] = sIllusion
	strA[14] = sRestoration
	
	UI.InvokeInt("CustomMenu", "_root.childSkillDial.setChild", menuChild.GetFormID())
	
	FWSystemConfig cfg = Game.GetFormFromFile(0x1828, FWUtility.ModFile("BeeingFemale")) as FWSystemConfig
	bool debugMode = false
	if cfg!=none
		debugMode = cfg.Messages<=0
	endif
	UI.InvokeBool("CustomMenu", "_root.childSkillDial.DebugMode", debugMode)
	UI.InvokeStringA("CustomMenu", "_root.childSkillDial.initChild", strA)
endEvent



;newLevel:Number, newExp:Number, newMaxExp:Number, newSkillPoints:Number, newPerkPoints:Number, 
;newComprehension:Number, newDestruction:Number, newIllusion:Number, newConjuration:Number, newMagicka:Number, 
;newRestoration:Number, newAlteration:Number, newCarryWeight:Number, 
;newOneHanded:Number, newTwoHanded:Number, newArchery:Number, newSneak:Number, newHealth:Number
event GetBeeingFemaleChildStats(string hookName, string argString, float argNum, form sender)
	UnregisterForModEvent("GetBeeingFemaleChildStats")	
	float[] intA = new float[21]
	intA[0] = menuChild.GetLevel()
	intA[1] = menuChild.getExp()
	intA[2] = getExperience(menuChild.GetLevel())
	intA[3] = menuChild.calculateSkillPoints()
	intA[4] = menuChild.calculatePerkPoints()
	
	intA[5] = menuChild.GetActorValue("Comprehension")
	intA[6] = menuChild.GetActorValue("Destruction")
	intA[7] = menuChild.GetActorValue("Illusion")
	intA[8] = menuChild.GetActorValue("Conjuration")
	intA[9] = menuChild.GetActorValue("Magicka")
	
	intA[10] = menuChild.GetActorValue("Restoration")
	intA[11] = menuChild.GetActorValue("Alteration")
	intA[12] = menuChild.GetActorValue("Block")
	intA[13] = menuChild.GetActorValue("CarryWeight")
	
	intA[14] = menuChild.GetActorValue("OneHanded")
	intA[15] = menuChild.GetActorValue("TwoHanded")
	intA[16] = menuChild.GetActorValue("Marksman")
	intA[17] = menuChild.GetActorValue("Sneak")
	intA[18] = menuChild.GetActorValue("Health")
	
	int numPerks=0
	int numPerkE=0
	int i=0
	while i<128
		if ChildPerkFile[i]!="" && ChildPerkEnabled[i]==true
			numPerks+=1
			numPerkE+=ChildPerkRank[i]
		endif
		i+=1
	endWhile
	intA[19] = numPerks
	intA[21] = numPerkE
	
	UI.InvokeFloatA("CustomMenu", "_root.childSkillDial.initChildInt", intA)
	
	; End up init and display the menu
	UI.Invoke("CustomMenu", "_root.childSkillDial.initDone")
endEvent