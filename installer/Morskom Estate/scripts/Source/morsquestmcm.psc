;/ Decompiled by Champollion V1.0.1
Source   : MorSQuestMCM.psc
Modified : 2014-12-18 06:49:14
Compiled : 2014-12-18 06:49:16
User     : Darkfox127
Computer : DARKFOX127-PC
/;
scriptName MorSQuestMCM extends SKI_ConfigBase

;-- Properties --------------------------------------
objectreference property MorXBannerApocrypha auto
objectreference property MorXBannerDawnguard auto
musictype property MorMusicTypeOmnia auto
objectreference property MorXPerformance auto
globalvariable property MorGTS auto
objectreference property MorXBannerStormcloak auto
objectreference property Fire04 auto
location property MorLocationMorskomInt auto
musictype property MorMusicTypeStormcloak auto
globalvariable property MorGImmersiveStorage auto
objectreference property MorXBannerTelvanni auto
objectreference property MorMailBox_7 auto
objectreference property MorXBannerImperial auto
objectreference property MorRefGhost auto
musictype property MorMusicTypeInspire auto
globalvariable property MorGACD auto
objectreference property MorRefMantlePieceLivingRoom auto
objectreference property MorRefDormChristmasItems auto
globalvariable property MorGFrostfall auto
globalvariable property MorGLoadImage auto
objectreference property Fire02 auto
objectreference property MorXBannerSovengarde auto
musictype property MorMusicTypeDistant auto
objectreference property MorMailBox_30 auto
objectreference property MorXBannerRedoran auto
globalvariable property MorGVisitations auto
objectreference property MorMailBox_14 auto
globalvariable property MorGDynamicInteriors auto
globalvariable property MorGNotifications auto
objectreference property MorXSM auto
globalvariable property MorGVisitationsMet auto
globalvariable property MorGSMEnable auto
objectreference property MorRefAutoSortContainer auto
globalvariable property MorGOwnership auto
globalvariable property MorGAutoSortCraft auto
musictype property MorMusicTypeHeartofThunder auto
globalvariable property MorGRC auto
globalvariable property MorGLoadImage01 auto
musictype property MorMusicTypeImperial auto
objectreference property MorRefDormSideTableItems auto
objectreference property MorRefMantleChristmasItems auto
objectreference property MorXDirt auto
objectreference property MorXBannerSummerset auto
objectreference property MorXBannerTG auto
objectreference property MorRefMantleItems auto
musictype property MorMusicTypeNeverToReturn auto
objectreference property MorXBannerNightingale auto
objectreference property MorXDormFurniture auto
objectreference property MorXBannerDB auto
objectreference property Fire01 auto
objectreference property Fire03 auto
objectreference property MorXNSUR auto
objectreference property MorXBannerNordic auto
objectreference property MorXTopFloorDoors auto
musictype property MorMusicTypeExplorerSnow auto
objectreference property MorXBannerMythic auto
objectreference property MorXBannerWinterhold auto
objectreference property MorXBottomFloorDoors auto
objectreference property MorRefBedWreaths auto

;-- Variables ---------------------------------------
Int iMCMStyle
Bool ValRC = true
Int iMail
Int iRC
Int iPerf
Int iMCMImage
Int iVis
Bool ValPerf = false
String[] MCMMenuImageList
String[] MCMMenuStyleList
Int IndexMCMImage = 0
Int iTS
Int IndexMCMStyle = 1
Bool ValNSUR = false
Int iAS
Int iIS
Bool ValACD = false
Int IndexBanners = 0
Int iNSUR
Bool ValFrost = false
Int IndexMail = 0
Bool ValDI = false
Bool ValiTS = true
Int iSM
Int iDI
Int iMus
String[] MailList
Int iBan
Int iNote
Bool ValiVis = true
Bool ValiNote = true
Int IndexMusic = 0
Bool ValAS = true
Int iFrost
Bool ValIS = false
Int iACD
String[] BannersList
Bool ValSM = false
String[] MusicList

;-- Functions ---------------------------------------

; Skipped compiler generated GotoState

