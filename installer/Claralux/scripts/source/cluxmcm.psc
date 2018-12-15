;/ Decompiled by Champollion V1.0.1
Source   : cluxMCM.psc
Modified : 2015-08-03 09:18:44
Compiled : 2015-08-03 09:18:54
User     : David
Computer : SLICK
/;
scriptName cluxMCM extends SKI_ConfigBase

;-- Properties --------------------------------------
globalvariable property cluxSolitude auto
globalvariable property cluxRandomize auto
globalvariable property cluxWinterhold auto
globalvariable property cluxRoadSigns auto
globalvariable property cluxForts auto
globalvariable property cluxRiverwood auto
globalvariable property cluxPaths auto
globalvariable property cluxGlow auto
globalvariable property cluxINSTALLED auto
globalvariable property cluxShrines auto
globalvariable property cluxTestMode auto
globalvariable property cluxHouses auto
globalvariable property cluxFixVanillaLights auto
globalvariable property cluxRiften auto
globalvariable property cluxDayNight auto
globalvariable property cluxHrothgar auto
globalvariable property cluxRuins auto
globalvariable property cluxRoads auto
globalvariable property cluxAll auto
globalvariable property cluxRedoubts auto
globalvariable property cluxLightLevelAdjust auto
globalvariable property cluxWindhelm auto
globalvariable property cluxLightshow auto
globalvariable property cluxReset auto
globalvariable property cluxHQ auto
globalvariable property cluxLightLevelOverUnder auto
globalvariable property cluxBridges auto
globalvariable property cluxCamps auto
globalvariable property cluxMarkarth auto
globalvariable property cluxGlowBridges auto
globalvariable property cluxUpdateInSeconds auto
globalvariable property cluxWhiterun auto
globalvariable property cluxStopHour auto
globalvariable property cluxStartHour auto

;-- Variables ---------------------------------------
Int OID_CluxRedoubts
Int OID_CluxHQ
Int clux_RESETStage
Int OID_CluxUpdateInSeconds
Int MSGLightShow
Int OID_CluxWinterhold
Int OID_CluxStopHour
Int OID_CluxCamps
Int OID_CluxGlowBridges
Int OID_CluxRoadSigns
Int OID_CluxMarkarth
Int OID_CluxPaths
Int OID_CluxReset
Int clux_PlayerGlow
Int OID_CluxHrothgar
Int OID_CluxSolitude
Int OID_CluxFixVanillaLights
Int clux_PlayerLightLevelVariance
Int MSGTestdoneOnce
Int OID_CluxTestMode
Int CurrentVersion = 1
Int OID_CluxRiften
Int OID_CluxForts
Int OID_CluxWindhelm
Int OID_CluxLightLevelAdjust
Int OID_CluxStartHour
Int OID_CluxRuins
Int OID_CluxLightshow
Int clux_LightshowStage
Int MSGResetdoneOnce
Int OID_CluxWhiterun
Int clux_PlayerUpdateTime
Int clux_PlayerLightLevel
Int OID_CluxHouses
Int OID_CluxRiverwood
Int OID_CluxAll
Int OID_CluxGlow
Int OID_CluxShrines
Int OID_CluxBridges
Int OID_CluxRoads
Int OID_CluxRandomize
Int OID_CluxLightLevelOverUnder

;-- Functions ---------------------------------------

