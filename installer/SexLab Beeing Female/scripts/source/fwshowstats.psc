Scriptname FWShowStats extends ActiveMagicEffect  

FWController property Controller auto
int property Magnetude = 100 auto
actor ActorRef=none
bool bInit=false

Event OnEffectStart(Actor akTarget, Actor akCaster)
	if akTarget==none && akCaster.GetAngleX()>85
		ActorRef = Game.GetPlayer()
		execute()
	elseif akTarget!=none
		ActorRef = akTarget
		execute()
	endif
endEvent

Event OnInit()
	bInit=true
	execute()
endEvent

function execute()
	if ActorRef==none || bInit==false
		return
	endif
	
	If ActorRef.HasSpell(Controller.System.BeeingFemaleSpell)
		if ActorRef.HasMagicEffect(Controller.System.BeeingFemaleSpell.GetNthEffectMagicEffect(0))==false
			ActorRef.RemoveSpell(Controller.System.BeeingFemaleSpell)
		endif
	endif
	if ActorRef.HasSpell(Controller.System.BeeingMaleSpell)
		if ActorRef.HasMagicEffect(Controller.System.BeeingMaleSpell.GetNthEffectMagicEffect(0))==false
			ActorRef.RemoveSpell(Controller.System.BeeingMaleSpell)
		endif
	endif
	
	If ActorRef.HasSpell(Controller.System.BeeingFemaleSpell)==false && Controller.System.IsValidateActor(ActorRef)
		FWUtility.ActorAddSpell(ActorRef, Controller.System.BeeingFemaleSpell)
	elseif ActorRef.HasSpell(Controller.System.BeeingMaleSpell)==false && Controller.System.IsValidateMaleActor(ActorRef)
		if ActorRef.HasMagicEffect(Controller.System.BeeingMaleSpell.GetNthEffectMagicEffect(0))==false
			ActorRef.RemoveSpell(Controller.System.BeeingMaleSpell)
		endif
		FWUtility.ActorAddSpell(ActorRef, Controller.System.BeeingMaleSpell)
	endif
	
	;int Magnetude = GetMagnitude() as int
	Controller.showRankedInfoBox(ActorRef, Magnetude)
	;UI.OpenCustomMenu("beeingfemale/info_spell.swf");
	;if ActorRef.GetLeveledActorBase()!=none
	;	if ActorRef.GetLeveledActorBase().GetSex()==0
	;		return
	;	endif
	;endif
	if Controller.System.cfg.Messages==0
		if ActorRef as FWChildActor !=none
			printChildInformations()
		else
			if ActorRef.GetLeveledActorBase()!=none
				if ActorRef.GetLeveledActorBase().GetSex()==0
					printMaleInformations()
				else
					printFemaleInformations()
				endif
			endif
		endif
	endif
endFunction

function PrintLinked()
	int cChain=ActorRef.countLinkedRefChain()
	int i=0
	ObjectReference lnkRef = ActorRef.GetLinkedRef()
	if lnkRef!=none
		Debug.Trace("Linked References: " + lnkRef.GetName() + " [" + lnkRef.GetFormID() + "]")
	else
		Debug.Trace("Linked References: <NONE>")
	endif
	Debug.Trace("Linked Ref Chains: " + cChain)
	while i<cChain
		ObjectReference lnk = ActorRef.GetNthLinkedRef(i)
		Debug.Trace(i + ": " + lnk.GetName() + " [" + lnk.GetFormID() + "]")
		i+=1
	endWhile
endFunction

