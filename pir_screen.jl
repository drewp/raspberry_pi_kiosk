type ScreenPower
    current::Nullable{Bool}
end
ScreenPower() = ScreenPower(Nullable{Bool}())

function setOn(power::ScreenPower)
    if !get(power.current, false)
        run(`tvservice -p`)
        sleep(.5)
        run(`xset dpms force on`)
        power.current = true
    end
end

function setOff(power::ScreenPower)
    if get(power.current, true)
        run(`tvservice -o`)
        power.current = false
    end
end



@enum(Direction, IN, OUT)

immutable Gpio
    pin
    gpio_dir

    function Gpio(pin, direction::Direction=IN)
        write("/sys/class/gpio/export", dec(pin))
        g = new(pin, "/sys/class/gpio/gpio$pin/")
        retry(() -> write(joinpath(g.gpio_dir, "direction"),
                          lowercase(string(direction))))
        return g
    end
end

function getState(gpio::Gpio)
    f = open(joinpath(gpio.gpio_dir, "value"))
    parse(Int, strip(readstring(f)))
end



function main(motionSensorGpioPin::Int, minimumScreenOnTime::Dates.Second)
    run(`xset s off`)
    run(`xset dpms 0 0 0`)
    gpio = Gpio(motionSensorGpioPin)
    power = ScreenPower()

    info("watching pin ", gpio.pin)
    lastMotionTime = now()
    while true
        motion = getState(gpio) == 1
        if motion
            lastMotionTime = now()
        end

        if now() - lastMotionTime < minimumScreenOnTime
            setOn(power)
        else
            setOff(power)
        end
        sleep(1)
    end
end
main(parse(Int, ARGS[1]), Dates.Second(parse(Float64, ARGS[2])))
