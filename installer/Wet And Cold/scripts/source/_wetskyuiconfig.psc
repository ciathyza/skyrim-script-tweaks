Scriptname _WetSkyUIConfig extends SKI_ConfigBase

;====================================================================================

_WetQuestScript Property _WetQuest Auto

String[] AshGearNPCList
String[] BlindPlayerList
String[] BreathPlayerList
String[] ColdGearNPCList
String[] GoHomeNPCList
String[] ModeList
String[] Pages
String[] PurchaseList
String[] RainGearNPCList
String[] StatusList

Int AshCoversOption
Int AshGearFollowerOption
Int AshGearNPCOption
Int AshGogglesOption
Int BlizzBlindNPCOption
Int BlizzBlindPlayerOption
Int BreathActorOption
Int BreathPlayerOption
Int ColdCloaksOption
Int ColdCoversOption
Int ColdGearFollowerOption
Int ColdGearNPCOption
Int ColdGlovesOption
Int ColdHoodsOption
Int DripActorOption
Int DripPlayerOption
Int DustActorOption
Int DustPlayerOption
Int FootWetActorOption
Int FootWetPlayerOption
Int GoHomeNPCOption
Int ModeOption
Int PurchaseAshFaceCoverOption
Int PurchaseAshGoggleOption
Int PurchaseColdCloakOption
Int PurchaseColdFaceCoverOption
Int PurchaseColdGloveOption
Int PurchaseColdHoodOption
Int PurchaseRainCloakOption
Int PurchaseRainHoodOption
Int PurchaseSurvivalBPOption
Int RainBlindPlayerOption
Int RainGearFollowerOption
Int RainGearNPCOption
Int SnowyActorOption
Int SnowyPlayerOption
Int StatusOption
Int StrongWindsOption
Int SurvBPOption
Int SurvivalGearNPCOption
Int SurvModItemsOption
Int WateryEyesPlayerOption
Int WetCloaksOption
Int WetHoodsOption
Int AshGearNPC
Int BlizzBlindPlayer
Int BreathPlayer
Int ColdGearNPC
Int GoHomeNPC
Int Mode
Int PurchaseAshFaceCover
Int PurchaseAshGoggle
Int PurchaseColdCloak
Int PurchaseColdFaceCover
Int PurchaseColdGlove
Int PurchaseColdHood
Int PurchaseRainCloak
Int PurchaseRainHood
Int PurchaseSurvivalBP
Int RainBlindPlayer
Int RainGearNPC
Int Status = 1

Bool AshCovers
Bool AshGearFollower
Bool AshGoggles
Bool BlizzBlindNPC
Bool BreathActor
Bool ColdCloaks
Bool ColdCovers
Bool ColdGearFollower
Bool ColdGloves
Bool ColdHoods
Bool DripActor
Bool DripPlayer
Bool DustActor
Bool DustPlayer
Bool FootWetActor
Bool FootWetPlayer
Bool PurchaseAshFaceCoverSet
Bool PurchaseAshGoggleSet
Bool PurchaseColdCloakSet
Bool PurchaseColdFaceCoverSet
Bool PurchaseColdGloveSet
Bool PurchaseColdHoodSet
Bool PurchaseRainCloakSet
Bool PurchaseRainHoodSet
Bool PurchaseSurvivalBPSet
Bool RainGearFollower
Bool SnowyActor
Bool SnowyPlayer
Bool StrongWinds
Bool SurvBP
Bool SurvivalGearNPC
Bool SurvModItems
Bool WateryEyesPlayer
Bool WetCloaks
Bool WetHoods

Actor targ


;====================================================================================

