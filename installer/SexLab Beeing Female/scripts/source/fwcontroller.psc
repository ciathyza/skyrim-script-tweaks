Scriptname FWController extends Quest

FWSystem property System auto

float property Sperm_Min_Amount_For_Impregnation=0.0009 autoReadOnly
float property Sperm_Amount_For_Delete=0.0008 autoReadOnly

;/
; FUNCTION INDEX
; Function Name							Description
;--------------------------------------------------------------
; GetStoredFemaleCount					This Function will return the count of the stored woman
; GetStoredFemale						This function will return the stored women at position X
; CreateFemaleActor						Create Stats for the given Actor
; Impregnate							Forced Impregnation for the given Woman from the given Father (optional the number of the children)
; ImpregnateA							Forced Impregnation for the given Woman from the given Fathers (array - arraysize must be the Number of children - see Function Description)
; ActiveSpermImpregnation				Normal Impregnation from the active sperm if exists
; ActiveSpermImpregnationTimed			Normal Impregnation from the active sperm by the given time - if exists
; Unimpregnate							Removed the impregnation without child born
; UnimpregnateState						Removed the impregnation without child born and jump to the given phase
; GiveBirth								Force the woman to give birth
; DamageBaby							Damages the Baby with the given Damage
; HealBaby								Heals the Baby with the given amount
; AbortusBaby							Force an abortus
; AbortusBabyTimed						Force an abortus by given time
; AbortusState							Force an given abortus
; AbortusStateTimed						Force an given abortus at given time
; AddSperm								Add sperm to the given woman from the given man
; AddSpermTimed							Add sperm to the given woman from the given man at the given time
; RemoveSperm							removes all sperm from the woman from the given man
; RemoveAllSperm						removes all sperm from the woman from everyone
; ChangeState							changes the phase the woman is int
; HasRelevantSperm						returns if the woman has relevant sperm inside
; RelevantSpermCount					returns the number with relevant actors who has sperm inside the given woman
; GetRelevantSpermActors				returns an array with all relevant actors who has sperm inside the given woman
; GetRelevantSpermFloat					returns an array with actor relevance 
; HasRelevantSpermTimed					Check if the woman got relevant sperm for impregnation inside at the given time
; RelevantSpermCountTimed				returns the number of relevant sperm actors at the given time
; GetRelevantSpermActorsTimed			Get a list of actors that are most relevant at the given time
; GetRelevantSpermFloatTimed			
; HasSpermInWoman						Check if the given man got sperm in the given woman
; HasSpermInWomanTimed					Check if the given man had sperm in the given woman at the given time
; GetStatePercentage					Returns the percent (0.0 to 100.0) of the womans state
; GetStateEnterTime						Returns the time the woman enterd her state/phase
; GetBabyHealth							returns the health the given womans unborn baby got
; IsPregnant							returns if the woman is pregnant
; GetFemaleState						returns the state/phase the woman is in
; GetNumBirth							returns the number of birth the woman already had
; showInfoBox							open the ShowState window for the given woman
; setCanBecomePregnant					set the flag if the woman may become pregnant in her current cycle
; setCanBecomePMS						set the flag if the woman may become PMS in her current cycle
; setFlag								set the flag for the woman
; getContraception						returns the percent of contraception (0.0 to 100.00)
; getContraceptionTimed					returns the percent of contraception at the given time
; AddContraception						Add an amount of contraception
; AddContraceptionTimed					Add an amount of contraception at the given time
; GetContraceptionDuration				Returns the remaining time till the next pill is required
; GetContraceptionDurationTimed			Returns the remaining time till the next pill was required at the given time
; showRankedInfoBox						open the ShowStats window with the given rank
; showDescriptedRankedInfoBox			open the ShowStats window with the given rank as descripted text



; Full Function Description
;--------------------------------------------------------------
; This Function will return the count of the stored woman
; int function GetStoredFemaleCount()
;
; This function will return the stored women at position X
; actor function GetStoredFemale(int Position)
;
; Create Stats for the given Actor
; bool function CreateFemaleActor(actor woman)
;
; Forced Impregnation for the given Woman from the given Father (optional the number of the children)
; function Impregnate(actor Mother, actor Father, int NumChilds=1)
;
; Forced Impregnation for the given Woman from the given Fathers (array - arraysize must be the Number of children - see Function Description)
; function ImpregnateA(actor Mother, actor[] Fathers, int NumChilds=1)
;
; Normal Impregnation from the active sperm if exists
; bool function ActiveSpermImpregnation(actor Mother, bool bIgnoreContraception = false)
;
; Normal Impregnation from the active sperm by the given time - if exists
; bool function ActiveSpermImpregnationTimed(actor Mother, float Time, bool bIgnoreContraception = false)
;
; Removed the impregnation without child born
; function UnimpregnateState(actor Mother)
;
; Removed the impregnation without child born and jump to the given phase
; function UnimpregnateState(actor Mother, int Menstrual_Cycle_State)
;
; Force the woman to give birth
; function GiveBirth(actor Mother)
;
; Damages the Baby with the given Damage
; function DamageBaby(actor Mother,float Damage)
;
; Heals the Baby with the given amount
; function HealBaby(actor Mother,float Amount)
;
; Force an abortus
; function AbortusBaby(actor Mother)
;
; Add sperm to the given woman from the given man
; function AddSperm(actor Woman, actor PotentialFather, float amount = 1.0)
;
; Add sperm to the given woman from the given man at the given time
; function AddSperm(actor Woman, float Time, actor PotentialFather, float amount = 1.0)
;
; removes all sperm from the woman from the given man
; function RemoveSperm(actor Woman, actor Man)
;
; removes all sperm from the woman from everyone
; function RemoveAllSperm(actor Woman)
;
; changes the phase the woman is in
; function ChangeState(actor Woman, int NewState)
;
; changes the phase the woman is in based on the given time
; function ChangeStateTimed(actor female, float Time, int state_number)
;
; returns if the woman has relevant sperm inside
; bool function HasRelevantSperm(actor Woman, bool bShowTravelingSperm = true)
;
; returns the number with relevant actors who has sperm inside the given woman
; int function RelevantSpermCount(actor Woman, bool bShowTravelingSperm = true)
;
; returns an array with all relevant actors who has sperm inside the given woman
; Actor[] function GetRelevantSpermActors(actor Woman, bool bShowTravelingSperm = true, bool bSort = true)
;
; returns an array with actor relevance 
; float[] function GetRelevantSpermFloat(actor Woman, bool bShowTravelingSperm = true, bool bSort = true)
;
; Check if the woman got relevant sperm for impregnation inside at the given time
; bool function HasRelevantSperm(actor Woman, float Time, bool bShowTravelingSperm = true)
;
; returns the number of relevant sperm actors at the given time
; int function HasRelevantSperm(actor Woman, float Time, bool bShowTravelingSperm = true)
;
; Get a list of actors that are most relevant at the given time
; Actor[] function HasRelevantSperm(actor Woman, float Time, bool bShowTravelingSperm = true, bool bSort = true)
;
; GetRelevantSpermFloatTimed
; float[] function GetRelevantSpermFloatTimed(actor Woman, float Time, bool bShowTravelingSperm = true, bool bSort = true)
;			
; Check if the given man got sperm in the given woman
; bool function HasSpermInWoman(actor male, actor female=none, bool bShowTravelingSperm = true)
;
; Check if the given man had sperm in the given woman at the given time
; bool function HasSpermInWomanTimed(actor male, actor female=none, float Time, bool bShowTravelingSperm = true)
;
; Returns the percent (0.0 to 100.0) of the womans state
; Float Function GetStatePercentage(Actor woman)
;
; Returns the time the woman enterd her state/phase
; Float Function GetStateEnterTime(Actor woman)
;
; returns the health the given womans unborn baby got
; float function GetBabyHealth(actor woman)
;
; returns if the woman is pregnant
; bool function IsPregnant(actor woman)
;
; returns the state/phase the woman is in
; int function GetFemaleState(actor woman)
;
; returns the number of birth the woman already had
; int function GetNumBirth(actor woman)
;
; open the ShowState window for the given woman
; function showInfoBox(actor a)
;
; set the flag if the woman may become pregnant in her current cycle
; int function setCanBecomePregnant(actor woman, bool bActive)
;
; set the flag if the woman may become PMS in her current cycle
; int function setCanBecomePMS(actor woman, bool bActive)
;
; set the flag for the woman
; int function setFlag(actor woman, bool bCanBecomePregnant, bool bCanBecomePMS)
;
; returns the percent of contraception (0.0 to 100.00)
; float function getContraception(actor Woman)
;
; returns the percent of contraception at the given time
; float function getContraceptionTimed(actor Woman, float Time)
;
; Add an amount of contraception
; float function AddContraception(actor Woman, float Value)
;
; Returns the remaining time till the next pill is required
; float function GetContraceptionDuration(actor Woman)
;
; Returns the remaining time till the next pill was required at the given time
; float function GetContraceptionDurationTimed(Actor Woman, float Time)
;
; open the ShowStats window with the given rank
; function showRankedInfoBox(actor target, int Rank)
;
; open the ShowStats window with the given rank as descripted text
; function showDescriptedRankedInfoBox(actor target, int Rank)

/;


; This Function will return the count of the stored woman
int function GetStoredFemaleCount()
	return StorageUtil.FormListCount(none,"FW.SavedNPCs")
endFunction

; This function will return the stored women at position X
actor function GetStoredFemale(int Position)
	if Position <0 || Position >=StorageUtil.FormListCount(none,"FW.SavedNPCs")
		return none
	endif
	return StorageUtil.FormListGet(none,"FW.SavedNPCs",Position) as actor
endFunction


; Creating the Menstruation Cycle for this Actor
; returns false when there was an error
bool function CreateFemaleActor(actor woman, bool force_new=false)
	System.Trace("FWController.CreateFemaleActor",woman)
	if System.CloakingSpellEnabled.GetValueInt()!=1 || System.ModEnabled.GetValueInt()!=1
		return false
	endif
	if woman==none
		return false
	endif
	if System.IsValidateFemaleActor(woman)<=0
		return false
	endIf
	bool hasSaved = ( StorageUtil.FormListFind(none,"FW.SavedNPCs",woman)>=0 )
	If hasSaved==true && force_new==false
		return true
	endIf
	System.Message("Creating new woman stats for: "+woman.GetLeveledActorBase().GetName(), System.MSG_All)
	
	int stateID=Utility.RandomInt(0,3)
	Float currentTime = Utility.GetCurrentGameTime()
	float stateDuration = System.GetStateDuration(stateID,woman)
	Float stateEnterTime = currentTime - Utility.RandomFloat(0, stateDuration - 0.5)
	
	if woman == Game.GetPlayer()
		stateID=0
		stateEnterTime=currentTime - Utility.RandomFloat(0, stateDuration /2)
	endif
	
	int flag=0
	if System.canBecomePregnant(woman)
		flag+=1
	endIf
	if System.canBecomePMS(woman)
		flag+=2
	endIf
	
	StorageUtil.SetIntValue(woman,"FW.CurrentState",stateID)
	StorageUtil.SetFloatValue(woman,"FW.StateEnterTime",stateEnterTime)
	StorageUtil.SetFloatValue(woman,"FW.LastUpdate",currentTime)
	StorageUtil.SetIntValue(woman,"FW.Flags",flag)

	if hasSaved==false || force_new==true
		StorageUtil.FormListAdd(none,"FW.SavedNPCs",woman)
	endif
	
	return true
endFunction


; This function will impregnate the given actor and forcing the 1. Trimester-State
function Impregnate(actor Mother, actor Father, int NumChilds=1)
	System.Trace("FWController.Impregnate",Mother)
	if Mother!=Game.GetPlayer() && System.cfg.NPCCanBecomePregnant==false
		return
	endif
	if !System.CheckIsLoreFriendlyMetting(Mother, Father)
		return ; Not lore friendly
	endif
	Actor[] f= FWUtility.ActorArray(NumChilds)
	int i=0
	while i<NumChilds
		f[i]=Father
		i+=1
	endWhile
	ImpregnateA(Mother,f,NumChilds)
endFunction

; This function will impregnate the given actor by the given fathers and forcing the 1. Trimester-State
; For each Child the father must be given - for Exambple with 3 Childs
; Fathers[0] = Alvor
; Fathers[1] = Alvor
; Fathers[2] = Ulfric
function ImpregnateA(actor Mother, actor[] Fathers, int NumChilds=1)
	System.Trace("FWController.ImpregnateA",Mother)
	if Mother!=Game.GetPlayer() && System.cfg.NPCCanBecomePregnant==false
		return
	endif
	int cSperm=Fathers.length
	int xNumChilds=NumChilds
	if xNumChilds<=0
		xNumChilds = System.calculateNumChildren(Game.GetPlayer())
	endIf
	StorageUtil.FormListClear(Mother,"FW.ChildFather")
	StorageUtil.SetIntValue(Mother,"FW.NumChilds",xNumChilds)
	While xNumChilds>0
		xNumChilds -= 1
		actor tFather = Fathers[Utility.RandomInt(0, cSperm - 1)]
		if System.CheckIsLoreFriendlyMetting(Mother, tFather)
			StorageUtil.FormListAdd(Mother,"FW.ChildFather", tFather )
		endif
	EndWhile
	StorageUtil.SetFloatValue(Mother,"FW.UnbornHealth",100.0)
	StorageUtil.UnsetIntValue(Mother,"FW.Abortus")
	System.Manager.OnImpregnate(Mother, NumChilds,Fathers)
	ChangeState(Mother,4)
endFunction

; Check for the normal impregnation, using the sperm, the value if she can become pregnant in this cycle, and so on.
bool function ActiveSpermImpregnation(actor Mother, bool bIgnoreContraception = false)
	System.Trace("FWController.ActiveSpermImpregnation",Mother)
	return ActiveSpermImpregnationTimed(Mother, Utility.GetCurrentGameTime(), bIgnoreContraception)
endFunction

