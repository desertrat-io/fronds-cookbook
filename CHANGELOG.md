# fronds CHANGELOG

This file is used to list changes made in each version of the fronds cookbook.

# 0.1.0

Initial release.

## 0.2.0

- updated certificate email
- updated repository emails
- PHP switched to FPM
- removed PHP cookbook, no longer needed. The Ondrej PPA provides whatever we need.
- updated self signed cert generation to use the proper chef resource
- upgrade php to 7.4
- minor vagrant file updates
- a few rubocop fixes
- easier configuration of php versions
- removed openssl-source dependency, using chef provided version
- getting ready to support rhel distros