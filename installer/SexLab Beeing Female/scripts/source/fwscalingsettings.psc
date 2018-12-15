;/ Decompiled by Champollion V1.0.1
Source   : FWScalingSettings.psc
Modified : 2016-12-06 03:52:45
Compiled : 2017-01-18 08:35:17
User     : admin
Computer : PATRICK
/;
scriptName FWScalingSettings

;-- Properties --------------------------------------

;-- Variables ---------------------------------------

;-- Functions ---------------------------------------

Float function Immediately(Int NodeSet, Int PhaseID) global

	if NodeSet == 0
		if PhaseID == 0
			return 0.500000
		elseIf PhaseID == 1
			return 0.200000
		elseIf PhaseID == 2
			return 0.300000
		endIf
	elseIf NodeSet == 1
		if PhaseID == 0
			return 0.700000
		elseIf PhaseID == 1
			return 0.150000
		elseIf PhaseID == 2
			return 0.150000
		endIf
	endIf
endFunction

Float function Belly(Int NodeSet, Int PhaseID) global

	if NodeSet == 0
		if PhaseID == 0
			return 0.250000
		elseIf PhaseID == 1
			return 0.350000
		elseIf PhaseID == 2
			return 0.400000
		endIf
	elseIf NodeSet == 1
		if PhaseID == 0
			return 0.0500000
		elseIf PhaseID == 1
			return 0.100000
		elseIf PhaseID == 2
			return 0.850000
		endIf
	endIf
endFunction

Float function Breasts(Int NodeSet, Int PhaseID) global

	if NodeSet == 0
		if PhaseID == 0
			return 0.0100000
		elseIf PhaseID == 1
			return 0.0500000
		elseIf PhaseID == 2
			return 0.940000
		endIf
	elseIf NodeSet == 1
		if PhaseID == 0
			return 0.200000
		elseIf PhaseID == 1
			return 0.350000
		elseIf PhaseID == 2
			return 0.450000
		endIf
	endIf
endFunction

Float function Realistic(Int NodeSet, Int PhaseID) global

	if NodeSet == 0
		if PhaseID == 0
			return 0.150000
		elseIf PhaseID == 1
			return 0.500000
		elseIf PhaseID == 2
			return 0.350000
		endIf
	elseIf NodeSet == 1
		if PhaseID == 0
			return 0.0500000
		elseIf PhaseID == 1
			return 0.200000
		elseIf PhaseID == 2
			return 0.750000
		endIf
	endIf
endFunction

Float function Linear(Int NodeSet, Int PhaseID) global

	if NodeSet == 0
		if PhaseID == 0
			return 0.330000
		elseIf PhaseID == 1
			return 0.330000
		elseIf PhaseID == 2
			return 0.340000
		endIf
	elseIf NodeSet == 1
		if PhaseID == 0
			return 0.330000
		elseIf PhaseID == 1
			return 0.330000
		elseIf PhaseID == 2
			return 0.340000
		endIf
	endIf
endFunction

Float function Late(Int NodeSet, Int PhaseID) global

	if NodeSet == 0
		if PhaseID == 0
			return 0.0500000
		elseIf PhaseID == 1
			return 0.0500000
		elseIf PhaseID == 2
			return 0.900000
		endIf
	elseIf NodeSet == 1
		if PhaseID == 0
			return 0.0500000
		elseIf PhaseID == 1
			return 0.0800000
		elseIf PhaseID == 2
			return 0.870000
		endIf
	endIf
endFunction

; Skipped compiler generated GetState

; Skipped compiler generated GotoState

function onEndState()
{Event received when this state is switched away from}

	; Empty function
endFunction

function onBeginState()
{Event received when this state is switched to}

	; Empty function
endFunction
