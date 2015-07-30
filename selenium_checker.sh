#!/bin/sh

init_notify() {
    user=$LOGNAME
    pids=`pgrep -u $user nautilus`
    for pid in $pids; do
        # find DBUS session bus for this session
        DBUS_SESSION_BUS_ADDRESS=`grep -z DBUS_SESSION_BUS_ADDRESS /proc/$pid/environ | sed -e 's/DBUS_SESSION_BUS_ADDRESS=//'`
        # use it
        export DBUS_SESSION_BUS_ADDRESS=$DBUS_SESSION_BUS_ADDRESS
    done
}

notify() {
    if [ -z "$DBUS_SESSION_BUS_ADDRESS" ]; then
        init_notify
    fi
    
    title=$1
    text=$2
    timeout=$3
    
    if [ -z "$title" ]; then
        return
    fi
    if [ -z "$text" ]; then
        text=$title
    fi
    if [ -z "$timeout" ]; then
        timeout=5000
    fi
    
    notify-send "$title" "$text" -t $timeout
}

# echo "Let's check the latest available Selenium server standalone version."
name_and_version=$(curl -s http://selenium-release.storage.googleapis.com/ | grep -oP 'selenium-server-standalone-.+?(?=.jar)' | tail -1)
last_version=${name_and_version:27}
# echo "The latest available Selenium server standalone version is" $last_version
if [ "$last_version" != "2.47.1" ]; then
    $(notify "Selenium $last_version" "Selenium version $last_version is available" 5000)
fi