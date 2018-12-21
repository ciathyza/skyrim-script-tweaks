scriptname DefeatConfig extends Quest Conditional

Import StorageUtil
Import Debug
Import Game
Import Utility

Bool Function IsDefeatActive(Actor Target) ; Check if the target is affected by Defeat stuff.
	Return Target.HasMagicEffectWithKeyword(DefeatActive) || Target.HasKeyWordString("DefeatActive")
EndFunction

; Function meant to be used out of combat.
Bool Function StartScene(Actor[] TheActors, Bool ForceSurrender = False, Bool ForceKnockOut = False, Bool ForceAutoResist = False, \ 		
	String ForceScenario = "",	String ForceEvent = "",		Int ForcePostAssaultOnly = 3,	Int ForceStayDown = 3, 			Int ForceResist = 3, 	Int ForceRob = 3, \
	Int ForceRelation = 3,		Int ForceWitness = 3,		Int ForceCommentary = 3,		Int ForcePlayerCommentary = 3)
	;>>>>>>>>>>>>>>>>>>>    0 - Disable / 1 - Enable / 3 - Default/MCM settings
;/	This function can start an assault scene on the player at any time with a lot of custom options.
	- ForceSurrender : Force the player to surrender to the specified enemies (TheActors[0] is the one who will talk), has the priority over ForceKnockOut
	- ForceKnockOut : Forces the player to knock out and trugger the knockout scene, can be true even if CustomSettings is false
	- ForceAutoResist : Specifies if the player will resist before the scene, will be ignored if ForceKnockOut is true, can be true even if CustomSettings is false
		At least one aggressor need to be set for this to work.
	- ForceScenario : Specified the scenario for the scene.
		available scenarios: "$All Down", "$Original and "$No Transition" (The $ need to be there.).
	- ForceEvent : Specifies a post assault scenario for the end of the scene.  Let it "" for default.
		available scenarios: "Left for dead", "Defeated", "End" OR the name of a custom event. "End" will force a simple escape, "SSLV Entry" a Simple Slavery event for example.
	- PostAssaultOnly : Specifies if the scene should trigger post assault scenario and ignore sexual assaults, dosen't work with surrender scenario.
	- ForceStaydown : Specifies if the player should stay on the ground between each turn or have a chance to run away, will be ignored if ForceKnockOut is true.
	- ForceResist : Specifies if the player can resist before and between turns in the scene, will be ignored if ForceKnockOut is true.
	- ForceRob : Specififes if the player can be robbed before the post assault scenario.
	- ForceRelation : Specifies if the relationship with the aggressors should matter or not.
	- ForceWitness : Specifies if witnesses should act if there are some.
	- ForceCommentary : Specifies if aggressors are able to comment before sexual assaults, will be ignored if ForceKnockOut is true.
	- ForcePlayerCommentary : Specifies if the player should moan or not bewteen scenes, will be ignored if ForceKnockOut is true.	/;
	If OnOffPlayerVictim
		Int i
		Int ArrayLength = TheActors.Length
		While (i < ArrayLength)
			If TheActors[i]
				If (i < 5)
					PlayerScr.AddAggressor(TheActors[i], i)
				Else
					PlayerScr.AddAccomplice(TheActors[i], i)
				Endif
			Endif
			i += 1
		EndWhile
		If TheActors[0]
			PlayerScr.IsAggressorValid(TheActors[0]) ; Set IsCreature
		Endif
		PlayerScr.Detect.Start()
		If ForceSurrender && TheActors[0]
			PlayerScr.SceneSettings(ForceEvent = ForceEvent, ForceScenario = ForceScenario, ForcePostAssaultOnly = ForcePostAssaultOnly, ForceStayDown = ForceStayDown, ForceResist = ForceResist, ForceRob = ForceRob, ForceRelation = ForceRelation, ForceWitness = ForceWitness, ForceCommentary = ForceCommentary, ForcePlayerCommentary = ForcePlayerCommentary)
			PlayerScr.Surrender()
		Elseif ForceKnockOut
			PlayerScr.SceneSettings(ForceScenario = ForceScenario, ForceEvent = ForceEvent, ForcePostAssaultOnly = ForcePostAssaultOnly, ForceStayDown = 1, ForceResist = 0, ForceRob = ForceRob, ForceRelation = 1, ForceWitness = 0, ForceCommentary = ForceCommentary, ForcePlayerCommentary = ForcePlayerCommentary)
			PlayerScr.SetKnockOut()
			PlayerScr.TheKnockDown(TheActors[0])
		Elseif ForceAutoResist && TheActors[0] && TheActors[0].HasKeywordString("ActorTypeNPC")
			PlayerScr.SceneSettings(ForceEvent = ForceEvent, ForceScenario = ForceScenario, ForcePostAssaultOnly = ForcePostAssaultOnly, ForceStayDown = ForceStayDown, ForceResist = 0, ForceRob = ForceRob, ForceRelation = 0, ForceWitness = ForceWitness, ForceCommentary = ForceCommentary, ForcePlayerCommentary = ForcePlayerCommentary)
			PlayerScr.SetAutoResist()
			PlayerScr.KnockDownQTE(TheActors[0])
		Else
			PlayerScr.SceneSettings(ForceEvent = ForceEvent, ForceScenario = ForceScenario, ForcePostAssaultOnly = ForcePostAssaultOnly, ForceStayDown = ForceStayDown, ForceResist = ForceResist, ForceRob = ForceRob, ForceRelation = ForceRelation, ForceWitness = ForceWitness, ForceCommentary = ForceCommentary, ForcePlayerCommentary = ForcePlayerCommentary)
			PlayerScr.TheKnockDown(TheActors[0])
		Endif
		PlayerScr.Detect.Stop()
		Return True
	Endif
	Return False
;/ 
Examples of usage:

; An array of actor needs to be created with all the aggressors, up to 10, only one in this example. (Can be creatures)
Actor[] StartSceneAggressors = new actor[1] 
StartSceneAggressors[0] = AnActor

; Starts a default knockdown scene:
DefeatUtil.StartScene(StartSceneAggressors)

; Forces the player to surrender, StartSceneAggressors[0] does the talking.
DefeatUtil.StartScene(StartSceneAggressors, ForceSurrender = True)

; Starts a Knockout scene.
DefeatUtil.StartScene(StartSceneAggressors, ForceKnockOut = True)

; Starts a scene where the player resist before the knockdown, only with humans.
DefeatUtil.StartScene(StartSceneAggressors, ForceAutoResist = True)

; Can also be called like this
DefeatConfig Defeat = DefeatUtil.GetDefeat()
Defeat.StartScene(StartSceneAggressors)
/;
EndFunction

DefeatMCMscr Property McmConfig Auto
DefeatPlayer Property PlayerScr Auto
DefeatQTEMeter Property StruggleBar Auto
DefeatPAscr Property PostAssaultscr Auto
DefeatActionScr Property ActionQst Auto
DefeatNPCsScr Property NPCsRefreshQstScr Auto
Defeathkactiontarget Property HKActionTargetScr Auto

Bool Property OnOffPlayerAggressor Auto Hidden Conditional
Bool Property OnOffPlayerVictim Auto Hidden Conditional
Bool Property OnOffNVN Auto Hidden Conditional
Bool Property OnOffPerk Auto Hidden Conditional
Bool Property OnOffNecro Auto Hidden Conditional

KeyWord Property DefeatActive Auto
KeyWord Property DefeatRape Auto
Actor Property Player Auto
DefeatNVNInActionScr[] Property PlayerSLMonitor Auto
Package Property DoNothing Auto
ReferenceAlias Property BurlapSackVictim Auto
Perk Property DefeatAssaultPRK Auto

DefeatNVNOnHitScr[] Property NVNOnHitScr Auto
DefeatNVNInActionScr[] Property NVNActionScr Auto
Int Property NVNKDtype = 1 Auto Hidden Conditional
Bool Property NVNAllowVic = True Auto Hidden Conditional
Bool Property NVNAllowFollowerVic = True Auto Hidden Conditional
ReferenceAlias[] Property VicPair Auto
ReferenceAlias[] Property AggPair Auto
ReferenceAlias[] Property AggPairAdd Auto
ReferenceAlias Property PlayerEssential Auto
Quest[] Property MiscQuests Auto Hidden
FormList[] Property MiscFormLists Auto Hidden
Topic[] Property TopicToSay Auto Hidden
Sound[] Property SoundToPlay Auto Hidden
Spell[] Property ResistSpells Auto Hidden
Spell[] Property MiscSpells Auto Hidden
MagicEffect[] Property MiscMagicEffects Auto Hidden
Package[] Property MiscPackages Auto Hidden
ObjectReference[] Property MiscReferences Auto Hidden
GlobalVariable[] Property MiscGlobals Auto Hidden
Message[] Property MiscMessages Auto Hidden
Idle[] Property Killmoves Auto Hidden
Idle[] Property MiscIdles Auto Hidden
Int[] Property HotKeyInts Auto Hidden
VoiceType[] Property MiscVoicetypes Auto Hidden
Faction[] Property DefeatFactions Auto Hidden
Faction[] Property FollowerFactions Auto Hidden

Form Gold
Outfit DefeatEmptyOutfit
GlobalVariable PlayerMoan
Function SetPlayerMoan(Int OnOff)
	PlayerMoan.Setvalue(OnOff)
EndFunction

Function Log(String TheTrace) Global
	Trace("Defeat: "+TheTrace)
EndFunction

SexLabFramework Property SexLab Auto Hidden 					; SexLab
sslSystemConfig Property SexLabConfig Auto Hidden 				;
UILIB_1 Property UILIB Auto Hidden
Bool Property DAon = False Auto Hidden Conditional 				; Death Alternative
Bool Property Zazon = False Auto Hidden Conditional 			; Zaz
Bool Property DDon = False Auto Hidden Conditional 				; Devous Devices
Bool Property DawnguardOn = False Auto Hidden Conditional		; Dawnguard
Race Property VampireLordRace Auto Hidden
Bool Property DragonbornOn = False Auto Hidden Conditional 		; Dragonborn
Bool Property EFFon = False Auto Hidden Conditional 			; Extensible Follower Framework
Bool Property UIEon = False Auto Hidden Conditional 			; UIExtensions
Bool Property PAHon = False Auto Hidden Conditional 			; Paradise Halls
Bool Property SimpleSlaveryon = False Auto Hidden Conditional 	; Simple Slavery
;Bool Property SARon = False Auto Hidden Conditional 			; SexLab Aroused

; ==============================================

Function CheckForMods()
	Int i
	While (i < GetModCount())
		String ModName = GetModName(i)
		If (ModName == "Dawnguard.esm")
			DawnguardOn = True
			MiscQuests[8] = (GetFormFromFile(0x71d0, "Dawnguard.esm") As Quest)
			VampireLordRace = (GetFormFromFile(0x200283A, "Dawnguard.esm") As Race)
			McmConfig.AModList[0] = "Dawnguard : ON"
			Log("Dawwnguard detected.")
		Elseif (ModName == "Dragonborn.esm")
			DragonbornOn = True
			MiscFormLists[1].Revert()
			MiscFormLists[1].AddForm(GetFormFromFile(0x21749, "Dragonborn.esm")) ; DLC2DarkElfBed01
			MiscFormLists[1].AddForm(GetFormFromFile(0x35038, "Dragonborn.esm")) ; DLC2DarkElfBed01L
			MiscFormLists[1].AddForm(GetFormFromFile(0x35037, "Dragonborn.esm")) ; DLC2DarkElfBed01R
			MiscFormLists[1].AddForm(GetFormFromFile(0x32802, "Dragonborn.esm")) ; DLC2DarkElfBedDouble01
			MiscFormLists[1].AddForm(GetFormFromFile(0x36797, "Dragonborn.esm")) ; DLC2DarkElfBedDouble01L
			MiscFormLists[1].AddForm(GetFormFromFile(0x36796, "Dragonborn.esm")) ; DLC2DarkElfBedDouble01R
			MiscVoicetypes[3] = (GetFormFromFile(0x208DC, "Dragonborn.esm") As VoiceType) ; Riekling Voice Type
			McmConfig.AModList[1] = "Dragonborn : ON"
			Log("Dragonborn detected.")
		Elseif (ModName == "ZaZAnimationPack.esm")
			Zazon = True
			McmConfig.AModList[2] = "ZaZ Animation Pack : ON"
			Log("ZaZ Animation Pack detected.")
		Elseif (ModName == "Devious Devices - Integration.esm")
			DDon = True
			DefeatFactions[2] = (GetFormFromFile(0x29567, "Devious Devices - Integration.esm") As Faction)
			McmConfig.AModList[3] = "Devious Devices : ON"
			Log("Devious Devices detected.")
		Elseif (ModName == "daymoyl.esm")
			DAon = True
			McmConfig.AModList[4] = "Death Alternative : ON"
			McmConfig.Grayout("daymoyl", True)
			Log("Death Alternative detected.")
		Elseif (ModName == "UIExtensions.esp")
			UIEon = True
			McmConfig.AModList[5] = "UIExtensions : ON"
			Log("UIExtension detected.")
		Elseif (ModName == "paradise_halls.esm")
			PAHon = True
			McmConfig.AModList[6] = "Paradise Halls : ON"
			Log("Paradise Halls detected.")
		Elseif (ModName == "SimpleSlavery.esp")
			SimpleSlaveryon = True
			McmConfig.AModList[7] = "Simple Slavery : ON"
			Log("Simple slavery detected.")
;		Elseif (ModName == "EFFCore.esm")
;			EFFon = True
;			McmConfig.AModList[5] = "Extensible Follower Framework : ON"
;			Log("Extensible Follower Framework detected.")
;		Elseif (ModName == "SexLabAroused.esm")
;			SARon = True
;			McmConfig.AModList[7] = "SexLab Aroused Redux : ON"
;			McmConfig.Grayout("SAR", True)
;			Log("SexLab Aroused detected.")
		Endif
		i += 1
	EndWhile
EndFunction

Function Maintenance(Bool Updated = False, Int Vers = 0)
	If !Updated
		If (McmConfig.ModStatus == "$Enabled")
			RegisterForKey(HotKeyInts[0]) ; Option key
			RegisterForModEvent("AnimationStart", "RapeScene")
			RegisterForModEvent("AnimationEnd", "EndRapeScene")
			If (McmConfig.OnOffPagg == "$Enabled")
				ActionQst.Configure()
				HKActionTargetScr.Configure()
			Endif	
			If (McmConfig.OnOffPvic == "$Enabled")
				PlayerScr.Configure()
				PostAssaultscr.Configure()
			Endif
			; Check if compatible mods are still loaded.
			If DawnguardOn
				If !GetFormFromFile(0x71d0, "Dawnguard.esm")
					MiscQuests[8] = None
					VampireLordRace = None
					McmConfig.AModList[0] = "Dawnguard : OFF"
					DawnguardOn = False
				Endif
			Endif
			If DragonbornOn
				If !GetFormFromFile(0x208DC, "Dragonborn.esm") 
					MiscFormLists[1].Revert()
					MiscVoicetypes[3] = None ; Rikeling voicetype
					McmConfig.AModList[1] = "Dragonborn : OFF"
					DragonbornOn = False
				Endif
			Endif
			If Zazon
				If !GetFormFromFile(0x137E6, "ZaZAnimationPack.esm")
					McmConfig.AModList[2] = "ZaZ Animation Pack : OFF"
					Zazon = False
				Endif
			Endif
			If DDon
				If !GetFormFromFile(0x29567, "Devious Devices - Integration.esm")
					DefeatFactions[2] = None
					McmConfig.AModList[3] = "Devious Devices : OFF"
					DDon = False
				Endif
			Endif
			If DAon
				If !GetFormFromFile(0xD62, "daymoyl.esm")
					McmConfig.Grayout("daymoyl")
					McmConfig.AModList[4] = "Death Alternative : OFF"
					DAon = False
				Endif
			Endif
			If UIEon
				If !GetFormFromFile(0xE05, "UIExtensions.esp") ; list menu
					McmConfig.AModList[5] = "UIExtensions : OFF"
					UIEon = False
				Endif
			Endif
			If PAHon
				If !GetFormFromFile(0x1FAEF, "paradise_halls.esm")
					McmConfig.AModList[6] = "Paradise Halls : OFF"
					PAHon = False
				Endif
			Endif
			If SimpleSlaveryon
				If !GetFormFromFile(0x300492E, "SimpleSlavery.esp")
					McmConfig.AModList[7] = "Simple Slavery : OFF"
					SimpleSlaveryon = False
				Endif
			Endif
;			If EFFon
;				If !GetFormFromFile(0xEFF, "EFFCore.esm")
;					McmConfig.AModList[5] = "Extensible Follower Framework : OFF"
;					EFFon = False
;				Endif
;			Endif
;			If SARon
;				If !GetFormFromFile(0x4290F, "SexLabAroused.esm")
;					McmConfig.Grayout("SAR")
;					McmConfig.AModList[7] = "SexLab Aroused Redux : OFF"
;					SARon = False
;				Endif
;			Endif
		Endif
	Else
		Update(Vers)
	Endif
EndFunction

State Inactive
EndState

Function Update(Int Vers = 0)
	If (Vers < 66) ; 5.3.0+
		String[] AModListOld = New String[8]
		AModListOld[0] = McmConfig.AModList[0]
		AModListOld[1] = McmConfig.AModList[1]
		AModListOld[2] = McmConfig.AModList[2]
		AModListOld[3] = McmConfig.AModList[3]
		AModListOld[4] = McmConfig.AModList[4]
		AModListOld[5] = McmConfig.AModList[5]
		AModListOld[6] = McmConfig.AModList[6]
		AModListOld[7] = "Simple Slavery : OFF"
		McmConfig.AModList = New String[8]
		McmConfig.AModList = AModListOld
		SOSetDefaultSOXValues()
		SetupCreatureFilter()
	Endif
	Install(True)
	McmConfig.OnConfigInit()
	Notification("Defeat updated to version v5.3.5")
	Log("Defeat updated to version v5.3.5")
EndFunction

Function Uninstall(Int loop = 0)
	If !Player.HasKeywordString("DefeatActive")
		PlayerScr.Uninstall()
		ActionQst.Uninstall()
		GoToState("Inactive")
		If OnOffPlayerAggressor
			If (ActionQst.GetState() == "Carrying")
				ActionQst.OptionOutOfBag(Player)
			Endif
			OnOffFeature("PlayerAgg")
		Endif
		If OnOffPlayerVictim
			OnOffFeature("PlayerVic")
		Endif
		If OnOffNVN
			OnOffFeature("")
		Endif
		Cell PlayerCell = Player.GetParentCell()
		Int i
		While (i < 50)
			If TieUpSlots[i]
				TieUp(TieUpSlots[i], Enter = False)
			Endif
			If TieUpSlotsAliases[i].GetReference()
				TieUp((TieUpSlotsAliases[i].GetReference() As Actor), Enter = False)
			Endif
			i += 1
		EndWhile
		i = 30
		While (i < 30)
			If KnockoutSlots[i]
				Knockout(KnockoutSlots[i], Enter = False)
			Endif
			If KnockoutSlotsAliases[i].GetReference()
				Knockout((KnockoutSlotsAliases[i].GetReference() As Actor), Enter = False)
			Endif
			i += 1
		EndWhile
		Notification("$Defeat: Uninstalled")
		McmConfig.ModStatus = "$Disabled"
	Else
		MessageBox("$You are currently defeated, you need to wait for the scene to end or use Clean up function before you can disable this feature.")
	Endif
	Stop()
Endfunction

Function Install(Bool Reconfigure = False)
	If !Reconfigure
		Start()
		McmConfig.Install()
		McmConfig.ModStatus = "$Enabled"
	Endif
	
;String sResult = UILib.ShowTextInput("Title", "Initial message")
;Int iResult = UILib.ShowList("Title", sOptions, 0, 3) ;sOptions is an initialized string array
;UILib.ShowNotification("A message", "#FF3300")
;UILib.ShowNotificationIcon("Another message with an icon", "testicon.swf", 0, "#3399FF")
;Icons used by ShowNotificationIcon should be placed in /Skyrim/Data/Interface/Exported/ since the icon path parameter is relative to the aforementioned folder.

	SexLab = SexLabUtil.GetAPI()
	SexLabConfig = SexLabUtil.GetConfig()
	UILib = ((Self as Form) as UILIB_1)

	FadeToBlackHoldImod = (GetFormFromFile(0xF756E, "Skyrim.esm") As ImageSpaceModifier) ; FadeToBlackHoldImod
	FadeToBlackBackImod = (GetFormFromFile(0xF756F, "Skyrim.esm") As ImageSpaceModifier) ; FadeToBlackBackImod

	PlayerEssential = PlayerScr.GetOwningQuest().GetAliasByName("PlayerEssential") as ReferenceAlias

	If (TieUpSlots.length < 50)
		TieUpSlots = New Actor[50]
	Endif
	If (KnockoutSlots.length < 30)
		KnockoutSlots = New Actor[30]
	Endif

	MiscQuests = New Quest[9]
	MiscQuests[0] = (GetFormFromFile(0xD62, "SexLabDefeat.esp") As Quest)	; PlayerQST
	MiscQuests[1] = (GetFormFromFile(0xBD631, "SexLabDefeat.esp") As Quest)	; PAQst
	MiscQuests[2] = (GetFormFromFile(0x36014, "SexLabDefeat.esp") As Quest)	; PlayerActionQst
	MiscQuests[3] = (GetFormFromFile(0x6E968, "SexLabDefeat.esp") As Quest)	; NPCsQst
	MiscQuests[4] = (GetFormFromFile(0x6E96C, "SexLabDefeat.esp") As Quest)	; NPCsRefreshQst
	MiscQuests[5] = (GetFormFromFile(0xC16D7, "SexLabDefeat.esp") As Quest)	; Robber
	MiscQuests[6] = (GetFormFromFile(0x47AE6, "Skyrim.esm") As Quest)								; DGIntimidateQuest
	MiscQuests[7] = (GetFormFromFile(0x2BA16, "Skyrim.esm") As Quest)								; WerewolfQst
	MiscQuests[8] = None													; VampireLordQst
	MiscFormLists = New FormList[2]
	MiscFormLists[0] = (GetFormFromFile(0xDC642, "SexLabDefeat.esp") As FormList) 	; MiscStuff
	MiscFormLists[1] = (GetFormFromFile(0x11B22E, "SexLabDefeat.esp") As FormList) 	; DBBedList
