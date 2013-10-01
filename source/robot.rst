.. code:: robotframework
   :class: hidden

   *** Settings ***

   Resource  plone/app/robotframework/server.robot
   Resource  plone/app/robotframework/keywords.robot

   Library  Selenium2Screenshots

   Suite Setup  Run keywords  Suite Setup  Test Setup
   Suite Teardown  Suite Teardown

   *** Keywords ***

   Suite Setup
       Setup Plone site  collective.usermanual.testing.USERMANUAL_ROBOT_TESTING
       Set window size  640  1024

   Test Setup
       Import library  Remote  ${PLONE_URL}/RobotRemote
       Enable autologin as  Site Administrator
       Set autologin username  test-user-1

   Test Teardown
       Set Zope layer  collective.usermanual.testing.USERMANUAL_ROBOT_TESTING
       ZODB TearDown
       ZODB SetUp

   Suite Teardown
       Teardown Plone Site

   Highlight
       [Arguments]  ${locator}
       Update element style  ${locator}  outline  2px dotted red

   Remove highlighting
       [Arguments]  ${locator}
       Update element style  ${locator}  outline  none

   Pause
       Import library  Dialogs
       Pause execution
