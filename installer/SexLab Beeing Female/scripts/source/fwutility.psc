;/ Decompiled by Champollion V1.0.1
Source   : FWUtility.psc
Modified : 2017-01-18 08:34:33
Compiled : 2017-01-18 08:35:03
User     : admin
Computer : PATRICK
/;
scriptName FWUtility

;-- Properties --------------------------------------

;-- Variables ---------------------------------------

;-- Functions ---------------------------------------

String function GetTimeString(Float akTime, Bool akShortFormat, String akNegativeText) global

	String sign = ""
	if akTime < 0.000000
		if akNegativeText != ""
			return akNegativeText
		endIf
		sign = "-"
		akTime *= -1.00000
	endIf
	String timeString = ""
	Int val = akTime as Int
	if val != 0
		timeString += val as String
		if akShortFormat
			timeString += "d "
		elseIf val == 1
			timeString += "day "
		else
			timeString += "days "
		endIf
	endIf
	akTime = (akTime - val as Float) * 24.0000
	val = akTime as Int
	if val != 0
		timeString += val as String
		if akShortFormat
			timeString += "h "
		elseIf val == 1
			timeString += "hour "
		else
			timeString += "hours "
		endIf
	endIf
	akTime = (akTime - val as Float) * 60.0000
	val = akTime as Int
	if val != 0
		timeString += val as String
		if akShortFormat
			timeString += "m"
		elseIf val == 1
			timeString += "minute"
		else
			timeString += "minutes"
		endIf
	endIf
	return sign + timeString
endFunction

Int function GetFileCount(String argPath, String extention) global native

function UnequipItem(actor a, form item) global

	if item != none && a != none
		if a.IsEquipped(item)
			a.UnequipItem(item, true, true)
		endIf
		a.RemoveItem(item, 1, true, none)
	endIf
endFunction

String function getRandomName(Int iSex) global

	String lang = utility.getIniString("sLanguage:General")
	String path = "../../../BeeingFemale/Names/"
	String Full = path + "BeeingFemaleNames_" + lang + ".json"
	String ssex = ""
	if iSex == 0
		ssex = "male"
	elseIf iSex == 1
		ssex = "female"
	endIf
	Int Count = jsonutil.StringListCount(Full, ssex)
	Int id = utility.RandomInt(0, Count - 1)
	String sName = jsonutil.StringListGet(Full, ssex, id)
	return sName
endFunction

String function SwitchString(Bool cond, String a, String b) global

	if cond
		return a
	endIf
	return b
endFunction

function UnlockPlayer() global

	actor PlayerRef = game.GetPlayer()
	game.SetPlayerAIDriven(false)
	game.SetInChargen(false, false, false)
endFunction

function setIniInt(String Type, String File, String Variable, Int value) global native

Bool function IsNumber(String Char) global

	if Char == "0"
		return true
	elseIf Char == "1"
		return true
	elseIf Char == "2"
		return true
	elseIf Char == "3"
		return true
	elseIf Char == "4"
		return true
	elseIf Char == "5"
		return true
	elseIf Char == "6"
		return true
	elseIf Char == "7"
		return true
	elseIf Char == "8"
		return true
	elseIf Char == "9"
		return true
	endIf
	return false
endFunction

function EquipItem(actor a, form item) global

	if item != none && a != none
		a.addItem(item, 1, true)
		if !a.IsEquipped(item)
			a.EquipItem(item, false, true)
		endIf
	endIf
endFunction

String function GetModFromString(String S, Bool bExtension) global native

String function ScriptUser(String script) global native

String function getNextAutoFile(String Directory, String FileName, String Ext) global native

Bool function ScriptHasString(String script, String str) global native

String function GetDirectoryHash(String dir) global native

quest function GetQuestObject(String ModName, Int index) global native

String function _getStateName_(Int StateID) global

	if StateID == 0
		return "Follicular Phase"
	elseIf StateID == 1
		return "Ovulation"
	elseIf StateID == 2
		return "Luteal Phase"
	elseIf StateID == 3
		return "Menstruation"
	elseIf StateID == 4
		return "1st Pregnancy State"
	elseIf StateID == 5
		return "2nd Pregnancy State"
	elseIf StateID == 6
		return "3rd Pregnancy State"
	elseIf StateID == 7
		return "LaborPains"
	elseIf StateID == 8
		return "Recovery Phase"
	elseIf StateID == 20
		return "Pregnant"
	elseIf StateID == 21
		return "Pregnant by chaurus"
	endIf
endFunction

String function GetStringFromRaces(Race[] frms) global

	Int i = 0
	String S = ""
	Int c = frms.length
	while i < c
		String tmp = FWUtility.GetStringFromForm(frms[i] as form)
		if tmp != ""
			if i > 0
				S += ","
			endIf
			S += tmp
		endIf
		i += 1
	endWhile
	return S
endFunction

Int function GetQuestObjectCount(String ModName) global native

Float function getIniFloat(String Type, String File, String Variable, Float Default) global native

String function Hex(Int value, Int Digits) global native

String function MultiStringReplace(String Text, String Replace0, String Replace1, String Replace2, String Replace3, String Replace4, String Replace5) global native

Int function MinInt(Int a, Int b) global

	if a < b
		return a
	endIf
	return b
endFunction

String function getIniCString(String Type, String File, String Categorie, String Variable, String Default) global native

Actor[] function ActorArrayAppend(Actor[] OldArray, actor Append, Int Count) global

	Int c = OldArray.length
	if c == 0
		Actor[] t = FWUtility.ActorArray(Count)
		while Count > 0
			Count -= 1
			t[Count] = Append
		endWhile
		return t
	elseIf c > 127
		return OldArray
	endIf
	if c + Count > 127
		Count = 127
	endIf
	Actor[] na = FWUtility.ActorArray(c + Count)
	while Count > 0
		Count -= 1
		na[c + Count] = Append
	endWhile
	while c > 0
		c -= 1
		na[c] = OldArray[c]
	endWhile
	return na
endFunction

String function GetFileName(String argPath, String extention, Int fileID) global native

Float function MinFloat(Float a, Float b) global

	if a < b
		return a
	endIf
	return b
endFunction

String function getTypeString(Int fileID) global native

function setIniCBool(String Type, String File, String Categorie, String Variable, Bool value) global native

Int function SwitchInt(Bool cond, Int a, Int b) global

	if cond
		return a
	endIf
	return b
endFunction

String function GetIniFileCombine(String Mod, String Hex) global

	return Mod + "_" + Hex + ".ini"
endFunction

Bool function OpenChildMenu(FWChildActor Child) global

	if Child == none
		return false
	endIf
	Child.OpenSkillMenu()
endFunction

Int function GetFormIDFromString(String S) global native

Int function getIniCInt(String Type, String File, String Categorie, String Variable, Int Default) global native

Actor[] function ActorArrayResize(Actor[] OldArray, Int NewSize) global

	Actor[] res = FWUtility.ActorArray(NewSize)
	Int i = 0
	while i < NewSize && i < OldArray.length
		res[i] = OldArray[i]
		i += 1
	endWhile
	return res
endFunction

String function GetStringFromForm(form frm) global native

function setIniFloat(String Type, String File, String Variable, Float value) global native

function setIniCString(String Type, String File, String Categorie, String Variable, String value) global native

