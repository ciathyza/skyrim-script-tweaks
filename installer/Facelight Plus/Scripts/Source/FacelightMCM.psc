ScriptName FacelightMCM extends SKI_ConfigBase  

; -------------------------------------------------------------------------------------------------
; Properties
; -------------------------------------------------------------------------------------------------

Actor            Property player               Auto
GlobalVariable   Property editmodeGlobal       Auto
GlobalVariable   Property hideGlobal           Auto
GlobalVariable   Property sneaktoggleGlobal    Auto
Perk             Property editmodePerk         Auto
ReferenceAlias[] Property npc                  Auto
Spell            Property darkdummySpell       Auto
Spell            Property darktargetdummySpell Auto
Spell            Property dummySpell           Auto
Spell            Property targetdummySpell     Auto


; -------------------------------------------------------------------------------------------------
; Variables
; -------------------------------------------------------------------------------------------------

Actor conversationTarget = none
bool editmodeVal         = false
bool hideVal             = false
bool sneaktoggleVal      = true
int conversationVal      = 2
int editmodeHotkeyVal    = -1
int hideHotkeyVal        = -1
int playerHotkeyVal      = 33
int playerVal            = 2
int selectednpcVal       = 0
int[] selectednpcFacelightVal
string[] facelightList
string[] npcList


; -------------------------------------------------------------------------------------------------
; MCM Events
; -------------------------------------------------------------------------------------------------

event OnConfigInit()
	; Execution Delay.
	Utility.Wait(12.0)

	npcList = new string[15]
	selectednpcFacelightVal = new int[15]
	facelightList = new string[3]
	facelightList[0] = "Off"
	facelightList[1] = "Dark"
	facelightList[2] = "On"
	if (player.HasSpell(dummySpell))
		playerVal = 2
		player.RemoveSpell(dummySpell)
		player.AddSpell(dummySpell)
	elseIf (player.HasSpell(darkdummySpell))
		playerVal = 1
		player.RemoveSpell(darkdummySpell)
		player.AddSpell(darkdummySpell)
	else
		playerVal = 0
	endIf
	int i = 0
	While i < 15
		if (npc[i].GetActorReference().HasSpell(targetdummySpell))
			npc[i].GetActorReference().RemoveSpell(targetdummySpell)
			npc[i].GetActorReference().AddSpell(targetdummySpell)
		elseIf (npc[i].GetActorReference().HasSpell(darktargetdummySpell))
			npc[i].GetActorReference().RemoveSpell(darktargetdummySpell)
			npc[i].GetActorReference().AddSpell(darktargetdummySpell)
		endIf
		i += 1
	EndWhile
	player.AddPerk(editmodePerk)
	UnregisterForAllKeys()
	RegisterForKey(playerHotkeyVal)
	RegisterForKey(hideHotkeyVal)
	RegisterForKey(editmodeHotkeyVal)
	RegisterForMenu("Dialogue menu")
endEvent


function UpdateFacelightStatus()
	if (player.HasSpell(dummySpell))
		playerVal = 2
	elseIf (player.HasSpell(darkdummySpell))
		playerVal = 1
	else
		playerVal = 0
	endIf
	
	if (editmodeGlobal.GetValueInt() == 1)
		editmodeVal = true
	else
		editmodeVal = false
	endIf
	
	if (hideGlobal.GetValueInt() == 1)
		hideVal = true
	else
		hideVal = false
	endIf
	
	if (sneaktoggleGlobal.GetValueInt() == 1)
		sneaktoggleVal = true
	else
		sneaktoggleVal = false
	endIf
	
	int i = 0
	While i < 15
		if (npc[i].GetActorReference().GetActorBase() != none)
			npcList[i] = (npc[i].GetActorReference().GetActorBase() as form).GetName()
		else
			npcList[i] = "===NULL==="
		endIf
		i += 1
	EndWhile
	
	i = 0
	While i < 15
		if (npc[i].GetActorReference().HasSpell(targetdummySpell))
			selectednpcFacelightVal[i] = 2
		elseIf (npc[i].GetActorReference().HasSpell(darktargetdummySpell))
			selectednpcFacelightVal[i] = 1
		else
			selectednpcFacelightVal[i] = 0
		endIf
		i += 1
	EndWhile
endFunction