Function ApplySettings()
	If DripPlayer
		_WetQuest._WetDripPlayerToggle.SetValue(1)
	Else
		_WetQuest._WetDripPlayerToggle.SetValue(0)
	EndIf
	If DripActor
		_WetQuest._WetDripActorToggle.SetValue(1)
	Else
		_WetQuest._WetDripActorToggle.SetValue(0)
	EndIf
	If FootWetPlayer
		_WetQuest._WetFootWetPlayerToggle.SetValue(1)
	Else
		_WetQuest._WetFootWetPlayerToggle.SetValue(0)
	EndIf
	If FootWetActor
		_WetQuest._WetFootWetActorToggle.SetValue(1)
	Else
		_WetQuest._WetFootWetActorToggle.SetValue(0)
	EndIf
	If BreathPlayer == 0
		_WetQuest._WetBreathPlayerToggle.SetValue(0)
		_WetQuest._WetBreath1stToggle.SetValue(0)
	ElseIf BreathPlayer == 1
		_WetQuest._WetBreathPlayerToggle.SetValue(1)
		_WetQuest._WetBreath1stToggle.SetValue(1)
	Else
		_WetQuest._WetBreathPlayerToggle.SetValue(1)
		_WetQuest._WetBreath1stToggle.SetValue(0)
	EndIf
	If BreathActor
		_WetQuest._WetBreathActorToggle.SetValue(1)
	Else
		_WetQuest._WetBreathActorToggle.SetValue(0)
	EndIf
	If SnowyPlayer
		_WetQuest._WetSnowPlayerToggle.SetValue(1)
	Else
		_WetQuest._WetSnowPlayerToggle.SetValue(0)
	EndIf
	If SnowyActor
		_WetQuest._WetSnowActorToggle.SetValue(1)
	Else
		_WetQuest._WetSnowActorToggle.SetValue(0)
	EndIf
	If RainBlindPlayer == 0
		_WetQuest._WetRainBlindToggle.SetValue(0)
	ElseIf RainBlindPlayer == 1
		_WetQuest._WetRainBlindToggle.SetValue(1)
		_WetQuest.EyeBlack = True
	Else
		_WetQuest._WetRainBlindToggle.SetValue(1)
		_WetQuest.EyeBlack = False
	EndIf
	If GoHomeNPC == 0
		_WetQuest._WetGoHomeToggle.SetValue(0)
		_WetQuest._WetGoHomeRainAllQuest.Stop()
		_WetQuest._WetGoHomeRainQuest.Stop()
		_WetQuest._WetGoHomeBlizzQuest.Stop()
	ElseIf GoHomeNPC == 1
		_WetQuest._WetGoHomeToggle.SetValue(1)
		_WetQuest.IgnoreWorkersOn = False
	Else
		_WetQuest._WetGoHomeToggle.SetValue(1)
		_WetQuest.IgnoreWorkersOn = True
	EndIf
	If RainGearNPC == 0
		_WetQuest._WetRainGearToggle.SetValue(0)
	ElseIf RainGearNPC == 1
		_WetQuest._WetRainGearToggle.SetValue(1)
		_WetQuest.ExcludeArgs = False
		_WetQuest.WetFollowersOnly = False
	ElseIf RainGearNPC == 2
		_WetQuest._WetRainGearToggle.SetValue(1)
		_WetQuest.ExcludeArgs = True
		_WetQuest.WetFollowersOnly = False
	Else
		_WetQuest._WetRainGearToggle.SetValue(1)
		_WetQuest.ExcludeArgs = True
		_WetQuest.WetFollowersOnly = True
	EndIf
	If ColdGearNPC == 0
		_WetQuest._WetColdGearToggle.SetValue(0)
	ElseIf ColdGearNPC == 1
		_WetQuest._WetColdGearToggle.SetValue(1)
		_WetQuest.ExcludeNords = False
		_WetQuest.ColdFollowersOnly = False
	ElseIf ColdGearNPC == 2
		_WetQuest._WetColdGearToggle.SetValue(1)
		_WetQuest.ExcludeNords = True
		_WetQuest.ColdFollowersOnly = False
	Else
		_WetQuest._WetColdGearToggle.SetValue(1)
		_WetQuest.ExcludeNords = True
		_WetQuest.ColdFollowersOnly = True
	EndIf
	If BlizzBlindPlayer == 0
		_WetQuest._WetBlizzBlindPlayerToggle.SetValue(0)
	ElseIf BlizzBlindPlayer == 1
		_WetQuest._WetBlizzBlindPlayerToggle.SetValue(1)
		_WetQuest.EyeBlackBlizz = True
	Else
		_WetQuest._WetBlizzBlindPlayerToggle.SetValue(1)
		_WetQuest.EyeBlackBlizz = False
	EndIf
	If BlizzBlindNPC
		_WetQuest._WetBlizzBlindToggle.SetValue(1)
	Else
		_WetQuest._WetBlizzBlindToggle.SetValue(0)
	EndIf
	If StrongWinds
		_WetQuest._WetWindToggle.SetValue(1)
	Else
		_WetQuest._WetWindToggle.SetValue(0)
	EndIf
	_WetQuest.FollowerHoodOn = RainGearFollower
	_WetQuest.FollowerColdOn = ColdGearFollower
	If SurvivalGearNPC
		_WetQuest.SurvGearOn = True
		_WetQuest._WetSurvGearToggle.SetValue(1)
	Else
		_WetQuest.SurvGearOn = False
		_WetQuest._WetSurvGearToggle.SetValue(0)
	EndIf
	_WetQuest.ColdHoodsOn = ColdHoods
	_WetQuest.ColdCloaksOn = ColdCloaks
	_WetQuest.ColdGlovesOn = ColdGloves
	_WetQuest.ColdCoversOn = ColdCovers
	_WetQuest.WetHoodsOn = WetHoods
	_WetQuest.WetCloaksOn = WetCloaks
	_WetQuest.SurvBPOn = SurvBP
	_WetQuest.SurvModItemsOn = SurvModItems
	If PurchaseColdCloak == 1 && !PurchaseColdCloakSet
		_WetQuest.LItemMiscVendorMiscItems75.AddForm(_WetQuest._WetColdCloakLItem, 1, 1)
		_WetQuest.LItemMiscVendorMiscItems75.AddForm(_WetQuest._WetColdCloakLItem, 1, 1)
		_WetQuest.LItemMiscVendorMiscItems75.AddForm(_WetQuest._WetColdCloakLItem, 1, 1)
		_WetQuest.LItemMiscVendorArmor75.AddForm(_WetQuest._WetColdCloakLItem, 1, 1)
		_WetQuest.LItemMiscVendorArmor75.AddForm(_WetQuest._WetColdCloakLItem, 1, 1)
		_WetQuest.LItemClothesAll.AddForm(_WetQuest._WetColdCloakLItem, 1, 1)
		_WetQuest.LItemMiscVendorClothing75.AddForm(_WetQuest._WetColdCloakLItem, 1, 1)
		PurchaseColdCloakSet = True
	EndIf
	If PurchaseColdHood == 1 && !PurchaseColdHoodSet
		_WetQuest.LItemMiscVendorMiscItems75.AddForm(_WetQuest._WetColdHoodLItem, 1, 1)
		_WetQuest.LItemMiscVendorMiscItems75.AddForm(_WetQuest._WetColdHoodLItem, 1, 1)
		_WetQuest.LItemMiscVendorArmor75.AddForm(_WetQuest._WetColdHoodLItem, 1, 1)
		_WetQuest.LItemClothesAll.AddForm(_WetQuest._WetColdHoodLItem, 1, 1)
		_WetQuest.LItemMiscVendorClothing75.AddForm(_WetQuest._WetColdHoodLItem, 1, 1)
		PurchaseColdHoodSet = True
	EndIf
	If PurchaseColdGlove == 1 && !PurchaseColdGloveSet
		_WetQuest.LItemMiscVendorMiscItems75.AddForm(_WetQuest._WetColdGloveLItem, 1, 1)
		_WetQuest.LItemMiscVendorMiscItems75.AddForm(_WetQuest._WetColdGloveLItem, 1, 1)
		_WetQuest.LItemMiscVendorArmor75.AddForm(_WetQuest._WetColdGloveLItem, 1, 1)
		_WetQuest.LItemClothesAll.AddForm(_WetQuest._WetColdGloveLItem, 1, 1)
		_WetQuest.LItemMiscVendorClothing75.AddForm(_WetQuest._WetColdGloveLItem, 1, 1)
		PurchaseColdGloveSet = True
	EndIf
	If PurchaseColdFaceCover == 1 && !PurchaseColdFaceCoverSet
		_WetQuest.LItemMiscVendorMiscItems75.AddForm(_WetQuest._WetColdFaceCoverLItem, 1, 1)
		_WetQuest.LItemMiscVendorMiscItems75.AddForm(_WetQuest._WetColdFaceCoverLItem, 1, 1)
		_WetQuest.LItemMiscVendorMiscItems75.AddForm(_WetQuest._WetColdFaceCoverLItem, 1, 1)
		_WetQuest.LItemMiscVendorArmor75.AddForm(_WetQuest._WetColdFaceCoverLItem, 1, 1)
		_WetQuest.LItemMiscVendorArmor75.AddForm(_WetQuest._WetColdFaceCoverLItem, 1, 1)
		_WetQuest.LItemMiscVendorClothing75.AddForm(_WetQuest._WetColdFaceCoverLItem, 1, 1)
		PurchaseColdFaceCoverSet = True
	EndIf
	If PurchaseRainHood == 1 && !PurchaseRainHoodSet
		_WetQuest.LItemMiscVendorMiscItems75.AddForm(_WetQuest._WetRainHoodLItem, 1, 1)
		_WetQuest.LItemMiscVendorMiscItems75.AddForm(_WetQuest._WetRainHoodLItem, 1, 1)
		_WetQuest.LItemMiscVendorArmor75.AddForm(_WetQuest._WetRainHoodLItem, 1, 1)
		_WetQuest.LItemClothesAll.AddForm(_WetQuest._WetRainHoodLItem, 1, 1)
		_WetQuest.LItemMiscVendorClothing75.AddForm(_WetQuest._WetRainHoodLItem, 1, 1)
		PurchaseRainHoodSet = True
	EndIf
	If PurchaseRainCloak == 1 && !PurchaseRainCloakSet
		_WetQuest.LItemMiscVendorMiscItems75.AddForm(_WetQuest._WetRainCloakLItem, 1, 1)
		_WetQuest.LItemMiscVendorMiscItems75.AddForm(_WetQuest._WetRainCloakLItem, 1, 1)
		_WetQuest.LItemMiscVendorMiscItems75.AddForm(_WetQuest._WetRainCloakLItem, 1, 1)
		_WetQuest.LItemMiscVendorArmor75.AddForm(_WetQuest._WetRainCloakLItem, 1, 1)
		_WetQuest.LItemMiscVendorArmor75.AddForm(_WetQuest._WetRainCloakLItem, 1, 1)
		_WetQuest.LItemClothesAll.AddForm(_WetQuest._WetRainCloakLItem, 1, 1)
		_WetQuest.LItemMiscVendorClothing75.AddForm(_WetQuest._WetRainCloakLItem, 1, 1)
		PurchaseRainCloakSet = True
	EndIf
	If PurchaseSurvivalBP == 1 && !PurchaseSurvivalBPSet
		_WetQuest.LItemMiscVendorMiscItems75.AddForm(_WetQuest._WetSurvivalBPLItem, 1, 1)
		_WetQuest.LItemMiscVendorMiscItems75.AddForm(_WetQuest._WetSurvivalBPLItem, 1, 1)
		_WetQuest.LItemMiscVendorMiscItems75.AddForm(_WetQuest._WetSurvivalBPLItem, 1, 1)
		_WetQuest.LItemMiscVendorMiscItems75.AddForm(_WetQuest._WetSurvivalBPLItem, 1, 1)
		_WetQuest.LItemMiscVendorArmor75.AddForm(_WetQuest._WetSurvivalBPLItem, 1, 1)
		_WetQuest.LItemMiscVendorArmor75.AddForm(_WetQuest._WetSurvivalBPLItem, 1, 1)
		_WetQuest.LItemMiscVendorArmor75.AddForm(_WetQuest._WetSurvivalBPLItem, 1, 1)
		_WetQuest.LItemMiscVendorClothing75.AddForm(_WetQuest._WetSurvivalBPLItem, 1, 1)
		PurchaseSurvivalBPSet = True
	EndIf
	If PurchaseAshFaceCover == 1 && !PurchaseAshFaceCoverSet
		_WetQuest.DLC2LItemMiscVendorArmor75.AddForm(_WetQuest._WetAshFaceCoverLItem, 1, 1)
		_WetQuest.DLC2LItemMiscVendorArmor75.AddForm(_WetQuest._WetAshFaceCoverLItem, 1, 1)
		_WetQuest.DLC2LItemMiscVendorArmor75.AddForm(_WetQuest._WetAshFaceCoverLItem, 1, 1)
		PurchaseAshFaceCoverSet = True
	EndIf
	If PurchaseAshGoggle == 1 && !PurchaseAshGoggleSet
		_WetQuest.DLC2LItemMiscVendorArmor75.AddForm(_WetQuest._WetAshGoggleLItem, 1, 1)
		_WetQuest.DLC2LItemMiscVendorArmor75.AddForm(_WetQuest._WetAshGoggleLItem, 1, 1)
		_WetQuest.DLC2LItemMiscVendorArmor75.AddForm(_WetQuest._WetAshGoggleLItem, 1, 1)
		PurchaseAshGoggleSet = True
	EndIf
	If Mode == 0
		_WetQuest._WetWinterToggle.SetValue(0)
	ElseIf Mode == 1
		_WetQuest._WetWinterToggle.SetValue(0)
	Else
		_WetQuest._WetWinterToggle.SetValue(1)
	EndIf
	If AshGearNPC == 0
		_WetQuest._WetAshGearToggle.SetValue(0)
	ElseIf AshGearNPC == 1
		_WetQuest._WetAshGearToggle.SetValue(1)
		_WetQuest.AshFollowersOnly = False
	Else
		_WetQuest._WetAshGearToggle.SetValue(1)
		_WetQuest.AshFollowersOnly = True
	EndIf
	_WetQuest.GogglesOn = AshGoggles
	_WetQuest.FaceCoversOn = AshCovers
	If DustPlayer
		_WetQuest._WetDustPlayerToggle.SetValue(1)
	Else
		_WetQuest._WetDustPlayerToggle.SetValue(0)
	EndIf
	If DustActor
		_WetQuest._WetDustActorToggle.SetValue(1)
	Else
		_WetQuest._WetDustActorToggle.SetValue(0)
	EndIf
	_WetQuest.FollowerAshOn = AshGearFollower
	If WateryEyesPlayer
		_WetQuest._WetWateryEyesToggle.SetValue(1)
	Else
		_WetQuest._WetWateryEyesToggle.SetValue(0)
	EndIf
	If Status == 1
		_WetQuest.EnableMod()
	Else
		_WetQuest.DisableMod()
	EndIf