Form[] function FormArray(Int size) global

	size = FWUtility.ClampInt(size, 1, 128)
	if size > 64
		if size > 96
			if size > 112
				if size > 120
					if size > 124
						if size > 126
							if size == 128
								return new Form[128]
							else
								return new Form[127]
							endIf
						elseIf size == 126
							return new Form[126]
						else
							return new Form[125]
						endIf
					elseIf size > 122
						if size == 124
							return new Form[124]
						else
							return new Form[123]
						endIf
					elseIf size == 122
						return new Form[122]
					else
						return new Form[121]
					endIf
				elseIf size > 116
					if size > 118
						if size == 120
							return new Form[120]
						else
							return new Form[119]
						endIf
					elseIf size == 118
						return new Form[118]
					else
						return new Form[117]
					endIf
				elseIf size > 114
					if size == 116
						return new Form[116]
					else
						return new Form[115]
					endIf
				elseIf size == 114
					return new Form[114]
				else
					return new Form[113]
				endIf
			elseIf size > 104
				if size > 108
					if size > 110
						if size == 112
							return new Form[112]
						else
							return new Form[111]
						endIf
					elseIf size == 110
						return new Form[110]
					else
						return new Form[109]
					endIf
				elseIf size > 106
					if size == 108
						return new Form[108]
					else
						return new Form[107]
					endIf
				elseIf size == 106
					return new Form[106]
				else
					return new Form[105]
				endIf
			elseIf size > 100
				if size > 102
					if size == 104
						return new Form[104]
					else
						return new Form[103]
					endIf
				elseIf size == 102
					return new Form[102]
				else
					return new Form[101]
				endIf
			elseIf size > 98
				if size == 100
					return new Form[100]
				else
					return new Form[99]
				endIf
			elseIf size == 98
				return new Form[98]
			else
				return new Form[97]
			endIf
		elseIf size > 80
			if size > 88
				if size > 92
					if size > 94
						if size == 96
							return new Form[96]
						else
							return new Form[95]
						endIf
					elseIf size == 94
						return new Form[94]
					else
						return new Form[93]
					endIf
				elseIf size > 90
					if size == 92
						return new Form[92]
					else
						return new Form[91]
					endIf
				elseIf size == 90
					return new Form[90]
				else
					return new Form[89]
				endIf
			elseIf size > 84
				if size > 86
					if size == 88
						return new Form[88]
					else
						return new Form[87]
					endIf
				elseIf size == 86
					return new Form[86]
				else
					return new Form[85]
				endIf
			elseIf size > 82
				if size == 84
					return new Form[84]
				else
					return new Form[83]
				endIf
			elseIf size == 82
				return new Form[82]
			else
				return new Form[81]
			endIf
		elseIf size > 72
			if size > 76
				if size > 78
					if size == 80
						return new Form[80]
					else
						return new Form[79]
					endIf
				elseIf size == 78
					return new Form[78]
				else
					return new Form[77]
				endIf
			elseIf size > 74
				if size == 76
					return new Form[76]
				else
					return new Form[75]
				endIf
			elseIf size == 74
				return new Form[74]
			else
				return new Form[73]
			endIf
		elseIf size > 68
			if size > 70
				if size == 72
					return new Form[72]
				else
					return new Form[71]
				endIf
			elseIf size == 70
				return new Form[70]
			else
				return new Form[69]
			endIf
		elseIf size > 66
			if size == 68
				return new Form[68]
			else
				return new Form[67]
			endIf
		elseIf size == 66
			return new Form[66]
		else
			return new Form[65]
		endIf
	elseIf size > 32
		if size > 48
			if size > 56
				if size > 60
					if size > 62
						if size == 64
							return new Form[64]
						else
							return new Form[63]
						endIf
					elseIf size == 62
						return new Form[62]
					else
						return new Form[61]
					endIf
				elseIf size > 58
					if size == 60
						return new Form[60]
					else
						return new Form[59]
					endIf
				elseIf size == 58
					return new Form[58]
				else
					return new Form[57]
				endIf
			elseIf size > 52
				if size > 54
					if size == 56
						return new Form[56]
					else
						return new Form[55]
					endIf
				elseIf size == 54
					return new Form[54]
				else
					return new Form[53]
				endIf
			elseIf size > 50
				if size == 52
					return new Form[52]
				else
					return new Form[51]
				endIf
			elseIf size == 50
				return new Form[50]
			else
				return new Form[49]
			endIf
		elseIf size > 40
			if size > 44
				if size > 46
					if size == 48
						return new Form[48]
					else
						return new Form[47]
					endIf
				elseIf size == 46
					return new Form[46]
				else
					return new Form[45]
				endIf
			elseIf size > 42
				if size == 44
					return new Form[44]
				else
					return new Form[43]
				endIf
			elseIf size == 42
				return new Form[42]
			else
				return new Form[41]
			endIf
		elseIf size > 36
			if size > 38
				if size == 40
					return new Form[40]
				else
					return new Form[39]
				endIf
			elseIf size == 38
				return new Form[38]
			else
				return new Form[37]
			endIf
		elseIf size > 34
			if size == 36
				return new Form[36]
			else
				return new Form[35]
			endIf
		elseIf size == 34
			return new Form[34]
		else
			return new Form[33]
		endIf
	elseIf size > 16
		if size > 24
			if size > 28
				if size > 30
					if size == 32
						return new Form[32]
					else
						return new Form[31]
					endIf
				elseIf size == 30
					return new Form[30]
				else
					return new Form[29]
				endIf
			elseIf size > 26
				if size == 28
					return new Form[28]
				else
					return new Form[27]
				endIf
			elseIf size == 26
				return new Form[26]
			else
				return new Form[25]
			endIf
		elseIf size > 20
			if size > 22
				if size == 24
					return new Form[24]
				else
					return new Form[23]
				endIf
			elseIf size == 22
				return new Form[22]
			else
				return new Form[21]
			endIf
		elseIf size > 18
			if size == 20
				return new Form[20]
			else
				return new Form[19]
			endIf
		elseIf size == 18
			return new Form[18]
		else
			return new Form[17]
		endIf
	elseIf size > 8
		if size > 12
			if size > 14
				if size == 16
					return new Form[16]
				else
					return new Form[15]
				endIf
			elseIf size == 14
				return new Form[14]
			else
				return new Form[13]
			endIf
		elseIf size > 10
			if size == 12
				return new Form[12]
			else
				return new Form[11]
			endIf
		elseIf size == 10
			return new Form[10]
		else
			return new Form[9]
		endIf
	elseIf size > 4
		if size > 6
			if size == 8
				return new Form[8]
			else
				return new Form[7]
			endIf
		elseIf size == 6
			return new Form[6]
		else
			return new Form[5]
		endIf
	elseIf size > 2
		if size == 4
			return new Form[4]
		else
			return new Form[3]
		endIf
	elseIf size == 2
		return new Form[2]
	else
		return new Form[1]
	endIf
endFunction

String function ScriptMashine(String script) global native

String function GetVersionString(String modDesc) global

	Bool bRunning = true
	Int startpos = 0
	Int vpos = 0
	Int descLen = stringutil.GetLength(modDesc)
	while bRunning
		vpos = stringutil.Find(modDesc, "ersion", vpos)
		if vpos > 0
			if stringutil.GetNthChar(modDesc, vpos - 1) == "V" || stringutil.GetNthChar(modDesc, vpos - 1) == "V"
				vpos += 6
				while stringutil.GetNthChar(modDesc, vpos) != ":" && stringutil.GetNthChar(modDesc, vpos) != " " && vpos < descLen
					vpos += 1
				endWhile
				startpos = vpos
				while (FWUtility.IsNumber(stringutil.Substring(modDesc, vpos, 1)) || stringutil.Substring(modDesc, vpos, 1) == ".") && vpos < descLen
					vpos += 1
				endWhile
				vpos -= 1
				if stringutil.Substring(modDesc, vpos + 1, 1) == "b"
					return "Beta " + stringutil.Substring(modDesc, startpos, vpos - startpos)
				else
					return stringutil.Substring(modDesc, startpos, vpos - startpos)
				endIf
			endIf
		else
			bRunning = false
		endIf
	endWhile
	return "Undefined"
endFunction

