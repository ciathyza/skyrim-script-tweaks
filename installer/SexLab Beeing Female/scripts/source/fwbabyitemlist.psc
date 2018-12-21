Scriptname FWBabyItemList extends Quest  
FWAddOnManager property Manager auto

MiscObject property FallBack_MaleBabyItem Auto hidden
MiscObject property FallBack_FemaleBabyItem Auto hidden

Armor property FallBack_MaleBabyArmor Auto
Armor property FallBack_FemaleBabyArmor Auto

ActorBase property FallBack_MaleBabyActor Auto
ActorBase property FallBack_FemaleBabyActor Auto

ActorBase property FallBack_MalePlayerBabyActor Auto
ActorBase property FallBack_FemalePlayerBabyActor Auto

string[] property Female_Names auto
string[] property Male_Names auto

race property LastRace auto hidden

MiscObject function getBabyItem(actor Mother, actor Father, int sex)
	int BabyRaceRnd=Utility.RandomInt(0,1)
	race ParentRace
	race ParentRaceAlt
	
	race MotherRace = Mother.GetLeveledActorBase().GetRace()
	LastRace = MotherRace
	
	; Check Forces Babys
	if StorageUtil.GetIntValue(MotherRace, "FW.AddOn.Female_Force_This_Baby")==1
		int mCount=StorageUtil.FormListCount(MotherRace,"FW.AddOn.BabyMesh_Male")
		int fCount=StorageUtil.FormListCount(MotherRace,"FW.AddOn.BabyMesh_Female")
		if mCount>0 && sex==0
			; First, check Random child from list
			MiscObject force_mo_m=StorageUtil.FormListGet(MotherRace,"FW.AddOn.BabyMesh_Male", Utility.RandomInt(0,mCount - 1)) as MiscObject
			if force_mo_m!=none
				return force_mo_m
			endif
			; Random Child was none, go through list
			int i=0
			while i<mCount
				i+=1
				force_mo_m=StorageUtil.FormListGet(MotherRace,"FW.AddOn.BabyMesh_Male", i) as MiscObject
				if force_mo_m!=none
					return force_mo_m
				endif
			endwhile
		elseif fCount>0 && sex==1
			; First, check Random child from list
			MiscObject force_mo_f=StorageUtil.FormListGet(MotherRace,"FW.AddOn.BabyMesh_Female", Utility.RandomInt(0,fCount - 1)) as MiscObject
			if force_mo_f!=none
				return force_mo_f
			endif
			; Random Child was none, go through list
			int i=0
			while i<mCount
				i+=1
				force_mo_f=StorageUtil.FormListGet(MotherRace,"FW.AddOn.BabyMesh_Female", i) as MiscObject
				if force_mo_f!=none
					return force_mo_f
				endif
			endwhile
		endif
	endif
	
	; No forced Baby found - Use default methode to get the babys race
	if BabyRaceRnd==0 && Father!=none
		ParentRace=Father.GetLeveledActorBase().GetRace()
		if Mother!=none
			ParentRaceAlt=Mother.GetLeveledActorBase().GetRace()
		endif
	elseif Mother!=none
		ParentRace=Mother.GetLeveledActorBase().GetRace()
		if Father!=none
			ParentRaceAlt=Father.GetLeveledActorBase().GetRace()
		endif
	endIf
	;Debug.Notification("Child Parent Race: "+ParentRace.GetName()+" (ID: "+RaceID+")")
	if sex==0
		; Male
		MiscObject b=Manager.GetBabyItem(ParentRace,0)
		MiscObject bAlt=Manager.GetBabyItem(ParentRaceAlt,0)
		if b!=none
			LastRace = ParentRace
			return b
		elseif bAlt!=none
			LastRace = ParentRaceAlt
			return bAlt
		else
			return FallBack_MaleBabyItem
		endif
	endIf
	
	MiscObject b=Manager.GetBabyItem(ParentRace,1)
	MiscObject bAlt = none
	if ParentRaceAlt!=none
		bAlt=Manager.GetBabyItem(ParentRaceAlt,0)
	endif
	if b!=none
		LastRace = ParentRace
		return b
	elseif bAlt!=none
		LastRace = ParentRaceAlt
		return bAlt
	else
		return FallBack_FemaleBabyItem
	endIf
