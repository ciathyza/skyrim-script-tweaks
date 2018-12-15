;/ Decompiled by Champollion V1.0.1
Source   : FWBabyItemList.psc
Modified : 2016-12-28 02:42:15
Compiled : 2017-01-18 08:35:45
User     : admin
Computer : PATRICK
/;
scriptName FWBabyItemList extends Quest

;-- Properties --------------------------------------
fwaddonmanager property Manager auto
race property LastRace auto hidden
miscobject property FallBack_MaleBabyItem auto hidden
actorbase property FallBack_FemaleBabyActor auto
String[] property Male_Names auto
String[] property Female_Names auto
actorbase property FallBack_FemalePlayerBabyActor auto
actorbase property FallBack_MaleBabyActor auto
actorbase property FallBack_MalePlayerBabyActor auto
armor property FallBack_MaleBabyArmor auto
armor property FallBack_FemaleBabyArmor auto
miscobject property FallBack_FemaleBabyItem auto hidden

;-- Variables ---------------------------------------

;-- Functions ---------------------------------------

; Skipped compiler generated GotoState

actorbase function getPlayerBabyActor(actor Mother, actor Father, Int sex)

	race ParentRaceAlt
	race ParentRace
	Int BabyRaceRnd = utility.RandomInt(0, 1)
	race MotherRace = Mother.GetLeveledActorBase().GetRace()
	LastRace = MotherRace
	if storageutil.GetIntValue(MotherRace as form, "FW.AddOn.Female_Force_This_Baby", 0) == 1
		Int mCount = storageutil.FormListCount(MotherRace as form, "FW.AddOn.BabyActor_MalePlayer")
		Int fCount = storageutil.FormListCount(MotherRace as form, "FW.AddOn.BabyActor_FemalePlayer")
		if mCount > 0 && sex == 0
			actorbase force_mo_m = storageutil.FormListGet(MotherRace as form, "FW.AddOn.BabyActor_MalePlayer", utility.RandomInt(0, mCount - 1)) as actorbase
			if force_mo_m != none
				return force_mo_m
			endIf
			Int i = 0
			while i < mCount
				i += 1
				force_mo_m = storageutil.FormListGet(MotherRace as form, "FW.AddOn.BabyActor_MalePlayer", i) as actorbase
				if force_mo_m != none
					return force_mo_m
				endIf
			endWhile
		elseIf fCount > 0 && sex == 1
			actorbase force_mo_f = storageutil.FormListGet(MotherRace as form, "FW.AddOn.BabyActor_FemalePlayer", utility.RandomInt(0, fCount - 1)) as actorbase
			if force_mo_f != none
				return force_mo_f
			endIf
			Int i = 0
			while i < mCount
				i += 1
				force_mo_f = storageutil.FormListGet(MotherRace as form, "FW.AddOn.BabyActor_FemalePlayer", i) as actorbase
				if force_mo_f != none
					return force_mo_f
				endIf
			endWhile
		endIf
	endIf
	if BabyRaceRnd == 0 && Father != none
		ParentRace = Father.GetLeveledActorBase().GetRace()
		if Mother != none
			ParentRaceAlt = Mother.GetLeveledActorBase().GetRace()
		endIf
	elseIf Mother != none
		ParentRace = Mother.GetLeveledActorBase().GetRace()
		if Father != none
			ParentRaceAlt = Father.GetLeveledActorBase().GetRace()
		endIf
	endIf
	if sex == 0
		actorbase b = Manager.getPlayerBabyActor(ParentRace, 0)
		actorbase balt = Manager.getPlayerBabyActor(ParentRaceAlt, 0)
		if b != none
			LastRace = ParentRace
			return b
		elseIf balt != none
			LastRace = ParentRaceAlt
			return balt
		else
			return FallBack_MalePlayerBabyActor
		endIf
	endIf
	actorbase b = Manager.getPlayerBabyActor(ParentRace, 1)
	actorbase bAlt = none
	if ParentRaceAlt != none
		bAlt = Manager.getPlayerBabyActor(ParentRaceAlt, 0)
	endIf
	if b != none
		LastRace = ParentRace
		return b
	elseIf bAlt != none
		LastRace = ParentRaceAlt
		return bAlt
	else
		return FallBack_FemalePlayerBabyActor
	endIf
endFunction

