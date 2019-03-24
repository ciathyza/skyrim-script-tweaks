; Immersive Horses by sevencardz.
ScriptName IHOPlayerAliasScript extends ReferenceAlias
{Script that runs on the player alias.}
import IHOUtil

Actor Property PlayerRef Auto

; Prevents the player from equipping armor items made for horses.
Event OnObjectEquipped(Form akBaseObject, ObjectReference akReference)
	if IsHorseArmorItem(akBaseObject)
		PlayerRef.UnequipItem(akBaseObject)
	endIf
EndEvent
