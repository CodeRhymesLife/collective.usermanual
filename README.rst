Introduction
============

Welcome to try


Getting started
---------------

1. Bootstrap

.. code:: bash

   $ python bootstrap.py
   $ bin/buildout

2. Start server

.. code:: bash

   $ CONFIGURE_PACKAGES=plone.app.iterate APPLY_PROFILES=plone.app.iterate:plone.app.iterate bin/robot-server collective.usermanual.
testing.USERMANUAL_ROBOT_TESTING -v

3. Build docs

.. code:: bash

   $ make robot

Standalone build
----------------

.. code:: bash

   $ make html

Resetting generated screenshots
-------------------------------

.. code:: bash

   $ rm source/_robot/*.png

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