; Check for the normal impregnation at the given time, using the sperm, the value if she can become pregnant in this cycle, and so on.
bool function ActiveSpermImpregnationTimed(actor Mother, float Time, bool bIgnoreContraception = false)
	System.Trace("FWController.ActiveSpermImpregnationTimed",Mother)
	;Debug.Trace("ActiveSpermImpregnationTimed 01 - "+Time)
	if Mother!=Game.GetPlayer() && System.cfg.NPCCanBecomePregnant==false
		return false
	endif
	bool bCanBecomePregnant=canBecomePregnant(Mother)
	if bCanBecomePregnant==false
		return false
	endif
	if bIgnoreContraception==false
		ContraceptionSpermKillTimed(Mother,Time)
	endIf
	;Debug.Trace("ActiveSpermImpregnationTimed 02")
	if System.Controller.HasRelevantSpermTimed(Mother,Time,false)
		;Debug.Trace("ActiveSpermImpregnationTimed 03 - Has relevant sperm")
		if System.Manager.ActorCanBecomePregnant(Mother)==true
			;Debug.Trace("ActiveSpermImpregnationTimed 04 - can become pregnant")
			; Impregnate by active sperm
			int numChild=System.calculateNumChildren(Mother)
			if numChild==0
				return false
			endIf
			;Debug.Trace("ActiveSpermImpregnationTimed 05 - "+numChild)
			actor[] a=System.Controller.GetRelevantSpermActorsTimed(Mother,Time,false,false)
			float[] relevantSperm=GetRelevantSpermFloatTimed(Mother,Time, false, false)
			if relevantSperm.length==0
				return false
			endif
			;actor[] fathers= FWUtility.ActorArray(numChild)
			int c=relevantSperm.length
			if c==0
				return false
			endif
			int i=0
			float relevanceTotal=0.0
			while i<c
				relevanceTotal+=relevantSperm[i]
				;Debug.Trace("["+Mother.GetLeveledActorBase().GetName()+"] Relevant sperm ["+i+"] = "+relevantSperm[i])
				i+=1
			endWhile
			;Debug.Trace("["+Mother.GetLeveledActorBase().GetName()+"] Relevant sperm total = "+relevanceTotal)
			;Debug.Trace("ActiveSpermImpregnationTimed 06 - spermTotal: "+relevanceTotal)
			
			StorageUtil.SetIntValue(Mother,"FW.NumChilds",numChild)
			actor[] Fathers = FWUtility.ActorArray(numChild)
			while numChild>0
				numChild-=1
				float rnd_r= Utility.RandomFloat(0,relevanceTotal)
				int j=0
				while rnd_r>=relevantSperm[j] && j<c
					rnd_r-=relevantSperm[j]
					j+=1
				endWhile
				StorageUtil.FormListAdd(Mother,"FW.ChildFather", a[j])
				Fathers[numChild]=a[j]
			endWhile
			StorageUtil.SetFloatValue(Mother,"FW.UnbornHealth",100.0)
			StorageUtil.UnsetIntValue(Mother,"FW.Abortus")
			System.Manager.OnImpregnate(Mother, Fathers.length,Fathers)
			ChangeStateTimed(Mother,Time,4)
			return true
		else
			;Debug.Trace("ActiveSpermImpregnationTimed 04 - can't become pregnant")
		endIf
	else
		;Debug.Trace("ActiveSpermImpregnationTimed 03 - Has no relevant sperm")
	endIf
	return false
endFunction

; A Speed-Up variant for ActiveSpermImpregnation - without calculating the contraception-value
bool function ActiveSpermImpregnationContraception(actor Mother, float contraception)
	System.Trace("FWController.ActiveSpermImpregnationContraception",Mother)
	return ActiveSpermImpregnationNoContraceptionTimed(Mother, Utility.GetCurrentGameTime(), contraception)
endFunction

; A Speed-Up variant for ActiveSpermImpregnationTimed - without calculating the contraception-value
bool function ActiveSpermImpregnationNoContraceptionTimed(actor Mother, float Time, float contraception)
	System.Trace("FWController.ActiveSpermImpregnationContraceptionTimed",Mother)
	if Mother!=Game.GetPlayer() && System.cfg.NPCCanBecomePregnant==false
		return false
	endif
	bool bCanBecomePregnant=canBecomePregnant(Mother)
	if bCanBecomePregnant==false
		return false
	endif
	
	int sa= StorageUtil.FormListCount(Mother, "FW.SpermName") ;StorageUtil.FloatListCount(Mother, "FW.SpermAmount")
	while sa>0
		sa-=1
		float amo = StorageUtil.FloatListGet(Mother, "FW.SpermAmount", sa)
		if amo>0.3
			int rnd1= Utility.RandomInt(0,3)
			float rnd2
			if rnd1==0
				rnd2 = Utility.RandomFloat(1,95.0)
			elseif rnd1==1
				rnd2 = Utility.RandomFloat(10.0,100.0)
			elseif rnd1==2
				rnd2 = Utility.RandomFloat(20.0,100.0)
			elseif rnd1==3
				rnd2 = Utility.RandomFloat(40.0,100.0)
			endIf
			if contraception>rnd2
				StorageUtil.FloatListSet(Mother, "FW.SpermAmount", sa, 0.1)
			endif
		endif
	endWhile
	
	if System.Controller.HasRelevantSpermTimed(Mother,Time,false)
		if System.Manager.ActorCanBecomePregnant(Mother)==true
			; Impregnate by active sperm
			int numChild=System.calculateNumChildren(Mother)
			if numChild==0
				return false
			endIf
			actor[] a= System.Controller.GetRelevantSpermActorsTimed(Mother,Time,false,false)
			float[] relevantSperm= GetRelevantSpermFloatTimed(Mother,Time, false, false)
			if relevantSperm.length==0
				return false
			endif
			;actor[] fathers= FWUtility.ActorArray(numChild)
			float relevanceTotal=0.0
			int c=relevantSperm.length
			if c==0
				return false
			endif
			int i=0
			while i<c
				relevanceTotal+=relevantSperm[i]
				i+=1
			endWhile
			
			StorageUtil.SetIntValue(Mother,"FW.NumChilds",numChild)
			actor[] Fathers= FWUtility.ActorArray(numChild)
			while numChild>0
				numChild-=1
				float rnd_r= Utility.RandomFloat(0,relevanceTotal)
				int j=0
				while rnd_r>relevantSperm[j]
					rnd_r-=relevantSperm[j]
					j+=1
				endWhile
				StorageUtil.FormListAdd(Mother,"FW.ChildFather", a[j])
				Fathers[numChild]=a[j]
			endWhile
			StorageUtil.SetFloatValue(Mother,"FW.UnbornHealth",100.0)
			System.Manager.OnImpregnate(Mother, Fathers.length,Fathers)
			ChangeStateTimed(Mother,Time,4)
			return true
		endIf
	endIf
	return false
endFunction

; Returns the number of Babys the given woman is pregnant with
int function getNumBabys(actor Mother)
	return StorageUtil.GetIntValue(Mother,"FW.NumChilds",0)
endFunction

bool function setNumBabys(actor Mother,int num)
	Debug.Trace("FWController::setNumBabys("+Mother.GetLeveledActorBase().GetName()+", "+num+")")
	int cur = StorageUtil.GetIntValue(Mother,"FW.NumChilds",0)
	if cur==0
		Debug.Trace("- Actor not pregnant")
		return false
	else
		if cur==num
			; same value
			Debug.Trace("- No changes")
			return true
		elseif cur<num
			; add fathers
			Debug.Trace("- Raise from "+cur+" to "+num+" Babys")
			StorageUtil.SetIntValue(Mother,"FW.NumChilds",num)
			actor father = StorageUtil.FormListGet(Mother,"FW.ChildFather", 0) as actor
			int i=cur
			while i<cur
				Debug.Trace("- Father for Baby "+i+" is "+father.GetLeveledActorBase().GetName())
				StorageUtil.FormListAdd(Mother,"FW.ChildFather", father)
				i+=1
			endWhile
			return true
		elseif cur>num
			Debug.Trace("- Drop from "+cur+" to "+num+" Babys")
			
			; remove fathers
			StorageUtil.SetIntValue(Mother,"FW.NumChilds",num)
			int i=StorageUtil.FormListCount(Mother,"FW.ChildFather")
			while i>num
				i-=1
				Debug.Trace("- Remove Father "+i+": "+(StorageUtil.FormListGet(Mother,"FW.ChildFather", i) as actor).GetLeveledActorBase().GetName())
				StorageUtil.FormListRemoveAt(Mother,"FW.ChildFather", i)
			endWhile
			return true
		endif
	endif
endFunction

; This function will wash out some sperm depending on the MCM settings
; Type definition:
; WashOutType 0: without auxiliary material or any help
; WashOutType 1: when swining
; WashOutType 2: with a bottle of washout fluid or something like that
;
; Strength is a multiplyer - by default it's 1.0, so Itemwithsoudscript's tha chance setting in the mcm menu
function WashOutSperm(actor woman, int WashOutType = 1, float Strength=1.0)
	System.Trace("FWController.WashOutSperm",woman)
	float chance=0
	if Strength<=0
		return
	endif
	if WashOutType==0
		chance = System.cfg.WashOutChance
	elseif WashOutType==1
		chance = System.cfg.WashOutWaterChance
	elseif WashOutType==2
		chance = System.cfg.WashOutFluidChance
	endif
	if chance>0
		int c = StorageUtil.FormListCount(woman, "FW.SpermName");StorageUtil.FloatListCount(woman, "FW.SpermTime")
		int j = 0
		float rnd
		float Time = Utility.GetCurrentGameTime()
		while c>0
			c-=1
			rnd = Utility.RandomFloat(0.00001,1.0)
			float STime = StorageUtil.FloatListGet(woman, "FW.SpermTime", c)
			if STime + System.Data.SpermDeleteTime > Time || STime+System.cfg.WashOutHourDelay >= Time
				if (chance * Strength)>=rnd
					; Sperm was to old - remove
					StorageUtil.FloatListRemoveAt(woman, "FW.SpermTime", c)
					StorageUtil.FormListRemoveAt(woman, "FW.SpermName", c)
					StorageUtil.FloatListRemoveAt(woman, "FW.SpermAmount", c)
				elseif Utility.RandomInt(0,100)>34
					float amount=StorageUtil.FloatListGet(woman, "FW.SpermAmount", c)
					amount-=Utility.RandomFloat(0.0,0.15 * Strength)
					if amount < Sperm_Min_Amount_For_Impregnation
						; To less sperm, remove
						StorageUtil.FloatListRemoveAt(woman, "FW.SpermTime", c)
						StorageUtil.FormListRemoveAt(woman, "FW.SpermName", c)
						StorageUtil.FloatListRemoveAt(woman, "FW.SpermAmount", c)
					else
						StorageUtil.FloatListSet(woman, "FW.SpermAmount", c, amount)
					endif
				endif
			endIf
		endWhile
	endif
endfunction

function ContraceptionSpermKill(actor Woman)
	System.Trace("FWController.ContraceptionSpermKill",Woman)
	ContraceptionSpermKillTimed(Woman, Utility.GetCurrentGameTime())
endFunction

function ContraceptionSpermKillTimed(actor Woman, float Time)
	System.Trace("FWController.ContraceptionSpermKillTimed",Woman)
	float contraception = getContraceptionTimed(Woman,Time)
	int c= StorageUtil.FormListCount(woman, "FW.SpermName");StorageUtil.FloatListCount(Woman, "FW.SpermAmount")
	while c>0
		c-=1
		float amo = StorageUtil.FloatListGet(Woman, "FW.SpermAmount", c)
		if amo>Sperm_Min_Amount_For_Impregnation
			int rnd1= Utility.RandomInt(0,3)
			float rnd2
			if rnd1==0
				rnd2 = Utility.RandomFloat(1,95.0)
			elseif rnd1==1
				rnd2 = Utility.RandomFloat(10.0,100.0)
			elseif rnd1==2
				rnd2 = Utility.RandomFloat(20.0,100.0)
			elseif rnd1==3
				rnd2 = Utility.RandomFloat(40.0,100.0)
			endIf
			
			if contraception>rnd2
				StorageUtil.FloatListSet(Woman, "FW.SpermAmount", c, Sperm_Min_Amount_For_Impregnation)
			elseif contraception > 20
				StorageUtil.FloatListSet(Woman, "FW.SpermAmount", c, amo - (contraception * 0.002))
			endif
		endif
	endWhile
endFunction


; This function will unimpregnate the woman and forcing the replanish state
function Unimpregnate(actor Mother)
	System.Trace("FW Debug: FWController.Unimpregnate",Mother)
	UnimpregnateState(Mother,0)
endFunction


; This function will unimpregnate the woman and changing to the given menstrual-cycle-state
function UnimpregnateState(actor Mother, int Menstrual_Cycle_State)
	System.Trace("FW Debug: FWController.UnimpregnateState",Mother)
	If (StorageUtil.FormListFind(none,"FW.SavedNPCs",Mother)<0)
		CreateFemaleActor(Mother)
	EndIf
	StorageUtil.FormListClear(Mother,"FW.ChildFather")
	StorageUtil.SetIntValue(Mother,"FW.NumChilds",0)
	StorageUtil.UnsetIntValue(Mother,"FW.Abortus")
	StorageUtil.UnsetFloatValue(Mother,"FW.UnbornHealth")
	StorageUtil.UnsetFloatValue(Mother,"FW.AbortusTime")
	int xMenstrual_Cycle_State=Menstrual_Cycle_State
	if xMenstrual_Cycle_State<0 || xMenstrual_Cycle_State>3
		xMenstrual_Cycle_State=0
	endIf
	if Mother==Game.GetPlayer()
		System.Player.NumChilds = 0
		System.Player.changeState(xMenstrual_Cycle_State)
		System.Player.SetBelly()
	else
		StorageUtil.SetFloatValue(Mother,"FW.StateEnterTime", Utility.GetCurrentGameTime());
		StorageUtil.SetIntValue(Mother,"FW.CurrentState", xMenstrual_Cycle_State)
		int flag=0
		if System.canBecomePregnant(Mother)
			flag+=1
		endIf
		if System.canBecomePMS(Mother)
			flag+=2
		endIf
		StorageUtil.SetIntValue(Mother,"FW.Flags",flag)
		System.raiseModEventA("Update",Mother)
	endIf
endFunction


