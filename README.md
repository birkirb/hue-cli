hue-cli
=======

Command Line Interface to the Philips Hue lighting system.

# Installation
To begin using, install the ruby gem (this requires ruby 1.9 and rubygems)

```
$ gem install hue-cli
```

This will install the "hue" command.

# Usage

To check the bridge state, simply type 

```
$ hue
```

If this is the first time the command is run, it will scan for bridges on the network and attempt to register the application. Follow the on-screen instructions to do so.

## Register

You can also explicity register the application with

```
$ hue register
```

## Bridge state

Once registered, examine the current state of the bridge.

```
$ hue
Philips Hue
Button pressed: false
Timestamp: 2013-09-02T17:44:10
Network configuration:
  IP:      196.168.0.1
  Gateway: 196.168.0.255
  Mask:    255.255.255.0
  DHCP:    true
  MAC:     00:00:00:00:00:00
  Proxy:   none:0
Applications:
  073f2ed95fcbbef2532c751dd404cc9d : hue-cli
Lights:
  1. Living Overhead - OFF
  2. Living Cabinet - OFF
  3. Living Corner Lamp - OFF
```

## Lights state

### Examine or operate on all lights.

```
$ hue lights
1.  Bedroom - Overhead: ON
    Brightness: 254 (100%)
    Color: XY=[0.6736, 0.3221], RGB\u2248[255, 60, 40]
2.  Living Room - Cabinet: OFF
    Brightness: 142 (56%)
    Color: XY=[0.674, 0.322], RGB\u2248[255, 60, 40]
3.  Living Room - Overhead: ON
    Brightness: 254 (100%)
    Color: Temperature=2710°K (369 mired), RGB\u2248[255, 166, 87]
```

### Find new lights.

```
$ hue lights find
```
## Light state

Examine the state of a single light

```
$ hue light 1
```

or just 

```
$ hue 1
1.  Bedroom - Overhead: ON
    Brightness: 254 (100%)
    Color: XY=[0.6736, 0.3221], RGB\u2248[255, 60, 40]
```

### Change Light state

Change a single light state with the follow (rather self-explanatory) commands

```
$ hue 1 on
$ hue 1 off
$ hue 1 flash
$ hue 1 blink
$ hue 1 solid
```

### Brightness

Brightness can be set with a value (0-255) or percentage (0%-100%)

```
$ hue 1 brightness 200
$ hue 1 brightness 50%
$ hue 1
Living Overhead: ON
Brightness: 128 (50%)
Color: Temperature=2012°K (497 mired), RGB≈[255, 136, 13]
```

### Color

The color command takes 1-3 arguments, each interpreted depending on range and value.

Set to 6500 Kelvin.

```
$ hue 1 color 6500 
$ hue 1
Living Overhead: ON
Brightness: 128 (50%)
Color: Temperature=6500°K (153 mired), RGB≈[255, 254, 250]
```

Set to 240 mired.

```
$ hue 1 color 240
$ hue 1
Living Overhead: ON
Brightness: 128 (50%)
Color: Temperature=4167°K (240 mired), RGB≈[255, 208, 170]
```

Set the hue and saturation.

```
$ hue 1 color 30000 255
$ hue 1
Living Overhead: ON
Brightness: 128 (50%)
Color: Hue=30000, Saturation=255, RGB≈[0, 255, 190]
```

Set the XY

```
$ hue 1 color 0.25 0.25
$ hue 1
Living Overhead: ON
Brightness: 128 (50%)
Color: Hue=30000, Saturation=255, RGB≈[0, 255, 190]
```
## Set all lights.

All the single light state commands can be applied to all lights.

```
$ hue lights brightness 50%
```