;	MiscGlobals = New GlobalVariable[0]
	Killmoves = New Idle[14] ; Paired anims / Killmoves
	Killmoves[0] = (GetFormFromFile(0xED3DF, "SexLabDefeat.esp") As Idle) ; Defeat Sleeper 					PA
	Killmoves[1] = (GetFormFromFile(0xF465A, "Skyrim.esm") As Idle) ; BackStab 1H 							PA
	Killmoves[2] = (GetFormFromFile(0xF4679, "Skyrim.esm") As Idle) ; Slit throat 							PA
	Killmoves[3] = (GetFormFromFile(0x81E, "Update.esm") As Idle) ; BackStab 2H 							PA
	Killmoves[4] = (GetFormFromFile(0x815, "Update.esm") As Idle) ; Neck Break 								PA
	Killmoves[5] = (GetFormFromFile(0xF469E, "Skyrim.esm") As Idle) ; Bleedout kill 						PA
	Killmoves[6] = (GetFormFromFile(0xF469A, "Skyrim.esm") As Idle) ; ShortA Slash down high 				PA
	Killmoves[7] = (GetFormFromFile(0xF469B, "Skyrim.esm") As Idle) ; ShortB sword in belly					PA
	Killmoves[8] = (GetFormFromFile(0xF469C, "Skyrim.esm") As Idle) ; ShortC Quick slash 					PA
	Killmoves[9] = (GetFormFromFile(0xF469D, "Skyrim.esm") As Idle) ; ShortD Sword to throat 				PA
	Killmoves[10] = (GetFormFromFile(0xF9958, "Skyrim.esm") As Idle) ; Combo 3 punches						PA
	Killmoves[11] = (GetFormFromFile(0x108A45, "Skyrim.esm") As Idle) ; ShortJ Push ground stomp head 		PA
	Killmoves[12] = (GetFormFromFile(0x3131B30, "SexLabDefeat.esp") As Idle) ; DefeatPAvampfeedfront
	Killmoves[13] = (GetFormFromFile(0x3131B2F, "SexLabDefeat.esp") As Idle) ; DefeatPAvampfeedback
	MiscIdles = New Idle[2]
	MiscIdles[0] = (GetFormFromFile(0x13ECC, "Skyrim.esm") As Idle) 	; BleedoutStart
	MiscIdles[1] = (GetFormFromFile(0x13ECE, "Skyrim.esm") As Idle) 	; BleedoutStop
	TopicToSay = New Topic[22]
	TopicToSay[0] = (GetFormFromFile(0x13EBB, "Skyrim.esm") As Topic) ; Hit
	TopicToSay[1] = (GetFormFromFile(0x13EE3, "Skyrim.esm") As Topic) ; Attack
	TopicToSay[2] = (GetFormFromFile(0x13EE4, "Skyrim.esm") As Topic) ; Death
	TopicToSay[3] = (GetFormFromFile(0x13F30, "Skyrim.esm") As Topic) ; Flee
	TopicToSay[4] = (GetFormFromFile(0x2A459, "Skyrim.esm") As Topic) ; Assault
	TopicToSay[5] = (GetFormFromFile(0x46648, "Skyrim.esm") As Topic) ; Taunt
	TopicToSay[6] = (GetFormFromFile(0x3F500, "Skyrim.esm") As Topic) ; AcceptYield
	TopicToSay[7] = (GetFormFromFile(0x3F500, "Skyrim.esm") As Topic) ; MurderNC
	TopicToSay[8] = (GetFormFromFile(0x39B95, "Skyrim.esm") As Topic) ; BleedOut
	TopicToSay[9] = (GetFormFromFile(0x13EBA, "Skyrim.esm") As Topic) ; PowerAttack
	TopicToSay[10] = (GetFormFromFile(0x39C2C, "Skyrim.esm") As Topic) ; PickPocketNC
	TopicToSay[11] = (GetFormFromFile(0x2A45A, "Skyrim.esm") As Topic) ; PickPocketCombat				
	TopicToSay[12] = (GetFormFromFile(0x21405, "Skyrim.esm") As Topic) ; DialogueGenericPoisonCoughBranchTopic (Cough)
	TopicToSay[13] = (GetFormFromFile(0x2A45B, "Skyrim.esm") As Topic) ; Steal
	TopicToSay[14] = (GetFormFromFile(0x26EC9, "Skyrim.esm") As Topic) ; Follower Agree
	TopicToSay[15] = (GetFormFromFile(0x26EC3, "Skyrim.esm") As Topic) ; Follower Refuse
	TopicToSay[16] = (GetFormFromFile(0x26E7D, "Skyrim.esm") As Topic) ; Follower MoralRefusal
	TopicToSay[17] = (GetFormFromFile(0x31057DB, "SexLabDefeat.esp") As Topic)  ; Player victim commentaries
	TopicToSay[18] = (GetFormFromFile(0x31057DD, "SexLabDefeat.esp") As Topic)  ; Forgive
	TopicToSay[19] = (GetFormFromFile(0x311C7C2, "SexLabDefeat.esp") As Topic)  ; Witness comment
	TopicToSay[20] = (GetFormFromFile(0x3108301, "SexLabDefeat.esp") As Topic)  ; Can I join comment
	TopicToSay[21] = (GetFormFromFile(0x313BCE4, "SexLabDefeat.esp") As Topic)  ; CollateralComments
	SoundToPlay = New Sound[9]
	SoundToPlay[0] = (GetFormFromFile(0x1E68D, "Skyrim.esm") As Sound) ; Sand throwing			 AMBDustDropImpactSD
	SoundToPlay[1] = (GetFormFromFile(0x2A4A1, "Skyrim.esm") As Sound) ; Bow					 WPNBowFireSD
	SoundToPlay[2] = (GetFormFromFile(0x36515, "Skyrim.esm") As Sound) ; Bottle break		 	 MAGIcicleImpactBreak
	SoundToPlay[3] = (GetFormFromFile(0x53A60, "Skyrim.esm") As Sound) ; Telekinesis push		 MAGAlterationTelekinesisThrow
	SoundToPlay[4] = (GetFormFromFile(0x183FA, "Skyrim.esm") As Sound) ; Bash shield			 WPNBashShield
	SoundToPlay[5] = (GetFormFromFile(0x183F8, "Skyrim.esm") As Sound) ; Bash weapon			 WPNBashBlade
	SoundToPlay[6] = (GetFormFromFile(0x334A9, "Skyrim.esm") As Sound) ; Undress				 ITMClothingDown
	SoundToPlay[7] = (GetFormFromFile(0x22472, "Skyrim.esm") As Sound) ; Fail					 MAGFail
	SoundToPlay[8] = (GetFormFromFile(0x5228C, "Skyrim.esm") As Sound) ; Rescue (hit)			 NPCKillMelee
	ResistSpells = New Spell[10]
	ResistSpells[0] = (GetFormFromFile(0x55522, "SexLabDefeat.esp") As Spell) ; ResistArcherySpell
	ResistSpells[1] = (GetFormFromFile(0x55525, "SexLabDefeat.esp") As Spell) ; ResistDestructionFireSpell
	ResistSpells[2] = (GetFormFromFile(0x55534, "SexLabDefeat.esp") As Spell) ; ResistDestructionFrostSpell
	ResistSpells[3] = (GetFormFromFile(0x55537, "SexLabDefeat.esp") As Spell) ; ResistDestructionShockSpell
	ResistSpells[4] = (GetFormFromFile(0x5552B, "SexLabDefeat.esp") As Spell) ; ResistConjurationFireSpell
	ResistSpells[5] = (GetFormFromFile(0x5702C, "SexLabDefeat.esp") As Spell) ; ResistConjurationFrostSpell
	ResistSpells[6] = (GetFormFromFile(0x5702E, "SexLabDefeat.esp") As Spell) ; ResistConjurationShockSpell
	ResistSpells[7] = (GetFormFromFile(0x55531, "SexLabDefeat.esp") As Spell) ; ResistAlterationSpell
	ResistSpells[8] = (GetFormFromFile(0x55FFD, "SexLabDefeat.esp") As Spell) ; ResistSneakSpell
	ResistSpells[9] = (GetFormFromFile(0x55528, "SexLabDefeat.esp") As Spell) ; ResistAlchemySpell
	MiscReferences = New ObjectReference[5]
	MiscReferences[0] = (GetFormFromFile(0xE9336, "SexLabDefeat.esp") As ObjectReference)	; PosRef
	MiscReferences[1] = (GetFormFromFile(0x96F96, "SexLabDefeat.esp") As ObjectReference)	; NecroChest
	MiscReferences[2] = (GetFormFromFile(0x103CE6, "SexLabDefeat.esp") As ObjectReference)	; BurlapSackMarker
	MiscReferences[3] = (GetFormFromFile(0x105274, "SexLabDefeat.esp") As ObjectReference)	; BurlapSackWorldMarker
	MiscReferences[4] = None 																; BurlapSackWorldForm
	MiscMessages = New Message[4]
	MiscMessages[0] = (GetFormFromFile(0x6B8E5, "SexLabDefeat.esp") As Message)		; DefeatOptionMess
	MiscMessages[1] = (GetFormFromFile(0x11510A, "SexLabDefeat.esp") As Message)	; DefeatOptionCleanMess
	MiscMessages[2] = (GetFormFromFile(0x129F5D, "SexLabDefeat.esp") As Message)	; DefeatNVNAuto3WayFollowerMess
	MiscMessages[3] = (GetFormFromFile(0x12CFD0, "SexLabDefeat.esp") As Message)	; DefeatOptionToolsMess
	MiscVoicetypes = New VoiceType[4]
	MiscVoicetypes[0] = (GetFormFromFile(0x1F1CD, "Skyrim.esm") As VoiceType)	; DraugrV CrDraugrVoice
	MiscVoicetypes[1] = (GetFormFromFile(0x1F1D2, "Skyrim.esm") As VoiceType)	; FalmerV CrFalmerVoice
	MiscVoicetypes[2] = (GetFormFromFile(0x1F21D, "Skyrim.esm") As VoiceType)	; SpiderV CrFrostbiteSpiderVoice
	MiscVoicetypes[3] = None 							; Riekling
	HotKeyInts = New Int[4]
	HotKeyInts[0] = 11	; Option key
	HotKeyInts[1] = 42	; Modifier key
	HotKeyInts[2] = 34	; Action key
	HotKeyInts[3] = 37	; Surrender key
	DefeatFactions
	DefeatFactions = New Faction[3]
	DefeatFactions[0] = (GetFormFromFile(0x1D92, "SexLabDefeat.esp") As Faction)	; DefeatFaction
	DefeatFactions[1] = (GetFormFromFile(0x8C862, "SexLabDefeat.esp") As Faction) 	; AggFaction
	DefeatFactions[2] = None 														; ZadAnimatingFaction
	FollowerFactions = New Faction[2]
	FollowerFactions[0] = (GetFormFromFile(0x5C84E, "Skyrim.esm") As Faction) ; CurrentFollowerFaction
	FollowerFactions[1] = (GetFormFromFile(0xBD738, "Skyrim.esm") As Faction) ; CurrentHireling
	MiscSpells = New Spell[7]
	MiscSpells[0] = (GetFormFromFile(0x12C7, "SexLabDefeat.esp") As Spell)		; DebuffSPL
	MiscSpells[1] = (GetFormFromFile(0x1D90, "SexLabDefeat.esp") As Spell)		; DebuffConsSPL
	MiscSpells[2] = (GetFormFromFile(0x79F1D, "SexLabDefeat.esp") As Spell) 	; DebuffSpeedSPL
	MiscSpells[3] = (GetFormFromFile(0x6E96A, "SexLabDefeat.esp") As Spell)		; NVNAssautSPL
	MiscSpells[4] = (GetFormFromFile(0x107D99, "SexLabDefeat.esp") As Spell)	; SexCrimeSPL
	MiscSpells[5] = (GetFormFromFile(0xD44D0, "SexLabDefeat.esp") As Spell)		; ImmunitySPL
	MiscSpells[6] = (GetFormFromFile(0x3138C54, "SexLabDefeat.esp") As Spell)	; CollateralSafetySPL
	MiscMagicEffects = New MagicEffect[5]
	MiscMagicEffects[0] = (GetFormFromFile(0xD44CF, "SexLabDefeat.esp") As MagicEffect) ; ImmunityEFF
	MiscMagicEffects[1] = (GetFormFromFile(0x4DE88, "SexLabDefeat.esp") As MagicEffect) ; HKActionEFF
	MiscMagicEffects[2] = (GetFormFromFile(0x59B45, "SexLabDefeat.esp") As MagicEffect) ; HKFollowerActionEFF
	MiscMagicEffects[3] = (GetFormFromFile(0x107D97, "SexLabDefeat.esp") As MagicEffect) ; SexCrimeEFF
	MiscMagicEffects[4] = (GetFormFromFile(0x6E969, "SexLabDefeat.esp") As MagicEffect) ; NVNAssaultEFF
	MiscPackages = New Package[11]
	MiscPackages[0] = (GetFormFromFile(0xE9899, "SexLabDefeat.esp") As Package) ; DoNothing
	MiscPackages[1] = (GetFormFromFile(0x73575, "SexLabDefeat.esp") As Package) ; NVNAgressorPck01
	MiscPackages[2] = (GetFormFromFile(0x73AD8, "SexLabDefeat.esp") As Package) ; NVNAgressorPck02
	MiscPackages[3] = (GetFormFromFile(0x73ADC, "SexLabDefeat.esp") As Package) ; NVNAgressorPck03
	MiscPackages[4] = (GetFormFromFile(0x73ADD, "SexLabDefeat.esp") As Package) ; NVNAgressorPck04
	MiscPackages[5] = (GetFormFromFile(0x73ADE, "SexLabDefeat.esp") As Package) ; NVNAgressorPck05
	MiscPackages[6] = (GetFormFromFile(0x86C3E, "SexLabDefeat.esp") As Package) ; NVNAgressorPck06
	MiscPackages[7] = (GetFormFromFile(0x86C3F, "SexLabDefeat.esp") As Package) ; NVNAgressorPck07
	MiscPackages[8] = (GetFormFromFile(0x86C3B, "SexLabDefeat.esp") As Package) ; NVNAgressorPck08
	MiscPackages[9] = (GetFormFromFile(0x86C3C, "SexLabDefeat.esp") As Package) ; NVNAgressorPck09
	MiscPackages[10] = (GetFormFromFile(0x86C3D, "SexLabDefeat.esp") As Package) ; NVNAgressorPck10

	Gold = (GetFormFromFile(0x0F, "Skyrim.esm") As MiscObject) ; Gold
	DefeatEmptyOutfit = (GetFormFromFile(0x3148F4E, "SexLabDefeat.esp") As Outfit)
	PlayerMoan = (GetFormFromFile(0x3149F75, "SexLabDefeat.esp") As GlobalVariable)	

	; Sellout stuff v
	ArgonianRace = (GetFormFromFile(0x13740, "Skyrim.esm") As Race)
	BretonRace = (GetFormFromFile(0x13741, "Skyrim.esm") As Race)
	DarkElfRace = (GetFormFromFile(0x13742, "Skyrim.esm") As Race)
	HighElfRace = (GetFormFromFile(0x13743, "Skyrim.esm") As Race)
	ImperialRace = (GetFormFromFile(0x13744, "Skyrim.esm") As Race)
	KhajiitRace = (GetFormFromFile(0x13745, "Skyrim.esm") As Race)
	NordRace = (GetFormFromFile(0x13746, "Skyrim.esm") As Race)
	OrcRace = (GetFormFromFile(0x13747, "Skyrim.esm") As Race)
	WoodElfRace = (GetFormFromFile(0x13749, "Skyrim.esm") As Race)
	RedguardRace = (GetFormFromFile(0x13748, "Skyrim.esm") As Race)
	ElderRace = (GetFormFromFile(0x67CD8, "Skyrim.esm") As Race)

	CompanionFaction = (GetFormFromFile(0x48362, "Skyrim.esm") As Faction) ; Wants silverhands
	SilverHandFaction = (GetFormFromFile(0xAA0A4, "Skyrim.esm") As Faction)
	VigilantOfStendarrFaction = (GetFormFromFile(0xB3292, "Skyrim.esm") As Faction) ; Wants vampires
	VampireFaction = (GetFormFromFile(0x27242, "Skyrim.esm") As Faction)
	ThalmorFaction = (GetFormFromFile(0x39F26, "Skyrim.esm") As Faction) ; Wants CWImperialFaction
	CWImperialFaction = (GetFormFromFile(0x2BF9A, "Skyrim.esm") As Faction) ; Wants stormcloak

	SOLevel = (GetFormFromFile(0x3135674, "SexLabDefeat.esp") As GlobalVariable)
	SOUnique = (GetFormFromFile(0x3135672, "SexLabDefeat.esp") As GlobalVariable)
	SOPure = (GetFormFromFile(0x3135BD8, "SexLabDefeat.esp") As GlobalVariable)
	SORaceBonus = (GetFormFromFile(0x3136BFF, "SexLabDefeat.esp") As GlobalVariable)
	SOFactionBonus = (GetFormFromFile(0x3136C00, "SexLabDefeat.esp") As GlobalVariable)
	SOSexCombination = (GetFormFromFile(0x313C7B1, "SexLabDefeat.esp") As GlobalVariable)
	SOWitness = (GetFormFromFile(0x313C7B0, "SexLabDefeat.esp") As GlobalVariable)
	SORelation = (GetFormFromFile(0x31402FE, "SexLabDefeat.esp") As GlobalVariable)
	SOMorality = (GetFormFromFile(0x31402FF, "SexLabDefeat.esp") As GlobalVariable)
	SOAlreadyProstituedTo = (GetFormFromFile(0x3143E44, "SexLabDefeat.esp") As GlobalVariable) 

	SOValue = (GetFormFromFile(0x3135673, "SexLabDefeat.esp") As GlobalVariable)
	SOValuePimp = (GetFormFromFile(0x31376C9, "SexLabDefeat.esp") As GlobalVariable)
	SOValuePimp2 = (GetFormFromFile(0x314BFD3, "SexLabDefeat.esp") As GlobalVariable)
	SOValueGuard = (GetFormFromFile(0x31376CA, "SexLabDefeat.esp") As GlobalVariable)
	SOLastInSack = (MiscQuests[2].GetAliasByName("LastInSack") As ReferenceAlias)
	SOLastInSackAggressor = (MiscQuests[2].GetAliasByName("LastInSackAggressor") As ReferenceAlias)	; PlayerActionQst
	SOLastInSackTimer = (MiscQuests[2].GetAliasByName("LastInSackHandOverTimer") As ReferenceAlias) ; PlayerActionQst
	SOPlayerForceDialogue = (MiscQuests[2].GetAliasByName("PlayerForceDialogue") As ReferenceAlias) ; PlayerActionQst
	; Sellout stuff ^

	SetupCreatureFilter()

	CheckForMods()
;	If (McmConfig.OnOffPagg == "$Disabled")
		OnOffFeature("PlayerAgg", True)
;	Endif
;	If (McmConfig.OnOffPvic == "$Disabled")
		OnOffFeature("PlayerVic", True)
;	Endif
;	If (McmConfig.OnOffNVN == "$Disabled")
		OnOffFeature("", True)
;	Endif
	Maintenance()

	GoToState("")
	Notification("$Defeat: Installed")
Endfunction

Function OnOffFeature(String Feature, Bool On = False)
	If (McmConfig.ModStatus == "$Enabled")
		If (Feature == "PlayerAgg")
			If On
				OnOffPlayerAggressor = True
				MiscQuests[2].Start() ; PlayerActionQst
				McmConfig.OnOffPagg = "$Enabled"
				ActionQst.Install()
				ActionQst.Configure()
				If !OnOffPerk ; PerkOnOff
					Player.AddPerk(DefeatAssaultPRK)
					McmConfig.Addperk = "$Enabled"
					OnOffPerk = True
				Endif
			Else
				If (ActionQst.GetState() == "Carrying")
					Notification("$You need to empty your bag before you can disable this feature.")
				Else					
					ActionQst.GoToState("Inactive")
					ActionQst.UnregisterForAllKeys()
					MiscQuests[2].Stop() ; PlayerActionQst
					If OnOffPerk
						Player.RemovePerk(DefeatAssaultPRK)
						McmConfig.Addperk = "$Disabled"
						OnOffPerk = False
					Endif
					McmConfig.OnOffPagg = "$Disabled"
					OnOffPlayerAggressor = False
				Endif
			Endif
		Elseif (Feature == "PlayerVic")
			If On
				OnOffPlayerVictim = True
				MiscQuests[0].Start() ; Player quest
				MiscQuests[1].Start() ; PAQst
				McmConfig.OnOffPvic = "$Enabled"
				PlayerScr.Install()
				PlayerScr.Configure()
				PostAssaultscr.Install()
				PostAssaultscr.Configure()
				If (McmConfig.OnOffNVN == "$Disabled")
					Int i
					While (i < 5)
						PlayerSLMonitor[i].GoToState("PlayerVictim")
						i += 1
					EndWhile
				Else
					Int i
					While (i < 5)
						PlayerSLMonitor[i].GoToState("Inactive")
						i += 1
					EndWhile
				Endif
			Else
				If !Player.HasKeywordString("DefeatActive")
					PlayerScr.GoToState("Inactive")
					MiscQuests[0].Stop() ; Player quest
					MiscQuests[1].Stop() ; PAQst
					McmConfig.OnOffPvic = "$Disabled"
					OnOffPlayerVictim = False
				Else
					Notification("$You are currently defeated, you need to wait for the scene to end or use Clean up function before you can disable this feature.")
				Endif
			Endif
		Else
			If On
				OnOffNVN = True
				McmConfig.OnOffNVN = "$Enabled"
				MiscQuests[4].Start() ; NPCsRefreshQst
				NPCsRefreshQstScr.Refresh()
				If (McmConfig.OnOffPvic == "$Enabled")
					Int i
					While (i < 5)
						PlayerSLMonitor[i].GoToState("Inactive")
						i += 1
					EndWhile
				Endif
			Else
				If MiscQuests[4].IsRunning() ; NPCsRefreshQst
					MiscQuests[4].Stop() ; NPCsRefreshQst
				EndIf
				If MiscQuests[3].IsRunning() ; NPCsQst
					MiscQuests[3].Stop()
				Endif
				If (McmConfig.OnOffPvic == "$Enabled")
					Int i
					While (i < 5)
						PlayerSLMonitor[i].GoToState("PlayerVictim")
						i += 1
					EndWhile
				Endif
				McmConfig.OnOffNVN = "$Disabled"
				OnOffNVN = False
			Endif
		Endif
	Else
		Notification("$The mod is not installed.")
	Endif
EndFunction

