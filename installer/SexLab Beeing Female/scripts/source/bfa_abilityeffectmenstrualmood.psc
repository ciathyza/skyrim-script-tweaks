Scriptname BFA_AbilityEffectMenstrualMood extends activemagiceffect  
FWSystem property System Auto

actor PlayerRef
bool bUsed=false

Event OnEffectStart(Actor target, Actor caster)
	PlayerRef = target
	
	if System.cfg.NPCMenstrualMood || target==Game.GetPlayer()
		bUsed=true
	endif
	
	If PlayerRef && bUsed==true
		int rndMood=Utility.RandomInt(0,4) ; Random Mood
		if rndMood==0 && Game.GetPlayer() != target ; Happy
			PlayerRef.SetExpressionOverride(7,30)  ; Mood Neutral
			PlayerRef.SetExpressionOverride(2,80)  ; Dialogue Happy
			PlayerRef.SetExpressionOverride(10,75) ; Mood Happy
			PlayerRef.SetExpressionOverride(3,10)  ; Dialogue Sad
			PlayerRef.SetExpressionOverride(11,10) ; Mood Sad
			PlayerRef.SetExpressionOverride(0,4)   ; Dialogue Anger
			PlayerRef.SetExpressionOverride(8,8)   ; Mood Anger
			PlayerRef.SetExpressionOverride(6,3)   ; Dialogue Disgusted
			PlayerRef.SetExpressionOverride(14,8)  ; Mood Disgusted
		elseif rndMood==1 && Game.GetPlayer() != target ; Neutral
			PlayerRef.SetExpressionOverride(7,80)  ; Mood Neutral
			PlayerRef.SetExpressionOverride(2,30)  ; Dialogue Happy
			PlayerRef.SetExpressionOverride(10,30) ; Mood Happy
			PlayerRef.SetExpressionOverride(3,5)  ; Dialogue Sad
			PlayerRef.SetExpressionOverride(11,5) ; Mood Sad
			PlayerRef.SetExpressionOverride(0,3)   ; Dialogue Anger
			PlayerRef.SetExpressionOverride(8,3)   ; Mood Anger
			PlayerRef.SetExpressionOverride(6,0)   ; Dialogue Disgusted
			PlayerRef.SetExpressionOverride(14,8)  ; Mood Disgusted
		elseif rndMood==2 && Game.GetPlayer() != target ; Sad
			PlayerRef.SetExpressionOverride(7,20)  ; Mood Neutral
			PlayerRef.SetExpressionOverride(2,10)  ; Dialogue Happy
			PlayerRef.SetExpressionOverride(10,20) ; Mood Happy
			PlayerRef.SetExpressionOverride(3,80)  ; Dialogue Sad
			PlayerRef.SetExpressionOverride(11,80) ; Mood Sad
			PlayerRef.SetExpressionOverride(0,20)   ; Dialogue Anger
			PlayerRef.SetExpressionOverride(8,25)   ; Mood Anger
			PlayerRef.SetExpressionOverride(6,10)   ; Dialogue Disgusted
			PlayerRef.SetExpressionOverride(14,10)  ; Mood Disgusted
		elseif rndMood==3 && Game.GetPlayer() != target ; Anger
			PlayerRef.SetExpressionOverride(7,20)  ; Mood Neutral
			PlayerRef.SetExpressionOverride(2,0)  ; Dialogue Happy
			PlayerRef.SetExpressionOverride(10,0) ; Mood Happy
			PlayerRef.SetExpressionOverride(3,30)  ; Dialogue Sad
			PlayerRef.SetExpressionOverride(11,30) ; Mood Sad
			PlayerRef.SetExpressionOverride(0,85)   ; Dialogue Anger
			PlayerRef.SetExpressionOverride(8,85)   ; Mood Anger
			PlayerRef.SetExpressionOverride(6,35)   ; Dialogue Disgusted
			PlayerRef.SetExpressionOverride(14,20)  ; Mood Disgusted
			if Utility.RandomInt(0,9)>7 && System.cfg.NPCMenstrualNoTalk==true
				PlayerRef.AllowPCDialogue(false)
			endIf
		elseif rndMood==4 && Game.GetPlayer() != target ; Disgusted
			PlayerRef.SetExpressionOverride(7,40)  ; Mood Neutral
			PlayerRef.SetExpressionOverride(2,0)  ; Dialogue Happy
			PlayerRef.SetExpressionOverride(10,0) ; Mood Happy
			PlayerRef.SetExpressionOverride(3,30)  ; Dialogue Sad
			PlayerRef.SetExpressionOverride(11,30) ; Mood Sad
			PlayerRef.SetExpressionOverride(0,20)   ; Dialogue Anger
			PlayerRef.SetExpressionOverride(8,40)   ; Mood Anger
			PlayerRef.SetExpressionOverride(6,90)   ; Dialogue Disgusted
			PlayerRef.SetExpressionOverride(14,85)  ; Mood Disgusted
			if Utility.RandomInt(0,9)>4 && System.cfg.NPCMenstrualNoTalk==true
				PlayerRef.AllowPCDialogue(false)
			endIf
		endIf
	Else
		Dispel()
	EndIf
endEvent

Event OnEffectFinish(Actor target, Actor caster)
	If PlayerRef && bUsed==true
		PlayerRef.ClearExpressionOverride()
		PlayerRef.AllowPCDialogue(PlayerRef.GetRace().AllowPCDialogue())
	EndIf
endEvent