function OnOptionMenuAccept(Int option, Int index)

	if option == iBan
		IndexBanners = index
		self.SetMenuOptionValue(iBan, BannersList[IndexBanners], false)
		if IndexBanners == 0
			self.DisBanners()
			self.ShowMessage("Banners Removed", false, "Understood", "$Cancel")
		elseIf IndexBanners == 1
			self.DisBanners()
			MorXBannerApocrypha.enable(false)
			self.ShowMessage("Banners Changed", false, "Understood", "$Cancel")
		elseIf IndexBanners == 2
			self.DisBanners()
			MorXBannerDB.enable(false)
			self.ShowMessage("Banners Changed", false, "Understood", "$Cancel")
		elseIf IndexBanners == 3
			self.DisBanners()
			MorXBannerDawnguard.enable(false)
			self.ShowMessage("Banners Changed", false, "Understood", "$Cancel")
		elseIf IndexBanners == 4
			self.DisBanners()
			MorXBannerImperial.enable(false)
			self.ShowMessage("Banners Changed", false, "Understood", "$Cancel")
		elseIf IndexBanners == 5
			self.DisBanners()
			MorXBannerMythic.enable(false)
			self.ShowMessage("Banners Changed", false, "Understood", "$Cancel")
		elseIf IndexBanners == 6
			self.DisBanners()
			MorXBannerNightingale.enable(false)
			self.ShowMessage("Banners Changed", false, "Understood", "$Cancel")
		elseIf IndexBanners == 7
			self.DisBanners()
			MorXBannerNordic.enable(false)
			self.ShowMessage("Banners Changed", false, "Understood", "$Cancel")
		elseIf IndexBanners == 8
			self.DisBanners()
			MorXBannerRedoran.enable(false)
			self.ShowMessage("Banners Changed", false, "Understood", "$Cancel")
		elseIf IndexBanners == 9
			self.DisBanners()
			MorXBannerSovengarde.enable(false)
			self.ShowMessage("Banners Changed", false, "Understood", "$Cancel")
		elseIf IndexBanners == 10
			self.DisBanners()
			MorXBannerStormcloak.enable(false)
			self.ShowMessage("Banners Changed", false, "Understood", "$Cancel")
		elseIf IndexBanners == 11
			self.DisBanners()
			MorXBannerSummerset.enable(false)
			self.ShowMessage("Banners Changed", false, "Understood", "$Cancel")
		elseIf IndexBanners == 12
			self.DisBanners()
			MorXBannerTelvanni.enable(false)
			self.ShowMessage("Banners Changed", false, "Understood", "$Cancel")
		elseIf IndexBanners == 13
			self.DisBanners()
			MorXBannerTG.enable(false)
			self.ShowMessage("Banners Changed", false, "Understood", "$Cancel")
		elseIf IndexBanners == 14
			self.DisBanners()
			MorXBannerWinterhold.enable(false)
			self.ShowMessage("Banners Changed", false, "Understood", "$Cancel")
		endIf
	elseIf option == iMail
		IndexMail = index
		self.SetMenuOptionValue(iMail, MailList[IndexMail], false)
		if IndexMail == 0
			self.DisMail()
			MorMailBox_7.enable(false)
			self.ShowMessage("Mail Box Set", false, "Understood", "$Cancel")
		elseIf IndexMail == 1
			self.DisMail()
			MorMailBox_14.enable(false)
			self.ShowMessage("Mail Box Set", false, "Understood", "$Cancel")
		elseIf IndexMail == 2
			self.DisMail()
			MorMailBox_30.enable(false)
			self.ShowMessage("Mail Box Set", false, "Understood", "$Cancel")
		endIf
	elseIf option == iMCMStyle
		IndexMCMStyle = index
		self.SetMenuOptionValue(iMCMStyle, MCMMenuStyleList[IndexMCMStyle], false)
		if IndexMCMStyle == 0
			MorGLoadImage.SetValue(0 as Float)
		elseIf IndexMCMStyle == 1
			MorGLoadImage.SetValue(1 as Float)
		elseIf IndexMCMStyle == 2
			MorGLoadImage.SetValue(2 as Float)
			self.ShowMessage("Exit MCM & Reload this menu to change the menu image", false, "Understood", "$Cancel")
		endIf
	elseIf option == iMCMImage
		IndexMCMImage = index
		self.SetMenuOptionValue(iMCMImage, MCMMenuImageList[IndexMCMImage], false)
		if IndexMCMImage == 0
			self.ShowMessage("Menu image changed. Exit and reload menu to see your changes", false, "Understood", "$Cancel")
			MorGLoadImage01.SetValue(1 as Float)
		elseIf IndexMCMImage == 1
			self.ShowMessage("Menu image changed. Exit and reload menu to see your changes", false, "Understood", "$Cancel")
			MorGLoadImage01.SetValue(2 as Float)
		elseIf IndexMCMImage == 2
			self.ShowMessage("Menu image changed. Exit and reload menu to see your changes", false, "Understood", "$Cancel")
			MorGLoadImage01.SetValue(3 as Float)
		elseIf IndexMCMImage == 3
			self.ShowMessage("Menu image changed. Exit and reload menu to see your changes", false, "Understood", "$Cancel")
			MorGLoadImage01.SetValue(4 as Float)
		elseIf IndexMCMImage == 4
			self.ShowMessage("Menu image changed. Exit and reload menu to see your changes", false, "Understood", "$Cancel")
			MorGLoadImage01.SetValue(5 as Float)
		elseIf IndexMCMImage == 5
			self.ShowMessage("Menu image changed. Exit and reload menu to see your changes", false, "Understood", "$Cancel")
			MorGLoadImage01.SetValue(6 as Float)
		elseIf IndexMCMImage == 6
			self.ShowMessage("Menu image changed. Exit and reload menu to see your changes", false, "Understood", "$Cancel")
			MorGLoadImage01.SetValue(7 as Float)
		elseIf IndexMCMImage == 7
			self.ShowMessage("Menu image changed. Exit and reload menu to see your changes", false, "Understood", "$Cancel")
			MorGLoadImage01.SetValue(8 as Float)
		elseIf IndexMCMImage == 8
			self.ShowMessage("Menu image changed. Exit and reload menu to see your changes", false, "Understood", "$Cancel")
			MorGLoadImage01.SetValue(9 as Float)
		elseIf IndexMCMImage == 9
			self.ShowMessage("Menu image changed. Exit and reload menu to see your changes", false, "Understood", "$Cancel")
			MorGLoadImage01.SetValue(10 as Float)
		endIf
	elseIf option == iMus
		IndexMusic = index
		self.SetMenuOptionValue(iMus, MusicList[IndexMusic], false)
		if IndexMusic == 0
			self.StopMus()
		elseIf IndexMusic == 1
			self.StopMus()
			utility.WaitMenuMode(1 as Float)
			MorMusicTypeDistant.Add()
		elseIf IndexMusic == 2
			self.StopMus()
			utility.WaitMenuMode(1 as Float)
			MorMusicTypeExplorerSnow.Add()
		elseIf IndexMusic == 3
			self.StopMus()
			utility.WaitMenuMode(1 as Float)
			MorMusicTypeHeartofThunder.Add()
		elseIf IndexMusic == 4
			self.StopMus()
			utility.WaitMenuMode(1 as Float)
			MorMusicTypeImperial.Add()
		elseIf IndexMusic == 5
			self.StopMus()
			utility.WaitMenuMode(1 as Float)
			MorMusicTypeInspire.Add()
		elseIf IndexMusic == 6
			self.StopMus()
			utility.WaitMenuMode(1 as Float)
			MorMusicTypeNeverToReturn.Add()
		elseIf IndexMusic == 7
			self.StopMus()
			utility.WaitMenuMode(1 as Float)
			MorMusicTypeOmnia.Add()
		elseIf IndexMusic == 8
			self.StopMus()
			utility.WaitMenuMode(1 as Float)
			MorMusicTypeStormcloak.Add()
		endIf
	endIf
