;/ Decompiled by Champollion V1.0.0
Source   : DSerDeadlyArrowsMonitor.psc
Modified : 2015-10-19 12:28:12
Compiled : 2015-10-19 12:28:15
User     : Evan
Computer : EVAN-PC
/;
scriptName DSerDeadlyArrowsMonitor extends ReferenceAlias

;-- Properties --------------------------------------
spell property EnchantedArrow_RechargeSpell auto
Float property vert_combat_bow_sneak = 25.0000 auto hidden
spell property EnchantedArrow_AmmoEquipped auto
Float property zoom_combat_bow_sneak = -5.00000 auto hidden
globalvariable property MCM_ScalingWeight auto
Float property crosshair_hori_bow_sneak auto hidden
globalvariable property MCM_ArmFatigue auto
Float property hori_combat_bow = 27.5000 auto hidden
message property PoisonCountMessage auto
Float property crosshair_vert_idle auto hidden
Float property zoom_combat_bow = -5.00000 auto hidden
Float property crosshair_vert_bow_sneak auto hidden
spell property EnchantArrow_Fire auto
globalvariable property Version_Global auto
globalvariable property MCM_PersistentArrows auto
Float property hori_combat_bow_sneak = 27.5000 auto hidden
leveleditem property LItemSpellTomes25AllDestruction auto
Float property vert_combat_bow = 5.00000 auto hidden
spell property EnchantedQuiverFX auto
spell property EnchantArrow_Shock auto
Float property crosshair_hori_idle auto hidden
spell property BleedAbility auto
spell property EnchantArrow_Magic auto
book property EnchantArrow_Shock_Tome auto
globalvariable property MCM_ThrowArrows auto
book property EnchantArrow_Magic_Tome auto
perk property MarksmanPoison25 auto
globalvariable property MCM_EnchantArrows auto
armor property RingOfAetherius auto
perk property SteadyHandPerk auto
spell property StaminaRateAbility auto
armor property RingOfTheWamasu auto
perk property SteadyHandPerk2 auto
keyword property EnchantedArrowRing auto
Int property numArrowsInYou auto hidden
globalvariable property MCM_BowCrosshair auto
globalvariable property PoisonCount auto
armor property RingOfTheDragon auto
globalvariable property MCM_BowCamera_SmoothTransition auto
spell property EnchantedArrowFX auto
armor property RingOfTheWispmother auto
spell property NPCMonitorCloak auto
book property EnchantArrow_Fire_Tome auto
spell property RemovalSpell auto
actor property PlayerRef auto
globalvariable property MCM_BowCamera auto
globalvariable property MCM_RemovalHotkeyOn auto
perk property CustomEagleEyePerk auto
perk property MarksmanPoison100 auto
spell property EnchantArrow_Ice auto
Float property crosshair_vert_bow auto hidden
perk property MarksmanPoison50 auto
imagespacemodifier property StaticFX auto
book property EnchantArrow_Ice_Tome auto
perk property MarksmanPoison75 auto
Float property crosshair_hori_bow auto hidden
quest property DeadlyArrowsQuest auto
perk property EagleEyePerk auto
globalvariable property MCM_ZoomFX auto
imagespacemodifier property StaticFXMild auto
perk property CustomSteadyHandPerk auto

;-- Variables ---------------------------------------
Bool armstrainmessageshown = false
Bool PoisonMessage50Shown = false
Bool PoisonMessage100Shown = false
Bool BowTransitionWasMade = false
Bool MaintenanceIsRunning = false
Bool SpellTomesAddedToLL = false
Float ShakeDuration = 0.200000
Float zoom_combat
Bool PoisonMessage25Shown = false
Int CurrentTransitionType = 0
Float vert_combat
String LastAction
Bool Zoomed = false
Bool PoisonMessage75Shown = false
Bool DrawWeaponPressed = false
Bool NewAmmoEquipped
Float hori_combat
Float zoom_idle
Bool StopTransition = false
Float hori_idle
Bool ImodEnabled = false
Float DrawTime = 0.000000
Float ShakeStrength_Max = 1.00000
Float ShakeStrength
Float Version = 1.00000
form[] ArrowArray
Bool SheatheWeaponPressed = false
Float vert_idle
Bool locked = false

;-- Functions ---------------------------------------

; Skipped compiler generated GetState

