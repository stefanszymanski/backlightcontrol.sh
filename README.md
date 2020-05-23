# backlightcontrol.sh

Bash script for controlling display brightness via sysfs and DDC/CI

## Requirements

The script uses either sysfs or `ddcutil` to read and set the brightness of
displays.

## Installation

```
git clone https://github.com/stefanszymanski/backlightcontrol.sh
cd backlightcontrol.sh
make install
```

Per default the script is installed in `$HOME/.local/bin`.
If you want it to be installed in another directory use

```
make PREFIX=/usr/bin install
```

## Configuration

You can set the environment variable `BLCTL_DEVICES` if you want to set
memorable names for your displays.

The configuration for each display consists of three parts and each display
configuration is divived by a semicolon: `name:type:identifier;...`

E.g. `export BLCTL_DEVICES="lvds:sysfs:acpi_video0;hdmi:ddc:3"`

Valid types are `sysfs` and `ddc`. Valid identifiers for `sysfs` are names of
directories in `/sys/class/backlight/`, for `ddc` it's a bus number expected
from the `--bus` argument of `ddcutil`.

## Usage

```
Usage:
    backlightcontrol <command> [arguments...]

Commands:
    set [device] <value>    Set brightness for all of specific display
                            The value must be an integer between 0 and 100
    get [device]            Get brightness for all or specific display
    info [device]           Get info about all or specific display
    help                    Display this help text
```

### Examples

```
export BLCTL_DEVICES="lvds:sysfs:acpi_video0;hdmi:ddc:3"
alias blc="backlightcontrol"

# set all displays to 50%
blc set 50

# set specific display to 50%
blc set hdmi 50

# get for all displays
blc get

# get for specific display
blc get hdmi

# get some info
blc info
blc info hdmi

# use devices that are not configured in $BLCTL_DEVICES
blc get sysfs#acpi_video0
blc set ddc#1 50
blc info ddc#1
```
