MAIN                          -- GRID
  DEFINE entry, w STRING      -- { 
  OPTIONS INPUT WRAP          --   Edit [entry            ]
  OPEN FORM f FROM arg_val(0) --   Webco[w                ]
  DISPLAY FORM f              -- }
  LET entry = "abc" ; DISPLAY entry TO entry
  LET w = "def"     ; DISPLAY w TO w
  MENU "Test"
    COMMAND "Input"
      MESSAGE "Click into the 'WebComponent' field and type something, then click on 'Show Value'"
      INPUT BY NAME entry, w WITHOUT DEFAULTS ATTRIBUTE(UNBUFFERED)
        ON ACTION showvalue ATTRIBUTE(TEXT = "Show Value")
          MESSAGE "entry is:",entry, ",WebComponent is:", w
        ON ACTION showlog ATTRIBUTE(TEXT = "Show Log")
          CALL showLog()
      END INPUT
    COMMAND "Show Log"
      CALL showLog()
    COMMAND "Exit"
      EXIT MENU
  END MENU
END MAIN 

FUNCTION showLog()
  DEFINE ret STRING
  CALL ui.Interface.frontCall(
    "webcomponent", "call", ["formonly.w", "getLogs"], [ret])
  ERROR ret
END FUNCTION
