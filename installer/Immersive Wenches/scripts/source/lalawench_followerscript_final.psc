;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 0
Scriptname lalawench_followerscript_final Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
akSpeaker.AddToFaction(FollowerFaction)
akSpeaker.AddToFaction(lalawench_followeragreedfaction)
akSpeaker.RemoveFromFaction(RentFaction)
akSpeaker.SetActorValue("Confidence", 3)
akSpeaker.SetActorValue("Aggression", 1)
akSpeaker.SetActorValue("Assistance", 1)
;normal script end here
;vanilla townfactions removed after this
akSpeaker.RemoveFromFaction(Townwinterholdfaction)
akSpeaker.RemoveFromFaction(Townwindhelmfaction)
akSpeaker.RemoveFromFaction(Townwhiterunfaction)
akSpeaker.RemoveFromFaction(Townsolitudefaction)
akSpeaker.RemoveFromFaction(Townroriksteadfaction)
akSpeaker.RemoveFromFaction(Townriverwoodfaction)
akSpeaker.RemoveFromFaction(thievesguildfaction)
akSpeaker.RemoveFromFaction(riftenraggedflagonfaction)
akSpeaker.RemoveFromFaction(townriftenfaction)
akSpeaker.RemoveFromFaction(townoldhroldanfaction)
akSpeaker.RemoveFromFaction(nightgateinnfaction)
akSpeaker.RemoveFromFaction(townmorthalfaction)
akSpeaker.RemoveFromFaction(townmorkhazgurfaction)
akSpeaker.RemoveFromFaction(townmarkarthfaction)
akSpeaker.RemoveFromFaction(townlargashburfaction)
akSpeaker.RemoveFromFaction(townkynesgrovefaction)
akSpeaker.RemoveFromFaction(townivarsteadfaction)
akSpeaker.RemoveFromFaction(honningbrewmeaderyfaction)
akSpeaker.RemoveFromFaction(townfalkreathfaction)
akSpeaker.RemoveFromFaction(towndragonbridgefaction)
akSpeaker.RemoveFromFaction(towndawnstarfaction)
akSpeaker.RemoveFromFaction(dlc2rrnetchfaction)
;vanilla crimefactions removed after this
akSpeaker.RemoveFromFaction(CrimeFactionWhiterun)
akSpeaker.RemoveFromFaction(crimefactionwinterhold)
akSpeaker.RemoveFromFaction(crimefactioneastmarch)
akSpeaker.RemoveFromFaction(Crimefactionwhiterun)
akSpeaker.RemoveFromFaction(crimefactionhaafingar)
akSpeaker.RemoveFromFaction(crimefactionthievesguild)
akSpeaker.RemoveFromFaction(crimefactionrift)
akSpeaker.RemoveFromFaction(crimefactionreach)
akSpeaker.RemoveFromFaction(crimefactionpale)
akSpeaker.RemoveFromFaction(crimefactionHjaalmarch)
akSpeaker.RemoveFromFaction(crimefactionorcs)
akSpeaker.RemoveFromFaction(crimefactionfalkreath)
 akSpeaker.RemoveFromFaction(dlc2crimeravenrockfaction)

if akSpeaker.GetRelationshipRank(Game.GetPlayer()) < 3
  akSpeaker.SetRelationshipRank(Game.GetPlayer(), 3)
endif

if Game.GetPlayer().GetRelationshipRank(akSpeaker) < 3
  Game.GetPlayer().SetRelationshipRank(akSpeaker, 3)
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Faction Property FollowerFaction  Auto

Faction Property lalawench_followeragreedfaction  Auto

Faction Property RentFaction  Auto

Faction Property townwinterholdfaction  Auto
Faction Property townwindhelmfaction  Auto
Faction Property townwhiterunfaction  Auto
Faction Property townsolitudefaction  Auto
Faction Property townroriksteadfaction  Auto
Faction Property townriverwoodfaction  Auto
Faction Property thievesguildfaction  Auto
Faction Property riftenraggedflagonfaction  Auto
Faction Property townriftenfaction  Auto
Faction Property townoldhroldanfaction  Auto
Faction Property nightgateinnfaction  Auto
Faction Property townmorthalfaction  Auto
Faction Property townmorkhazgurfaction  Auto
Faction Property townmarkarthfaction  Auto
Faction Property townlargashburfaction  Auto
Faction Property townkynesgrovefaction  Auto
Faction Property townivarsteadfaction  Auto
Faction Property honningbrewmeaderyfaction  Auto
Faction Property townfalkreathfaction  Auto
Faction Property towndragonbridgefaction  Auto
Faction Property towndawnstarfaction  Auto
 Faction Property dlc2rrnetchfaction  Auto


Faction Property crimefactionwinterhold  Auto
Faction Property crimefactioneastmarch  Auto
Faction Property Crimefactionwhiterun  Auto
Faction Property crimefactionhaafingar  Auto
Faction Property crimefactionthievesguild  Auto
Faction Property crimefactionrift  Auto
Faction Property crimefactionreach  Auto
Faction Property crimefactionpale  Auto
Faction Property crimefactionHjaalmarch  Auto
Faction Property crimefactionorcs  Auto
Faction Property crimefactionfalkreath  Auto
Faction Property dlc2crimeravenrockfaction  Auto
