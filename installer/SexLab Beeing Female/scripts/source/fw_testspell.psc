Scriptname FW_TestSpell extends FWSpell  

Event OnWoman(actor Target, actor Caster)
	System.Controller.AddSperm(Target, Caster)
endEvent