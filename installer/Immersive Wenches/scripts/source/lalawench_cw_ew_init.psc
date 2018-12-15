Scriptname lalawench_CW_EW_init extends Actor  

ACTORBASE PROPERTY lalawench_CW_bandit_01 AUTO
ACTORBASE PROPERTY lalawench_CW_bandit_02 AUTO
ACTORBASE PROPERTY lalawench_CW_bandit_03 AUTO
ACTORBASE PROPERTY lalawench_CW_bandit_04 AUTO
ACTORBASE PROPERTY lalawench_CW_bandit_05 AUTO
faction PROPERTY lalawench_CW_capturedW AUTO
keyword property lalawench_CW_EW_orianne auto
keyword property lalawench_CW_EW_Daphnne auto
keyword property lalawench_CW_EW_Jaryra auto
keyword property lalawench_CW_EW_Kahanne auto
keyword property lalawench_CW_EW_Maxy auto
globalvariable property lalawench_CW_EW_total auto
globalvariable property lalawench_CW_EW_count auto
int banditVariable
idle Property OffsetBoundStandingStart Auto
Quest Property lalawench_introquest Auto 
Faction Property lalawench_CW_NofailW Auto
Faction Property lalawench_CW_doomed Auto
Faction Property lalawench_CW_saved Auto


Event OnLoad()
if self.IsInFaction(lalawench_CW_doomed) == True
    Utility.Wait(1.0)
    Self.playIdle(OffsetBoundStandingStart)
endif
EndEvent

	EVENT onInit()
if self.IsInFaction(lalawench_CW_capturedW) == True
    Self.Disable(true)
    Utility.Wait(1.0)
    Self.Enable()
		  utility.wait(1.0)
                self.placeAtMe(lalawench_CW_bandit_01)
                self.placeAtMe(lalawench_CW_bandit_02)
                banditVariable = Utility.RandomInt(1, 2)
                If (banditVariable == 1)
                  self.placeAtMe(lalawench_CW_bandit_03)
                Elseif (banditVariable == 2)
                  self.placeAtMe(lalawench_CW_bandit_04)
                  self.placeAtMe(lalawench_CW_bandit_05)
                endif
Endif

	ENDEVENt

EVENT onDying(actor myKiller)
if self.isinfaction(lalawench_CW_saved) == False
;
if self.haskeyword(lalawench_CW_EW_orianne) == True
lalawench_introquest.SetObjectiveDisplayed(11, false)
elseif self.haskeyword(lalawench_CW_EW_maxy) == True
lalawench_introquest.SetObjectiveDisplayed(12, false)
elseif self.haskeyword(lalawench_CW_EW_jaryra) == True
lalawench_introquest.SetObjectiveDisplayed(13, false)
elseif self.haskeyword(lalawench_CW_EW_kahanne) == True
lalawench_introquest.SetObjectiveDisplayed(14, false)
elseif self.haskeyword(lalawench_CW_EW_daphnne) == True
lalawench_introquest.SetObjectiveDisplayed(15, false)
endif
lalawench_CW_EW_total.mod(-1)
lalawench_CW_EW_count.mod(-1)

lalawench_introquest.UpdateCurrentInstanceGlobal(lalawench_CW_EW_total)
lalawench_introquest.UpdateCurrentInstanceGlobal(lalawench_CW_EW_count)
if lalawench_CW_EW_total.getvalueint() == 0
lalawench_introquest.SetObjectiveDisplayed(10, false)
lalawench_introquest.SetObjectiveDisplayed(11, false)
lalawench_introquest.SetObjectiveDisplayed(12, false)
lalawench_introquest.SetObjectiveDisplayed(13, false)
lalawench_introquest.SetObjectiveDisplayed(14, false)
lalawench_introquest.SetObjectiveDisplayed(15, false)
lalawench_introquest.SetObjectiveDisplayed(20, false)
lalawench_introquest.SetObjectiveDisplayed(30, false)
lalawench_introquest.SetObjectiveDisplayed(40, true, true)
lalawench_introquest.SetStage(40)
endif
;
endif

ENDEVENT 