; This function will force the birth for the given pregnant woman
; The given Woman must be pregnant already
function GiveBirth(actor Mother)
	System.Trace("FW Debug: FWController.GiveBirth",Mother)
	If (StorageUtil.FormListFind(none,"FW.SavedNPCs",Mother)<0)
		;CreateFemaleActor(Mother)
		return; never was initialised - so can't be pregnant
	EndIf
	
	int NumChilds = StorageUtil.GetIntValue(Mother,"FW.NumChilds",0)
	if NumChilds==0
		return;
	EndIf
	System.Manager.OnGiveBirthStart(Mother)
	Mother.EvaluatePackage()
	float UnbornHealth=StorageUtil.GetFloatValue(Mother,"FW.UnbornHealth",100.0)
	Actor[] ChildFather = FWUtility.ActorArray(NumChilds)
	int k=NumChilds
	while k>0
		k-=1
		ChildFather[k]=StorageUtil.FormListGet(Mother,"FW.ChildFather",k) as actor
	endWhile
	float IntervalBabyScale = System.Manager.getActorDuration_BabySpawn(Mother)
	float IntervalLaborScale = System.Manager.getActorDuration_BetweenLaborPains(Mother)
	float BirthPainDamageScale=System.getDamageScale(4,Mother)
	float DamageScale = 1.0 * BirthPainDamageScale
	if Mother.IsOnMount() == true
		Mother.Dismount()
		Mother.SetVehicle(none)
		Utility.Wait(3)
	endIf
	if Mother==Game.GetPlayer()
		FWUtility.LockPlayer()
		System.Manager.StartCamera()
	else
		Mother.SetDontMove(true)
	endIf
	
	Form[] dropedItems
	if(System.cfg.PlayAnimations)
		dropedItems = System.StripActor(Mother)
	
		bool useBed = System.LayDown(Mother)
		if useBed == true
			DamageScale -= 0.1
		endIf
	endif
	
	ObjectReference MaraShrine = Game.FindClosestReferenceOfTypeFromRef(System.MaraShrineObject, Mother, 300);
	if MaraShrine != none
		DamageScale -= 0.1 ; Mara loves us all
	endIf
	ObjectReference ArkayShrine = Game.FindClosestReferenceOfTypeFromRef(System.ArkayShrineObject, Mother, 300);
	if ArkayShrine != none
		DamageScale -= 0.3 ; Arkay is helping with birth
	endIf
	
	if(System.cfg.PlayAnimations)
		Utility.Wait(3*IntervalLaborScale)
		Debug.SendAnimationEvent(Mother, "Birth_S1")
	
		System.Mimik(Mother, "Pained", 50)
		System.PlayPainSound(Mother)
		System.doDamage(Mother, 8 * DamageScale ,10)
		Utility.Wait(3*IntervalLaborScale)
	endif
	
	System.Mimik(Mother, "Pained", 60)
	System.PlayPainSound(Mother,40)
	System.DoDamage(Mother, 11 * DamageScale ,10)
	; Raise the values
	int NumBirth = StorageUtil.GetIntValue(Mother,"FW.NumBirth")
	int NumBabys = StorageUtil.GetIntValue(Mother,"FW.NumBabys")
	NumBirth+=1
	NumBabys+=NumChilds
	StorageUtil.SetIntValue(Mother,"FW.NumBirth",NumBirth)
	StorageUtil.SetIntValue(Mother,"FW.NumBabys",NumBabys)
	FWUtility.ActorAddSpell(Mother,System.Effect_VaginalBloodLow,false,true)
	while NumChilds > 0
		NumChilds -= 1
		Utility.Wait(4*IntervalBabyScale)
		
		System.Mimik(Mother, "Pained", 30)
		
		if(System.cfg.PlayAnimations)
			Debug.SendAnimationEvent(Mother, "Birth_S2");
			Utility.Wait(1)
			int j = 8
			Debug.SendAnimationEvent(Mother, "Birth_S3");
			System.Mimik(Mother, "Pained", 40)
			while j > 0
				System.PlayPainSound(Mother)
				System.DoDamage(Mother,9 * DamageScale,10)
				Utility.Wait(2*IntervalBabyScale)
				j -= 1
			endWhile
			System.Mimik(Mother, "Pained", 20)
		
			;Debug.SendAnimationEvent(Mother, "Birth_S3");
			Utility.Wait(2*IntervalBabyScale)
			System.Mimik(Mother, "Pained", 80)
		else
			int j = 4
			while j > 0
				System.DoDamage(Mother,16 * DamageScale,10)
				Utility.Wait(1*IntervalBabyScale)
				j -= 1
			endWhile
		endif
		
		System.PlayPainSound(Mother,60)
		System.DoDamage(Mother,18 * DamageScale,9)
		float HealthRnd = Utility.RandomFloat(0.0,35.0)
		if UnbornHealth > HealthRnd || System.cfg.abortus==false
			;System.raiseModEvent("FWSpawnChild",self)
			FWUtility.ActorAddSpell(Mother,System.Effect_VaginalBloodBig,false,true)
			System.SpawnChild(Mother,ChildFather[NumChilds])
		else
			System.Message("You've born a dead child...", System.MSG_ALWAYS)
			; Child is death >.<
		endIf
		
		if(System.cfg.PlayAnimations)
			Utility.Wait(1)
			Debug.SendAnimationEvent(Mother, "Birth_S1")
		endif
		Utility.Wait(2)
		System.Mimik(Mother, "Pained", 80)
		StorageUtil.SetIntValue(Mother,"FW.NumChilds",NumChilds)
		if NumChilds==0
			SetBelly(Mother,true)
		else
			SetBelly(Mother,false)
		endIf
		Utility.Wait(3*IntervalBabyScale)
	endWhile
	System.Mimik(Mother, "Happy", 30)
	
	StorageUtil.UnsetFloatValue(Mother,"FW.UnbornHealth")
	StorageUtil.FormListClear(Mother,"FW.ChildFather")
	StorageUtil.UnsetFloatValue(Mother,"FW.AbortusTime")
	Utility.Wait(2)
	; Clear expressions
	
	if(System.cfg.PlayAnimations)
		System.GetUp(Mother)
		System.UnstripActor(Mother,dropedItems)
	endif
	System.Manager.OnGiveBirthEnd(Mother)
	Mother.EvaluatePackage()
	
	if Mother==Game.GetPlayer()
		FWUtility.UnlockPlayer()
		System.Manager.StopCamera()
	else
		Mother.SetDontMove(false)
		Mother.AddItem(System.ContraceptionMid,3)
		Mother.AddItem(System.ContraceptionLow,12)
	endIf
	
	System.Mimik(Mother)
	;changeState(Mother,8)
	StorageUtil.SetIntValue(Mother,"FW.CurrentState",8)
	StorageUtil.SetFloatValue(Mother,"FW.StateEnterTime", Utility.GetCurrentGameTime())
	SendModEvent("BeeingFemale","Update", Mother.GetFormID())
endFunction

; Forcing a Belly-Refresh for the given actor
function SetBelly(actor Woman, bool ForceNPC=true)
	System.Trace("FWController.SetBelly",Woman)
	if Woman==Game.GetPlayer()
		System.Player.SetBelly()
	elseif ForceNPC==true
		System.raiseModEventA("Belly",Woman)
	endIf
endFunction


; This function will damage the unborn child of the given mother
function DamageBaby(actor Mother,float Damage)
	System.Trace("FWController.DamageBaby",Mother)
	If (StorageUtil.FormListFind(none,"FW.SavedNPCs",Mother)<0)
		;CreateFemaleActor(Mother)
		return; never was initialised - so can't be pregnant
	EndIf
	if StorageUtil.GetIntValue(Mother, "FW.Abortus",0)>1
		; Abortus has already been started
		return
	endif
	int s = StorageUtil.GetIntValue(Mother,"FW.CurrentState",0)
	if s<4 && s==8
		; Not pregnant or in replenish
		return
	endif
	float hp = StorageUtil.GetFloatValue(Mother, "FW.UnbornHealth",100.0)
	
	if Damage>0
		Damage*=System.Manager.ActorBabyDamageScale(Mother)
	else
		Damage*=System.Manager.ActorBabyHealingScale(Mother)
	endif
	
	if Damage>0
		if System.cfg.Difficulty == 0 ; Painless
			Damage *= 0.4
		elseif System.cfg.Difficulty == 1 ; Easy
			Damage *= 0.7
		elseif System.cfg.Difficulty == 3 ; Advanced
			Damage *= 1.3
		elseif System.cfg.Difficulty == 4 ; Heavy
			Damage *= 1.7
		endIf
	endif
	
	if hp - Damage<0.0
		hp=0
	elseif hp - Damage >100.0
		hp=100
	else
		hp-=Damage
	endIf
	StorageUtil.SetFloatValue(Mother, "FW.UnbornHealth",hp)
	if Game.GetPlayer() == Mother
		System.Player.checkAbortus()
		System.BabyHealthWidget.showTimed(Mother)
	else
		SendModEvent("BeeingFemale","CheckAbortus",Mother.GetFormID())
	endIf
endFunction


function SetBabyHealth(actor Mother,float value)
	If (StorageUtil.FormListFind(none,"FW.SavedNPCs",Mother)<0)
		;CreateFemaleActor(Mother)
		return; never was initialised - so can't be pregnant
	EndIf
	if StorageUtil.GetIntValue(Mother, "FW.Abortus",0)>1
		; Abortus has already been started
		return
	endif
	int s = StorageUtil.GetIntValue(Mother,"FW.CurrentState",0)
	if s<4 && s==8
		; Not pregnant or in replenish
		return
	endif
	if value<0.0
		value=0
	elseif value >100.0
		value=100
	endIf
	StorageUtil.SetFloatValue(Mother, "FW.UnbornHealth",value)
	if Game.GetPlayer() == Mother
		System.Player.checkAbortus()
		System.BabyHealthWidget.showTimed(Mother)
	else
		SendModEvent("BeeingFemale","CheckAbortus",Mother.GetFormID())
	endIf
endFunction


; This function will heal the unborn child of the given mother
function HealBaby(actor Mother,float Healing)
	System.Trace("FWController.HealBaby",Mother)
	If (StorageUtil.FormListFind(none,"FW.SavedNPCs",Mother)<0)
		;CreateFemaleActor(Mother)
		return; never was initialised - so can't be pregnant
	EndIf
	if StorageUtil.GetIntValue(Mother, "FW.Abortus",0)>1
		; Abortus has already been started
		return
	endif
	int s = StorageUtil.GetIntValue(Mother,"FW.CurrentState",0)
	if s<4 && s==8
		; Not pregnant or in replenish
		return
	endif
	float hp = StorageUtil.GetFloatValue(Mother, "FW.UnbornHealth",100.0)
	if Healing>0
		Healing*=System.Manager.ActorBabyHealingScale(Mother)
	else
		Healing*=System.Manager.ActorBabyDamageScale(Mother)
	endif
	if hp + Healing < 0.0
		hp=0.0
	elseif hp + Healing >100.0
		hp=100.0
	else
		hp+=Healing
	endIf
	StorageUtil.SetFloatValue(Mother, "FW.UnbornHealth",hp)
	if Game.GetPlayer() == Mother
		System.Player.checkAbortus()
	else
		SendModEvent("BeeingFemale","CheckAbortus",Mother.GetFormID())
	endIf
endFunction


; This function will force an abortus to the given mother
function AbortusBaby(actor Mother)
	System.Trace("FWController.AbortusBaby",Mother)
	If (StorageUtil.FormListFind(none,"FW.SavedNPCs",Mother)<0)
		;CreateFemaleActor(Mother)
		return; never was initialised - so can't be pregnant
	EndIf
	int s = StorageUtil.GetIntValue(Mother,"FW.CurrentState",0)
	if s<4 && s==8
		; Not pregnant or in replenish
		return
	endif
	if StorageUtil.GetIntValue(Mother, "FW.NumChilds",0)>0
		StorageUtil.SetFloatValue(Mother, "FW.UnbornHealth",0.0)
		StorageUtil.SetIntValue(Mother, "FW.Abortus",2)
		StorageUtil.SetFloatValue(Mother, "FW.AbortusTime", Utility.GetCurrentGameTime())
		if Game.GetPlayer() == Mother
			System.Player.checkAbortus()
		else
			SendModEvent("BeeingFemale","CheckAbortus",Mother.GetFormID())
		endIf
	endif
endFunction
function AbortusBabyTimed(actor Mother,Float Time)
	System.Trace("FWController.AbortusBabyTimed",Mother)
	If (StorageUtil.FormListFind(none,"FW.SavedNPCs",Mother)<0)
		;CreateFemaleActor(Mother)
		return; never was initialised - so can't be pregnant
	EndIf
	int s = StorageUtil.GetIntValue(Mother,"FW.CurrentState",0)
	if s<4 && s==8
		; Not pregnant or in replenish
		return
	endif
	if StorageUtil.GetIntValue(Mother, "FW.NumChilds",0)>0
		StorageUtil.SetFloatValue(Mother, "FW.UnbornHealth",0.0)
		StorageUtil.SetIntValue(Mother, "FW.Abortus",2)
		StorageUtil.SetFloatValue(Mother, "FW.AbortusTime", Time)
		if Game.GetPlayer() == Mother
			System.Player.checkAbortus()
		else
			SendModEvent("BeeingFemale","CheckAbortus",Mother.GetFormID())
		endIf
	endif
endFunction


function AbortusState(actor Mother, int Abortus_State)
	System.Trace("FWController.AbortusState",Mother)
	If (StorageUtil.FormListFind(none,"FW.SavedNPCs",Mother)<0)
		;CreateFemaleActor(Mother)
		return; never was initialised - so can't be pregnant
	EndIf
	int s = StorageUtil.GetIntValue(Mother,"FW.CurrentState",0)
	if s<4 && s==8
		; Not pregnant or in replenish
		return
	endif
	if StorageUtil.GetIntValue(Mother, "FW.NumChilds",0)>0
		StorageUtil.SetFloatValue(Mother, "FW.UnbornHealth",0.0)
		StorageUtil.SetIntValue(Mother, "FW.Abortus",Abortus_State)
		StorageUtil.SetFloatValue(Mother, "FW.AbortusTime", Utility.GetCurrentGameTime())
		if Game.GetPlayer() == Mother
			System.Player.checkAbortus()
		else
			SendModEvent("BeeingFemale","CheckAbortus",Mother.GetFormID())
		endIf
	endif
endFunction

function AbortusStateTimed(actor Mother, float Time, int Abortus_State)
	System.Trace("FWController.AbortusStateTimed",Mother)
	If (StorageUtil.FormListFind(none,"FW.SavedNPCs",Mother)<0)
		;CreateFemaleActor(Mother)
		return; never was initialised - so can't be pregnant
	EndIf
	int s = StorageUtil.GetIntValue(Mother,"FW.CurrentState",0)
	if s<4 && s==8
		; Not pregnant or in replenish
		return
	endif
	if StorageUtil.GetIntValue(Mother, "FW.NumChilds",0)>0
		StorageUtil.SetFloatValue(Mother, "FW.UnbornHealth",0.0)
		StorageUtil.SetIntValue(Mother, "FW.Abortus",Abortus_State)
		StorageUtil.SetFloatValue(Mother, "FW.AbortusTime", Time)
		if Game.GetPlayer() == Mother
			System.Player.checkAbortus()
		else
			SendModEvent("BeeingFemale","CheckAbortus",Mother.GetFormID())
		endIf
	endif
endFunction


; This function will add sperm to the given mother from the given father
function AddSperm(actor Woman, actor PotentialFather, float amount = 1.0)
	System.Trace("FWController.AddSperm",Woman)
	If (StorageUtil.FormListFind(none,"FW.SavedNPCs",Woman)<0)
		CreateFemaleActor(Woman)
	EndIf
	; Set last Sex-Time
	StorageUtil.SetFloatValue(Woman, "FW.LastSexTime", Utility.GetCurrentGameTime())
	StorageUtil.SetFloatValue(PotentialFather, "FW.LastSexTime", Utility.GetCurrentGameTime())
	
	; Add sperm to woman
	float tmp_amount=amount * System.Manager.ActorSpermAmountScale(PotentialFather)
	if !System.CheckIsLoreFriendlyMetting(Woman, PotentialFather)
		tmp_amount=Sperm_Amount_For_Delete ; Not lore friendly - sperm can't impregnate
	endif
	StorageUtil.FloatListAdd(Woman,"FW.SpermTime", Utility.GetCurrentGameTime())
	StorageUtil.FormListAdd(Woman,"FW.SpermName", PotentialFather)
	StorageUtil.FloatListAdd(Woman,"FW.SpermAmount", tmp_amount)
	
	; If the player is the Male Actor, show the stats widget
	if PotentialFather==Game.GetPlayer()
		System.StateWidget.showTimed(PotentialFather)
	endif
endFunction

float function GetDaysSinceLastSex(actor a)
	float LastSexTime = 0.0
	float L1 = StorageUtil.FloatListGet(a, "SexLabSkills", 17)
	float L2 = StorageUtil.GetFloatValue(a, "FW.LastSexTime")
	if L1>L2
		LastSexTime = L1
	else
		LastSexTime = L2
	endif
	return Utility.GetCurrentGameTime() - LastSexTime
endFunction

float function GetLastSexTime(actor a)
	float L1 = StorageUtil.FloatListGet(a, "SexLabSkills", 17)
	float L2 = StorageUtil.GetFloatValue(a, "FW.LastSexTime")
	if L1>L2
		return L1
	else
		return L2
	endif
endFunction

