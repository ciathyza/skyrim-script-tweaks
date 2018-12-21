Scriptname FWChildEnchant

string Ench
string s_file=""
int i_formID=0
magiceffect obj = none
int i_min = 0
int i_max = 0
bool bSuccess = false;

int property min
	int function get()
		return min
	endFunction
	function set(int value)
		min = value
	endfunction
endProperty

int property max
	int function get()
		return i_max
	endFunction
	function set(int value)
		i_max = value
	endfunction
endProperty

int property FormID
	int function get()
		return i_formID
	endFunction
endProperty

string property EnchantmentName
	string function get()
		return Ench
	endFunction
endProperty

string property ModFile
	string function get()
		return s_file
	endFunction
endProperty

bool property Loaded
	bool function get()
		return bSuccess
	endFunction
endProperty

magiceffect property Effect
	magiceffect function get()
		return obj
	endFunction
endProperty

string function GetModFile(string sModFile) global native
int function GetFormID(string sModFile) global native
int function GetPowerMin(string sModFile) global native
int function GetPowerMax(string sModFile) global native

bool function Load(string EnchantmentName)
	Ench=EnchantmentName
	s_file = GetModFile(Ench)
	i_formID = GetFormID(Ench)
	i_min = GetPowerMin(Ench)
	i_max = GetPowerMax(Ench)
	obj = Game.GetFormFromFile(formID, s_file) as magiceffect
	bSuccess = obj!=none
	return bSuccess
endFunction

string function Test()
	string tmp=""
	tmp += "Enchantment File: " + Ench + "\n"
	tmp += "Mod File: " + s_file + "\n"
	tmp += "FormID: " + i_formID + "\n"
	tmp += "Power Min: " + i_min + "\n"
	tmp += "Power Max: " + i_max + "\n"
endFunction