String[] function StringArray(Int size) global

	size = FWUtility.ClampInt(size, 1, 128)
	if size > 64
		if size > 96
			if size > 112
				if size > 120
					if size > 124
						if size > 126
							if size == 128
								return new String[128]
							else
								return new String[127]
							endIf
						elseIf size == 126
							return new String[126]
						else
							return new String[125]
						endIf
					elseIf size > 122
						if size == 124
							return new String[124]
						else
							return new String[123]
						endIf
					elseIf size == 122
						return new String[122]
					else
						return new String[121]
					endIf
				elseIf size > 116
					if size > 118
						if size == 120
							return new String[120]
						else
							return new String[119]
						endIf
					elseIf size == 118
						return new String[118]
					else
						return new String[117]
					endIf
				elseIf size > 114
					if size == 116
						return new String[116]
					else
						return new String[115]
					endIf
				elseIf size == 114
					return new String[114]
				else
					return new String[113]
				endIf
			elseIf size > 104
				if size > 108
					if size > 110
						if size == 112
							return new String[112]
						else
							return new String[111]
						endIf
					elseIf size == 110
						return new String[110]
					else
						return new String[109]
					endIf
				elseIf size > 106
					if size == 108
						return new String[108]
					else
						return new String[107]
					endIf
				elseIf size == 106
					return new String[106]
				else
					return new String[105]
				endIf
			elseIf size > 100
				if size > 102
					if size == 104
						return new String[104]
					else
						return new String[103]
					endIf
				elseIf size == 102
					return new String[102]
				else
					return new String[101]
				endIf
			elseIf size > 98
				if size == 100
					return new String[100]
				else
					return new String[99]
				endIf
			elseIf size == 98
				return new String[98]
			else
				return new String[97]
			endIf
		elseIf size > 80
			if size > 88
				if size > 92
					if size > 94
						if size == 96
							return new String[96]
						else
							return new String[95]
						endIf
					elseIf size == 94
						return new String[94]
					else
						return new String[93]
					endIf
				elseIf size > 90
					if size == 92
						return new String[92]
					else
						return new String[91]
					endIf
				elseIf size == 90
					return new String[90]
				else
					return new String[89]
				endIf
			elseIf size > 84
				if size > 86
					if size == 88
						return new String[88]
					else
						return new String[87]
					endIf
				elseIf size == 86
					return new String[86]
				else
					return new String[85]
				endIf
			elseIf size > 82
				if size == 84
					return new String[84]
				else
					return new String[83]
				endIf
			elseIf size == 82
				return new String[82]
			else
				return new String[81]
			endIf
		elseIf size > 72
			if size > 76
				if size > 78
					if size == 80
						return new String[80]
					else
						return new String[79]
					endIf
				elseIf size == 78
					return new String[78]
				else
					return new String[77]
				endIf
			elseIf size > 74
				if size == 76
					return new String[76]
				else
					return new String[75]
				endIf
			elseIf size == 74
				return new String[74]
			else
				return new String[73]
			endIf
		elseIf size > 68
			if size > 70
				if size == 72
					return new String[72]
				else
					return new String[71]
				endIf
			elseIf size == 70
				return new String[70]
			else
				return new String[69]
			endIf
		elseIf size > 66
			if size == 68
				return new String[68]
			else
				return new String[67]
			endIf
		elseIf size == 66
			return new String[66]
		else
			return new String[65]
		endIf
	elseIf size > 32
		if size > 48
			if size > 56
				if size > 60
					if size > 62
						if size == 64
							return new String[64]
						else
							return new String[63]
						endIf
					elseIf size == 62
						return new String[62]
					else
						return new String[61]
					endIf
				elseIf size > 58
					if size == 60
						return new String[60]
					else
						return new String[59]
					endIf
				elseIf size == 58
					return new String[58]
				else
					return new String[57]
				endIf
			elseIf size > 52
				if size > 54
					if size == 56
						return new String[56]
					else
						return new String[55]
					endIf
				elseIf size == 54
					return new String[54]
				else
					return new String[53]
				endIf
			elseIf size > 50
				if size == 52
					return new String[52]
				else
					return new String[51]
				endIf
			elseIf size == 50
				return new String[50]
			else
				return new String[49]
			endIf
		elseIf size > 40
			if size > 44
				if size > 46
					if size == 48
						return new String[48]
					else
						return new String[47]
					endIf
				elseIf size == 46
					return new String[46]
				else
					return new String[45]
				endIf
			elseIf size > 42
				if size == 44
					return new String[44]
				else
					return new String[43]
				endIf
			elseIf size == 42
				return new String[42]
			else
				return new String[41]
			endIf
		elseIf size > 36
			if size > 38
				if size == 40
					return new String[40]
				else
					return new String[39]
				endIf
			elseIf size == 38
				return new String[38]
			else
				return new String[37]
			endIf
		elseIf size > 34
			if size == 36
				return new String[36]
			else
				return new String[35]
			endIf
		elseIf size == 34
			return new String[34]
		else
			return new String[33]
		endIf
	elseIf size > 16
		if size > 24
			if size > 28
				if size > 30
					if size == 32
						return new String[32]
					else
						return new String[31]
					endIf
				elseIf size == 30
					return new String[30]
				else
					return new String[29]
				endIf
			elseIf size > 26
				if size == 28
					return new String[28]
				else
					return new String[27]
				endIf
			elseIf size == 26
				return new String[26]
			else
				return new String[25]
			endIf
		elseIf size > 20
			if size > 22
				if size == 24
					return new String[24]
				else
					return new String[23]
				endIf
			elseIf size == 22
				return new String[22]
			else
				return new String[21]
			endIf
		elseIf size > 18
			if size == 20
				return new String[20]
			else
				return new String[19]
			endIf
		elseIf size == 18
			return new String[18]
		else
			return new String[17]
		endIf
	elseIf size > 8
		if size > 12
			if size > 14
				if size == 16
					return new String[16]
				else
					return new String[15]
				endIf
			elseIf size == 14
				return new String[14]
			else
				return new String[13]
			endIf
		elseIf size > 10
			if size == 12
				return new String[12]
			else
				return new String[11]
			endIf
		elseIf size == 10
			return new String[10]
		else
			return new String[9]
		endIf
	elseIf size > 4
		if size > 6
			if size == 8
				return new String[8]
			else
				return new String[7]
			endIf
		elseIf size == 6
			return new String[6]
		else
			return new String[5]
		endIf
	elseIf size > 2
		if size == 4
			return new String[4]
		else
			return new String[3]
		endIf
	elseIf size == 2
		return new String[2]
	else
		return new String[1]
	endIf
endFunction

Int[] function IntArray(Int size) global

	size = FWUtility.ClampInt(size, 1, 128)
	if size > 64
		if size > 96
			if size > 112
				if size > 120
					if size > 124
						if size > 126
							if size == 128
								return new Int[128]
							else
								return new Int[127]
							endIf
						elseIf size == 126
							return new Int[126]
						else
							return new Int[125]
						endIf
					elseIf size > 122
						if size == 124
							return new Int[124]
						else
							return new Int[123]
						endIf
					elseIf size == 122
						return new Int[122]
					else
						return new Int[121]
					endIf
				elseIf size > 116
					if size > 118
						if size == 120
							return new Int[120]
						else
							return new Int[119]
						endIf
					elseIf size == 118
						return new Int[118]
					else
						return new Int[117]
					endIf
				elseIf size > 114
					if size == 116
						return new Int[116]
					else
						return new Int[115]
					endIf
				elseIf size == 114
					return new Int[114]
				else
					return new Int[113]
				endIf
			elseIf size > 104
				if size > 108
					if size > 110
						if size == 112
							return new Int[112]
						else
							return new Int[111]
						endIf
					elseIf size == 110
						return new Int[110]
					else
						return new Int[109]
					endIf
				elseIf size > 106
					if size == 108
						return new Int[108]
					else
						return new Int[107]
					endIf
				elseIf size == 106
					return new Int[106]
				else
					return new Int[105]
				endIf
			elseIf size > 100
				if size > 102
					if size == 104
						return new Int[104]
					else
						return new Int[103]
					endIf
				elseIf size == 102
					return new Int[102]
				else
					return new Int[101]
				endIf
			elseIf size > 98
				if size == 100
					return new Int[100]
				else
					return new Int[99]
				endIf
			elseIf size == 98
				return new Int[98]
			else
				return new Int[97]
			endIf
		elseIf size > 80
			if size > 88
				if size > 92
					if size > 94
						if size == 96
							return new Int[96]
						else
							return new Int[95]
						endIf
					elseIf size == 94
						return new Int[94]
					else
						return new Int[93]
					endIf
				elseIf size > 90
					if size == 92
						return new Int[92]
					else
						return new Int[91]
					endIf
				elseIf size == 90
					return new Int[90]
				else
					return new Int[89]
				endIf
			elseIf size > 84
				if size > 86
					if size == 88
						return new Int[88]
					else
						return new Int[87]
					endIf
				elseIf size == 86
					return new Int[86]
				else
					return new Int[85]
				endIf
			elseIf size > 82
				if size == 84
					return new Int[84]
				else
					return new Int[83]
				endIf
			elseIf size == 82
				return new Int[82]
			else
				return new Int[81]
			endIf
		elseIf size > 72
			if size > 76
				if size > 78
					if size == 80
						return new Int[80]
					else
						return new Int[79]
					endIf
				elseIf size == 78
					return new Int[78]
				else
					return new Int[77]
				endIf
			elseIf size > 74
				if size == 76
					return new Int[76]
				else
					return new Int[75]
				endIf
			elseIf size == 74
				return new Int[74]
			else
				return new Int[73]
			endIf
		elseIf size > 68
			if size > 70
				if size == 72
					return new Int[72]
				else
					return new Int[71]
				endIf
			elseIf size == 70
				return new Int[70]
			else
				return new Int[69]
			endIf
		elseIf size > 66
			if size == 68
				return new Int[68]
			else
				return new Int[67]
			endIf
		elseIf size == 66
			return new Int[66]
		else
			return new Int[65]
		endIf
	elseIf size > 32
		if size > 48
			if size > 56
				if size > 60
					if size > 62
						if size == 64
							return new Int[64]
						else
							return new Int[63]
						endIf
					elseIf size == 62
						return new Int[62]
					else
						return new Int[61]
					endIf
				elseIf size > 58
					if size == 60
						return new Int[60]
					else
						return new Int[59]
					endIf
				elseIf size == 58
					return new Int[58]
				else
					return new Int[57]
				endIf
			elseIf size > 52
				if size > 54
					if size == 56
						return new Int[56]
					else
						return new Int[55]
					endIf
				elseIf size == 54
					return new Int[54]
				else
					return new Int[53]
				endIf
			elseIf size > 50
				if size == 52
					return new Int[52]
				else
					return new Int[51]
				endIf
			elseIf size == 50
				return new Int[50]
			else
				return new Int[49]
			endIf
		elseIf size > 40
			if size > 44
				if size > 46
					if size == 48
						return new Int[48]
					else
						return new Int[47]
					endIf
				elseIf size == 46
					return new Int[46]
				else
					return new Int[45]
				endIf
			elseIf size > 42
				if size == 44
					return new Int[44]
				else
					return new Int[43]
				endIf
			elseIf size == 42
				return new Int[42]
			else
				return new Int[41]
			endIf
		elseIf size > 36
			if size > 38
				if size == 40
					return new Int[40]
				else
					return new Int[39]
				endIf
			elseIf size == 38
				return new Int[38]
			else
				return new Int[37]
			endIf
		elseIf size > 34
			if size == 36
				return new Int[36]
			else
				return new Int[35]
			endIf
		elseIf size == 34
			return new Int[34]
		else
			return new Int[33]
		endIf
	elseIf size > 16
		if size > 24
			if size > 28
				if size > 30
					if size == 32
						return new Int[32]
					else
						return new Int[31]
					endIf
				elseIf size == 30
					return new Int[30]
				else
					return new Int[29]
				endIf
			elseIf size > 26
				if size == 28
					return new Int[28]
				else
					return new Int[27]
				endIf
			elseIf size == 26
				return new Int[26]
			else
				return new Int[25]
			endIf
		elseIf size > 20
			if size > 22
				if size == 24
					return new Int[24]
				else
					return new Int[23]
				endIf
			elseIf size == 22
				return new Int[22]
			else
				return new Int[21]
			endIf
		elseIf size > 18
			if size == 20
				return new Int[20]
			else
				return new Int[19]
			endIf
		elseIf size == 18
			return new Int[18]
		else
			return new Int[17]
		endIf
	elseIf size > 8
		if size > 12
			if size > 14
				if size == 16
					return new Int[16]
				else
					return new Int[15]
				endIf
			elseIf size == 14
				return new Int[14]
			else
				return new Int[13]
			endIf
		elseIf size > 10
			if size == 12
				return new Int[12]
			else
				return new Int[11]
			endIf
		elseIf size == 10
			return new Int[10]
		else
			return new Int[9]
		endIf
	elseIf size > 4
		if size > 6
			if size == 8
				return new Int[8]
			else
				return new Int[7]
			endIf
		elseIf size == 6
			return new Int[6]
		else
			return new Int[5]
		endIf
	elseIf size > 2
		if size == 4
			return new Int[4]
		else
			return new Int[3]
		endIf
	elseIf size == 2
		return new Int[2]
	else
		return new Int[1]
	endIf