endFunction

function DisBanners()

	MorXBannerApocrypha.disable(false)
	MorXBannerDB.disable(false)
	MorXBannerDawnguard.disable(false)
	MorXBannerImperial.disable(false)
	MorXBannerMythic.disable(false)
	MorXBannerNightingale.disable(false)
	MorXBannerNordic.disable(false)
	MorXBannerRedoran.disable(false)
	MorXBannerSovengarde.disable(false)
	MorXBannerStormcloak.disable(false)
	MorXBannerSummerset.disable(false)
	MorXBannerTelvanni.disable(false)
	MorXBannerTG.disable(false)
	MorXBannerWinterhold.disable(false)
endFunction

function StopMus()

	MorMusicTypeDistant.Remove()
	MorMusicTypeExplorerSnow.Remove()
	MorMusicTypeHeartofThunder.Remove()
	MorMusicTypeImperial.Remove()
	MorMusicTypeInspire.Remove()
	MorMusicTypeNeverToReturn.Remove()
	MorMusicTypeOmnia.Remove()
	MorMusicTypeStormcloak.Remove()
endFunction

function DisMail()

	MorMailBox_7.disable(false)
	MorMailBox_14.disable(false)
	MorMailBox_30.disable(false)
endFunction

function OnPageReset(String page)

	Int MCMStyleFlag
	Int MorskomMCMImage = utility.RandomInt(0, 11)
	if page == ""
		if MorGLoadImage.GetValue() == 0 as Float
			self.LoadCustomContent("Morskom/MorskomMCM00.dds", 0.000000, 0.000000)
			return 
		elseIf MorGLoadImage.GetValue() == 1 as Float
			if MorskomMCMImage == 0
				self.LoadCustomContent("Morskom/MorskomMCM01.dds", 0.000000, 0.000000)
				return 
			elseIf MorskomMCMImage == 1
				self.LoadCustomContent("Morskom/MorskomMCM02.dds", 0.000000, 0.000000)
				return 
			elseIf MorskomMCMImage == 2
				self.LoadCustomContent("Morskom/MorskomMCM03.dds", 0.000000, 0.000000)
				return 
			elseIf MorskomMCMImage == 3
				self.LoadCustomContent("Morskom/MorskomMCM04.dds", 0.000000, 0.000000)
				return 
			elseIf MorskomMCMImage == 4
				self.LoadCustomContent("Morskom/MorskomMCM05.dds", 0.000000, 0.000000)
				return 
			elseIf MorskomMCMImage == 5
				self.LoadCustomContent("Morskom/MorskomMCM06.dds", 0.000000, 0.000000)
				return 
			elseIf MorskomMCMImage == 6
				self.LoadCustomContent("Morskom/MorskomMCM07.dds", 0.000000, 0.000000)
				return 
			elseIf MorskomMCMImage == 7
				self.LoadCustomContent("Morskom/MorskomMCM08.dds", 0.000000, 0.000000)
				return 
			elseIf MorskomMCMImage == 8
				self.LoadCustomContent("Morskom/MorskomMCM09.dds", 0.000000, 0.000000)
				return 
			elseIf MorskomMCMImage == 9
				self.LoadCustomContent("Morskom/MorskomMCM010.dds", 0.000000, 0.000000)
				return 
			elseIf MorskomMCMImage == 10
				self.LoadCustomContent("Morskom/MorskomMCM011.dds", 0.000000, 0.000000)
				return 
			elseIf MorskomMCMImage == 11
				self.LoadCustomContent("Morskom/MorskomMCM012.dds", 0.000000, 0.000000)
				return 
			endIf
		elseIf MorGLoadImage.GetValue() == 2 as Float
			if MorGLoadImage01.GetValue() == 1 as Float
				self.LoadCustomContent("Morskom/MorskomMCM01.dds", 0.000000, 0.000000)
				return 
			elseIf MorGLoadImage01.GetValue() == 2 as Float
				self.LoadCustomContent("Morskom/MorskomMCM02.dds", 0.000000, 0.000000)
				return 
			elseIf MorGLoadImage01.GetValue() == 3 as Float
				self.LoadCustomContent("Morskom/MorskomMCM03.dds", 0.000000, 0.000000)
				return 
			elseIf MorGLoadImage01.GetValue() == 4 as Float
				self.LoadCustomContent("Morskom/MorskomMCM04.dds", 0.000000, 0.000000)
				return 
			elseIf MorGLoadImage01.GetValue() == 5 as Float
				self.LoadCustomContent("Morskom/MorskomMCM05.dds", 0.000000, 0.000000)
				return 
			elseIf MorGLoadImage01.GetValue() == 6 as Float
				self.LoadCustomContent("Morskom/MorskomMCM06.dds", 0.000000, 0.000000)
				return 
			elseIf MorGLoadImage01.GetValue() == 7 as Float
				self.LoadCustomContent("Morskom/MorskomMCM07.dds", 0.000000, 0.000000)
				return 
			elseIf MorGLoadImage01.GetValue() == 8 as Float
				self.LoadCustomContent("Morskom/MorskomMCM08.dds", 0.000000, 0.000000)
				return 
			elseIf MorGLoadImage01.GetValue() == 9 as Float
				self.LoadCustomContent("Morskom/MorskomMCM09.dds", 0.000000, 0.000000)
				return 
			elseIf MorGLoadImage01.GetValue() == 10 as Float
				self.LoadCustomContent("Morskom/MorskomMCM10.dds", 0.000000, 0.000000)
				return 
			elseIf MorGLoadImage01.GetValue() == 11 as Float
				self.LoadCustomContent("Morskom/MorskomMCM11.dds", 0.000000, 0.000000)
				return 
			elseIf MorGLoadImage01.GetValue() == 12 as Float
				self.LoadCustomContent("Morskom/MorskomMCM12.dds", 0.000000, 0.000000)
				return 
			endIf
		endIf
	else
		self.UnloadCustomContent()
	endIf
	if page == "Settings"
		Int MorLocFlag
		Int SMFlag
		Int OwnershipFlag
		Int MCMImageFlag
		Int BannerFlag
		Int AutoSortFlag
		Int ACDFlag
		self.SetCursorFillMode(self.LEFT_TO_RIGHT)
		self.AddHeaderOption("Features", 0)
		self.AddHeaderOption("Customisation", 0)
		self.AddEmptyOption()
		self.AddEmptyOption()
		if MorXBottomFloorDoors.IsDisabled() && MorXTopFloorDoors.IsDisabled()
			ACDFlag = self.OPTION_FLAG_DISABLED
			self.AddToggleOption("Auto Close Doors", iACD as Bool, ACDFlag)
		else
			ACDFlag = self.OPTION_FLAG_NONE
			iACD = self.AddToggleOption("Auto Close Doors", ValACD, 0)
		endIf
		if MorGOwnership.GetValue() == 0 as Float
			BannerFlag = self.OPTION_FLAG_DISABLED
			self.AddMenuOption("Banners", BannersList[IndexBanners], BannerFlag)
		elseIf MorGOwnership.GetValue() == 1 as Float
			BannerFlag = self.OPTION_FLAG_NONE
			iBan = self.AddMenuOption("Banners", BannersList[IndexBanners], 0)
		endIf
		if MorGAutoSortCraft.GetValue() == 0 as Float
			AutoSortFlag = self.OPTION_FLAG_DISABLED
			self.AddToggleOption("Auto Sort", iAS as Bool, AutoSortFlag)
		elseIf MorGAutoSortCraft.GetValue() == 1 as Float
			AutoSortFlag = self.OPTION_FLAG_NONE
			iAS = self.AddToggleOption("Auto Sort", ValAS, 0)
		endIf
		if MorGLoadImage.GetValue() == 2 as Float
			MCMImageFlag = self.OPTION_FLAG_NONE
			iMCMImage = self.AddMenuOption("Customise MCM Image", MCMMenuImageList[IndexMCMImage], 0)
		else
			MCMImageFlag = self.OPTION_FLAG_DISABLED
			self.AddMenuOption("Customise MCM", MCMMenuImageList[IndexMCMImage], MCMImageFlag)
		endIf
		if MorGOwnership.GetValue() == 0 as Float
			OwnershipFlag = self.OPTION_FLAG_DISABLED
			self.AddToggleOption("Dynamic Interiors", iDI as Bool, OwnershipFlag)
		elseIf MorGOwnership.GetValue() == 1 as Float
			OwnershipFlag = self.OPTION_FLAG_NONE
			iDI = self.AddToggleOption("Dynamic Interiors", ValDI, 0)
		endIf
		iMCMStyle = self.AddMenuOption("Customise MCM Style", MCMMenuStyleList[IndexMCMStyle], 0)
		if MorGOwnership.GetValue() == 0 as Float
			OwnershipFlag = self.OPTION_FLAG_DISABLED
			self.AddToggleOption("Immersive Storage", iIS as Bool, OwnershipFlag)
		elseIf MorGOwnership.GetValue() == 1 as Float
			OwnershipFlag = self.OPTION_FLAG_NONE
			iIS = self.AddToggleOption("Immersive Storage", ValIS, 0)
		endIf
		if game.GetPlayer().IsInLocation(MorLocationMorskomInt)
			MorLocFlag = self.OPTION_FLAG_NONE
			iMus = self.AddMenuOption("Music", MusicList[IndexMusic], 0)
		else
			MorLocFlag = self.OPTION_FLAG_DISABLED
			self.AddMenuOption("Music", MusicList[IndexMusic], MorLocFlag)
		endIf
		if MorGOwnership.GetValue() == 0 as Float
			OwnershipFlag = self.OPTION_FLAG_DISABLED
			self.AddMenuOption("Mail Box", MailList[IndexMail], OwnershipFlag)
		elseIf MorGOwnership.GetValue() == 1 as Float
			OwnershipFlag = self.OPTION_FLAG_NONE
			iMail = self.AddMenuOption("Mail Box", MailList[IndexMail], 0)
		endIf
		if MorGOwnership.GetValue() == 0 as Float
			OwnershipFlag = self.OPTION_FLAG_DISABLED
			self.AddToggleOption("Notifications", iNote as Bool, OwnershipFlag)
		elseIf MorGOwnership.GetValue() == 1 as Float
			OwnershipFlag = self.OPTION_FLAG_NONE
			iNote = self.AddToggleOption("Notifications", ValiNote, 0)
		endIf
		if MorGOwnership.GetValue() == 0 as Float
			OwnershipFlag = self.OPTION_FLAG_DISABLED
			self.AddToggleOption("Realistic Construction", iRC as Bool, OwnershipFlag)
		elseIf MorGOwnership.GetValue() == 1 as Float
			OwnershipFlag = self.OPTION_FLAG_NONE
			iRC = self.AddToggleOption("Realistic Construction", ValRC, 0)
		endIf
		iTS = self.AddToggleOption("Time Screens", ValiTS, 0)
		if MorGOwnership.GetValue() == 0 as Float
			SMFlag = self.OPTION_FLAG_DISABLED
			self.AddToggleOption("Season Mode", iSM as Bool, SMFlag)
		elseIf MorGSMEnable.GetValue() == 0 as Float
			SMFlag = self.OPTION_FLAG_DISABLED
			self.AddToggleOption("Season Mode", iSM as Bool, SMFlag)
		else
			SMFlag = self.OPTION_FLAG_NONE
			iSM = self.AddToggleOption("Season Mode", ValSM, 0)
		endIf
		if MorGVisitationsMet.GetValue() == 1 as Float
			iVis = self.AddToggleOption("Visitations", ValiVis, 0)
		endIf
	elseIf page == "Patches"
		Int FrostfallFlag
		self.SetCursorFillMode(self.TOP_TO_BOTTOM)
		self.AddHeaderOption("Patches", 0)
		self.AddEmptyOption()
		if MorGOwnership.GetValue() == 0 as Float
			FrostfallFlag = self.OPTION_FLAG_DISABLED
			self.AddToggleOption("Frostfall", iFrost as Bool, FrostfallFlag)
		elseIf MorGOwnership.GetValue() == 1 as Float
			FrostfallFlag = self.OPTION_FLAG_NONE
			iFrost = self.AddToggleOption("Frostfall", ValFrost, 0)
		endIf
		iNSUR = self.AddToggleOption("No Snow Under The Roof", ValNSUR, 0)
		iPerf = self.AddToggleOption("Performance", ValPerf, 0)
	elseIf page == "Guide"
		self.LoadCustomContent("Morskom/MorskomMCMg.dds", 0.000000, 0.000000)
		self.ShowMessage("For a full guide of this mod, please visit www.darkfox127.co.uk and use the navigation menu to find Morskom", false, "Understood", "$Cancel")
	endIf
