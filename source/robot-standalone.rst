.. code:: robotframework
   :class: hidden

   *** Settings ***

   Resource  plone/app/robotframework/server.robot
   Resource  plone/app/robotframework/keywords.robot
   Resource  collective/usermanual/keywords.robot
   Resource  Selenium2Screenshots/keywords.robot

   Suite Setup  Run keywords  Suite Setup  Test Setup
   Suite Teardown  Suite Teardown

   *** Keywords ***

   Suite Setup
       Setup Plone site  collective.usermanual.testing.USERMANUAL_ROBOT_TESTING
       Set window size  640  1024

   Test Setup
       Import library  Remote  ${PLONE_URL}/RobotRemote
       Enable autologin as  Manager
       Create user  jane-doe  Member  fullname=Jane Doe
       Set autologin username  jane-doe

   Test Teardown
       Set Zope layer  collective.usermanual.testing.USERMANUAL_ROBOT_TESTING
       ZODB TearDown
       ZODB SetUp

   Suite Teardown
       Teardown Plone Site
