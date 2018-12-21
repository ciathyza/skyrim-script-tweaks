Scriptname FWAddOn_MiscBasicPain extends FWAddOn_Misc  

FWSystem property System auto

ImageSpaceModifier Property LowerPain Auto
ImageSpaceModifier Property MiddlePain Auto
ImageSpaceModifier Property HigherPain Auto
ImageSpaceModifier Property CriticalPain Auto
ImageSpaceModifier Property LaborPainImodLow Auto
ImageSpaceModifier Property LaborPainImodMiddle Auto
ImageSpaceModifier Property LaborPainImodHigh Auto


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
	if DamageType== 1 || (DamageType == 3 && OptionalArgument<1.8) || System==none
		return
	endif
	
	; Blur
	if a==Game.GetPlayer()
		if DamageType==7 ; Vorwehen
			System.Blur(0.5, LowerPain)
		elseif DamageType==8 ; Eröffnungswehen
			System.Blur(1, LowerPain)
		elseif DamageType==10
			System.Blur(1, LaborPainImodMiddle)
		elseif DamageType==9
			System.Blur(1, LaborPainImodHigh)
		elseif DamageType==11
			System.Blur(0.5, LowerPain)
		
		elseif DamageType==1 || (Amount>=2 && Amount < 4)
			System.Blur(0.5, LowerPain)
		elseif Amount>=4 && Amount < 5
			System.Blur(1, LowerPain)
			
		elseif Amount>=5 && Amount < 8
			System.Blur(0.5, MiddlePain)
		elseif Amount>=8 && Amount < 10
			System.Blur(1, MiddlePain)
			
		elseif Amount>=10 && Amount < 15
			System.Blur(0.5, HigherPain)
		elseif Amount>=15 && Amount < 30
			System.Blur(1, HigherPain)
			
		elseif Amount>=30 && Amount < 60
			System.Blur(0.5, CriticalPain)
		else
			System.Blur(1, CriticalPain)
			
		endIf
	endIf

	; BleedOut
	if Amount>12
		System.PlayBleedOut(a)
	endIf
endFunction

function OnDoDamageEnd(actor a, float Amount, int DamageType, float OptionalArgument)
	if Amount>12 && System!=none
		System.StopBleedOut(a)
	endIf
endFunction