endFunction

function OnConfigInit()

	Pages = new String[3]
	Pages[0] = "Settings"
	Pages[1] = "Patches"
	Pages[2] = "Guide"
endFunction

function OnOptionHighlight(Int option)

	if option == iACD
		self.SetInfoText("Doors close on their own after 5 seconds")
	elseIf option == iAS
		self.SetInfoText("Allows the use of a container which automatically organises your loot into relevant containers")
	elseIf option == iBan
		self.SetInfoText("Select the banner style in Morskom Estate to match your personal preference")
	elseIf option == iMCMStyle
		self.SetInfoText("Choose between a set image, random image, or custom image for this menu system")
	elseIf option == iMCMImage
		self.SetInfoText("Choose which image to show on this menu system")
	elseIf option == iDI
		self.SetInfoText("Morskom Estate's Interior will change depending on the time of day")
	elseIf option == iIS
		self.SetInfoText("Storage will only accept items which would logically be placed inside")
	elseIf option == iMail
		self.SetInfoText("Set how long until the mail box stops running if you fail to check it. Lower is better for your system to handle.")
	elseIf option == iRC
		self.SetInfoText("Rebuilding the estate will require different skill levels and more resources")
	elseIf option == iSM
		self.SetInfoText("Adds Christmas decorations to Morskom's interior and exterior for the special occasion")
	elseIf option == iFrost
		self.SetInfoText("Adds Frostfall style elements into Morskom")
	elseIf option == iNSUR
		self.SetInfoText("This patch enables thick snow on Oceanside Supply & Morskom Estate")
	elseIf option == iPerf
		self.SetInfoText("Removes a number of special effects from Morskom Estate")
	elseIf option == iTS
		self.SetInfoText("Toggles the short time screens throughout the mod on or off")
	elseIf option == iNote
		self.SetInfoText("Toggles notifications for the mail box and welcome home message on or off")
	elseIf option == iVis
		self.SetInfoText("Toggles Visitations by ghosts on or off")
	elseIf option == iMus
		self.SetInfoText("Select the music you wish to have play throughout Morskom Estate")
	elseIf MorGOwnership.GetValue() == 0 as Float
		self.SetInfoText("Most features of this mod will only be available once you own Morskom Estate or once certain conditions are met")
	else
		self.SetInfoText("Visit www.darkfox127.co.uk for the full guide to this mod")
	endIf
