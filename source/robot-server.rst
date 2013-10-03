.. code:: robotframework
   :class: hidden

   *** Settings ***

   Resource  plone/app/robotframework/server.robot
   Resource  plone/app/robotframework/keywords.robot

   Resource  Selenium2Screenshots/keywords.robot
   Library  Remote  ${PLONE_URL}/RobotRemote

   Suite Setup  Suite Setup
   Suite Teardown  Suite Teardown

   *** Keywords ***

   Suite Setup
       Remote ZODB SetUp
       ...  collective.usermanual.testing.USERMANUAL_ROBOT_TESTING

       Open test browser
       Set window size  640  1024

       Enable autologin as  Manager
       Create user  jane-doe  Member  fullname=Jane Doe
       Set autologin username  jane-doe

   Suite Teardown
       Remote ZODB TearDown
       ...  collective.usermanual.testing.USERMANUAL_ROBOT_TESTING
       Close all browsers

   Highlight
       [Arguments]  ${locator}
       Update element style  ${locator}  outline  2px dotted red

   Remove highlighting
       [Arguments]  ${locator}
       Update element style  ${locator}  outline  none

   Pause
       Import library  Dialogs
       Pause execution