actorbase function getBabyActor(actor Mother, actor Father, Int sex)

	race ParentRaceAlt
	race ParentRace
	if Mother == game.GetPlayer() || Father == game.GetPlayer()
		return self.getPlayerBabyActor(Mother, Father, sex)
	endIf
	Int BabyRaceRnd = utility.RandomInt(0, 1)
	race MotherRace = Mother.GetLeveledActorBase().GetRace()
	LastRace = MotherRace
	if storageutil.GetIntValue(MotherRace as form, "FW.AddOn.Female_Force_This_Baby", 0) == 1
		Int mCount = storageutil.FormListCount(MotherRace as form, "FW.AddOn.BabyActor_Male")
		Int fCount = storageutil.FormListCount(MotherRace as form, "FW.AddOn.BabyActor_Female")
		if mCount > 0 && sex == 0
			actorbase force_mo_m = storageutil.FormListGet(MotherRace as form, "FW.AddOn.BabyActor_Male", utility.RandomInt(0, mCount - 1)) as actorbase
			if force_mo_m != none
				return force_mo_m
			endIf
			Int i = 0
			while i < mCount
				i += 1
				force_mo_m = storageutil.FormListGet(MotherRace as form, "FW.AddOn.BabyActor_Male", i) as actorbase
				if force_mo_m != none
					return force_mo_m
				endIf
			endWhile
		elseIf fCount > 0 && sex == 1
			actorbase force_mo_f = storageutil.FormListGet(MotherRace as form, "FW.AddOn.BabyActor_Female", utility.RandomInt(0, fCount - 1)) as actorbase
			if force_mo_f != none
				return force_mo_f
			endIf
			Int i = 0
			while i < mCount
				i += 1
				force_mo_f = storageutil.FormListGet(MotherRace as form, "FW.AddOn.BabyActor_Female", i) as actorbase
				if force_mo_f != none
					return force_mo_f
				endIf
			endWhile
		endIf
	endIf
	if BabyRaceRnd == 0 && Father != none
		ParentRace = Father.GetLeveledActorBase().GetRace()
		if Mother != none
			ParentRaceAlt = Mother.GetLeveledActorBase().GetRace()
		endIf
	elseIf Mother != none
		ParentRace = Mother.GetLeveledActorBase().GetRace()
		if Father != none
			ParentRaceAlt = Father.GetLeveledActorBase().GetRace()
		endIf
	endIf
	if sex == 0
		actorbase b = Manager.getBabyActor(ParentRace, 0)
		actorbase balt = Manager.getBabyActor(ParentRaceAlt, 0)
		if b != none
			LastRace = ParentRace
			return b
		elseIf balt != none
			LastRace = ParentRaceAlt
			return balt
		else
			return FallBack_MaleBabyActor
		endIf
	endIf
	actorbase b = Manager.getBabyActor(ParentRace, 1)
	actorbase bAlt = none
	if ParentRaceAlt != none
		bAlt = Manager.getBabyActor(ParentRaceAlt, 0)
	endIf
	if b != none
		LastRace = ParentRace
		return b
	elseIf bAlt != none
		LastRace = ParentRaceAlt
		return bAlt
	else
		return FallBack_FemaleBabyActor
	endIf
endFunction

; Skipped compiler generated GetState

actorbase function getPlayerBabyActorByRace(race RaceID, Int sex)

	if sex == 0
		actorbase b = Manager.getPlayerBabyActor(RaceID, 0)
		if b != none
			return b
		else
			return FallBack_MalePlayerBabyActor
		endIf
	endIf
	actorbase b = Manager.getPlayerBabyActor(RaceID, 1)
	if b != none
		return b
	else
		return FallBack_FemalePlayerBabyActor
	endIf
endFunction

armor function getBabyArmor(actor Mother, actor Father, Int sex)

	race ParentRaceAlt
	race ParentRace
	Int BabyRaceRnd = utility.RandomInt(0, 1)
	race MotherRace = Mother.GetLeveledActorBase().GetRace()
	LastRace = MotherRace
	if storageutil.GetIntValue(MotherRace as form, "FW.AddOn.Female_Force_This_Baby", 0) == 1
		Int mCount = storageutil.FormListCount(MotherRace as form, "FW.AddOn.BabyArmor_Male")
		Int fCount = storageutil.FormListCount(MotherRace as form, "FW.AddOn.BabyArmor_Female")
		if mCount > 0 && sex == 0
			armor force_mo_m = storageutil.FormListGet(MotherRace as form, "FW.AddOn.BabyArmor_Male", utility.RandomInt(0, mCount - 1)) as armor
			if force_mo_m != none
				return force_mo_m
			endIf
			Int i = 0
			while i < mCount
				i += 1
				force_mo_m = storageutil.FormListGet(MotherRace as form, "FW.AddOn.BabyArmor_Male", i) as armor
				if force_mo_m != none
					return force_mo_m
				endIf
			endWhile
		elseIf fCount > 0 && sex == 1
			armor force_mo_f = storageutil.FormListGet(MotherRace as form, "FW.AddOn.BabyArmor_Female", utility.RandomInt(0, fCount - 1)) as armor
			if force_mo_f != none
				return force_mo_f
			endIf
			Int i = 0
			while i < mCount
				i += 1
				force_mo_f = storageutil.FormListGet(MotherRace as form, "FW.AddOn.BabyArmor_Female", i) as armor
				if force_mo_f != none
					return force_mo_f
				endIf
			endWhile
		endIf
	endIf
	if BabyRaceRnd == 0 && Father != none
		ParentRace = Father.GetLeveledActorBase().GetRace()
		if Mother != none
			ParentRaceAlt = Mother.GetLeveledActorBase().GetRace()
		endIf
	elseIf Mother != none
		ParentRace = Mother.GetLeveledActorBase().GetRace()
		if Father != none
			ParentRaceAlt = Father.GetLeveledActorBase().GetRace()
		endIf
	endIf
	if sex == 0
		armor b = Manager.getBabyArmor(ParentRace, 0)
		armor balt = Manager.getBabyArmor(ParentRaceAlt, 0)
		if b != none
			LastRace = ParentRace
			return b
		elseIf balt != none
			LastRace = ParentRaceAlt
			return balt
		else
			return FallBack_MaleBabyArmor
		endIf
	endIf
	armor b = Manager.getBabyArmor(ParentRace, 1)
	armor bAlt = none
	if ParentRaceAlt != none
		bAlt = Manager.getBabyArmor(ParentRaceAlt, 0)
	endIf
	if b != none
		LastRace = ParentRace
		return b
	elseIf bAlt != none
		LastRace = ParentRaceAlt
		return bAlt
	else
		return FallBack_FemaleBabyArmor
	endIf
