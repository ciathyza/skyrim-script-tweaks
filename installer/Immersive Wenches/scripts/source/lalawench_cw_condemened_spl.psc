Scriptname lalawench_CW_condemened_SPL extends activemagiceffect  

EVENT onDying(actor myKiller)
utility.wait(1.0)
       lalawench_CW_Main_Radiant.SetObjectiveCompleted(43,1)
       lalawench_CW_Main_Radiant.SetObjectiveDisplayed(43, false)
       lalawench_CW_Main_Radiant.SetStage(50)
       lalawench_CW_Main_Radiant.stop()
utility.wait(1.0)
       lalawench_CW_Main_Radiant.start()
selfRef.RemoveSpell(lalawench_CW_condemned_SPL)
ENDEVENT

Actor selfRef
quest property lalawench_CW_Main_Radiant auto
spell property lalawench_CW_condemned_SPL auto
