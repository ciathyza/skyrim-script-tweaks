Scriptname EWM_ModScanner hidden
{
	Deal with supported-mod scanning.
	Fire the plugins registration event at the end of the process.
}
Import Debug
Import EWM_Util
Import EasyWheelAPI



Bool Function ScanInstalledMods() Global
	
	Trace("[EasyWheel] ======================================================")
	Trace("[EasyWheel] ======     Now checking for installed mods.     ======")
	Trace("[EasyWheel] ======================================================")
	
	  ;Make sure SKSE is installed and up-to-date
	If !ScanForSKSE()
		Return False
	EndIf
	
	  ;Make sure UIExtensions.esp is installed
	If !ScanForUIExtensions()
		Return False
	EndIf	
	
	  ;Scan for Campfire
	If ScanThenEnable("_Camp_MainQuest","_EWMhandle_Campfire")
		Trace("[EasyWheel] Campfire detected")
	EndIf
	  ;Scan for Frostfall
	If ScanThenEnable("_Frost_MainQuest","_EWMhandle_Frostfall")
		Trace("[EasyWheel] Frostfall detected")
	EndIf
	  ;Scan for iNeed
	If ScanThenEnable("_SNSKConfigQuest","_EWMhandle_INeed")
		Trace("[EasyWheel] iNeed detected")
	EndIf
	  ;Scan for Bathing in Skyrim
	If ScanThenEnable("mzinBatheQuest","_EWMhandle_BAS")
		Trace("[EasyWheel] Bathing in Skyrim detected")
	EndIf
	  ;Scan for Immersive Horses
	If ScanThenEnable("IHOConfigMenuQuest","_EWMhandle_IHO")
		Trace("[EasyWheel] Immersive Horses detected")
	EndIf

	If ScanThenEnable("FollowerExtension","_EWMhandle_EFF")
		Trace("[EasyWheel] Extensible Follower Framework detected")
	EndIf

	If ScanThenEnable("_DS_Hunterborn","_EWMhandle_HB")
		Trace("[EasyWheel] Hunterborn detected")
	EndIf
	
	If ScanThenEnable("RNDConfigQuest","_EWMhandle_RND")
		Trace("[EasyWheel] RND detected")
	EndIf

	Trace("[EasyWheel] ========    Sending Register Plugins Event    ========")
	ScanForPlugins()
	
	Trace("[EasyWheel] ======================================================")
	Trace("[EasyWheel] ====== Mod configuration check is now complete. ======")
	Trace("[EasyWheel] ======================================================")
	
	Return True
	
EndFunction

  ;Scan for SKSE presence and version.
  ;Code adapted from Chesko's campfire compatibiltiy script.
Bool Function ScanForSKSE()  Global
	If SKSE.GetVersion()
		Int skse_version = (SKSE.GetVersion() * 10000) + (SKSE.GetVersionMinor() * 100) + SKSE.GetVersionBeta()
		Int skse_expected = GetAPI().SKSE_MIN_VERSION
		If skse_version < skse_expected
			Trace("[EasyWheel][Warning] Detected SKSE version " + ((skse_version as float) / 10000) + ", out of date! Expected " + ((skse_expected as float) / 10000) + " or newer.")
			Trace("[EasyWheel] ======================================================")
			Trace("[EasyWheel] ======            Wheelmenu disabled            ======")
			Trace("[EasyWheel] ======================================================")
			Return False
		Else
			Trace("[EasyWheel] Detected SKSE version " + ((skse_version as float) / 10000) + " (expected " + ((skse_expected as float) / 10000) + " or newer)")
			Return True
		Endif
	Else
		Trace("[EasyWheel] SKSE appears to be missing")
		Trace("[EasyWheel] ======================================================")
		Trace("[EasyWheel] ======            Wheelmenu disabled            ======")
		Trace("[EasyWheel] ======================================================")
		Return False
	Endif
EndFunction

  ;Hardcoded requirement for UIExtensions.esp and the Wheelmenu form.
Bool Function ScanForUIExtensions()  Global
	Form UIExtensions_isInstalled = Game.GetFormFromFile(0x00000E01, "UIExtensions.esp")
	If !UIExtensions_isInstalled
		Trace("[EasyWheel] UIExtensions.esp not found")
		Trace("[EasyWheel] ======================================================")
		Trace("[EasyWheel] ======            Wheelmenu disabled            ======")
		Trace("[EasyWheel] ======================================================")
		Return False
	EndIf
	Trace("[EasyWheel] UIExtensions is installed")
	Return True
	
EndFunction


Bool Function ScanThenEnable(String QuestCheckEDID, String HandlerEDID) Global
	
	String _PluginName = ScanForMod(QuestCheckEDID)
	If _PluginName != ""
		EnableHandler(HandlerEDID, _PluginName)
		Return True
	Else
		DisableHandler(HandlerEDID)
		Return False
	EndIf

EndFunction

String Function ScanForMod(String QuestCheckEDID) Global

	String _PluginName = ""
	Quest _QuestCheck = Quest.GetQuest(QuestCheckEDID)

	If _QuestCheck
		_PluginName = GetPluginNameWithForm(_QuestCheck)
	EndIf

	Return _PluginName

EndFunction

  ;Return the name of the plugin a form belong to.
String Function GetPluginNameWithForm(Form myForm) Global
	int modIndex = Math.Ceiling(((myForm.GetFormID() - 16777215.0) / 16777215.0))
	If modIndex <= 0
		int tempID = - myForm.GetFormID()
		modIndex = 255 - Math.Ceiling(((tempID - 16777215.0) / 16777215.0))
	EndIf
	Return Game.GetModName(modIndex)
EndFunction

  ;Return the index of the plugin a form belong to.
Int Function GetPluginIndexWithForm(Form myForm) Global
	int modIndex = Math.Ceiling(((myForm.GetFormID() - 16777215.0) / 16777215.0))
	If modIndex <= 0
		int tempID = - myForm.GetFormID()
		modIndex = 255 - Math.Ceiling(((tempID - 16777215.0) / 16777215.0))
	EndIf
	Return modIndex
EndFunction

Function ScanForPlugins() Global
	int handle = ModEvent.Create("EWM_PluginCheck")
    if (handle)
        ModEvent.Send(handle)
    endIf
	
EndFunction