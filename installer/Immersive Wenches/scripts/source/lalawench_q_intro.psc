Scriptname lalawench_Q_intro extends Quest  

Event onInit()                       
if lalawench_CW_intro_start.getvalueint() == 0
       Debug.Notification("You found some notes on the floor about a captured wench...")
       lalawench_CW_intro_start.Mod(1)
endif
endEvent  

GlobalVariable Property lalawench_CW_intro_start Auto