function OnInit()

	crosshair_hori_idle = ui.GetNumber("HUD Menu", "_root.HUDMovieBaseInstance.CrosshairAlert._x")
	crosshair_vert_idle = ui.GetNumber("HUD Menu", "_root.HUDMovieBaseInstance.CrosshairAlert._y")
	crosshair_hori_bow = crosshair_hori_idle - 2.00000
	crosshair_vert_bow = crosshair_vert_idle - 3.00000
	crosshair_hori_bow_sneak = crosshair_hori_idle - 2.00000
	crosshair_vert_bow_sneak = crosshair_vert_idle + 3.00000
	self.RegisterForAnimationEvent(PlayerRef as objectreference, "BowZoomStart")
	self.RegisterForAnimationEvent(PlayerRef as objectreference, "BowZoomStop")
	self.RegisterForAnimationEvent(PlayerRef as objectreference, "BowDrawn")
	self.RegisterForAnimationEvent(PlayerRef as objectreference, "BowReset")
	self.RegisterForAnimationEvent(PlayerRef as objectreference, "BowRelease")
	self.RegisterForAnimationEvent(PlayerRef as objectreference, "SoundPlay.NPCHumanCombatShieldBash")
	self.RegisterForAnimationEvent(PlayerRef as objectreference, "arrowAttach")
	self.RegisterForControl("Sneak")
	self.RegisterForControl("Toggle POV")
	self.RegisterforActorAction(7)
	self.RegisterforActorAction(9)
	game.SetGameSettingFloat("fArrowMinBowVelocity", 0.800000)
	game.SetGameSettingFloat("fArrowMinPower", 0.800000)
	game.SetGameSettingFloat("fArrowMinVelocity", 0.800000)
	game.SetGameSettingFloat("fBowNPCSpreadAngle", 5.00000)
	if MCM_PersistentArrows.GetValueInt() == 1
		game.SetGameSettingFloat("fAttachedArrowAgeMax", 500.000)
		game.SetGameSettingInt("iMaxAttachedArrows", 999)
	else
		game.SetGameSettingFloat("fAttachedArrowAgeMax", 10.0000)
		game.SetGameSettingInt("iMaxAttachedArrows", 3)
	endIf
	utility.SetINIFloat("f1PArrowTiltUpAngle:Combat", 0.800000)
	utility.SetINIFloat("f3PArrowTiltUpAngle:Combat", 0.800000)
	if PlayerRef.HasSpell(RemovalSpell as form) == false && MCM_RemovalHotkeyOn.GetValueInt() == 0
		PlayerRef.AddSpell(RemovalSpell, false)
	endIf
	if PlayerRef.HasSpell(NPCMonitorCloak as form) == false
		PlayerRef.AddSpell(NPCMonitorCloak, false)
	endIf
	if PlayerRef.HasPerk(CustomEagleEyePerk) == true
		PlayerRef.RemovePerk(CustomEagleEyePerk)
	endIf
	if PlayerRef.HasPerk(CustomSteadyHandPerk) == true
		PlayerRef.RemovePerk(CustomSteadyHandPerk)
	endIf
	if PlayerRef.HasSpell(EnchantedArrowFX as form) == false
		PlayerRef.AddSpell(EnchantedArrowFX, false)
	endIf
	if PlayerRef.HasSpell(EnchantedQuiverFX as form) == false
		PlayerRef.AddSpell(EnchantedQuiverFX, false)
	endIf
	hori_idle = utility.GetINIFloat("fOverShoulderPosX:Camera")
	zoom_idle = 0 as Float
	vert_idle = utility.GetINIFloat("fOverShoulderPosZ:Camera")
	hori_combat = utility.GetINIFloat("fOverShoulderCombatPosX:Camera")
	zoom_combat = utility.GetINIFloat("fOverShoulderCombatAddY:Camera")
	vert_combat = utility.GetINIFloat("fOverShoulderCombatPosZ:Camera")
	EnchantArrow_Fire.SetNthEffectMagnitude(0, ((MCM_ScalingWeight.GetValue() * (PlayerRef.GetAV("Enchanting") as Int) as Float) as Int) as Float)
	EnchantArrow_Ice.SetNthEffectMagnitude(0, ((MCM_ScalingWeight.GetValue() * (PlayerRef.GetAV("Enchanting") as Int) as Float) as Int) as Float)
	EnchantArrow_Magic.SetNthEffectMagnitude(0, ((MCM_ScalingWeight.GetValue() * (PlayerRef.GetAV("Enchanting") as Int) as Float) as Int) as Float)
	EnchantArrow_Shock.SetNthEffectMagnitude(0, ((MCM_ScalingWeight.GetValue() * (PlayerRef.GetAV("Enchanting") as Int) as Float) as Int) as Float)
	if SpellTomesAddedToLL == false && MCM_EnchantArrows.GetValueInt() == 1
		LItemSpellTomes25AllDestruction.AddForm(EnchantArrow_Fire_Tome as form, 1, 1)
		LItemSpellTomes25AllDestruction.AddForm(EnchantArrow_Ice_Tome as form, 1, 1)
		LItemSpellTomes25AllDestruction.AddForm(EnchantArrow_Magic_Tome as form, 1, 1)
		LItemSpellTomes25AllDestruction.AddForm(EnchantArrow_Shock_Tome as form, 1, 1)
		SpellTomesAddedToLL == true
	endIf
	ArrowArray = new form[100]
	numArrowsInYou = 0
	debug.trace("[DSerAGO] OnInit", 0)
	utility.Wait(20 as Float)
	debug.Notification("Archery Gameplay Overhaul has been installed.\nPlease re-equip any bows and arrows.\nSee the MCM for settings and info.")
endFunction

function OnHit(objectreference akAggressor, form akSource, Projectile akProjectile, Bool abPowerAttack, Bool abSneakAttack, Bool abBashAttack, Bool abHitBlocked)

	if (akSource as weapon) as Bool && (akAggressor as actor) as Bool
		if (akAggressor as actor).GetEquippedWeapon(false)
			if (akSource as weapon).GetWeaponType() == 7 && abBashAttack == false && abHitBlocked == false
				if akAggressor as actor
					Bool p = false
					Int counter = akAggressor.GetNumItems()
					while counter > 0
						counter -= 1
						if (akAggressor as actor).IsEquipped(akAggressor.GetNthForm(counter)) && akAggressor.GetNthForm(counter).GetType() == 42
							ArrowArray[numArrowsInYou] = akAggressor.GetNthForm(counter)
							numArrowsInYou += 1
							if numArrowsInYou >= 100
								numArrowsInYou = 99
							endIf
							counter = 0
						endIf
					endWhile
				endIf
				BleedAbility.Cast(akAggressor, PlayerRef as objectreference)
			elseIf (akAggressor as actor).GetEquippedWeapon(false).GetWeaponType() == 7 && abBashAttack == true
				(akSource as weapon).Fire(akAggressor, none)
			endIf
		endIf
	endIf
endFunction

function OnAnimationEvent(objectreference akSource, String asEventName)

	if akSource == PlayerRef as objectreference && PlayerRef.GetEquippedWeapon(false) != none
		if PlayerRef.GetEquippedWeapon(false).GetWeaponType() == 7
			actor akSourceActor = akSource as actor
			if akSourceActor.GetAV("Marksman") < 100 as Float
				ShakeStrength = (1 as Float - 0.00500000 * akSourceActor.GetAV("Marksman")) * ShakeStrength_Max
			else
				ShakeStrength = 0 as Float
			endIf
			if MCM_ThrowArrows.GetValue()
				weapon SourceWeapon = akSourceActor.GetEquippedWeapon(false)
				if SourceWeapon != none
					if asEventName == "SoundPlay.NPCHumanCombatShieldBash" && SourceWeapon.GetWeaponType() == 7
						game.SetGameSettingFloat("fArrowMinVelocity", 0.500000)
						utility.Wait(0.0200000)
						SourceWeapon.Fire(akSourceActor as objectreference, none)
						utility.Wait(0.100000)
						game.SetGameSettingFloat("fArrowMinVelocity", 0.800000)
						return 
					endIf
				endIf
			endIf
			if asEventName == "BowZoomStart"
				if MCM_ZoomFX.GetValue()
					self.EnableImod(StaticFXMild)
				endIf
			elseIf asEventName == "BowZoomStop"
				if MCM_ZoomFX.GetValue()
					self.DisableImod(StaticFXMild)
				endIf
			elseIf asEventName == "BowDrawn"
				DrawTime = 0 as Float
				ImodEnabled = true
				self.EnableShake(ShakeStrength, ShakeDuration)
			elseIf asEventName == "BowReset" || asEventName == "BowRelease"
				DrawTime = 0 as Float
				ImodEnabled = false
				armstrainmessageshown = false
				if akSourceActor.HasSpell(StaminaRateAbility as form)
					akSourceActor.RemoveSpell(StaminaRateAbility)
				endIf
				if asEventName == "BowRelease"
					if akSourceActor.HasEffectKeyword(EnchantedArrowRing) == 1 as Bool
						EnchantedArrow_RechargeSpell.Cast(akSourceActor as objectreference, akSourceActor as objectreference)
					endIf
				elseIf asEventName == "BowReset"
					self.ResetArrowFX(akSourceActor)
				endIf
			endIf
		endIf
	endIf
