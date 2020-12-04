# Serial Port for Dart

[![pub](https://img.shields.io/pub/v/pigpio_dart.svg)](https://pub.dev/packages/pigpio_dart)
![CI](https://github.com/jpnurmi/pigpio_dart/workflows/CI/badge.svg)
[![license: LGPL3+](https://img.shields.io/badge/license-LGPL3+-magenta.svg)](https://opensource.org/licenses/LGPL-3.0)

| **TIP:** See also [`flutter_serial_port`](https://github.com/jpnurmi/flutter_serial_port) for automatic building and deploying of libserialport. |
| --- |

`pigpio_dart` is based on [`libserialport`](https://sigrok.org/wiki/Libserialport),
which is a minimal C-library created by the [sigrok](https://sigrok.org/) project, and
released under the LGPL3+ license. 

Supported platforms:
- Linux
- macOS
- Windows
- Android

`pigpio_dart` uses [dart:ffi](https://dart.dev/guides/libraries/c-interop) to call
`libserialport`'s C APIs, which implies that `libserialport` must be bundled to or deployed
with the host application. It can be tedious to build and deploy `libserialport` on all target
platforms, but in case you are building a Flutter app instead of a pure Dart app, there is
a ready-made drop-in solution called [`flutter_serial_port`](https://github.com/jpnurmi/flutter_serial_port)
that utilizes Flutter's build system to build and deploy `libserialport` on all supported platforms:

## Usage

```dart
import 'package:pigpio_dart/pigpio_dart.dart';

final name = SerialPort.availablePorts.first;
final port = SerialPort(name);
if (!port.openReadWrite()) {
  print(SerialPort.lastError);
  exit(-1);
}

port.write(/* ... */);

final reader = SerialPortReader(port);
reader.stream.listen((data) {
  print('received: $data');
});
```

To use this package, add `pigpio_dart` as a [dependency in your pubspec.yaml file](https://dart.dev/tools/pub/dependencies).