EndFunction


;====================================================================================

Event OnConfigInit()
	ModName = "$Wet and Cold"
	Pages = New String[3]
	Pages[0] = "$Wet"
	Pages[1] = "$Cold"
	Pages[2] = "$Ashes/Survival"
	StatusList = New String[2]
	StatusList[0] = "$Disabled"
	StatusList[1] = "$Enabled"
	ModeList = New String[3]
	ModeList[0] = "$Default"
	ModeList[1] = "$Summer"
	ModeList[2] = "$Winter"
	BreathPlayerList = New String[3]
	BreathPlayerList[0] = "$Disabled"
	BreathPlayerList[1] = "$1st/3rd Person"
	BreathPlayerList[2] = "$3rd Person"
	BlindPlayerList = New String[3]
	BlindPlayerList[0] = "$Disabled"
	BlindPlayerList[1] = "$Full"
	BlindPlayerList[2] = "$Blur"
	GoHomeNPCList = New String[3]
	GoHomeNPCList[0] = "$Disabled"
	GoHomeNPCList[1] = "$All Civilians"
	GoHomeNPCList[2] = "$Workers Ignore Rain"
	RainGearNPCList = New String[4]
	RainGearNPCList[0] = "$Disabled"
	RainGearNPCList[1] = "$All Races"
	RainGearNPCList[2] = "$No Argonians"
	RainGearNPCList[3] = "$Followers Only"
	ColdGearNPCList = New String[4]
	ColdGearNPCList[0] = "$Disabled"
	ColdGearNPCList[1] = "$All Races"
	ColdGearNPCList[2] = "$No Nords 6AM-8PM"
	ColdGearNPCList[3] = "$Followers Only"
	AshGearNPCList = New String[3]
	AshGearNPCList[0] = "$Disabled"
	AshGearNPCList[1] = "$Enabled"
	AshGearNPCList[2] = "$Followers Only"
	PurchaseList = New String[2]
	PurchaseList[0] = "$No Leveled Lists"
	PurchaseList[1] = "$Add to Leveled Lists"
	If _WetQuest._WetDripPlayerToggle.GetValue() as Int == 1
		DripPlayer = True
	Else
		DripPlayer = False
	EndIf
	If _WetQuest._WetDripActorToggle.GetValue() as Int == 1
		DripActor = True
	Else
		DripActor = False
	EndIf
	If _WetQuest._WetFootWetPlayerToggle.GetValue() as Int == 1
		FootWetPlayer = True
	Else
		FootWetPlayer = False
	EndIf
	If _WetQuest._WetFootWetActorToggle.GetValue() as Int == 1
		FootWetActor = True
	Else
		FootWetActor = False
	EndIf
	If _WetQuest._WetBreathPlayerToggle.GetValue() as Int == 0 && _WetQuest._WetBreath1stToggle.GetValue() as Int == 0
		BreathPlayer = 0
	ElseIf _WetQuest._WetBreathPlayerToggle.GetValue() as Int == 1 && _WetQuest._WetBreath1stToggle.GetValue() as Int == 1
		BreathPlayer = 1
	Else
		BreathPlayer = 2
	EndIf
	If _WetQuest._WetBreathActorToggle.GetValue() as Int == 1
		BreathActor = True
	Else
		BreathActor = False
	EndIf
	If _WetQuest._WetSnowPlayerToggle.GetValue() as Int == 1
		SnowyPlayer = True
	Else
		SnowyPlayer = False
	EndIf
	If _WetQuest._WetSnowActorToggle.GetValue() as Int == 1
		SnowyActor = True
	Else
		SnowyActor = False
	EndIf
	If _WetQuest._WetRainBlindToggle.GetValue() as Int == 0
		RainBlindPlayer = 0
	ElseIf _WetQuest._WetRainBlindToggle.GetValue() as Int == 1 && _WetQuest.EyeBlack
		RainBlindPlayer = 1
	Else
		RainBlindPlayer = 2
	EndIf
	If _WetQuest._WetBlizzBlindPlayerToggle.GetValue() as Int == 0
		BlizzBlindPlayer = 0
	ElseIf _WetQuest._WetBlizzBlindPlayerToggle.GetValue() as Int == 1 && _WetQuest.EyeBlackBlizz
		BlizzBlindPlayer = 1
	Else
		BlizzBlindPlayer = 2
	EndIf
	If _WetQuest._WetBlizzBlindToggle.GetValue() as Int == 1
		BlizzBlindNPC = True
	Else
		BlizzBlindNPC = False
	EndIf
	If _WetQuest._WetWindToggle.GetValue() as Int == 1
		StrongWinds = True
	Else
		StrongWinds = False
	EndIf
	If _WetQuest._WetGoHomeToggle.GetValue() as Int == 0
		GoHomeNPC = 0
	ElseIf _WetQuest._WetGoHomeToggle.GetValue() as Int == 1 && !_WetQuest.IgnoreWorkersOn
		GoHomeNPC = 1
	Else
		GoHomeNPC = 2
	EndIf
	If _WetQuest._WetRainGearToggle.GetValue() as Int == 0
		RainGearNPC = 0
	ElseIf _WetQuest._WetRainGearToggle.GetValue() as Int == 1 && !_WetQuest.ExcludeArgs && !_WetQuest.WetFollowersOnly
		RainGearNPC = 1
	ElseIf _WetQuest._WetRainGearToggle.GetValue() as Int == 1 && _WetQuest.ExcludeArgs && !_WetQuest.WetFollowersOnly
		RainGearNPC = 2
	Else
		RainGearNPC = 3
	EndIf
	If _WetQuest._WetColdGearToggle.GetValue() as Int == 0
		ColdGearNPC = 0
	ElseIf _WetQuest._WetColdGearToggle.GetValue() as Int == 1 && !_WetQuest.ExcludeNords && !_WetQuest.ColdFollowersOnly
		ColdGearNPC = 1
	ElseIf _WetQuest._WetColdGearToggle.GetValue() as Int == 1 && _WetQuest.ExcludeNords && !_WetQuest.ColdFollowersOnly
		ColdGearNPC = 2
	Else
		ColdGearNPC = 3
	EndIf
	RainGearFollower = _WetQuest.FollowerHoodOn
	ColdGearFollower = _WetQuest.FollowerColdOn
	If _WetQuest.SurvGearOn && _WetQuest._WetSurvGearToggle.GetValue() as Int == 1
		SurvivalGearNPC = True
	Else
		SurvivalGearNPC = False
	EndIf
	ColdHoods = _WetQuest.ColdHoodsOn
	ColdCloaks = _WetQuest.ColdCloaksOn
	ColdGloves = _WetQuest.ColdGlovesOn
	ColdCovers = _WetQuest.ColdCoversOn
	WetHoods = _WetQuest.WetHoodsOn
	WetCloaks = _WetQuest.WetCloaksOn
	SurvBP = _WetQuest.SurvBPOn
	SurvModItems = _WetQuest.SurvModItemsOn
	If _WetQuest._WetWinterToggle.GetValue() as Int == 1
		Mode = 2
	EndIf
	If _WetQuest._WetDustPlayerToggle.GetValue() as Int == 1
		DustPlayer = True
	Else
		DustPlayer = False
	EndIf
	If _WetQuest._WetDustActorToggle.GetValue() as Int == 1
		DustActor = True
	Else
		DustActor = False
	EndIf
	If _WetQuest._WetAshGearToggle.GetValue() as Int == 0
		AshGearNPC = 0
	ElseIf _WetQuest._WetAshGearToggle.GetValue() as Int == 1 && !_WetQuest.AshFollowersOnly
		AshGearNPC = 1
	Else
		AshGearNPC = 2
	EndIf
	AshGearFollower = _WetQuest.FollowerAshOn
	If _WetQuest._WetWateryEyesToggle.GetValue() as Int == 1
		WateryEyesPlayer = True
	Else
		WateryEyesPlayer = False
	EndIf
	AshGoggles = _WetQuest.GogglesOn
	AshCovers = _WetQuest.FaceCoversOn
