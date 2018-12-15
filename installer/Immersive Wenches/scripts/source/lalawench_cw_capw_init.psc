Scriptname lalawench_CW_capW_init extends Actor  

ACTORBASE PROPERTY lalawench_CW_bandit_01 AUTO
ACTORBASE PROPERTY lalawench_CW_bandit_02 AUTO
ACTORBASE PROPERTY lalawench_CW_bandit_03 AUTO
ACTORBASE PROPERTY lalawench_CW_bandit_04 AUTO
ACTORBASE PROPERTY lalawench_CW_bandit_05 AUTO
faction PROPERTY lalawench_CW_capturedW AUTO
int banditVariable
idle Property OffsetBoundStandingStart Auto
Quest Property lalawench_CW_Main_Radiant Auto 
ReferenceAlias property capturedwench auto
Faction Property lalawench_CW_NofailW Auto
Faction Property lalawench_CW_doomed Auto
Faction Property lalawench_CW_Sold Auto
Faction Property lalawench_CW_saved Auto
leveleditem property lalawench_CW_deathnotes auto

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
capturedwench.ForceRefTo(Self as actor)
    Utility.Wait(1.0)
    Self.Enable()
		  utility.wait(1.0)
                self.placeAtMe(lalawench_CW_bandit_01)
                self.placeAtMe(lalawench_CW_bandit_02)
                banditVariable = Utility.RandomInt(1, 3)
                If (banditVariable == 1)
                  self.placeAtMe(lalawench_CW_bandit_03)
                Elseif (banditVariable == 2)
                  self.placeAtMe(lalawench_CW_bandit_04)
                  self.placeAtMe(lalawench_CW_bandit_05)
                Elseif (banditVariable == 3)
                  self.placeAtMe(lalawench_CW_bandit_03)
                  self.placeAtMe(lalawench_CW_bandit_04)
                  self.placeAtMe(lalawench_CW_bandit_05)
                endif
Endif

	ENDEVENt

EVENT onDying(actor myKiller)
self.Additem(lalawench_CW_deathnotes, 1)
if self.IsInFaction(lalawench_CW_NofailW) == False
       lalawench_CW_Main_Radiant.SetObjectiveDisplayed(49, true, true)
lalawench_CW_Main_Radiant.SetObjectiveDisplayed(20, false)
lalawench_CW_Main_Radiant.SetObjectiveDisplayed(30, false)
lalawench_CW_Main_Radiant.SetObjectiveDisplayed(40, false)
lalawench_CW_Main_Radiant.SetObjectiveDisplayed(41, false)
lalawench_CW_Main_Radiant.SetObjectiveDisplayed(42, false)
lalawench_CW_Main_Radiant.SetObjectiveDisplayed(43, false)
lalawench_CW_Main_Radiant.SetObjectiveDisplayed(49, false)
       utility.wait(1.0)
       lalawench_CW_Main_Radiant.SetStage(49)
endif
ENDEVENT 