Function Cleanup(String Type = "")
	If (Type == "")
		If (McmConfig.OnOffPvic == "$Enabled")
			PlayerScr.Clean()
		Endif
		If (McmConfig.OnOffPagg == "$Enabled")
			ActionQst.Clean()
			ActionQst.Hkrefresh()
		Endif
		Cell CurC = Player.GetParentCell()
		Actor NPCs		
		Int NumRefs = CurC.GetNumRefs(62)
		Form Gag = MiscFormLists[0].GetAt(1) ; MiscStuffList
		Form Cuffs = MiscFormLists[0].GetAt(2)
		Form Yoke = MiscFormLists[0].GetAt(3)
		Form Armbinder = MiscFormLists[0].GetAt(4)
		While (NumRefs > 0)
			NumRefs -= 1
			NPCs = (CurC.GetNthRef(NumRefs, 62) As Actor)
			If NPCs
				Log("NPC detected for cleaning - "+NPCs.GetActorBase().GetName())
				RemoveStates(NPCs, False)
				If !NPCs.IsInFaction(TieUpFaction)
					Calm(NPCs, Enter = False)
					Int i = MiscSpells.Length
					While (i > 0)
						i -= 1
						If NPCs.HasSpell(MiscSpells[i])
							NPCs.DispelSpell(MiscSpells[i])
						Endif
					EndWhile
					i = DefeatFactions.Length
					While (i > 0)
						i -= 1
						If NPCs.IsInFaction(DefeatFactions[i])
							NPCs.RemoveFromFaction(DefeatFactions[i])
						Endif
					EndWhile
					i = MiscPackages.Length
					While (i > 0)
						i -= 1
						ActorUtil.RemovePackageOverride(NPCs, MiscPackages[i])
					EndWhile
					ActorUtil.RemovePackageOverride(NPCs, DoNothing)
					ActorUtil.RemovePackageOverride(NPCs, EscapePack)
				Endif
				UnsetIntValue(NPCs, "DefeatSOReceiver")
				UnsetIntValue(NPCs, "DefeatSOProstituteReward")
			Endif
		EndWhile
		Int i = NVNOnHitScr.Length
		While (i > 0)
			i -= 1
			NVNOnHitScr[i].Configure()
		EndWhile
		i = NVNActionScr.Length
		While (i > 0)
			i -= 1
			NVNActionScr[i].Configure()
		EndWhile
		ActionQst.CrimeHandle(Player, true)
		HKActionTargetScr.Configure()
		If (Player.GetItemCount(MiscFormLists[0].GetAt(0) As Form) > 0) ; MiscStuff/Sack
			If (ActionQst.GetState() != "Carrying")
				ActionQst.GoToState("Carrying")
			Endif
		Endif
	Elseif (Type == "Clean tie up")
		Cell PlayerCell = Player.GetParentCell()
		Int i
		While (i < 50)
			If (TieUpSlots[i] && (TieUpSlots[i].GetParentCell() != PlayerCell))
				TieUp(TieUpSlots[i], Enter = False)
			Endif
			If (TieUpSlotsAliases[i].GetReference() && (TieUpSlotsAliases[i].GetReference() As Actor).GetParentCell() != PlayerCell)
				TieUp((TieUpSlotsAliases[i].GetReference() As Actor), Enter = False)
			Endif
			i += 1
		EndWhile
	Elseif (Type == "Clean knockout")
		Cell PlayerCell = Player.GetParentCell()
		Int i
		While (i < 30)
			If (KnockoutSlots[i] && (KnockoutSlots[i].GetParentCell() != Player.GetParentCell()))
				Knockout(KnockoutSlots[i], Enter = False)
			Endif
			If (KnockoutSlotsAliases[i].GetReference() && (KnockoutSlotsAliases[i].GetReference() As Actor).GetParentCell() != PlayerCell)
				Knockout((KnockoutSlotsAliases[i].GetReference() As Actor), Enter = False)
			Endif
			i += 1
		EndWhile
	Endif
	Notification("$Defeat Cleaned up")
EndFunction

Function Hkrefresh()
	UnregisterForAllKeys()
	RegisterForKey(HotKeyInts[0]) ; Option key
EndFunction


Event OnKeyDown(Int KeyCode)
	If (KeyCode == HotKeyInts[0]) ; Option key
		If !IsInMenuMode()
			Actor Target = (GetCurrentCrosshairRef() As Actor)
			If UIEon && Player.HasKeyWordString("SexLabActive")
				SLController(Player)
			Elseif Target && UIEon && Target.HasKeyWordString("SexLabActive")
				SLController(Target)

;/==============================================================
; ==============================================================
; ==============================================================
; ========================= Tests ==============================

			Elseif Input.IsKeyPressed(HotKeyInts[1]) ;Input.IsKeyPressed(46) ; C Input.IsKeyPressed(47) ; V ; Input.IsKeyPressed(48) ; B
				Actor Actor1 = ActionQst.CommandTarget.GetReference() as actor
				Actor Actor2 = ActionQst.CommandFollower.GetReference() as actor
				If Target
					UIListMenu ListMenu = UIExtensions.GetMenu("UIListMenu") as UIListMenu
					ListMenu.AddEntryItem("StartScene")
					ListMenu.AddEntryItem("StartScene knock out")
					ListMenu.AddEntryItem("StartScene auto resist")
					ListMenu.AddEntryItem("StartScene surrender")
					ListMenu.AddEntryItem("QuickStart SexLab")
					ListMenu.OpenMenu()
					Int Selected = ListMenu.GetResultInt()
					If (Selected != -1)
						If (Selected == 0)
							Actor[] StartSceneAggressors = new actor[1]
							StartSceneAggressors[0] = Target
							DefeatUtil.StartScene(StartSceneAggressors)
						Elseif (Selected == 1)
							Actor[] StartSceneAggressors = new actor[1]
							StartSceneAggressors[0] = Target
							DefeatUtil.StartScene(StartSceneAggressors, ForceKnockOut = True, ForceStayDown = 1, ForceResist = 0, ForceRelation = 1, ForceWitness = 0)
						Elseif (Selected == 2)
							Actor[] StartSceneAggressors = new actor[1]
							StartSceneAggressors[0] = Target
							DefeatUtil.StartScene(StartSceneAggressors, ForceAutoResist = True, ForceResist = 0, ForceRelation = 0)
						Elseif (Selected == 3)
							Actor[] StartSceneAggressors = new actor[1]
							StartSceneAggressors[0] = Target
							DefeatUtil.StartScene(StartSceneAggressors, ForceSurrender = True)
						Elseif (Selected == 4)
							SexLabUtil.QuickStart(Player, Target)
						Elseif (Selected == 5)

						Elseif (Selected == 6)

						Elseif (Selected == 7)

						Elseif (Selected == 8)

						Elseif (Selected == 9)

						Elseif (Selected == 10)

						Elseif (Selected == 11)

						Elseif (Selected == 12)

						Elseif (Selected == 13)

						Endif
					Endif
				Else
					UIListMenu ListMenu = UIExtensions.GetMenu("UIListMenu") as UIListMenu
					ListMenu.AddEntryItem("Update 5.3.5")
					ListMenu.AddEntryItem("10 hp")
					ListMenu.OpenMenu()
					Int Selected = ListMenu.GetResultInt()
					If (Selected != -1)
						If (Selected == 0)
							Update(69)
						Elseif (Selected == 1)
							Player.DamageActorValue("Health", (Player.GetActorValue("Health") - 10))
						Elseif (Selected == 2)
														
						Elseif (Selected == 3)

						Endif
					Endif
				Endif
; ========================= Tests ==============================
; ==============================================================
; ==============================================================
; ==============================================================		/;
			Else
				OptionMenu()
			Endif
		Endif
	Endif
EndEvent

Function OptionMenu()
	Int Button = 10
	Bool InMenu = True
	Message OptionMessage = MiscMessages[0] ; DefeatOptionMess
	While InMenu
		If (Button == 10)
			Button = OptionMessage.Show()
			If (Button == 1) ; Clean up menu
				Button = MiscMessages[1].Show() ; DefeatOptionCleanMess
				If (Button == 1)		; Clean up
					Cleanup()
				Elseif (Button == 2)	; Clean tie up
					Cleanup("Clean tie up")
				Elseif (Button == 3)	; Clean knockout
					Cleanup("Clean knockout")
				Else
					Button = 10
				Endif
			Elseif (Button == 2) ; Tools
				Button = MiscMessages[3].Show() ; DefeatOptionToolsMess
				If (Button == 1) ; TP to tieups
					If UIEon
						TeleportToTieup()
					Else
						Notification("$UIExtension mod is required for this to work. (Nexus 57046)")
					Endif
				Elseif (Button == 2) ; TP to knockouts
					If UIEon
						TeleportToKnockedOut()
					Else
						Notification("$UIExtension mod is required for this to work. (Nexus 57046)")
					Endif
				Elseif (Button == 3) ; Display Struggle Bar
					If !Player.HasKeyWordString("DefeatActive")
						DisplayBar()
					Else
						Notification("$You can't do this.")
					Endif
				Elseif (Button == 4) ; Market value
					Actor Target = (GetCurrentCrosshairRef() As Actor)
					If Target
						SOValue(Target, Player)
					Else
						SOValue(Player, Player)
					Endif
					SOValueDetails("All")
				Else
					Button = 10
				Endif
			Elseif (Button == 3) ; Enable Player Aggressor
				OnOffFeature("PlayerAgg", True)
			Elseif (Button == 4) ; Disable Player Aggressor
				OnOffFeature("PlayerAgg")
			Elseif (Button == 5) ; Enable Player Victim
				OnOffFeature("PlayerVic", True)
			Elseif (Button == 6) ; Disable Player Victim
				OnOffFeature("PlayerVic")
			Elseif (Button == 7) ; Enable NPC vs NPC
				OnOffFeature("", True)
			Elseif (Button == 8) ; Disable NPC vs NPC
				OnOffFeature("")
			Endif
		Else
			InMenu = False
		Endif
	EndWhile
EndFunction

Function TeleportToTieup()
	String[] TieUpList = New String[50]
	Int i
	While (i < 50)
		If TieUpSlots[i]
			TieUpList[i] = TieUpSlots[i].GetLeveledActorBase().GetName()
		Else
			TieUpList[i] = "$Empty"
		Endif
		i += 1
	EndWhile
	Int Result = UILIB.ShowList("$Clic on the NPC you want to teleport to", TieUpList, -1, -1)
	If (Result != -1)
		If TieUpSlots[Result]
			Player.Moveto(TieUpSlots[Result])
		Endif
	Endif
EndFunction
Function TeleportToKnockedOut()
	String[] KnockedOutList = New String[30]
	Int i
	While (i < 30)
		If KnockedOutList[i]
			KnockedOutList[i] = KnockoutSlots[i].GetLeveledActorBase().GetName()
		Else
			KnockedOutList[i] = "$Empty"
		Endif
		i += 1
	EndWhile
	Int Result = UILIB.ShowList("$Clic on the NPC you want to teleport to", KnockedOutList, -1, -1)
	If (Result != -1)
		If KnockoutSlots[Result]
			Player.Moveto(KnockoutSlots[Result])
		Endif
	Endif
EndFunction

Function SLController(Actor Target)
	sslThreadController Controller = SexLab.GetActorController(Target)
	If Input.IsKeyPressed(HotKeyInts[1]) ; Modifier key
		Int SlotStages = Controller.Animation.StageCount
		UIExtensions.InitMenu("UIListMenu")
		UIExtensions.SetMenuPropertyInt("UIListMenu", "totalEntries", SlotStages)
		Int i
		While (i < SlotStages)
			If (i == (Controller.Stage - 1))
				UIExtensions.SetMenuPropertyIndexString("UIListMenu", "entryName", i, ">>> Stage "+(i + 1))
				UIExtensions.SetMenuPropertyIndexInt("UIListMenu", "entryId", i, i)
			Else
				UIExtensions.SetMenuPropertyIndexString("UIListMenu", "entryName", i, "Stage "+(i + 1))
				UIExtensions.SetMenuPropertyIndexInt("UIListMenu", "entryId", i, i)
			Endif
			i += 1
		EndWhile
		UIExtensions.OpenMenu("UIListMenu")
		Int Result = UIExtensions.GetMenuResultInt("UIListMenu")
		If (Result != -1)
			Controller.GoToStage((Result + 1))
		Endif
	Else
		Int Anims = Controller.Animations.Length
		UIExtensions.InitMenu("UIListMenu")
		UIExtensions.SetMenuPropertyInt("UIListMenu", "totalEntries", Anims)
		Int i
		While (i < Anims)
			If (Controller.Animations[i].Name == Controller.Animation.Name)
				UIExtensions.SetMenuPropertyIndexString("UIListMenu", "entryName", i, ">>> "+Controller.Animations[i].Name)
				UIExtensions.SetMenuPropertyIndexInt("UIListMenu", "entryId", i, i)
			Else
				UIExtensions.SetMenuPropertyIndexString("UIListMenu", "entryName", i, Controller.Animations[i].Name)
				UIExtensions.SetMenuPropertyIndexInt("UIListMenu", "entryId", i, i)
			Endif
			i += 1
		EndWhile
		UIExtensions.OpenMenu("UIListMenu")
		Int Selected = UIExtensions.GetMenuResultInt("UIListMenu")
		If (Selected != -1)
			Controller.SetAnimation(Selected)
		Endif
	Endif
EndFunction

Actor[] Involved
Actor Property AWitness Auto Hidden
Event RapeScene(string EventName, string argString, Float argNum, form sender)
	Actor Victim = SexLab.HookVictim(argString)
;	Log("RapeScene - Victim -"+Victim+" / Victim.HasMagicEffectWithKeyword(DefeatActive) - "+Victim.HasMagicEffectWithKeyword(DefeatActive)+" / EventName - "+EventName+" / argString - "+argString)
	If (Victim && Victim.HasKeyWordString("DefeatActive"))
		Involved = SexLab.HookActors(argString)
		If (Involved.Find(Player) != -1)
			If ((Victim == Player) && McmConfig.WitnessPvic)
				Int i 
				While (i < Involved.Length)
					If (Involved[i] != Victim)
						MiscSpells[4].Cast(Involved[i], Victim) ; SexCrimeSPL
					Endif
					i += 1
				EndWhile
			Elseif ((Victim != Player) && McmConfig.WitnessPagg)
				Int i 
				While (i < Involved.Length)
					If (Involved[i] != Victim)
						MiscSpells[4].Cast(Involved[i], Victim) ; SexCrimeSPL
					Endif
					i += 1
				EndWhile
			Endif
		Elseif McmConfig.WitnessNVN
			Int i 
			While (i < Involved.Length)
				If (Involved[i] != Victim)
					MiscSpells[4].Cast(Involved[i], Victim) ; SexCrimeSPL
				Endif
				i += 1
			EndWhile
		Endif
	Endif
EndEvent
Event EndRapeScene(string EventName, string argString, Float argNum, form sender)
	Actor Victim = SexLab.HookVictim(argString)
	If (Victim && Victim.HasMagicEffect(MiscMagicEffects[3])) ; SexCrimeEFF
		Victim.DispelSpell(MiscSpells[4])
		AWitness = None
	Endif
EndEvent

Function DisplayBar()
	StruggleBar.Percent = 0.0
	StruggleBar.Alpha = 100.0
	Wait(5.0)
	StruggleBar.Percent = 0.0
	StruggleBar.Alpha = 0
EndFunction

Function CheckOutfitSlots()
	String[] SelectionMenu = New String[32]
	Int i
	Int n
	While (i < 32)
		Form Equipped = Player.GetWornForm(Armor.GetMaskForSlot(i + 30))
		If Equipped
			n = SelectionMenu.Find("")
			SelectionMenu[n] = Equipped.GetName()+" -> Slot "+(i + 30)+" "+McmConfig.SlotNames[i]
		Endif
		i += 1
	EndWhile
	UILIB.ShowList("", SelectionMenu, -1, -1)
;	Int i = 0
;	While (i < 32)
;		Form Equipped = Player.GetWornForm(Armor.GetMaskForSlot(i + 30))
;		If Equipped
;			Notification("Slot "+(i + 30)+" -> "+Equipped.GetName())
;		Endif
;		i += 1
;	EndWhile
EndFunction

; ===============================================================================||


Bool Function IsEnabled(String Feature = "")
	If (Feature == "Player as Aggressor")
		Return (McmConfig.OnOffPagg == "$Enabled")
	Elseif (Feature == "Player as Victim")
		Return (McmConfig.OnOffPvic == "$Enabled")
	Elseif (Feature == "NPC vs NPC")
		Return (McmConfig.OnOffNVN == "$Enabled")
	Else
		Return (McmConfig.ModStatus == "$Enabled")
	Endif
EndFunction

Function AddCalmList(Actor Aggressor = None, Actor Victim)
	If Aggressor
		Faction[] Factions = Aggressor.GetFactions(0, 100)
		Int i = Factions.Length
		While (i > 0)
			i -= 1
			Factions[i].SetAlly(DefeatFactions[0], True, True) ; DefeatFaction
		EndWhile
	EndIf
	Victim.StopCombatAlarm()
EndFunction

Bool Function IsFollower(Actor Target)
	Return (Target.IsInFaction(FollowerFactions[0]) || Target.IsInFaction(FollowerFactions[1]) || Target.isPlayerTeammate()) ; Current follower/hireling
EndFunction

Int Property HasBeenRapedBy Auto Hidden Conditional
Int Property FollowerHasBeenRapedBy Auto Hidden Conditional
Int Property NVNHasBeenRapedBy Auto Hidden Conditional

Actor[] Property LastSceneAggressors Auto Hidden
Actor[] Property LastSceneAccomplices Auto Hidden
Actor[] Property LastSceneFollowers Auto Hidden
Actor Property LastSceneTheLast Auto Hidden
Bool Property LastSceneRaped Auto Hidden Conditional
Bool Property LastSceneRobbed Auto Hidden Conditional
Int Property InSceneRapesHowManyBy Auto Hidden Conditional
Bool Property NoPostAssault Auto Hidden

FormList Property FacList Auto
String Property TheEvilFaction Auto Hidden Conditional
String Function IsEvilFaction(Actor Aggressor)
	String EvilFaction = ""
	Faction[] Factions = Aggressor.GetFactions(0, 100)
	Int i = Factions.Length
	While (i > 0)
		i -= 1
		If FacList.HasForm(Factions[i])
			Int Slot = FacList.Find(Factions[i])
			If (Slot == 0)
				EvilFaction = "Bandit"
			Elseif (Slot == 1)
				EvilFaction = "Forsworn"
			Elseif (Slot == 2)
				EvilFaction = "Silver Hand"
			Elseif (Slot == 3)
				EvilFaction = "Thalmor"
			Elseif (Slot == 4)
				EvilFaction = "Vampire"
			Elseif (Slot == 5)
				EvilFaction = "Warlock"
			Elseif (Slot == 6)
				EvilFaction = "Necromancer"
			Elseif (Slot == 7)
				EvilFaction = "Bloodkin"
			Else
				EvilFaction = "Evil"
			Endif
		Endif
	EndWhile
	If Aggressor.IsGuard()
		EvilFaction = "Guard"
	Endif
	Return EvilFaction
EndFunction

Bool Function IsSameFaction(Actor Target, Actor Aggressor)
	Faction[] AggressorFactions = Aggressor.GetFactions(0, 100)
	Faction[] TargetFactions = Target.GetFactions(0, 100)
	Int i = TargetFactions.Length
	While (i > 0)
		i -= 1
		If (AggressorFactions.Find(TargetFactions[i]) != -1)
;			Log("Target - "+Target+" / "+Target.GetLeveledActorBase().GetName()+" is same faction as "+Aggressor+" / "+Aggressor.GetLeveledActorBase().GetName())
			Return True
		Endif
	EndWhile
	Return False
EndFunction

Bool Function IsBadRelation(Actor Aggressor, Actor Victim, Bool PlayerVictim = True) ; Return True if Aggressor has a bad relationshop with Victim
	If PlayerVictim
		If ((TheEvilFaction != "") && (TheEvilFaction != "Guard"))
			Return True
;		Elseif (SARon && (DefeatUtil.DGetSLAroused().GetActorArousal(Aggressor) > 70.0))
;			Return True
		Elseif (McmConfig.MoralityPvic && ((Aggressor.GetActorValue("Morality") > 2) || (Aggressor.GetRelationshipRank(Victim) > 0)))
			Return False
		Endif
	Else
		String EvilFaction = IsEvilFaction(Aggressor)
		If ((EvilFaction != "") && (EvilFaction != "Guard"))
			Return True
;		Elseif (SARon && (DefeatUtil.DGetSLAroused().GetActorArousal(Aggressor) > 70.0))
;			Return True
		Elseif (McmConfig.MoralityNVN && ((Aggressor.GetActorValue("Morality") > 2) || (Aggressor.GetRelationshipRank(Victim) > 0)))
			Return False
		Endif
	Endif
	Return True
EndFunction

Int Function HowMany(String Option)
	Int i
	Int n
	If (Option == "Followers")
		While (i < 5)
			If LastSceneFollowers[i]
				n += 1
			Endif
			i += 1
		EndWhile
	Elseif (Option == "Accomplices")
		While (i < 5)
			If LastSceneAccomplices[i]
				n += 1
			Endif
			i += 1
		EndWhile
	Elseif (Option == "Aggressors")
		While (i < 5)
			If LastSceneAggressors[i]
				n += 1
			Endif
			i += 1
		EndWhile
	Elseif (Option == "Aggressors Male")
		While (i < 5)
			If LastSceneAggressors[i] && (SexLab.GetGender(LastSceneAggressors[i]) == 0)
				n += 1
			Endif
			i += 1
		EndWhile
	Elseif (Option == "Aggressors Female")
		While (i < 5)
			If LastSceneAggressors[i] && (SexLab.GetGender(LastSceneAggressors[i]) == 1)
				n += 1
			Endif
			i += 1
		EndWhile
	Elseif (Option == "Followers Male")
		While (i < 5)
			If LastSceneFollowers[i] && (SexLab.GetGender(LastSceneFollowers[i]) == 0)
				n += 1
			Endif
			i += 1
		EndWhile
	Elseif (Option == "Followers Female")
		While (i < 5)
			If LastSceneFollowers[i] && (SexLab.GetGender(LastSceneFollowers[i]) == 1)
				n += 1
			Endif
			i += 1
		EndWhile
	Endif
	Return n
EndFunction

Function GetStrippedItems(Actor Target) ; Get every items that have been stripped from the player and put them in actor a inventory. Need to be in the same cell as the dropped items
	PlayerScr.RecoverStuff(Target)
EndFunction