endFunction

function SmoothTransition(Int TransitionType, Float hori_start, Float zoom_start, Float vert_start, Float hori_finish, Float zoom_finish, Float vert_finish, Float crosshair_hori_start, Float crosshair_vert_start, Float crosshair_hori_finish, Float crosshair_vert_finish)

	CurrentTransitionType = TransitionType
	Int numTransitionPoints = 20
	if MCM_BowCamera_SmoothTransition.GetValue() == 0.000000
		numTransitionPoints = 1
	endIf
	Bool CrosshairEnabled_ST = MCM_BowCrosshair.GetValueInt() as Bool
	Float hori_difference = (hori_finish - hori_start) / numTransitionPoints as Float
	Float zoom_difference = (zoom_finish - zoom_start) / numTransitionPoints as Float
	Float vert_difference = (vert_finish - vert_start) / numTransitionPoints as Float
	Float crosshair_hori_difference = (crosshair_hori_finish - crosshair_hori_start) / numTransitionPoints as Float
	Float crosshair_vert_difference = (crosshair_vert_finish - crosshair_vert_start) / numTransitionPoints as Float
	Int i = 0
	while i <= numTransitionPoints && !StopTransition
		utility.SetINIFloat("fOverShoulderCombatPosX:Camera", hori_start + i as Float * hori_difference)
		utility.SetINIFloat("fOverShoulderCombatAddY:Camera", zoom_start + i as Float * zoom_difference)
		utility.SetINIFloat("fOverShoulderCombatPosZ:Camera", vert_start + i as Float * vert_difference)
		utility.SetINIFloat("fOverShoulderPosX:Camera", hori_start + i as Float * hori_difference)
		utility.SetINIFloat("fOverShoulderPosZ:Camera", vert_start + i as Float * vert_difference)
		game.UpdateThirdPerson()
		if CrosshairEnabled_ST && game.GetCameraState() != 0
			ui.SetNumber("HUD Menu", "_root.HUDMovieBaseInstance.CrosshairAlert._x", crosshair_hori_start + i as Float * crosshair_hori_difference)
			ui.SetNumber("HUD Menu", "_root.HUDMovieBaseInstance.CrosshairAlert._y", crosshair_vert_start + i as Float * crosshair_vert_difference)
			ui.SetNumber("HUD Menu", "_root.HUDMovieBaseInstance.StealthMeterInstance._x", crosshair_hori_start + i as Float * crosshair_hori_difference)
			ui.SetNumber("HUD Menu", "_root.HUDMovieBaseInstance.StealthMeterInstance._y", crosshair_vert_start + i as Float * crosshair_vert_difference)
		endIf
		i += 1
	endWhile
	utility.SetINIFloat("fOverShoulderCombatPosX:Camera", hori_combat)
	utility.SetINIFloat("fOverShoulderCombatAddY:Camera", zoom_combat)
	utility.SetINIFloat("fOverShoulderCombatPosZ:Camera", vert_combat)
	utility.SetINIFloat("fOverShoulderPosX:Camera", hori_idle)
	utility.SetINIFloat("fOverShoulderPosZ:Camera", vert_idle)
	CurrentTransitionType = 0
endFunction

