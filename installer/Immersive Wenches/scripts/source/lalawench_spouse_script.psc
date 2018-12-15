;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname lalawench_spouse_script Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
akSpeaker.AddToFaction(WenchSpouseFaction)

if !(akSpeaker.IsInFaction(PotentialMarriageFaction))
  akSpeaker.AddToFaction(PotentialMarriageFaction)
endif

if akSpeaker.GetRelationshipRank(Game.GetPlayer()) < 4
  akSpeaker.SetRelationshipRank(Game.GetPlayer(), 4)
endif

if Game.GetPlayer().GetRelationshipRank(akSpeaker) < 4
  Game.GetPlayer().SetRelationshipRank(akSpeaker, 4)
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Faction Property PotentialMarriageFaction  Auto  

Faction Property WenchSpouseFaction  Auto  
