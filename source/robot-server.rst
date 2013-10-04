.. code:: robotframework
   :class: hidden

   *** Settings ***

   Resource  plone/app/robotframework/server.robot
   Resource  plone/app/robotframework/keywords.robot
   Resource  collective/usermanual/keywords.robot
   Resource  Selenium2Screenshots/keywords.robot

   Library  Remote  ${PLONE_URL}/RobotRemote

   Suite Setup  Run keywords  Suite Setup  Test Setup
   Suite Teardown  Run keywords  Test Teardown  Suite Teardown

   *** Keywords ***

   Suite Setup
       Open test browser
       Set window size  640  1024

    Test Setup
       Remote ZODB SetUp
       ...  collective.usermanual.testing.USERMANUAL_ROBOT_TESTING

       Enable autologin as  Manager
       Create user  jane-doe  Member  fullname=Jane Doe
       Set autologin username  jane-doe

   Test Teardown
       Remote ZODB TearDown
       ...  collective.usermanual.testing.USERMANUAL_ROBOT_TESTING

   Suite Teardown
       Close all browsers