function Maintenance()

	MaintenanceIsRunning = true
	if PlayerRef.HasSpell(RemovalSpell as form) == false && MCM_RemovalHotkeyOn.GetValueInt() == 0
		PlayerRef.AddSpell(RemovalSpell, false)
	endIf
	if PlayerRef.HasSpell(NPCMonitorCloak as form) == false
		PlayerRef.AddSpell(NPCMonitorCloak, false)
	endIf
	self.UnregisterForAnimationEvent(PlayerRef as objectreference, "BowZoomStart")
	self.UnregisterForAnimationEvent(PlayerRef as objectreference, "BowZoomStop")
	self.UnregisterForAnimationEvent(PlayerRef as objectreference, "BowDrawn")
	self.UnregisterForAnimationEvent(PlayerRef as objectreference, "BowReset")
	self.UnregisterForAnimationEvent(PlayerRef as objectreference, "BowRelease")
	self.UnregisterForAnimationEvent(PlayerRef as objectreference, "SoundPlay.NPCHumanCombatShieldBash")
	self.UnregisterForAnimationEvent(PlayerRef as objectreference, "arrowAttach")
	self.UnregisterForControl("Sneak")
	self.RegisterForControl("Toggle POV")
	self.UnregisterforActorAction(7)
	self.UnregisterforActorAction(9)
	utility.WaitMenuMode(0.250000)
	self.RegisterforActorAction(7)
	self.RegisterforActorAction(9)
	self.RegisterForAnimationEvent(PlayerRef as objectreference, "BowZoomStart")
	self.RegisterForAnimationEvent(PlayerRef as objectreference, "BowZoomStop")
	self.RegisterForAnimationEvent(PlayerRef as objectreference, "BowDrawn")
	self.RegisterForAnimationEvent(PlayerRef as objectreference, "BowReset")
	self.RegisterForAnimationEvent(PlayerRef as objectreference, "BowRelease")
	self.RegisterForAnimationEvent(PlayerRef as objectreference, "SoundPlay.NPCHumanCombatShieldBash")
	self.RegisterForAnimationEvent(PlayerRef as objectreference, "arrowAttach")
	self.RegisterForControl("Sneak")
	game.SetGameSettingFloat("fArrowMinBowVelocity", 0.800000)
	game.SetGameSettingFloat("fArrowMinPower", 0.800000)
	game.SetGameSettingFloat("fArrowMinVelocity", 0.800000)
	game.SetGameSettingFloat("fBowNPCSpreadAngle", 5.00000)
	if MCM_PersistentArrows.GetValueInt() == 1
		game.SetGameSettingFloat("fAttachedArrowAgeMax", 500.000)
		game.SetGameSettingInt("iMaxAttachedArrows", 999)
	else
		game.SetGameSettingFloat("fAttachedArrowAgeMax", 10.0000)
		game.SetGameSettingInt("iMaxAttachedArrows", 3)
	endIf
	PlayerRef.SetAnimationVariableFloat("2HMweaponSpeedMult", 1.20000)
	utility.SetINIFloat("f1PArrowTiltUpAngle:Combat", 0.800000)
	utility.SetINIFloat("f3PArrowTiltUpAngle:Combat", 0.800000)
	if PlayerRef.HasSpell(RemovalSpell as form) == false && MCM_RemovalHotkeyOn.GetValueInt() == 0
		PlayerRef.AddSpell(RemovalSpell, false)
	endIf
	if PlayerRef.HasSpell(NPCMonitorCloak as form) == false
		PlayerRef.AddSpell(NPCMonitorCloak, false)
	endIf
	if PlayerRef.HasPerk(CustomEagleEyePerk) == true
		PlayerRef.RemovePerk(CustomEagleEyePerk)
	endIf
	if PlayerRef.HasPerk(CustomSteadyHandPerk) == true
		PlayerRef.RemovePerk(CustomSteadyHandPerk)
	endIf
	if PlayerRef.HasSpell(EnchantedArrowFX as form) == false
		PlayerRef.AddSpell(EnchantedArrowFX, false)
	endIf
	if PlayerRef.HasSpell(EnchantedQuiverFX as form) == false
		PlayerRef.AddSpell(EnchantedQuiverFX, false)
	endIf
	EnchantArrow_Fire.SetNthEffectMagnitude(0, ((MCM_ScalingWeight.GetValue() * (PlayerRef.GetAV("Enchanting") as Int) as Float) as Int) as Float)
	EnchantArrow_Ice.SetNthEffectMagnitude(0, ((MCM_ScalingWeight.GetValue() * (PlayerRef.GetAV("Enchanting") as Int) as Float) as Int) as Float)
	EnchantArrow_Magic.SetNthEffectMagnitude(0, ((MCM_ScalingWeight.GetValue() * (PlayerRef.GetAV("Enchanting") as Int) as Float) as Int) as Float)
	EnchantArrow_Shock.SetNthEffectMagnitude(0, ((MCM_ScalingWeight.GetValue() * (PlayerRef.GetAV("Enchanting") as Int) as Float) as Int) as Float)
	Int NumForms = LItemSpellTomes25AllDestruction.GetNumForms()
	while NumForms >= 0
		NumForms -= 1
		form NthForm = LItemSpellTomes25AllDestruction.GetNthForm(NumForms)
		if NthForm == EnchantArrow_Fire_Tome as form || NthForm == EnchantArrow_Ice_Tome as form || NthForm == EnchantArrow_Magic_Tome as form || NthForm == EnchantArrow_Shock_Tome as form
			NumForms = -5
			SpellTomesAddedToLL = true
		endIf
		if NumForms == -1
			SpellTomesAddedToLL = false
		endIf
	endWhile
	if SpellTomesAddedToLL == false && MCM_EnchantArrows.GetValueInt() == 1
		LItemSpellTomes25AllDestruction.AddForm(EnchantArrow_Fire_Tome as form, 1, 1)
		LItemSpellTomes25AllDestruction.AddForm(EnchantArrow_Ice_Tome as form, 1, 1)
		LItemSpellTomes25AllDestruction.AddForm(EnchantArrow_Magic_Tome as form, 1, 1)
		LItemSpellTomes25AllDestruction.AddForm(EnchantArrow_Shock_Tome as form, 1, 1)
		SpellTomesAddedToLL == true
	endIf
	locked = false
	CurrentTransitionType = 0
	debug.trace("[DSerAGO] Maintenance has been run", 0)
	MaintenanceIsRunning = false
endFunction

; Skipped compiler generated GotoState

function EmptyTheArrowArray()

	Int i = 0
	while i < 100
		ArrowArray[i] = none
		i += 1
	endWhile
endFunction

form function GetNthArrowInArrowArray(Int index)

	return ArrowArray[index]
endFunction

function OnAnimationEventUnregistered(objectreference akSource, String asEventName)

	if !MaintenanceIsRunning
		self.RegisterForAnimationEvent(PlayerRef as objectreference, asEventName)
	endIf
endFunction

function EnableImod(imagespacemodifier IMod)

	if IMod != none
		IMod.apply(1.00000)
	endIf
endFunction

function OnPlayerLoadGame()

	if Version != Version_Global.GetValue()
		self.OnInit()
		Version = Version_Global.GetValue()
		debug.trace("[DSerAGO] Updated to version " + Version as String, 0)
	endIf
	self.Maintenance()
endFunction

function OnUpdate()

	if ImodEnabled == true
		self.EnableShake(ShakeStrength, ShakeDuration)
	endIf
endFunction

function EnableShake(Float Strength, Float Duration)

	if Strength > 0 as Float && MCM_ArmFatigue.GetValueInt() == 1
		Float NewStrength = 0.100000
		if DrawTime >= 5 as Float + 0.250000 * PlayerRef.GetAV("Marksman")
			Float ExtraStrength = 0.100000 * (DrawTime - 5 as Float + 0.250000 * PlayerRef.GetAV("Marksman"))
			NewStrength = 0.100000 + ExtraStrength
			if !armstrainmessageshown
				debug.notification("Your arms begin to strain")
				if PlayerRef.HasSpell(StaminaRateAbility as form) == false
					PlayerRef.AddSpell(StaminaRateAbility, false)
				endIf
				armstrainmessageshown = true
			endIf
			if NewStrength > Strength
				NewStrength = Strength
				Duration += 0.200000
				if PlayerRef.HasSpell(StaminaRateAbility as form) == false
					PlayerRef.AddSpell(StaminaRateAbility, false)
				endIf
			endIf
		endIf
		game.ShakeCamera(none, NewStrength, Duration)
		if game.UsingGamepad()
			game.ShakeController(NewStrength, NewStrength, Duration)
		endIf
		DrawTime += Duration
		self.RegisterForSingleUpdate(ShakeDuration)
	endIf