endFunction

miscobject function getBabyItem(actor Mother, actor Father, Int sex)

	race ParentRaceAlt
	race ParentRace
	Int BabyRaceRnd = utility.RandomInt(0, 1)
	race MotherRace = Mother.GetLeveledActorBase().GetRace()
	LastRace = MotherRace
	if storageutil.GetIntValue(MotherRace as form, "FW.AddOn.Female_Force_This_Baby", 0) == 1
		Int mCount = storageutil.FormListCount(MotherRace as form, "FW.AddOn.BabyMesh_Male")
		Int fCount = storageutil.FormListCount(MotherRace as form, "FW.AddOn.BabyMesh_Female")
		if mCount > 0 && sex == 0
			miscobject force_mo_m = storageutil.FormListGet(MotherRace as form, "FW.AddOn.BabyMesh_Male", utility.RandomInt(0, mCount - 1)) as miscobject
			if force_mo_m != none
				return force_mo_m
			endIf
			Int i = 0
			while i < mCount
				i += 1
				force_mo_m = storageutil.FormListGet(MotherRace as form, "FW.AddOn.BabyMesh_Male", i) as miscobject
				if force_mo_m != none
					return force_mo_m
				endIf
			endWhile
		elseIf fCount > 0 && sex == 1
			miscobject force_mo_f = storageutil.FormListGet(MotherRace as form, "FW.AddOn.BabyMesh_Female", utility.RandomInt(0, fCount - 1)) as miscobject
			if force_mo_f != none
				return force_mo_f
			endIf
			Int i = 0
			while i < mCount
				i += 1
				force_mo_f = storageutil.FormListGet(MotherRace as form, "FW.AddOn.BabyMesh_Female", i) as miscobject
				if force_mo_f != none
					return force_mo_f
				endIf
			endWhile
		endIf
	endIf
	if BabyRaceRnd == 0 && Father != none
		ParentRace = Father.GetLeveledActorBase().GetRace()
		if Mother != none
			ParentRaceAlt = Mother.GetLeveledActorBase().GetRace()
		endIf
	elseIf Mother != none
		ParentRace = Mother.GetLeveledActorBase().GetRace()
		if Father != none
			ParentRaceAlt = Father.GetLeveledActorBase().GetRace()
		endIf
	endIf
	if sex == 0
		miscobject b = Manager.getBabyItem(ParentRace, 0)
		miscobject balt = Manager.getBabyItem(ParentRaceAlt, 0)
		if b != none
			LastRace = ParentRace
			return b
		elseIf balt != none
			LastRace = ParentRaceAlt
			return balt
		else
			return FallBack_MaleBabyItem
		endIf
	endIf
	miscobject b = Manager.getBabyItem(ParentRace, 1)
	miscobject bAlt = none
	if ParentRaceAlt != none
		bAlt = Manager.getBabyItem(ParentRaceAlt, 0)
	endIf
	if b != none
		LastRace = ParentRace
		return b
	elseIf bAlt != none
		LastRace = ParentRaceAlt
		return bAlt
	else
		return FallBack_FemaleBabyItem
	endIf
endFunction

actorbase function getBabyActorByRace(race RaceID, Int sex)

	if sex == 0
		actorbase b = Manager.getBabyActor(RaceID, 0)
		if b != none
			return b
		else
			return FallBack_MaleBabyActor
		endIf
	endIf
	actorbase b = Manager.getBabyActor(RaceID, 1)
	if b != none
		return b
	else
		return FallBack_FemaleBabyActor
	endIf
endFunction
