# backlightcontrol.sh

Bash script for controlling display brightness via sysfs and DDC/CI

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

WIP

Set environment variable `BLCTL_DEVICES`.

E.g. `export BLCTL_DEVICES="lvds:sysfs:acpi_video0;hdmi:ddc:1"`

Pattern is `name:type:identifier;...`

## Usage

WIP

```
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
# instead of providing a configured name, use `type#identifier`
blc get sysfs#acpi_video0
blc set ddc#1 50
blc info ddc#1
```