; This function will add sperm to the given mother from the given father
function AddSpermTimed(actor Woman, float Time, actor PotentialFather, float amount = 1.0)
	System.Trace("FWController.AddSpermTimed",Woman)
	If (StorageUtil.FormListFind(none,"FW.SavedNPCs",Woman)<0)
		CreateFemaleActor(Woman)
	EndIf
	; Set last Sex-Time
	StorageUtil.SetFloatValue(Woman, "FW.LastSexTime", Utility.GetCurrentGameTime())
	StorageUtil.SetFloatValue(PotentialFather, "FW.LastSexTime", Utility.GetCurrentGameTime())
	
	; Add sperm to woman
	float tmp_amount=amount * System.Manager.ActorSpermAmountScale(PotentialFather)
	if !System.CheckIsLoreFriendlyMetting(Woman, PotentialFather)
		tmp_amount=Sperm_Amount_For_Delete ; Not lore friendly - sperm can't impregnate
	endif
	StorageUtil.FloatListAdd(Woman,"FW.SpermTime", Time)
	StorageUtil.FormListAdd(Woman,"FW.SpermName", PotentialFather)
	StorageUtil.FloatListAdd(Woman,"FW.SpermAmount", tmp_amount)
	
	; If the player is the Male Actor, show the stats widget
	if PotentialFather==Game.GetPlayer()
		System.StateWidget.showTimed(PotentialFather)
	endif
endFunction


; This function will remove all sperm from the given woman she got from the given 'potential father'
function RemoveSperm(actor Woman, actor PotentialFather)
	System.Trace("FWController.RemoveSperm",Woman)
	If (StorageUtil.FormListFind(none,"FW.SavedNPCs",Woman)<0)
		return;
	EndIf
	int c= StorageUtil.FormListCount(woman, "FW.SpermName");StorageUtil.FormListCount(Woman,"FW.SpermName")
	while c>0
		c-=1
		if StorageUtil.FormListGet(Woman,"FW.SpermName",c)==PotentialFather
			StorageUtil.FormListRemoveAt(Woman,"FW.SpermName",c)
			StorageUtil.FloatListRemoveAt(Woman,"FW.SpermTime",c)
			StorageUtil.FloatListRemoveAt(Woman,"FW.SpermAmount",c)
		EndIf
	endWhile
endFunction


; This function will remove all sperm from the given woman
function RemoveAllSperm(actor Woman)
	System.Trace("FWController.RemoveAllSperm",Woman)
	If (StorageUtil.FormListFind(none,"FW.SavedNPCs",Woman)<0)
		return
	EndIf
	StorageUtil.FormListClear(Woman,"FW.SpermName")
	StorageUtil.FloatListClear(Woman,"FW.SpermTime")
	StorageUtil.FloatListClear(Woman,"FW.SpermAmount")
endFunction


; This function will change the state to the given state
; If the woman is not pregnant: 0 = Fullicular Phase; 1 = Ovulation; 2 = Luteal Phase; 3 = Menstruation
; If the woman is pregnant: 0 = 1st Trimester; 1 = 2nd Trimester; 2 = 3rd Trimester; 3 = Labor Pains; 4 = Replanish
; Changing to replanish will automaticle unimpregnate the woman
function ChangeState(actor female, int state_number)
	System.Trace("FWController.ChangeState",female)
	If (StorageUtil.FormListFind(none,"FW.SavedNPCs",female)<0)
		CreateFemaleActor(female)
	EndIf
	if female!=Game.GetPlayer() && System.cfg.NPCCanBecomePregnant==false && state_number>=4 && state_number <10
		return
	endif
	
	int abortus = StorageUtil.GetIntValue(female, "FW.Abortus",0)
	;                 Trimester 1        Trimester 2        Trimester 3                            Labor pains
	if (abortus > 1 && (state_number==4 || state_number==5 || state_number==6)) || (abortus > 2 && state_number==7)
		; Failed to change state - woman got an abortus
		return
	endif
	
	StorageUtil.SetIntValue(female,"FW.CurrentState",state_number)
	StorageUtil.SetFloatValue(female,"FW.StateEnterTime", Utility.GetCurrentGameTime())
	
	setIrregulation(female, state_number)
	
	if Game.GetPlayer() == female
		System.StateWidget.showTimed(true)
		System.Player.currentState = state_number
		System.Player.stateEnterTime = Utility.GetCurrentGameTime()
	else
		SendModEvent("BeeingFemale","Update", female.GetFormID())
	endIf
endFunction

function setIrregulation(actor female,int state_number)
	System.Trace("FWController.setIrregulation", female)
	float newIrregulation=1.0
	if System.IrregulationChance(female, state_number) > Utility.RandomFloat(0,1.01)
		newIrregulation*=System.IrregulationValue(female, state_number)
	endif
	StorageUtil.SetFloatValue(female,"FW.Irregulation",newIrregulation)
endfunction


function ChangeStateTimed(actor female, float Time, int state_number)
	System.Trace("FWController.ChangeStateTimed",female)
	If (StorageUtil.FormListFind(none,"FW.SavedNPCs",female)<0)
		CreateFemaleActor(female)
	EndIf
	if female!=Game.GetPlayer() && System.cfg.NPCCanBecomePregnant==false && state_number>=4 && state_number <10
		return
	endif
	setIrregulation(female, state_number)
	StorageUtil.SetIntValue(female,"FW.CurrentState",state_number)
	StorageUtil.SetFloatValue(female,"FW.StateEnterTime", Time)
	if Game.GetPlayer() == female
		System.Player.currentState = state_number
		System.Player.stateEnterTime = Time
	else
		SendModEvent("BeeingFemale","Update", female.GetFormID())
	endIf
endFunction


int function GetNextState(actor female)
	If (StorageUtil.FormListFind(none,"FW.SavedNPCs",female)<0)
		CreateFemaleActor(female)
	EndIf
	int cs = GetFemaleState(female)
	if(cs==0 || cs==1 || cs==2) ; folikel phase
		return cs+1
	elseif(System.cfg.NPCCanBecomePregnant == true || Game.GetPlayer() == female) && cs < 7 && cs > 3
		return cs+1
	else ; Replanish, Menstruating and disabled NPC Pregnancy
		return 0
	endif
endFunction


; Return if the actor is paused
bool function IsPaused(actor Woman)
	System.Trace("FWController.IsPaused", Woman)
	return StorageUtil.GetFloatValue(Woman, "FW.PauseTime", 0.0)>0
endfunction


; Pause the given actor
function Pause(actor Woman, bool bPaused)
	System.Trace("FWController.Pause", Woman)
	if bPaused==true
		StorageUtil.SetFloatValue(Woman, "FW.PauseTime", Utility.GetCurrentGameTime())
		if Woman == Game.GetPlayer()
			System.Player.PauseStartTime=Utility.GetCurrentGameTime()
		endIf
	else
		float start = StorageUtil.GetFloatValue(Woman, "FW.StateEnterTime",0)
		float pause = StorageUtil.GetFloatValue(Woman, "FW.PauseTime",0)
		StorageUtil.UnsetFloatValue(Woman, "FW.PauseTime")
		float cur = start + (Utility.GetCurrentGameTime() - pause)
		StorageUtil.SetFloatValue(Woman, "FW.StateEnterTime", cur)
		if Game.GetPlayer() == Woman
			System.Player.stateEnterTime = cur
			System.Player.PauseStartTime = 0
		else
			SendModEvent("BeeingFemale","Update", Woman.GetFormID())
		endIf
	endif
endfunction


; Check if the woman got relevant sperm for impregnation inside
bool function HasRelevantSperm(actor Woman, bool bShowTravelingSperm = false)
	System.Trace("FWController.HasRelevantSperm", Woman)
	return HasRelevantSpermTimed(Woman, Utility.GetCurrentGameTime(),bShowTravelingSperm)
endFunction


; Returns the number of relevant actors that have sperm inside
int function RelevantSpermCount(actor Woman, bool bShowTravelingSperm = false)
	System.Trace("FWController.RelevantSpermCount", Woman)
	return RelevantSpermCountTimed(Woman, Utility.GetCurrentGameTime(), bShowTravelingSperm)
endFunction


; Get a list of actors that are most relevant
actor[] function GetRelevantSpermActors(actor Woman, bool bShowTravelingSperm = false, bool bSort=true)
	System.Trace("FWController.GetRelevantSpermActors", Woman)
	return GetRelevantSpermActorsTimed(Woman, Utility.GetCurrentGameTime(), bShowTravelingSperm, bSort)
endfunction


;
float[] function GetRelevantSpermFloat(actor Woman, bool bShowTravelingSperm = false, bool bSort=true)
	System.Trace("FWController.GetRelevantSpermFloat", Woman)
	return GetRelevantSpermFloatTimed(Woman, Utility.GetCurrentGameTime(), bShowTravelingSperm, bSort)
endFunction


; Check if the woman got relevant sperm for impregnation inside at the given time
bool function HasRelevantSpermTimed(actor woman,float Time, bool bShowTravelingSperm = false)
	System.Trace("FWController.HasRelevantSpermTimed", woman)
	If (StorageUtil.FormListFind(none,"FW.SavedNPCs",woman)<0)
		CreateFemaleActor(woman)
	EndIf
	int c = StorageUtil.FormListCount(woman, "FW.SpermName") ;StorageUtil.FloatListCount(woman, "FW.SpermName")
	;Debug.Trace("HasRelevantSpermTimed "+woman.GetLeveledActorBase().GetName()+" info")
	;Debug.Trace("Check "+c+"Entries")
	while c>0
		c-=1
		float STime = StorageUtil.FloatListGet(woman, "FW.SpermTime", c)
		actor SName = (StorageUtil.FormListGet(woman, "FW.SpermName", c) As Actor)
		float SAmou = StorageUtil.FloatListGet(woman, "FW.SpermAmount", c)
		;Debug.Trace("Sperm["+c+"] is from "+SName.GetLeveledActorBase().GetName())
		;Debug.Trace(STime+" + "+System.getMaleSpermDuration(SName)+" > "+Time+" && ("+STime+" + "+System.cfg.WashOutHourDelay+" < "+Time+" || "+bShowTravelingSperm+") && "+SAmou+" > 0.01")
		;Debug.Trace((STime+System.getMaleSpermDuration(SName))+" > "+Time+" && ("+(STime+System.cfg.WashOutHourDelay)+" < "+Time+" || "+bShowTravelingSperm+") && "+SAmou+" > 0.01")
		;Debug.Trace((STime+System.getMaleSpermDuration(SName)>Time)+" && ("+(STime+System.cfg.WashOutHourDelay<Time)+" || "+bShowTravelingSperm+") && "+(SAmou>0.01))
		
		if STime + System.getMaleSpermDuration(SName) > Time && (STime+System.cfg.WashOutHourDelay < Time || bShowTravelingSperm) && SAmou>=Sperm_Min_Amount_For_Impregnation && System.CheckIsLoreFriendlyMetting(woman, SName)
			return true
		endIf
	endWhile
	return false
endFunction


; Returns the number of relevant actors that have sperm inside at the given time
int function RelevantSpermCountTimed(actor woman,float Time, bool bShowTravelingSperm = false)
	System.Trace("FWController.RelevantSpermCountTimed", woman)
	If (StorageUtil.FormListFind(none,"FW.SavedNPCs",woman)<0)
		CreateFemaleActor(woman)
	EndIf
	int c = StorageUtil.FormListCount(woman, "FW.SpermName") ;StorageUtil.FormListCount(woman, "FW.SpermName")
	int j = 0
	while c>0
		c-=1
		float STime = StorageUtil.FloatListGet(woman, "FW.SpermTime", c)
		actor SName = (StorageUtil.FormListGet(woman, "FW.SpermName", c) As Actor)
		float SAmou = StorageUtil.FloatListGet(woman, "FW.SpermAmount", c)
		if STime + System.getMaleSpermDuration(SName) > Time && (STime+System.cfg.WashOutHourDelay < Time || bShowTravelingSperm) && SAmou>=Sperm_Min_Amount_For_Impregnation && System.CheckIsLoreFriendlyMetting(woman, SName)
			j+=1
		endIf
	endWhile
	return j
endFunction


