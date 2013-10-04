Plone User Manual
=================

    With Selenium-automated screenshots

This is a work in progress to create user manual for Plone with fully
automated screenshots. Once all screenshots have been migrated, we refactor
this to support multiple languages (with localized screenshots for free).


Quick start
-----------

0. Bootstrap

   .. code:: bash

      $ python bootstrap.py
      $ bin/buildout

1. Start server

   .. code:: bash

      $ make serve

3. Build docs

   .. code:: bash

      $ make robot

.. toc:: Contents

Introduction
------------

This is a sphinxified version of manually (WYSIWYG) authored Plone User Manual
from plone.org (sphinxification done by Giacomo Spettoli). Let's finish the
work by refactoring screenshots to be generated with our robot testing tools.
That feels like a daunting task at first, but once it's done, it's easy to
tweak those screenshots, re-generate translate them in different languages or
with different themes.

`Robot-refactored screenshots work also as acceptance tests for Plone.`__

__ http://jenkins.plone.org/view/User Docs/job/collective.usermanual/


Rules
-----------------

See an example_.

.. _example: https://raw.github.com/collective/collective.usermanual/robot-screenshots/source/adding-content/adding-pages.rst

1. Each document (separate ``.rst``-file) represents one story for using Plone:
   document starts with a clean Plone site, performs as many *robot tests* as
   required, in written order, to allow capturing the required screenshots,
   and clean up the site at the end.

2. Each document with screenshots should start (after its title) with
   ``.. include:: ../robot.rst`` with correct path pointing to  ``robot.rst``
   file in the root of ``./source``-directory for the documentation. This
   provides all common resources and the lifecycle management described in 1.

3. After ``.. include:: ../robot``-directive, each document may contain as many
   ``.. code:: robotframework`` -directives as required to provide the required
   screenshots. Each ``.. code:: robotframework``-directive should contain a
   complete Robot Framework test suite snippet. Each directive should have
   (slighly magical) ``:class: hidden``-option to hide the test source from
   the produced document. (See also: `sphinxcontrib-robotframework -docs`__.)

4. The document may end with one ``.. robotframework::``-directive listing all
   the generated screenshot files in its ``:creates:``-option. This prevents
   Sphinx from re-generating the screenshots on subsequent builds.

__ http://sphinxcontrib-robotframework.readthedocs.org/en/latest/


How to build
------------

We support two different build modes:

* standalone
* robot-server -dependent.

*Standalone*-build is executed with regular ``make html`` and it can setup
the required Plone sandboxes during the Sphinx compilation process. It's good
for building the complete docs, but is slow to use for writing the robot
code for screenshots

*robot-server*-build requires robot-server to be started with ``make serve``
into foreground of one console, and then builds to be run with ``make robot``
on a different console. It uses one Plone sandbox (with fast reset between
documents) for the whole build, which makes it pretty fast.


How to work on a single document
--------------------------------

0. Cleanup old builds

   .. code:: bash

      $ make clean

1. Start server

   .. code:: bash

      $ make serve

2. Run ``pybot`` for that document

   .. code:: bash

      $ bin/pybot source/adding-content/adding-pages.rst


How to work on a new document
-----------------------------

0. Cleanup old builds

   .. code:: bash

      $ make clean

1. Start server

   .. code:: bash

      $ make serve

2. Insert ``.. include:: ../robot.rst`` into beginning of the document
   (after its title, with correct relative path for ``robot.rst``):

   .. code:: rst

      .. include:: ../robot.rst

3. Find a place for a new / refactored figure in the document and
   write / re-write figure-directive to point to a robot generated
   screenshot:

   .. code:: rst

      .. figure:: ../_robot/document-name_screenshot-name.png
         :alt: My figure
         :align: center

4. Add a new robot test for generating that figure with just a pause
   keyword letting to think it further:

   .. code:: rst

      .. code:: robotframework
         :class: hidden

         *** Test Cases ***

         Show how to write a robot generated image
             Pause

5. Execute the file with *pybot*:

   .. code:: bash

      $ bin/pybot source/adding-content/adding-pages.rst

6. Learn, try, fix, repeat:

   * http://datakurre.pandala.org/2013/09/documentation-plausible-excuse-for.html
   * https://robotframework-selenium2screenshots.readthedocs.org/en/latest/
   * http://rtomac.github.io/robotframework-selenium2library/doc/Selenium2Library.html
   * http://robotframework.googlecode.com/hg/doc/libraries/BuiltIn.html?r=2.8.1
   * http://robotframework.googlecode.com/hg/doc/userguide/RobotFrameworkUserGuide.html?r=2.8.1

   **NOTE**: With *Capture and crop page screenshot*-keyword, please, prefix
   *the filename with ``${CURDIR}/`` (e.g.
   *${CURDIR}/../_robot/working-copy_locked.png). It's required to support both
   *Sphinx and *pybot*.

7. Try the results with sphinx:

   .. code:: bash

      $ make clean robot

8. Add ``.. robotframework::``-directive to prevent re-creating screenshots in
   subsequent builds:

   .. code:: rst

      .. robotframework::
         :creates: ../_robot/document-name_screenshot-name.png


Advanced topics
---------------

1. How to include the default Plone-content?

   .. code:: rst

      .. code:: robotframework

         *** Test Cases ***

         Show Plone default content
             Apply profile  Products.CMFPlone:plone-content
             ...


2. How to set the default language?

   .. code:: rst

      .. code:: robotframework

         *** Test Cases ***

         Show Plone default content
             Set default language  fi
             ...

3. How to create and log in a user?

   See usage of *Create user*, *Enable autologin as* and *Set autologin username*
   keywords in

   https://raw.github.com/collective/collective.usermanual/robot-screenshots/source/robot-standalone.rst

4. How to create sample content?

   See usage of *Create content* and *Do workflow action for* -keywords in

   https://raw.github.com/collective/collective.usermanual/robot-screenshots/source/managing-content/working-copy.rst

5. Where should I define custom keywords?

   In the same document, within any ``.. code:: robotframework``-directive.
   Shared keywords can be defined in
   ``./src/collective/usermanual/keywords.robot``.

6. How to activate custom product?

   See usage of variables *CONFIGURE_PACKAGES* and *APPLY_PROFILES* (also
   *META_PACKAGES*, *OVERRIDE_PACKAGES* and *INSTALL_PACKAGES* are
   available):

   https://raw.github.com/collective/collective.usermanual/robot-screenshots/source/managing-content/working-copy.rst

   **NOTE**: These variables only work when document is built in *standalone*
   *mode. With *robot-server*-mode these can be set only once for all documents
   *with environment variables when starting *robot-server*. See Makefile for
   *examples.


License
-------

Copyright © 2011-2012 Plone Foundation and individual contributors.

This program is free software; you can redistribute it and/or
modify it under the terms of the GNU General Public License
as published by the Free Software Foundation; either version 2
of the License, or (at your option) any later version.
This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
GNU General Public License for more details.
You should have received a copy of the GNU General Public License
along with this program; if not, write to the Free Software
Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301,
USA.
test
