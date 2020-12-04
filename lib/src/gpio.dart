import 'package:pigpio_dart/src/dylib.dart';

import 'dylib.dart';

/// PiGpio.
abstract class GPIO {
  factory GPIO() => _GPIOImpl();

  int initialize();
  void terminate();
  int setMode(int gpio, int mode);
  int getMode(int gpio);
  int read(int gpio);
  int write(int gpio, int level);
  int pwm(int gpio, int dutyCycle);
  int getPwmDutyCycle(int gpio);
  int setPwmRange(int gpio, int range);
  int getPwmRange(int gpio);
  int getPwmRealRange(int gpio);
  int setPwmFrequency(int gpio, int frequency);
  int getPwmFrequency(int gpio);
}

class _GPIOImpl implements GPIO {
  _GPIOImpl();

  @override
  int initialize() {
    return dylib.gpioInitialise();
  }

  @override
  void terminate() {
    dylib.gpioTerminate();
  }

  @override
  int setMode(gpio, mode) {
    return dylib.gpioSetMode(gpio, mode);
  }

  @override
  int getMode(gpio) {
    return dylib.gpioGetMode(gpio);
  }

  @override
  int read(int gpio) {
    return dylib.gpioRead(gpio);
  }

  @override
  int write(int gpio, int level) {
    return dylib.gpioWrite(gpio, level);
  }

  @override
  int getPwmDutyCycle(int gpio) {
    return dylib.gpioGetPWMdutycycle(gpio);
  }

  @override
  int pwm(int gpio, int dutyCycle) {
    return dylib.gpioPWM(gpio, dutyCycle);
  }

  @override
  int setPwmRange(int gpio, int range) {
    return dylib.gpioSetPWMrange(gpio, range);
  }

  @override
  int getPwmFrequency(int gpio) {
    return dylib.gpioGetPWMfrequency(gpio);
  }

  @override
  int getPwmRange(int gpio) {
    return dylib.gpioGetPWMrange(gpio);
  }

  @override
  int getPwmRealRange(int gpio) {
    return dylib.gpioGetPWMrealRange(gpio);
  }

  @override
  int setPwmFrequency(int gpio, int frequency) {
    return dylib.gpioSetPWMfrequency(gpio, frequency);
  }
}
