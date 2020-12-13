import 'dart:ffi' as ffi;
import 'dart:io';

import 'package:pigpio/src/bindings.dart';

LibPiGpio? _dylib;
LibPiGpio get dylib => _dylib ?? LibPiGpio(LibraryLoader.load());

extension StringWith on String {
  String prefixWith(String prefix) {
    if (isEmpty || startsWith(prefix)) return this;
    return prefix + this;
  }

  String suffixWith(String suffix) {
    if (isEmpty || endsWith(suffix)) return this;
    return this + suffix;
  }
}

class LibraryLoader {
  static String fixupPath(String path) => path.suffixWith('/');

  static bool isFile(String path) {
    return path.isNotEmpty &&
        Directory(path).statSync().type == FileSystemEntityType.file;
  }

  static String resolvePath() {
    final path = String.fromEnvironment(
      'PIGPIO_PATH',
      defaultValue: Platform.environment['PIGPIO_PATH'] ?? '',
    );
    if (isFile(path)) return path;
    return fixupPath(path) + 'libpigpio.so';
  }

  static ffi.DynamicLibrary load() => ffi.DynamicLibrary.open(resolvePath());
}