endFunction

function OnObjectEquipped(form akBaseObject, objectreference akReference)

	if akBaseObject as weapon
		if (akBaseObject as weapon).GetWeaponType() == 7
			if PlayerRef.GetActorBase().GetSex() == 1
				netimmerse.SetNodeScale(PlayerRef as objectreference, "SHIELD", 1.15000, false)
			endIf
			if !PoisonMessage25Shown && PlayerRef.GetBaseAV("Marksman") >= 25 as Float && PlayerRef.GetBaseAV("Marksman") < 50 as Float
				PoisonCount.SetValueInt(2)
				DeadlyArrowsQuest.UpdateCurrentInstanceGlobal(PoisonCount)
				if PlayerRef.HasPerk(MarksmanPoison50)
					PlayerRef.RemovePerk(MarksmanPoison50)
				elseIf PlayerRef.HasPerk(MarksmanPoison75)
					PlayerRef.RemovePerk(MarksmanPoison75)
				elseIf PlayerRef.HasPerk(MarksmanPoison100)
					PlayerRef.RemovePerk(MarksmanPoison100)
				endIf
				PlayerRef.AddPerk(MarksmanPoison25)
				PoisonCountMessage.Show(0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000)
				PoisonMessage25Shown = true
				PoisonMessage50Shown = false
				PoisonMessage75Shown = false
				PoisonMessage100Shown = false
			elseIf !PoisonMessage50Shown && PlayerRef.GetBaseAV("Marksman") >= 50 as Float && PlayerRef.GetBaseAV("Marksman") < 75 as Float
				PoisonCount.SetValueInt(3)
				DeadlyArrowsQuest.UpdateCurrentInstanceGlobal(PoisonCount)
				if PlayerRef.HasPerk(MarksmanPoison25)
					PlayerRef.RemovePerk(MarksmanPoison25)
				elseIf PlayerRef.HasPerk(MarksmanPoison75)
					PlayerRef.RemovePerk(MarksmanPoison75)
				elseIf PlayerRef.HasPerk(MarksmanPoison100)
					PlayerRef.RemovePerk(MarksmanPoison100)
				endIf
				PlayerRef.AddPerk(MarksmanPoison50)
				PoisonCountMessage.Show(0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000)
				PoisonMessage25Shown = false
				PoisonMessage50Shown = true
				PoisonMessage75Shown = false
				PoisonMessage100Shown = false
			elseIf !PoisonMessage75Shown && PlayerRef.GetBaseAV("Marksman") >= 75 as Float && PlayerRef.GetBaseAV("Marksman") < 100 as Float
				PoisonCount.SetValueInt(4)
				DeadlyArrowsQuest.UpdateCurrentInstanceGlobal(PoisonCount)
				if PlayerRef.HasPerk(MarksmanPoison25)
					PlayerRef.RemovePerk(MarksmanPoison25)
				elseIf PlayerRef.HasPerk(MarksmanPoison50)
					PlayerRef.RemovePerk(MarksmanPoison50)
				elseIf PlayerRef.HasPerk(MarksmanPoison100)
					PlayerRef.RemovePerk(MarksmanPoison100)
				endIf
				PlayerRef.AddPerk(MarksmanPoison75)
				PoisonCountMessage.Show(0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000)
				PoisonMessage25Shown = false
				PoisonMessage50Shown = false
				PoisonMessage75Shown = true
				PoisonMessage100Shown = false
			elseIf !PoisonMessage100Shown && PlayerRef.GetBaseAV("Marksman") >= 100 as Float
				PoisonCount.SetValueInt(5)
				DeadlyArrowsQuest.UpdateCurrentInstanceGlobal(PoisonCount)
				if PlayerRef.HasPerk(MarksmanPoison25)
					PlayerRef.RemovePerk(MarksmanPoison25)
				elseIf PlayerRef.HasPerk(MarksmanPoison50)
					PlayerRef.RemovePerk(MarksmanPoison50)
				elseIf PlayerRef.HasPerk(MarksmanPoison75)
					PlayerRef.RemovePerk(MarksmanPoison75)
				endIf
				PlayerRef.AddPerk(MarksmanPoison100)
				PoisonCountMessage.Show(0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000)
				PoisonMessage25Shown = false
				PoisonMessage50Shown = false
				PoisonMessage75Shown = false
				PoisonMessage100Shown = true
			endIf
		endIf
	elseIf akBaseObject as ammo
		NewAmmoEquipped = true
		PlayerRef.AddSpell(EnchantedArrow_AmmoEquipped, false)
		utility.WaitMenuMode(1 as Float)
		NewAmmoEquipped = false
	elseIf akBaseObject as spell
		if akBaseObject as spell == EnchantArrow_Fire || akBaseObject as spell == EnchantArrow_Ice || akBaseObject as spell == EnchantArrow_Magic || akBaseObject as spell == EnchantArrow_Shock
			EnchantArrow_Fire.SetNthEffectMagnitude(0, ((MCM_ScalingWeight.GetValue() * (PlayerRef.GetAV("Enchanting") as Int) as Float) as Int) as Float)
			EnchantArrow_Ice.SetNthEffectMagnitude(0, ((MCM_ScalingWeight.GetValue() * (PlayerRef.GetAV("Enchanting") as Int) as Float) as Int) as Float)
			EnchantArrow_Magic.SetNthEffectMagnitude(0, ((MCM_ScalingWeight.GetValue() * (PlayerRef.GetAV("Enchanting") as Int) as Float) as Int) as Float)
			EnchantArrow_Shock.SetNthEffectMagnitude(0, ((MCM_ScalingWeight.GetValue() * (PlayerRef.GetAV("Enchanting") as Int) as Float) as Int) as Float)
		endIf
	endIf
endFunction

function OnControlDown(String control)

	if PlayerRef.GetEquippedWeapon(false)
		if PlayerRef.GetEquippedWeapon(false).GetWeaponType() == 7 && game.IsMovementControlsEnabled() && !utility.IsInMenuMode()
			if control == "Sneak"
				self.OnActorAction(11, PlayerRef, none, 0)
			endIf
			if control == "Toggle POV" && game.IsCamSwitchControlsEnabled() && !utility.IsInMenuMode()
				self.OnActorAction(12, PlayerRef, none, 0)
			endIf
		endIf
	endIf