endFunction

String function GetModFromID(form frm, Bool bFileExtention) global

	Int c = game.GetModCount()
	Int i = 0
	String mName = ""
	Bool bFound = false
	if frm as actor != none
		actor a = frm as actor
		actorbase b = a.GetLeveledActorBase()
		Int mID = a.GetFormID() % 16777216
		Int nID = b.GetFormID() % 16777216
		debug.Trace("Find Mod by Actor '" + b.GetName() + "' - " + mID as String + "(" + a.GetFormID() as String + ") / " + nID as String + "(" + b.GetFormID() as String + ")", 0)
		while i < c
			mName = game.GetModName(i)
			if a == game.GetFormFromFile(mID, mName) as actor
				i = c
				c = 0
				bFound = true
			elseIf b == game.GetFormFromFile(nID, mName) as actorbase
				i = c
				c = 0
				bFound = true
			endIf
			i += 1
		endWhile
	else
		Int mid = frm.GetFormID() % 16777216
		while i < c
			mName = game.GetModName(i)
			if frm == game.GetFormFromFile(mid, mName)
				i = c
				c = 0
				bFound = true
			endIf
			i += 1
		endWhile
	endIf
	if bFound
		if bFileExtention
			return mName
		else
			Int len = stringutil.GetLength(mName) - 4
			return stringutil.Substring(mName, 0, len)
		endIf
	else
		return "unknown"
	endIf
endFunction

Int function ClampInt(Int a, Int min, Int max) global

	if a < min
		return min
	elseIf a > max
		return max
	endIf
	return a
endFunction

Int function MaxInt(Int a, Int b) global

	if b < a
		return a
	endIf
	return b
endFunction

String function getStateNameTranslated(Int StateID) global

	return "$FW_MENU_INFO_StateName" + StateID as String
endFunction

Form[] function FormArrayConcat(Form[] f1, Form[] f2) global

	if f1.length == 0
		return f2
	elseIf f2.length == 0
		return f1
	else
		Int n = f1.length + f2.length
		Int f1l = f1.length
		Int f2l = f2.length
		if n > 128
			f2l = 128 - f1l
		endIf
		Form[] fn = FWUtility.FormArray(n)
		Int i = 0
		while i < f1l
			fn[f1l] = f1[f1l]
			i += 1
		endWhile
		i = 0
		while i < f2l
			fn[i + f2l] = f2[i]
			i += 1
		endWhile
	endIf
endFunction

String function ScriptSource(String script) global native

Bool[] function BoolArray(Int size) global

	size = FWUtility.ClampInt(size, 1, 128)
	if size > 64
		if size > 96
			if size > 112
				if size > 120
					if size > 124
						if size > 126
							if size == 128
								return new Bool[128]
							else
								return new Bool[127]
							endIf
						elseIf size == 126
							return new Bool[126]
						else
							return new Bool[125]
						endIf
					elseIf size > 122
						if size == 124
							return new Bool[124]
						else
							return new Bool[123]
						endIf
					elseIf size == 122
						return new Bool[122]
					else
						return new Bool[121]
					endIf
				elseIf size > 116
					if size > 118
						if size == 120
							return new Bool[120]
						else
							return new Bool[119]
						endIf
					elseIf size == 118
						return new Bool[118]
					else
						return new Bool[117]
					endIf
				elseIf size > 114
					if size == 116
						return new Bool[116]
					else
						return new Bool[115]
					endIf
				elseIf size == 114
					return new Bool[114]
				else
					return new Bool[113]
				endIf
			elseIf size > 104
				if size > 108
					if size > 110
						if size == 112
							return new Bool[112]
						else
							return new Bool[111]
						endIf
					elseIf size == 110
						return new Bool[110]
					else
						return new Bool[109]
					endIf
				elseIf size > 106
					if size == 108
						return new Bool[108]
					else
						return new Bool[107]
					endIf
				elseIf size == 106
					return new Bool[106]
				else
					return new Bool[105]
				endIf
			elseIf size > 100
				if size > 102
					if size == 104
						return new Bool[104]
					else
						return new Bool[103]
					endIf
				elseIf size == 102
					return new Bool[102]
				else
					return new Bool[101]
				endIf
			elseIf size > 98
				if size == 100
					return new Bool[100]
				else
					return new Bool[99]
				endIf
			elseIf size == 98
				return new Bool[98]
			else
				return new Bool[97]
			endIf
		elseIf size > 80
			if size > 88
				if size > 92
					if size > 94
						if size == 96
							return new Bool[96]
						else
							return new Bool[95]
						endIf
					elseIf size == 94
						return new Bool[94]
					else
						return new Bool[93]
					endIf
				elseIf size > 90
					if size == 92
						return new Bool[92]
					else
						return new Bool[91]
					endIf
				elseIf size == 90
					return new Bool[90]
				else
					return new Bool[89]
				endIf
			elseIf size > 84
				if size > 86
					if size == 88
						return new Bool[88]
					else
						return new Bool[87]
					endIf
				elseIf size == 86
					return new Bool[86]
				else
					return new Bool[85]
				endIf
			elseIf size > 82
				if size == 84
					return new Bool[84]
				else
					return new Bool[83]
				endIf
			elseIf size == 82
				return new Bool[82]
			else
				return new Bool[81]
			endIf
		elseIf size > 72
			if size > 76
				if size > 78
					if size == 80
						return new Bool[80]
					else
						return new Bool[79]
					endIf
				elseIf size == 78
					return new Bool[78]
				else
					return new Bool[77]
				endIf
			elseIf size > 74
				if size == 76
					return new Bool[76]
				else
					return new Bool[75]
				endIf
			elseIf size == 74
				return new Bool[74]
			else
				return new Bool[73]
			endIf
		elseIf size > 68
			if size > 70
				if size == 72
					return new Bool[72]
				else
					return new Bool[71]
				endIf
			elseIf size == 70
				return new Bool[70]
			else
				return new Bool[69]
			endIf
		elseIf size > 66
			if size == 68
				return new Bool[68]
			else
				return new Bool[67]
			endIf
		elseIf size == 66
			return new Bool[66]
		else
			return new Bool[65]
		endIf
	elseIf size > 32
		if size > 48
			if size > 56
				if size > 60
					if size > 62
						if size == 64
							return new Bool[64]
						else
							return new Bool[63]
						endIf
					elseIf size == 62
						return new Bool[62]
					else
						return new Bool[61]
					endIf
				elseIf size > 58
					if size == 60
						return new Bool[60]
					else
						return new Bool[59]
					endIf
				elseIf size == 58
					return new Bool[58]
				else
					return new Bool[57]
				endIf
			elseIf size > 52
				if size > 54
					if size == 56
						return new Bool[56]
					else
						return new Bool[55]
					endIf
				elseIf size == 54
					return new Bool[54]
				else
					return new Bool[53]
				endIf
			elseIf size > 50
				if size == 52
					return new Bool[52]
				else
					return new Bool[51]
				endIf
			elseIf size == 50
				return new Bool[50]
			else
				return new Bool[49]
			endIf
		elseIf size > 40
			if size > 44
				if size > 46
					if size == 48
						return new Bool[48]
					else
						return new Bool[47]
					endIf
				elseIf size == 46
					return new Bool[46]
				else
					return new Bool[45]
				endIf
			elseIf size > 42
				if size == 44
					return new Bool[44]
				else
					return new Bool[43]
				endIf
			elseIf size == 42
				return new Bool[42]
			else
				return new Bool[41]
			endIf
		elseIf size > 36
			if size > 38
				if size == 40
					return new Bool[40]
				else
					return new Bool[39]
				endIf
			elseIf size == 38
				return new Bool[38]
			else
				return new Bool[37]
			endIf
		elseIf size > 34
			if size == 36
				return new Bool[36]
			else
				return new Bool[35]
			endIf
		elseIf size == 34
			return new Bool[34]
		else
			return new Bool[33]
		endIf
	elseIf size > 16
		if size > 24
			if size > 28
				if size > 30
					if size == 32
						return new Bool[32]
					else
						return new Bool[31]
					endIf
				elseIf size == 30
					return new Bool[30]
				else
					return new Bool[29]
				endIf
			elseIf size > 26
				if size == 28
					return new Bool[28]
				else
					return new Bool[27]
				endIf
			elseIf size == 26
				return new Bool[26]
			else
				return new Bool[25]
			endIf
		elseIf size > 20
			if size > 22
				if size == 24
					return new Bool[24]
				else
					return new Bool[23]
				endIf
			elseIf size == 22
				return new Bool[22]
			else
				return new Bool[21]
			endIf
		elseIf size > 18
			if size == 20
				return new Bool[20]
			else
				return new Bool[19]
			endIf
		elseIf size == 18
			return new Bool[18]
		else
			return new Bool[17]
		endIf
	elseIf size > 8
		if size > 12
			if size > 14
				if size == 16
					return new Bool[16]
				else
					return new Bool[15]
				endIf
			elseIf size == 14
				return new Bool[14]
			else
				return new Bool[13]
			endIf
		elseIf size > 10
			if size == 12
				return new Bool[12]
			else
				return new Bool[11]
			endIf
		elseIf size == 10
			return new Bool[10]
		else
			return new Bool[9]
		endIf
	elseIf size > 4
		if size > 6
			if size == 8
				return new Bool[8]
			else
				return new Bool[7]
			endIf
		elseIf size == 6
			return new Bool[6]
		else
			return new Bool[5]
		endIf
	elseIf size > 2
		if size == 4
			return new Bool[4]
		else
			return new Bool[3]
		endIf
	elseIf size == 2
		return new Bool[2]
	else
		return new Bool[1]
	endIf