endFunction

; Skipped compiler generated GetState

function OnInit()

	parent.OnInit()
	BannersList = new String[15]
	BannersList[0] = "No Banners"
	BannersList[1] = "Apocrypha"
	BannersList[2] = "Dark Brotherhood"
	BannersList[3] = "Dawnguard"
	BannersList[4] = "Imperials"
	BannersList[5] = "Mythic Dawn"
	BannersList[6] = "Nightingale"
	BannersList[7] = "Nordic"
	BannersList[8] = "Redoran"
	BannersList[9] = "Sovngarde"
	BannersList[10] = "Stormcloaks"
	BannersList[11] = "Summerset Isle"
	BannersList[12] = "Telvanni"
	BannersList[13] = "Thieves Guild"
	BannersList[14] = "Winterhold"
	MailList = new String[3]
	MailList[0] = "7 Days"
	MailList[1] = "14 Days"
	MailList[2] = "30 Days"
	MCMMenuStyleList = new String[3]
	MCMMenuStyleList[0] = "Standard"
	MCMMenuStyleList[1] = "Randomise"
	MCMMenuStyleList[2] = "Customise"
	MCMMenuImageList = new String[12]
	MCMMenuImageList[0] = "Alchemy Lab"
	MCMMenuImageList[1] = "Bedroom"
	MCMMenuImageList[2] = "Boat"
	MCMMenuImageList[3] = "Dawnstar"
	MCMMenuImageList[4] = "Display Room"
	MCMMenuImageList[5] = "Forge"
	MCMMenuImageList[6] = "Hallway"
	MCMMenuImageList[7] = "House"
	MCMMenuImageList[8] = "Kitchen"
	MCMMenuImageList[9] = "Living Room"
	MCMMenuImageList[10] = "Library"
	MCMMenuImageList[11] = "Meadery"
	MusicList = new String[9]
	MusicList[0] = "No Music"
	MusicList[1] = "Distant"
	MusicList[2] = "Explorer Snow"
	MusicList[3] = "Heart of Thunder"
	MusicList[4] = "Imperials"
	MusicList[5] = "Inspire"
	MusicList[6] = "Never To Return"
	MusicList[7] = "Omnia Vincit Amor"
	MusicList[8] = "Stormcloaks"