; Get a list of actors that are most relevant at the given time
actor[] function GetRelevantSpermActorsTimed(actor woman,float Time, bool bShowTravelingSperm = false, bool bSort = true)
	System.Trace("FWController.GetRelevantSpermActorsTimed", woman)
	If (StorageUtil.FormListFind(none,"FW.SavedNPCs",woman)<0)
		CreateFemaleActor(woman)
	EndIf
	int c = StorageUtil.FormListCount(woman, "FW.SpermName");StorageUtil.FormListCount(woman, "FW.SpermName")
	actor[] actors
	bool bFirst=true
	if c==0
		return actors
	endif
	if bSort==false || c==1
		while c>0
			c-=1
			float STime = StorageUtil.FloatListGet(woman, "FW.SpermTime", c)
			actor SName = (StorageUtil.FormListGet(woman, "FW.SpermName", c) As Actor)
			float SAmou = StorageUtil.FloatListGet(woman, "FW.SpermAmount", c)
			float maxSDuration = System.getMaleSpermDuration(SName)
			
			;Debug.Trace("Sperm["+c+"] is from "+SName.GetLeveledActorBase().GetName())
			;Debug.Trace(STime+" + "+maxSDuration+" > "+Time+" && ("+STime+" + "+System.cfg.WashOutHourDelay+" < "+Time+" || "+bShowTravelingSperm+") && "+SAmou+" > "+0.01)
			;Debug.Trace((STime + maxSDuration)+" > "+Time+" && ("+(STime+System.cfg.WashOutHourDelay)+" < "+Time+" || "+bShowTravelingSperm+") && "+SAmou+" > 0.01")
			;Debug.Trace((STime + maxSDuration > Time)+" && ("+(STime+System.cfg.WashOutHourDelay < Time)+" || "+bShowTravelingSperm+") && "+(SAmou>0.01))
			
			if STime + maxSDuration > Time && (STime+System.cfg.WashOutHourDelay < Time || bShowTravelingSperm==true) && SAmou>=Sperm_Min_Amount_For_Impregnation && System.CheckIsLoreFriendlyMetting(woman, SName)
				;FWUtility.ActorArrayAppend(actors, SName)
				if bFirst==true
					actors=new Actor[1]
					actors[0]=SName
					bFirst=false
				else
					;sslUtility.PushActor(SName,actors)
					actors=FWUtility.ActorArrayAppend(actors, SName)
				endif
			endif
		endwhile
	else
		float[] actorr
		while c>0
			c-=1
			float STime = StorageUtil.FloatListGet(woman, "FW.SpermTime", c)
			actor SName = (StorageUtil.FormListGet(woman, "FW.SpermName", c) As Actor)
			float SAmou = StorageUtil.FloatListGet(woman, "FW.SpermAmount", c)
			float maxSDuration = System.getMaleSpermDuration(SName)
			
			;Debug.Trace("Sperm["+c+"] is from "+SName.GetLeveledActorBase().GetName())
			;Debug.Trace(STime+" + "+maxSDuration+" > "+Time+" && ("+STime+" + "+System.cfg.WashOutHourDelay+" < "+Time+" || "+bShowTravelingSperm+") && "+SAmou+" > "+0.01)
			;Debug.Trace((STime + maxSDuration)+" > "+Time+" && ("+(STime+System.cfg.WashOutHourDelay)+" < "+Time+" || "+bShowTravelingSperm+") && "+SAmou+" > 0.01")
			;Debug.Trace((STime + maxSDuration > Time)+" && ("+(STime+System.cfg.WashOutHourDelay < Time)+" || "+bShowTravelingSperm+") && "+(SAmou>0.01))
		
			if STime + maxSDuration > Time && (STime+System.cfg.WashOutHourDelay < Time || bShowTravelingSperm==true) && SAmou>=Sperm_Min_Amount_For_Impregnation && System.CheckIsLoreFriendlyMetting(woman, SName)
				float SpermDurationPercent = (Time - STime) / maxSDuration
				float xScale = 1.0
				if SpermDurationPercent>0.65
					xScale-=SpermDurationPercent - 0.65
				endIf
				;FWUtility.ActorArrayAppend(actors, SName)
				;FWUtility.FloatArrayAppend(actorr, System.GetSpermRelevance(woman, SName) * SAmou * xScale)
				if bFirst==true
					actors=new Actor[1]
					actors[0]=SName
					actorr=new Float[1]
					actorr[0]=System.GetSpermRelevance(woman, SName) * SAmou * xScale
					bFirst=false
				else
					;sslUtility.PushActor(SName,actors)
					;sslUtility.PushFloat(System.GetSpermRelevance(woman, SName) * SAmou * xScale,actorr)
					actors=FWUtility.ActorArrayAppend(actors, SName)
					actorr=FWUtility.FloatArrayAppend(actorr, System.GetSpermRelevance(woman, SName) * SAmou * xScale)
				endif
			endif
		endwhile
		
		int bi=1
		int bj
		int bc=actors.length ; Count
		bool bl=true ; Flag
		actor ba ; Temp
		float bf ; Temp
		while bi<=bc && bl
			bl=false
			bj=0
			while bj<bc - 1
				if actorr[bj+1]>actorr[bj]
					ba=actors[bj]
					actors[bj]=actors[bj+1]
					actors[bj+1]=ba
					bf=actorr[bj]
					actorr[bj]=actorr[bj+1]
					actorr[bj+1]=bf
					bl=true
				endIf
				bj+=1
			endWhile
			bi+=1
		endWhile
	endif
	
	return actors
	
	;int j = 0
	;while c>0
	;	c-=1
	;	float STime = StorageUtil.FloatListGet(woman, "FW.SpermTime", c)
	;	actor SName = (StorageUtil.FormListGet(woman, "FW.SpermName", c) As Actor)
	;	float SAmou = StorageUtil.FloatListGet(woman, "FW.SpermAmount", c)
	;	if STime + System.getMaleSpermDuration(SName) > Time && (STime+System.cfg.WashOutHourDelay < Time || bShowTravelingSperm) && SAmou>0.01
	;		j+=1
	;	endIf
	;endWhile
	;if j>0
	;	actor[] actors = FWUtility.ActorArray(FWUtility.MinInt(64,j))
	;	float[] actorr = FWUtility.FloatArray(actors.length)
	;	int i = 0
	;	if bSort==true
	;		while i<j && i<actors.length
	;			float STime = StorageUtil.FloatListGet(woman, "FW.SpermTime", c)
	;			actor SName = (StorageUtil.FormListGet(woman, "FW.SpermName", c) As Actor)
	;			float SAmou = StorageUtil.FloatListGet(woman, "FW.SpermAmount", c)
	;			float maxSDuration = System.getMaleSpermDuration(SName)
	;			if STime + maxSDuration > Time && (STime+System.cfg.WashOutHourDelay < Time || bShowTravelingSperm==true) && SAmou>0.01
	;				float SpermDurationPercent = (Time - STime) / maxSDuration
	;				float xScale = 1.0
	;				if SpermDurationPercent>0.65
	;					xScale-=SpermDurationPercent - 0.65
	;				endIf
	;				actors[i] = SName
	;				actorr[i] = System.GetSpermRelevance(woman, SName) * SAmou * xScale
	;			endIf
	;			i+=1
	;		endWhile
	;	elseif bSort==false
	;		while i<j && i<actors.length
	;			float STime = StorageUtil.FloatListGet(woman, "FW.SpermTime", c)
	;			actor SName = (StorageUtil.FormListGet(woman, "FW.SpermName", c) As Actor)
	;			float SAmou = StorageUtil.FloatListGet(woman, "FW.SpermAmount", c)
	;			float maxSDuration = System.getMaleSpermDuration(SName)
	;			if STime + maxSDuration > Time && (STime+System.cfg.WashOutHourDelay < Time || bShowTravelingSperm==true) && SAmou>0.01
	;				actors[i] = SName
	;			endIf
	;			i+=1
	;		endWhile
	;	endif
	;	
	;	if bSort==false
	;		return actors
	;	endIf
	;	
	;	; Using Bubble Sort DESC to order by relevance
	;	int bi=1
	;	int bj
	;	int bc=actors.length ; Count
	;	bool bl=true ; Flag
	;	actor ba ; Temp
	;	float bf ; Temp
	;	while bi<=bc && bl
	;		bl=false
	;		bj=0
	;		while bj<bc - 1
	;			if actorr[bj+1]>actorr[bj]
	;				ba=actors[bj]
	;				actors[bj]=actors[bj+1]
	;				actors[bj+1]=ba
	;				bf=actorr[bj]
	;				actorr[bj]=actorr[bj+1]
	;				actorr[bj+1]=bf
	;				bl=true
	;			endIf
	;			bj+=1
	;		endWhile
	;		bi+=1
	;	endWhile
	;
	;	return actors
	;else
	;	return none
	;endIf
endfunction


; Get a list of actors that are most relevant at the given time
float[] function GetRelevantSpermFloatTimed(actor woman,float Time, bool bShowTravelingSperm = false, bool bSort=true)
	System.Trace("FWController.GetRelevantSpermFloatTimed", woman)
	If (StorageUtil.FormListFind(none,"FW.SavedNPCs",woman)<0)
		CreateFemaleActor(woman)
	EndIf
	int c = StorageUtil.FormListCount(woman, "FW.SpermName");StorageUtil.FormListCount(woman, "FW.SpermAmount")
	float[] actorr
	if c==0
		return actorr
	endif
	
	while c>0
		c-=1
		float STime = StorageUtil.FloatListGet(woman, "FW.SpermTime", c)
		actor SName = (StorageUtil.FormListGet(woman, "FW.SpermName", c) As Actor)
		float SAmou = StorageUtil.FloatListGet(woman, "FW.SpermAmount", c)
		float maxSDuration = System.getMaleSpermDuration(SName)
		
		;Debug.Trace("Sperm["+c+"] is from "+SName.GetLeveledActorBase().GetName())
		;Debug.Trace(STime+" + "+maxSDuration+" > "+Time+" && ("+STime+" + "+System.cfg.WashOutHourDelay+" < "+Time+" || "+bShowTravelingSperm+") && "+SAmou+" > "+0.01)
		;Debug.Trace((STime + maxSDuration)+" > "+Time+" && ("+(STime+System.cfg.WashOutHourDelay)+" < "+Time+" || "+bShowTravelingSperm+") && "+SAmou+" > 0.01")
		;Debug.Trace((STime + maxSDuration > Time)+" && ("+(STime+System.cfg.WashOutHourDelay < Time)+" || "+bShowTravelingSperm+") && "+(SAmou>0.01))
		
		if STime + maxSDuration > Time && (STime+System.cfg.WashOutHourDelay < Time || bShowTravelingSperm==true) && SAmou>=Sperm_Min_Amount_For_Impregnation && System.CheckIsLoreFriendlyMetting(woman, SName)
			float SpermDurationPercent = (Time - STime) / maxSDuration
			float xScale = 1.0
			if SpermDurationPercent>0.65
				xScale-=SpermDurationPercent - 0.65
			endIf
			actorr=FWUtility.FloatArrayAppend(actorr, System.GetSpermRelevance(woman, SName) * SAmou * xScale)
		endif
	endwhile
	if bSort==false
		int bi=1
		int bj
		int bc=actorr.length ; Count
		bool bl=true ; Flag
		actor ba ; Temp
		float bf ; Temp
		while bi<=bc && bl
			bl=false
			bj=0
			while bj<bc - 1
				if actorr[bj+1]>actorr[bj]
					bf=actorr[bj]
					actorr[bj]=actorr[bj+1]
					actorr[bj+1]=bf
					bl=true
				endIf
				bj+=1
			endWhile
			bi+=1
		endWhile
	endif
	
	return actorr

	;int c = StorageUtil.FloatListCount(woman, "FW.SpermTime")
	;int j = 0
	;while c>0
	;	c-=1
	;	float STime = StorageUtil.FloatListGet(woman, "FW.SpermTime", c)
	;	actor SName = (StorageUtil.FormListGet(woman, "FW.SpermName", c) As Actor)
	;	float SAmou = StorageUtil.FloatListGet(woman, "FW.SpermAmount", c)
	;	if STime + System.getMaleSpermDuration(SName) > Time && (STime+System.cfg.WashOutHourDelay < Time || bShowTravelingSperm) && SAmou>0.01
	;		j+=1
	;	endIf
	;endWhile
	;if j>0
	;	float[] actorr = FWUtility.FloatArray(FWUtility.MinInt(64,j))
	;	int i = 0
	;	while i<j && i<actorr.length
	;		float STime = StorageUtil.FloatListGet(woman, "FW.SpermTime", c)
	;		actor SName = (StorageUtil.FormListGet(woman, "FW.SpermName", c) As Actor)
	;		float SAmou = StorageUtil.FloatListGet(woman, "FW.SpermAmount", c)
	;		float maxSDuration = System.getMaleSpermDuration(SName) ; Get the Duration the sperm can survive
	;		if STime + maxSDuration > Time && (STime+System.cfg.WashOutHourDelay < Time || bShowTravelingSperm) && SAmou>0.01
	;			float SpermDurationPercent = (Time - STime) / maxSDuration
	;			float xScale = 1.0
	;			if SpermDurationPercent>0.65
	;				xScale-=SpermDurationPercent - 0.65
	;			endIf
	;			actorr[i] = System.GetSpermRelevance(woman, SName) * SAmou * xScale
	;		endIf
	;		i+=1
	;	endWhile
	;	
	;	if bSort==false
	;		return actorr
	;	endIf
	;	
	;	; Using Bubble Sort DESC to order by relevance
	;	int bi=1
	;	int bj
	;	int bc=actorr.length ; Count
	;	bool bl=true ; Flag
	;	float bf ; Temp
	;	while bi<=bc && bl
	;		bl=false
	;		bj=0
	;		while bj<bc - 1
	;			if actorr[bj+1]>actorr[bj]
	;				bf=actorr[bj]
	;				actorr[bj]=actorr[bj+1]
	;				actorr[bj+1]=bf
	;				bl=true
	;			endIf
	;			bj+=1
	;		endWhile
	;		bi+=1
	;	endWhile
	;	
	;	return actorr
	;else
	;	return none
	;endIf
endfunction


; Check if the woman got sperm from 'potential father' inside
; If female is none - all saved females will be checked
bool function HasSpermInWoman(actor male, actor female=none, bool bShowTravelingSperm = true)
	System.Trace("FWController.HasSpermInWoman", male)
	return HasSpermInWomanTimed(male,female, Utility.GetCurrentGameTime(), bShowTravelingSperm)
endFunction


; Check if the woman got sperm from 'potential father' inside
; If female is none - all saved females will be checked
bool function HasSpermInWomanTimed(actor male, actor female=none, float Time, bool bShowTravelingSperm = true)
	;System.Trace("FW Debug: FWController.HasSpermInWomanTimed", male)
	If (StorageUtil.FormListFind(none,"FW.SavedNPCs",female)<0) && female!=none
		CreateFemaleActor(female)
	EndIf
	float SpermDuration = System.getMaleSpermDuration(male)
	if female==none
		int femaleCount= StorageUtil.FormListCount(none,"FW.SavedNPCs")
		while femaleCount>0
			femaleCount-=1
			actor tmpFemale= StorageUtil.FormListGet(none,"FW.SavedNPCs",femaleCount) as Actor
			int i = StorageUtil.FormListFind(tmpFemale,"FW.SpermName",male)
			if i >0
				int j=StorageUtil.FormListCount(tmpFemale, "FW.SpermName");StorageUtil.FormListCount(tmpFemale,"FW.SpermName")
				while j>0
					j-=1
					if StorageUtil.FormListGet(tmpFemale,"FW.SpermName",j)==male
						; Found sperm from the male - now check if the time is relevant
						float STime=StorageUtil.FloatListGet(tmpFemale,"FW.SpermTime",j)
						if STime+SpermDuration > Time && (STime+System.cfg.WashOutHourDelay < Time || bShowTravelingSperm)
							return true
						endIf
					endIf
				endWhile
			endIf
		endWhile
	else
		int i = StorageUtil.FormListFind(female,"FW.SpermName",male)
		if i >=0
			int j= StorageUtil.FormListCount(female, "FW.SpermName");StorageUtil.FormListCount(female,"FW.SpermName")
			while j>0
				j-=1
				if StorageUtil.FormListGet(female,"FW.SpermName",j)==male
					; Found sperm from the male - now check if the time is relevant
					float STime=StorageUtil.FloatListGet(female,"FW.SpermTime",j)
					if STime+SpermDuration > Time && (STime+System.cfg.WashOutHourDelay < Time || bShowTravelingSperm)
						return true
					endIf
				endIf
			endWhile
		endIf
	endIf
	return false
endFunction

; Returns all actors the woman came has sperm inside
; When "bShowTravelingSperm" is false, only the sperms that can impregnate the woman will be shown
actor[] function getWomansWithSperm(actor Male, bool bShowTravelingSperm = true)
	System.Trace("FWController.getWomansWithSperm",Male)
	return getWomansWithSpermTimed(Male, Utility.GetCurrentGameTime(), bShowTravelingSperm)
endfunction

; Returns all actors the woman came has sperm inside at the given time
; When "bShowTravelingSperm" is false, only the sperms that can impregnate the woman will be shown
Actor[] function getWomansWithSpermTimed(actor Male, float Time, bool bShowTravelingSperm = true)
	;System.Trace("FWController.getWomansWithSpermTimed", Male)
	float SpermDuration = System.getMaleSpermDuration(male)
	Actor[] tmp=new Actor[128]
	int femaleCount= StorageUtil.FormListCount(none,"FW.SavedNPCs")
	int i=0
	int c=0
	while i<femaleCount && c <128
		actor woman = StorageUtil.FormListGet(none,"FW.SavedNPCs",i) as actor
		if StorageUtil.FormListFind(woman,"FW.SpermName", Male)>=0
			; Got sperm inside
			int j= StorageUtil.FormListCount(woman, "FW.SpermName");StorageUtil.FormListCount(woman,"FW.SpermName")
			while j>0 && c <128
				j-=1
				if StorageUtil.FormListGet(woman,"FW.SpermName",j)==male
					float STime=StorageUtil.FloatListGet(woman,"FW.SpermTime",j)
					if STime+SpermDuration > Time && (STime+System.cfg.WashOutHourDelay < Time || bShowTravelingSperm)
						tmp[c]=woman
						c+=1
						j=0
					endIf
				endif
			endwhile
		endif
		i+=1
	endwhile
	Actor[] res= FWUtility.ActorArray(c)
	i=0
	while i<c
		res[i]=tmp[i]
		i+=1
	endwhile
	return res
endfunction

; Returns the percent value of the womans currenr phase
; Range is from 0.0 to 1.0 (1.0 = 100%)
Float Function GetStatePercentage(Actor woman)
	;System.Trace("FWController.GetStatePercentage", Woman)
	If (StorageUtil.FormListFind(none,"FW.SavedNPCs",woman)<0)
		CreateFemaleActor(woman)
	EndIf
	int stateID = StorageUtil.GetIntValue(woman, "FW.CurrentState",0)
	Float duration = System.GetStateDuration(stateID, woman)
	If duration > 0.0
		Return (Utility.GetCurrentGameTime() - GetStateEnterTime(woman)) / duration
	EndIf
	
	Return 0.0