endFunction

Bool function FileExists(String FilePath) global native

function ActorRemoveSpells(actor a, Spell[] sa) global

	if a == none
		return 
	endIf
	Int i = 0
	Int c = sa.length
	while i < c
		FWUtility.ActorRemoveSpell(a, sa[i])
		i += 1
	endWhile
endFunction

ActorBase[] function ActorBaseArray(Int size) global

	size = FWUtility.ClampInt(size, 1, 128)
	if size > 64
		if size > 96
			if size > 112
				if size > 120
					if size > 124
						if size > 126
							if size == 128
								return new ActorBase[128]
							else
								return new ActorBase[127]
							endIf
						elseIf size == 126
							return new ActorBase[126]
						else
							return new ActorBase[125]
						endIf
					elseIf size > 122
						if size == 124
							return new ActorBase[124]
						else
							return new ActorBase[123]
						endIf
					elseIf size == 122
						return new ActorBase[122]
					else
						return new ActorBase[121]
					endIf
				elseIf size > 116
					if size > 118
						if size == 120
							return new ActorBase[120]
						else
							return new ActorBase[119]
						endIf
					elseIf size == 118
						return new ActorBase[118]
					else
						return new ActorBase[117]
					endIf
				elseIf size > 114
					if size == 116
						return new ActorBase[116]
					else
						return new ActorBase[115]
					endIf
				elseIf size == 114
					return new ActorBase[114]
				else
					return new ActorBase[113]
				endIf
			elseIf size > 104
				if size > 108
					if size > 110
						if size == 112
							return new ActorBase[112]
						else
							return new ActorBase[111]
						endIf
					elseIf size == 110
						return new ActorBase[110]
					else
						return new ActorBase[109]
					endIf
				elseIf size > 106
					if size == 108
						return new ActorBase[108]
					else
						return new ActorBase[107]
					endIf
				elseIf size == 106
					return new ActorBase[106]
				else
					return new ActorBase[105]
				endIf
			elseIf size > 100
				if size > 102
					if size == 104
						return new ActorBase[104]
					else
						return new ActorBase[103]
					endIf
				elseIf size == 102
					return new ActorBase[102]
				else
					return new ActorBase[101]
				endIf
			elseIf size > 98
				if size == 100
					return new ActorBase[100]
				else
					return new ActorBase[99]
				endIf
			elseIf size == 98
				return new ActorBase[98]
			else
				return new ActorBase[97]
			endIf
		elseIf size > 80
			if size > 88
				if size > 92
					if size > 94
						if size == 96
							return new ActorBase[96]
						else
							return new ActorBase[95]
						endIf
					elseIf size == 94
						return new ActorBase[94]
					else
						return new ActorBase[93]
					endIf
				elseIf size > 90
					if size == 92
						return new ActorBase[92]
					else
						return new ActorBase[91]
					endIf
				elseIf size == 90
					return new ActorBase[90]
				else
					return new ActorBase[89]
				endIf
			elseIf size > 84
				if size > 86
					if size == 88
						return new ActorBase[88]
					else
						return new ActorBase[87]
					endIf
				elseIf size == 86
					return new ActorBase[86]
				else
					return new ActorBase[85]
				endIf
			elseIf size > 82
				if size == 84
					return new ActorBase[84]
				else
					return new ActorBase[83]
				endIf
			elseIf size == 82
				return new ActorBase[82]
			else
				return new ActorBase[81]
			endIf
		elseIf size > 72
			if size > 76
				if size > 78
					if size == 80
						return new ActorBase[80]
					else
						return new ActorBase[79]
					endIf
				elseIf size == 78
					return new ActorBase[78]
				else
					return new ActorBase[77]
				endIf
			elseIf size > 74
				if size == 76
					return new ActorBase[76]
				else
					return new ActorBase[75]
				endIf
			elseIf size == 74
				return new ActorBase[74]
			else
				return new ActorBase[73]
			endIf
		elseIf size > 68
			if size > 70
				if size == 72
					return new ActorBase[72]
				else
					return new ActorBase[71]
				endIf
			elseIf size == 70
				return new ActorBase[70]
			else
				return new ActorBase[69]
			endIf
		elseIf size > 66
			if size == 68
				return new ActorBase[68]
			else
				return new ActorBase[67]
			endIf
		elseIf size == 66
			return new ActorBase[66]
		else
			return new ActorBase[65]
		endIf
	elseIf size > 32
		if size > 48
			if size > 56
				if size > 60
					if size > 62
						if size == 64
							return new ActorBase[64]
						else
							return new ActorBase[63]
						endIf
					elseIf size == 62
						return new ActorBase[62]
					else
						return new ActorBase[61]
					endIf
				elseIf size > 58
					if size == 60
						return new ActorBase[60]
					else
						return new ActorBase[59]
					endIf
				elseIf size == 58
					return new ActorBase[58]
				else
					return new ActorBase[57]
				endIf
			elseIf size > 52
				if size > 54
					if size == 56
						return new ActorBase[56]
					else
						return new ActorBase[55]
					endIf
				elseIf size == 54
					return new ActorBase[54]
				else
					return new ActorBase[53]
				endIf
			elseIf size > 50
				if size == 52
					return new ActorBase[52]
				else
					return new ActorBase[51]
				endIf
			elseIf size == 50
				return new ActorBase[50]
			else
				return new ActorBase[49]
			endIf
		elseIf size > 40
			if size > 44
				if size > 46
					if size == 48
						return new ActorBase[48]
					else
						return new ActorBase[47]
					endIf
				elseIf size == 46
					return new ActorBase[46]
				else
					return new ActorBase[45]
				endIf
			elseIf size > 42
				if size == 44
					return new ActorBase[44]
				else
					return new ActorBase[43]
				endIf
			elseIf size == 42
				return new ActorBase[42]
			else
				return new ActorBase[41]
			endIf
		elseIf size > 36
			if size > 38
				if size == 40
					return new ActorBase[40]
				else
					return new ActorBase[39]
				endIf
			elseIf size == 38
				return new ActorBase[38]
			else
				return new ActorBase[37]
			endIf
		elseIf size > 34
			if size == 36
				return new ActorBase[36]
			else
				return new ActorBase[35]
			endIf
		elseIf size == 34
			return new ActorBase[34]
		else
			return new ActorBase[33]
		endIf
	elseIf size > 16
		if size > 24
			if size > 28
				if size > 30
					if size == 32
						return new ActorBase[32]
					else
						return new ActorBase[31]
					endIf
				elseIf size == 30
					return new ActorBase[30]
				else
					return new ActorBase[29]
				endIf
			elseIf size > 26
				if size == 28
					return new ActorBase[28]
				else
					return new ActorBase[27]
				endIf
			elseIf size == 26
				return new ActorBase[26]
			else
				return new ActorBase[25]
			endIf
		elseIf size > 20
			if size > 22
				if size == 24
					return new ActorBase[24]
				else
					return new ActorBase[23]
				endIf
			elseIf size == 22
				return new ActorBase[22]
			else
				return new ActorBase[21]
			endIf
		elseIf size > 18
			if size == 20
				return new ActorBase[20]
			else
				return new ActorBase[19]
			endIf
		elseIf size == 18
			return new ActorBase[18]
		else
			return new ActorBase[17]
		endIf
	elseIf size > 8
		if size > 12
			if size > 14
				if size == 16
					return new ActorBase[16]
				else
					return new ActorBase[15]
				endIf
			elseIf size == 14
				return new ActorBase[14]
			else
				return new ActorBase[13]
			endIf
		elseIf size > 10
			if size == 12
				return new ActorBase[12]
			else
				return new ActorBase[11]
			endIf
		elseIf size == 10
			return new ActorBase[10]
		else
			return new ActorBase[9]
		endIf
	elseIf size > 4
		if size > 6
			if size == 8
				return new ActorBase[8]
			else
				return new ActorBase[7]
			endIf
		elseIf size == 6
			return new ActorBase[6]
		else
			return new ActorBase[5]
		endIf
	elseIf size > 2
		if size == 4
			return new ActorBase[4]
		else
			return new ActorBase[3]
		endIf
	elseIf size == 2
		return new ActorBase[2]
	else
		return new ActorBase[1]
	endIf
endFunction

function setIniBool(String Type, String File, String Variable, Bool value) global native

