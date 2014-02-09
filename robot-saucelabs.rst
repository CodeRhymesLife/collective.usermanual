.. code:: robotframework
   :class: hidden

   *** Settings ***

   Resource  plone/app/robotframework/server.robot
   Resource  plone/app/robotframework/keywords.robot
   Resource  plone/app/robotframework/saucelabs.robot
   Resource  Selenium2Screenshots/keywords.robot

   Suite Setup  Run keywords  Suite Setup  Test Setup
   Suite Teardown  Suite Teardown

   *** Variables ***

   ${OPEN_BROWSER_KEYWORD}  Open SauceLabs test browser

   *** Keywords ***

   Suite Setup
       Set suite variable  ${SUITE_NAME}  User Manual
       Set suite variable  ${TEST_NAME}  Screencast

       Setup Plone site  plone.app.robotframework.PLONE_ROBOT_TESTING
       Set window size  640  1024

   Test Setup
       Import library  Remote  ${PLONE_URL}/RobotRemote
       Set default language
       Enable autologin as  Manager
       ${user_id} =  Translate  user_id
       ...  default=jane-doe
       ${user_fullname} =  Translate  user_fullname
       ...  default=Jane Doe
       Create user  ${user_id}  Member  fullname=${user_fullname}
       Set autologin username  ${user_id}

   Test Teardown
       Set Zope layer  plone.app.robotframework.PLONE_ROBOT_TESTING
       ZODB TearDown
       ZODB SetUp

   Suite Teardown
       ${TEST_TAGS} =  Create list  screenshots
       Set suite variable  ${SUITE_NAME}  User Manual
       Set suite variable  ${TEST_NAME}  Screencast
       Set suite variable  ${TEST_STATUS}  ${PREV_TEST_STATUS}
       Set suite variable  ${TEST_TAGS}  ${TEST_TAGS}
       Report test status

       Teardown Plone Site