function OnOptionSliderAccept(Int option, Float value)

	if option == OID_CluxLightLevelAdjust
		if cluxTestMode.value != 1 as Float
			debug.MessageBox("For safety, please enter TEST MODE before you adjust lightLevels.  TEST MODE will disable player controls in order to prevent you from crossing cells, and thereby loading/unloading lights in mid-process, which can lead to harmless, but undesired results. TEST MODE also decreases the UpdateTime in order for you to see your changes faster. It is recommended that you stand in a safe place with a good view at NIGHT between the hours of " + (cluxStartHour.value as Int - 12) as String + "pm and " + (cluxStopHour.value as Int) as String + "am.")
		else
			self.ClxSetGlobalVar(OID_CluxLightLevelAdjust, cluxLightLevelAdjust, value)
		endIf
	elseIf option == OID_CluxLightLevelOverUnder
		self.ClxSetGlobalVar(OID_CluxLightLevelOverUnder, cluxLightLevelOverUnder, value)
	elseIf option == OID_CluxStartHour
		self.ClxSetGlobalVar(OID_CluxStartHour, cluxStartHour, value)
	elseIf option == OID_CluxStopHour
		self.ClxSetGlobalVar(OID_CluxStopHour, cluxStopHour, value)
	elseIf option == OID_CluxGlow
		self.ClxSetGlobalVar(OID_CluxGlow, cluxGlow, value)
	elseIf option == OID_CluxGlowBridges
		self.ClxSetGlobalVar(OID_CluxGlowBridges, cluxGlowBridges, value)
	elseIf option == OID_CluxUpdateInSeconds
		self.ClxSetGlobalVar(OID_CluxUpdateInSeconds, cluxUpdateInSeconds, value)
		if cluxUpdateInSeconds.value <= 29 as Float
			if cluxAll.value == 1 as Float
				debug.Trace("CLUXMSG[1] : UPDATEINTERVAL has been altered to " + (cluxUpdateInSeconds.value as Int) as String + " seconds.", 0)
			endIf
			debug.MessageBox("This is a BAD idea.  Let me tell you why...  The lower you make this setting, the faster the lights will seek information about the time of day and light level.  In some cases, you'll have 100s of lights in memory and the last thing you want to do is choke Papyrus with a ton of rapid-fire scripts in addition to whatever else you've got going on in your game.  I'm going to let you do it, but don't be shocked if something goes wrong... if something DOES go wrong, just stand still, enter MCM, select DEFAULT for UPDATE INTERVAL (30) and then select RESET LIGHTS.")
		elseIf cluxUpdateInSeconds.value >= 31 as Float
			if cluxAll.value == 1 as Float
				debug.Trace("CLUXMSG[1] : UPDATEINTERVAL has been altered to " + (cluxUpdateInSeconds.value as Int) as String + " seconds.", 0)
			endIf
			debug.MessageBox("This is a GREAT idea especially on lower end machines or setups with many scripted mods.  Let me fill you in on why... Setting the UPDATE INTERVAL to longer cycles will take unnecessary stress off of your Papyrus Queue.  There is no true downside to adjusting this higher, EXCEPT when you are wandering around on the cusp of DAY or NIGHT.  In this case, you may see some lights either not come ON or OFF at the exact right time.  They will behave as expected eventually based on this setting, but just slower than might be ideal for 'immersion'.")
		endIf
	endIf
endFunction

Int function GetVersion()

	return 1
endFunction

; Skipped compiler generated GetState