Int[] function IntArrayResize(Int[] OldArray, Int NewSize) global

	Int[] res = FWUtility.IntArray(NewSize)
	Int i = 0
	while i < NewSize && i < OldArray.length
		res[i] = OldArray[i]
		i += 1
	endWhile
	return res
endFunction

Bool function AreModsInstalled(String[] ModNames) global

	Int c = ModNames.length
	while c > 0
		c -= 1
		if ModNames[c] != "" && FWUtility.IsModInstalled(ModNames[c]) == false
			return false
		endIf
	endWhile
	return true
endFunction

String function GetStringFromForms(Form[] frms) global

	Int i = 0
	String S = ""
	Int c = frms.length
	while i < c
		String tmp = FWUtility.GetStringFromForm(frms[i])
		if tmp != ""
			if i > 0
				S += ","
			endIf
			S += tmp
		endIf
		i += 1
	endWhile
	return S
endFunction

String function ModFile(String ModName) global

	Int c = game.GetModCount()
	while c > 0
		c -= 1
		String m = game.GetModName(c)
		if m == ModName || m == ModName + ".esp" || m == ModName + ".esm"
			return m
		endIf
	endWhile
	return ""
endFunction

Int[] function IntArrayAppend(Int[] OldArray, Int Append) global

	Int c = OldArray.length
	if c == 0
		Int[] t = new Int[1]
		t[0] = Append
		return t
	elseIf c > 127
		return OldArray
	endIf
	Int[] na = FWUtility.IntArray(c + 1)
	na[c] = Append
	while c > 0
		c -= 1
		na[c] = OldArray[c]
	endWhile
	return na
endFunction

Actor[] function ActorArrayUnique(Actor[] a) global

	if a.length < 2
		return a
	endIf
	Int newLen = a.length
	Int c = a.length
	Int i = 0
	while i < c - 1
		if a.find(a[i], i + 1) != -1
			a[i] = none
			newLen -= 1
		endIf
		i += 1
	endWhile
	Actor[] new_a = FWUtility.ActorArray(newLen)
	i = 0
	Int ni = 0
	while i < c
		if a[i] != none
			new_a[ni] = a[i]
			ni += 1
		endIf
		i += 1
	endWhile
	return new_a
endFunction

Float[] function FloatArrayAppend(Float[] OldArray, Float Append) global

	Int c = OldArray.length
	if c == 0
		Float[] t = new Float[1]
		t[0] = Append
		return t
	elseIf c > 127
		return OldArray
	endIf
	Float[] na = FWUtility.FloatArray(c + 1)
	na[c] = Append
	while c > 0
		c -= 1
		na[c] = OldArray[c]
	endWhile
	return na
endFunction

form function GetFormFromString(String S) global native

Float[] function FloatArrayResize(Float[] OldArray, Int NewSize) global

	Float[] res = FWUtility.FloatArray(NewSize)
	Int i = 0
	while i < NewSize && i < OldArray.length
		res[i] = OldArray[i]
		i += 1
	endWhile
	return res
endFunction

function ActorRemoveSpell(actor a, spell S) global

	if S != none && a != none
		if a.HasSpell(S as form)
			a.RemoveSpell(S)
		endIf
	endIf
endFunction

String function StringReplace(String Text, String Find, String Replace) global native

Float function SwitchFloat(Bool cond, Float a, Float b) global

	if cond
		return a
	endIf
	return b
endFunction

String function GetModFromForm(form frm, Bool bExtension) global native

Actor[] function removeDuplicatedActors(Actor[] list) global

	Int i = 0
	Int j = 0
	Int c = list.length
	Int S = 0
	while i < c - 1
		j = i + 1
		while j < c
			if list[i] == list[j]
				list[j] = none
				S += 1
			endIf
			j += 1
		endWhile
		i += 1
	endWhile
	Actor[] res = FWUtility.ActorArray(S)
	i = 0
	j = 0
	while i < c
		if list[i] != none
			res[j] = list[i]
		endIf
		i += 1
	endWhile
	return res
endFunction

Float[] function FloatArray(Int size) global

	size = FWUtility.ClampInt(size, 1, 128)
	if size > 64
		if size > 96
			if size > 112
				if size > 120
					if size > 124
						if size > 126
							if size == 128
								return new Float[128]
							else
								return new Float[127]
							endIf
						elseIf size == 126
							return new Float[126]
						else
							return new Float[125]
						endIf
					elseIf size > 122
						if size == 124
							return new Float[124]
						else
							return new Float[123]
						endIf
					elseIf size == 122
						return new Float[122]
					else
						return new Float[121]
					endIf
				elseIf size > 116
					if size > 118
						if size == 120
							return new Float[120]
						else
							return new Float[119]
						endIf
					elseIf size == 118
						return new Float[118]
					else
						return new Float[117]
					endIf
				elseIf size > 114
					if size == 116
						return new Float[116]
					else
						return new Float[115]
					endIf
				elseIf size == 114
					return new Float[114]
				else
					return new Float[113]
				endIf
			elseIf size > 104
				if size > 108
					if size > 110
						if size == 112
							return new Float[112]
						else
							return new Float[111]
						endIf
					elseIf size == 110
						return new Float[110]
					else
						return new Float[109]
					endIf
				elseIf size > 106
					if size == 108
						return new Float[108]
					else
						return new Float[107]
					endIf
				elseIf size == 106
					return new Float[106]
				else
					return new Float[105]
				endIf
			elseIf size > 100
				if size > 102
					if size == 104
						return new Float[104]
					else
						return new Float[103]
					endIf
				elseIf size == 102
					return new Float[102]
				else
					return new Float[101]
				endIf
			elseIf size > 98
				if size == 100
					return new Float[100]
				else
					return new Float[99]
				endIf
			elseIf size == 98
				return new Float[98]
			else
				return new Float[97]
			endIf
		elseIf size > 80
			if size > 88
				if size > 92
					if size > 94
						if size == 96
							return new Float[96]
						else
							return new Float[95]
						endIf
					elseIf size == 94
						return new Float[94]
					else
						return new Float[93]
					endIf
				elseIf size > 90
					if size == 92
						return new Float[92]
					else
						return new Float[91]
					endIf
				elseIf size == 90
					return new Float[90]
				else
					return new Float[89]
				endIf
			elseIf size > 84
				if size > 86
					if size == 88
						return new Float[88]
					else
						return new Float[87]
					endIf
				elseIf size == 86
					return new Float[86]
				else
					return new Float[85]
				endIf
			elseIf size > 82
				if size == 84
					return new Float[84]
				else
					return new Float[83]
				endIf
			elseIf size == 82
				return new Float[82]
			else
				return new Float[81]
			endIf
		elseIf size > 72
			if size > 76
				if size > 78
					if size == 80
						return new Float[80]
					else
						return new Float[79]
					endIf
				elseIf size == 78
					return new Float[78]
				else
					return new Float[77]
				endIf
			elseIf size > 74
				if size == 76
					return new Float[76]
				else
					return new Float[75]
				endIf
			elseIf size == 74
				return new Float[74]
			else
				return new Float[73]
			endIf
		elseIf size > 68
			if size > 70
				if size == 72
					return new Float[72]
				else
					return new Float[71]
				endIf
			elseIf size == 70
				return new Float[70]
			else
				return new Float[69]
			endIf
		elseIf size > 66
			if size == 68
				return new Float[68]
			else
				return new Float[67]
			endIf
		elseIf size == 66
			return new Float[66]
		else
			return new Float[65]
		endIf
	elseIf size > 32
		if size > 48
			if size > 56
				if size > 60
					if size > 62
						if size == 64
							return new Float[64]
						else
							return new Float[63]
						endIf
					elseIf size == 62
						return new Float[62]
					else
						return new Float[61]
					endIf
				elseIf size > 58
					if size == 60
						return new Float[60]
					else
						return new Float[59]
					endIf
				elseIf size == 58
					return new Float[58]
				else
					return new Float[57]
				endIf
			elseIf size > 52
				if size > 54
					if size == 56
						return new Float[56]
					else
						return new Float[55]
					endIf
				elseIf size == 54
					return new Float[54]
				else
					return new Float[53]
				endIf
			elseIf size > 50
				if size == 52
					return new Float[52]
				else
					return new Float[51]
				endIf
			elseIf size == 50
				return new Float[50]
			else
				return new Float[49]
			endIf
		elseIf size > 40
			if size > 44
				if size > 46
					if size == 48
						return new Float[48]
					else
						return new Float[47]
					endIf
				elseIf size == 46
					return new Float[46]
				else
					return new Float[45]
				endIf
			elseIf size > 42
				if size == 44
					return new Float[44]
				else
					return new Float[43]
				endIf
			elseIf size == 42
				return new Float[42]
			else
				return new Float[41]
			endIf
		elseIf size > 36
			if size > 38
				if size == 40
					return new Float[40]
				else
					return new Float[39]
				endIf
			elseIf size == 38
				return new Float[38]
			else
				return new Float[37]
			endIf
		elseIf size > 34
			if size == 36
				return new Float[36]
			else
				return new Float[35]
			endIf
		elseIf size == 34
			return new Float[34]
		else
			return new Float[33]
		endIf
	elseIf size > 16
		if size > 24
			if size > 28
				if size > 30
					if size == 32
						return new Float[32]
					else
						return new Float[31]
					endIf
				elseIf size == 30
					return new Float[30]
				else
					return new Float[29]
				endIf
			elseIf size > 26
				if size == 28
					return new Float[28]
				else
					return new Float[27]
				endIf
			elseIf size == 26
				return new Float[26]
			else
				return new Float[25]
			endIf
		elseIf size > 20
			if size > 22
				if size == 24
					return new Float[24]
				else
					return new Float[23]
				endIf
			elseIf size == 22
				return new Float[22]
			else
				return new Float[21]
			endIf
		elseIf size > 18
			if size == 20
				return new Float[20]
			else
				return new Float[19]
			endIf
		elseIf size == 18
			return new Float[18]
		else
			return new Float[17]
		endIf
	elseIf size > 8
		if size > 12
			if size > 14
				if size == 16
					return new Float[16]
				else
					return new Float[15]
				endIf
			elseIf size == 14
				return new Float[14]
			else
				return new Float[13]
			endIf
		elseIf size > 10
			if size == 12
				return new Float[12]
			else
				return new Float[11]
			endIf
		elseIf size == 10
			return new Float[10]
		else
			return new Float[9]
		endIf
	elseIf size > 4
		if size > 6
			if size == 8
				return new Float[8]
			else
				return new Float[7]
			endIf
		elseIf size == 6
			return new Float[6]
		else
			return new Float[5]
		endIf
	elseIf size > 2
		if size == 4
			return new Float[4]
		else
			return new Float[3]
		endIf
	elseIf size == 2
		return new Float[2]
	else
		return new Float[1]
	endIf
