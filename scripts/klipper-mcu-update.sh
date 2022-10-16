#!/bin/bash
if [ "$EUID" -ne 0 ]
  then echo "ERROR: This script should be run as root"
  exit
fi

update_rpi() {
    echo "Updating RPi"
    /home/pi/klipper_config/config/boards/rpi/make-and-flash-mcu.sh
}

update_skr_pro_12() {
    if [[ -h "/dev/btt-skr-pro-12" ]]
    then
        echo "SKR Pro v1.2 detected"
        /home/pi/klipper_config/config/boards/btt-skr-pro-12/make-and-flash-mcu.sh
    fi
}
# Force script to exit if an error occurs
set -e

# Run make scripts for the supported boards.
update_rpi
update_skr_pro_12