function OnOptionSelect(Int option)

	if option == OID_CluxBridges
		self.ClxSetGlobalToggle(OID_CluxBridges, cluxBridges)
	elseIf option == OID_CluxCamps
		self.ClxSetGlobalToggle(OID_CluxCamps, cluxCamps)
	elseIf option == OID_CluxFixVanillaLights
		self.ClxSetGlobalToggle(OID_CluxFixVanillaLights, cluxFixVanillaLights)
	elseIf option == OID_CluxForts
		self.ClxSetGlobalToggle(OID_CluxForts, cluxForts)
	elseIf option == OID_CluxHouses
		self.ClxSetGlobalToggle(OID_CluxHouses, cluxHouses)
	elseIf option == OID_CluxHrothgar
		self.ClxSetGlobalToggle(OID_CluxHrothgar, cluxHrothgar)
	elseIf option == OID_CluxHQ
		self.ClxSetGlobalToggle(OID_CluxHQ, cluxHQ)
	elseIf option == OID_CluxMarkarth
		self.ClxSetGlobalToggle(OID_CluxMarkarth, cluxMarkarth)
	elseIf option == OID_CluxPaths
		self.ClxSetGlobalToggle(OID_CluxPaths, cluxPaths)
	elseIf option == OID_CluxRedoubts
		self.ClxSetGlobalToggle(OID_CluxRedoubts, cluxRedoubts)
	elseIf option == OID_CluxRiften
		self.ClxSetGlobalToggle(OID_CluxRiften, cluxRiften)
	elseIf option == OID_CluxRiverwood
		self.ClxSetGlobalToggle(OID_CluxRiverwood, cluxRiverwood)
	elseIf option == OID_CluxRoadSigns
		self.ClxSetGlobalToggle(OID_CluxRoadSigns, cluxRoadSigns)
	elseIf option == OID_CluxRuins
		self.ClxSetGlobalToggle(OID_CluxRuins, cluxRuins)
	elseIf option == OID_CluxShrines
		self.ClxSetGlobalToggle(OID_CluxShrines, cluxShrines)
	elseIf option == OID_CluxSolitude
		self.ClxSetGlobalToggle(OID_CluxSolitude, cluxSolitude)
	elseIf option == OID_CluxWhiterun
		self.ClxSetGlobalToggle(OID_CluxWhiterun, cluxWhiterun)
	elseIf option == OID_CluxWindhelm
		self.ClxSetGlobalToggle(OID_CluxWindhelm, cluxWindhelm)
	elseIf option == OID_CluxWinterhold
		self.ClxSetGlobalToggle(OID_CluxWinterhold, cluxWinterhold)
	elseIf option == OID_CluxTestMode
		self.ClxSetGlobalToggle(OID_CluxTestMode, cluxTestMode)
		if self.GetCurrentHourOfDay() > cluxStartHour.value || self.GetCurrentHourOfDay() < cluxStopHour.value
			if cluxTestMode.value == 1 as Float
				if cluxAll.value == 1 as Float
					debug.Trace("CLUXMSG[1] : TEST MODE ENABLED", 0)
				endIf
				game.DisablePlayerControls(true, true, true, false, true, false, true, false, 0)
				clux_PlayerUpdateTime = cluxUpdateInSeconds.GetValueInt()
				cluxUpdateInSeconds.setValue(5 as Float)
				if MSGTestdoneOnce == 0
					debug.MessageBox("You have entered CLARALUX LIGHT LEVEL TEST MODE. You may now use the LIGHT LEVEL slider and/or the RANDOMIZE LIGHTS feature below. Player controls are DISABLED for safety.  This prevents you from entering/exiting cells in which lights may be in mid-process.  It also speeds the Update Cycle in order for you to see faster results. Your first change may not be seen for " + clux_PlayerUpdateTime as String + "seconds so that the scripts may catch up.  All subsequent changes will be seen in " + (cluxUpdateInSeconds.value as Int) as String + " seconds. When satisfied, toggle TEST MODE off.  Your settings will remain and you player control will be restored.")
					MSGTestdoneOnce = 1
				else
					debug.Notification("You have entered CLUX TEST MODE.")
					debug.Notification("PLAYER CONTROLS disabled until toggled off")
					debug.Notification("UPDATE TIME " + clux_PlayerUpdateTime as String)
				endIf
			elseIf cluxTestMode.value == 0 as Float
				if cluxAll.value == 1 as Float
					debug.Trace("CLUXMSG[1] : TEST MODE DISABLED", 0)
				endIf
				game.EnablePlayerControls(true, true, true, true, true, true, true, true, 0)
				cluxUpdateInSeconds.setValue(clux_PlayerUpdateTime as Float)
				if MSGTestdoneOnce == 1
					debug.MessageBox("You have EXITED CLARALUX LIGHT LEVEL TEST MODE and may return to your game. UPDATEINTERVAL has been restored to " + (cluxUpdateInSeconds.value as Int) as String + " seconds. Remember to enter TEST MODE when you want to change the LIGHT LEVELS.  Other options may be altered outside of TEST MODE, however these changes will be seen as you cross into new cells - not immediately.  Some lights may be sluggish to relight depending upon where they are in their cycle.  Not to worry, they'll come on, probably within " + (cluxUpdateInSeconds.value as Int) as String + " seconds. You will not see this message boxagain during this playthrough.")
					MSGTestdoneOnce = 2
				else
					debug.Notification("You have exited CLUX TEST MODE.")
					debug.Notification("PLAYER CONTROLS restored.")
					debug.Notification("UPDATE TIME " + clux_PlayerUpdateTime as String)
				endIf
				self.UnregisterForUpdate()
			endIf
		else
			cluxTestMode.setValue(0 as Float)
			debug.MessageBox("It is DAYTIME.  You can't see the pretty lights at DAYTIME.  Return at NIGHT between the hours of " + (cluxStartHour.value as Int - 12) as String + "pm and " + (cluxStopHour.value as Int) as String + "am. ")
		endIf
	elseIf option == OID_CluxRandomize
		self.ClxSetGlobalToggle(OID_CluxRandomize, cluxRandomize)
		if cluxTestMode.value == 1 as Float
			self.registerForSingleUpdate(1 as Float)
		elseIf cluxTestMode.value != 1 as Float && cluxRandomize.value == 1 as Float
			debug.MessageBox("Please enter LIGHT LEVEL TEST MODE. Once you have entered TEST MODE, you may then utilize the RANDOMIZER, sit back and enjoy the light show.  If you see something you like, enter the MCM, disable the RANDOMIZER and EXIT TEST MODE.  Control will be restored and you'll be able to wander the world gazing at the lights ;)")
		endIf
	elseIf option == OID_CluxReset
		self.ClxSetGlobalToggle(OID_CluxReset, cluxReset)
		if cluxReset.value == 1 as Float && cluxTestMode.value != 1 as Float
			if cluxAll.value == 1 as Float
				debug.Trace("CLUXMSG[1] : RESET MODE ENABLED", 0)
				debug.Trace("CLUXMSG[1] : Stack Overflows may follow.  CLARALUX is trying to clean 'em up for you.", 0)
			endIf
			clux_PlayerLightLevel = cluxLightLevelAdjust.GetValueInt()
			clux_PlayerUpdateTime = cluxUpdateInSeconds.GetValueInt()
			cluxUpdateInSeconds.setValue(5 as Float)
			game.DisablePlayerControls(true, true, true, false, true, false, true, false, 0)
			debug.MessageBox("CLARALUX RESET : Exit the MCM and allow CLARALUX to do its thing.  RESET happens in three stages.  ONE: Disables Player Controls and sets all lights to 0.  This may take up to " + clux_PlayerUpdateTime as String + " seconds due to the initial UpdateTime.  TWO: Increases UpdateTime and restores your light level.  THREE: Restores Player control.  There is no need to return to the MCM as this all happens in-game.  You will receive a notification when the process is complete.  Do NOT interrupt the RESET.  Hands off the keyboard, folks... It should be noted that if you are using this feature, you MAY HAVE SCRIPT LATENCY PROBLEMS within your game.")
			clux_RESETStage = 1
			self.registerForSingleUpdate(1 as Float)
		elseIf cluxTestMode.value == 1 as Float
			debug.MessageBox("Please EXIT LIGHT LEVEL TEST MODE.")
		endIf
	elseIf option == OID_CluxLightshow
		self.ClxSetGlobalToggle(OID_CluxLightshow, cluxLightshow)
		if self.GetCurrentHourOfDay() > cluxStartHour.value || self.GetCurrentHourOfDay() < cluxStopHour.value
			if cluxAll.value == 1 as Float
				debug.Trace("CLUXMSG[1] : LIGHTSHOW ENABLED", 0)
				debug.Trace("CLUXMSG[1] : Stack Overflows MAY follow depending upon your system.", 0)
				debug.Trace("CLUXMSG[1] : Utilizing RESET LIGHTS in MCM will rectify and allow the game to catch up if problems persist.", 0)
			endIf
			if cluxLightshow.value == 1 as Float && cluxTestMode.value != 1 as Float
				if MSGLightShow == 0
					debug.MessageBox("Utterly and entirely useless but potentially fun lightshow illustrating CLARALUX's in-game ability to alter light levels.  Put on some retro-Disco music and get down. Player control is disabled. The show will begin in " + (cluxUpdateInSeconds.value as Int) as String + " seconds.")
					MSGLightShow = 0
				endIf
				game.DisablePlayerControls(true, true, true, false, true, false, true, false, 0)
				clux_PlayerLightLevel = cluxLightLevelAdjust.GetValueInt()
				clux_PlayerUpdateTime = cluxUpdateInSeconds.GetValueInt()
				clux_PlayerLightLevelVariance = cluxLightLevelOverUnder.GetValueInt()
				clux_PlayerGlow = cluxGlow.GetValueInt()
				cluxUpdateInSeconds.setValue(1 as Float)
				clux_LightshowStage = 1
				self.registerForSingleUpdate(1 as Float)
			elseIf cluxTestMode.value == 1 as Float
				debug.MessageBox("Please EXIT LIGHT LEVEL TEST MODE.")
			elseIf cluxLightshow.value == 0 as Float && clux_LightshowStage == 1
				self.registerForSingleUpdate(1 as Float)
			endIf
		else
			cluxLightshow.setValue(0 as Float)
			debug.MessageBox("It is DAYTIME.  You can't see the pretty lights at DAYTIME.  Return at NIGHT between the hours of " + (cluxStartHour.value as Int - 12) as String + "pm and " + (cluxStopHour.value as Int) as String + "am. ")
		endIf
	endIf