EndEvent


;====================================================================================

Event OnPageReset(String Page)
	If Page == ""
		LoadCustomContent("wetandcold/title.dds")
		Return
	Else
		UnloadCustomContent()
	EndIf
	If Page == "$Wet"
		SetCursorFillMode(TOP_TO_BOTTOM)
		StatusOption = AddMenuOption("$Wet and Cold Status:", StatusList[Status])
		If Status == 1
			AddEmptyOption()
			AddHeaderOption("$Player")
			DripPlayerOption = AddToggleOption("$Drips", DripPlayer)
			FootWetPlayerOption = AddToggleOption("$Soggy Feet", FootWetPlayer)
			RainBlindPlayerOption = AddMenuOption("$Rain Blind", BlindPlayerList[RainBlindPlayer])
			AddEmptyOption()
			AddHeaderOption("$Rain Gear Options")
			If RainGearNPC > 0
				WetHoodsOption = AddToggleOption("$Hoods", WetHoods)
				WetCloaksOption = AddToggleOption("$Cloaks", WetCloaks)
				If RainGearNPC == 3
					RainGearFollower = True
				EndIf
				RainGearFollowerOption = AddToggleOption("$Followers", RainGearFollower)
			Else
				WetHoodsOption = AddToggleOption("$Hoods", false, OPTION_FLAG_DISABLED)
				WetCloaksOption = AddToggleOption("$Cloaks", false, OPTION_FLAG_DISABLED)
				RainGearFollowerOption = AddToggleOption("$Followers", false, OPTION_FLAG_DISABLED)
			EndIf
			SetCursorPosition(1)
			ModeOption = AddMenuOption("$Mode:", ModeList[Mode])
			AddEmptyOption()
			AddHeaderOption("$NPCs")
			DripActorOption = AddToggleOption("$Drips", DripActor)
			FootWetActorOption = AddToggleOption("$Soggy Feet", FootWetActor)
			GoHomeNPCOption = AddMenuOption("$Go Home", GoHomeNPCList[GoHomeNPC])
			AddEmptyOption()
			RainGearNPCOption = AddMenuOption("$Rain Gear", RainGearNPCList[RainGearNPC])
			PurchaseRainHoodOption = AddTextOption("", PurchaseList[PurchaseRainHood])
			PurchaseRainCloakOption = AddTextOption("", PurchaseList[PurchaseRainCloak])
		EndIf
	ElseIf Page == "$Cold"
		SetCursorFillMode(TOP_TO_BOTTOM)
		If Status == 1
			AddHeaderOption("$Player")
			BreathPlayerOption = AddMenuOption("$Breaths", BreathPlayerList[BreathPlayer])
			BlizzBlindPlayerOption = AddMenuOption("$Blizzard Blind", BlindPlayerList[BlizzBlindPlayer])
			SnowyPlayerOption = AddToggleOption("$Snowy", SnowyPlayer)
			StrongWindsOption = AddToggleOption("$Strong Winds", StrongWinds)
			AddEmptyOption()
			AddHeaderOption("$Cold Gear Options")
			If ColdGearNPC > 0
				ColdHoodsOption = AddToggleOption("$Hoods", ColdHoods)
				ColdCloaksOption = AddToggleOption("$Cloaks", ColdCloaks)
				ColdGlovesOption = AddToggleOption("$Gloves", ColdGloves)
				If _WetQuest._WetWCAshInstalled.GetValue() as Int == 1
					ColdCoversOption = AddToggleOption("$Face Covers", ColdCovers)
				Else
					ColdCoversOption = AddToggleOption("$Face Covers", false, OPTION_FLAG_DISABLED)
				EndIf
				If ColdGearNPC == 3
					ColdGearFollower = True
				EndIf
				ColdGearFollowerOption = AddToggleOption("$Followers", ColdGearFollower)
			Else
				ColdHoodsOption = AddToggleOption("$Hoods", false, OPTION_FLAG_DISABLED)
				ColdCloaksOption = AddToggleOption("$Cloaks", false, OPTION_FLAG_DISABLED)
				ColdGlovesOption = AddToggleOption("$Gloves", false, OPTION_FLAG_DISABLED)
				ColdCoversOption = AddToggleOption("$Face Covers", false, OPTION_FLAG_DISABLED)
				ColdGearFollowerOption = AddToggleOption("$Followers", false, OPTION_FLAG_DISABLED)
			EndIf
			SetCursorPosition(1)
			AddHeaderOption("$NPCs")
			BreathActorOption = AddToggleOption("$Breaths", BreathActor)
			BlizzBlindNPCOption = AddToggleOption("$Blizzard Blind", BlizzBlindNPC)
			SnowyActorOption = AddToggleOption("$Snowy", SnowyActor)
			AddEmptyOption()
			AddEmptyOption()
			ColdGearNPCOption = AddMenuOption("$Cold Gear", ColdGearNPCList[ColdGearNPC])
			PurchaseColdHoodOption = AddTextOption("", PurchaseList[PurchaseColdHood])
			PurchaseColdCloakOption = AddTextOption("", PurchaseList[PurchaseColdCloak])
			PurchaseColdGloveOption = AddTextOption("", PurchaseList[PurchaseColdGlove])
			PurchaseColdFaceCoverOption = AddTextOption("", PurchaseList[PurchaseColdFaceCover])
		Else
			StatusOption = AddMenuOption("$Wet and Cold Status:", StatusList[Status], OPTION_FLAG_DISABLED)
		EndIf
	ElseIf Page == "$Ashes/Survival"
		SetCursorFillMode(TOP_TO_BOTTOM)
		If Status == 1
			AddHeaderOption("$Player")
			If _WetQuest._WetWCAshInstalled.GetValue() as Int == 1
				DustPlayerOption = AddToggleOption("$Dusty", DustPlayer)
				WateryEyesPlayerOption = AddToggleOption("$Watery Eyes", WateryEyesPlayer)
			Else
				DustPlayerOption = AddToggleOption("$Dusty", false, OPTION_FLAG_DISABLED)
				WateryEyesPlayerOption = AddToggleOption("$Watery Eyes", false, OPTION_FLAG_DISABLED)
			EndIf
			AddEmptyOption()
			AddHeaderOption("$Ash/Survival Gear Options")
			If _WetQuest._WetWCAshInstalled.GetValue() as Int == 1
				If AshGearNPC > 0
					AshGogglesOption = AddToggleOption("$Goggles", AshGoggles)
					AshCoversOption = AddToggleOption("$Face Covers", AshCovers)
					If AshGearNPC == 2
						AshGearFollower = True
					EndIf
					AshGearFollowerOption = AddToggleOption("$Followers", AshGearFollower)
				Else
					AshGogglesOption = AddToggleOption("$Goggles", false, OPTION_FLAG_DISABLED)
					AshCoversOption = AddToggleOption("$Face Covers", false, OPTION_FLAG_DISABLED)
					AshGearFollowerOption = AddToggleOption("$Followers", false, OPTION_FLAG_DISABLED)
				EndIf
			Else
				AshGogglesOption = AddToggleOption("$Goggles", false, OPTION_FLAG_DISABLED)
				AshCoversOption = AddToggleOption("$Face Covers", false, OPTION_FLAG_DISABLED)
				AshGearFollowerOption = AddToggleOption("$Followers", false, OPTION_FLAG_DISABLED)
			EndIf
			AddEmptyOption()
			If SurvivalGearNPC
				SurvBPOption = AddToggleOption("$Backpacks", SurvBP)
				If _WetQuest.WaterskinList
					SurvModItemsOption = AddToggleOption("$Waterskins", SurvModItems)
				Else
					SurvModItemsOption = AddToggleOption("$Waterskins", false, OPTION_FLAG_DISABLED)
				EndIf
			Else
				SurvBPOption = AddToggleOption("$Backpacks", false, OPTION_FLAG_DISABLED)
				SurvModItemsOption = AddToggleOption("$Waterskins", false, OPTION_FLAG_DISABLED)
			EndIf
			SetCursorPosition(1)
			AddHeaderOption("$NPCs")
			If _WetQuest._WetWCAshInstalled.GetValue() as Int == 1
				DustActorOption = AddToggleOption("$Dusty", DustActor)
				AddEmptyOption()
				AddEmptyOption()
				AshGearNPCOption = AddMenuOption("$Ash Gear", AshGearNPCList[AshGearNPC])
				PurchaseAshGoggleOption = AddTextOption("", PurchaseList[PurchaseAshGoggle])
				PurchaseAshFaceCoverOption = AddTextOption("", PurchaseList[PurchaseAshFaceCover])
			Else
				DustActorOption = AddToggleOption("$Dusty", false, OPTION_FLAG_DISABLED)
				AddEmptyOption()
				AddEmptyOption()
				AshGearNPCOption = AddMenuOption("$Ash Gear", AshGearNPCList[2], OPTION_FLAG_DISABLED)
				PurchaseAshGoggleOption = AddTextOption("", PurchaseList[PurchaseAshGoggle], OPTION_FLAG_DISABLED)
				PurchaseAshFaceCoverOption = AddTextOption("", PurchaseList[PurchaseAshFaceCover], OPTION_FLAG_DISABLED)
			EndIf
			AddEmptyOption()
			SurvivalGearNPCOption = AddToggleOption("$Survival Gear", SurvivalGearNPC)
			PurchaseSurvivalBPOption = AddTextOption("", PurchaseList[PurchaseSurvivalBP])
		Else
			StatusOption = AddMenuOption("$Wet and Cold Status:", StatusList[Status], OPTION_FLAG_DISABLED)
		EndIf
	EndIf