Int Function HasBeenRapedBy(Actor Victim, Actor Aggressor) ; Return the number of time the Victim has been raped by this Aggressor
	Return GetIntValue(Aggressor, "RapedBy"+Victim)
EndFunction

Bool Function IsArmed(Actor Target) ; Return True if the Target is armed
	Return (Target.GetEquippedWeapon() || Target.GetEquippedWeapon(True) || Target.GetEquippedShield())
EndFunction

Bool Function IsClothed(Actor Target, Bool IsPlayer = True) ; Return true if the target wears an armor
	Return Target.GetWornForm(0x00000004)
EndFunction

String[] RaceAllowedPvic
String[] RaceAllowedNVN
String[] RaceDisabledPvic
String[] RaceDisabledNVN
Function SetupCreatureFilter()
	String[] RaceKeyList = sslCreatureAnimationSlots.GetAllRaceKeys()
	Int RaceKeyLength = RaceKeyList.Length

	RaceAllowedPvic = CreateStringArray(RaceKeyLength + 1)
	RaceAllowedPvic[0] = "$-- Disable all --"
	Int i = 1
	While (i < RaceAllowedPvic.Length)
		Int Slot = RaceAllowedPvic.Find("")
		If (Slot != -1)
			RaceAllowedPvic[Slot] = RaceKeyList[i - 1]
		Endif
		i += 1
	EndWhile

	RaceAllowedNVN = CreateStringArray(RaceKeyLength + 1)
	RaceAllowedNVN[0] = "$-- Disable all --"
	i = 1
	While (i < RaceAllowedNVN.Length)
		Int Slot = RaceAllowedNVN.Find("")
		If (Slot != -1)
			RaceAllowedNVN[Slot] = RaceKeyList[i - 1]
		Endif
		i += 1
	EndWhile

	RaceDisabledPvic = CreateStringArray(RaceKeyLength + 1)
	RaceDisabledPvic[0] = "$-- Enable all --"

	RaceDisabledNVN = CreateStringArray(RaceKeyLength + 1)
	RaceDisabledNVN[0] = "$-- Enable all --"
EndFunction
Function RaceFilterDisable(String Feature = "Player")
	String[] RaceAllowedList
	String[] RaceDisabledList
	If (Feature == "Player")
		RaceAllowedList = RaceAllowedPvic
		RaceDisabledList = RaceDisabledPvic
	Elseif (Feature == "NVN")
		RaceAllowedList = RaceAllowedNVN
		RaceDisabledList = RaceDisabledNVN
	Endif
	Int Result = UILIB.ShowList("$Click on a race to add it into the list of disabled races", RaceDisabledList, -1, -1)
	If (Result != -1)
		If (Result == 0)
			Int i = 1
			While (i < RaceDisabledList.Length)
				Int Found = RaceAllowedList.Find(RaceDisabledList[i])
				If (Found == -1)
					Found = RaceAllowedList.Find("")
					RaceAllowedList[Found] = RaceDisabledList[i]
					RaceDisabledList[i] = ""
				Endif
				i += 1
			EndWhile
		Else
			Int Found = RaceAllowedList.Find(RaceDisabledList[Result])
			If (Found == -1)
				Found = RaceAllowedList.Find("")
				RaceAllowedList[Found] = RaceDisabledList[Result]
				RaceDisabledList[Result] = ""
				While (Result < RaceDisabledList.Length - 1)
					RaceDisabledList[Result] = RaceDisabledList[Result + 1]
					If (RaceDisabledList[Result] == RaceDisabledList[Result + 1])
						RaceDisabledList[Result + 1] = ""
					Endif
					Result += 1
				EndWhile
			Endif
		Endif
		If (Feature == "Player")
			RaceAllowedPvic = RaceAllowedList
			RaceDisabledPvic = RaceDisabledList
		Elseif (Feature == "NVN")
			RaceAllowedNVN = RaceAllowedList
			RaceDisabledNVN = RaceDisabledList
		Endif
	Endif
EndFunction

Function RaceFilterEnable(String Feature = "Player")
	String[] RaceAllowedList
	String[] RaceDisabledList
	If (Feature == "Player")
		RaceAllowedList = RaceAllowedPvic
		RaceDisabledList = RaceDisabledPvic
	Elseif (Feature == "NVN")
		RaceAllowedList = RaceAllowedNVN
		RaceDisabledList = RaceDisabledNVN
	Endif
	Int Result = UILIB.ShowList("$Click on a race to add it into the list of enabled races", RaceAllowedList, -1, -1)
	If (Result != -1)
		If (Result == 0)
			Int i = 1
			While (i < RaceAllowedList.Length)
				Int Found = RaceDisabledList.Find(RaceAllowedList[i])
				If (Found == -1)
					Found = RaceDisabledList.Find("")
					RaceDisabledList[Found] = RaceAllowedList[i]
					RaceAllowedList[i] = ""
				Endif
				i += 1
			EndWhile
		Else
			Int Found = RaceDisabledList.Find(RaceAllowedList[Result])
			If (Found == -1)
				Found = RaceDisabledList.Find("")
				RaceDisabledList[Found] = RaceAllowedList[Result]
				RaceAllowedList[Result] = ""
				While (Result < RaceAllowedList.Length - 1)
					RaceAllowedList[Result] = RaceAllowedList[Result + 1]
					If (RaceAllowedList[Result] == RaceAllowedList[Result + 1])
						RaceAllowedList[Result + 1] = ""
					Endif
					Result += 1
				EndWhile
			Endif
		Endif
		If (Feature == "Player")
			RaceAllowedPvic = RaceAllowedList
			RaceDisabledPvic = RaceDisabledList
		Elseif (Feature == "NVN")
			RaceAllowedNVN = RaceAllowedList
			RaceDisabledNVN = RaceDisabledList
		Endif
	Endif
EndFunction
Bool Function AllowedCreature(Actor Target, String Feature = "Player")
	String RaceKey = sslCreatureAnimationSlots.GetRaceKey(Target.GetLeveledActorBase().GetRace())
;	log("AllowedCreature - RaceKey - "+RaceKey)
	If (Feature == "Player")
		Return RaceAllowedPvic.Find(RaceKey) != -1
	Elseif (Feature == "NVN")
		Return RaceAllowedNVN.Find(RaceKey) != -1
	Endif
EndFunction

Bool Function IsSexualAssaulter(Actor Aggressor, Actor Victim, Bool PlayerVictim = False, Bool IsFollower = False) ; Check if the aggressor wants to rape their victim
	Return (SexInterest(Aggressor, PlayerVictim, IsFollower) && SexCombination(Aggressor, Victim, PlayerVictim))
EndFunction
Bool Function SexInterest(Actor Target, Bool PlayerVictim, Bool IsFollower)
	If IsSatisfied(Target)
		Return False
	Endif
	If PlayerVictim
		Return (RandomInt(1, 100) <= McmConfig.PvicRaped)
	Else
		If !IsFollower
			Return (RandomInt(1, 100) <= McmConfig.NVNRaped)
		Else
			Return (RandomInt(1, 100) <= McmConfig.NVNRapedFollower)
		Endif
	Endif
EndFunction
Bool Function SexCombination(Actor Aggressor, Actor Victim, Bool PlayerVictim)
;	Log("SexCombination - Victim - "+Victim+" / PlayerVictim - "+PlayerVictim+" / Aggressor.HasKeyWordString(ActorTypeCreature) - "+Aggressor.HasKeyWordString("ActorTypeCreature"))
	If PlayerVictim
		If Aggressor.HasKeyWordString("ActorTypeNPC")
			Bool AggressorFemale = (SexLab.GetGender(Aggressor) == 1)
			If !McmConfig.SexualityPvic
				Return ((McmConfig.MaleHunterPvic && !AggressorFemale) || (McmConfig.FemaleHunterPvic && AggressorFemale))
			Else
				SexLab.Stats.SeedActor(Aggressor) 			; Need to seed stats if needed before we check the sexuality
				Bool VictimFemale = (SexLab.GetGender(Victim) == 1)
				If (!AggressorFemale && VictimFemale) 		; Male on Female
					Return (McmConfig.MaleHunterPvic && SexLab.IsStraight(Aggressor) || SexLab.IsBisexual(Aggressor))
				Elseif (AggressorFemale && VictimFemale) 	; Female on Female
					Return (McmConfig.FemaleHunterPvic && SexLab.IsGay(Aggressor) || SexLab.IsBisexual(Aggressor))
				Elseif (AggressorFemale && !VictimFemale) 	; Female on Male
					Return (McmConfig.FemaleHunterPvic && SexLab.IsStraight(Aggressor) || SexLab.IsBisexual(Aggressor))
				Elseif (!AggressorFemale && !VictimFemale) 	; Male on Male
					Return (McmConfig.MaleHunterPvic && SexLab.IsGay(Aggressor) || SexLab.IsBisexual(Aggressor))
				Endif
			Endif
		Else;if Aggressor.HasKeyWordString("ActorTypeCreature")
;			log("Check the creature -> (Aggressor.GetFlyingState() < 1) - "+(Aggressor.GetFlyingState() < 1)+" / SexLab.GetGender(Aggressor) - "+SexLab.GetGender(Aggressor)+" / AllowedCreature(Aggressor) - "+AllowedCreature(Aggressor)+ " /  SexLab.AllowedCreature(Aggressor.GetLeveledActorBase().GetRace()) - "+ SexLab.AllowedCreature(Aggressor.GetLeveledActorBase().GetRace()))
			If (Aggressor.GetFlyingState() < 1)
				If (AllowedCreature(Aggressor) && SexLab.AllowedCreature(Aggressor.GetLeveledActorBase().GetRace()))
					If !SexLabConfig.UseCreatureGender
						Return True
					Else
						Int Gender = SexLab.GetGender(Aggressor) ; 3 - Female creatures, returns 2 male if SexLabConfig.UseCreatureGender is disabled
						If (Gender == 2) && McmConfig.HuntCrea
							Return True
						Elseif (Gender == 3) && McmConfig.HuntFCrea
							Return True
						Endif
					Endif
				Endif
			Endif
		Endif
	Else
		Bool VictimFemale = (SexLab.GetGender(Victim) == 1)
		If Aggressor.HasKeyWordString("ActorTypeNPC")
			Bool AggressorFemale = (SexLab.GetGender(Aggressor) == 1)
			If !McmConfig.SexualityNVN
				Return ((McmConfig.MaleOnGal && VictimFemale && !AggressorFemale) || (McmConfig.GalOnGal && VictimFemale && AggressorFemale) || (McmConfig.MaleOnMale && !VictimFemale && !AggressorFemale) || (McmConfig.GalOnMale && !VictimFemale && AggressorFemale))
			Else
				SexLab.Stats.SeedActor(Aggressor)			; Need to seed stats if needed before we check the sexuality
				If (!AggressorFemale && VictimFemale) 		; Male on Female
					Return (McmConfig.MaleOnGal && (SexLab.IsStraight(Aggressor) || SexLab.IsBisexual(Aggressor)))
				Elseif (AggressorFemale && VictimFemale) 	; Female on Female
					Return (McmConfig.GalOnGal && (SexLab.IsGay(Aggressor) || SexLab.IsBisexual(Aggressor)))
				Elseif (AggressorFemale && !VictimFemale) 	; Female on Male
					Return (McmConfig.GalOnMale && (SexLab.IsStraight(Aggressor) || SexLab.IsBisexual(Aggressor)))
				Elseif (!AggressorFemale && !VictimFemale) 	; Male on Male
					Return (McmConfig.MaleOnMale && (SexLab.IsGay(Aggressor) || SexLab.IsBisexual(Aggressor)))
				Endif
			Endif
		Else;if Aggressor.HasKeyWordString("ActorTypeCreature")
			If (Aggressor.GetFlyingState() < 1)
				If AllowedCreature(Aggressor, "NVN") && SexLab.AllowedCreature(Aggressor.GetLeveledActorBase().GetRace())
					If !SexLabConfig.UseCreatureGender
						Return True
					Else
						Bool AggressorFemale = (SexLab.GetGender(Aggressor) == 3)
						If McmConfig.CreaOnFemale && VictimFemale && !AggressorFemale
							Return True
						Elseif McmConfig.CreaOnMale && !VictimFemale && !AggressorFemale
							Return True
						Elseif McmConfig.CreaFemaleOnFemale && VictimFemale && AggressorFemale
							Return True
						Elseif McmConfig.CreaFemaleOnMale && !VictimFemale && AggressorFemale
							Return True
						Endif
					Endif
				Endif 
			Endif
			If (Aggressor.GetFlyingState() < 1)
				If ((VictimFemale && McmConfig.CreaOnFemale) || (!VictimFemale && McmConfig.CreaOnMale))
					Return SexLab.AllowedCreature(Aggressor.GetLeveledActorBase().GetRace())
				Endif 
			Endif
		Endif
	Endif
	Return False
EndFunction

Function StartRobbingScene(Actor Victim, Actor Aggressor, String RobWay = "", Float Value = -1.0)
	;/ Launch a scene where actor Aggressor will perform a rob on Victim actor.
	RobWay - Will determine what the aggressor will rob, valid values are "Value", "Gold" and "Gold & Items".
	Value - Everything above it will be robbed by the aggressor.
	If no values are specified default MCM settings will applies. /;
	If !MiscQuests[5].IsRunning()
		NoPostAssault = True
		PlayerScr.StartRobbingScene(Victim, Aggressor, RobWay, Value)
	Endif
EndFunction

; =================================================== SURRENDER Functions
Int Property QSTStage Auto Hidden Conditional
Bool Property IsThereWitness Auto Hidden Conditional			; Is there a witness?
Bool Property IsThereSexAggressor Auto Hidden Conditional		; Is there a potential sexual aggressor in the group?
Bool Property IsThereCollateralVictim Auto Hidden Conditional	; Is there a potential follower sexual victim in the group?
Bool Property Armed Auto Hidden Conditional						; Has the player a weapon of any kind in their hand?
Bool Property Clothed Auto Hidden Conditional					; Is the player naked?
Bool Property FollowerClothed Auto Hidden Conditional			; Is the follower naked?
Bool Property BadRelation Auto Hidden Conditional				; Is the aggressor has a bad relation with the player?
Bool Property AllowedFaction Auto Hidden Conditional			; Is the aggressor amoung one of the evil factions?
Bool Property WasAnEnemy Auto Hidden Conditional				; Is the aggressor was an enemy of the player?
GlobalVariable Property BribeAmount Auto
Bool Property WantGold Auto Hidden Conditional
Int Property HowManyPartners Auto Hidden Conditional
Int Property HowManyAggressors Auto Hidden Conditional
Int Property HowManyAggressorsMale Auto Hidden Conditional
Int Property HowManyAggressorsFemale Auto Hidden Conditional
Int Property HowManyPartnersMale Auto Hidden Conditional
Int Property HowManyPartnersFemale Auto Hidden Conditional
Function SurrenderData(Actor Victim, Actor Aggressor)
;	Log("Get dialogue data begin "+GetCurrentRealTime())
	LastSceneAggressors = PlayerScr.GetAggressors()
	LastSceneAccomplices = PlayerScr.GetAccomplices()
	LastSceneFollowers = PlayerScr.GetFollowers()
	WantGold = False
	BribeAmount.SetValue(Aggressor.GetBribeAmount())
	Armed = IsArmed(Victim)
	Clothed = IsClothed(Victim)
	FollowerClothed = IsClothed(Victim)
	AllowedFaction = (IsEvilFaction(Aggressor) != "")
	BadRelation = IsBadRelation(Aggressor, Victim)
	IsThereWitness = PlayerScr.GetWitness()
	HasBeenRapedBy = HasBeenRapedBy(Victim, Aggressor)
	HowManyAggressors = HowMany("Aggressors")
	PlayerScr.NumAgg = HowManyAggressors
	HowManyPartners = HowMany("Followers")
	Actor SexAggressor
	SexAggressor = IsSexualTension(Aggressor, Victim, True)
	If SexAggressor
		PlayerScr.AliasTheNext.ForceRefTo(SexAggressor)
		IsThereSexAggressor = True
	Else
		PlayerScr.AliasTheNext.Clear()
		IsThereSexAggressor = False
	Endif
;	PlayerScr.SetSexualAssault(IsThereSexAggressor)
	SexAggressor = IsSexualTension(Aggressor, None, False)
	If SexAggressor
		PlayerScr.CollaAgg[0].ForceRefTo(Aggressor)
		PlayerScr.CollaVic[0].ForceRefTo(SexAggressor)
		FollowerClothed = IsClothed(PlayerScr.CollaVic[0].GetReference() As Actor)
		IsThereCollateralVictim = True
	Else
		PlayerScr.CollaAgg[0].Clear()
		PlayerScr.CollaVic[0].Clear()
		IsThereCollateralVictim = False
	Endif
;/	Log("SURRENDER IsThereSexAggressor - "+IsThereSexAggressor)
	If IsThereSexAggressor
		Log("SURRENDER AliasTheNext alias - "+(PlayerScr.AliasTheNext.Getreference() As Actor).GetLeveledActorBase().GetName())
	Endif
	Log("SURRENDER IsThereCollateralVictim - "+IsThereCollateralVictim)
	If IsThereCollateralVictim
		Log("SURRENDER CollaVic alias - "+(PlayerScr.CollaVic[0].Getreference() As Actor).GetLeveledActorBase().GetName()+" // CollaAgg - "+(PlayerScr.CollaAgg[0]Getreference() As Actor).GetLeveledActorBase().GetName())
	Endif
	Log("SURRENDER BribeAmount - "+BribeAmount.Value)
	Log("SURRENDER IsThereWitness - "+IsThereWitness)
	Log("SURRENDER Armed - "+Armed)
	Log("SURRENDER Clothed - "+Clothed)
	Log("SURRENDER FollowerClothed - "+FollowerClothed)
	Log("SURRENDER BadRelation - "+BadRelation)
	Log("SURRENDER AllowedFaction - "+AllowedFaction+" / TheEvilFaction - "+TheEvilFaction)
	Log("SURRENDER WasAnEnemy - "+WasAnEnemy)
	Log("SURRENDER HowManyAggressors - "+HowManyAggressors)
	Log("SURRENDER HowManyPartners - "+HowManyPartners)
	Log("SURRENDER HasBeenRapedBy - "+HasBeenRapedBy)
	Log("SURRENDER Get dialogue data ends "+GetCurrentRealTime())/;
EndFunction
Actor Function IsSexualTension(Actor Aggressor, Actor Victim = None, Bool PlayerVictim) ; SURRENDER Is there at least one aggressor that want to sexual assault?
	Int i
	If PlayerVictim
		While (i < 5)
			If LastSceneAggressors[i]
				If IsSexualAssaulter(LastSceneAggressors[i], Player, PlayerVictim)
					Return LastSceneAggressors[i]
				Endif
			Endif
			i += 1
		EndWhile
	Else
		While (i < 5)
			If LastSceneFollowers[i]
				If IsSexualAssaulter(Aggressor, LastSceneFollowers[i], PlayerVictim)
					Return LastSceneFollowers[i]
				Endif
			Endif
			i += 1
		EndWhile
	Endif
	Return None
EndFunction

; =================================================== YIELD functions
Bool Property YieldIsClothed Auto Hidden Conditional
Bool Property YieldBadRelation Auto Hidden Conditional
Int Property YieldHasBeenRapedBy Auto Hidden Conditional
Function YieldData(Actor Aggressor, Actor Victim)
	YieldIsClothed = IsClothed(Victim, False)
	YieldHasBeenRapedBy = HasBeenRapedBy(Victim, Aggressor)
	YieldBadRelation = IsBadRelation(Aggressor, Victim, False)
;	Log("YIELD YieldHasBeenRapedBy - "+YieldHasBeenRapedBy)
;	Log("YIELD YieldIsClothed - "+YieldIsClothed)
;	Log("YIELD YieldBadRelation - "+YieldBadRelation)
EndFunction

; =================================================== STATES
Float Property StateDuration Auto Hidden
Actor Property Perpetrator Auto Hidden

Spell Property CalmSPL Auto							; 
Spell Property TrueCalmSPL Auto						; Calm
Faction Property CalmFaction Auto					;
Spell Property SatisfiedSPL Auto					; Satisfied
Spell Property KnockDownSPL Auto					; Knockdown
Spell Property TraumaSPL Auto						; Trauma
Spell Property ExhaustedSPL Auto					; Exhausted
Spell Property SurrenderSPL Auto					; Surrender
Spell Property YieldSPL Auto						; Yield
Spell Property EscapeSPL Auto						; Escape
Package Property EscapePack Auto					;
Faction Property TieUpFaction Auto 					; Tie up
Actor[] TieUpSlots 									;
ReferenceAlias[] Property TieUpSlotsAliases Auto 	;
Faction Property GaggedFaction Auto 				;
Bool Property TiedPermanent Auto Hidden Conditional ;
Faction Property KnockoutFaction Auto 				; Knockout
Actor[] KnockoutSlots 								;
ReferenceAlias[] Property KnockoutSlotsAliases Auto ;

Function SetEmptyOutfit(Actor Target)
	ActorBase TargetActorBase = Target.GetActorBase()
	Outfit CurrentOutfit = TargetActorBase.GetOutfit()
	If CurrentOutfit && (CurrentOutfit != DefeatEmptyOutfit)
		SetFormValue(Target, "DefeatVictimOutfit", (CurrentOutfit as form))
		TargetActorBase.SetOutfit(DefeatEmptyOutfit)
	Endif
	CurrentOutfit = TargetActorBase.GetOutfit(True)
	If CurrentOutfit && (CurrentOutfit != DefeatEmptyOutfit)
		SetFormValue(Target, "DefeatVictimOutfitSleep", (CurrentOutfit as form))
		TargetActorBase.SetOutfit(DefeatEmptyOutfit, True)
	Endif
EndFunction
Function SetOldOutfit(Actor Target)
	ActorBase TargetActorBase = Target.GetActorBase()
	Outfit CurrentOutfit = TargetActorBase.GetOutfit() 
	If CurrentOutfit && (CurrentOutfit == DefeatEmptyOutfit)
		Outfit OldOutfit = (GetFormValue(Target, "DefeatVictimOutfit") As Outfit)
		If OldOutfit
			TargetActorBase.SetOutfit(OldOutfit)
		Endif
		UnsetFormValue(Target, "DefeatVictimOutfit")
	Endif
	CurrentOutfit = TargetActorBase.GetOutfit(True)
	If CurrentOutfit && (CurrentOutfit == DefeatEmptyOutfit)
		Outfit OldOutfit = (GetFormValue(Target, "DefeatVictimOutfitSleep") As Outfit)
		If OldOutfit
			TargetActorBase.SetOutfit(OldOutfit, True)
		Endif
		UnsetFormValue(Target, "DefeatVictimOutfitSleep")
	Endif	
