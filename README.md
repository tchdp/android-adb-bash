android-adb-bash
================

Bash aliases for doing stuff with adb

Actions
```bash
adb-restart #Restarts adb daemon, not the device

adb-install /path/to/file
adb-uninstall com.package.name
adb-clear-data com.package.name
adb-force-stop com.package.name
adb-broadcast intent # i.e. -n com.package.name/.Activity -a ACTION
adb-start-package com.package.name#Starts the default main launcher activity of the packageName
adb-find-package pattern #Greps for packages matching pattern

```
meta data
```bash
adb-ps # ps on the device
adb-list-packages #view list of all installed packages
adb-info-for-package com.package.name # view info about an installed package from dumpsys
adb-pid-for-package com.package.name # find the PID for a given package name
adb-path-for-package com.package.name # find the apk location of a package
```
logging
```bash
adb-log-emulator # my osx emulator spits out a bunch of garbage
adb-errors
adb-warns
adb-tag logtag #view logs from a given tag
adb-logcat-for-package #view logs for a given package
adb-log #just logcat
```
apk utils
```bash
apk-view-badging
apk-verify-certs
apk-view-cert
```

DANGERZONE
```bash
adb-factory-reset #This WILL factory reset your device!
```