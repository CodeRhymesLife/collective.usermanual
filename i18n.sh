#!/bin/bash

bin/i18ndude rebuild-pot --pot src/collective/usermanual/locales/collective.usermanual.pot --merge src/collective/usermanual/locales/manual.pot --create collective.usermanual src/collective/usermanual

bin/i18ndude sync --pot src/collective/usermanual/locales/collective.usermanual.pot src/collective/usermanual/locales/*/LC_MESSAGES/collective.usermanual.po
