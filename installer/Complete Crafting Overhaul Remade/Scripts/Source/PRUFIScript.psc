Scriptname PRUFIScript Extends Quest

; Both 'mrpwn' and 'IsharaMeradin' have played major parts in the construction of this script.
; The script was integrated/modified by quixotic-cynic (quixoticynic on Nexusmods)

; 'mrpwn' (on Nexusmods) constructed the initial script.
; 'IsharaMeradin' (on Nexusmods) designed an event that blocked access to the smelter whilst the UpdateFavorites() function was running. 
; 'IsharaMeradin' fixed an annoying bug with the addition of an 'If kForm' check in the original UpdateFavorites().
; 'mrpwn' pointed out that my modified script neglected game pad users.
; 'mrpwn' suggested a resource-saving modification to OnCrosshairRefChange().
; 'quixoticynic' provided a somewhat more efficient (but more ugly) UpdateFavorites().
; 'IsharaMeradin' solved a problem with OnKeyDown() by registering a key check within OnInit() and then checking if the UI is open when the key is pressed.
; The idea for the isEquippable()/isEquippableAndFav() functions came from http://forums.nexusmods.com/index.php?/topic/1115396-mod-script-issue-requesting-diagonstic-help/
; 'mrpwn' suggested using perks instead of blocking activation of the smelter (this feature was implemented by quixoticynic)
; 'mrpwn' helped me to understand how to use OnPlayerLoadGame() thereby enabling creation of the "PRUFIPlayerAliasScript.psc" file.

; Idea -- use PRUFEICrafting instead of boolean bUpdateFavorites

Actor Property PlayerRef Auto
ObjectReference Property prufeiChest Auto ;Points at the container in the isolated cell
Perk Property PRUFEICrafting Auto

Bool bUpdateFavorites

Event OnInit()
	Maintenance()
EndEvent

Function Maintenance()
	Utility.Wait(1)
	UnregisterForAllMenus()
	UnregisterForAllKeys()
	If (PlayerRef.HasPerk(PRUFEICrafting) == True)
		PlayerRef.RemovePerk(PRUFEICrafting)
	EndIf
	RegisterForMenu("InventoryMenu")
	If Game.UsingGamepad()
		RegisterForKey(Input.GetMappedKey("Jump")) ;Y button on X-Box 360 Controller
	Else
		RegisterForKey(Input.GetMappedKey("Toggle POV")) ;The DX Scan Code for 'F'
	EndIf
	UpdateFavorites()
EndFunction

Event OnKeyDown(Int aiKey)
	If UI.IsMenuOpen("InventoryMenu")
		bUpdateFavorites = True
		PlayerRef.AddPerk(PRUFEICrafting)
	EndIf
EndEvent

Event OnMenuClose(String asMenuName)
	If(bUpdateFavorites)
		UpdateFavorites()
	EndIf
EndEvent 

Function UpdateFavorites()
	If (PlayerRef.GetNumItems() < 36)
		UpdateFavoritesFine()
	Else
		UpdateFavoritesCoarse()
	EndIf
	PlayerRef.RemovePerk(PRUFEICrafting)
EndFunction

Function UpdateFavoritesFine()
	Int iSize = PlayerRef.GetNumItems()
	While(iSize >= 0)
		Form kForm = PlayerRef.GetNthForm(iSize)
		If isEquippable(kForm)
			Int iCount = prufeiChest.GetItemCount(kForm)
			Bool bFavorited = Game.IsObjectFavorited(kForm)
			If((bFavorited) && (iCount == 0))
				prufeiChest.AddItem(kForm)
			ElseIf((!bFavorited) && (iCount > 0))
				prufeiChest.RemoveItem(kForm, iCount)
			EndIf
		EndIf
		iSize -= 1
	EndWhile
	bUpdateFavorites = False
EndFunction

Bool Function isEquippable(Form kForm)
	Return ((kForm as Armor) || (kForm as Weapon) || (kForm as Ammo) || (kForm as Ingredient) || (kForm as Potion) || (kForm as Scroll))
EndFunction

Function UpdateFavoritesCoarse()
	prufeiChest.RemoveAllItems()
	Int iSize = PlayerRef.GetNumItems()
	While(iSize >= 0)
		Form kForm = PlayerRef.GetNthForm(iSize)
		If isEquippableAndFav(kForm)
			prufeiChest.AddItem(kForm)
		EndIf
		iSize -= 1
	EndWhile
	bUpdateFavorites = False
EndFunction

Bool Function isEquippableAndFav(Form kForm)
	Return (((kForm as Armor) || (kForm as Weapon) || (kForm as Ammo) || (kForm as Ingredient) || (kForm as Potion) || (kForm as Scroll)) && Game.IsObjectFavorited(kForm))
EndFunction