EndFunction
Function StayStill(Actor Target, Bool OnOff = True)
	If OnOff
		ObjectReference SimpleMarker = Target.PlaceAtMe(GetFormFromFile(0x12FE7, "Skyrim.esm"))
		Target.SetVehicle(SimpleMarker)
		SetFormValue(Target, "DefeatSimpleMarker", SimpleMarker)
	Else
		ObjectReference SimpleMarker = GetFormValue(Target, "DefeatSimpleMarker") as ObjectReference
		UnsetFormValue(Target, "DefeatSimpleMarker")
		SimpleMarker.Delete()
	Endif
EndFunction
String Function VictimState(Actor Target) 
	; Return the state the target is currently in as a string.
	If Target.IsDead()
		Return "Dead"
	Elseif Target.HasKeyWordString("SexLabActive")
		Return "Sex"
	Elseif Target.IsBleedingOut()
		Return "Bleedout"
	Elseif (Target.GetSleepState() == 3)
		Return "Sleeping"
	Elseif Target.IsInFaction(TieUpFaction)
		Return "Tied"		
	Else
		Return GetStringValue(Target, "DefeatState")
	Endif
EndFunction

Bool Function Tied(Actor Target) ; Check if the Target is tied
	If Zazon
		Return (Target.WornHasKeyword(Keyword.GetKeyword("zbfWornWrist")) || Target.WornHasKeyword(Keyword.GetKeyword("DefeatWornDevice")))
	Else
		Return False
	Endif
EndFunction
DefeatStateMonitoringScr Function GetTiedSlot(actor Target)
	return (TieUpSlotsAliases[Target.GetFactionRank(TieUpFaction)] As DefeatStateMonitoringScr)
EndFunction
DefeatStateMonitoringScr Function GetKnockoutSlot(actor Target)
	return (KnockoutSlotsAliases[Target.GetFactionRank(KnockoutFaction)] As DefeatStateMonitoringScr)
EndFunction

Function RemoveStates(Actor Target, Bool NoCalm = True)
	Knockdown(Target, UnCalm = NoCalm, Enter = False)
	Trauma(Target, UnCalm = NoCalm, Enter = False)
	Exhausted(Target, UnCalm = NoCalm, Enter = False)
	Surrender(Target, UnCalm = NoCalm, Enter = False)
	Yield(Target, UnCalm = NoCalm, Enter = False)
	Escape(Target, UnCalm = NoCalm, Enter = False)
EndFunction

Bool Function Calm(Actor Target, Bool StayPut = True, Bool Enter = True)
	If Enter
		If !Target.IsInFaction(CalmFaction)
			Target.AddSpell(TrueCalmSPL)
			Target.AddToFaction(CalmFaction)
			Target.StopCombat()
			Target.StopCombatAlarm()
			If StayPut
				ActorUtil.AddPackageOverride(Target, DoNothing, 100, 1)
				Target.EvaluatePackage()
			Endif
			Return True
		Else
			Target.StopCombatAlarm()
		Endif
	Else
		If Target.HasSpell(TrueCalmSPL)
			Target.RemoveFromFaction(CalmFaction)
			If StayPut
				ActorUtil.RemovePackageOverride(Target, DoNothing)
				Target.EvaluatePackage()
			Endif
			Target.RemoveSpell(TrueCalmSPL)
			Return True
		Endif
	Endif
	Return False
EndFunction

Bool Function SetSatisfied(Actor Target = None, Float Duration = 0.0, String Type = "", Bool Satisfied = True)
	If Satisfied
		If Target
			If !IsSatisfied(Target)
				If (Duration > 0.0)
					StateDuration = Duration
				Else
					If (Type == "Player Victim")
						StateDuration = McmConfig.SatisfiedPvic
					Elseif (Type == "Follower")
						StateDuration = McmConfig.SatisfiedFollower
					Elseif (Type == "NPC")
						StateDuration = McmConfig.SatisfiedNVN
					Endif
				Endif
				Target.AddSpell(SatisfiedSPL)
				Return True
			Endif
		Endif
	Else
		If Target
			If IsSatisfied(Target)
				Target.RemoveSpell(SatisfiedSPL)
			Endif
			Return True
		Endif
	Endif
	Return False
EndFunction
Function CastImmune(Actor Target)
	If Target.Is3DLoaded()
		MiscSpells[5].Cast(Target, Target) ; ImmunitySPL
	Endif
EndFunction
Bool Function IsImmune(Actor Target)
	Return Target.HasMagicEffect(MiscMagicEffects[0]) ; ImmunityEFF
EndFunction
Bool Function IsSatisfied(Actor Target)
	Return Target.HasSpell(SatisfiedSPL)
EndFunction

Bool Function Knockdown(Actor Target, Actor Aggressor = None, Float Duration = 0.0, String Type = "", Bool UnCalm = True, Bool IsBleedout = False, Bool Enter = True) 
	; Stun a target during a MCM setting amount of time or the specified duration, the victim get back up if Stun is False.
	If Enter
		If !Target.HasSpell(KnockDownSPL)
			Trauma(Target, UnCalm = False, Enter = False)
			TieUp(Target, UnCalm = False, Enter = False)
			Exhausted(Target, UnCalm = False, Enter = False)
			Surrender(Target, UnCalm = False, Enter = False)
			Escape(Target, UnCalm = False, Enter = False)
			Calm(Target)
;			StayStill(Target)
;			Target.SetRestrained()
;			Target.SetDontMove()
			If (Duration > 0.0)
				StateDuration = Duration
			Else
				If (Type == "Player Aggressor")
					StateDuration = McmConfig.KDTimePagg
				Elseif (Type == "Follower")
					StateDuration = McmConfig.KDTimeNVN
				Elseif (Type == "NPC")
					StateDuration = McmConfig.KDTimeNVN
				Endif
			Endif
			Perpetrator = Aggressor
			SetStringValue(Target, "DefeatState", "Knockdown")
			SetStringValue(Target, "DefeatType", Type)
			Target.AddSpell(KnockDownSPL)
			If !IsBleedout
				DefeatPlayAnimation(Target, "Bleedout")
			Else
				Target.SetNoBleedoutRecovery(True)
			Endif
			Return True
		Elseif Target.HasSpell(KnockDownSPL)
			SendAnimationEvent(Target, GetStringValue(Target, "DefeatStateAnim"))
		Endif
	Else
		If Target.HasSpell(KnockDownSPL)
			If UnCalm
				DefeatPlayAnimation(Target, "Stand")
				Calm(Target, Enter = False)
			Endif
;			StayStill(Target, False)
;			Target.SetRestrained(False)
;			Target.SetDontMove(False)
			UnsetStringValue(Target, "DefeatState")
			UnSetStringValue(Target, "DefeatType")
			Target.SetNoBleedoutRecovery(False)
			Target.RemoveSpell(KnockDownSPL)
			If Target.Is3DLoaded()
				If !IsImmune(Target)
					CastImmune(Target)
				Endif
			Endif
			Return True
		Endif
	Endif
	Return False
EndFunction

Bool Function Trauma(Actor Target, Actor Aggressor = None, Float Duration = 0.0, String Type = "", Bool UnCalm = True, Bool Enter = True)
	; Make a NPC enters in a trauma state, if the duration is not specified the default NPC vs NPC mcm value will applies.
	If Enter
		If !Target.HasSpell(TraumaSPL)
			Knockdown(Target, UnCalm = False, Enter = False)
			TieUp(Target, UnCalm = False, Enter = False)
			Exhausted(Target, UnCalm = False, Enter = False)
			Surrender(Target, UnCalm = False, Enter = False)
			Escape(Target, UnCalm = False, Enter = False)
			Calm(Target)
;			StayStill(Target)
;			Target.SetRestrained()
;			Target.SetDontMove()
			If (Duration > 0.0)
				StateDuration = Duration
			Else
				If (Type == "Follower")
					StateDuration = McmConfig.NVNTraumaCvic
				Elseif (Type == "Player Aggressor")
					StateDuration = McmConfig.TraumaPagg
				Elseif (Type == "NPC")
					StateDuration = McmConfig.NVNTrauma
				Endif
			Endif
			Perpetrator = Aggressor
			SetStringValue(Target, "DefeatState", "Trauma")
			SetStringValue(Target, "DefeatType", Type)
			SetStringValue(Target, "DefeatStateAnim", "IdleWounded_03")
			Target.AddSpell(TraumaSPL)
			Target.EvaluatePackage()
			DefeatPlayAnimation(Target, "Trauma Lie")
			Return True
		Elseif Target.HasSpell(TraumaSPL)
			SendAnimationEvent(Target, GetStringValue(Target, "DefeatStateAnim"))
		Endif
	Else
		If Target.HasSpell(TraumaSPL)
			UnsetStringValue(Target, "DefeatStateAnim")
			If UnCalm
				DefeatPlayAnimation(Target, "Trauma Stand")
				Calm(Target, Enter = False)
			Endif
;			StayStill(Target, False)
;			Target.SetRestrained(False)
;			Target.SetDontMove(False)
			UnsetStringValue(Target, "DefeatState")
			UnSetStringValue(Target, "DefeatType")
			Target.RemoveSpell(TraumaSPL)
			Return True
		Endif
	Endif
	Return False
EndFunction

Bool Function Exhausted(Actor Target, Actor Aggressor = None, Float Duration = 0.0, String Type = "", Bool UnCalm = True, Bool Enter = True)
	; Make a NPC enters in a exhausted state, if the duration is not specified the default NPC vs NPC mcm value will applies.
	If Enter
		If !Target.HasSpell(ExhaustedSPL)
			Knockdown(Target, UnCalm = False, Enter = False)
			TieUp(Target, UnCalm = False, Enter = False)
			Trauma(Target, UnCalm = False, Enter = False)
			Surrender(Target, UnCalm = False, Enter = False)
			Escape(Target, UnCalm = False, Enter = False)
			Calm(Target)
;			StayStill(Target)
;			Target.SetRestrained()
;			Target.SetDontMove()
			If (Duration > 0.0)
				StateDuration = Duration
			Else
				If (Type == "Follower")
					StateDuration = McmConfig.NVNExhaustedCvic
				Elseif (Type == "Player Aggressor")
					StateDuration = McmConfig.ExhaustedPagg
				Elseif (Type == "NPC")
					StateDuration = McmConfig.NVNExhausted
				Endif
			Endif
			Perpetrator = Aggressor
			SetStringValue(Target, "DefeatState", "Exhausted")
			SetStringValue(Target, "DefeatType", Type)
			Target.AddSpell(ExhaustedSPL)
			DefeatPlayAnimation(Target, "Exhausted Lie")
			Return True
		Elseif Target.HasSpell(ExhaustedSPL)
			SendAnimationEvent(Target, GetStringValue(Target, "DefeatStateAnim"))
		Endif
	Else
		If Target.HasSpell(ExhaustedSPL)
			UnsetStringValue(Target, "DefeatStateAnim")
			If UnCalm
				DefeatPlayAnimation(Target, "Stand")
				Calm(Target, Enter = False)
			Endif
;			StayStill(Target, False)
;			Target.SetRestrained(False)
;			Target.SetDontMove(False)
			UnsetStringValue(Target, "DefeatState")
			UnSetStringValue(Target, "DefeatType")
			Target.RemoveSpell(ExhaustedSPL)
			Return True
		Endif
	Endif
	Return False
EndFunction

Bool Function Surrender(Actor Target, Actor Aggressor = None, Bool UnCalm = True, Bool Enter = True) 
	If Enter
		If !Target.HasSpell(SurrenderSPL)
			Calm(Target)
			Perpetrator = Aggressor
			Target.AddSpell(SurrenderSPL)
			DefeatPlayAnimation(Target, "Surrender")
			SetStringValue(Target, "DefeatState", "Surrender")
			Return True
		Elseif Target.HasSpell(SurrenderSPL)
			DefeatPlayAnimation(Target, "Surrender")
		Endif
	Else
		If Target.HasSpell(SurrenderSPL)
			If UnCalm
				Calm(Target, Enter = False)
			Endif
			UnsetStringValue(Target, "DefeatState")
			Target.RemoveSpell(SurrenderSPL)
			If Target.Is3DLoaded()
				If !IsImmune(Target)
					CastImmune(Target)
				Endif
			Endif
			Return True
		Endif
	Endif
	Return False
EndFunction

Bool Function Yield(Actor Target, Actor Aggressor = None, Bool UnCalm = True, Bool Enter = True) 
	; Make the target yield until the player leave his line of sight.
	If Enter
		If !Target.HasSpell(YieldSPL)
			Calm(Target)
			Perpetrator = Aggressor
			Target.AddSpell(YieldSPL)
			DefeatPlayAnimation(Target, "Surrender")
			SetStringValue(Target, "DefeatState", "Yield")
			YieldData(Aggressor, Target)
			Return True
		Elseif Target.HasSpell(YieldSPL)
			DefeatPlayAnimation(Target, "Surrender")
		Endif
	Else
		If Target.HasSpell(YieldSPL)
			If Target.IsInDialogueWithPlayer()
				DisablePlayerControls()
				EnablePlayerControls()
			Endif
			If UnCalm
			;	DefeatPlayAnimation(Target, "Stand")
				Calm(Target, Enter = False)
			Endif
			UnsetStringValue(Target, "DefeatState")
			Target.RemoveSpell(YieldSPL)
			If Target.Is3DLoaded()
				If !IsImmune(Target)
					CastImmune(Target)
				Endif
			Endif
			Return True
		Endif
	Endif
	Return False
EndFunction

Bool Function Escape(Actor Target, Actor EscapeFrom = None, Float Duration = 0.0, String Type = "", Bool UnCalm = True, Bool Enter = True)
	; Make the Target flee for the MCM duration
	If Enter
		If !Target.HasSpell(EscapeSPL)
			Calm(Target)
			If (Duration > 0.0)
				StateDuration = Duration
			Else
				If (Type == "Follower")
					StateDuration = McmConfig.EscapeCvic
				Elseif (Type == "Player Aggressor")
					StateDuration = McmConfig.EscapePagg
				Elseif (Type == "NPC")
					StateDuration = McmConfig.EscapeNPC
				Endif
			Endif
			SetStringValue(Target, "DefeatState", "Escape")
			SetStringValue(Target, "DefeatType", Type)
			Perpetrator = EscapeFrom
			ActorUtil.AddPackageOverride(Target, EscapePack, 100, 1)
			Target.AddSpell(EscapeSPL)
			Return True
		Elseif Target.HasSpell(EscapeSPL)
			Target.EvaluatePackage()
		Endif
	Else
		If Target.HasSpell(EscapeSPL)
			If UnCalm
				Calm(Target, Enter = False)
			Endif
			UnsetStringValue(Target, "DefeatState")
			UnSetStringValue(Target, "DefeatType")
			ActorUtil.RemovePackageOverride(Target, EscapePack)
			Target.EvaluatePackage()
			Target.RemoveSpell(EscapeSPL)
			Return True
		Endif
	Endif
	Return False
EndFunction


Bool Function TieUp(Actor Target, Actor Aggressor = None, Float Duration = 0.0, Bool DoAnimation = False, Bool UnCalm = True, Bool Enter = True)
	;/ Tie up a NPC, the duration can be specified, if not it will use the MCM setting
	the tying up animation can be disabled to make it instant, if so the aggressor need to be specified as well
	or this will be ignored. Untie the Target if Tied is False, do nothing if the Target isn't tied./;
	If Enter
		If !Target.IsInFaction(TieUpFaction)
			Int i = TieUpSlots.Find(None)
			If (i != -1)
				TieUpSlots[i] = Target
				TieUpSlotsAliases[i].ForceRefIfEmpty(Target)
				RemoveStates(Target, False)
				Calm(Target)
;				StayStill(Target)
;				Target.SetRestrained()
;				Target.SetDontMove()
				If (Duration > 0.0)
					StateDuration = Duration
				Else
					StateDuration = McmConfig.TiedTime
				Endif
				Perpetrator = Aggressor
				SetStringValue(Target, "DefeatState", "Tied")
				Target.SetFactionRank(TieUpFaction, i)
				If (DoAnimation && Aggressor)
					SendAnimationEvent(Aggressor, "DefeatTyingUpAnim")
					Wait(3.0)
				Endif
				(TieUpSlotsAliases[i] As DefeatStateMonitoringScr).Enter(Target)
				Log("NPC "+Target.GetActorBase().GetName()+" / Slot "+Target.GetFactionRank(TieUpFaction)+" Enters in a tie up state // TieUpSlots - "+TieUpSlots)
			Else
				Notification("$No more slots available for tie up")
			Endif
			Return True
		Elseif Target.IsInFaction(TieUpFaction)
			Calm(Target)
		Endif
	Else
		If Target.IsInFaction(TieUpFaction)
			If (DoAnimation && Aggressor)
				SendAnimationEvent(Aggressor, "BoundStandingCutNPC")
				wait(1.0)
			Endif
			Int i = Target.GetFactionRank(TieUpFaction)
			TieUpSlots[i] = None
			(TieUpSlotsAliases[i] As DefeatStateMonitoringScr).RegisterAnimEvent(False)
			TieUpSlotsAliases[i].Clear()
			Form Gag = MiscFormLists[0].GetAt(1) ; MiscStuffList/Gag
			If (Target.GetItemCount(Gag) > 0)
				Target.RemoveItem(Gag)
			Endif
			If Target.IsInFaction(GaggedFaction)
				Target.RemoveFromFaction(GaggedFaction)
			Endif
			Int LimitLoop = 5
			Form Cuffs = MiscFormLists[0].GetAt(2) ; MiscStuffList/Cuffs
			While ((Target.GetItemCount(Cuffs) > 0) && (LimitLoop > 0))
				Target.RemoveItem(Cuffs)
				LimitLoop -= 1
			EndWhile
			LimitLoop = 5
			Form Yoke = MiscFormLists[0].GetAt(3) ; MiscStuffList/Yoke
			While ((Target.GetItemCount(Yoke) > 0) && (LimitLoop > 0))
				Target.RemoveItem(Yoke)
				LimitLoop -= 1
			EndWhile
			LimitLoop = 5
			Form Armbinder = MiscFormLists[0].GetAt(4) ; MiscStuffList/Armbinder
			While ((Target.GetItemCount(Armbinder) > 0) && (LimitLoop > 0))
				Target.RemoveItem(Armbinder)
				LimitLoop -= 1
			EndWhile		
;			Form WearedItem = Target.GetWornForm(0x00004000)
;			If (WearedItem && WearedItem.HasKeyWordString("DefeatWornGag"))
;				Target.RemoveFromFaction(GaggedFaction)
;				Target.RemoveItem(WearedItem)
;			Endif
;			WearedItem = Target.GetWornForm(0x20000000)
;			If (WearedItem && WearedItem.HasKeyWordString("DefeatWornDevice"))
;				Target.RemoveItem(WearedItem)
;			Endif
			If UnCalm
				DefeatPlayAnimation(Target, "Untie")
				Calm(Target, Enter = False)
			Endif
;			StayStill(Target, False)
;			Target.SetRestrained(False)
;			Target.SetDontMove(False)
			UnsetStringValue(Target, "DefeatState")
			UnsetStringValue(Target, "DefeatStateAnim")
			Log("NPC "+Target.GetActorBase().GetName()+" / Slot "+i+" Exit of a tie up state // TieUpSlots - "+TieUpSlots)
			Target.RemoveFromFaction(TieUpFaction)
			SetOldOutfit(Target)
			Return True
		Endif
	Endif
	Return False
EndFunction

Bool Function Knockout(Actor Target, Actor Aggressor = None, Float Duration = 0.0, Bool UnCalm = True, Bool Enter = True)
	; knock uncnonscious the target, do nothing if the target is already unconscious
	If Enter
		If (!Target.IsInFaction(KnockoutFaction))
			Int i = KnockoutSlots.Find(None)
			If (i != -1)
				RemoveStates(Target, False)
				TieUp(Target, UnCalm = False, Enter = False)
				Calm(Target)
				If (Duration > 0.0)
					StateDuration = Duration
				Else
					StateDuration = McmConfig.KOTime
				Endif
				Perpetrator = Aggressor
				SetStringValue(Target, "DefeatState", "Knockout")
				KnockoutSlots[i] = Target
				KnockoutSlotsAliases[i].ForceRefIfEmpty(Target)
				(KnockoutSlotsAliases[i] As DefeatStateMonitoringScr).Enter(Target)
				Target.SetFactionRank(KnockoutFaction, i)
				Target.ModActorValue("Paralysis", 1)
				If !Target.IsUnconscious()
					Target.SetUnconscious()
					Target.PushActorAway(Target, 0.0001)
				Endif
				Log("NPC "+Target.GetActorBase().GetName()+" / Slot "+Target.GetFactionRank(KnockoutFaction)+" enters knock out // KnockoutSlots - "+KnockoutSlots)
				Return True
			Else
				Notification("$No more slots available for knock out")
			Endif
		Else
			Calm(Target)
			If !Target.IsUnconscious()
				Target.SetUnconscious()
			Endif
		Endif
	Else
		If (Target.IsInFaction(KnockoutFaction) || Target.IsUnconscious())
			Int i = Target.GetFactionRank(KnockoutFaction)
			KnockoutSlots[i] = None
			(KnockoutSlotsAliases[i] As DefeatStateMonitoringScr).RegisterAnimEvent(False)
			KnockoutSlotsAliases[i].Clear()
			Log("NPC "+Target.GetActorBase().GetName()+" / Slot "+i+" exit knock out // KnockoutSlots - "+KnockoutSlots)
			Target.RemoveFromFaction(KnockoutFaction)
			Target.ForceActorValue("Paralysis", 0)
			Target.Setunconscious(False)
			Target.QueueNiNodeUpdate()
			UnsetStringValue(Target, "DefeatState")
			If UnCalm
				Calm(Target, Enter = False)
			Endif
			SetOldOutfit(Target)
			Return True
		Endif
	Endif
	Return False
EndFunction

Function Weakenings(Actor Target, String Type = "", Float Duration = 0.0, Bool RemoveSpl = False)
	; To apply weakenings effect on the target.
	If !RemoveSpl
		If (Type == "Player Victim")
			If (Duration == 0.0)
				StateDuration = McmConfig.DebuffDuration
			Endif
		Elseif (Type == "Player Aggressor")
			If (Duration == 0.0)
				StateDuration = McmConfig.DebuffDurationPagg
			Endif
			If McmConfig.VicAnimosity
				Target.SetRelationshipRank(Player, -4)
			Endif
		Elseif (Type == "NPC")
			If (Duration == 0.0)
				StateDuration = McmConfig.DebuffDurationNVN
			Endif
		Elseif (Type == "Follower")
			If (Duration == 0.0)
				StateDuration = McmConfig.DebuffDurationNVNCvic
			Endif
		Else
			If (Duration == 0.0)
				StateDuration = McmConfig.DebuffDurationNVN
			Endif
		Endif
		If !Target.HasSpell(MiscSpells[0]) ; Debuffspl
			Target.AddSpell(MiscSpells[0], False)
		Endif
	Else
		If Target.HasSpell(MiscSpells[0])
			Target.RemoveSpell(MiscSpells[0])
		Endif
	Endif