EndFunction

; Returns the Game-Time the woman enters the current phase
Float Function GetStateEnterTime(Actor woman)
	;System.Trace("FWController.GetStateEnterTime",woman)
	If (StorageUtil.FormListFind(none,"FW.SavedNPCs",woman)<0)
		CreateFemaleActor(woman)
	EndIf	
	Return StorageUtil.GetFloatValue(woman, "FW.StateEnterTime")
EndFunction


; Returns the health of the unborn child
float function GetBabyHealth(actor woman)
	;System.Trace("GetBabyHealth",woman)
	If (StorageUtil.FormListFind(none,"FW.SavedNPCs",woman)<0)
		CreateFemaleActor(woman)
	EndIf
	return StorageUtil.GetFloatValue(woman,"FW.UnbornHealth",100.0)
endFunction


; returns if the mother is pregnant
bool function IsPregnant(actor woman)
	;System.Trace("FWController.IsPregnant",woman)
	If (StorageUtil.FormListFind(none,"FW.SavedNPCs",woman)<0)
		CreateFemaleActor(woman)
	EndIf
	return StorageUtil.GetIntValue(woman,"FW.CurrentState",0)>=4
endFunction


; returns the state the woman is in
int function GetFemaleState(actor woman)
	;System.Trace("FWController.GetFemaleState",woman)
	If (StorageUtil.FormListFind(none,"FW.SavedNPCs",woman)<0)
		CreateFemaleActor(woman)
	EndIf
	return StorageUtil.GetIntValue(woman,"FW.CurrentState",0)
endFunction


; returns the number of birth the actor already gave
int function GetNumBirth(actor woman)
	;System.Trace("FWController.GetNumBirth",woman)
	If (StorageUtil.FormListFind(none,"FW.SavedNPCs",woman)<0)
		CreateFemaleActor(woman)
	EndIf
	return StorageUtil.GetIntValue(woman,"FW.NumBirth",0)
endFunction


; Open a MessageBox with all informations
function showInfoBox(actor a)
	;System.Trace("FWController.showInfoBox",a)
	showRankedInfoBox(a,100)
endFunction


; Set the "can become pregnant" flag
; Returns the Flag value
int function setCanBecomePregnant(actor woman, bool bActive)
	;System.Trace("FWController.setCanBecomePregnant", woman)
	If (StorageUtil.FormListFind(none,"FW.SavedNPCs",woman)<0)
		CreateFemaleActor(woman)
	EndIf
	int flag = StorageUtil.GetIntValue(woman, "FW.Flags",0)
	if Math.LogicalAnd(flag,1)==1 && bActive==false
		; Remove flag
		Flag -= 1
	elseif Math.LogicalAnd(flag,1)!=1 && bActive==true
		; Add Flag
		Flag += 1
	endif
	StorageUtil.SetIntValue(woman, "FW.Flags",flag)
	return flag
endFunction


; Set the "can become pms" flag
; Returns the Flag value
int function setCanBecomePMS(actor woman, bool bActive)
	System.Trace("FWController.setCanBecomePMS",woman)
	If (StorageUtil.FormListFind(none,"FW.SavedNPCs",woman)<0)
		CreateFemaleActor(woman)
	EndIf
	int flag = StorageUtil.GetIntValue(woman, "FW.Flags",0)
	if Math.LogicalAnd(flag,2)==2 && bActive==false
		; Remove flag
		Flag -= 2
	elseif Math.LogicalAnd(flag,2)!=2 && bActive==true
		; Add Flag
		Flag += 2
	endif
	StorageUtil.SetIntValue(woman, "FW.Flags",flag)
	return flag
endFunction

; This funciton will overwrite the "can become pregnant in this cycle" and the
; "can become PMS in this cycle" flag depending on the function arguments
; Returns the flag value
int function setFlag(actor woman, bool bCanBecomePregnant, bool bCanBecomePMS)
	;System.Trace("FWController.setFlag", woman)
	If (StorageUtil.FormListFind(none,"FW.SavedNPCs",woman)<0)
		CreateFemaleActor(woman)
	EndIf
	int flag=0
	if bCanBecomePregnant==true
		flag+=1
	endIf
	if bCanBecomePMS==true
		flag+=2
	endIf
	StorageUtil.SetIntValue(woman, "FW.Flags",flag)
	return flag
endFunction

; This funciton will set the "can become pregnant in this cycle" and the
; "can become PMS in this cycle" flag depending on the configuration
; Returns the flag value
int function setAutoFlag(actor Woman)
	;System.Trace("FWController.setAutoFlag", Woman)
	return setFlag(Woman, System.canBecomePregnant(Woman), System.canBecomePMS(Woman))
endFunction

; Returns true if the given woman will become pregnant in the current cycle
bool function canBecomePregnant(actor Woman)
	;System.Trace("FWController.canBecomePregnant", Woman)
	int flag = StorageUtil.GetIntValue(woman, "FW.Flags",0)
	return Math.LogicalAnd(flag,1)==1
endFunction

; Returns true if the given woman will become PMS in the current cycle
bool function canBecomePMS(actor Woman)
	System.Trace("FWController.canBecomePMS", Woman)
	int flag = StorageUtil.GetIntValue(woman, "FW.Flags",0)
	return Math.LogicalAnd(flag,2)==2
endFunction


; Get the amount of contraception
; (result is 0.0 to 98 .... or 0.0 to System.MaxContraception)
float function getContraception(actor Woman)
	;System.Trace("FWController.getContraception", Woman)
	return getContraceptionTimed(Woman, Utility.GetCurrentGameTime())
endFunction

; Get the amount of contraception the woman has got at the given time
; (result is 0.0 to 98 .... or 0.0 to System.MaxContraception)
float function getContraceptionTimed(actor Woman, float Time)
	;System.Trace("FWController.getContraceptionTimed", Woman)
	If (StorageUtil.FormListFind(none,"FW.SavedNPCs",woman)<0)
		return 0.0
	EndIf
	float contraception = StorageUtil.GetFloatValue(Woman,"FW.Contraception",0)
	if contraception<=0
		return 0.0
	elseif contraception > System.MaxContraception
		contraception=System.MaxContraception
	endif
	float cTime = StorageUtil.GetFloatValue(Woman,"FW.ContraceptionTime",0)
	float cDur = System.GetPillDuration(Woman)
	
	float res = contraception - ((Time - cTime - cDur) * 24)
	;if res <0.0
	;	return 0.0
	;else
	;	return res
	;endif
	return FWUtility.RangedFloat(res,0.0,contraception)
endFunction


; Add an amount of contraception (pill effect)
float function AddContraception(actor Woman, float Value)
	;System.Trace("FWController.AddContraception", Woman)
	return AddContraceptionTimed(Woman, Utility.GetCurrentGameTime(), Value)
endFunction

; Adds an amount of contraception in the past, at the given time
float function AddContraceptionTimed(actor Woman, float Time, float Value)
	;System.Trace("FWController.AddContraceptionTimed", Woman)
	If (StorageUtil.FormListFind(none,"FW.SavedNPCs",woman)<0)
		CreateFemaleActor(woman)
	EndIf
	float cDur = System.GetPillDuration(Woman)
	float cTime = StorageUtil.GetFloatValue(Woman,"FW.ContraceptionTime",0.0)
	float contraception = getContraceptionTimed(Woman, Time)
	float new_contraception
	float addValue=0.0
	if cTime==0.0
		addValue = Value
	elseif Time - cTime <= 0
		return contraception
	elseif cTime + (cDur*0.75) < Time
		addValue=Value
	else
		addValue = ((Time - cTime) * Value) / (cDur*0.75)
	endIf
	if addValue < 2
		addValue = 2.0
	endif
	new_contraception=contraception+addValue
	if contraception>System.MaxContraception
		new_contraception = System.MaxContraception
	elseif contraception < 0
		new_contraception = 0.0
	endif
	StorageUtil.SetFloatValue(Woman,"FW.ContraceptionTime",Time)
	StorageUtil.SetFloatValue(Woman,"FW.Contraception",new_contraception)
	
	if(Woman==Game.GetPlayer())
		System.ContraceptionWidget.showTimed(true)
	endif
	
	System.Manager.OnContraception(Woman, addValue, contraception, new_contraception, Time - cTime)
	return new_contraception
endFunction

; Add an amount of contraception (pill effect)
float function SetContraception(actor Woman, float Value)
	;System.Trace("FWController.AddContraception", Woman)
	return SetContraceptionTimed(Woman, Utility.GetCurrentGameTime(), Value)
endFunction

; Adds an amount of contraception in the past, at the given time
float function SetContraceptionTimed(actor Woman, float Time, float Value)
	;System.Trace("FWController.AddContraceptionTimed", Woman)
	If (StorageUtil.FormListFind(none,"FW.SavedNPCs",woman)<0)
		CreateFemaleActor(woman)
	EndIf
	StorageUtil.SetFloatValue(Woman,"FW.ContraceptionTime",Time)
	StorageUtil.SetFloatValue(Woman,"FW.Contraception",Value)
	
	if(Woman==Game.GetPlayer())
		System.ContraceptionWidget.showTimed(true)
	endif
	return Value
endFunction

; Time till next pill is needed (0 = now)
float function GetContraceptionDuration(actor Woman)
	System.Trace("FWController.GetContraceptionDuration", Woman)
	return GetContraceptionDurationTimed(Woman, Utility.GetCurrentGameTime())
endFunction

; Time till next pill is needed depending on the given time
float function GetContraceptionDurationTimed(Actor Woman, float Time)
	System.Trace("FWController.GetContraceptionDurationTimed", Woman)
	If (StorageUtil.FormListFind(none,"FW.SavedNPCs",woman)<0)
		return 0
	EndIf
	float cDur = System.GetPillDuration(Woman)
	float cTime = StorageUtil.GetFloatValue(Woman,"FW.ContraceptionTime",0)
	if cTime+cDur>Time
		return 0
	else
		return cDur - ((cTime + cDur) - Time)
	endif
	
endFunction

; returns the Time that has gone, since the actors last child was born
float function getLastChildBornTime(actor ParentActor)
	System.Trace("FWController.getLastChildBornTime", ParentActor)
	return StorageUtil.GetFloatValue(ParentActor,"FW.LastBornChildTime", 0)
endFunction

; Updates the BeeingFemale faction for the given actor
function UpdateParentFaction(actor ParentActor)
	System.Trace("FWController.UpdateParentFaction", ParentActor)
	;if ! ParentActor || ! System.ParentFaction
	;	return
	;endif
	;if ParentActor.GetLeveledActorBase().GetSex()==0 && System.IsValidateMaleActor(ParentActor)<0
	;	return
	;elseif ParentActor.GetLeveledActorBase().GetSex()==1 && System.IsValidateFemaleActor(ParentActor)<0
	;	return
	;endif
	;:float xtime=StorageUtil.GetFloatValue(ParentActor,"FW.LastBornChildTime",0)
	;float GT = Utility.GetCurrentGameTime()
	;if GT - xtime <=0 || xtime==0 ; No parent
	;	ParentActor.SetFactionRank(System.ParentFaction, 0)
	;elseif GT - xtime <=1 ; Parent since less 1 day
	;	ParentActor.SetFactionRank(System.ParentFaction, 1)
	;elseif GT - xtime <=2 ; Parent since less 2 Days
	;	ParentActor.SetFactionRank(System.ParentFaction, 2)
	;elseif GT - xtime <=7 ; Parent since less 7 Days
	;	ParentActor.SetFactionRank(System.ParentFaction, 3)
	;else ; is parent
	;	ParentActor.SetFactionRank(System.ParentFaction, 4)
	;endif
endFunction

; Returns the calculated chance to become pregnant when the given womand has sex right now
; depending on all stats and settings
; (return value is from 0.01 to 0.99)
float function getRelativePregnancyChance(actor woman, actor man = none)
	return getRelativePregnancyChanceTimed(woman, Utility.GetCurrentGameTime(), man)
endfunction

; Returns the calculated chance to become pregnant when the given womand had sex at the given time
; depending on all stats and settings
; (return value is from 0.01 to 0.99)
float function getRelativePregnancyChanceTimed(actor woman, float Time, actor man = none)
	int WomanState = GetFemaleState(woman)
	float StateEnterTime = GetStateEnterTime(woman)
	if WomanState >=4
		; Already pregnant
		return 0.01
	else
		float Dur0 = System.getStateDuration(0,woman)           ;  5
		float Dur1 = System.getStateDuration(1,woman)           ;  2
		float Dur2 = System.getStateDuration(2,woman)           ;  5
		float Dur3 = System.getStateDuration(3,woman)           ;  2
		float DurT = Dur0+Dur1+Dur2+Dur3                        ; 14
		float EggTravel = System.getEggTravelingDuration(woman) ;  1
		float SpermLifeTime = System.getMaleSpermDuration(man)  ;  3
		float SpermTravel = System.cfg.WashOutHourDelay
		
		float curTime = 0
		bool bCanBecomePregnant = canBecomePregnant(woman)
		float CurChance = 0.0
		float stateTime = Time - StateEnterTime + SpermTravel
		float canBecomePregnantBonus = 0.0
		if bCanBecomePregnant
			canBecomePregnantBonus=1.0
		else
			canBecomePregnantBonus=0.05
		endif
		
		float newChance = 0.0
		
		while curTime < SpermLifeTime
			; Angenommen: WomanState = 0, Time = 55.2, StateEnterTime = 51.0 -- Daher Statewechsel in 0,8 Tagen
			newChance=0.0
			if WomanState==0
				;if Dur0 - (Time - StateEnterTime - 0.125) + EggTravel < SpermLifeTime
				;	CurChance = 0.98
				;elseif Dur0 - (Time - StateEnterTime + 0.125) + EggTravel < SpermLifeTime
				;	CurChance = 0
				;else
				;	CurChance = 0.01
				;endif
				stateTime+=1.0
				curTime+=1.0
				if stateTime > Dur0
					stateTime-=Dur0
					WomanState=1
				endif
			elseif WomanState==1 ; Ovulating
				if stateTime > EggTravel * 1.2
					newChance=98
				elseif stateTime > EggTravel * 0.8
					float EggMax=EggTravel * 1.2
					float EggMin=EggTravel * 0.8
					float EggDif=EggMax - EggMin
					float EggStart = stateTime - EggMin
					; stateTime = 1.1
					; EggMin = 0.8
					; EggMax = 1.2
					; EggDif = 0.4
					; EggStart = 1.1 - 0.8 = 0.3
					;
					; EggDif 	- 100%
					; EggStart 	- x
					;--------------------
					; x = (0.3 * 100) / 0.4
					;
					newChance = (EggStart * 100) / EggDif
				endif
				stateTime+=0.5
				curTime+=0.5
				if stateTime > Dur1
					stateTime-=Dur1
					WomanState=2
				endif
			elseif WomanState==2 ; Lutheal Phase
				float statePercent = (100 * stateTime) / Dur2
				if statePercent<65
					newChance = System.LutealImpregnationTime(statePercent)
				endif
				stateTime+=0.25
				curTime+=0.25
				if stateTime > Dur2
					stateTime-=Dur2
					WomanState=3
				endif
			elseif WomanState==3 ; Menstruating
				stateTime+=1.0
				curTime+=1.0
				if stateTime > Dur3
					stateTime-=Dur3
					WomanState=0
					canBecomePregnantBonus = System.cfg.ConceiveChance / 105
				endif
			endif
			float contraception = getContraceptionTimed(woman, Time+curTime)
			newChance*=canBecomePregnantBonus
			newChance*=(100 - contraception) / 100
			if newChance>CurChance
				CurChance=newChance
			endif
		endwhile
		return FWUtility.RangedFloat(CurChance,0.5,97.0) + Utility.RandomFloat(0.0,2.5)
	endif
