hue-cli
=======

Command Line Interface to the Philips Hue lighting system.

# Installation
To begin using, install the ruby gem (this requires ruby 1.9 and rubygems)

```
$ gem install hue-cli
```

# Usage

This install the hue command. Simply type 

```
$ hue
```

and the bridge state will be verified. Follow the instructions to register the application with your bridge.

## Register

You can explicity register the application with

```
$ hue register
```

## Bridge state

Examine the current state of the bridge

```
$ hue
Philips Hue
IP: 196.168.0.1
Button pressed: false
Applications:
  073f2ed95fcbbef2532c751dd404cc9d : hue-cli
Lights:
  1. Living Overhead - OFF
  2. Living Cabinet - OFF
  3. Living Corner Lamp - OFF
```

## Light state

Examine the state of one of the lights

```
$ hue lights 1
```

or just 

```
$ hue 1
Living Overhead: ON
Brightness: 254 (100%)
Color: Temperature=2012°K (497 mired), RGB≈[255, 136, 13]
```

## Change Light state

Change a single lights state with the follow (rather self-explanatory) commands

```
$ hue 1 on
$ hue 1 off
$ hue 1 flash
$ hue 1 blink
$ hue 1 solid
```

### Light brightness

The lights brightness command takes a value (0-255) or percentage (0%-100%)
```
$ hue 1 brightness 200
$ hue 1 brightness 50%
$ hue 1
Living Overhead: ON
Brightness: 128 (50%)
Color: Temperature=2012°K (497 mired), RGB≈[255, 136, 13]
```

### Light color

The lights color command takes 1-3 arguments, each interpreted depending on range and value.

```
$ hue 1 color 6500
$ hue 1
Living Overhead: ON
Brightness: 128 (50%)
Color: Temperature=6500°K (153 mired), RGB≈[255, 254, 250]
```

```
$ hue 1 color 240
$ hue 1
Living Overhead: ON
Brightness: 128 (50%)
Color: Temperature=4167°K (240 mired), RGB≈[255, 208, 170]
```

```
$ hue 1 color 30000 255
$ hue 1
Living Overhead: ON
Brightness: 128 (50%)
Color: Hue=30000, Saturation=255, RGB≈[0, 255, 190]
```

## More coming...
