;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname lalawench_CW_intro_F Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
Game.getplayer().Additem(Gold001, lalawench_CW_reward_saved.GetValueInt())
lalawench_CW_EW_count.Mod(1)
	lalawench_introquest.UpdateCurrentInstanceGlobal(lalawench_CW_EW_count)
	lalawench_introquest.SetObjectiveDisplayed(20,true,true)
	if lalawench_CW_EW_count.getvalueint() == lalawench_CW_EW_total.getvalueint()
		lalawench_introquest.SetObjectiveDisplayed(11,false)
		lalawench_introquest.SetObjectiveDisplayed(12,false)
		lalawench_introquest.SetObjectiveDisplayed(13,false)
		lalawench_introquest.SetObjectiveDisplayed(14,false)
		lalawench_introquest.SetObjectiveDisplayed(15,false)
		lalawench_introquest.SetObjectiveDisplayed(20,false)
		lalawench_introquest.SetObjectiveDisplayed(30,true,true)
		lalawench_introquest.SetObjectiveCompleted(30,1)
              lalawench_introquest.setstage(30)
	endif
utility.wait(3.0)
Xmarker_wench.MoveTo(wench)
wench.SetOutFit(ClothesTavernWenchOutfit)
wench.AddToFaction(lalawench_CW_Saved)
wench.RemoveFromFaction(lalawench_CW_followingwenches)
wench.AddToFaction(lalawench_Wmiscdialogues)
wench.AddToFaction(PotentialFollowerFaction)
wench.AddToFaction(PotentialMarriageFaction)
wench.SetActorValue("Confidence", 3)
wench.SetActorValue("Aggression", 1)
wench.SetActorValue("Assistance", 1)
if wench.GetRelationshipRank(Game.GetPlayer()) < 3
  wench.SetRelationshipRank(Game.GetPlayer(), 3)
endif

if Game.GetPlayer().GetRelationshipRank(wench) < 3
  Game.GetPlayer().SetRelationshipRank(wench, 3)
endif
wench.SetExpressionOverride(2, 40)
wench.Say(TopicToSay1)
enslavedglobal.Mod(1)
wench.EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Faction Property lalawench_CW_Saved Auto
Faction Property lalawench_CW_followingwenches Auto
actor Property wench Auto
quest property lalawench_introquest auto
outfit property ClothesTavernWenchOutfit auto
globalvariable property lalawench_CW_EW_count auto
globalvariable property lalawench_CW_EW_total auto
globalvariable property enslavedglobal auto
Faction Property PotentialFollowerFaction  Auto
Faction Property PotentialMarriageFaction Auto
Faction Property lalawench_Wmiscdialogues Auto
MiscObject Property Gold001  Auto
globalvariable property lalawench_CW_reward_saved auto
ObjectReference Property Xmarker_wench Auto
Topic Property TopicToSay1 Auto