EndFunction

Function DefeatMoan(Actor Speaker, Actor Target, String Comment, Bool ballow = True)
	If ballow
		If (Comment == "Flee")
			Speaker.Say(TopicToSay[3], Target) ; Flee
		Elseif (Comment == "Bleedout")
			Speaker.Say(TopicToSay[8], Target) ; Bleedout
		Elseif (Comment == "Death")
			Speaker.Say(TopicToSay[2], Target) ; Death
		Elseif (Comment == "Forgive")
			Speaker.Say(TopicToSay[18], Target) ; Forgive topic
		Elseif (Comment == "Comment")
			Speaker.Say(TopicToSay[17], Target) ; Comment topic
		Elseif (Comment == "Witness")
			Speaker.Say(TopicToSay[19], Target) ; Witness comment
		Endif
	Endif
;/	TopicToSay[0] = (GetForm(0x13EBB) As Topic) ; Hit
	TopicToSay[1] = (GetForm(0x13EE3) As Topic) ; Attack
	TopicToSay[2] = (GetForm(0x13EE4) As Topic) ; Death
	TopicToSay[3] = (GetForm(0x13F30) As Topic) ; Flee
	TopicToSay[4] = (GetForm(0x2A459) As Topic) ; Assault
	TopicToSay[5] = (GetForm(0x46648) As Topic) ; Taunt
	TopicToSay[6] = (GetForm(0x3F500) As Topic) ; AcceptYield
	TopicToSay[7] = (GetForm(0x3F500) As Topic) ; MurderNC
	TopicToSay[8] = (GetForm(0x39B95) As Topic) ; BleedOut
	TopicToSay[9] = (GetForm(0x13EBA) As Topic) ; PowerAttack
	TopicToSay[10] = (GetForm(0x39C2C) As Topic) ; PickPocketNC
	TopicToSay[11] = (GetForm(0x2A45A) As Topic) ; PickPocketCombat				
	TopicToSay[12] = (GetForm(0x21405) As Topic) ; DialogueGenericPoisonCoughBranchTopic (Cough)
	TopicToSay[13] = (GetForm(0x2A45B) As Topic) ; Steal
	TopicToSay[14] = (GetForm(0x26EC9) As Topic) ; Follower Agree
	TopicToSay[15] = (GetForm(0x26EC3) As Topic) ; Follower Refuse
	TopicToSay[16] = (GetForm(0x26E7D) As Topic) ; Follower MoralRefusal
	TopicToSay[17] = (GetFormFromFile(0x31057DB, "SexLabDefeat.esp") As Topic)  ; Player victim commentaries
	TopicToSay[18] = (GetFormFromFile(0x31057DD, "SexLabDefeat.esp") As Topic)  ; Forgive
	TopicToSay[19] = (GetFormFromFile(0x311C7C2, "SexLabDefeat.esp") As Topic)  ; Witness comment
	TopicToSay[20] = (GetFormFromFile(0x3108301, "SexLabDefeat.esp") As Topic)  ; Can I join comment/;
EndFunction

Function DefeatPlayAnimation(Actor Target, String AnimType) ; Play an animation depending of the situation of the player.
	If (!Target.IsDead() && Target.Is3DLoaded())
		If (AnimType == "Bleedout")
			Form Links = Target.GetWornForm(0x20000000)
			If (Links && Zazon)
				If Links.HasKeyWordString("zbfAnimHandsArmbinder")
					If DDon
						If Target.IsInFaction(DefeatFactions[2])
							Target.RemoveFromFaction(DefeatFactions[2])
						Endif
					Endif
					SendAnimationEvent(Target, "ZapArmbBleedoutIdle")
				Elseif Links.HasKeyWordString("zbfAnimHandsYoke")
					SendAnimationEvent(Target, "ZapYokeBleedoutIdle")
				Elseif Links.HasKeyWordString("zbfAnimHandsWrists")
					SendAnimationEvent(Target, "ZapWriBleedoutIdle")
				Else
					SendAnimationEvent(Target, "BleedoutStart")
				Endif
			Else
				SendAnimationEvent(Target, "BleedoutStart")
			Endif
		Elseif (AnimType == "Surrender")
			Form Links = Target.GetWornForm(0x20000000)
			If (Links && Zazon)
				If Links.HasKeyWordString("zbfAnimHandsArmbinder")
					If DDon
						If Target.IsInFaction(DefeatFactions[2])
							Target.RemoveFromFaction(DefeatFactions[2])
						Endif
					Endif
					SendAnimationEvent(Target, "ZapArmbPose06")
				Elseif Links.HasKeyWordString("zbfAnimHandsYoke")
					SendAnimationEvent(Target, "ZapYokePose06")
				Elseif Links.HasKeyWordString("zbfAnimHandsWrists")
					SendAnimationEvent(Target, "ZapWriPose06")
				Endif
			Else
				SendAnimationEvent(Target, "IdleSurrender")
			Endif
		Elseif (AnimType == "Submission")
			Form Links = Target.GetWornForm(0x20000000)
			If (Links && Zazon)
				If Links.HasKeyWordString("zbfAnimHandsArmbinder")
					If DDon
						If Target.IsInFaction(DefeatFactions[2])
							Target.RemoveFromFaction(DefeatFactions[2])
						Endif
					Endif
					SendAnimationEvent(Target, "ZapArmbPose06")
				Elseif Links.HasKeyWordString("zbfAnimHandsYoke")
					SendAnimationEvent(Target, "ZapYokePose06")
				Elseif Links.HasKeyWordString("zbfAnimHandsWrists")
					SendAnimationEvent(Target, "ZapWriPose06")
				Endif
			Else
				SendAnimationEvent(Target, "DefeatAllFour")
			Endif
		Elseif (AnimType == "Sit")
			Form Links = Target.GetWornForm(0x20000000)
			If (Links && Zazon)
				If Links.HasKeyWordString("zbfAnimHandsArmbinder")
					SendAnimationEvent(Target, "ZapArmbPose07")
				Elseif Links.HasKeyWordString("zbfAnimHandsYoke")
					SendAnimationEvent(Target, "ZapYokePose07")
				Elseif Links.HasKeyWordString("zbfAnimHandsWrists")
					SendAnimationEvent(Target, "ZapWriPose07")
				Endif
			Else
				SendAnimationEvent(Target, "IdleWounded_03") 	; Vanilla injured sit stance
			Endif
		Elseif (AnimType == "Lie")
			Form Links = Target.GetWornForm(0x20000000)
			If (Links && Zazon)
				If Links.HasKeyWordString("zbfAnimHandsArmbinder")
					SetStringValue(Target, "DefeatStateAnim", "ZapArmbPose14")
					SendAnimationEvent(Target, "ZapArmbPose14")
				Elseif Links.HasKeyWordString("zbfAnimHandsYoke")
					SetStringValue(Target, "DefeatStateAnim", "ZapYokePose15")
					SendAnimationEvent(Target, "ZapYokePose15")
				Elseif Links.HasKeyWordString("zbfAnimHandsWrists")
					SetStringValue(Target, "DefeatStateAnim", "ZapWriPose14")
					SendAnimationEvent(Target, "ZapWriPose14")
				Endif
			Else
				Int i = RandomInt(0, 2)
				If (i == 0)
					SetStringValue(Target, "DefeatStateAnim", "DefeatEstrusExhaustedBack")
					SendAnimationEvent(Target, "DefeatEstrusExhaustedBack")
				Elseif (i == 1)
					SetStringValue(Target, "DefeatStateAnim", "DefeatEstrusExhaustedFront")
					SendAnimationEvent(Target, "DefeatEstrusExhaustedFront")
				Else
					SetStringValue(Target, "DefeatStateAnim", "IdleWounded_02")
					SendAnimationEvent(Target, "IdleWounded_02") ; Vanilla injured lying down stance
				Endif
			Endif
		Elseif (AnimType == "Trauma Lie")
			Form Links = Target.GetWornForm(0x20000000)
			If (Links && Zazon)
				If Links.HasKeyWordString("zbfAnimHandsArmbinder")
					SetStringValue(Target, "DefeatStateAnim", "ZapArmbPose14")
					SendAnimationEvent(Target, "ZapArmbPose14")
				Elseif Links.HasKeyWordString("zbfAnimHandsYoke")
					SetStringValue(Target, "DefeatStateAnim", "ZapYokePose15")
					SendAnimationEvent(Target, "ZapYokePose15")
				Elseif Links.HasKeyWordString("zbfAnimHandsWrists")
					SetStringValue(Target, "DefeatStateAnim", "ZapWriPose14")
					SendAnimationEvent(Target, "ZapWriPose14")
				Endif
			Else
				Int i = RandomInt(0, 1)
;				If (i == 0)
;					SetStringValue(Target, "DefeatStateAnim", "DefeatEstrusTrauma")
;					SendAnimationEvent(Target, "DefeatEstrusTrauma")
				If (i == 1)
					SetStringValue(Target, "DefeatStateAnim", "DefeatTraumaEnter")
					SendAnimationEvent(Target, "DefeatTraumaEnter")
				Else
					SetStringValue(Target, "DefeatStateAnim", "IdleWounded_02")
					SendAnimationEvent(Target, "IdleWounded_02") 
				Endif
			Endif
		Elseif (AnimType == "Unconscious")
			Int i = RandomInt(0, 3)
			If (i == 0)
				SetStringValue(Target, "DefeatStateAnim", "Defeat_FB_Sleep_Front_1")
				SendAnimationEvent(Target, "Defeat_FB_Sleep_Front_1")
			Elseif (i == 1)
				SetStringValue(Target, "DefeatStateAnim", "Defeat_FB_Sleep_Front_2")
				SendAnimationEvent(Target, "Defeat_FB_Sleep_Front_2")
			Elseif (i == 2)
				SetStringValue(Target, "DefeatStateAnim", "Defeat_FB_Sleep_Back_1")
				SendAnimationEvent(Target, "Defeat_FB_Sleep_Back_1")
			Else
				SetStringValue(Target, "DefeatStateAnim", "Defeat_FB_Sleep_Back_2")
				SendAnimationEvent(Target, "Defeat_FB_Sleep_Back_2") 
			Endif
		Elseif (AnimType == "Trauma Stand")
			Form Links = Target.GetWornForm(0x20000000)
			If (Links && Zazon)
				If Links.HasKeyWordString("zbfAnimHandsArmbinder")
					If DDon
						Target.AddToFaction(DefeatFactions[2])
					Endif
					SendAnimationEvent(Target, "ZazAPOA005")
				Elseif Links.HasKeyWordString("zbfAnimHandsYoke")
					SendAnimationEvent(Target, "ZazAPOA007")
				Elseif Links.HasKeyWordString("zbfAnimHandsWrists")
					SendAnimationEvent(Target, "ZazAPOA001")
				Endif
			Else
				SendAnimationEvent(Target, "DefeatTraumaExit")
			Endif
		Elseif (AnimType == "Exhausted Lie")
			Form Links = Target.GetWornForm(0x20000000)
			If (Links && Zazon)
				If Links.HasKeyWordString("zbfAnimHandsArmbinder")
					SetStringValue(Target, "DefeatStateAnim", "ZapArmbPose14")
					SendAnimationEvent(Target, "ZapArmbPose14")
				Elseif Links.HasKeyWordString("zbfAnimHandsYoke")
					SetStringValue(Target, "DefeatStateAnim", "ZapYokePose15")
					SendAnimationEvent(Target, "ZapYokePose15")
				Elseif Links.HasKeyWordString("zbfAnimHandsWrists")
					SetStringValue(Target, "DefeatStateAnim", "ZapWriPose14")
					SendAnimationEvent(Target, "ZapWriPose14")
				Endif
			Else
				If (RandomInt(0, 1) == 0)
					SetStringValue(Target, "DefeatStateAnim", "DefeatEstrusExhaustedBack")
					SendAnimationEvent(Target, "DefeatEstrusExhaustedBack")
				Else
					SetStringValue(Target, "DefeatStateAnim", "DefeatEstrusExhaustedFront")
					SendAnimationEvent(Target, "DefeatEstrusExhaustedFront")
				Endif
			Endif
		Elseif (AnimType == "Stand")
			Form Links = Target.GetWornForm(0x20000000)
			If (Links && Zazon)
				If Links.HasKeyWordString("zbfAnimHandsArmbinder")
					If DDon
						Target.AddToFaction(DefeatFactions[2])
					Endif
					SendAnimationEvent(Target, "ZazAPOA005")
				Elseif Links.HasKeyWordString("zbfAnimHandsYoke")
					SendAnimationEvent(Target, "ZazAPOA007")
				Elseif Links.HasKeyWordString("zbfAnimHandsWrists")
					SendAnimationEvent(Target, "ZazAPOA001")
				Endif
			Else
				If Target.GetAnimationVariableBool("IsBleedingOut")
					SendAnimationEvent(Target, "BleedoutStop")
				Else
					SendAnimationEvent(Target, "DefeatWounded02Exit") ; Fast Get up from vanilla IdleWounded_02 anim
				Endif
				CoverSelf(Target)
			Endif
		Elseif (AnimType == "Untie")
			SendAnimationEvent(Target, "DefeatTieUpExit")
		Endif
	Endif
EndFunction

Function CoverSelf(Actor Target)
	If (!Target.GetWornForm(0x00000004) && !Tied(Target))
		If ((Target == Player) && !McmConfig.CoverSelfPvic)
			Return
		Else
			Wait(1.0)
			If (Target.GetLeveledActorBase().GetSex() == 1)
				SendAnimationEvent(Target, "DefeatZaZCoverSelfF")
			Else
				SendAnimationEvent(Target, "DefeatZaZCoverSelfM")
			Endif
		Endif
	Endif
EndFunction

Actor StruggleVictim
Actor StruggleAggressor
Bool StruggleIsCreature
String StruggleScenario
String StruggleVictimClass
String StruggleAggressorClass
Int StruggleStrafeL
Int StruggleStrafeR
Bool StruggleLeftRight = True
Float StruggleFillDifficulty = 0.0
Float StruggleFillThreshold = 0.0
Int StruggleResistTime = 0
Float StruggleFillStamina
Bool StruggleStanding
Bool StruggleHasBUArmor
Form StruggleBodyArmor
Function StrugglePushAwayTrigger(Actor Aggressor, Actor Victim)
	StruggleVictim = Victim
	StruggleAggressor = Aggressor
	GoToState("StrugglePushAway")
EndFunction
Function StruggleSceneTrigger(Actor Aggressor, Actor Victim, String Scenario, Bool IsCreature = False, Bool IsStanding = False)
	StruggleStanding = IsStanding
	StruggleIsCreature = IsCreature
	StruggleScenario = Scenario
	StruggleVictim = Victim
	StruggleAggressor = Aggressor
	GoToState("StruggleScene")
EndFunction
Function StruggleBar(Bool Display = True)
	If Display
		If ((McmConfig.QTEHKType == "$Attack") || UsingGamepad())
			StruggleStrafeL = Input.GetMappedKey("Left Attack/Block")
			StruggleStrafeR = Input.GetMappedKey("Right Attack/Block")
		Else
			StruggleStrafeL = Input.GetMappedKey("Strafe Left")
			StruggleStrafeR = Input.GetMappedKey("Strafe Right")
		Endif
		RegisterForKey(StruggleStrafeL)
		RegisterForKey(StruggleStrafeR)
		StruggleBar.Alpha = 100.0
	Else
		UnregisterForKey(StruggleStrafeL)
		UnregisterForKey(StruggleStrafeR)
		StruggleBar.Alpha = 0.0
		StruggleBar.Percent = 0.0
		StruggleFillDifficulty = 0.0
	EndIf
EndFunction
Function StruggleAnim(Actor Victim, Actor Aggressor, Bool Animate = True)
	If !StruggleIsCreature
		If Animate
			If (Aggressor != Player)
	 			ActorUtil.AddPackageOverride(Aggressor, DoNothing, 100, 1)
				Aggressor.EvaluatePackage()
				Aggressor.SetRestrained()
				Aggressor.SetDontMove(True)
			Else
				SetPlayerAiDriven()
			Endif
			MiscReferences[0].MoveTo(Aggressor) ; PosRef
			Float AngleZ = Victim.GetAngleZ()
			Aggressor.MoveTo(Victim, 0.0 * Math.Sin(AngleZ), 0.0 * Math.Cos(AngleZ))
			Victim.SetVehicle(MiscReferences[0]) ; PosRef
			Aggressor.SetVehicle(MiscReferences[0]) ; PosRef
			If StruggleStanding
				SendAnimationEvent(Victim, "DefeatArrok_A1_S1")
				SendAnimationEvent(Aggressor, "DefeatArrok_A2_S1")
;				Float Fangle = (Victim.GetHeadingAngle(Aggressor))
;				If ((Fangle < 110) && (Fangle > -110)) ; Returns FALSE for a hit in the back
;					SendAnimationEvent(Victim, "Leito_Doggystyle_A1_S1")
;					SendAnimationEvent(Aggressor, "Leito_Doggystyle_A2_S1")
;				Else
;					SendAnimationEvent(Victim, "Zyn_Standing_A1_S1")
;					SendAnimationEvent(Aggressor, "Zyn_Standing_A2_S1")
;				Endif
			Else
				SendAnimationEvent(Victim, "DefeatArrokResistVicS2")
				SendAnimationEvent(Aggressor, "DefeatArrokResistAggS2")
			Endif
		Else
			Victim.SetVehicle(None)
			Aggressor.SetVehicle(None)
			If (Aggressor != Player)
				Aggressor.SetRestrained(False)
				Aggressor.SetDontMove(False)
				ActorUtil.RemovePackageOverride(Aggressor, DoNothing)
			Else
				SetPlayerAiDriven(False)
			Endif
			SendAnimationEvent(Aggressor, "IdleForceDefaultState")
		Endif
	Endif
EndFunction
Function StruggleChances(Actor Aggressor, Actor Victim, Bool Weakened, Bool PhyStrength)
	StruggleFillThreshold = ((Victim.GetLevel() - Aggressor.GetLevel()) + (StruggleClassChance(Victim, True) - StruggleClassChance(Aggressor)))
;	Log("StruggleFillThreshold before - "+StruggleFillThreshold)
	StruggleFillThreshold = (StruggleFillThreshold / 10)
	If (StruggleFillThreshold < 2.0)
		StruggleFillThreshold = 2.0
	Elseif (StruggleFillThreshold > 10.0)
		StruggleFillThreshold = 10.0
	Endif
	If Weakened
		StruggleFillThreshold -= 0.4
	Endif
	If PhyStrength
		StruggleFillThreshold -= 0.4
	Endif
;	Log("StruggleFillThreshold before bonusmalus -> "+StruggleFillThreshold)
	If (McmConfig.ResistBonusPvic != 0.0) && (StruggleScenario == "Player Victim")
		Float BonusMalus = (McmConfig.ResistBonusPvic / 10)
		StruggleFillThreshold += BonusMalus
	Elseif (McmConfig.StruggleBonusPagg != 0.0) && (StruggleScenario == "Player Aggressor")
		Float BonusMalus = (McmConfig.StruggleBonusPagg / 10)
		StruggleFillThreshold += BonusMalus
	Endif
	If (StruggleFillThreshold < 0.0)
		StruggleFillThreshold = 0.0
	Endif
;	Log("StruggleFillThreshold after bonusmalus -> "+StruggleFillThreshold)
;	Log("StruggleFillThreshold after -> "+StruggleFillThreshold+" // Already raped? - "+Weakened+" / Female weakness? - 0.5"+PhyStrength)
	StruggleFillThreshold = (StruggleFillThreshold / 100)
;	Log("StruggleFillThreshold / 100 -> "+StruggleFillThreshold)
EndFunction
Float Function StruggleClassChance(Actor Target, Bool Victim = False) ; Return the two strongest skill values of the agressor.
	Float[] Skills
	If !Victim
		Skills = New float[9]
		Skills[0] = Target.GetActorValue("OneHanded")
		Skills[1] = Target.GetActorValue("TwoHanded")
		Skills[2] = Target.GetActorValue("Marksman")
		Skills[3] = Target.GetActorValue("Pickpocket")
		Skills[4] = Target.GetActorValue("Destruction")
		Skills[5] = Target.GetActorValue("Alteration")
		Skills[6] = (Skills[0] + Skills[1])
		Skills[7] = (Skills[2] + Skills[3])
		Skills[8] = (Skills[4] + Skills[5])
;		Log("StruggleClassChance Agg Skills - "+Skills)
		If ((Skills[6] > Skills[7]) && (Skills[6] > Skills[8]))
			StruggleAggressorClass = "Warrior"
;			Log("StruggleClassChance Agg return Warrior "+Skills[6])
			Return Skills[6]
		Elseif ((Skills[7] > Skills[6]) && (Skills[7] > Skills[8]))
			StruggleAggressorClass = "Rogue"
;			Log("StruggleClassChance Agg return Rogue "+Skills[7])
			Return Skills[7]
		Else
			StruggleAggressorClass = "Mage"
;			Log("StruggleClassChance Agg return Mage "+Skills[8])
			Return Skills[8]
		Endif
	Else
		Skills = New float[11]
		Skills[0] = (Target.GetActorValue("LightArmor") / 1.2)
		Skills[1] = Target.GetActorValue("Block")
		Skills[2] = (Target.GetActorValue("Sneak") / 1.6)
		Skills[3] = (Target.GetActorValue("Alchemy") / 1.6)
		Skills[4] = Target.GetActorValue("Illusion")
		Skills[5] = Target.GetActorValue("Restoration")
		Skills[6] = (Target.GetActorValue("HeavyArmor") / 1.2)
		Skills[7] = Target.GetActorValue("Conjuration")
		Skills[8] = (Skills[0] + Skills[1] + Skills[6])
		Skills[9] = (Skills[2] + Skills[3])
		Skills[10] = (Skills[4] + Skills[5] + Skills[7])