endFunction

function OnPageReset(String page)

	if page == ""
		self.LoadCustomContent("ClaraLux-signature.dds", 0.000000, 0.000000)
		return 
	else
		self.UnloadCustomContent()
	endIf
	if page == "General"
		self.SetCursorFillMode(self.TOP_TO_BOTTOM)
		self.AddHeaderOption("LIGHT Settings:", 0)
		OID_CluxTestMode = self.AddToggleOption("Toggle LIGHT LEVEL TEST MODE", cluxTestMode.GetValueInt() as Bool, 0)
		OID_CluxRandomize = self.AddToggleOption("RANDOMIZE Settings", cluxRandomize.GetValueInt() as Bool, 0)
		self.AddEmptyOption()
		OID_CluxLightLevelAdjust = self.AddSliderOption("Light LEVEL", cluxLightLevelAdjust.GetValueInt() as Float, "{0}", 0)
		OID_CluxLightLevelOverUnder = self.AddSliderOption("Light VARIANCE", cluxLightLevelOverUnder.GetValueInt() as Float, "{0}", 0)
		OID_CluxGlow = self.AddSliderOption("Light GLOW", cluxGlow.GetValueInt() as Float, "{0}", 0)
		self.AddEmptyOption()
		OID_CluxReset = self.AddToggleOption("RESET Lights", cluxReset.GetValueInt() as Bool, 0)
		OID_CluxLightshow = self.AddToggleOption("LightSHOW!", cluxLightshow.GetValueInt() as Bool, 0)
		self.AddEmptyOption()
		self.AddHeaderOption("TIME Settings:", 0)
		OID_CluxStartHour = self.AddSliderOption("Start Time", cluxStartHour.GetValueInt() as Float, "{0}", 0)
		OID_CluxStopHour = self.AddSliderOption("Stop Time", cluxStopHour.GetValueInt() as Float, "{0}", 0)
		self.AddEmptyOption()
		OID_CluxUpdateInSeconds = self.AddSliderOption("UPDATE Interval", cluxUpdateInSeconds.GetValueInt() as Float, "{0}", 0)
		self.AddEmptyOption()
		self.AddHeaderOption("MISC. Settings:", 0)
		OID_CluxAll = self.AddSliderOption("Debug MESSAGES", cluxAll.GetValueInt() as Float, "{0}", 0)
		self.SetCursorPosition(1)
		self.AddHeaderOption("ADDITIONAL LIGHT Enablers:", 0)
		OID_CluxRoads = self.AddSliderOption("Add LightPosts on ROADS", cluxRoads.GetValueInt() as Float, "{0}", 0)
		OID_CluxRoadSigns = self.AddToggleOption("Add Lights at ROADSIGNS", cluxRoadSigns.GetValueInt() as Bool, 0)
		OID_CluxBridges = self.AddToggleOption("Add Lights on BRIDGES", cluxBridges.GetValueInt() as Bool, 0)
		OID_CluxCamps = self.AddToggleOption("Add Lights at CAMPS", cluxCamps.GetValueInt() as Bool, 0)
		OID_CluxForts = self.AddToggleOption("Add Lights at FORTS", cluxForts.GetValueInt() as Bool, 0)
		OID_CluxHouses = self.AddToggleOption("Add Lights at HOUSES", cluxHouses.GetValueInt() as Bool, 0)
		OID_CluxPaths = self.AddToggleOption("Add PATH Torches", cluxPaths.GetValueInt() as Bool, 0)
		OID_CluxRedoubts = self.AddToggleOption("Add Lights at REDOUBTS", cluxRedoubts.GetValueInt() as Bool, 0)
		OID_CluxRuins = self.AddToggleOption("Add Lights at RUINS", cluxRuins.GetValueInt() as Bool, 0)
		OID_CluxShrines = self.AddToggleOption("Add Lights at SHRINES", cluxShrines.GetValueInt() as Bool, 0)
		self.AddEmptyOption()
		self.AddHeaderOption("CITY/TOWN Enablers:", 0)
		OID_CluxHrothgar = self.AddToggleOption("Add Lights to HIGH HROTHGAR", cluxHrothgar.GetValueInt() as Bool, 0)
		OID_CluxMarkarth = self.AddToggleOption("Add Lights to MARKARTH", cluxMarkarth.GetValueInt() as Bool, 0)
		OID_CluxRiften = self.AddToggleOption("Add Lights to RIFTEN", cluxRiften.GetValueInt() as Bool, 0)
		OID_CluxRiverwood = self.AddToggleOption("Add Lights to RIVERWOOD", cluxRiverwood.GetValueInt() as Bool, 0)
		OID_CluxSolitude = self.AddToggleOption("Add Lights to SOLITUDE", cluxSolitude.GetValueInt() as Bool, 0)
		OID_CluxWhiterun = self.AddToggleOption("Add Lights to WHITERUN", cluxWhiterun.GetValueInt() as Bool, 0)
		OID_CluxWindhelm = self.AddToggleOption("Add Lights to WINDHELM", cluxWindhelm.GetValueInt() as Bool, 0)
		OID_CluxWinterhold = self.AddToggleOption("Add Lights to WINTERHOLD", cluxWinterhold.GetValueInt() as Bool, 0)
		self.AddEmptyOption()
		self.AddHeaderOption("MISC Enablers:", 0)
		OID_CluxHQ = self.AddToggleOption("Enable Lighting ENGINEERS", cluxHQ.GetValueInt() as Bool, 0)
		OID_CluxFixVanillaLights = self.AddToggleOption("Enable VANILLA LIGHT FIX", cluxFixVanillaLights.GetValueInt() as Bool, 0)
	endIf