endFunction

Float function floatModulo(Float value, Float Mod) global

	Float tmpval = value
	while tmpval >= Mod
		tmpval -= Mod
	endWhile
	return tmpval
endFunction

String function GetJsonFile(form frm) global

	return FWUtility.GetJsonFileCombine(FWUtility.GetModFromID(frm, false), FWUtility.Hex(frm.GetFormID(), 6))
endFunction

function LockPlayer() global

	actor PlayerRef = game.GetPlayer()
	game.ForceThirdPerson()
	game.SetPlayerAIDriven(true)
	game.SetInChargen(true, true, false)
endFunction

String function ScriptStringGet(String script, Int num) global native

function setIniCFloat(String Type, String File, String Categorie, String Variable, Float value) global native

String function GetJsonFileCombine(String Mod, String Hex) global

	return Mod + "_" + Hex + ".json"
endFunction

function setIniString(String Type, String File, String Variable, String value) global native

function ActorAddSpellsS(actor a, String sa, Bool PlayerOnly, Bool bIsCast) global

	if a == none
		return 
	endIf
	Int c = storageutil.FormListCount(none, "FW.AddOn." + sa)
	while c > 0
		c -= 1
		spell S = storageutil.FormListGet(none, "FW.AddOn." + sa, c) as spell
		if S != none
			FWUtility.ActorAddSpell(a, S, PlayerOnly, bIsCast)
		endIf
	endWhile
endFunction

String function getActorListNames(Actor[] objs, Bool PrefareDisplayName) global

	if objs.length == 0
		return ""
	else
		Int c = objs.length
		Int i = 0
		String str = ""
		Bool bFirst = true
		while i < c
			if objs[i] != none
				if bFirst == true
					bFirst = false
				else
					str += ", "
				endIf
				if PrefareDisplayName == false
					if objs[i].GetLeveledActorBase() != none
						str += objs[i].GetLeveledActorBase().GetName()
					elseIf objs[i].GetDisplayName() != ""
						str += objs[i].GetDisplayName()
					else
						str += objs[i].GetName()
					endIf
				elseIf objs[i].GetDisplayName() != ""
					str += objs[i].GetDisplayName()
				elseIf objs[i].GetLeveledActorBase() != none
					str += objs[i].GetLeveledActorBase().GetName()
				else
					str += objs[i].GetName()
				endIf
			endIf
			i += 1
		endWhile
		return str
	endIf
endFunction

String function getIniString(String Type, String File, String Variable, String Default) global native

function ActorAddSpells(actor a, Spell[] sa, Bool PlayerOnly, Bool bIsCast) global

	if a == none
		return 
	endIf
	Int i = 0
	Int c = sa.length
	while i < c
		FWUtility.ActorAddSpell(a, sa[i], PlayerOnly, bIsCast)
		i += 1
	endWhile
endFunction

Float function ClampFloat(Float a, Float min, Float max) global

	if a < min
		return min
	elseIf a > max
		return max
	endIf
	return a
endFunction

String function getIniPath(String Type, String File) global native

String function ArrayReplace(String Text, String[] Replace) global

	Int c = Replace.length
	while c > 0
		c -= 1
		Text = FWUtility.StringReplace(Text, "{" + c as String + "}", Replace[c])
	endWhile
	return Text
endFunction

function ActorAddSpell(actor a, spell S, Bool PlayerOnly, Bool bIsCast) global

	if S != none && a != none
		if (PlayerOnly == true && game.GetPlayer() == a || PlayerOnly == false) && a.HasSpell(S as form) == false
			if bIsCast
				location curLoc = a.GetCurrentLocation()
				if curLoc != none
					if a.Is3DLoaded() && curLoc.IsLoaded()
						S.Cast(a as objectreference, a as objectreference)
					endIf
				endIf
			else
				a.addSpell(S, true)
			endIf
		endIf
	endIf
endFunction

String function toLower(String str) global native

String function GetStringFromSpells(Spell[] frms) global

	Int i = 0
	String S = ""
	Int c = frms.length
	while i < c
		String tmp = FWUtility.GetStringFromForm(frms[i] as form)
		if tmp != ""
			if i > 0
				S += ","
			endIf
			S += tmp
		endIf
		i += 1
	endWhile
	return S
endFunction

Float function MaxFloat(Float a, Float b) global

	if b < a
		return a
	endIf
	return b
endFunction

String function GetNames(Actor[] Actors) global

	String tmp = ""
	Int i = 0
	Int c = Actors.length
	Bool bFirst = true
	while i < c
		if Actors[i] != none && Actors[i].GetLeveledActorBase() != none && Actors[i].GetLeveledActorBase().GetName() != ""
			if bFirst == false
				tmp += ", "
			endIf
			tmp += Actors[i].GetLeveledActorBase().GetName()
			bFirst = false
		endIf
		i += 1
	endWhile
	return tmp
endFunction

Float function RangedFloat(Float value, Float min, Float max) global

	if value < min
		return min
	elseIf value > max
		return max
	else
		return value
	endIf
endFunction

String function GetPercentage(Float percentage, Int Decimal, Bool bDecimalBase) global

	if percentage < 0.000100000
		return "< 1"
	endIf
	if Decimal == 0 && bDecimalBase
		return math.Floor(percentage * 100.000) as String
	elseIf Decimal == 1 && bDecimalBase
		return math.Floor(percentage * 100.000) as String + "." + (math.Floor(percentage * 1000.00) % 10) as String
	elseIf Decimal == 2 && bDecimalBase
		return math.Floor(percentage * 100.000) as String + "." + (math.Floor(percentage * 10000.0) % 100) as String
	elseIf Decimal == 3 && bDecimalBase
		return math.Floor(percentage * 100.000) as String + "." + (math.Floor(percentage * 100000.0) % 1000) as String
	elseIf Decimal == 0 && !bDecimalBase
		return math.Floor(percentage) as String
	elseIf Decimal == 1 && !bDecimalBase
		return math.Floor(percentage) as String + "." + (math.Floor(percentage * 10.0000) % 10) as String
	elseIf Decimal == 2 && !bDecimalBase
		return math.Floor(percentage) as String + "." + (math.Floor(percentage * 100.000) % 100) as String
	elseIf Decimal == 3 && !bDecimalBase
		return math.Floor(percentage) as String + "." + (math.Floor(percentage * 1000.00) % 1000) as String
	elseIf Decimal == 4 && !bDecimalBase
		return math.Floor(percentage) as String + "." + (math.Floor(percentage * 10000.0) % 10000) as String
	elseIf Decimal == 5 && !bDecimalBase
		return math.Floor(percentage) as String + "." + (math.Floor(percentage * 100000.0) % 100000) as String
	endIf
endFunction

String function GetIniFile(form frm) global

	return FWUtility.GetIniFileCombine(FWUtility.GetModFromID(frm, false), FWUtility.Hex(frm.GetFormID(), 6))
endFunction

Bool function getIniCBool(String Type, String File, String Categorie, String Variable, Bool Default) global native

