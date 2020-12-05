import 'dart:io';
import 'dart:typed_data';

import 'package:pigpio_dart/pigpio_dart.dart';
import 'package:test/test.dart';

void main() {
  test('open & close', () {
    print('started ${DateTime.now()}');
    var gpio = GPIO();
    gpio.initialize();
    var modeSuccess = gpio.setMode(16, 1);
    print('mode $modeSuccess');
    var writeSuccess = gpio.write(16, 1);
    print('written $writeSuccess');
    print('ended ${DateTime.now()}');
  });
}
