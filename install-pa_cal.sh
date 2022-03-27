#!/bin/bash
KCONFIG_PATH="${HOME}/klipper_config"

link_macros()
{
    echo "Linking macros to Klipper..."
    ln -sf "${SRCDIR}/pa_cal.cfg" "${KCONFIG_PATH}/pa_cal.cfg"
}

# Step 3: configure moonraker
configure_moonraker()
{
    echo -e "Adding update manager to moonraker.conf"
    update_section=$(grep -c '\[update_manager pa_cal\]' \
    ${KCONFIG_PATH}/moonraker.conf || true)
    if [ "${update_section}" -eq 0 ]; then
        echo -e "\n" >> ${KCONFIG_PATH}/moonraker.conf
        while read -r line; do
            echo -e "${line}" >> ${KCONFIG_PATH}/moonraker.conf
        done < "${SCRIPTDIR}/file_templates/moonraker_update.txt"
        echo -e "\n" >> ${KCONFIG_PATH}/moonraker.conf
    else
        echo -e "[update_manager pa_cal] already exist in moonraker.conf [SKIPPED]"
    fi
}

# Step 4: restarting Klipper
restart_klipper()
{
    echo "Restarting Klipper..."
    sudo systemctl restart klipper
}

# Helper functions
verify_ready()
{
    if [ "$EUID" -eq 0 ]; then
        echo "This script must not run as root"
        exit -1
    fi
}

# Force script to exit if an error occurs
set -e

# Find SRCDIR from the pathname of this script
SCRIPTDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )"/ && pwd )"
SRCDIR="${SCRIPTDIR}/src/"

# Parse command line arguments
while getopts "k:" arg; do
    case $arg in
        k) KCONFIG_PATH=$OPTARG;;
    esac
done

# Run steps
verify_ready
link_macros
configure_moonraker
restart_klipper
