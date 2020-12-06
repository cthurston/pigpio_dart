import 'package:pigpio_dart/src/dylib.dart';

import 'dylib.dart';

/// PiGpio.
abstract class GPIO {
  factory GPIO() => _GPIOImpl();

  int initialize();
  void terminate();
  // Basic
  int setMode(int gpio, int mode);
  int getMode(int gpio);
  int read(int gpio);
  int write(int gpio, int level);
  int setPullUpDown(int gpio, int pud);
  // PWM
  int pwm(int gpio, int dutyCycle);
  int getPwmDutyCycle(int gpio);
  int setPwmRange(int gpio, int range);
  int getPwmRange(int gpio);
  int getPwmRealRange(int gpio);
  int setPwmFrequency(int gpio, int frequency);
  int getPwmFrequency(int gpio);
  // Servo
  int servo(int gpio, int pulseWidth);
  int getServoPulseWidth(int gpio);
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
  int read(gpio) {
    return dylib.gpioRead(gpio);
  }

  @override
  int write(gpio, level) {
    return dylib.gpioWrite(gpio, level);
  }

  @override
  int setPullUpDown(gpio, pud) {
    return dylib.gpioSetPullUpDown(gpio, pud);
  }

  @override
  int getPwmDutyCycle(gpio) {
    return dylib.gpioGetPWMdutycycle(gpio);
  }

  @override
  int pwm(gpio, dutyCycle) {
    return dylib.gpioPWM(gpio, dutyCycle);
  }

  @override
  int setPwmRange(gpio, range) {
    return dylib.gpioSetPWMrange(gpio, range);
  }

  @override
  int getPwmFrequency(gpio) {
    return dylib.gpioGetPWMfrequency(gpio);
  }

  @override
  int getPwmRange(gpio) {
    return dylib.gpioGetPWMrange(gpio);
  }

  @override
  int getPwmRealRange(gpio) {
    return dylib.gpioGetPWMrealRange(gpio);
  }

  @override
  int setPwmFrequency(gpio, frequency) {
    return dylib.gpioSetPWMfrequency(gpio, frequency);
  }

  @override
  int getServoPulseWidth(gpio) {
    return dylib.gpioGetServoPulsewidth(gpio);
  }

  @override
  int servo(gpio, pulseWidth) {
    return dylib.gpioServo(gpio, pulseWidth);
  }
}