endFunction

function DisableImod(imagespacemodifier IMod)

	if IMod != none
		IMod.remove()
	endIf
endFunction

function OnActorAction(Int actionType, actor akActor, form source, Int slot)

	if MCM_BowCamera.GetValueInt() == 1 && akActor == PlayerRef && !PlayerRef.IsOnMount()
		Int lock_count = 0
		while locked
			utility.Wait(0.330000)
			lock_count += 1
			if lock_count >= 30
				locked = false
				return 
			endIf
		endWhile
		locked = true
		if CurrentTransitionType == 0 && (LastAction == "Sheathe Other Begin" || LastAction == "Sheathe Bow Begin") && !BowTransitionWasMade
			hori_idle = utility.GetINIFloat("fOverShoulderPosX:Camera")
			zoom_idle = 0 as Float
			vert_idle = utility.GetINIFloat("fOverShoulderPosZ:Camera")
			hori_combat = utility.GetINIFloat("fOverShoulderCombatPosX:Camera")
			zoom_combat = utility.GetINIFloat("fOverShoulderCombatAddY:Camera")
			vert_combat = utility.GetINIFloat("fOverShoulderCombatPosZ:Camera")
		endIf
		Bool CrosshairEnabled = MCM_BowCrosshair.GetValueInt() as Bool
		if PlayerRef.GetEquippedWeapon(false)
			StopTransition = false
			if PlayerRef.GetEquippedWeapon(false).GetWeaponType() == 7
				if actionType == 7
					self.RegisterforActorAction(9)
					if LastAction == "Draw Other Begin"
						if CurrentTransitionType == 0
							if PlayerRef.IsSneaking()
								utility.SetINIFloat("fOverShoulderCombatPosX:Camera", hori_combat_bow_sneak)
								utility.SetINIFloat("fOverShoulderCombatAddY:Camera", zoom_combat_bow_sneak)
								utility.SetINIFloat("fOverShoulderCombatPosZ:Camera", vert_combat_bow_sneak)
								if CrosshairEnabled && game.GetCameraState() != 0
									ui.SetNumber("HUD Menu", "_root.HUDMovieBaseInstance.CrosshairAlert._x", crosshair_hori_bow_sneak)
									ui.SetNumber("HUD Menu", "_root.HUDMovieBaseInstance.CrosshairAlert._y", crosshair_vert_bow_sneak)
									ui.SetNumber("HUD Menu", "_root.HUDMovieBaseInstance.StealthMeterInstance._x", crosshair_hori_bow_sneak)
									ui.SetNumber("HUD Menu", "_root.HUDMovieBaseInstance.StealthMeterInstance._y", crosshair_vert_bow_sneak)
								endIf
							else
								utility.SetINIFloat("fOverShoulderCombatPosX:Camera", hori_combat_bow)
								utility.SetINIFloat("fOverShoulderCombatAddY:Camera", zoom_combat_bow)
								utility.SetINIFloat("fOverShoulderCombatPosZ:Camera", vert_combat_bow)
								if CrosshairEnabled && game.GetCameraState() != 0
									ui.SetNumber("HUD Menu", "_root.HUDMovieBaseInstance.CrosshairAlert._x", crosshair_hori_bow)
									ui.SetNumber("HUD Menu", "_root.HUDMovieBaseInstance.CrosshairAlert._y", crosshair_vert_bow)
									ui.SetNumber("HUD Menu", "_root.HUDMovieBaseInstance.StealthMeterInstance._x", crosshair_hori_bow)
									ui.SetNumber("HUD Menu", "_root.HUDMovieBaseInstance.StealthMeterInstance._y", crosshair_vert_bow)
								endIf
							endIf
						elseIf CurrentTransitionType != 1
							StopTransition = true
							utility.Wait(0.200000)
							if PlayerRef.IsSneaking()
								utility.SetINIFloat("fOverShoulderCombatPosX:Camera", hori_combat_bow_sneak)
								utility.SetINIFloat("fOverShoulderCombatAddY:Camera", zoom_combat_bow_sneak)
								utility.SetINIFloat("fOverShoulderCombatPosZ:Camera", vert_combat_bow_sneak)
								if CrosshairEnabled && game.GetCameraState() != 0
									ui.SetNumber("HUD Menu", "_root.HUDMovieBaseInstance.CrosshairAlert._x", crosshair_hori_bow_sneak)
									ui.SetNumber("HUD Menu", "_root.HUDMovieBaseInstance.CrosshairAlert._y", crosshair_vert_bow_sneak)
									ui.SetNumber("HUD Menu", "_root.HUDMovieBaseInstance.StealthMeterInstance._x", crosshair_hori_bow_sneak)
									ui.SetNumber("HUD Menu", "_root.HUDMovieBaseInstance.StealthMeterInstance._y", crosshair_vert_bow_sneak)
								endIf
							else
								utility.SetINIFloat("fOverShoulderCombatPosX:Camera", hori_combat_bow)
								utility.SetINIFloat("fOverShoulderCombatAddY:Camera", zoom_combat_bow)
								utility.SetINIFloat("fOverShoulderCombatPosZ:Camera", vert_combat_bow)
								if CrosshairEnabled && game.GetCameraState() != 0
									ui.SetNumber("HUD Menu", "_root.HUDMovieBaseInstance.CrosshairAlert._x", crosshair_hori_bow)
									ui.SetNumber("HUD Menu", "_root.HUDMovieBaseInstance.CrosshairAlert._y", crosshair_vert_bow)
									ui.SetNumber("HUD Menu", "_root.HUDMovieBaseInstance.StealthMeterInstance._x", crosshair_hori_bow)
									ui.SetNumber("HUD Menu", "_root.HUDMovieBaseInstance.StealthMeterInstance._y", crosshair_vert_bow)
								endIf
							endIf
						endIf
						game.UpdateThirdPerson()
					elseIf CurrentTransitionType == 0
						if PlayerRef.IsSneaking()
							self.SmoothTransition(3, hori_idle, zoom_idle, vert_idle, hori_combat_bow_sneak, zoom_combat_bow_sneak, vert_combat_bow_sneak, crosshair_hori_idle, crosshair_vert_idle, crosshair_hori_bow_sneak, crosshair_vert_bow_sneak)
						else
							self.SmoothTransition(3, hori_idle, zoom_idle, vert_idle, hori_combat_bow, zoom_combat_bow, vert_combat_bow, crosshair_hori_idle, crosshair_vert_idle, crosshair_hori_bow, crosshair_vert_bow)
						endIf
					elseIf CurrentTransitionType != 3
						StopTransition = true
						utility.Wait(0.200000)
						if PlayerRef.IsSneaking()
							self.SmoothTransition(3, hori_idle, zoom_idle, vert_idle, hori_combat_bow_sneak, zoom_combat_bow_sneak, vert_combat_bow_sneak, crosshair_hori_idle, crosshair_vert_idle, crosshair_hori_bow_sneak, crosshair_vert_bow_sneak)
						else
							self.SmoothTransition(3, hori_idle, zoom_idle, vert_idle, hori_combat_bow, zoom_combat_bow, vert_combat_bow, crosshair_hori_idle, crosshair_vert_idle, crosshair_hori_bow, crosshair_vert_bow)
						endIf
					endIf
					LastAction = "Draw Bow Begin"
					BowTransitionWasMade = true
				elseIf actionType == 9
					self.RegisterforActorAction(7)
					self.UnregisterforActorAction(9)
					if LastAction != "Draw Other Begin"
						if CurrentTransitionType == 0
							if PlayerRef.IsSneaking()
								self.SmoothTransition(4, hori_combat_bow_sneak, zoom_combat_bow_sneak, vert_combat_bow_sneak, hori_idle, zoom_idle, vert_idle, crosshair_hori_bow_sneak, crosshair_vert_bow_sneak, crosshair_hori_idle, crosshair_vert_idle)
							else
								self.SmoothTransition(4, hori_combat_bow, zoom_combat_bow, vert_combat_bow, hori_idle, zoom_idle, vert_idle, crosshair_hori_bow, crosshair_vert_bow, crosshair_hori_idle, crosshair_vert_idle)
							endIf
						elseIf CurrentTransitionType != 4 && CurrentTransitionType != 1
							StopTransition = true
							utility.Wait(0.200000)
							if PlayerRef.IsSneaking()
								self.SmoothTransition(4, hori_combat_bow_sneak, zoom_combat_bow_sneak, vert_combat_bow_sneak, hori_idle, zoom_idle, vert_idle, crosshair_hori_bow_sneak, crosshair_vert_bow_sneak, crosshair_hori_idle, crosshair_vert_idle)
							else
								self.SmoothTransition(4, hori_combat_bow, zoom_combat_bow, vert_combat_bow, hori_idle, zoom_idle, vert_idle, crosshair_hori_bow, crosshair_vert_bow, crosshair_hori_idle, crosshair_vert_idle)
							endIf
						endIf
					endIf
					LastAction = "Sheathe Bow Begin"
					BowTransitionWasMade = false
				elseIf actionType == 11
					if LastAction == "Draw Bow Begin"
						if CurrentTransitionType == 0
							if PlayerRef.IsSneaking()
								self.SmoothTransition(5, hori_combat_bow, zoom_combat_bow, vert_combat_bow, hori_combat_bow_sneak, zoom_combat_bow_sneak, vert_combat_bow_sneak, crosshair_hori_bow, crosshair_vert_bow, crosshair_hori_bow_sneak, crosshair_vert_bow_sneak)
							else
								self.SmoothTransition(5, hori_combat_bow_sneak, zoom_combat_bow_sneak, vert_combat_bow_sneak, hori_combat_bow, zoom_combat_bow, vert_combat_bow, crosshair_hori_bow_sneak, crosshair_vert_bow_sneak, crosshair_hori_bow, crosshair_vert_bow)
							endIf
						elseIf CurrentTransitionType != 5
							StopTransition = true
							utility.Wait(0.200000)
							if PlayerRef.IsSneaking()
								self.SmoothTransition(5, hori_combat_bow, zoom_combat_bow, vert_combat_bow, hori_combat_bow_sneak, zoom_combat_bow_sneak, vert_combat_bow_sneak, crosshair_hori_bow, crosshair_vert_bow, crosshair_hori_bow_sneak, crosshair_vert_bow_sneak)
							else
								self.SmoothTransition(5, hori_combat_bow_sneak, zoom_combat_bow_sneak, vert_combat_bow_sneak, hori_combat_bow, zoom_combat_bow, vert_combat_bow, crosshair_hori_bow_sneak, crosshair_vert_bow_sneak, crosshair_hori_bow, crosshair_vert_bow)
							endIf
						endIf
					endIf
				elseIf actionType == 12
					if LastAction == "Draw Bow Begin"
						if game.GetCameraState() == 0
							if CurrentTransitionType == 0
								if CrosshairEnabled
									ui.SetNumber("HUD Menu", "_root.HUDMovieBaseInstance.CrosshairAlert._x", crosshair_hori_idle)
									ui.SetNumber("HUD Menu", "_root.HUDMovieBaseInstance.CrosshairAlert._y", crosshair_vert_idle)
									ui.SetNumber("HUD Menu", "_root.HUDMovieBaseInstance.StealthMeterInstance._x", crosshair_hori_idle)
									ui.SetNumber("HUD Menu", "_root.HUDMovieBaseInstance.StealthMeterInstance._y", crosshair_vert_idle)
								endIf
							elseIf CurrentTransitionType != 6
								StopTransition = true
								utility.Wait(0.200000)
								if CrosshairEnabled
									ui.SetNumber("HUD Menu", "_root.HUDMovieBaseInstance.CrosshairAlert._x", crosshair_hori_idle)
									ui.SetNumber("HUD Menu", "_root.HUDMovieBaseInstance.CrosshairAlert._y", crosshair_vert_idle)
									ui.SetNumber("HUD Menu", "_root.HUDMovieBaseInstance.StealthMeterInstance._x", crosshair_hori_idle)
									ui.SetNumber("HUD Menu", "_root.HUDMovieBaseInstance.StealthMeterInstance._y", crosshair_vert_idle)
								endIf
							endIf
						elseIf CurrentTransitionType == 0
							if CrosshairEnabled
								if PlayerRef.IsSneaking()
									ui.SetNumber("HUD Menu", "_root.HUDMovieBaseInstance.CrosshairAlert._x", crosshair_hori_bow_sneak)
									ui.SetNumber("HUD Menu", "_root.HUDMovieBaseInstance.CrosshairAlert._y", crosshair_vert_bow_sneak)
									ui.SetNumber("HUD Menu", "_root.HUDMovieBaseInstance.StealthMeterInstance._x", crosshair_hori_bow_sneak)
									ui.SetNumber("HUD Menu", "_root.HUDMovieBaseInstance.StealthMeterInstance._y", crosshair_vert_bow_sneak)
								else
									ui.SetNumber("HUD Menu", "_root.HUDMovieBaseInstance.CrosshairAlert._x", crosshair_hori_bow)
									ui.SetNumber("HUD Menu", "_root.HUDMovieBaseInstance.CrosshairAlert._y", crosshair_vert_bow)
									ui.SetNumber("HUD Menu", "_root.HUDMovieBaseInstance.StealthMeterInstance._x", crosshair_hori_bow)
									ui.SetNumber("HUD Menu", "_root.HUDMovieBaseInstance.StealthMeterInstance._y", crosshair_vert_bow)
								endIf
							endIf
						elseIf CurrentTransitionType != 6
							StopTransition = true
							utility.Wait(0.200000)
							if CrosshairEnabled
								if PlayerRef.IsSneaking()
									ui.SetNumber("HUD Menu", "_root.HUDMovieBaseInstance.CrosshairAlert._x", crosshair_hori_bow_sneak)
									ui.SetNumber("HUD Menu", "_root.HUDMovieBaseInstance.CrosshairAlert._y", crosshair_vert_bow_sneak)
									ui.SetNumber("HUD Menu", "_root.HUDMovieBaseInstance.StealthMeterInstance._x", crosshair_hori_bow_sneak)
									ui.SetNumber("HUD Menu", "_root.HUDMovieBaseInstance.StealthMeterInstance._y", crosshair_vert_bow_sneak)
								else
									ui.SetNumber("HUD Menu", "_root.HUDMovieBaseInstance.CrosshairAlert._x", crosshair_hori_bow)
									ui.SetNumber("HUD Menu", "_root.HUDMovieBaseInstance.CrosshairAlert._y", crosshair_vert_bow)
									ui.SetNumber("HUD Menu", "_root.HUDMovieBaseInstance.StealthMeterInstance._x", crosshair_hori_bow)
									ui.SetNumber("HUD Menu", "_root.HUDMovieBaseInstance.StealthMeterInstance._y", crosshair_vert_bow)
								endIf
							endIf
						endIf
					endIf
				endIf
			elseIf actionType == 7
				self.RegisterforActorAction(9)
				if LastAction == "Draw Bow Begin"
					if CurrentTransitionType == 0
						utility.SetINIFloat("fOverShoulderCombatPosX:Camera", hori_combat)
						utility.SetINIFloat("fOverShoulderCombatAddY:Camera", zoom_combat)
						utility.SetINIFloat("fOverShoulderCombatPosZ:Camera", vert_combat)
						game.UpdateThirdPerson()
						if CrosshairEnabled
							ui.SetNumber("HUD Menu", "_root.HUDMovieBaseInstance.CrosshairAlert._x", crosshair_hori_idle)
							ui.SetNumber("HUD Menu", "_root.HUDMovieBaseInstance.CrosshairAlert._y", crosshair_vert_idle)
							ui.SetNumber("HUD Menu", "_root.HUDMovieBaseInstance.StealthMeterInstance._x", crosshair_hori_idle)
							ui.SetNumber("HUD Menu", "_root.HUDMovieBaseInstance.StealthMeterInstance._y", crosshair_vert_idle)
						endIf
					elseIf CurrentTransitionType != 2
						StopTransition = true
						utility.Wait(0.200000)
						utility.SetINIFloat("fOverShoulderCombatPosX:Camera", hori_combat)
						utility.SetINIFloat("fOverShoulderCombatAddY:Camera", zoom_combat)
						utility.SetINIFloat("fOverShoulderCombatPosZ:Camera", vert_combat)
						game.UpdateThirdPerson()
						if CrosshairEnabled
							ui.SetNumber("HUD Menu", "_root.HUDMovieBaseInstance.CrosshairAlert._x", crosshair_hori_idle)
							ui.SetNumber("HUD Menu", "_root.HUDMovieBaseInstance.CrosshairAlert._y", crosshair_vert_idle)
							ui.SetNumber("HUD Menu", "_root.HUDMovieBaseInstance.StealthMeterInstance._x", crosshair_hori_idle)
							ui.SetNumber("HUD Menu", "_root.HUDMovieBaseInstance.StealthMeterInstance._y", crosshair_vert_idle)
						endIf
					endIf
				endIf
				LastAction = "Draw Other Begin"
				BowTransitionWasMade = false
			elseIf actionType == 9
				self.RegisterforActorAction(7)
				self.UnregisterforActorAction(9)
				LastAction = "Sheathe Other Begin"
				BowTransitionWasMade = false
			endIf
		endIf
		locked = false
	endIf
endFunction

function OnObjectUnequipped(form akBaseObject, objectreference akReference)

	if akBaseObject as weapon
		if (akBaseObject as weapon).GetWeaponType() == 7
			if PlayerRef.GetActorBase().GetSex() == 1
				netimmerse.SetNodeScale(PlayerRef as objectreference, "SHIELD", 1.00000, false)
			endIf
		endIf
	elseIf akBaseObject as ammo
		utility.WaitMenuMode(0.300000)
		if !NewAmmoEquipped
			PlayerRef.RemoveSpell(EnchantedArrow_AmmoEquipped)
		endIf
	endIf
endFunction

function ResetArrowFX(actor SourceActor)

	if SourceActor.HasSpell(EnchantedArrowFX as form) == true
		SourceActor.RemoveSpell(EnchantedArrowFX)
		utility.Wait(0.250000)
		SourceActor.AddSpell(EnchantedArrowFX, false)
	endIf
	if SourceActor.HasSpell(EnchantedQuiverFX as form) == true
		SourceActor.RemoveSpell(EnchantedQuiverFX)
		utility.Wait(0.250000)
		SourceActor.AddSpell(EnchantedQuiverFX, false)
	endIf
endFunction
