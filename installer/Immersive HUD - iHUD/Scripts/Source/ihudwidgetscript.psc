Scriptname iHUDWidgetScript extends Quest

import iHUDUtilityScript

; -------------------------------------------------------------------------------------------------
; Properties
; -------------------------------------------------------------------------------------------------

GlobalVariable Property iHUDWidgetActiveEffectsOnAlways Auto
GlobalVariable Property iHUDWidgetActiveEffectsOnCombat Auto
GlobalVariable Property iHUDWidgetActiveEffectsOnKey    Auto
GlobalVariable Property iHUDWidgetLinkAll               Auto


; -------------------------------------------------------------------------------------------------
; Variables
; -------------------------------------------------------------------------------------------------

Actor player
bool isVisible
bool widgetsAvailable
float currentAlpha
string widgetRootActiveEffects


; -------------------------------------------------------------------------------------------------
; Functions
; -------------------------------------------------------------------------------------------------

Function initialize()
		widgetsAvailable = false
		widgetRootActiveEffects = ""
		int skiWidgetManagerFormId = 0x00000824

		if (Game.GetFormFromFile(skiWidgetManagerFormId, "SkyUI.esp") == none)
			return
		endif

		player = Game.GetPlayer()
		if (player == none)
			return
		endif

		setiHUDBool("_root.WidgetContainer", "_visible", true)
		SKI_WidgetManager skiWidgetManager = Game.GetFormFromFile(skiWidgetManagerFormId, "SkyUI.esp") as SKI_WidgetManager

		if (skiWidgetManager)
			SKI_WidgetBase[] widgets = skiWidgetManager.GetWidgets()

			if (widgets == none)
				return
			endif

			widgetsAvailable = true

			int i = 0
			while (i < widgets.length && widgetRootActiveEffects == "")
				if (widgets[i] != none)
					if (widgets[i].GetWidgetType() == "ski_activeeffectswidget")
						widgetRootActiveEffects = widgets[i].WidgetRoot
						setiHUDBool(widgetRootActiveEffects, "_visible", true)
					endif
				endif
				i += 1
			endWhile
		endif
EndFunction


Function processWidget(bool toggleOn)
	if (player == none)
		player = Game.GetPlayer()
		return
	endif

	if (widgetsAvailable == false)
		return
	endif

	isVisible = isWidgetActiveEffectsVisible(toggleOn)
	currentAlpha = calculateAlpha(isVisible)

	if (iHUDWidgetLinkAll.GetValueInt())
		setiHUDBool("_root.WidgetContainer", "_visible", isVisible)
	else
		setiHUDBool(widgetRootActiveEffects, "_visible", isVisible)
	endif
EndFunction


bool Function isWidgetActiveEffectsVisible(bool toggleOn)
	return iHUDWidgetActiveEffectsOnAlways.getValueInt() || (toggleOn && iHUDWidgetActiveEffectsOnKey.getValueInt()) || (player.isInCombat() && iHUDWidgetActiveEffectsOnCombat.getValueInt())
EndFunction


float Function calculateAlpha(bool visible)
	return calculateBaseHUDAlpha(visible, 100)
EndFUnction
