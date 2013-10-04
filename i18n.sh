#!/bin/bash

bin/pybabel extract source -o src/collective/usermanual/locales/collective.usermanual.pot

bin/i18ndude sync --pot src/collective/usermanual/locales/collective.usermanual.pot src/collective/usermanual/locales/*/LC_MESSAGES/collective.usermanual.po