endFunction

Armor function getBabyArmor(actor Mother, actor Father, int sex)
	int BabyRaceRnd=Utility.RandomInt(0,1)
	race ParentRace
	race ParentRaceAlt
	
	race MotherRace = Mother.GetLeveledActorBase().GetRace()
	LastRace = MotherRace
	
	; Check Forces Babys
	if StorageUtil.GetIntValue(MotherRace, "FW.AddOn.Female_Force_This_Baby")==1
		int mCount=StorageUtil.FormListCount(MotherRace,"FW.AddOn.BabyArmor_Male")
		int fCount=StorageUtil.FormListCount(MotherRace,"FW.AddOn.BabyArmor_Female")
		if mCount>0 && sex==0
			; First, check Random child from list
			Armor force_mo_m=StorageUtil.FormListGet(MotherRace,"FW.AddOn.BabyArmor_Male", Utility.RandomInt(0,mCount - 1)) as Armor
			if force_mo_m!=none
				return force_mo_m
			endif
			; Random Child was none, go through list
			int i=0
			while i<mCount
				i+=1
				force_mo_m=StorageUtil.FormListGet(MotherRace,"FW.AddOn.BabyArmor_Male", i) as Armor
				if force_mo_m!=none
					return force_mo_m
				endif
			endwhile
		elseif fCount>0 && sex==1
			; First, check Random child from list
			Armor force_mo_f=StorageUtil.FormListGet(MotherRace,"FW.AddOn.BabyArmor_Female", Utility.RandomInt(0,fCount - 1)) as Armor
			if force_mo_f!=none
				return force_mo_f
			endif
			; Random Child was none, go through list
			int i=0
			while i<mCount
				i+=1
				force_mo_f=StorageUtil.FormListGet(MotherRace,"FW.AddOn.BabyArmor_Female", i) as Armor
				if force_mo_f!=none
					return force_mo_f
				endif
			endwhile
		endif
	endif
	
	; No forced Baby found - Use default methode to get the babys race
	if BabyRaceRnd==0 && Father!=none
		ParentRace=Father.GetLeveledActorBase().GetRace()
		if Mother!=none
			ParentRaceAlt=Mother.GetLeveledActorBase().GetRace()
		endif
	elseif Mother!=none
		ParentRace=Mother.GetLeveledActorBase().GetRace()
		if Father!=none
			ParentRaceAlt=Father.GetLeveledActorBase().GetRace()
		endif
	endIf
	;Debug.Notification("Child Parent Race: "+ParentRace.GetName()+" (ID: "+RaceID+")")
	if sex==0
		; Male
		Armor b=Manager.GetBabyArmor(ParentRace,0)
		Armor bAlt=Manager.GetBabyArmor(ParentRaceAlt,0)
		if b!=none
			LastRace = ParentRace
			return b
		elseif bAlt!=none
			LastRace = ParentRaceAlt
			return bAlt
		else
			return FallBack_MaleBabyArmor
		endif
	endIf
	
	Armor b=Manager.GetBabyArmor(ParentRace,1)
	Armor bAlt = none
	if ParentRaceAlt!=none
		bAlt=Manager.GetBabyArmor(ParentRaceAlt,0)
	endif
	if b!=none
		LastRace = ParentRace
		return b
	elseif bAlt!=none
		LastRace = ParentRaceAlt
		return bAlt
	else
		return FallBack_FemaleBabyArmor
	endIf
endFunction

