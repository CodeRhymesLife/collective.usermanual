*** Keywords ***

Pause
   Import library  Dialogs
   Pause execution

Highlight
   [Arguments]  ${locator}
   Update element style  ${locator}  outline  2px dotted red

Remove highlighting
   [Arguments]  ${locator}
   Update element style  ${locator}  outline  none