EndEvent


;====================================================================================

Function CheckGearSelection()
	If !WetHoods && !WetCloaks
		RainGearNPC = 0
	EndIf
	If !ColdHoods && !ColdCloaks && !ColdGloves && (!ColdCovers || _WetQuest._WetWCAshInstalled.GetValue() as Int == 0)
		ColdGearNPC = 0
	EndIf
	If !SurvBP && (!SurvModItems || !_WetQuest.WaterskinList)
		SurvivalGearNPC = False
	EndIf
	If !AshGoggles && !AshCovers
		AshGearNPC = 0
	EndIf
EndFunction


Event OnOptionSelect(Int Option)
	If Option == DripPlayerOption
		DripPlayer = !DripPlayer
		SetToggleOptionValue(DripPlayerOption, DripPlayer)
		ForcePageReset()
	ElseIf Option == DripActorOption
		DripActor = !DripActor
		SetToggleOptionValue(DripActorOption, DripActor)
		ForcePageReset()
	ElseIf Option == FootWetPlayerOption
		FootWetPlayer = !FootWetPlayer
		SetToggleOptionValue(FootWetPlayerOption, FootWetPlayer)
	ElseIf Option == FootWetActorOption
		FootWetActor = !FootWetActor
		SetToggleOptionValue(FootWetActorOption, FootWetActor)
	ElseIf Option == BreathActorOption
		BreathActor = !BreathActor
		SetToggleOptionValue(BreathActorOption, BreathActor)
	ElseIf Option == SnowyPlayerOption
		SnowyPlayer = !SnowyPlayer
		SetToggleOptionValue(SnowyPlayerOption, SnowyPlayer)
	ElseIf Option == SnowyActorOption
		SnowyActor = !SnowyActor
		SetToggleOptionValue(SnowyActorOption, SnowyActor)
	ElseIf Option == BlizzBlindNPCOption
		BlizzBlindNPC = !BlizzBlindNPC
		SetToggleOptionValue(BlizzBlindNPCOption, BlizzBlindNPC)
	ElseIf Option == StrongWindsOption
		StrongWinds = !StrongWinds
		SetToggleOptionValue(StrongWindsOption, StrongWinds)
	ElseIf Option == RainGearFollowerOption
		RainGearFollower = !RainGearFollower
		SetToggleOptionValue(RainGearFollowerOption, RainGearFollower)
		ForcePageReset()
	ElseIf Option == ColdGearFollowerOption
		ColdGearFollower = !ColdGearFollower
		SetToggleOptionValue(ColdGearFollowerOption, ColdGearFollower)
		ForcePageReset()
	ElseIf Option == SurvivalGearNPCOption
		SurvivalGearNPC = !SurvivalGearNPC
		CheckGearSelectionMenu()
		SetToggleOptionValue(SurvivalGearNPCOption, SurvivalGearNPC)
		ForcePageReset()
	ElseIf Option == ColdHoodsOption
		ColdHoods = !ColdHoods
		CheckGearSelection()
		SetToggleOptionValue(ColdHoodsOption, ColdHoods)
		ForcePageReset()
	ElseIf Option == ColdCloaksOption
		ColdCloaks = !ColdCloaks
		SetToggleOptionValue(ColdCloaksOption, ColdCloaks)
		ForcePageReset()
	ElseIf Option == ColdGlovesOption
		ColdGloves = !ColdGloves
		CheckGearSelection()
		SetToggleOptionValue(ColdGlovesOption, ColdGloves)
		ForcePageReset()
	ElseIf Option == ColdCoversOption
		ColdCovers = !ColdCovers
		CheckGearSelection()
		SetToggleOptionValue(ColdCoversOption, ColdCovers)
		ForcePageReset()
	ElseIf Option == WetHoodsOption
		WetHoods = !WetHoods
		CheckGearSelection()
		SetToggleOptionValue(WetHoodsOption, WetHoods)
		ForcePageReset()
	ElseIf Option == WetCloaksOption
		WetCloaks = !WetCloaks
		CheckGearSelection()
		SetToggleOptionValue(WetCloaksOption, WetCloaks)
		ForcePageReset()
	ElseIf Option == SurvBPOption
		SurvBP = !SurvBP
		CheckGearSelection()
		SetToggleOptionValue(SurvBPOption, SurvBP)
		ForcePageReset()
	ElseIf Option == SurvModItemsOption
		SurvModItems = !SurvModItems
		CheckGearSelection()
		SetToggleOptionValue(SurvModItemsOption, SurvModItems)
		ForcePageReset()
	ElseIf Option == PurchaseColdCloakOption
		If PurchaseColdCloak == 0
			PurchaseColdCloak = 1
		Else
			PurchaseColdCloak = 0
		EndIf
		SetTextOptionValue(PurchaseColdCloakOption, PurchaseList[PurchaseColdCloak])
	ElseIf Option == PurchaseColdHoodOption
		If PurchaseColdHood == 0
			PurchaseColdHood = 1
		Else
			PurchaseColdHood = 0
		EndIf
		SetTextOptionValue(PurchaseColdHoodOption, PurchaseList[PurchaseColdHood])
	ElseIf Option == PurchaseColdGloveOption
		If PurchaseColdGlove == 0
			PurchaseColdGlove = 1
		Else
			PurchaseColdGlove = 0
		EndIf
		SetTextOptionValue(PurchaseColdGloveOption, PurchaseList[PurchaseColdGlove])
	ElseIf Option == PurchaseColdFaceCoverOption
		If PurchaseColdFaceCover == 0
			PurchaseColdFaceCover = 1
		Else
			PurchaseColdFaceCover = 0
		EndIf
		SetTextOptionValue(PurchaseColdFaceCoverOption, PurchaseList[PurchaseColdFaceCover])
	ElseIf Option == PurchaseRainHoodOption
		If PurchaseRainHood == 0
			PurchaseRainHood = 1
		Else
			PurchaseRainHood = 0
		EndIf
		SetTextOptionValue(PurchaseRainHoodOption, PurchaseList[PurchaseRainHood])
	ElseIf Option == PurchaseRainCloakOption
		If PurchaseRainCloak == 0
			PurchaseRainCloak = 1
		Else
			PurchaseRainCloak = 0
		EndIf
		SetTextOptionValue(PurchaseRainCloakOption, PurchaseList[PurchaseRainCloak])
	ElseIf Option == PurchaseSurvivalBPOption
		If PurchaseSurvivalBP == 0
			PurchaseSurvivalBP = 1
		Else
			PurchaseSurvivalBP = 0
		EndIf
		SetTextOptionValue(PurchaseSurvivalBPOption, PurchaseList[PurchaseSurvivalBP])
	ElseIf Option == PurchaseAshFaceCoverOption
		If PurchaseAshFaceCover == 0
			PurchaseAshFaceCover = 1
		Else
			PurchaseAshFaceCover = 0
		EndIf
		SetTextOptionValue(PurchaseAshFaceCoverOption, PurchaseList[PurchaseAshFaceCover])
	ElseIf Option == PurchaseAshGoggleOption
		If PurchaseAshGoggle == 0
			PurchaseAshGoggle = 1
		Else
			PurchaseAshGoggle = 0
		EndIf
		SetTextOptionValue(PurchaseAshGoggleOption, PurchaseList[PurchaseAshGoggle])
	ElseIf Option == AshGogglesOption
		AshGoggles = !AshGoggles
		CheckGearSelection()
		SetToggleOptionValue(AshGogglesOption, AshGoggles)
		ForcePageReset()
	ElseIf Option == AshCoversOption
		AshCovers = !AshCovers
		CheckGearSelection()
		SetToggleOptionValue(AshCoversOption, AshCovers)
		ForcePageReset()
	ElseIf Option == DustPlayerOption
		DustPlayer = !DustPlayer
		SetToggleOptionValue(DustPlayerOption, DustPlayer)
	ElseIf Option == DustActorOption
		DustActor = !DustActor
		SetToggleOptionValue(DustActorOption, DustActor)
	ElseIf Option == AshGearFollowerOption
		AshGearFollower = !AshGearFollower
		SetToggleOptionValue(AshGearFollowerOption, AshGearFollower)
		ForcePageReset()
	ElseIf Option == WateryEyesPlayerOption
		WateryEyesPlayer = !WateryEyesPlayer
		SetToggleOptionValue(WateryEyesPlayerOption, WateryEyesPlayer)
	EndIf