endFunction

function OnOptionDefault(Int option)

	if option == OID_CluxBridges
		self.ClxSetGlobalTo(OID_CluxBridges, cluxBridges, 1)
	elseIf option == OID_CluxCamps
		self.ClxSetGlobalTo(OID_CluxCamps, cluxCamps, 1)
	elseIf option == OID_CluxFixVanillaLights
		self.ClxSetGlobalTo(OID_CluxFixVanillaLights, cluxFixVanillaLights, 1)
	elseIf option == OID_CluxForts
		self.ClxSetGlobalTo(OID_CluxForts, cluxForts, 1)
	elseIf option == OID_CluxHouses
		self.ClxSetGlobalTo(OID_CluxHouses, cluxHouses, 1)
	elseIf option == OID_CluxHrothgar
		self.ClxSetGlobalTo(OID_CluxHrothgar, cluxHrothgar, 1)
	elseIf option == OID_CluxHQ
		self.ClxSetGlobalTo(OID_CluxHQ, cluxHQ, 1)
	elseIf option == OID_CluxMarkarth
		self.ClxSetGlobalTo(OID_CluxMarkarth, cluxMarkarth, 1)
	elseIf option == OID_CluxPaths
		self.ClxSetGlobalTo(OID_CluxPaths, cluxPaths, 1)
	elseIf option == OID_CluxRedoubts
		self.ClxSetGlobalTo(OID_CluxRedoubts, cluxRedoubts, 1)
	elseIf option == OID_CluxRiften
		self.ClxSetGlobalTo(OID_CluxRiften, cluxRiften, 1)
	elseIf option == OID_CluxRiverwood
		self.ClxSetGlobalTo(OID_CluxRiverwood, cluxRiverwood, 1)
	elseIf option == OID_CluxRoadSigns
		self.ClxSetGlobalTo(OID_CluxRoadSigns, cluxRoadSigns, 1)
	elseIf option == OID_CluxRuins
		self.ClxSetGlobalTo(OID_CluxRuins, cluxRuins, 1)
	elseIf option == OID_CluxShrines
		self.ClxSetGlobalTo(OID_CluxShrines, cluxShrines, 1)
	elseIf option == OID_CluxSolitude
		self.ClxSetGlobalTo(OID_CluxSolitude, cluxSolitude, 1)
	elseIf option == OID_CluxWhiterun
		self.ClxSetGlobalTo(OID_CluxWhiterun, cluxWhiterun, 1)
	elseIf option == OID_CluxWindhelm
		self.ClxSetGlobalTo(OID_CluxWindhelm, cluxWindhelm, 1)
	elseIf option == OID_CluxWinterhold
		self.ClxSetGlobalTo(OID_CluxWinterhold, cluxWinterhold, 1)
	elseIf option == OID_CluxTestMode
		self.ClxSetGlobalTo(OID_CluxTestMode, cluxTestMode, 0)
	endIf
