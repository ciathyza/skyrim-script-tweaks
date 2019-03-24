scriptName JaxonzConsolePlugIn Hidden

ObjectReference Function GetCurrentConsoleRef() global native

;INI FILE READ FUNCTIONS
;These functions are able to read any values from private INI files.
;They are different from SKSE Utility INI functions, which can only read Bethesda-defined INI settings.
;Note that FilePath is relative to the Skyrim Directory. A value of ".\\Data\\MyModName.INI" can be used to read your mod's INI file stored in the Data directory with the ESP file.
String Function GetPrivateINIString(String FilePath, String Section, String KeyName) global native

Bool Function GetPrivateINIBool(String FilePath, String Section, String KeyName) global
	Return GetPrivateINIString(FilePath, Section, KeyName) == "1"
EndFunction
	
Int Function GetPrivateINIInt(String FilePath, String Section, String KeyName) global
	return GetPrivateINIString(FilePath, Section, KeyName) as Int
EndFunction
	
Float Function GetPrivateINIFloat(String FilePath, String Section, String KeyName) global
	return GetPrivateINIString(FilePath, Section, KeyName) as Float
EndFunction
	

;Int Function GetReleaseNumber() global native