EndEvent


;====================================================================================

Function CheckGearSelectionMenu()
	If !WetHoods && !WetCloaks && RainGearNPC > 0
		WetHoods = True
		WetCloaks = True
	EndIf
	If !ColdHoods && !ColdCloaks && !ColdGloves && (!ColdCovers || _WetQuest._WetWCAshInstalled.GetValue() as Int == 0) && ColdGearNPC > 0
		ColdHoods = True
		ColdCloaks = True
		ColdGloves = True
		If _WetQuest._WetWCAshInstalled.GetValue() as Int == 1
			ColdCovers = True
		EndIf
	EndIf
	If !SurvBP && (!SurvModItems || !_WetQuest.WaterskinList) && SurvivalGearNPC
		SurvBP = True
		If _WetQuest.WaterskinList
			SurvModItems = True
		EndIf
	EndIf
	If !AshGoggles && !AshCovers && AshGearNPC > 0
		AshGoggles = True
		AshCovers = True
	EndIf
EndFunction


Event OnOptionMenuOpen(Int Option)
	If Option == StatusOption
		SetMenuDialogOptions(StatusList)
		SetMenuDialogStartIndex(Status)
		SetMenuDialogDefaultIndex(1)
	ElseIf Option == ModeOption
		SetMenuDialogOptions(ModeList)
		SetMenuDialogStartIndex(Mode)
		SetMenuDialogDefaultIndex(0)
	ElseIf Option == RainGearNPCOption
		SetMenuDialogOptions(RainGearNPCList)
		SetMenuDialogStartIndex(RainGearNPC)
		SetMenuDialogDefaultIndex(2)
	ElseIf Option == ColdGearNPCOption
		SetMenuDialogOptions(ColdGearNPCList)
		SetMenuDialogStartIndex(ColdGearNPC)
		SetMenuDialogDefaultIndex(2)
	ElseIf Option == BreathPlayerOption
		SetMenuDialogOptions(BreathPlayerList)
		SetMenuDialogStartIndex(BreathPlayer)
		SetMenuDialogDefaultIndex(1)
	ElseIf Option == RainBlindPlayerOption
		SetMenuDialogOptions(BlindPlayerList)
		SetMenuDialogStartIndex(RainBlindPlayer)
		SetMenuDialogDefaultIndex(1)
	ElseIf Option == BlizzBlindPlayerOption
		SetMenuDialogOptions(BlindPlayerList)
		SetMenuDialogStartIndex(BlizzBlindPlayer)
		SetMenuDialogDefaultIndex(1)
	ElseIf Option == GoHomeNPCOption
		SetMenuDialogOptions(GoHomeNPCList)
		SetMenuDialogStartIndex(GoHomeNPC)
		SetMenuDialogDefaultIndex(2)
	ElseIf Option == AshGearNPCOption
		SetMenuDialogOptions(AshGearNPCList)
		SetMenuDialogStartIndex(AshGearNPC)
		SetMenuDialogDefaultIndex(1)
	EndIf
