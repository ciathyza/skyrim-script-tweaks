.info
  .source "MorSDefaultMessageBox.psc"
  .modifyTime 1408799620
  .compileTime 1408799622
  .user "Darkfox127"
  .computer "DARKFOX127-PC"
.endInfo
.userFlagsRef
  .flag conditional 1
  .flag hidden 0
.endUserFlagsRef
.objectTable
  .object MorSDefaultMessageBox ObjectReference
    .userFlags 0
    .docString ""
    .autoState 
    .variableTable
      .variable ::MyMessage_var message
        .userFlags 0
        .initialValue None
      .endVariable
    .endVariableTable
    .propertyTable
	  .property MyMessage Message auto
	    .userFlags 0
	    .docString ""
	    .autoVar ::MyMessage_var
	  .endProperty
    .endPropertyTable
    .stateTable
      .state
        .function GetState
          .userFlags 0
          .docString "Function that returns the current state"
          .return String
          .paramTable
          .endParamTable
          .localTable
          .endLocalTable
          .code
            RETURN ::state
          .endCode
        .endFunction
        .function GotoState
          .userFlags 0
          .docString "Function that switches this object to the specified state"
          .return None
          .paramTable
            .param newState String
          .endParamTable
          .localTable
            .local ::NoneVar None
          .endLocalTable
          .code
            CALLMETHOD onEndState self ::NoneVar
            ASSIGN ::state newState
            CALLMETHOD onBeginState self ::NoneVar
          .endCode
        .endFunction
        .function OnActivate 
          .userFlags 0
          .docString ""
          .return NONE
          .paramTable
            .param akActionRef ObjectReference
          .endParamTable
          .localTable
            .local ::temp0 int
          .endLocalTable
          .code
            CALLMETHOD Show ::MyMessage_var ::temp0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 ;@line 6
          .endCode
        .endFunction
      .endState
    .endStateTable
  .endObject
.endObjectTable