ActorBase function getBabyActor(actor Mother, actor Father, int sex)
	if Mother == Game.GetPlayer() || Father == Game.GetPlayer()
		return getPlayerBabyActor(Mother, Father, sex)
	endif
	
	int BabyRaceRnd=Utility.RandomInt(0,1)
	race ParentRace
	race ParentRaceAlt
	
	race MotherRace = Mother.GetLeveledActorBase().GetRace()
	LastRace = MotherRace
	
	; Check Forces Babys
	if StorageUtil.GetIntValue(MotherRace, "FW.AddOn.Female_Force_This_Baby")==1
		int mCount=StorageUtil.FormListCount(MotherRace,"FW.AddOn.BabyActor_Male")
		int fCount=StorageUtil.FormListCount(MotherRace,"FW.AddOn.BabyActor_Female")
		if mCount>0 && sex==0
			; First, check Random child from list
			ActorBase force_mo_m=StorageUtil.FormListGet(MotherRace,"FW.AddOn.BabyActor_Male", Utility.RandomInt(0,mCount - 1)) as ActorBase
			if force_mo_m!=none
				return force_mo_m
			endif
			; Random Child was none, go through list
			int i=0
			while i<mCount
				i+=1
				force_mo_m=StorageUtil.FormListGet(MotherRace,"FW.AddOn.BabyActor_Male", i) as ActorBase
				if force_mo_m!=none
					return force_mo_m
				endif
			endwhile
		elseif fCount>0 && sex==1
			; First, check Random child from list
			ActorBase force_mo_f=StorageUtil.FormListGet(MotherRace,"FW.AddOn.BabyActor_Female", Utility.RandomInt(0,fCount - 1)) as ActorBase
			if force_mo_f!=none
				return force_mo_f
			endif
			; Random Child was none, go through list
			int i=0
			while i<mCount
				i+=1
				force_mo_f=StorageUtil.FormListGet(MotherRace,"FW.AddOn.BabyActor_Female", i) as ActorBase
				if force_mo_f!=none
					return force_mo_f
				endif
			endwhile
		endif
	endif
	
	; No forced Baby found - Use default methode to get the babys race
	if BabyRaceRnd==0 && Father!=none
		ParentRace=Father.GetLeveledActorBase().GetRace()
		if Mother!=none
			ParentRaceAlt=Mother.GetLeveledActorBase().GetRace()
		endif
	elseif Mother!=none
		ParentRace=Mother.GetLeveledActorBase().GetRace()
		if Father!=none
			ParentRaceAlt=Father.GetLeveledActorBase().GetRace()
		endif
	endIf
	;Debug.Notification("Child Parent Race: "+ParentRace.GetName()+" (ID: "+RaceID+")")
	if sex==0
		; Male
		ActorBase b=Manager.GetBabyActor(ParentRace,0)
		ActorBase bAlt=Manager.GetBabyActor(ParentRaceAlt,0)
		if b!=none
			LastRace = ParentRace
			return b
		elseif bAlt!=none
			LastRace = ParentRaceAlt
			return bAlt
		else
			return FallBack_MaleBabyActor
		endif
	endIf
	
	ActorBase b=Manager.GetBabyActor(ParentRace,1)
	ActorBase bAlt = none
	if ParentRaceAlt!=none
		bAlt=Manager.GetBabyActor(ParentRaceAlt,0)
	endif
	if b!=none
		LastRace = ParentRace
		return b
	elseif bAlt!=none
		LastRace = ParentRaceAlt
		return bAlt
	else
		return FallBack_FemaleBabyActor
	endIf
endFunction