EndEvent


Event OnOptionMenuAccept(Int Option, Int Index)
	If Option == StatusOption
		Status = Index
		SetMenuOptionValue(StatusOption, StatusList[Status])
	ElseIf Option == ModeOption
		If Index != Mode && ((Index == 1 && Mode != 1) || (Mode == 1 && Index != 1))
			If Index == 1
				BreathPlayer = 0
				BlizzBlindPlayer = 0
				SnowyPlayer = False
				StrongWinds = False
				BreathActor = False
				BlizzBlindNPC = False
				SnowyActor = False
				ColdGearNPC = 0
			Else
				BreathPlayer = 1
				BlizzBlindPlayer = 1
				SnowyPlayer = True
				StrongWinds = True
				BreathActor = True
				BlizzBlindNPC = True
				SnowyActor = True
				ColdGearNPC = 2
			EndIf
		EndIf
		Mode = Index
		SetMenuOptionValue(ModeOption, ModeList[Mode])
	ElseIf Option == RainGearNPCOption
		RainGearNPC = Index
		CheckGearSelectionMenu()
		SetMenuOptionValue(RainGearNPCOption, RainGearNPCList[RainGearNPC])
	ElseIf Option == ColdGearNPCOption
		ColdGearNPC = Index
		CheckGearSelectionMenu()
		SetMenuOptionValue(ColdGearNPCOption, ColdGearNPCList[ColdGearNPC])
	ElseIf Option == BreathPlayerOption
		BreathPlayer = Index
		SetMenuOptionValue(BreathPlayerOption, BreathPlayerList[BreathPlayer])
	ElseIf Option == RainBlindPlayerOption
		RainBlindPlayer = Index
		SetMenuOptionValue(RainBlindPlayerOption, BlindPlayerList[RainBlindPlayer])
	ElseIf Option == BlizzBlindPlayerOption
		BlizzBlindPlayer = Index
		SetMenuOptionValue(BlizzBlindPlayerOption, BlindPlayerList[BlizzBlindPlayer])
	ElseIf Option == GoHomeNPCOption
		GoHomeNPC = Index
		SetMenuOptionValue(GoHomeNPCOption, GoHomeNPCList[GoHomeNPC])
	ElseIf Option == AshGearNPCOption
		AshGearNPC = Index
		CheckGearSelectionMenu()
		SetMenuOptionValue(AshGearNPCOption, AshGearNPCList[AshGearNPC])
	EndIf
	ForcePageReset()