endFunction

; Returns female actors the given man has sperm inside
Actor[] function getFemalesWithSpermFrom(actor Male, int max=128)
	if(max>128)
		max=128
	endif
	Actor[] res = FWUtility.ActorArray(max)
	int curRes=0
	float SpermDuration = System.getMaleSpermDuration(Male) ; The duration sperm can survive
	float CurTime= Utility.GetCurrentGameTime() ; The current Game Time
	int c = FWUtility.MinInt(StorageUtil.FormListCount(none,"FW.SavedNPCs"),max)
	while c>0
		c-=1
		actor female = StorageUtil.FormListGet(none,"FW.SavedNPCs",c) as actor
		; Check if it's neccessary to check all sperms
		if StorageUtil.FormListFind(female, "FW.SpermName", Male)>=0
			; Check for relevant sperm
			int sperm_index= StorageUtil.FormListCount(female, "FW.SpermName");StorageUtil.FormListCount(female,"FW.SpermName")
			while sperm_index>0
				sperm_index-=1
				if StorageUtil.FormListGet(female,"FW.SpermName",sperm_index)==Male
					if StorageUtil.FloatListGet(female,"FW.SpermTime",sperm_index)+SpermDuration>CurTime
						; Found - Exit while and add this sperm
						sperm_index=0
						res[curRes]
						curRes+=1
						if curRes>=max
							c=0
						endif
					endIf
				endIf
			endwhile
		endif
	endWhile
	return FWUtility.ActorArrayResize(res,curRes)
endFunction

; Returns female actors the given man has impregnated
Actor[] function getFemalesImpregnatedFrom(actor Male, int max=128)
	if(max>128)
		max=128
	endif
	Actor[] res = FWUtility.ActorArray(max)
	int curRes=0
	int c = StorageUtil.FormListCount(none,"FW.SavedNPCs")
	while c>0
		c-=1
		actor female = StorageUtil.FormListGet(none,"FW.SavedNPCs",c) as actor
		; Check if it's neccessary to check all sperms
		if StorageUtil.FormListFind(female, "FW.SpermName", Male)>=0 || StorageUtil.FormListFind(female, "FW.ChildFather", Male)>=0
			; Found sperm / Father - Update now
			System.Data.Update(female)
			int female_state= StorageUtil.GetIntValue(female,"FW.CurrentState",0)
			if female_state>3 && female_state<8
				if StorageUtil.FormListFind(female, "FW.ChildFather", Male)
					res[curRes]=female
					curRes+=1
					if curRes>=max
						c=0
					endif
				endif
			endif
		endif
	endWhile
	return FWUtility.ActorArrayResize(res,curRes)
endFunction

; returns the virility of the given man
float function GetVirility(actor Male)
	float virility=0
	If System.cfg.MaleVirilityRecovery > 0.0
		float L1 = StorageUtil.FloatListGet(Male, "SexLabSkills", 17)
		float L2 = StorageUtil.GetFloatValue(Male, "FW.LastSexTime",0.0)
		float LastSexTime = 0.0
		if L1>L2
			LastSexTime = L1
		else
			LastSexTime = L2
		endif
		if LastSexTime<=0.0
			virility = 1.0
		else
			virility = FWUtility.ClampFloat(Utility.GetCurrentGameTime() - LastSexTime / (System.cfg.MaleVirilityRecovery * System.Manager.ActorMaleRecoveryScale(Male)), 0.02, 1.0)
		endif
	else
		virility = 1.0
	EndIf
	return virility
endFunction

; Returns all actors who has impregnated the given woman
Actor[] function getFathers(actor Mother, int max = 12)
	if(max>128)
		max=128
	endif
	actor[] res = FWUtility.ActorArray(max)
	int c = StorageUtil.FormListCount(Mother, "FW.ChildFather")
	int i=0
	int curRes = 0
	while i<c
		actor a = StorageUtil.FormListGet(Mother, "FW.ChildFather", i) as actor
		if a!=none
			res[curRes]=a
			curRes+=1
			if curRes>=max
				c=0
			endif
		endif
		i+=1
	endWhile
	return FWUtility.ActorArrayResize(res,curRes)
endFunction

; Returns all actors who has sperm inside the given woman
Actor[] function getMalesInWoman(actor female, int max = 128)
	if(max>128)
		max=128
	endif
	float curTime = Utility.GetCurrentGameTime()
	actor[] res = FWUtility.ActorArray(max)
	int c = StorageUtil.FormListCount(female, "FW.SpermNames")
	int i=0
	int curRes = 0
	while i<c
		actor a=StorageUtil.FormListGet(female, "FW.SpermNames",i) as actor
		float t=StorageUtil.FloatListGet(female, "FW.SpermTime",i)
		float m=StorageUtil.FloatListGet(female, "FW.SpermAmount",i)
		Debug.Notification(a.GetLeveledActorBase().GetName() + " " + t + " -- " + m)
		if(a!=none && m>=Sperm_Min_Amount_For_Impregnation)
			float sDur = System.getMaleSpermDuration(a)
			Debug.Notification(curTime + " - " + t + " < " + sDur + " | " + (curTime - t) + " < " + sDur)
			if curTime-t<sDur
				res[curRes]=a
				curRes+=1
				if curRes>=max
					c=0
				endif
			endIf
		endif
		i+=1
	endWhile
	return FWUtility.ActorArrayResize(res,curRes)
endFunction


; Open a Messagebox with informations depending on the rank (Rang = 0 to 100)
; As higher the given rank - as more informations will be shown
function showRankedInfoBox(Actor target, int Rank)
	System.InfoMenuBlur()
	UI.OpenCustomMenu("BeeingFemale/BeeingFemaleInfo")
	string[] ent
	int iValidate = System.IsValidateActor(target)
	if (target as FWChildActor) != none
		FWChildActor child = target as FWChildActor
		Child.InitChild()
		ent = new string[9]
		ent[0]=3
		ent[1]=child.Name+" "+child.GetLastName()
		if child.Mother == none && child.Father == none
			ent[2]="$FW_INFOWINDOW_UnknownParents"
		elseif child.Father==none
			ent[2]="$FW_INFOWINDOW_ChildMotherIs{"+child.Mother.GetDisplayName()+"}"
		elseif child.Mother==none
			ent[2]="$FW_INFOWINDOW_ChildFatherIs{"+child.Father.GetDisplayName()+"}"
		else
			ent[2]="$FW_INFOWINDOW_ChildParents{"+child.Mother.GetDisplayName()+"}{"+child.Father.GetDisplayName()+"}"
		endif
		if child.GetLeveledActorBase().GetSex() == 0
			ent[3]="m"
		else
			ent[3]="f"
		endif
		ent[4]=Math.Floor(child.Age)
		ent[5]=child.Order
		ent[6]=child.GetLevel()
		ent[7]=(child.GetActorValuePercentage("Experience") * 100) as int
		location loc = child.GetCurrentLocation()
		if loc!=none
			ent[8]=loc.GetName()
		else
			ent[8]="$FW_INFOWINDOW_UnknownLocation"
		endif
	elseif(iValidate<0 || target.GetLeveledActorBase()==none)
		ent = new string[3]
		ent[0] = 4
		ent[1] = target.GetLeveledActorBase().GetName()
		ent[2] = iValidate * -1
	else
		if target.GetLeveledActorBase().GetSex()==0
			ent = new string[5]
			ent[0]=2
			ent[1]=target.GetLeveledActorBase().GetName()
			ent[2]=Math.Floor(GetVirility(target)*100)
			ent[3]= FWUtility.getActorListNames(getFemalesWithSpermFrom(target, 20) , false)
			ent[4]= FWUtility.getActorListNames(getFemalesImpregnatedFrom(target, 5) , false)
		else
			System.Data.Update(target)
			if IsPregnant(target)==false
				Actor[] a = GetRelevantSpermActors(target, true);getMalesInWoman(target)
				ent = new string[9]
				ent[0]=0
				ent[1]=target.GetLeveledActorBase().GetName()
				ent[2]=GetFemaleState(target)
				ent[3]=Utility.GetCurrentGameTime() - GetStateEnterTime(target)
				ent[4]=System.getStateDuration(GetFemaleState(target), target) as int
				ent[5]=getContraception(target) as int
				ent[6]=GetContraceptionDuration(target)
				ent[7]=getRelativePregnancyChance(target)
				ent[8]=FWUtility.getActorListNames(a,false)
			else
				ent = new string[8]
				ent[0]=1
				ent[1]=target.GetLeveledActorBase().GetName()
				ent[2]=GetFemaleState(target)
				ent[3]=Utility.GetCurrentGameTime() - GetStateEnterTime(target)
				ent[4]=System.getStateDuration(GetFemaleState(target), target) as int
				ent[5]=GetNumBabys(target)
				ent[6]=GetBabyHealth(target) as int
				ent[7]=FWUtility.getActorListNames(getFathers(target, 8), true)
			endif
		endif
	endif
	UI.InvokeStringA("CustomMenu", "_root.FWInfoMenu.initData", ent)
endFunction


