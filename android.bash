# Android bash profile 
# adb shortcuts

alias adb-install="adb install -r"
alias adb-uninstall="adb uninstall"
alias adb-factory-reset="adb reboot bootloader && fastboot -w && fastboot reboot"
alias adb-restart="adb kill-server && adb devices"
alias adb-start-package="adb shell am start"
alias adb-ps="adb shell ps"
alias adb-log="adb logcat -v threadtime | grep -v nativeGetEnabledTags"
alias adb-clear-data="adb shell pm clear"
alias adb-force-stop="adb shell am force-stop"
alias adb-broadcast="adb shell am broadcast -a"
alias adb-list-packages="adb shell pm list packages"
function adb-find-package {
	if [ -z "$1" ]; then
		echo adb-find-package com.package.name
	else
		adb shell pm list packages -f | grep $1
	fi

}

function adb-path-for-package {
	if [ -z "$1" ]; then
		echo get-path-for-package: package-name
	else
		adb shell pm list packages -f | grep $1 | cut -f 1 -d '=' | cut -f 2 -d ':'
	fi
}


function adb-logcat-for-package {
	if [ -z "$1" ]; then
		echo logcat-for-package: package-to-view-logs
	else
		adb-log $(adb-pid-for-package $1)
	fi
}

function adb-info-for-package {
	if [ -z "$1" ]; then
		echo adb-info-for-package com.package.name
	else
		adb shell dumpsys package | awk "/Package \\[$1\\]/ {flag=1; next} /Package \\[.*\\]/ {flag=0} flag {print}"
	fi
}

# process utils
function adb-pid-for-package {
	if [ -z "$1" ]; then 
		echo get-pid-for-package: package-name
	else
		adb shell ps | grep $1 | awk '{ print $2 }'
	fi
}

# apk utils
alias apk-view-badging="aapt dump badging"
alias apk-verify-certs="jarsigner -verify -certs -verbose"
function apk-view-cert {
	if [ -z "$1" ]; then
		echo apk-view-cert: /path/to/apk
	else
		apk-verify-certs $1 | grep CN | head -1
	fi
}

#log utils
alias adb-errors="adb logcat -v threadtime *:E"
alias adb-warns="adb logcat -v threadtime *:W"
alias adb-tag="adb logcat StrictMode:*"


alias adb-log-intel="adb logcat | grep -v \"/hwcomposer\" | grep -v \"/WAKELOCK\" | grep -v \"Thermal\" | grep -v \"/ia_watchdog\" | grep -v \"/dalvikvm\" | grep -v \"/RouteManager\" | grep -v \"/Audio\""
alias adb-log-emulator="adb logcat | grep -v \"/Trace\" | grep -v \"/ExchangeService\""
