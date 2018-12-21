Scriptname FWSpellChildOrder extends ActiveMagicEffect


{ Area Type: 0 = same Location; 1 = all}
int property AreaType = 0 auto

{ TeleportTo: 0 = don't teleport; 1 = to caster; 2 = to spoon; 3 = to home; 4 = to meet point }
int property TeleportTo = 0 auto

{ the Order the child should have }
int property Order_ID = 0 auto



Event OnEffectStart(Actor akTarget, Actor akCaster)
	; Get the Child Setting Quest to read spoon / house / meet point / ...
	Quest q = none
	if TeleportTo>1
		int cq = Game.GetModCount()
		string modName = ""
		while cq>0
			cq -=1
			string t = Game.GetModName(cq)
			if(t == "BeeingFemale.esp")
				modName = "BeeingFemale.esp"
				cq=0
			elseif(t=="BeeingFemale.esm")
				modName = "BeeingFemale.esm"
				cq=0
			endif
		endWhile
		if(modName!="")
			q = Game.GetFormFromFile(0x1ACB8 ,modName) as Quest
		endif
	endif
	
	; Go throw all babys
	int c = StorageUtil.FormListCount(none,"FW.Babys")
	while c > 0
		c-=1
		FWChildActor ca = StorageUtil.FormListGet(none, "FW.Babys", c) as FWChildActor
		if ca!=none
			; Check if the the caster is a parent of the child
			if(StorageUtil.GetFormValue(ca, "FW.Child.Mother") == akCaster || StorageUtil.GetFormValue(ca, "FW.Child.Father") == akCaster)
				if(AreaType == 1 || ca.IsInLocation(akCaster.GetCurrentLocation()))
					if(TeleportTo == 1)
						ca.MoveTo(akCaster)
					elseif(TeleportTo == 2 && q!=none)
						TeleportTo(ca, q, "PlayerHome")
					elseif(TeleportTo == 3 && q!=none)
						TeleportTo(ca, q, "OtherParent")
					elseif(TeleportTo == 4 && q!=none)
						TeleportTo(ca, q, "MeetPoint")
					endif
					ca.Order = Order_ID
					ca.EvaluatePackage()
				endif
			endif
		endif
	endwhile
EndEvent

function TeleportTo(Actor c, quest q, string AliasName)
	alias a = q.GetAliasByName(AliasName)
	if(a!=none)
		ReferenceAlias ra = a as ReferenceAlias
		LocationAlias la = a as LocationAlias
		if(ra != none)
			c.MoveTo(ra.GetRef())
		;elseif(la != none)
			;Debug.Trace("Failed to teleport child '" + c.GetDisplayName() + "' - Not possible to teleport to an LocationAlias")
			;c.MoveToInteractionLocation(la.GetLocation())
		;else
			;Debug.Trace("Failed to teleport child '" + c.GetDisplayName() + "' - No validate alias")
		endif
	;else
		;Debug.Trace("Failed to teleport child '" + c.GetDisplayName() + "' - Unknown alias")
	endif
endfunction