endFunction

function OnOptionMenuOpen(Int option)

	if option == iBan
		self.SetMenuDialogOptions(BannersList)
		self.SetMenuDialogStartIndex(IndexBanners)
		self.SetMenuDialogDefaultIndex(0)
	endIf
	if option == iMail
		self.SetMenuDialogOptions(MailList)
		self.SetMenuDialogStartIndex(IndexMail)
		self.SetMenuDialogDefaultIndex(0)
	endIf
	if option == iMCMStyle
		self.SetMenuDialogOptions(MCMMenuStyleList)
		self.SetMenuDialogStartIndex(IndexMCMStyle)
		self.SetMenuDialogDefaultIndex(1)
	endIf
	if option == iMCMImage
		self.SetMenuDialogOptions(MCMMenuImageList)
		self.SetMenuDialogStartIndex(IndexMCMImage)
		self.SetMenuDialogDefaultIndex(0)
	endIf
	if option == iMus
		self.SetMenuDialogOptions(MusicList)
		self.SetMenuDialogStartIndex(IndexMusic)
		self.SetMenuDialogDefaultIndex(0)
	endIf
endFunction

function OnOptionSelect(Int option)

	if self.CurrentPage == "Settings"
		if option == iACD
			ValACD = !ValACD
			self.SetToggleOptionValue(iACD, ValACD, false)
			if MorGACD.GetValue() == 0 as Float
				MorGACD.SetValue(1 as Float)
				self.ShowMessage("Auto-Close Doors Activated", false, "Understood", "$Cancel")
			else
				MorGACD.SetValue(0 as Float)
				self.ShowMessage("Auto-Close Doors Deactivated", false, "Understood", "$Cancel")
			endIf
		elseIf option == iAS
			ValAS = !ValAS
			self.SetToggleOptionValue(iAS, ValAS, false)
			if MorRefAutoSortContainer.IsDisabled()
				MorRefAutoSortContainer.enable(false)
				self.ShowMessage("Auto-Sort Activated", false, "Understood", "$Cancel")
			else
				MorRefAutoSortContainer.disable(false)
				self.ShowMessage("Auto-Sort Deactivated", false, "Understood", "$Cancel")
			endIf
		elseIf option == iDI
			ValDI = !ValDI
			self.SetToggleOptionValue(iDI, ValDI, false)
			if MorGDynamicInteriors.GetValue() == 0 as Float
				MorGDynamicInteriors.SetValue(1 as Float)
				self.ShowMessage("Dynamic Interiors Activated", false, "Understood", "$Cancel")
			else
				MorGDynamicInteriors.SetValue(0 as Float)
				self.ShowMessage("Dynamic Interiors Deactivated", false, "Understood", "$Cancel")
			endIf
		elseIf option == iIS
			ValIS = !ValIS
			self.SetToggleOptionValue(iIS, ValIS, false)
			if MorGImmersiveStorage.GetValue() == 0 as Float
				MorGImmersiveStorage.SetValue(1 as Float)
				self.ShowMessage("Immersive Storage Activated", false, "Understood", "$Cancel")
			else
				MorGImmersiveStorage.SetValue(0 as Float)
				self.ShowMessage("Immersive Storage Deactivated", false, "Understood", "$Cancel")
			endIf
		elseIf option == iRC
			ValRC = !ValRC
			self.SetToggleOptionValue(iRC, ValRC, false)
			if MorGRC.GetValue() == 0 as Float
				MorGRC.SetValue(1 as Float)
				self.ShowMessage("Realistic Construction Activated", false, "Understood", "$Cancel")
			else
				MorGRC.SetValue(0 as Float)
				self.ShowMessage("Realistic Construction Deactivated", false, "Understood", "$Cancel")
			endIf
		elseIf option == iSM
			ValSM = !ValSM
			self.SetToggleOptionValue(iSM, ValSM, false)
			if MorXSM.IsDisabled()
				MorXSM.enable(false)
				if MorXDormFurniture.IsEnabled()
					MorRefBedWreaths.enable(false)
					MorRefDormSideTableItems.disable(false)
					MorRefDormChristmasItems.enable(false)
				endIf
				if MorRefMantlePieceLivingRoom.IsEnabled()
					MorRefMantleItems.disable(false)
					MorRefMantleChristmasItems.enable(false)
				endIf
				self.ShowMessage("Season Mode Activated", false, "Understood", "$Cancel")
			else
				MorXSM.disable(false)
				MorRefBedWreaths.disable(false)
				if MorXDormFurniture.IsEnabled()
					MorRefBedWreaths.enable(false)
					MorRefDormSideTableItems.enable(false)
					MorRefDormChristmasItems.disable(false)
				endIf
				if MorRefMantlePieceLivingRoom.IsEnabled()
					MorRefMantleItems.enable(false)
					MorRefMantleChristmasItems.disable(false)
				endIf
				self.ShowMessage("Season Mode Deactivated", false, "Understood", "$Cancel")
			endIf
		elseIf option == iTS
			ValiTS = !ValiTS
			self.SetToggleOptionValue(iTS, ValiTS, false)
			if MorGTS.GetValue() == 0 as Float
				MorGTS.SetValue(1 as Float)
				self.ShowMessage("Time Screens Activated", false, "Understood", "$Cancel")
			else
				MorGTS.SetValue(0 as Float)
				self.ShowMessage("Time Screens Deactivated", false, "Understood", "$Cancel")
			endIf
		elseIf option == iNote
			ValiNote = !ValiNote
			self.SetToggleOptionValue(iNote, ValiNote, false)
			if MorGNotifications.GetValue() == 0 as Float
				MorGNotifications.SetValue(1 as Float)
				self.ShowMessage("Notifications Activated", false, "Understood", "$Cancel")
			else
				MorGNotifications.SetValue(0 as Float)
				self.ShowMessage("Notifications Deactivated", false, "Understood", "$Cancel")
			endIf
		elseIf option == iVis
			ValiVis = !ValiVis
			self.SetToggleOptionValue(iVis, ValiVis, false)
			if MorGVisitations.GetValue() == 0 as Float
				MorGVisitations.SetValue(1 as Float)
				self.ShowMessage("Visitations Activated", false, "Understood", "$Cancel")
			else
				MorGVisitations.SetValue(0 as Float)
				MorRefGhost.disable(false)
				self.ShowMessage("Visitations Deactivated", false, "Understood", "$Cancel")
			endIf
		endIf
	elseIf self.CurrentPage == "Patches"
		if option == iFrost
			ValFrost = !ValFrost
			self.SetToggleOptionValue(iFrost, ValFrost, false)
			if MorGFrostfall.GetValue() == 0 as Float
				MorGFrostfall.SetValue(1 as Float)
				Fire01.disable(false)
				Fire02.disable(false)
				Fire03.disable(false)
				Fire04.disable(false)
				self.ShowMessage("The Frostfall patch has been activated and all fires in Morskom have been reset", false, "Understood", "$Cancel")
			else
				MorGFrostfall.SetValue(0 as Float)
				Fire01.disable(false)
				Fire02.disable(false)
				Fire03.disable(false)
				Fire04.disable(false)
				self.ShowMessage("The Frostfall patch has been deactivated and all fires in Morskom have been reset", false, "Understood", "$Cancel")
			endIf
		elseIf option == iNSUR
			ValNSUR = !ValNSUR
			self.SetToggleOptionValue(iNSUR, ValNSUR, false)
			if MorXNSUR.IsDisabled()
				MorXNSUR.enable(false)
				self.ShowMessage("No Snow Under The Roof patch has been activated", false, "Understood", "$Cancel")
			else
				MorXNSUR.disable(false)
				self.ShowMessage("No Snow Under The Roof patch has been deactivated", false, "Understood", "$Cancel")
			endIf
		elseIf option == iPerf
			ValPerf = !ValPerf
			self.SetToggleOptionValue(iPerf, ValPerf, false)
			if MorXPerformance.IsDisabled()
				MorXPerformance.enable(false)
				self.ShowMessage("The Performance patch has been activated", false, "Understood", "$Cancel")
			else
				MorXPerformance.disable(false)
				self.ShowMessage("The Performance patch has been deactivated", false, "Understood", "$Cancel")
			endIf
		endIf
	endIf