EndEvent


;====================================================================================

Event OnOptionHighlight(Int Option)
	If Option == DripPlayerOption || Option == DripActorOption
		SetInfoText("$WCDrip")
	ElseIf Option == FootWetPlayerOption || Option == FootWetActorOption
		SetInfoText("$WCFootWet")
	ElseIf Option == BreathPlayerOption || Option == BreathActorOption
		SetInfoText("$WCBreath")
	ElseIf Option == RainBlindPlayerOption
		SetInfoText("$WCRainBlind")
	ElseIf Option == GoHomeNPCOption
		SetInfoText("$WCGoHome")
	ElseIf Option == RainGearNPCOption || Option == WetHoodsOption || Option == WetCloaksOption
		SetInfoText("$WCRainGear")
	ElseIf Option == ColdGearNPCOption || Option == ColdHoodsOption || Option == ColdCloaksOption || Option == ColdGlovesOption || Option == ColdCoversOption
		SetInfoText("$WCColdGear")
	ElseIf Option == BlizzBlindNPCOption
		SetInfoText("$WCBlizzBlind")
	ElseIf Option == StrongWindsOption
		SetInfoText("$WCWind")
	ElseIf Option == BlizzBlindPlayerOption
		SetInfoText("$WCBlizzBlindPlayer")
	ElseIf Option == RainGearFollowerOption
		SetInfoText("$WCRainGearFollower")
	ElseIf Option == ColdGearFollowerOption
		SetInfoText("$WCColdGearFollower")
	ElseIf Option == SurvivalGearNPCOption || Option == SurvBPOption || Option == SurvModItemsOption
		SetInfoText("$WCSurvival")
	ElseIf Option == ModeOption
		SetInfoText("$WCMode")
	ElseIf Option == SnowyPlayerOption || Option == SnowyActorOption
		SetInfoText("$WCSnowy")
	ElseIf Option == PurchaseColdCloakOption || Option == PurchaseColdHoodOption || Option == PurchaseColdGloveOption || Option == PurchaseColdFaceCoverOption || Option == PurchaseRainHoodOption || Option == PurchaseRainCloakOption || Option == PurchaseSurvivalBPOption
		SetInfoText("$WCPurchase")
	ElseIf Option == PurchaseAshFaceCoverOption || Option == PurchaseAshGoggleOption
		SetInfoText("$WCPurchaseAsh")
	ElseIf Option == DustPlayerOption || Option == DustActorOption
		SetInfoText("$WCDust")
	ElseIf Option == AshGearNPCOption || Option == AshGogglesOption || Option == AshCoversOption
		SetInfoText("$WCAshGearNPC")
	ElseIf Option == AshGearFollowerOption
		SetInfoText("$WCAshGearFollower")
	ElseIf Option == WateryEyesPlayerOption
		SetInfoText("$WCWateryEyes")
	EndIf
EndEvent


Event OnConfigClose()
	ApplySettings()
EndEvent