event OnPageReset(string page)
	UpdateFacelightStatus()
    SetCursorFillMode(TOP_TO_BOTTOM)
	AddHeaderOption("General")
	AddMenuOptionST("playerST", "Player face light", facelightList[playerVal])
	AddKeyMapOptionST("playerHotkeyST", "Player face light hotkey", playerHotkeyVal)
	AddToggleOptionST("editmodeST", "Edit mode", editmodeVal)
	AddKeyMapOptionST("editmodeHotkeyST", "Edit mode hotkey", editmodeHotkeyVal)
	AddToggleOptionST("sneaktoggleST", "Universal auto toggle on sneak", sneaktoggleVal)
	AddMenuOptionST("conversationST", "Conversation face light", facelightList[conversationVal])
	AddToggleOptionST("hideST", "Hide all face lights", hideVal)
	AddKeyMapOptionST("hideHotkeyST", "Hide all face lights hotkey", hideHotkeyVal)
	SetCursorPosition(1)
	AddHeaderOption("NPC face lights")
	AddMenuOptionST("selectednpcST", "Selected NPC", npcList[selectednpcVal])
	if (npc[selectednpcVal].GetActorReference().GetActorBase() != none)
		AddMenuOptionST("npcFacelightST", "NPC face light", facelightList[selectednpcFacelightVal[selectednpcVal]])
		AddEmptyOption()
		AddTextOptionST("clearnpcST", "Clear this NPC", "")
	else
		AddEmptyOption()
		AddEmptyOption()
		AddEmptyOption()
	endIf
	AddEmptyOption()
	AddTextOptionST("clearallnpcsST", "Clear all NPCs", "")
endEvent


event OnKeyDown(int keyCode)
	if (keyCode == playerHotkeyVal)
		if (player.HasSpell(dummySpell))
			playerVal = 0
			player.RemoveSpell(dummySpell)
		elseIf (player.HasSpell(darkdummySpell))
			playerVal = 2
			player.RemoveSpell(darkdummySpell)
			player.AddSpell(dummySpell)
		else
			playerVal = 1
			player.AddSpell(darkdummySpell)
		endIf
	elseIf (keyCode == hideHotkeyVal)
		hideVal = !hideVal
		if(hideVal)
			hideGlobal.SetValueInt(1)
		else
			hideGlobal.SetValueInt(0)
		endIf
	elseIf (keyCode == editmodeHotkeyVal)
		if (editmodeGlobal.GetValueInt() == 0)
			debug.notification("Face light edit mode on")
			editmodeGlobal.SetValueInt(1)
		else
			debug.notification("Face light edit mode off")
			editmodeGlobal.SetValueInt(0)
		endIf
	endIf
endEvent


Event OnMenuOpen(string menuName)
	RegisterForMenu("Dialogue menu")
	if (conversationVal != 0 && menuName == "Dialogue Menu")
		conversationTarget = Game.GetDialogueTarget() as Actor
		int i = 0
		while i < 15
			if (npc[i].GetActorReference() == conversationTarget)
				return
			endIf
			i += 1
		endWhile
		if (conversationVal == 2)
			conversationTarget.RemoveSpell(darktargetdummySpell)
			conversationTarget.AddSpell(targetdummySpell)
		elseIf (conversationVal == 1)
			conversationTarget.RemoveSpell(targetdummySpell)
			conversationTarget.AddSpell(darktargetdummySpell)
		endIf
	endif
EndEvent


Event OnMenuClose(string menuName)
	RegisterForMenu("Dialogue menu")
	if (conversationVal != 0 && menuName == "Dialogue Menu")
		int i = 0
		while i < 15
			if (npc[i].GetActorReference() == conversationTarget)
				return
			endIf
			i += 1
		endWhile
		conversationTarget.RemoveSpell(targetdummySpell)
		conversationTarget.RemoveSpell(darktargetdummySpell)
	endif
EndEvent


event OnConfigClose()
	UnregisterForAllKeys()
	RegisterForKey(playerHotkeyVal)
	RegisterForKey(hideHotkeyVal)
	RegisterForKey(editmodeHotkeyVal)
endEvent


; -------------------------------------------------------------------------------------------------
; States
; -------------------------------------------------------------------------------------------------

state playerST
	event OnMenuOpenST()
		SetMenuDialogOptions(facelightList)
		SetMenuDialogStartIndex(playerVal)
	endEvent
	
	event OnMenuAcceptST(int index)
        playerVal = index
        SetMenuOptionValueST(facelightList[playerVal])
		if (playerVal == 2)
			player.RemoveSpell(darkdummySpell)
			player.AddSpell(dummySpell)
		elseIf (playerVal == 1)
			player.RemoveSpell(dummySpell)
			player.AddSpell(darkdummySpell)
		elseIf (playerVal == 0)
			player.RemoveSpell(dummySpell)
			player.RemoveSpell(darkdummySpell)
		endIf
	endEvent
endState


