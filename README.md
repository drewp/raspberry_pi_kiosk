# raspberry_pi_kiosk

Program to switch a [raspberry pi](https://www.raspberrypi.org/) display on when a motion sensor is
activated, e.g. for a kiosk screen. Written in [Julia](http://julialang.org/) only because I 
wanted to learn Julia today.

Usage
-----

Connect a PIR motion sensor to pin 4 
[like this](http://www.raspberrypi-spy.co.uk/2013/01/cheap-pir-sensors-and-the-raspberry-pi-part-1/).

Install Julia ([notes](https://drewp.quickwitretort.com/2016/04/30/0)).

Run this:

```
DISPLAY=:0.0 ~/julia/julia pir_screen.jl 4 300
```

The display will now turn off after 300 seconds of non-motion.

Based on
http://www.ofbrooklyn.com/2014/01/2/building-photo-frame-raspberry-pi-motion-detector/

License (MIT)
-------------

The MIT License (MIT)
Copyright (c) 2016 Drew Perttula

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
