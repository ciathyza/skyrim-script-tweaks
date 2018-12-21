Scriptname BFA_VisualEffects extends FWAddOn_Misc  

Imagespacemodifier property Mittelschmerz1 auto
Imagespacemodifier property Mittelschmerz2 auto
Imagespacemodifier property Mittelschmerz3 auto

Imagespacemodifier property MenstrualCamps1 auto
Imagespacemodifier property MenstrualCamps2 auto
Imagespacemodifier property MenstrualCamps3 auto

Imagespacemodifier property Premonitory auto

Imagespacemodifier property FirstStage auto

Imagespacemodifier property BearingDown1 auto
Imagespacemodifier property BearingDown2 auto
Imagespacemodifier property BearingDown3 auto

Imagespacemodifier property AfterPains1 auto
Imagespacemodifier property AfterPains2 auto
Imagespacemodifier property AfterPains3 auto

float LastIModTime = 0.0
float ImodPause = 5.0


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

function OnDoDamageStart(actor a, float Amount, int DamageType, float OptionalArgument)
	; Only allow imod every X seconds (5 sec)
	if LastIModTime < Utility.GetCurrentRealTime() - ImodPause
		return
	endif
	if a==Game.GetPlayer()
		Imagespacemodifier use
		int rnd= Utility.RandomInt(0,10)
		if DamageType==1
			if rnd<4
				use = Mittelschmerz1
			elseif rnd<8
				use = Mittelschmerz2
			else
				use = Mittelschmerz3
			endif
		elseif DamageType==3
			if rnd<4
				use = MenstrualCamps1
			elseif rnd<8
				use = MenstrualCamps2
			else
				use = MenstrualCamps3
			endif
		elseif DamageType==7
			use = Premonitory
		elseif DamageType==8
			use = FirstStage
		elseif DamageType==10
			if rnd<4
				use = BearingDown1
			elseif rnd<8
				use = BearingDown2
			else
				use = BearingDown3
			endif
		elseif DamageType==11
			if rnd<4
				use = AfterPains1
			elseif rnd<8
				use = AfterPains2
			else
				use = AfterPains3
			endif
		endif
		
		if use!=none
			LastIModTime = Utility.GetCurrentRealTime()
			use.Apply()
		endif
	endif
endFunction