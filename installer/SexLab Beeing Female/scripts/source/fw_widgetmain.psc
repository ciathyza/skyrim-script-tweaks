;/ Decompiled by Champollion V1.0.1
Source   : FW_WidgetMain.psc
Modified : 2014-06-29 09:24:21
Compiled : 2014-08-02 20:48:53
User     : Patrick
Computer : MILZSCHNITTE
/;
scriptName FW_WidgetMain extends ski_widgetbase

;-- Properties --------------------------------------
Bool property Visible
	Bool function get()

		return _visible
	endFunction
	function set(Bool a_val)

		_visible = a_val
		if self.Ready
			ui.InvokeBool(self.HUD_MENU, self.WidgetRoot + ".setVisible", _visible)
		endIf
	endFunction
endproperty

;-- Variables ---------------------------------------
String WidgetName = "BeeingFemaleWidget"
Bool _visible = true
Int _count = 0
String _widgetRoot = "BeeingFemaleWidget.swf"

;-- Functions ---------------------------------------

; Skipped compiler generated GetState

; Skipped compiler generated GotoState

String function GetWidgetType()

	return "BeeingFemaleWidget"
endFunction

function OnWidgetReset()

	parent.OnWidgetReset()
	ui.InvokeBool(self.HUD_MENU, self.WidgetRoot + ".setVisible", _visible)
	ui.InvokeInt(self.HUD_MENU, self.WidgetRoot + ".setCount", _count)
endFunction

String function GetWidgetSource()

	return "BeeingFemaleWidget.swf"
endFunction
