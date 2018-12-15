Scriptname lalawench_poster_P extends ObjectReference  

Event OnActivate(ObjectReference akActionRef)
	If akActionRef == PlayerREF
		Menu()
	EndIf
EndEvent

Function Menu()
             ObjectReference linkedRef = self.GetLinkedRef()
             Int aiButton = lalawench_poster_MSG.Show()
		If aiButton == 0  ; take
               Game.GetPlayer().AddItem(linkedRef)
               self.delete()

		ElseIf aiButton == 1 ; destroy
               linkedRef.delete()
               self.delete()

		ElseIf aiButton == 2 ; leave
                ;nothing
		EndIf
If aiButton < 2
     CrimeFactionHaafingar.ModCrimeGold(Bounty, true)
endif
EndFunction

Message Property lalawench_poster_MSG Auto
Actor Property PlayerREF Auto
Int Property Bounty auto
faction Property CrimeFactionHaafingar auto