Actor[] function ActorArray(Int size) global

	size = FWUtility.ClampInt(size, 1, 128)
	if size > 64
		if size > 96
			if size > 112
				if size > 120
					if size > 124
						if size > 126
							if size == 128
								return new Actor[128]
							else
								return new Actor[127]
							endIf
						elseIf size == 126
							return new Actor[126]
						else
							return new Actor[125]
						endIf
					elseIf size > 122
						if size == 124
							return new Actor[124]
						else
							return new Actor[123]
						endIf
					elseIf size == 122
						return new Actor[122]
					else
						return new Actor[121]
					endIf
				elseIf size > 116
					if size > 118
						if size == 120
							return new Actor[120]
						else
							return new Actor[119]
						endIf
					elseIf size == 118
						return new Actor[118]
					else
						return new Actor[117]
					endIf
				elseIf size > 114
					if size == 116
						return new Actor[116]
					else
						return new Actor[115]
					endIf
				elseIf size == 114
					return new Actor[114]
				else
					return new Actor[113]
				endIf
			elseIf size > 104
				if size > 108
					if size > 110
						if size == 112
							return new Actor[112]
						else
							return new Actor[111]
						endIf
					elseIf size == 110
						return new Actor[110]
					else
						return new Actor[109]
					endIf
				elseIf size > 106
					if size == 108
						return new Actor[108]
					else
						return new Actor[107]
					endIf
				elseIf size == 106
					return new Actor[106]
				else
					return new Actor[105]
				endIf
			elseIf size > 100
				if size > 102
					if size == 104
						return new Actor[104]
					else
						return new Actor[103]
					endIf
				elseIf size == 102
					return new Actor[102]
				else
					return new Actor[101]
				endIf
			elseIf size > 98
				if size == 100
					return new Actor[100]
				else
					return new Actor[99]
				endIf
			elseIf size == 98
				return new Actor[98]
			else
				return new Actor[97]
			endIf
		elseIf size > 80
			if size > 88
				if size > 92
					if size > 94
						if size == 96
							return new Actor[96]
						else
							return new Actor[95]
						endIf
					elseIf size == 94
						return new Actor[94]
					else
						return new Actor[93]
					endIf
				elseIf size > 90
					if size == 92
						return new Actor[92]
					else
						return new Actor[91]
					endIf
				elseIf size == 90
					return new Actor[90]
				else
					return new Actor[89]
				endIf
			elseIf size > 84
				if size > 86
					if size == 88
						return new Actor[88]
					else
						return new Actor[87]
					endIf
				elseIf size == 86
					return new Actor[86]
				else
					return new Actor[85]
				endIf
			elseIf size > 82
				if size == 84
					return new Actor[84]
				else
					return new Actor[83]
				endIf
			elseIf size == 82
				return new Actor[82]
			else
				return new Actor[81]
			endIf
		elseIf size > 72
			if size > 76
				if size > 78
					if size == 80
						return new Actor[80]
					else
						return new Actor[79]
					endIf
				elseIf size == 78
					return new Actor[78]
				else
					return new Actor[77]
				endIf
			elseIf size > 74
				if size == 76
					return new Actor[76]
				else
					return new Actor[75]
				endIf
			elseIf size == 74
				return new Actor[74]
			else
				return new Actor[73]
			endIf
		elseIf size > 68
			if size > 70
				if size == 72
					return new Actor[72]
				else
					return new Actor[71]
				endIf
			elseIf size == 70
				return new Actor[70]
			else
				return new Actor[69]
			endIf
		elseIf size > 66
			if size == 68
				return new Actor[68]
			else
				return new Actor[67]
			endIf
		elseIf size == 66
			return new Actor[66]
		else
			return new Actor[65]
		endIf
	elseIf size > 32
		if size > 48
			if size > 56
				if size > 60
					if size > 62
						if size == 64
							return new Actor[64]
						else
							return new Actor[63]
						endIf
					elseIf size == 62
						return new Actor[62]
					else
						return new Actor[61]
					endIf
				elseIf size > 58
					if size == 60
						return new Actor[60]
					else
						return new Actor[59]
					endIf
				elseIf size == 58
					return new Actor[58]
				else
					return new Actor[57]
				endIf
			elseIf size > 52
				if size > 54
					if size == 56
						return new Actor[56]
					else
						return new Actor[55]
					endIf
				elseIf size == 54
					return new Actor[54]
				else
					return new Actor[53]
				endIf
			elseIf size > 50
				if size == 52
					return new Actor[52]
				else
					return new Actor[51]
				endIf
			elseIf size == 50
				return new Actor[50]
			else
				return new Actor[49]
			endIf
		elseIf size > 40
			if size > 44
				if size > 46
					if size == 48
						return new Actor[48]
					else
						return new Actor[47]
					endIf
				elseIf size == 46
					return new Actor[46]
				else
					return new Actor[45]
				endIf
			elseIf size > 42
				if size == 44
					return new Actor[44]
				else
					return new Actor[43]
				endIf
			elseIf size == 42
				return new Actor[42]
			else
				return new Actor[41]
			endIf
		elseIf size > 36
			if size > 38
				if size == 40
					return new Actor[40]
				else
					return new Actor[39]
				endIf
			elseIf size == 38
				return new Actor[38]
			else
				return new Actor[37]
			endIf
		elseIf size > 34
			if size == 36
				return new Actor[36]
			else
				return new Actor[35]
			endIf
		elseIf size == 34
			return new Actor[34]
		else
			return new Actor[33]
		endIf
	elseIf size > 16
		if size > 24
			if size > 28
				if size > 30
					if size == 32
						return new Actor[32]
					else
						return new Actor[31]
					endIf
				elseIf size == 30
					return new Actor[30]
				else
					return new Actor[29]
				endIf
			elseIf size > 26
				if size == 28
					return new Actor[28]
				else
					return new Actor[27]
				endIf
			elseIf size == 26
				return new Actor[26]
			else
				return new Actor[25]
			endIf
		elseIf size > 20
			if size > 22
				if size == 24
					return new Actor[24]
				else
					return new Actor[23]
				endIf
			elseIf size == 22
				return new Actor[22]
			else
				return new Actor[21]
			endIf
		elseIf size > 18
			if size == 20
				return new Actor[20]
			else
				return new Actor[19]
			endIf
		elseIf size == 18
			return new Actor[18]
		else
			return new Actor[17]
		endIf
	elseIf size > 8
		if size > 12
			if size > 14
				if size == 16
					return new Actor[16]
				else
					return new Actor[15]
				endIf
			elseIf size == 14
				return new Actor[14]
			else
				return new Actor[13]
			endIf
		elseIf size > 10
			if size == 12
				return new Actor[12]
			else
				return new Actor[11]
			endIf
		elseIf size == 10
			return new Actor[10]
		else
			return new Actor[9]
		endIf
	elseIf size > 4
		if size > 6
			if size == 8
				return new Actor[8]
			else
				return new Actor[7]
			endIf
		elseIf size == 6
			return new Actor[6]
		else
			return new Actor[5]
		endIf
	elseIf size > 2
		if size == 4
			return new Actor[4]
		else
			return new Actor[3]
		endIf
	elseIf size == 2
		return new Actor[2]
	else
		return new Actor[1]
	endIf
endFunction

Int function RangedInt(Int value, Int min, Int max) global

	if value < min
		return min
	elseIf value > max
		return max
	else
		return value
	endIf
endFunction

Float function getIniCFloat(String Type, String File, String Categorie, String Variable, Float Default) global native

function setIniCInt(String Type, String File, String Categorie, String Variable, Int value) global native

Bool function getIniBool(String Type, String File, String Variable, Bool Default) global native

String function getObjectListNames(ObjectReference[] objs, Bool PrefareDisplayName) global

	if objs.length == 0
		return ""
	else
		Int c = objs.length
		Int i = 0
		String str = ""
		Bool bFirst = true
		while i < c
			if objs[i] != none
				if bFirst == true
					bFirst = false
				else
					str += ", "
				endIf
				actor a = objs[i] as actor
				if a != none && PrefareDisplayName == false
					if a.GetLeveledActorBase() != none
						str += a.GetLeveledActorBase().GetName()
					else
						str += a.GetDisplayName()
					endIf
				elseIf PrefareDisplayName == true && objs[i].GetDisplayName() != ""
					str += objs[i].GetDisplayName()
				else
					str += objs[i].GetName()
				endIf
			endIf
			i += 1
		endWhile
		return str
	endIf
endFunction

Int function getIniInt(String Type, String File, String Variable, Int Default) global native

Bool function IsModInstalled(String ModName) global

	Int c = game.GetModCount()
	while c > 0
		c -= 1
		String m = game.GetModName(c)
		if m == ModName || m == ModName + ".esp" || m == ModName + ".esm"
			return true
		endIf
	endWhile
	return false
endFunction

Int function ScriptStringCount(String script) global native

String function toUpper(String str) global native

function ActorRemoveSpellsS(actor a, String sa) global

	if a == none
		return 
	endIf
	Int c = storageutil.FormListCount(none, "FW.AddOn." + sa)
	while c > 0
		c -= 1
		spell S = storageutil.FormListGet(none, "FW.AddOn." + sa, c) as spell
		FWUtility.ActorRemoveSpell(a, S)
	endWhile
endFunction

; Skipped compiler generated GotoState

; Skipped compiler generated GetState

function onEndState()
{Event received when this state is switched away from}

	; Empty function
endFunction

String function getIniValue(String iniContent, String Variable, String Default)

	Int pos = 0
	Int varLen = stringutil.GetLength(Variable) + 2
	pos = stringutil.Find(iniContent, "$" + Variable + "=", pos)
	if pos >= 0
		Int len1 = stringutil.Find(iniContent, stringutil.AsChar(13), pos)
		Int len2 = stringutil.Find(iniContent, stringutil.AsChar(10), pos)
		Int len = 0
		if len1 < len2 && len1 >= 0
			len = len1
		else
			len = len2
		endIf
		if len == -1
			return stringutil.Substring(iniContent, pos + varLen, 0)
		else
			return stringutil.Substring(iniContent, pos + varLen, len - varLen - pos)
		endIf
	endIf
	return ""
endFunction

function onBeginState()
{Event received when this state is switched to}

	; Empty function
endFunction