endFunction

function OnOptionHighlight(Int option)

	if option == OID_CluxAll
		self.SetInfoText("DEBUG MESSAGES : 0 Off, 1 Lights Spawn, 2 Light Level Spawns")
	elseIf option == OID_CluxFixVanillaLights
		self.SetInfoText("Fixes some VANILLA lights when enabled.")
	elseIf option == OID_CluxHQ
		self.SetInfoText("Allow the occasional LIGHTING ENGINEER to do their jobs and keep the lights shining.")
	elseIf option == OID_CluxGlow
		self.SetInfoText("Certain lights can have a GLOW enabled.  This adjusts the size.")
	elseIf option == OID_CluxGlowBridges
		self.SetInfoText("Bridge Glow where appropriate.")
	elseIf option == OID_CluxLightLevelAdjust
		self.SetInfoText("Sets LIGHT INTENSITY and RADIUS.  Default setting of 3 is approximately vanilla.")
	elseIf option == OID_CluxLightLevelOverUnder
		self.SetInfoText("Sets RANDOM VARIANCE of light intensity within range of LIGHT LEVEL for a more organic effect.")
	elseIf option == OID_CluxRoads
		self.SetInfoText("Adds LIGHT POSTS to major ROADS. 0 = None, 1 = Half Enabled, 2 = All Enabled")
	elseIf option == OID_CluxStartHour
		self.SetInfoText("Sets hour on 24 hour clock to turn lights on")
	elseIf option == OID_CluxStopHour
		self.SetInfoText("Sets hour on 24 hour clock to turn lights off")
	elseIf option == OID_CluxUpdateInSeconds
		self.SetInfoText("Sets UPDATE INTERVAL for the Light Time Check. DO NOT ADJUST unless you know what you're doing.  Settings below 30 may become too rapid and cause script instability.  If you are experiencing script latency problems, try RAISING this.")
	elseIf option == OID_CluxTestMode
		self.SetInfoText("Determine what light settings are best for your setup.  Player control WILL BE DISABLED while in TEST MODE to prevent players from entering new cells and in order to speed the UpdateTime for better viewing.  Toggle back when you're satisfied.")
	elseIf option == OID_CluxRandomize
		self.SetInfoText("While in TEST MODE, let CLARALUX change your settings randomly until you see something you like.")
	elseIf option == OID_CluxReset
		self.SetInfoText("Correct CLUX Lights.  In rare instances, CLUX lights may misfire leading to unpredictable (and bright) results.  This force-resets them.")
	elseIf option == OID_CluxLightshow
		self.SetInfoText("Dazzle me")
	else
		self.SetInfoText("CLARALUX added lights and fixtures ON/OFF at this location/type.  Vanilla lights will remain active.")
	endIf