;		Log("StruggleClassChance Def Skills - "+Skills)
		If (Skills[0] > Skills[1])
			Skills[8] - Skills[1]
		Else
			Skills[8] - Skills[0]
		Endif
		If (Skills[4] > Skills[7])
			Skills[10] = (Skills[10] - Skills[7])
		Else
			Skills[10] = (Skills[10] - Skills[4])
		Endif
;		Log("StruggleClassChance Skills after reduction - "+Skills)
		If ((Skills[8] > Skills[9]) && (Skills[8] > Skills[10]))
			StruggleVictimClass = "Warrior"
;			Log("StruggleClassChance Def return Warrior "+Skills[8])
			Return Skills[6]
		Elseif ((Skills[9] > Skills[8]) && (Skills[9] > Skills[10]))
			StruggleVictimClass = "Rogue"
;			Log("StruggleClassChance Def return Rogue "+Skills[9])
			Return Skills[7]
		Else
			StruggleVictimClass = "Mage"
;			Log("StruggleClassChance Def return Mage "+Skills[10])
			Return Skills[8]
		Endif
	Endif
EndFunction
State StruggleScene
;	Event OnHit(ObjectReference akAggressor, Form akSrc, Projectile akProjectile, Bool abPowerAttack, Bool abSneakAttack, Bool abBashAttack, Bool abHitBlocked)
;		AddCalmList(akAggressor As Actor, StruggleVictim)
;	EndEvent
	Event OnBeginState()
		StruggleChances(StruggleAggressor, StruggleVictim, StruggleVictim.HasSpell(MiscSpells[0]), ((StruggleVictim.GetLeveledActorBase().GetSex() == 1) && (StruggleAggressor.GetLeveledActorBase().GetSex() == 0))) ; DebuffSPL
		StruggleAnim(StruggleVictim, StruggleAggressor)
		StruggleBar()
		StruggleBodyArmor = StruggleVictim.GetWornForm(0x00000004)
		StruggleHasBUArmor = (StruggleBodyArmor && StruggleBodyArmor.HasKeyWordString("BU_Equip"))
		RegisterForSingleUpdate(1.0)
	EndEvent
	Event OnUpdate()
		If (StruggleBar.Percent >= 1.0)
			GoToState("")
			StruggleAnim(StruggleVictim, StruggleAggressor, False)
			If (StruggleScenario == "Player Aggressor")
				DefeatPlayAnimation(StruggleVictim, "Lie")
				ActionQst.StruggleSuccess(StruggleVictim, StruggleAggressor)
			Elseif (StruggleScenario == "Player Victim")
				StruggleSuccess(StruggleVictim, StruggleAggressor)
			Endif
			Return
		Elseif (StruggleResistTime == 4)
			If StruggleHasBUArmor
				DefeatUtil.BUBreakArmor(StruggleVictim, StruggleBodyArmor)
			Endif
			GoToState("")
			StruggleVictim.DamageActorValue("Stamina", StruggleVictim.GetActorValue("Stamina"))
			StruggleAnim(StruggleVictim, StruggleAggressor, False)
			Wait(0.5)
			If (StruggleScenario == "Player Aggressor")
				StruggleSuccess(StruggleVictim, StruggleAggressor)
			Elseif (StruggleScenario == "Player Victim")
				PlayerScr.StruggleFail(StruggleVictim, StruggleAggressor, StruggleStanding)
			Endif
			Return
		Endif
		StruggleResistTime += 1
		If StruggleHasBUArmor
			DefeatUtil.BUAdvanceStage(StruggleVictim, StruggleBodyArmor)
		Endif
		SoundToPlay[8].Play(StruggleVictim) ; Rescue
		RegisterForSingleUpdate(1.0)
	EndEvent
	Event OnKeyDown(Int KeyCode)
		If ((KeyCode == StruggleStrafeL) && StruggleLeftRight)
			StruggleLeftRight = False
			StruggleFillDifficulty += StruggleFillThreshold
			StruggleBar.Percent = (StruggleFillDifficulty)
		Elseif ((KeyCode == StruggleStrafeR) && !StruggleLeftRight)
			StruggleLeftRight = True
			StruggleFillDifficulty += StruggleFillThreshold
			StruggleBar.Percent = (StruggleFillDifficulty)
		Endif
	EndEvent
	Event OnEndState()
		StruggleBar(False)
		StruggleResistTime = 0
	EndEvent
EndState
State StrugglePushAway
	Event OnBeginState()
		If (McmConfig.ResistFillStamina <= 20.0)
			StruggleFillStamina = (StruggleVictim.GetBaseActorValue("Stamina") / (McmConfig.ResistFillStamina As Int))
		Else
			StruggleFillStamina = McmConfig.ResistFillStamina
		Endif
		StruggleFillThreshold = 0.1
		StruggleBar()
		RegisterForSingleUpdate(1.0)
	EndEvent
	Event OnUpdate()
		If !StruggleVictim.HasKeywordString("SexLabActive")
			GoToState("")
			Return
		Elseif (StruggleBar.Percent >= 1.0)
			GoToState("")
			sslThreadController Controller = SexLabUtil.GetAPI().GetActorController(StruggleVictim)
			Controller.EndAnimation(True)
			Wait(1.0)
			StruggleVictimClass = "Warrior"
			StruggleSuccess(StruggleVictim, StruggleAggressor)
			Return
		Elseif (StruggleResistTime == 14) || (StruggleVictim.GetActorValue("Stamina") <= 5.0)
			GoToState("")
			UILib.ShowNotification("$You are too weak to resist any longer...", "#CD4C4C")
			Return
		Endif
		StruggleResistTime += 1
		RegisterForSingleUpdate(1.0)
	EndEvent
	Event OnKeyDown(Int KeyCode)
		If ((KeyCode == StruggleStrafeL) && StruggleLeftRight)
			StruggleLeftRight = False
			StruggleVictim.DamageActorValue("Stamina", StruggleFillStamina)
			SoundToPlay[8].Play(StruggleVictim) ; Rescue
			StruggleFillDifficulty += StruggleFillThreshold
			StruggleBar.Percent = StruggleFillDifficulty
		Elseif ((KeyCode == StruggleStrafeR) && !StruggleLeftRight)
			StruggleLeftRight = True
			StruggleVictim.DamageActorValue("Stamina", StruggleFillStamina)
			SoundToPlay[8].Play(StruggleVictim) ; Rescue
			StruggleFillDifficulty += StruggleFillThreshold
			StruggleBar.Percent = StruggleFillDifficulty
		Endif
	EndEvent
	Event OnEndState()
		StruggleBar(False)
		StruggleResistTime = 0
	EndEvent
EndState
Function StruggleSuccess(Actor Victim, Actor Aggressor)
	If (StruggleVictimClass == "Warrior")
		If Victim.GetEquippedShield()
			SoundToPlay[4].Play(Victim) ; Bash shield
		Else
			SoundToPlay[5].Play(Victim) ; Bash weapon
		Endif
	Elseif (StruggleVictimClass == "Rogue")
		int Rand = RandomInt(1, 4)
		If (Rand == 1)
			ResistSpells[9].Cast(Victim, Aggressor) ; ResistAlchemySpell
			SoundToPlay[2].Play(Victim) ; Alchemy
		Elseif (Rand == 2)
			ResistSpells[8].Cast(Victim, Aggressor) ; ResistSneakSpell
			Aggressor.Say(TopicToSay[12], Victim) ; Caugh
		Else
			SoundToPlay[0].Play(Victim) ; Sneak
			ResistSpells[0].Cast(Victim, Aggressor) ; ResistArcherySpell
		Endif
	Else
		int Rand = RandomInt(1, 12)
		If (Rand == 1)
			ResistSpells[1].Cast(Victim, Victim) ; ResistDestructionFireSpell
		Elseif (Rand == 2)
			ResistSpells[2].Cast(Victim, Victim) ; ResistDestructionFrostSpell
		Elseif (Rand == 3)
			ResistSpells[3].Cast(Victim, Victim) ; ResistDestructionShockSpell
		Elseif (Rand == 4)
			ResistSpells[4].Cast(Victim, Aggressor) ; ResistConjurationFireSpell
		Elseif (Rand == 5)		
			ResistSpells[5].Cast(Victim, Aggressor) ; ResistConjurationFrostSpell
		Elseif (Rand == 6)
			ResistSpells[6].Cast(Victim, Aggressor) ; ResistConjurationShockSpell
		Else
			ResistSpells[7].Cast(Victim, Aggressor) ; ResistAlterationSpell
			SoundToPlay[3].Play(Victim) ; Tele push
		Endif
	Endif
	Victim.PushActorAway(Aggressor, 3.0)
	If (StruggleScenario == "Player Victim")
		If !StruggleStanding
			DefeatPlayAnimation(Victim, "Stand")
		Else
			SendAnimationEvent(Victim, "IdleForceDefaultState")
		Endif
		PlayerScr.Restored()
	Elseif (StruggleScenario == "Player Aggressor")
		RemoveStates(Victim)
		DefeatPlayAnimation(Victim, "Stand")
	Endif
EndFunction
Function StruggleCancel()
	StruggleResistTime = 4
EndFunction
Actor[] Function MakeActorArray(Actor Target, Actor Actor1, Actor Actor2 = None, Actor Actor3 = None, Actor Actor4 = None)
	Actor[] Positions
	If Actor4
		Positions = New Actor[5]
		Positions[0] = Target
		Positions[1] = Actor1
		Positions[2] = Actor2
		Positions[3] = Actor3
		Positions[4] = Actor4
	Elseif Actor3
		Positions = New Actor[4]
		Positions[0] = Target
		Positions[1] = Actor1
		Positions[2] = Actor2
		Positions[3] = Actor3
	Elseif Actor2
		Positions = New Actor[3]
		Positions[0] = Target
		Positions[1] = Actor1
		Positions[2] = Actor2
	Else
		Positions = New Actor[2]
		Positions[0] = Target
		Positions[1] = Actor1
	Endif
	Return Positions
EndFunction
Int Function AnimSettingsPage()
	Int NumPage = -1
	String[] List = New String[4]
	List[0] = "$Consensual"
	List[1] = "$Player as victim"
	List[2] = "$Player/Follower aggressor"
	List[3] = "$NPC vs NPC"	
	Int Result
	Result = UILIB.ShowList("$Choose a page", List, -1, -1)
	If (Result != -1)
		NumPage = Result
	Endif
	Return NumPage
EndFunction
String Function SetTags(String Tag)
	String[] TagList
	If Input.IsKeyPressed(HotKeyInts[1]) ; Modifier key
		TagList = SexLab.GetAllCreatureAnimationTags()
	Else
		TagList = SexLab.GetAllAnimationTags()
	Endif
	Int Result
	If (Tag != "")
		Result = UILIB.ShowList("$Choose a tag", TagList, -1, -1)
	Else
		Result = UILIB.ShowList("$Choose a tag", TagList, TagList.Find(Tag), -1)
	Endif
	If (Result != -1)
		String TheText = TagList[Result]
		If (Tag != "")
			Tag = Tag+","+TheText
		Else
			Tag = TheText
		Endif
	Endif
	Return Tag
EndFunction
Function CheckAvailableAnimations(String Tags, String SupressTags, Bool TagsRequireAll, Int NumbActors = 2, Bool IsCreature = False)
	sslBaseAnimation[] Anims
	If !IsCreature
		Anims = SexLab.GetAnimationsByTags(NumbActors, Tags, SupressTags, TagsRequireAll)
	Else
		Anims = SexLab.GetCreatureAnimationsByTags(NumbActors, Tags, SupressTags, TagsRequireAll)
	Endif
	String[] List = New String[128]
	Int i
	While (i < Anims.Length)
		List[i] = Anims[i].Name
		i += 1
	EndWhile
	UILIB.ShowList("$List of available animations with this configuration", List, -1, -1)
EndFunction
Int Function GenderCombination(Actor Target, Actor Aggressor) ; 1 - Normal / 2 - Female on male / 3 - Lesbian
	Bool AggressorFemale = (SexLab.GetGender(Aggressor) == 1)
	Bool TargetFemale = (SexLab.GetGender(Target) == 1)
	If (!TargetFemale && AggressorFemale)
		Return 2
	Elseif (TargetFemale && AggressorFemale)
		Return 3
	Endif
	Return 1
EndFunction
sslThreadModel Function SexLabScene(Actor Target, Actor Actor1, Actor Actor2 = None, Actor Actor3 = None, Actor Actor4 = None, sslBaseAnimation[] CustomAnimations, String Tags = "aggressive", String SupressTags = "", Bool TagsRequireAll = False, String FemaleFirst = "", Bool IsAggressive = True)
	sslThreadModel Make = SexLab.NewThread()
	Actor[] Positions = MakeActorArray(Target, Actor1, Actor2, Actor3, Actor4)
	Int ActorCount = Positions.Length
	sslBaseAnimation[] Anims
	Bool SortActors
	Bool IgnoreGT
	If (FemaleFirst != "")
		If (FemaleFirst == "true") || (FemaleFirst == "false")
			If (FemaleFirst == "true") 
				SortActors = True
			Else
				SortActors = False
			Endif
		Elseif (FemaleFirst == "RapePvic")
			SortActors = McmConfig.RapeFemaleFirstPvic
		Elseif (FemaleFirst == "KOPvic")
			SortActors = McmConfig.KOFemaleFirstPvic
		Elseif (FemaleFirst == "TiedPvic")
			SortActors = McmConfig.TiedFemaleFirstPvic
		Elseif (FemaleFirst == "FoMPvic")
			SortActors = McmConfig.FoMFemaleFirstPvic
		Elseif (FemaleFirst == "FoFPvic")
			SortActors = McmConfig.FoFFemaleFirstPvic
		Elseif (FemaleFirst == "MultPvic")
			IgnoreGT = McmConfig.MultipleIgnoreGTPvic
			SortActors = McmConfig.MultipleFemaleFirstPvic
		Elseif (FemaleFirst == "MultCreaPvic")
			IgnoreGT = McmConfig.MultipleIgnoreGTCreaPvic
		Elseif (FemaleFirst == "RapePagg")
			SortActors = McmConfig.RapeFemaleFirstPagg
		Elseif (FemaleFirst == "NecroPagg")
			SortActors = McmConfig.NecroFemaleFirstPagg
		Elseif (FemaleFirst == "TiedPagg")
			SortActors = McmConfig.TiedFemaleFirstPagg
		Elseif (FemaleFirst == "FoMPagg")
			SortActors = McmConfig.FoMFemaleFirstPagg
		Elseif (FemaleFirst == "FoFPagg")
			SortActors = McmConfig.FoFFemaleFirstPagg
		Elseif (FemaleFirst == "MultPagg")
			SortActors = McmConfig.MultipleFemaleFirstPagg
			IgnoreGT = McmConfig.MultipleIgnoreGTPagg
		Elseif (FemaleFirst == "MultCreaPagg")
			IgnoreGT = McmConfig.MultipleIgnoreGTCreaPagg
		Elseif (FemaleFirst == "RapeNVN")
			SortActors = McmConfig.RapeFemaleFirstNVN
		Elseif (FemaleFirst == "TiedNVN")
			SortActors = McmConfig.TiedFemaleFirstNVN
		Elseif (FemaleFirst == "FoMNVN")
			SortActors = McmConfig.FoMFemaleFirstNVN
		Elseif (FemaleFirst == "FoFNVN")
			SortActors = McmConfig.FoFFemaleFirstNVN
		Elseif (FemaleFirst == "MultNVN")
			SortActors = McmConfig.MultipleFemaleFirstNVN
			IgnoreGT = McmConfig.MultipleIgnoreGTNVN
		Elseif (FemaleFirst == "MultCreaNVN")
			IgnoreGT = McmConfig.MultipleIgnoreGTCreaNVN
		Elseif (FemaleFirst == "Cons")
			SortActors = McmConfig.ConsFemaleFirst
		Endif
	Endif
	If SortActors
		Positions = SexLab.SortActors(Positions)
	Endif
	If (ActorCount > 2)
		String GenderTag = SexLabUtil.MakeGenderTag(Positions)
		If (CustomAnimations.length != 0)
			Anims = CustomAnimations
		Else
			If !Make.HasCreature
				If IgnoreGT
					Anims = SexLab.GetAnimationsByType(ActorCount, Aggressive = False)
				Else
					Anims = SexLab.GetAnimationsByTags(ActorCount, GenderTag+","+Tags, SupressTags, TagsRequireAll)
				Endif
			Else
				Actor TheCreature
				Int i = Positions.length
				While (i > 0)
					i -= 1
					If !Positions[i].HasKeyWordString("ActorTypeNPC")
						TheCreature = Positions[i]
						i = 0
					Endif
				EndWhile
				If IgnoreGT
					Anims = SexLab.GetCreatureAnimationsByRace(ActorCount, TheCreature.GetLeveledActorBase().GetRace())
				Else
					Anims = SexLab.GetCreatureAnimationsByRaceTags(ActorCount, TheCreature.GetLeveledActorBase().GetRace(), GenderTag+","+Tags, SupressTags, TagsRequireAll)
				Endif
			Endif
		Endif
	Else
		If (CustomAnimations.length != 0)
			Anims = CustomAnimations
		Elseif !Make.HasCreature
			If (Tags == "") && IsAggressive
				Anims = SexLab.GetAnimationsByType(ActorCount, Aggressive = True)
			Else
				Anims = SexLab.GetAnimationsByTags(ActorCount, Tags, SupressTags, TagsRequireAll)
			Endif
		Else
			Actor TheCreature
			Int i = Positions.length
			While (i > 0)
				i -= 1
				If !Positions[i].HasKeyWordString("ActorTypeNPC")
					TheCreature = Positions[i]
					i = 0
				Endif
			EndWhile
			Anims = SexLab.GetCreatureAnimationsByRaceTags(ActorCount, TheCreature.GetLeveledActorBase().GetRace(), Tags, SupressTags, TagsRequireAll)
		Endif
	Endif
	If (Anims.length == 0)
		Log("SexLabScene - No animations were found, the script will set default aggressive animations")
		If !Make.HasCreature
			Anims = SexLab.GetAnimationsByType(ActorCount, Aggressive = True)
		Else
			Actor TheCreature
			Int i = Positions.length
			While (i > 0)
				i -= 1
				If !Positions[i].HasKeyWordString("ActorTypeNPC")
					TheCreature = Positions[i]
					i = 0
				Endif
			EndWhile
			Anims = SexLab.GetCreatureAnimationsByRace(ActorCount, TheCreature.GetLeveledActorBase().GetRace())
		Endif
	Endif
	If IsAggressive
		Make.AddActors(Positions, Target)
	Else
		Make.AddActors(Positions)
	Endif
	If (Target.GetSleepState() == 3)
		ObjectReference Bed = SexLab.FindBed(Target, 200.0)
		If Bed
			Make.CenterOnObject(Bed)
		Else
			Make.CenterOnObject(Actor1)
		Endif
	Else
		Make.CenterOnObject(Actor1)
	Endif
	Make.DisableUndressAnimation(Target)
	Make.DisableRagdollEnd(Actor1)
	If Actor2
		Make.DisableRagdollEnd(Actor2)
	Endif
	If Actor3
		Make.DisableRagdollEnd(Actor3)
	Endif
	If Actor4
		Make.DisableRagdollEnd(Actor4)
	Endif
	Make.SetAnimations(Anims)	
	Make.DisableBedUse()
;	CustomAnimations = New sslBaseAnimation[1]
;	log("SexLabScene / IgnoreGT - "+IgnoreGT+" / SortActors - "+SortActors+" / Tags - "+Tags+" / SupressTags - "+SupressTags+" / TagsRequireAll - "+TagsRequireAll+" / FemaleFirst - "+FemaleFirst+" / IsAggressive - "+IsAggressive)
	Return Make
EndFunction

ImageSpaceModifier FadeToBlackHoldImod
ImageSpaceModifier FadeToBlackBackImod
Bool IsFadedOut = False
Function FadeOut(Float Time = 0.0)
;	If !IsFadedOut
;		FadeOutGame(true, true, Time, 3.0)
;		IsFadedOut = True
;	Endif
	If !IsFadedOut
		FadeToBlackHoldImod.ApplyCrossFade(Time)
		IsFadedOut = True
	Endif
EndFunction
Function FadeIn(Float Time = 0.0)
;	If (Time == 0.0)
;		FadeOutGame(false, true, 0.0, 0.0)
;	Else
;		FadeOutGame(false, true, 0.0, Time)
;	Endif
;	IsFadedOut = False
	If (Time == 0.0)
		FadeToBlackHoldImod.Remove()
	Else
		FadeToBlackBackImod.ApplyCrossFade(Time)
		Wait(Time)
		FadeToBlackBackImod.Remove()
	Endif
	IsFadedOut = False
EndFunction

Actor SOTarget
Race ArgonianRace
Race BretonRace
Race DarkElfRace
Race HighElfRace
Race ImperialRace
Race KhajiitRace
Race NordRace
Race OrcRace
Race WoodElfRace
Race RedguardRace
Race ElderRace
GlobalVariable SOLevel
GlobalVariable SOUnique
GlobalVariable SOPure
GlobalVariable SORaceBonus
GlobalVariable SOFactionBonus
GlobalVariable SOValue
GlobalVariable SOValuePimp
GlobalVariable SOValuePimp2
GlobalVariable SOValueGuard
GlobalVariable SOWitness
GlobalVariable SOSexCombination
GlobalVariable SORelation
GlobalVariable SOMorality
GlobalVariable SOAlreadyProstituedTo
ReferenceAlias SOLastInSack
ReferenceAlias SOLastInSackAggressor
ReferenceAlias SOLastInSackTimer
ReferenceAlias SOPlayerForceDialogue
Faction CompanionFaction
Faction SilverHandFaction
Faction VigilantOfStendarrFaction
Faction VampireFaction
Faction ThalmorFaction
Faction CWImperialFaction
Faction CrimeFactionSons

Function SOCleanUp()
	Scene SOProstitute = (GetFormFromFile(0x313F2C9, "SexLabDefeat.esp") As Scene)
	If SOProstitute.IsPlaying()
		SOProstitute.Stop()
	Endif
	SOLastInSackAggressor.Clear()
	If (ActionQst.GetState() != "Carrying")
		ActionQst.GoToState("Running")
	Endif
	SOPlayerForceDialogue.Clear()
EndFunction
Function SOForceGreet(Actor Target)
	If !SOPlayerForceDialogue.GetReference()
		SOPlayerForceDialogue.ForceRefTo(Target)
		Wait(1.0)
		SOPlayerForceDialogue.Clear()
	Endif
EndFunction
Function SOWitness(Actor Target, Actor Customer)
	If McmConfig.SOWitness
		SOWitness.SetValue(SOCheckForWitness(Target))
	Else
		SOWitness.SetValue(0)
	Endif
