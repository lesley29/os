#!/bin/bash
grep "^ACPI*" /var/log/* -shr > ./errors.log
grep -E "(\/[[:alnum:]]+)+\.[[:alpha:]]+" ./errors.log