function printChildInformations()
	if ActorRef.GetLeveledActorBase()!=none
		Debug.Trace("BeeingChild Saved Data for: "+ActorRef.GetLeveledActorBase().GetName());
	else
		Debug.Trace("BeeingChild Saved Data for: "+ActorRef.GetName());
	endif
	Debug.Trace("Child Name: "+StorageUtil.GetStringValue(ActorRef,"FW.Child.Name",""))
	Debug.Trace("Child last Update: " + StorageUtil.GetFloatValue(ActorRef,"FW.Child.LastUpdate",0))
	actor Mother = StorageUtil.GetFormValue(ActorRef,"FW.Child.Mother") as actor
	actor Father = StorageUtil.GetFormValue(ActorRef,"FW.Child.Father") as actor
	if Mother!=none
		if Mother.GetLeveledActorBase()!=none
			Debug.Trace("Mother: "+Mother.GetLeveledActorBase().GetName())
		else
			Debug.Trace("Mother: #"+Mother.GetName())
		endif
	else
		Debug.Trace("Mother: <NONE>")
	endif
	if Father!=none
		if Father.GetLeveledActorBase()!=none
			Debug.Trace("Father: "+Father.GetLeveledActorBase().GetName())
		else
			Debug.Trace("Father: #"+Father.GetName())
		endif
	else
		Debug.Trace("Father: <NONE>")
	endif
	Debug.Trace("Level: "+StorageUtil.GetFloatValue(ActorRef, "FW.Child.Level"))
	Debug.Trace("Experience: "+StorageUtil.GetFloatValue(ActorRef, "FW.Child.StatExperience"))
	Debug.Trace("Stats:")
	Debug.Trace("Comprehension: " + StorageUtil.GetFloatValue(ActorRef,"FW.Child.StatComprehension"))
	Debug.Trace("Destruction: " + StorageUtil.GetFloatValue(ActorRef,"FW.Child.StatDestruction"))
	Debug.Trace("Illusion: " + StorageUtil.GetFloatValue(ActorRef,"FW.Child.StatIllusion"))
	Debug.Trace("Conjuration: " + StorageUtil.GetFloatValue(ActorRef,"FW.Child.StatConjuration"))
	Debug.Trace("Restoration: " + StorageUtil.GetFloatValue(ActorRef,"FW.Child.StatRestoration"))
	Debug.Trace("Alteration: " + StorageUtil.GetFloatValue(ActorRef,"FW.Child.StatAlteration"))
	Debug.Trace("Block: " + StorageUtil.GetFloatValue(ActorRef,"FW.Child.StatBlock"))
	Debug.Trace("OneHanded: " + StorageUtil.GetFloatValue(ActorRef,"FW.Child.StatOneHanded"))
	Debug.Trace("TwoHanded: " + StorageUtil.GetFloatValue(ActorRef,"FW.Child.StatTwoHanded"))
	Debug.Trace("Marksman: " + StorageUtil.GetFloatValue(ActorRef,"FW.Child.StatMarksman"))
	Debug.Trace("Sneak: " + StorageUtil.GetFloatValue(ActorRef,"FW.Child.StatSneak"))
	Debug.Trace("Magicka: " + StorageUtil.GetFloatValue(ActorRef,"FW.Child.StatMagicka"))
	Debug.Trace("CarryWeight: " + StorageUtil.GetFloatValue(ActorRef,"FW.Child.StatCarryWeight"))
	Debug.Trace("Health: " + StorageUtil.GetFloatValue(ActorRef,"FW.Child.StatHealth"))
	Debug.Trace("Perks:")
	int sc = StorageUtil.FormListCount(ActorRef,"FW.Child.Perks")
	while sc>0
		sc-=1
		spell s = StorageUtil.FormListGet(ActorRef,"FW.Child.Perks",sc) as spell
		if s!=none
			Debug.Trace(s.GetName())
		else
			Debug.Trace("Unknown Perk")
		endif
	endWhile
	
	PrintLinked()
	
	Debug.Trace("-----------------------------------------------------------------")
endfunction

function printMaleInformations()
	if ActorRef.GetLeveledActorBase()!=none
		Debug.Trace("BeeingMale Saved Data for: "+ActorRef.GetLeveledActorBase().GetName());
	else
		Debug.Trace("BeeingMale Saved Data for: "+ActorRef.GetName());
	endif
	PrintLinked()
	
	Debug.Trace("-----------------------------------------------------------------")
endfunction