function __deprecated__showRankedInfoBox(actor target, int Rank)
	string s=""
	string targetName
	
	;Debug.Trace("showRankedInfoBox "+target.GetLeveledActorBase().GetName()+" info")
	
	if target==Game.GetPlayer()
		targetName=System.Content.InfoSpell_You
	else
		targetName=target.GetLeveledActorBase().GetName()
	endif
	
	
	
	if (target as FWChildActor)!=none
		FWChildActor child = target as FWChildActor
		if child.Mother == none && child.Father == None
			s+=System.Content.InfoSpell_UnknownParents+"\n"
		elseif Child.Mother==none && child.Father!=None
			s+=FWUtility.MultiStringReplace(System.Content.InfoSpell_ChildFatherIs,child.Father.GetLeveledActorBase().GetName())+"\n"
		elseif Child.Mother!=none && child.Father==None
			s+=FWUtility.MultiStringReplace(System.Content.InfoSpell_ChildMotherIs,child.Mother.GetLeveledActorBase().GetName())+"\n"
		else
			s+=FWUtility.MultiStringReplace(System.Content.InfoSpell_ChildParents,child.Mother.GetLeveledActorBase().GetName(),child.Father.GetLeveledActorBase().GetName())+"\n"
		EndIf
		s+=FWUtility.MultiStringReplace(System.Content.InfoSpell_ChildWasBorn, System.cfg.GetTimeString(child.Age,false) )+"\n"
		if child.IsVampire==True
			if child.GetLeveledActorBase().GetSex()==0
				s+=FWUtility.MultiStringReplace(System.Content.InfoSpell_ChildVampire, System.Content.InfoSpell_He )+"\n"
			Else
				s+=FWUtility.MultiStringReplace(System.Content.InfoSpell_ChildVampire, System.Content.InfoSpell_She )+"\n"
			endif
		endIf
		if child.Follow!=None
			s+=FWUtility.MultiStringReplace(System.Content.InfoSpell_ChildFollows, child.Follow.GetLeveledActorBase().GetName())+"\n"
		endif
		if child.Order == 0
			s+=FWUtility.MultiStringReplace(System.Content.InfoSpell_ChildGotOrder, System.Content.InfoSpell_ChildOrder00 )+"\n"
		elseif child.Order == 1
			s+=FWUtility.MultiStringReplace(System.Content.InfoSpell_ChildGotOrder, System.Content.InfoSpell_ChildOrder01 )+"\n"
		elseif child.Order == 2
			s+=FWUtility.MultiStringReplace(System.Content.InfoSpell_ChildGotOrder, System.Content.InfoSpell_ChildOrder02 )+"\n"
		elseif child.Order == 3
			s+=FWUtility.MultiStringReplace(System.Content.InfoSpell_ChildGotOrder, System.Content.InfoSpell_ChildOrder03 )+"\n"
		elseif child.Order == 4
			s+=FWUtility.MultiStringReplace(System.Content.InfoSpell_ChildGotOrder, System.Content.InfoSpell_ChildOrder04 )+"\n"
		elseif child.Order == 5
			s+=FWUtility.MultiStringReplace(System.Content.InfoSpell_ChildGotOrder, System.Content.InfoSpell_ChildOrder05 )+"\n"
		elseif child.Order == 6
			s+=FWUtility.MultiStringReplace(System.Content.InfoSpell_ChildGotOrder, System.Content.InfoSpell_ChildOrder06 )+"\n"
		endif
		
		if child.Order != child.GetActorValue("Variable06")
			s+="WARNING: Var6 and order are different (" + child.Order + " / " + child.GetActorValue("Variable06") + ")\n"
		endif
		if (child.Order==0 || child.Order==1) && child.GetActorValue("WaitingForPlayer")==0
			s+="WARNING: Not Waiting for Player when having Order: "+child.Order+"\n"
		elseif child.Order!=0 && child.Order!=1 && child.GetActorValue("WaitingForPlayer")==1
			s+="WARNING: Waiting for Player when having Order: "+child.Order+"\n"
		endif
		s+="Current Package: "+Child.GetCurrentPackage().GetName()+"("+Child.GetCurrentPackage().GetFormID()+")\n"
		s+="Relationship Rank with Player: "+Child.GetRelationShipRank(Game.GetPlayer())+"\n"
			
	endIf
	
	if target.GetLeveledActorBase().GetSex()==0
	
		int validateMale = System.IsValidateMaleActor(target)
		if validateMale<=0
			if validateMale == -1
				System.Message(FWUtility.MultiStringReplace(System.Content.ForbiddenReason1,targetName), System.MSG_Always, System.MSG_Box)
			elseif validateMale == -2
				System.Message(FWUtility.MultiStringReplace(System.Content.ForbiddenReason2,targetName), System.MSG_High, System.MSG_Box)
			elseif validateMale == -3
				System.Message(FWUtility.MultiStringReplace(System.Content.ForbiddenReason3,targetName,System.Content.InfoSpell_Female), System.MSG_Debug, System.MSG_Box)
			elseif validateMale == -4
				System.Message(FWUtility.MultiStringReplace(System.Content.ForbiddenReason4,targetName), System.MSG_Debug, System.MSG_Box)
			elseif validateMale == -5
				System.Message(FWUtility.MultiStringReplace(System.Content.ForbiddenReason5,targetName), System.MSG_High, System.MSG_Box)
			elseif validateMale == -6
				System.Message(FWUtility.MultiStringReplace(System.Content.ForbiddenReason6,targetName), System.MSG_High, System.MSG_Box)
			elseif validateMale == -7
				System.Message(FWUtility.MultiStringReplace(System.Content.ForbiddenReason7,targetName), System.MSG_High, System.MSG_Box)
			elseif validateMale == -8
				System.Message(FWUtility.MultiStringReplace(System.Content.ForbiddenReason8,targetName), System.MSG_Low, System.MSG_Box)
			elseif validateMale == -9
				System.Message(FWUtility.MultiStringReplace(System.Content.ForbiddenReason9,targetName), System.MSG_High, System.MSG_Box)
			endif
			return
		endIf
		
		; Infobox for male target
		if Rank <=0
			if HasSpermInWoman(target)==true
				s+=FWUtility.MultiStringReplace(System.Content.InfoSpell_GotSpermInWoman,targetName)+"\n"
			else
				s+=FWUtility.MultiStringReplace(System.Content.InfoSpell_GotNoSpermInWoman,targetName)+"\n"
			endIf
		else
			float SpermDuration = System.getMaleSpermDuration(target) ; The duration sperm can survive
			float CurTime= Utility.GetCurrentGameTime() ; The current Game Time
			string spermNames=""
			string pregnantNames=""
			int SpermCount=0
			int PregnantCount=0
			bool PlayerSperm=false
			bool PlayerPregnant=false
			int c = StorageUtil.FormListCount(none,"FW.SavedNPCs")
			while c>0
				c-=1
				actor female = StorageUtil.FormListGet(none,"FW.SavedNPCs",c) as actor
				if StorageUtil.FormListFind(female, "FW.SpermName", target)>=0
					; Check for relevant sperm
					int sperm_index= StorageUtil.FormListCount(female, "FW.SpermName");StorageUtil.FormListCount(female,"FW.SpermName")
					while sperm_index>0
						sperm_index-=1
						if StorageUtil.FormListGet(female,"FW.SpermName",sperm_index)==target
							if StorageUtil.FloatListGet(female,"FW.SpermTime",sperm_index)+SpermDuration>CurTime
								; Found - Exit while and add this sperm
								sperm_index=0
								if SpermCount>0
									spermNames+=", "
								endIf
								if female==Game.GetPlayer()
									PlayerSperm=true
									spermNames+=System.Content.InfoSpell_You
								else
									spermNames+=female.GetLeveledActorBase().GetName()
								endif
								SpermCount+=1
							endIf
						endIf
					endWhile
					
					if Rank>=50
						; also show the pregnant ones
						System.Data.Update(female)
						int female_state= StorageUtil.GetIntValue(female,"FW.CurrentState",0)
						if female_state>3 && female_state<8
							if PregnantCount>0
								pregnantNames+=", "
							endIf
							if female==Game.GetPlayer()
								pregnantNames+=System.Content.InfoSpell_You
								PlayerPregnant=true
							else
								pregnantNames+=female.GetLeveledActorBase().GetName()
							endif
							PregnantCount+=1
						endif
					endif
				endIf
			endWhile
			
			s+=FWUtility.MultiStringReplace(System.Content.InfoSpell_GotNumSpermInWoman,targetName,SpermCount)+"\n\n"
			
			string shortname=System.Content.InfoSpell_He
			if target == Game.GetPlayer()
				shortname=System.Content.InfoSpell_You
			endIf
			
			if SpermCount>0 && Game.GetPlayer().GetLeveledActorBase().GetSex()==1
				if PlayerSperm==true
					s+=FWUtility.MultiStringReplace(System.Content.InfoSpell_CameInsideYou,shortname, System.Content.InfoSpell_Yes)+"\n"
				else
					s+=FWUtility.MultiStringReplace(System.Content.InfoSpell_CameInsideYou,shortname, System.Content.InfoSpell_No)+"\n"
				endIf
			endif
			
			if Rank >= 20 && SpermCount>0
				s+=FWUtility.MultiStringReplace(System.Content.InfoSpell_CameInsideNames,shortname,spermNames)+"\n\n"
			endif
			
			if Rank >= 50 && Rank <60
				if PregnantCount>0
					s+=FWUtility.MultiStringReplace(System.Content.InfoSpell_ImpregnatedAnyWoman,shortname,spermNames)+"\n"
				endif
			elseif Rank >= 60 && (Rank <80 || PregnantCount==0)
				s+=FWUtility.MultiStringReplace(System.Content.InfoSpell_ImpregnatedNumWoman,shortname,PregnantCount)+"\n"
			endif
			if Rank >=70 && PregnantCount>0
				if PlayerPregnant==true
					s+=FWUtility.MultiStringReplace(System.Content.InfoSpell_ImpregnatedYou,shortname,System.Content.InfoSpell_Yes)+"\n"
				else
					s+=FWUtility.MultiStringReplace(System.Content.InfoSpell_ImpregnatedYou,shortname,System.Content.InfoSpell_No)+"\n"
				endIf
			endif
			if Rank>=80 && PregnantCount>0
				s+=FWUtility.MultiStringReplace(System.Content.InfoSpell_ImpregnatedWoman,shortname, PregnantCount,pregnantNames)+"\n"
			endif
			;endWhile
		endif
		
		;if Rank >=30
		;	s+=targetName+" had sex "
		;endif
	else
		; Infobox for female target
		
		int Validate=System.IsValidateFemaleActor(target)
		if Validate<=0
			if Validate == -1
				System.Message( FWUtility.MultiStringReplace(System.Content.ForbiddenReason1,targetName) , System.MSG_Always, System.MSG_Box)
			elseif Validate == -2
				System.Message( FWUtility.MultiStringReplace(System.Content.ForbiddenReason2,targetName) , System.MSG_High, System.MSG_Box)
			elseif Validate == -3
				System.Message( FWUtility.MultiStringReplace(System.Content.ForbiddenReason3,targetName, System.Content.InfoSpell_Male), System.MSG_Debug, System.MSG_Box)
			elseif Validate == -4
				System.Message( FWUtility.MultiStringReplace(System.Content.ForbiddenReason4,targetName) , System.MSG_Debug, System.MSG_Box)
			elseif Validate == -5
				System.Message( FWUtility.MultiStringReplace(System.Content.ForbiddenReason5,targetName) , System.MSG_High, System.MSG_Box)
			elseif Validate == -6
				System.Message( FWUtility.MultiStringReplace(System.Content.ForbiddenReason6,targetName) , System.MSG_High, System.MSG_Box)
			elseif Validate == -7
				System.Message( FWUtility.MultiStringReplace(System.Content.ForbiddenReason7,targetName) , System.MSG_High, System.MSG_Box)
			elseif Validate == -8
				System.Message( FWUtility.MultiStringReplace(System.Content.ForbiddenReason8,targetName) , System.MSG_Low, System.MSG_Box)
			elseif Validate == -9
				System.Message( FWUtility.MultiStringReplace(System.Content.ForbiddenReason9,targetName) , System.MSG_High, System.MSG_Box)
			endif
			return
		endIf
		
		; First update the female NPC
		System.Data.Update(target)
		
		int stateID= StorageUtil.GetIntValue(target,"FW.CurrentState",0)
		int flag= StorageUtil.GetIntValue(target,"FW.Flags",0)
		Actor[] spermNames = FWUtility.ActorArrayUnique(GetRelevantSpermActors(target, true,true))

		;int z=0
		;while z<spermNames.length
		;	z+=1
		;endwhile

		if Rank <20
			if HasRelevantSperm(target,true)==true
				s+=FWUtility.MultiStringReplace(System.Content.InfoSpell_GotSpermInside,targetName)+"\n"
			else
				s+=FWUtility.MultiStringReplace(System.Content.InfoSpell_GotNoSpermInside,targetName)+"\n"
			endIf
		else
			if spermNames.Length==0
				s+=FWUtility.MultiStringReplace(System.Content.InfoSpell_GotNoSpermInside,targetName)+"\n"
			elseif spermNames.Length==1 && spermNames[0]==Game.GetPlayer() && Rank>20
				s+=FWUtility.MultiStringReplace(System.Content.InfoSpell_GotYourSpermInside,targetName)+"\n"
			elseif spermNames.Length==1
				s+=FWUtility.MultiStringReplace(System.Content.InfoSpell_GotOneSpermInside,targetName)+"\n"
			else
				s+=FWUtility.MultiStringReplace(System.Content.InfoSpell_GotMoreSpermInside,targetName,spermNames.length)+"\n"
			endif
		endif
		
		if Rank>=35
			if stateID==0
				s+=FWUtility.MultiStringReplace(System.Content.InfoSpell_CurrentState, System.Content.StateID0)
			elseif stateID==1
				s+=FWUtility.MultiStringReplace(System.Content.InfoSpell_CurrentState, System.Content.StateID1)
			elseif stateID==2
				s+=FWUtility.MultiStringReplace(System.Content.InfoSpell_CurrentState, System.Content.StateID2)
			elseif stateID==3
				s+=FWUtility.MultiStringReplace(System.Content.InfoSpell_CurrentState, System.Content.StateID3)
			elseif stateID==4
				s+=FWUtility.MultiStringReplace(System.Content.InfoSpell_CurrentState, System.Content.StateID4)
			elseif stateID==5
				s+=FWUtility.MultiStringReplace(System.Content.InfoSpell_CurrentState, System.Content.StateID5)
			elseif stateID==6
				s+=FWUtility.MultiStringReplace(System.Content.InfoSpell_CurrentState, System.Content.StateID6)
			elseif stateID==7
				s+=FWUtility.MultiStringReplace(System.Content.InfoSpell_CurrentState, System.Content.StateID7)
			elseif stateID==8
				s+=FWUtility.MultiStringReplace(System.Content.InfoSpell_CurrentState, System.Content.StateID8)
			elseif stateID==20
				s+=FWUtility.MultiStringReplace(System.Content.InfoSpell_CurrentState, System.Content.StateID20)
			elseif stateID==21
				s+=FWUtility.MultiStringReplace(System.Content.InfoSpell_CurrentState, System.Content.StateID21)
			else
				s+=FWUtility.MultiStringReplace(System.Content.InfoSpell_CurrentState, System.Content.StateUnknown)
			endIf
			
			if Rank>40 && IsPaused(target)==false
				float stateDur=System.GetStateDuration(stateID,target)
				float xStateDelay=Utility.GetCurrentGameTime() - StorageUtil.GetFloatValue(target,"FW.StateEnterTime",0.0)
				s+=" "+FWUtility.MultiStringReplace(System.Content.InfoSpell_StateSince, FWUtility.GetTimeString(xStateDelay,true))+"\n"
				if Rank>65
					s+=FWUtility.MultiStringReplace(System.Content.InfoSpell_StateDuration, FWUtility.GetTimeString(stateDur,true))
					if Rank>95
						s+=" ("+FWUtility.GetPercentage(GetStatePercentage(target),1)+"%)\n"
					else
						s+="\n"
					endif
				endif
			else
				s+="\n"
			endIf
		endIf
		
		if Rank>=5 && Rank <25
			if stateID>4 && stateID<8
				s+=FWUtility.MultiStringReplace(System.Content.InfoSpell_LooksPregnant, System.Content.InfoSpell_Yes)+"\n"
			elseif stateID<=4 ; Event in the 1. Trimester
				s+=FWUtility.MultiStringReplace(System.Content.InfoSpell_LooksPregnant, System.Content.InfoSpell_No)+"\n"
			elseif stateID==8
				s+=FWUtility.MultiStringReplace(System.Content.InfoSpell_LooksPregnant, System.Content.InfoSpell_NotAnymore)+"\n"
			endif
		elseif Rank>=25
			if stateID>=4 && stateID<8
				s+=FWUtility.MultiStringReplace(System.Content.InfoSpell_IsPregnant, System.Content.InfoSpell_Yes)+"\n"
			elseif stateID<4
				s+=FWUtility.MultiStringReplace(System.Content.InfoSpell_IsPregnant, System.Content.InfoSpell_No)+"\n"
			elseif stateID==8
				s+=FWUtility.MultiStringReplace(System.Content.InfoSpell_IsPregnant, System.Content.InfoSpell_NotAnymore)+"\n"
			endif
		endIf
		
		
		if Rank>=95 && stateID<4
			if Math.LogicalOr(flag,1)==flag
				s+=FWUtility.MultiStringReplace(System.Content.InfoSpell_CanBecomePregnant, System.Content.InfoSpell_Yes)+" ("+ Math.Floor(getRelativePregnancyChance(target))+"%)\n"
			else
				s+=FWUtility.MultiStringReplace(System.Content.InfoSpell_CanBecomePregnant, System.Content.InfoSpell_No)+" ("+Math.Floor(getRelativePregnancyChance(target))+"%)\n"
			endIf
		elseif Rank>=80 && stateID<4
			if Math.LogicalOr(flag,1)==flag
				s+=FWUtility.MultiStringReplace(System.Content.InfoSpell_CanBecomePregnant, System.Content.InfoSpell_Yes)+"\n"
			else
				s+=FWUtility.MultiStringReplace(System.Content.InfoSpell_CanBecomePregnant, System.Content.InfoSpell_No)+"\n"
			endIf
		endIf
		
		if stateID>=4 && stateID<8
			;Pregnancy informations
			if Rank>60
				int numChilds=StorageUtil.GetIntValue(target,"FW.NumChilds",0)
				s+=FWUtility.MultiStringReplace(System.Content.InfoSpell_PregnantWithNumOfBabys, numChilds)+"\n"
				if Rank>95
					if numChilds>1
						s+=FWUtility.MultiStringReplace(System.Content.InfoSpell_UnbornBabiesHealth, (StorageUtil.GetFloatValue(target,"FW.UnbornHealth") as int))+"\n"
					else
						s+=FWUtility.MultiStringReplace(System.Content.InfoSpell_UnbornBabyHealth, (StorageUtil.GetFloatValue(target,"FW.UnbornHealth") as int))+"\n"
					endif
				endif
			endIf
		else
			; Cycle and replanish infos
			if Rank>33 && Rank<55
				if StorageUtil.GetFloatValue(target,"FW.Contraception") > 5.0
					s+=FWUtility.MultiStringReplace(System.Content.InfoSpell_Contraception, System.Content.InfoSpell_Yes)+"\n"
				else
					s+=FWUtility.MultiStringReplace(System.Content.InfoSpell_Contraception, System.Content.InfoSpell_No)+"\n"
				endIf
			elseif Rank>=55
				float concep = StorageUtil.GetFloatValue(target,"FW.Contraception")
				if concep>0
					s+=FWUtility.MultiStringReplace(System.Content.InfoSpell_Contraception, (concep as int)+"%")+"\n"
				else
					s+=FWUtility.MultiStringReplace(System.Content.InfoSpell_Contraception, System.Content.InfoSpell_No)+"\n"
				endif
				
				float lastTimeConcep=StorageUtil.GetFloatValue(target,"FW.ContraceptionTime",0.0)
				if Rank>75 && lastTimeConcep>0
					s+=FWUtility.MultiStringReplace(System.Content.InfoSpell_LastContraception, FWUtility.GetTimeString(Utility.GetCurrentGameTime() - lastTimeConcep,true))+"\n"
				endif
			endIf
			
		endif
		if Rank>=50 && spermNames.length>0
			int c=spermNames.length
			bool bSpermFromPlayer=false
			bool bHasNames=false
			string xSpermNames=""
			while c>0
				c-=1
				if spermNames[c]==Game.GetPlayer()
					bSpermFromPlayer=true
				elseif spermNames[c]!=none
					if bHasNames==true
						xSpermNames+=", "
					endIf
					if spermNames[c].GetLeveledActorBase().GetName()==""
						xSpermNames+=spermNames[c].GetActorBase().GetName()
					else
						xSpermNames+=spermNames[c].GetLeveledActorBase().GetName()
					endif
					bHasNames=true
				endif
			endWhile
			if bSpermFromPlayer==true
				if bHasNames==true
					xSpermNames+=" "+System.Content.InfoSpell_AndYou
				else
					xSpermNames+=System.Content.InfoSpell_You
				endIf
			endIf
			s+=FWUtility.MultiStringReplace(System.Content.InfoSpell_SpermNames, xSpermNames)+"\n"
		endIf
	endif
	
	System.Message(s, System.MSG_Always, System.MSG_Box)
endFunction