ActorBase function getPlayerBabyActor(actor Mother, actor Father, int sex)
	int BabyRaceRnd=Utility.RandomInt(0,1)
	race ParentRace
	race ParentRaceAlt
	
	race MotherRace = Mother.GetLeveledActorBase().GetRace()
	LastRace = MotherRace
	
	; Check Forces Babys
	if StorageUtil.GetIntValue(MotherRace, "FW.AddOn.Female_Force_This_Baby")==1
		int mCount=StorageUtil.FormListCount(MotherRace,"FW.AddOn.BabyActor_MalePlayer")
		int fCount=StorageUtil.FormListCount(MotherRace,"FW.AddOn.BabyActor_FemalePlayer")
		if mCount>0 && sex==0
			; First, check Random child from list
			ActorBase force_mo_m=StorageUtil.FormListGet(MotherRace,"FW.AddOn.BabyActor_MalePlayer", Utility.RandomInt(0,mCount - 1)) as ActorBase
			if force_mo_m!=none
				return force_mo_m
			endif
			; Random Child was none, go through list
			int i=0
			while i<mCount
				i+=1
				force_mo_m=StorageUtil.FormListGet(MotherRace,"FW.AddOn.BabyActor_MalePlayer", i) as ActorBase
				if force_mo_m!=none
					return force_mo_m
				endif
			endwhile
		elseif fCount>0 && sex==1
			; First, check Random child from list
			ActorBase force_mo_f=StorageUtil.FormListGet(MotherRace,"FW.AddOn.BabyActor_FemalePlayer", Utility.RandomInt(0,fCount - 1)) as ActorBase
			if force_mo_f!=none
				return force_mo_f
			endif
			; Random Child was none, go through list
			int i=0
			while i<mCount
				i+=1
				force_mo_f=StorageUtil.FormListGet(MotherRace,"FW.AddOn.BabyActor_FemalePlayer", i) as ActorBase
				if force_mo_f!=none
					return force_mo_f
				endif
			endwhile
		endif
	endif
	
	; No forced Baby found - Use default methode to get the babys race
	if BabyRaceRnd==0 && Father!=none
		ParentRace=Father.GetLeveledActorBase().GetRace()
		if Mother!=none
			ParentRaceAlt=Mother.GetLeveledActorBase().GetRace()
		endif
	elseif Mother!=none
		ParentRace=Mother.GetLeveledActorBase().GetRace()
		if Father!=none
			ParentRaceAlt=Father.GetLeveledActorBase().GetRace()
		endif
	endIf
	;Debug.Notification("Child Parent Race: "+ParentRace.GetName()+" (ID: "+RaceID+")")
	if sex==0
		; Male
		ActorBase b=Manager.GetPlayerBabyActor(ParentRace,0)
		ActorBase bAlt=Manager.GetPlayerBabyActor(ParentRaceAlt,0)
		if b!=none
			LastRace = ParentRace
			return b
		elseif bAlt!=none
			LastRace = ParentRaceAlt
			return bAlt
		else
			return FallBack_MalePlayerBabyActor
		endif
	endIf
	
	ActorBase b=Manager.GetPlayerBabyActor(ParentRace,1)
	ActorBase bAlt = none
	if ParentRaceAlt!=none
		bAlt=Manager.GetPlayerBabyActor(ParentRaceAlt,0)
	endif
	if b!=none
		LastRace = ParentRace
		return b
	elseif bAlt!=none
		LastRace = ParentRaceAlt
		return bAlt
	else
		return FallBack_FemalePlayerBabyActor
	endIf
endFunction








ActorBase function getBabyActorByRace(race RaceID, int sex)
	;Debug.Notification("Child Parent Race: "+ParentRace.GetName()+" (ID: "+RaceID+")")
	if sex==0
		; Male
		ActorBase b=Manager.GetBabyActor(RaceID,0)
		if b!=none
			return b
		else
			return FallBack_MaleBabyActor
		endif
	endIf
	ActorBase b=Manager.GetBabyActor(RaceID,1)
	if b!=none
		return b
	else
		return FallBack_FemaleBabyActor
	endIf
endFunction

ActorBase function getPlayerBabyActorByRace(race RaceID, int sex)
	;Debug.Notification("Child Parent Race: "+ParentRace.GetName()+" (ID: "+RaceID+")")
	if sex==0
		; Male
		ActorBase b=Manager.GetPlayerBabyActor(RaceID,0)
		if b!=none
			return b
		else
			return FallBack_MalePlayerBabyActor
		endif
	endIf
	ActorBase b=Manager.GetPlayerBabyActor(RaceID,1)
	if b!=none
		return b
	else
		return FallBack_FemalePlayerBabyActor
	endIf
endFunction