function printFemaleInformations()
	int i=0
	int cChildFather=StorageUtil.FormListCount(ActorRef,"FW.ChildFather")
	int cSpermTime=StorageUtil.FloatListCount(ActorRef,"FW.SpermTime")
	int cSpermName=StorageUtil.FormListCount(ActorRef,"FW.SpermName")
	int cSpermAmmount=StorageUtil.FloatListCount(ActorRef,"FW.SpermAmount")
	int cBornChildFather=StorageUtil.FormListCount(ActorRef,"FW.BornChildFather")
	int cBornChildTime=StorageUtil.FloatListCount(ActorRef,"FW.BornChildTime")
	Debug.Trace("-----------------------------------------------------------------")
	if ActorRef.GetLeveledActorBase()!=none
		Debug.Trace("BeeingFemale Saved Data for: "+ActorRef.GetLeveledActorBase().GetName());
	else
		Debug.Trace("BeeingFemale Saved Data for: #"+ActorRef.GetName());
	endif
	Debug.Trace("Current Game Time: "+ Utility.GetCurrentGameTime())
	Debug.Trace("-----------------------------------------------------------------")
	Debug.Trace(" FW.LastUpdate :  "+StorageUtil.GetFloatValue(ActorRef,"FW.LastUpdate"))
	Debug.Trace(" FW.StateEnterTime :  "+StorageUtil.GetFloatValue(ActorRef,"FW.StateEnterTime")+" ["+ FWUtility.GetTimeString(Utility.GetCurrentGameTime() - StorageUtil.GetFloatValue(ActorRef,"FW.StateEnterTime")) +"]")
	Debug.Trace(" FW.CurrentState :  "+StorageUtil.GetIntValue(ActorRef,"FW.CurrentState"))
	Debug.Trace(" FW.Abortus :  "+StorageUtil.GetIntValue(ActorRef,"FW.Abortus"))
	Debug.Trace(" FW.AbortusTime :  "+StorageUtil.GetFloatValue(ActorRef,"FW.AbortusTime")+" ["+ FWUtility.GetTimeString(Utility.GetCurrentGameTime() - StorageUtil.GetFloatValue(ActorRef,"FW.AbortusTime")) +"]")
	Debug.Trace(" FW.UnbornHealth :  "+StorageUtil.GetFloatValue(ActorRef,"FW.UnbornHealth"))
	Debug.Trace(" FW.NumChilds :  "+StorageUtil.GetIntValue(ActorRef,"FW.NumChilds"))
	i=0
	while i<cChildFather
		actor a = StorageUtil.FormListGet(ActorRef,"FW.ChildFather",i) as Actor
		if a!=none
			if a.GetLeveledActorBase()!=none
				Debug.Trace(" FW.ChildFather["+i+"] :  "+a.GetLeveledActorBase().GetName())
			else
				Debug.Trace(" FW.ChildFather["+i+"] :  #"+a.GetName())
			endif
		endif
		i+=1
	endwhile
	i=0
	while i<cSpermTime
		Debug.Trace(" FW.SpermTime["+i+"] :  "+StorageUtil.FloatListGet(ActorRef,"FW.SpermTime",i)+" ["+ FWUtility.GetTimeString(Utility.GetCurrentGameTime() - StorageUtil.FloatListGet(ActorRef,"FW.SpermTime",i)) +"]")
		i+=1
	endwhile
	i=0
	while i<cSpermName
		actor a = StorageUtil.FormListGet(ActorRef,"FW.SpermName",i) as Actor
		if a!=none
			if a.GetLeveledActorBase()!=none
				Debug.Trace(" FW.SpermName["+i+"] :  "+a.GetLeveledActorBase().GetName())
			else
				Debug.Trace(" FW.SpermName["+i+"] :  #"+a.GetName())
			endif
		endif
		i+=1
	endwhile
	i=0
	while i<cSpermAmmount
		Debug.Trace(" FW.SpermAmount["+i+"] :  "+StorageUtil.FloatListGet(ActorRef,"FW.SpermAmount",i))
		i+=1
	endwhile
	Debug.Trace(" FW.Flags :  "+StorageUtil.GetIntValue(ActorRef,"FW.Flags"))
	Debug.Trace(" FW.PainLevel :  "+StorageUtil.GetFloatValue(ActorRef,"FW.PainLevel"))
	Debug.Trace(" FW.Contraception :  "+StorageUtil.GetFloatValue(ActorRef,"FW.Contraception"))
	Debug.Trace(" FW.ContraceptionTime :  "+StorageUtil.GetFloatValue(ActorRef,"FW.ContraceptionTime")+" ["+ FWUtility.GetTimeString(Utility.GetCurrentGameTime() - StorageUtil.GetFloatValue(ActorRef,"FW.ContraceptionTime")) +"]")
	Debug.Trace(" FW.NumBirth :  "+StorageUtil.GetIntValue(ActorRef,"FW.NumBirth"))
	Debug.Trace(" FW.NumBabys :  "+StorageUtil.GetIntValue(ActorRef,"FW.NumBabys"))
	Debug.Trace(" FW.PauseTime :  "+StorageUtil.GetFloatValue(ActorRef,"FW.PauseTime")+" ["+ FWUtility.GetTimeString(Utility.GetCurrentGameTime() - StorageUtil.GetFloatValue(ActorRef,"FW.PauseTime")) +"]")
	Debug.Trace(" FW.LastBornChildTime :  "+StorageUtil.GetFloatValue(ActorRef,"FW.LastBornChildTime")+" ["+ FWUtility.GetTimeString(Utility.GetCurrentGameTime() - StorageUtil.GetFloatValue(ActorRef,"FW.LastBornChildTime")) +"]")
	i=0
	while i<cBornChildFather
		actor a = StorageUtil.FormListGet(ActorRef,"FW.BornChildFather",i) as Actor
		if a!=none
			if a.GetLeveledActorBase()!=none
				Debug.Trace(" FW.BornChildFather["+i+"] :  "+a.GetLeveledActorBase().GetName())
			else
				Debug.Trace(" FW.BornChildFather["+i+"] :  #"+a.GetName())
			endif
		endif
		i+=1
	endwhile
	i=0
	while i<cBornChildTime
		Debug.Trace(" FW.BornChildTime["+i+"] :  "+StorageUtil.FloatListGet(ActorRef,"FW.BornChildTime",i)+" ["+ FWUtility.GetTimeString(Utility.GetCurrentGameTime() - StorageUtil.FloatListGet(ActorRef,"FW.BornChildTime",i)) +"]")
		i+=1
	endwhile
	
	PrintLinked()
	
	Debug.Trace("-----------------------------------------------------------------")
endFunction