state playerHotkeyST
	event OnKeyMapChangeST(int newKeyCode, string conflictControl, string conflictName)
        playerHotkeyVal = newKeyCode
        SetKeyMapOptionValueST(playerHotkeyVal)
	endEvent
	
	event OnDefaultST()
		playerHotkeyVal = 26
		SetKeyMapOptionValueST(playerHotkeyVal)
	endEvent
endState


state editmodeST
	event OnSelectST()
		editmodeVal = !editmodeVal
		SetToggleOptionValueST(editmodeVal)
		if (editmodeVal)
			editmodeGlobal.SetValueInt(1)
		else
			editmodeGlobal.SetValueInt(0)
		endIf
	endEvent
endState


state editmodeHotkeyST
	event OnKeyMapChangeST(int newKeyCode, string conflictControl, string conflictName)
		editmodeHotkeyVal = newKeyCode
		SetKeyMapOptionValueST(editmodeHotkeyVal)
    endEvent
	
	event OnDefaultST()
		editmodeHotkeyVal = 43
		SetKeyMapOptionValueST(editmodeHotkeyVal)
	endEvent
endState


state sneaktoggleST
	event OnSelectST()
		sneaktoggleVal = !sneaktoggleVal
		SetToggleOptionValueST(sneaktoggleVal)
		if (sneaktoggleVal)
			sneaktoggleGlobal.SetValueInt(1)
		else
			sneaktoggleGlobal.SetValueInt(0)
		endIf
	endEvent
endState


state conversationST
	event OnMenuOpenST()
		SetMenuDialogOptions(facelightList)
		SetMenuDialogStartIndex(conversationVal)
	endEvent
	
	event OnMenuAcceptST(int index)
        conversationVal = index
        SetMenuOptionValueST(facelightList[conversationVal])
	endEvent
endState


state hideST
	event OnSelectST()
		hideVal = !hideVal
		SetToggleOptionValueST(hideVal)
		if (hideVal)
			hideGlobal.SetValueInt(1)
		else
			hideGlobal.SetValueInt(0)
		endIf
	endEvent
endState


state hideHotkeyST
	event OnKeyMapChangeST(int newKeyCode, string conflictControl, string conflictName)
		hideHotkeyVal = newKeyCode
		SetKeyMapOptionValueST(hideHotkeyVal)
	endEvent
	
	event OnDefaultST()
		hideHotkeyVal = 27
		SetKeyMapOptionValueST(hideHotkeyVal)
	endEvent
endState


state selectednpcST
	event OnMenuOpenST()
		SetMenuDialogOptions(npcList)
		SetMenuDialogStartIndex(selectednpcVal)
	endEvent
	
	event OnMenuAcceptST(int index)
		selectednpcVal = index
		SetMenuOptionValueST(npcList[selectednpcVal])
		ForcePageReset()
	endEvent
endState


state npcFacelightST
	event OnMenuOpenST()
        SetMenuDialogOptions(facelightList)
        SetMenuDialogStartIndex(selectednpcFacelightVal[selectednpcVal])
        SetMenuDialogDefaultIndex(0)
	endEvent
	
	event OnMenuAcceptST(int index)
		selectednpcFacelightVal[selectednpcVal] = index
		SetMenuOptionValueST(facelightList[selectednpcFacelightVal[selectednpcVal]])
		if (selectednpcFacelightVal[selectednpcVal] == 2)
			npc[selectednpcVal].GetActorReference().RemoveSpell(darktargetdummySpell)
			npc[selectednpcVal].GetActorReference().AddSpell(targetdummySpell)
		elseIf (selectednpcFacelightVal[selectednpcVal] == 1)
			npc[selectednpcVal].GetActorReference().RemoveSpell(targetdummySpell)
			npc[selectednpcVal].GetActorReference().AddSpell(darktargetdummySpell)
		elseIf (selectednpcFacelightVal[selectednpcVal] == 0)
			npc[selectednpcVal].GetActorReference().RemoveSpell(targetdummySpell)
			npc[selectednpcVal].GetActorReference().RemoveSpell(darktargetdummySpell)
		endIf
	endEvent
endState


state clearnpcST
	event OnSelectST()
		npc[selectednpcVal].GetActorReference().RemoveSpell(targetdummySpell)
		npc[selectednpcVal].GetActorReference().RemoveSpell(darktargetdummySpell)
		npc[selectednpcVal].Clear()
		ForcePageReset()
	endEvent
endState


state clearallnpcsST
	event OnSelectST()
		int i = 0
		While i < 15
			npc[i].GetActorReference().RemoveSpell(targetdummySpell)
			npc[i].GetActorReference().RemoveSpell(darktargetdummySpell)
			npc[i].Clear()
			i += 1
		EndWhile
		ForcePageReset()
	endEvent
endState
