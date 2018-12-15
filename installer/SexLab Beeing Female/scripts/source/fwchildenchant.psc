;/ Decompiled by Champollion V1.0.1
Source   : FWChildEnchant.psc
Modified : 2016-12-06 03:52:57
Compiled : 2017-01-18 08:35:36
User     : admin
Computer : PATRICK
/;
scriptName FWChildEnchant

;-- Properties --------------------------------------
magiceffect property Effect
	magiceffect function get()

		return obj
	endFunction
endproperty
String property EnchantmentName
	String function get()

		return Ench
	endFunction
endproperty
Int property min
	Int function get()

		return self.min
	endFunction
	function set(Int value)

		self.min = value
	endFunction
endproperty
Bool property Loaded
	Bool function get()

		return bSuccess
	endFunction
endproperty
Int property max
	Int function get()

		return i_max
	endFunction
	function set(Int value)

		i_max = value
	endFunction
endproperty
String property ModFile
	String function get()

		return s_file
	endFunction
endproperty
Int property FormID
	Int function get()

		return i_formID
	endFunction
endproperty

;-- Variables ---------------------------------------
Int i_max = 0
String Ench
Bool bSuccess = false
magiceffect obj
Int i_formID = 0
Int i_min = 0
String s_file = ""

;-- Functions ---------------------------------------

Int function GetPowerMin(String sModFile) global native

Int function GetFormID(String sModFile) global native

Int function GetPowerMax(String sModFile) global native

String function GetModFile(String sModFile) global native

; Skipped compiler generated GetState

; Skipped compiler generated GotoState

Bool function Load(String EnchantmentName)

	Ench = self.EnchantmentName
	s_file = FWChildEnchant.GetModFile(Ench)
	i_formID = FWChildEnchant.GetFormID(Ench)
	i_min = FWChildEnchant.GetPowerMin(Ench)
	i_max = FWChildEnchant.GetPowerMax(Ench)
	obj = game.GetFormFromFile(self.FormID, s_file) as magiceffect
	bSuccess = obj != none
	return bSuccess
endFunction

function onEndState()
{Event received when this state is switched away from}

	; Empty function
endFunction

function onBeginState()
{Event received when this state is switched to}

	; Empty function
endFunction

String function Test()

	String tmp = ""
	tmp += "Enchantment File: " + Ench + "\n"
	tmp += "Mod File: " + s_file + "\n"
	tmp += "FormID: " + i_formID as String + "\n"
	tmp += "Power Min: " + i_min as String + "\n"
	tmp += "Power Max: " + i_max as String + "\n"
endFunction
