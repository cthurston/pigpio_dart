import 'dart:ffi' as ffi;
import 'package:pigpio_dart/src/dylib.dart';
import 'package:pigpio_dart/src/util.dart';
import 'package:ffi/ffi.dart' as ffi;

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
  // SPI
  int spiOpen(int spiChan, int baud, int spiFlags);
  int spiClose(int handle);
  String spiRead(int handle, int count);
  int spiWrite(int handle, String buf, int count);
  String spiXfer(int handle, String txBuf, int count);
  // Serial
  int serOpen(String sertty, int baud);
  int serClose(int handle);
  int serWriteByte(int handle, int bVal);
  int serReadByte(int handle);
  int serWrite(int handle, String str, int count);
  String serRead(int handle, int count);
  int serDataAvailable(int handle);
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

  @override
  int serOpen(String sertty, int baud) {
    var sp = Util.toUtf8(sertty);
    var flags = 0; // This is not implemented in the lib yet.
    return dylib.serOpen(sp, baud, flags);
  }

  @override
  int serClose(int handle) {
    return dylib.serClose(handle);
  }

  @override
  String serRead(int handle, int count) {
    var ptr = ffi.allocate<ffi.Int8>(count: count);
    dylib.serRead(handle, ptr, count);
    var res = Util.fromUtf8(ptr);
    ffi.free(ptr);
    return res;
  }

  @override
  int serReadByte(int handle) {
    return dylib.serReadByte(handle);
  }

  @override
  int serWrite(int handle, String str, int count) {
    var buf = Util.toUtf8(str);
    return dylib.serWrite(handle, buf, count);
  }

  @override
  int serWriteByte(int handle, int bVal) {
    return dylib.serWriteByte(handle, bVal);
  }

  @override
  int serDataAvailable(int handle) {
    return dylib.serDataAvailable(handle);
  }

  @override
  int spiClose(int handle) {
    return dylib.spiClose(handle);
  }

  @override
  int spiOpen(int spiChan, int baud, int spiFlags) {
    return dylib.spiOpen(spiChan, baud, spiFlags);
  }

  @override
  String spiRead(int handle, int count) {
    var ptr = ffi.allocate<ffi.Int8>(count: count);
    dylib.serRead(handle, ptr, count);
    var res = Util.fromUtf8(ptr);
    ffi.free(ptr);
    return res;
  }

  @override
  int spiWrite(int handle, String str, int count) {
    var buf = Util.toUtf8(str);
    return dylib.spiWrite(handle, buf, count);
  }

  @override
  String spiXfer(int handle, String str, int count) {
    var txBuf = Util.toUtf8(str);
    var rxBuf = ffi.allocate<ffi.Int8>(count: count);
    dylib.spiXfer(handle, txBuf, rxBuf, count);
    var res = Util.fromUtf8(rxBuf);
    ffi.free(rxBuf);
    return res;
  }
}
