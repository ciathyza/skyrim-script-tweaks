Scriptname WM_MasterManagerScript extends Quest

; -------------------------------------------------------------------------------------------------
; Properties
; -------------------------------------------------------------------------------------------------

Float                        Property UpdateTimer     Auto
WM_ArrowCountQuestScript     Property ArrowScript     Auto
WM_AthleticCountQuestScript  Property AthleticScript  Auto
WM_AttributeCountQuestScript Property AttributeScript Auto
WM_BountyCountQuestScript    Property BountyScript    Auto
WM_FollowerCountQuestScript  Property FollowerScript  Auto
WM_GoldCountQuestScript      Property GoldScript      Auto
WM_HorseCountQuestScript     Property HorseScript     Auto
WM_HotkeyCountQuestScript    Property HotkeyScript    Auto
WM_LightCountQuestScript     Property LightScript     Auto
WM_LockpickCountQuestScript  Property LockpickScript  Auto
WM_SkillCountQuestScript     Property SkillScript     Auto
WM_WeightCountQuestScript    Property WeightScript    Auto


; -------------------------------------------------------------------------------------------------
; Events
; -------------------------------------------------------------------------------------------------

Event OnInit()
	; All widgets disabled by default.
	ArrowScript.Visible     = false
	AthleticScript.Visible  = false
	AttributeScript.Visible = false
	BountyScript.Visible    = false
	FollowerScript.Visible  = false
	GoldScript.Visible      = false
	HorseScript.Visible     = false
	HotkeyScript.Visible    = false
	LightScript.Visible     = false
	LockpickScript.Visible  = false
	SkillScript.Visible     = false
	WeightScript.Visible    = false

	RegisterForSingleUpdate(UpdateTimer)
EndEvent


Event OnUpdate()
	ArrowScript.UpdateStatus()
	WeightScript.UpdateStatus()
	GoldScript.UpdateStatus()
	BountyScript.UpdateStatus()
	SkillScript.UpdateStatus()
	AthleticScript.UpdateStatus()
	LockpickScript.UpdateStatus()
	LightScript.UpdateStatus()
	HotkeyScript.UpdateStatus()
	HorseScript.UpdateStatus()
	FollowerScript.UpdateStatus()
	AttributeScript.UpdateStatus()
	RegisterForSingleUpdate(UpdateTimer)
EndEvent