endFunction

function OnConfigInit()

	ModName = "CLARALUX : Lighting"
	Pages = new String[1]
	Pages[0] = "General"
endFunction

function ClxSetGlobalTo(Int OptionID, globalvariable OptionProperty, Int value)

	OptionProperty.setValueInt(value)
	self.SetToggleOptionValue(OptionID, OptionProperty as Bool, false)
endFunction

function ClxSetGlobalVar(Int OptionID, globalvariable OptionProperty, Float value)

	OptionProperty.setValueInt(value as Int)
	self.SetSliderOptionValue(OptionID, OptionProperty.GetValueInt() as Float, "{0}", false)
endFunction

function OnOptionSliderOpen(Int option)

	if option == OID_CluxLightLevelAdjust
		self.ClxGlobalSliderOpen(cluxLightLevelAdjust, 3, 1, 10, 1)
	elseIf option == OID_CluxLightLevelOverUnder
		self.ClxGlobalSliderOpen(cluxLightLevelOverUnder, 1, 0, 10, 1)
	elseIf option == OID_CluxStartHour
		self.ClxGlobalSliderOpen(cluxStartHour, 19, 0, 24, 1)
	elseIf option == OID_CluxStopHour
		self.ClxGlobalSliderOpen(cluxStopHour, 7, 0, 24, 1)
	elseIf option == OID_CluxGlow
		self.ClxGlobalSliderOpen(cluxGlow, 1, 0, 40, 1)
	elseIf option == OID_CluxGlowBridges
		self.ClxGlobalSliderOpen(cluxGlowBridges, 1, 0, 40, 1)
	elseIf option == OID_CluxUpdateInSeconds
		self.ClxGlobalSliderOpen(cluxUpdateInSeconds, 30, 5, 120, 1)
	elseIf option == OID_CluxAll
		self.ClxGlobalSliderOpen(cluxAll, 1, 0, 2, 1)
	elseIf option == OID_CluxRoads
		self.ClxGlobalSliderOpen(cluxRoads, 2, 0, 2, 1)
	endIf
endFunction

; Skipped compiler generated GotoState

Float function GetCurrentHourOfDay()

	Float Time = utility.GetCurrentGameTime()
	Time -= math.Floor(Time) as Float
	Time *= 24 as Float
	return Time
endFunction

