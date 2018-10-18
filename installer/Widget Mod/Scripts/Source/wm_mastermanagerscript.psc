Scriptname WM_MasterManagerScript extends Quest

WM_ArrowCountQuestScript Property ArrowScript Auto
WM_WeightCountQuestScript Property WeightScript Auto
WM_GoldCountQuestScript Property GoldScript Auto
WM_BountyCountQuestScript Property BountyScript Auto
WM_SkillCountQuestScript Property SkillScript Auto
WM_AthleticCountQuestScript Property AthleticScript Auto
WM_LockpickCountQuestScript Property LockpickScript Auto
WM_LightCountQuestScript Property LightScript Auto
WM_HotkeyCountQuestScript Property HotkeyScript Auto
WM_HorseCountQuestScript Property HorseScript Auto
WM_FollowerCountQuestScript Property FollowerScript Auto
WM_AttributeCountQuestScript Property AttributeScript Auto

Float Property UpdateTimer Auto

Event OnInit()
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