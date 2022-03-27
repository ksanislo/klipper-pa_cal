# klipper-pa_cal

Place the pa_cal.cfg into your klipper_config directory, and optionally the saved_variables.cfg file as well.
Then add these sections to your existing printer.cfg file.

>[include pa_cal.cfg]
>
>[save_variables]<br>
>filename: ~/klipper_config/saved_variables.cfg

# PA_CAL macro for Klipper

## Description

This is a klipper macro which performs the "lines" style pressure advance test.


## Disclaimer
**This is work in progress and currently in "alpha" state.**

If you encounter any problems, feel free to open an issue.

If you want to help by testing or contributing, please contact me on Discord: ksanislo#2507

## Installation

The module can be installed into a existing Klipper installation with an install script. 

    cd ~
    git clone https://github.com/ksanislo/klipper-pa_cal.git
    cd klipper-pa_cal
    ./install-pa_cal.sh

## Configuration

Documentation can be found [here](docs/PA_CAL.md).