function OnUpdate()

	if cluxTestMode.value == 1 as Float && cluxRandomize.value == 1 as Float
		cluxLightLevelAdjust.setValueInt(utility.randomInt(1, 10))
		cluxLightLevelOverUnder.setValueInt(utility.randomInt(1, 10))
		cluxGlow.setValueInt(utility.randomInt(0, 10))
		debug.Notification("LIGHT LEVEL : " + (cluxLightLevelAdjust.value as Int) as String)
		debug.Notification("LIGHT VARIANCE : " + (cluxLightLevelOverUnder.value as Int) as String)
		debug.Notification("GLOW SIZE : " + (cluxGlow.value as Int) as String)
		self.registerForSingleUpdate(clux_PlayerUpdateTime as Float)
	else
		self.UnregisterForUpdate()
	endIf
	if cluxLightshow.value == 1 as Float
		cluxLightLevelAdjust.setValueInt(utility.randomInt(1, 10))
		cluxLightLevelOverUnder.setValueInt(utility.randomInt(1, 10))
		cluxGlow.setValueInt(utility.randomInt(0, 10))
		clux_LightshowStage = 1
		self.registerForSingleUpdate(1 as Float)
	elseIf cluxLightshow.value == 0 as Float && clux_LightshowStage == 1
		cluxLightLevelAdjust.setValueInt(clux_PlayerLightLevel)
		cluxLightLevelOverUnder.setValueInt(clux_PlayerLightLevelVariance)
		cluxGlow.setValueInt(clux_PlayerGlow)
		cluxUpdateInSeconds.setValueInt(clux_PlayerUpdateTime)
		clux_LightshowStage = 2
		self.registerForSingleUpdate(1 as Float)
	elseIf cluxLightshow.value == 0 as Float && clux_LightshowStage == 2
		game.EnablePlayerControls(true, true, true, true, true, true, true, true, 0)
		if cluxAll.value == 1 as Float
			debug.Trace("CLUXMSG[1] : LIGHTSHOW Concluded", 0)
		endIf
		debug.MessageBox("LIGHT SHOW concluded.  Your settings have been restored.  Some lights may reset in " + (cluxUpdateInSeconds.value as Int) as String + " seconds.  Don't fear, they'll all come back on.  Due to the speed at which LIGHTSHOW operates, you may need to select RESET LIGHTS in order to get your system caught up.")
		clux_LightshowStage = 0
		self.UnregisterForUpdate()
	endIf
	if cluxReset.value == 1 as Float
		if clux_RESETStage == 1
			cluxLightLevelAdjust.setValueInt(0)
			clux_RESETStage = 2
			debug.Notification("CLARALUX RESET Stage 1 Complete")
			debug.Notification("All lights set to LEVEL 0 and will be removed.")
			self.registerForSingleUpdate(clux_PlayerUpdateTime as Float)
		elseIf clux_RESETStage == 2
			cluxLightLevelAdjust.setValueInt(clux_PlayerLightLevel)
			clux_RESETStage = 3
			debug.Notification("CLARALUX RESET Stage 2 Complete")
			debug.Notification("Light Levels Restored.  Final Cleanup.")
			self.registerForSingleUpdate(clux_PlayerUpdateTime as Float)
		elseIf clux_RESETStage == 3
			game.EnablePlayerControls(true, true, true, true, true, true, true, true, 0)
			cluxReset.setValueInt(0)
			clux_RESETStage = 0
			cluxUpdateInSeconds.setValue(clux_PlayerUpdateTime as Float)
			if cluxAll.value == 1 as Float
				debug.Trace("CLUXMSG[1] : RESET MODE Complete", 0)
			endIf
			debug.MessageBox("Claralux RESET complete.  Player control is now be restored. LIGHT LEVEL returned to " + (cluxLightLevelAdjust.value as Int) as String + ".  UPDATEINTERVAL returned to " + (cluxUpdateInSeconds.value as Int) as String + " seconds.  Some lights may be sluggish to relight depending upon where they are in their cycle.  Not to worry, they'll come on, probably within " + (cluxUpdateInSeconds.value as Int) as String + " seconds.")
			self.UnregisterForUpdate()
		endIf
	endIf
endFunction

function ClxGlobalSliderOpen(globalvariable OptionProperty, Int VarDef, Int VarMin, Int VarMax, Int VarInt)

	if OptionProperty.GetValueInt() > VarMax
		VarMax = OptionProperty.GetValueInt()
	endIf
	self.SetSliderDialogStartValue(OptionProperty.GetValueInt() as Float)
	self.SetSliderDialogDefaultValue(VarDef as Float)
	self.SetSliderDialogRange(VarMin as Float, VarMax as Float)
	self.SetSliderDialogInterval(VarInt as Float)
endFunction

function ClxSetGlobalToggle(Int OptionID, globalvariable OptionProperty)

	if OptionProperty.GetValueInt() == 0
		OptionProperty.setValueInt(1)
	else
		OptionProperty.setValueInt(0)
	endIf
	self.SetToggleOptionValue(OptionID, OptionProperty.GetValueInt() as Bool, false)
endFunction

function OnVersionUpdate(Int NewVersion)

	if NewVersion >= 1 && CurrentVersion != 2
		self.OnConfigInit()
	endIf
endFunction
