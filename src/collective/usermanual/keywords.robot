*** Variables ***

${DOMAIN}  collective.usermanual
@{CONFIGURE_PACKAGES}  collective.usermanual  plone.app.iterate

*** Keywords ***

Highlight
   [Arguments]  ${locator}
   Update element style  ${locator}  outline  2px dotted red

Remove highlighting
   [Arguments]  ${locator}
   Update element style  ${locator}  outline  none