EndFunction
Int Function SOCheckForWitness(Actor Target)
	Cell CurrentCell = Player.GetParentCell()
	Int NumRefs = CurrentCell.GetNumRefs(62)
	Actor Found
	While (NumRefs > 0)
		NumRefs -= 1
		Found = CurrentCell.GetNthRef(NumRefs, 62) as Actor
		If (Found && !Found.IsGhost() && !Found.IsDead() && (Found != Player) && (Found != Target) && !IsFollower(Found) && !Found.IsInDialogueWithPlayer() && (Found.HasLos(Target) || Found.GetDistance(Target) < 500))
			Log("SOWitness / Witness found - "+Found)
			Return 1
		Endif
	EndWhile
	Return 0
EndFunction
Function SOSexCombination(Actor Target, Actor Customer)
	If McmConfig.SOSexuality
		SOSexCombination.SetValue(IsSexualAssaulter(Customer, Target) As Int)
	Else
		SOSexCombination.SetValue(1)
	Endif
EndFunction	
Function SORelation(Actor Target, Actor Customer)
	SORelation.SetValue(McmConfig.SORelation As Int)
EndFunction
Function SOMorality(Actor Target, Actor Customer)
	SOMorality.SetValue((McmConfig.SOMorality && Customer.GetActorValue("Morality") == 3) As Int)
EndFunction
Function SOAlreadyProstituedTo(Actor Target, Actor Customer)
	SOAlreadyProstituedTo.SetValue(HasBeenRapedBy(Target, Customer))
EndFunction

Function SOValue(Actor Target, Actor Customer, Bool PimpCumulate = False)
	SOTarget = Target
	SexLab.Stats.SeedActor(SOTarget)
	Int Value
	SOLevel.SetValue(SOTarget.GetLevel())
	Int Level = SOLevel.GetValueInt()
	Value += (Level * SOXValues[11])
	SORaceBonus.SetValue(0)
	Race TargetRace = SOTarget.GetRace()
	Race CustomerRace = Customer.GetRace()
	Int RaceBonus
	If TargetRace == ElderRace
		RaceBonus = (Level * SOXValues[0])
	Elseif (TargetRace == NordRace)
		RaceBonus = (Level * SOXValues[1])
	Elseif (TargetRace == ImperialRace)
		RaceBonus = (Level * SOXValues[2])
	Elseif (TargetRace == BretonRace)
		RaceBonus = (Level * SOXValues[3])
	Elseif (TargetRace == RedguardRace)
		RaceBonus = (Level * SOXValues[4])
	Elseif (TargetRace == DarkElfRace)
		RaceBonus = (Level * SOXValues[5])
	Elseif (TargetRace == HighElfRace)
		RaceBonus = (Level * SOXValues[6])
	Elseif (TargetRace == WoodElfRace)
		RaceBonus = (Level * SOXValues[7])
	Elseif (TargetRace == OrcRace)
		RaceBonus = (Level * SOXValues[8])
	Elseif (TargetRace == ArgonianRace)
		RaceBonus = (Level * SOXValues[9])
	Elseif (TargetRace == KhajiitRace)
		RaceBonus = (Level * SOXValues[10])
	Endif
	If (RaceBonus > 0)
		SORaceBonus.SetValue(RaceBonus)
		Value += RaceBonus
	Endif
	SOSexCombination.SetValue(0)
	If (!McmConfig.SOSexuality || IsSexualAssaulter(Customer, Target))
		SOSexCombination.SetValue(SOXValues[12] * Level)
		Value += (SOXValues[12] * Level)
	Endif
	SOUnique.SetValue(0)
	If SOTarget.GetleveledActorBase().IsUnique()
		SOUnique.SetValue(SOXValues[13] * Level)
		Value += (SOXValues[13] * Level)
	Endif
	SOFactionBonus.SetValue(0)
	If (SOTarget.IsInfaction(SilverHandFaction) && Customer.IsInfaction(CompanionFaction)) || (SOTarget.IsInfaction(CompanionFaction) && Customer.IsInfaction(SilverHandFaction)) || \
		(SOTarget.HasKeywordString("Vampire") && Customer.IsInfaction(VigilantOfStendarrFaction)) || (SOTarget.IsInfaction(VigilantOfStendarrFaction) && Customer.HasKeywordString("Vampire")) || \
		(SOTarget.IsInfaction(ThalmorFaction) && Customer.IsInfaction(CWImperialFaction)) || (SOTarget.IsInfaction(CWImperialFaction) && Customer.IsInfaction(ThalmorFaction)) || \
		(SOTarget.IsInfaction(CrimeFactionSons) && Customer.IsInfaction(CWImperialFaction)) || (SOTarget.IsInfaction(CWImperialFaction) && Customer.IsInfaction(CrimeFactionSons))
		SOFactionBonus.SetValue(SOXValues[14] * Level)
		Value += (SOXValues[14] * Level)
	Endif
	SOPure.SetValue(0)
	If (SexLab.HadSex(SOTarget) == False)
		SOPure.SetValue(SOXValues[15] * Level)
		Value += (SOXValues[15] * Level)
	Endif
	If (Value < 10)
		Value = 10
	Endif
	SOValue.SetValue(Value)
	If !PimpCumulate
		SOValuePimp.SetValue(Value / 10)
	Else
		SOValuePimp2.SetValue(SOValuePimp.GetValueInt() + (Value / 10))
	Endif
	SOValueGuard.SetValue(Value / 2)
;	log("SORelation - "+SORelation.GetValue())
;	log("SOMorality - "+SOMorality.GetValue())
;	log("SOAlreadyProstituedTo - "+SOAlreadyProstituedTo.GetValue())	
;	log("SOSexCombination - "+SOSexCombination.GetValue())	
EndFunction
Function SOValueDetails(String Type)
	If (Type == "All")
		String[] ValueMenu = New String[9]
		ValueMenu[0] = "$Level - {"+SOLevel.GetValueInt()+"} / {"+(SOLevel.GetValueInt() * SOXValues[11])+"} gold"
		ValueMenu[1] = "$Race - {"+SOTarget.GetRace().GetName()+"} / {"+SORaceBonus.GetValueInt()+"} gold"
		ValueMenu[2] = "$Faction - {"+SOYesNo(SOFactionBonus)+"} / {"+SOFactionBonus.GetValueInt()+"} gold"
		ValueMenu[3] = "$Gender - {"+SOYesNo(SOSexCombination)+"} / {"+SOSexCombination.GetValueInt()+"} gold"
		ValueMenu[4] = "$Unique - {"+SOYesNo(SOUnique)+"} / {"+SOUnique.GetValueInt()+"} gold"
		ValueMenu[5] = "$Pure - {"+SOYesNo(SOPure)+"} / {"+SOPure.GetValueInt()+"} gold"
		ValueMenu[6] = "$Market value - {"+SOValue.GetValueInt()+"}"
		ValueMenu[7] = "$Handover value (Market value / 2) - {"+SOValueGuard.GetValueInt()+"} gold"
		ValueMenu[8] = "$Prostitute value (Market value / 10) - {"+SOValuePimp.GetValueInt()+"} gold"
		UILIB.ShowList("$Value of {"+SOTarget.GetleveledActorBase().GetName()+"}", ValueMenu, -1, -1)
	Elseif (Type == "Handover")
		String[] ValueMenu = New String[7]
		ValueMenu[0] = "$Level - {"+SOLevel.GetValueInt()+"} / {"+(SOLevel.GetValueInt() * SOXValues[11])+"} gold"
		ValueMenu[1] = "$Race - {"+SOTarget.GetRace().GetName()+"} / {"+SORaceBonus.GetValueInt()+"} gold"
		ValueMenu[2] = "$Faction - {"+SOYesNo(SOFactionBonus)+"} / {"+SOFactionBonus.GetValueInt()+"} gold"
		ValueMenu[3] = "$Gender - {"+SOYesNo(SOSexCombination)+"} / {"+SOSexCombination.GetValueInt()+"} gold"
		ValueMenu[4] = "$Unique - {"+SOYesNo(SOUnique)+"} / {"+SOUnique.GetValueInt()+"} gold"
		ValueMenu[5] = "$Pure - {"+SOYesNo(SOPure)+"} / {"+SOPure.GetValueInt()+"} gold"
		ValueMenu[6] = "$Market value - {"+SOValue.GetValueInt()+"} gold"
		UILIB.ShowList("$Handover value (Market value / 2) - {"+SOValueGuard.GetValueInt()+"} gold", ValueMenu, -1, -1)
	Elseif (Type == "Prostitute")
		String[] ValueMenu = New String[7]
		ValueMenu[0] = "$Level - {"+SOLevel.GetValueInt()+"} / {"+(SOLevel.GetValueInt() * SOXValues[11])+"} gold"
		ValueMenu[1] = "$Race - {"+SOTarget.GetRace().GetName()+"} / {"+SORaceBonus.GetValueInt()+"} gold"
		ValueMenu[2] = "$Faction - {"+SOYesNo(SOFactionBonus)+"} / {"+SOFactionBonus.GetValueInt()+"} gold"
		ValueMenu[3] = "$Gender - {"+SOYesNo(SOSexCombination)+"} / {"+SOSexCombination.GetValueInt()+"} gold"
		ValueMenu[4] = "$Unique - {"+SOYesNo(SOUnique)+"} / {"+SOUnique.GetValueInt()+"} gold"
		ValueMenu[5] = "$Pure - {"+SOYesNo(SOPure)+"} / {"+SOPure.GetValueInt()+"} gold"
		ValueMenu[6] = "$Market value - {"+SOValue.GetValueInt()+"} gold"
		UILIB.ShowList("$Prostitute value (Market value / 10) - {"+SOValuePimp.GetValueInt()+"} gold", ValueMenu, -1, -1)
	Endif
EndFunction
String Function SOYesNo(GlobalVariable TheVar)
	Bool Yes = (TheVar.Value As Bool)
	If Yes
		Return "Yes"
	Endif
	Return "No"
EndFunction
Function SOHandOver(Actor Target, Actor Customer)
	SOLastInSackTimer.ForceRefTo(Target)
	(SOLastInSackTimer As DefeatLastInSackScr).RegisterForNextHandOver()
EndFunction
Function SOSetProstituteReward(Actor Target, Int Value)
;	Actor Target = (SOLastInSackAggressor.GetReference() as actor)
	SetIntValue(Target, "DefeatSOProstituteReward", Value)
EndFunction

Bool SOIsMultiple = False
Actor SOAdd
Function SOSetMultiple(Actor Target)
	SOIsMultiple = True
	SOAdd = Target
EndFunction
Function SOProstitute(Actor Target, Actor Customer)
	ActionQst.Strip(Target, Customer)
	sslBaseAnimation[] Anims
	sslThreadModel TheRape
	If SOIsMultiple
		SOIsMultiple = False
		If (GetStringValue(Target, "DefeatStateAnim") == "ZapPillorySex01_A1_S1")
			Anims = SexLab.GetAnimationsByTags(3, "Pillory", RequireAll = True)
		Endif
		If Customer.HasKeyWordString("ActorTypeNPC")
			TheRape = SexLabScene(Target, Customer, SOAdd, CustomAnimations = Anims, Tags = McmConfig.MultipleTagNVN, SupressTags = McmConfig.MultipleSupressTagNVN, TagsRequireAll = McmConfig.MultipleRequireAllTagNVN, FemaleFirst = "MultNVN")
		Else
			TheRape = SexLabScene(Target, Customer, SOAdd, CustomAnimations = Anims, Tags = McmConfig.CreatureTagNVN, SupressTags = McmConfig.CreatureSupressTagNVN, TagsRequireAll = McmConfig.CreatureRequireAllTagNVN)
		Endif
	Else
		If Customer.HasKeyWordString("ActorTypeNPC")
			String AnimationSet
			If (GetStringValue(Target, "DefeatStateAnim") == "ZapPillorySex01_A1_S1")
				Anims = SexLab.GetAnimationsByTags(2, "Pillory", RequireAll = True)
			Endif
			If (Anims.length == 0)	
				If Tied(Target)
					Anims = SexLab.GetAnimationsByTags(2, McmConfig.TiedTagNVN, McmConfig.TiedSupressTagNVN, McmConfig.TiedRequireAllTagNVN)
					AnimationSet = "TiedNVN"
				Endif
				If (Anims.length == 0)
					Int GenderCombination = GenderCombination(Target, Customer)
					If (GenderCombination == 2)
						Anims = SexLab.GetAnimationsByTags(2, McmConfig.FoMTagNVN, McmConfig.FoMSupressTagNVN, McmConfig.FoMRequireAllTagNVN)
						AnimationSet = "FoMNVN"
					Elseif (GenderCombination == 3)
						Anims = SexLab.GetAnimationsByTags(2, McmConfig.FoFTagNVN, McmConfig.FoFSupressTagNVN, McmConfig.FoFRequireAllTagNVN)
						AnimationSet = "FoFNVN"
					Endif
				Endif
			Endif
			If (Anims.length == 0)
				AnimationSet = "RapeNVN"
			Endif
			TheRape = SexLabScene(Target, Customer, CustomAnimations = Anims, Tags = McmConfig.RapeTagNVN, SupressTags = McmConfig.RapeSupressTagNVN, TagsRequireAll = McmConfig.RapeRequireAllTagNVN, FemaleFirst = AnimationSet)
		Else
			TheRape = SexLabScene(Target, Customer, CustomAnimations = Anims, Tags = McmConfig.CreatureTagNVN, SupressTags = McmConfig.CreatureSupressTagNVN, TagsRequireAll = McmConfig.CreatureRequireAllTagNVN)
		Endif
	Endif
	TheRape.DisableRagdollEnd(Customer)
	TheRape.DisableRagdollEnd(Target)
	ActionQst.RegisterForModEvent("AnimationEnd_Defeat", "EndR")
	RegisterForModEvent("AnimationEnd_Defeat", "EndR")
	TheRape.SetHook("Defeat")
	sslThreadModel Thread = TheRape.StartThread()
	SOLastInSackAggressor.Clear()
EndFunction
Function SOConsensual(Actor Target, Actor Customer)
	sslThreadModel TheScene
	sslBaseAnimation[] Anims
	SetIntValue(Target, "DefeatSOReceiver", 1)
	If SOIsMultiple
		SOIsMultiple = False
		TheScene = SexLabScene(Target, Customer, SOAdd, CustomAnimations = Anims, Tags = McmConfig.ConsMultipleTag, SupressTags = McmConfig.ConsMultipleSupressTag, TagsRequireAll = McmConfig.ConsMultipleRequireAllTag, FemaleFirst = McmConfig.ConsMultipleFemaleFirst, IsAggressive = False)
	Else
		If Customer.HasKeyWordString("ActorTypeNPC")
			Int GenderCombination = GenderCombination(Target, Customer)
			If (GenderCombination == 2)
				Anims = SexLab.GetAnimationsByTags(2, McmConfig.ConsFoMTag, McmConfig.ConsFoMSupressTag, McmConfig.ConsFoMRequireAllTag)
			Elseif (GenderCombination == 3)
				Anims = SexLab.GetAnimationsByTags(2, McmConfig.ConsFoFTag, McmConfig.ConsFoFSupressTag, McmConfig.ConsFoFRequireAllTag)
			Endif
			TheScene = SexLabScene(Target, Customer, CustomAnimations = Anims, Tags = McmConfig.ConsTag, SupressTags = McmConfig.ConsSupressTag, TagsRequireAll = McmConfig.ConsRequireAllTag, FemaleFirst = McmConfig.ConsFemaleFirst, IsAggressive = False)
		Else
			TheScene = SexLabScene(Target, Customer, CustomAnimations = Anims, Tags = McmConfig.ConsCreatureTag, SupressTags = McmConfig.ConsCreatureSupressTag, TagsRequireAll = McmConfig.ConsCreatureRequireAllTag, IsAggressive = False)
		Endif
	Endif
	RegisterForModEvent("AnimationEnd_Defeat", "EndConsensual")
	TheScene.SetHook("Defeat")
	sslThreadController Thread = TheScene.StartThread()
EndFunction
Event EndR(string EventName, string argString, Float argNum, form sender)
	Actor[] SOInvolved = SexLab.HookActors(argString)
	Actor Receiver = SexLab.HookVictim(argString)
	Int i
	While (i < SOInvolved.Length)
		If SOInvolved[i]
			If (SOInvolved[i] == Receiver)
				If (Receiver != Player)
					SetSatisfied(SOInvolved[i], Type = "NPC")
					SendAnimationEvent(Receiver, GetStringValue(Receiver, "DefeatStateAnim"))
				Endif
			Elseif (SOInvolved[i] != Receiver) && (SOInvolved[i] != Player)
				If McmConfig.SOSatisfied
					SetSatisfied(SOInvolved[i], Type = "NPC")
				Endif
				AdjustIntValue(SOInvolved[i], "RapedBy"+Receiver, 1)
				Int PaidJob = GetIntValue(SOInvolved[i], "DefeatSOProstituteReward")
				If (PaidJob > 0)
					SOPayUp(Player, SOInvolved[i], PaidJob)
					UnsetIntValue(SOInvolved[i], "DefeatSOProstituteReward")
				Endif
	;			UnregisterForModEvent("AnimationEnd_Defeat")
				Return
			Endif
		Endif
		i += 1
	EndWhile
EndEvent
Event EndConsensual(string EventName, string argString, Float argNum, form sender)
	Actor[] SOInvolved = SexLab.HookActors(argString)
	Actor Receiver
	Int i
	While (i < SOInvolved.Length)
		If (GetIntValue(SOInvolved[i], "DefeatSOReceiver") == 1)
			Receiver = SOInvolved[i]
			UnsetIntValue(SOInvolved[i], "DefeatSOReceiver")
		Endif
		i += 1
	EndWhile
	i = 0
	While (i < SOInvolved.Length)
		If SOInvolved[i]
			If (SOInvolved[i] == Receiver)
				If (Receiver != Player)
					SetSatisfied(SOInvolved[i], Type = "NPC")
				Endif
			Elseif (SOInvolved[i] != Player)
				If McmConfig.SOSatisfied
					SetSatisfied(SOInvolved[i], Type = "NPC")
				Endif
				AdjustIntValue(SOInvolved[i], "RapedBy"+Receiver, 1)
				Int PaidJob = GetIntValue(SOInvolved[i], "DefeatSOProstituteReward")
				If (PaidJob > 0)
					SOPayUp(Player, SOInvolved[i], PaidJob)
					UnsetIntValue(SOInvolved[i], "DefeatSOProstituteReward")
				Endif
	;			UnregisterForModEvent("AnimationEnd_Defeat")
			Endif
		Endif
		i += 1
	EndWhile
EndEvent
Function SOPayUp(Actor Target, Actor Customer, Int HowMuch, Bool ActualTransfer = False)
	If ActualTransfer
		Customer.RemoveItem(Gold, HowMuch, akOtherContainer = Target)
	Else
		Target.Additem(Gold, HowMuch)
	Endif
EndFunction

Int[] SOXValues
Function SOSetDefaultSOXValues()
	SOXValues = new int[16]
	SOXValues[0] = -2 ; ElderRace
	SOXValues[1] = 3 ; NordRace 
	SOXValues[2] = 10 ; ImperialRace 
	SOXValues[3] = 6 ; BretonRace 
	SOXValues[4] = 6 ; RedguardRace 
	SOXValues[5] = 10 ; DarkElfRace
	SOXValues[6] = 3 ; HighElfRace 
	SOXValues[7] = 10 ; WoodElfRace
	SOXValues[8] = 3 ; OrcRace
	SOXValues[9] = 6 ; ArgonianRace
	SOXValues[10] = 10 ; KhajiitRace
	SOXValues[11] = 2 ; SOXLevel
	SOXValues[12] = 10 ; SOXGender
	SOXValues[13] = 20 ; SOXUnique
	SOXValues[14] = 30 ; SOXFaction
	SOXValues[15] = 25 ; SOXPure
EndFunction
Function SOSetSOXValues(Int[] TheArray)
	SOXValues = TheArray
EndFunction
Int[] Function SOGetSOXValues()
	Return SOXValues
EndFunction
Function SOSetXValues()
	String[] ValueMenu = New String[7]
	ValueMenu[0] = "$(Page 2) Races"
	ValueMenu[1] = "$Level > {"+SOXValues[11]+"}"
	ValueMenu[2] = "$Gender > {"+SOXValues[12]+"}"
	ValueMenu[3] = "$Unique > {"+SOXValues[13]+"}"
	ValueMenu[4] = "$Faction > {"+SOXValues[14]+"}"
	ValueMenu[5] = "$Pure > {"+SOXValues[15]+"}"
	Int Result = UILIB.ShowList("$Multipliers x level added to the maket value", ValueMenu, -1, -1)
	If (Result != -1)
		If (Result == 0)
			SOSetXRaceValues()
		Else
			String TheText = UILIB.ShowTextInput("$Enter a value for this multiplier, only numbers", "")
			If (TheText != "")
				Int Value = TheText As Int
				If (Value > 50)
					Value = 50
				Endif
				SOXValues[Result + 10] = Value
			Endif
		Endif
	Endif
EndFunction
Function SOSetXRaceValues()
	String[] ValueMenu = New String[12]
	ValueMenu[0] = "$(Page 1) Other"
	ValueMenu[1] = "$Elder > {"+SOXValues[0]+"}"
	ValueMenu[2] = "$Nord > {"+SOXValues[1]+"}"
	ValueMenu[3] = "$Imperial > {"+SOXValues[2]+"}"
	ValueMenu[4] = "$Breton > {"+SOXValues[3]+"}"
	ValueMenu[5] = "$Redguard > {"+SOXValues[4]+"}"
	ValueMenu[6] = "$Dark Elf > {"+SOXValues[5]+"}"
	ValueMenu[7] = "$High Elf > {"+SOXValues[6]+"}"
	ValueMenu[8] = "$Wood Elf > {"+SOXValues[7]+"}"
	ValueMenu[9] = "$Orc > {"+SOXValues[8]+"}"
	ValueMenu[10] = "$Argonian > {"+SOXValues[9]+"}"
	ValueMenu[11] = "$Khajiit > {"+SOXValues[10]+"}"
	Int Result = UILIB.ShowList("$Multipliers x level added to the maket value", ValueMenu, -1, -1)
	If (Result != -1)
		If (Result == 0)
			SOSetXValues()
		Else
			String TheText = UILIB.ShowTextInput("$Enter a value for this multiplier, only numbers", "")
			If (TheText != "")
				Int Value = TheText As Int
				If (Value > 50)
					Value = 50
				Endif
				SOXValues[Result - 1] = Value
			Endif
		Endif
	Endif
EndFunction