endFunction

function OnOptionDefault(Int option)

	if option == iACD
		ValACD = false
		self.SetToggleOptionValue(iACD, ValACD, false)
		MorGACD.SetValue(0 as Float)
		self.ShowMessage("Auto-Close Doors Activated", true, "$Accept", "$Cancel")
	elseIf option == iAS
		ValAS = true
		self.SetToggleOptionValue(iAS, ValAS, false)
		MorRefAutoSortContainer.enable(false)
		self.ShowMessage("Auto-Sort Doors Activated", true, "$Accept", "$Cancel")
	elseIf option == iBan
		self.DisBanners()
	elseIf option == iMCMStyle
		MorGLoadImage.SetValue(1 as Float)
	elseIf option == iMCMImage
		if MorGLoadImage.GetValue() == 2 as Float
			MorGLoadImage01.SetValue(1 as Float)
		endIf
	elseIf option == iDI
		ValDI = false
		self.SetToggleOptionValue(iDI, ValDI, false)
		MorGDynamicInteriors.SetValue(0 as Float)
		self.ShowMessage("Dynamic Interiors Deactivated", true, "$Accept", "$Cancel")
	elseIf option == iIS
		ValIS = false
		self.SetToggleOptionValue(iIS, ValIS, false)
		MorGImmersiveStorage.SetValue(0 as Float)
		self.ShowMessage("Immersive Storage Deactivated", true, "$Accept", "$Cancel")
	elseIf option == iMail
		self.DisMail()
		MorMailBox_7.enable(false)
	elseIf option == iRC
		ValRC = true
		self.SetToggleOptionValue(iRC, ValRC, false)
		MorGRC.SetValue(1 as Float)
		self.ShowMessage("Realistic Construction Activated", true, "$Accept", "$Cancel")
	elseIf option == iFrost
		ValFrost = false
		self.SetToggleOptionValue(iFrost, ValFrost, false)
		MorGFrostfall.SetValue(0 as Float)
		Fire01.disable(false)
		Fire02.disable(false)
		Fire03.disable(false)
		self.ShowMessage("The Frostfall patch has been deactivated and all fires in Morskom have been reset", false, "Understood", "$Cancel")
	elseIf option == iNSUR
		ValNSUR = false
		self.SetToggleOptionValue(iNSUR, ValNSUR, false)
		MorXNSUR.disable(false)
		self.ShowMessage("No Snow Under The Roof patch has been deactivated", true, "$Accept", "$Cancel")
	elseIf option == iPerf
		ValPerf = false
		self.SetToggleOptionValue(iPerf, ValPerf, false)
		MorXPerformance.disable(false)
		self.ShowMessage("The Performance patch has been deactivated", true, "$Accept", "$Cancel")
	elseIf option == iSM
		ValSM = false
		self.SetToggleOptionValue(iSM, ValSM, false)
		MorXSM.disable(false)
		MorRefBedWreaths.disable(false)
		if MorXDormFurniture.IsEnabled()
			MorRefBedWreaths.enable(false)
			MorRefDormSideTableItems.enable(false)
			MorRefDormChristmasItems.disable(false)
		endIf
		if MorRefMantlePieceLivingRoom.IsEnabled()
			MorRefMantleItems.enable(false)
			MorRefMantleChristmasItems.disable(false)
		endIf
		self.ShowMessage("Season Mode Deactivated", true, "$Accept", "$Cancel")
	elseIf option == iTS
		ValiTS = true
		self.SetToggleOptionValue(iTS, ValiTS, false)
		MorGTS.SetValue(1 as Float)
		self.ShowMessage("Time Screens Activated", true, "$Accept", "$Cancel")
	elseIf option == iNote
		ValiNote = true
		self.SetToggleOptionValue(iNote, ValiNote, false)
		MorGNotifications.SetValue(1 as Float)
		self.ShowMessage("Notifications Activated", true, "$Accept", "$Cancel")
	elseIf option == iVis
		ValiVis = true
		self.SetToggleOptionValue(iVis, ValiVis, false)
		MorGVisitations.SetValue(1 as Float)
		self.ShowMessage("Visitations Activated", true, "$Accept", "$Cancel")
	endIf
endFunction
