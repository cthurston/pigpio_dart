import 'dart:ffi' as ffi;
import 'dart:typed_data';

import 'package:ffi/ffi.dart' as ffi;

typedef UtilFunc<T extends ffi.NativeType> = int Function(ffi.Pointer<T> ptr);

class Util {
  // static void call(Function func) {
  //   if (func() < sp_return.SP_OK && SerialPort.lastError.errorCode != 0) {
  //     throw SerialPort.lastError;
  //   }
  // }

  static Uint8List read(int bytes, UtilFunc<ffi.Uint8> readFunc) {
    final ptr = ffi.allocate<ffi.Uint8>(count: bytes);
    var len = 0;
    // call(() => len = readFunc(ptr));
    final res = Uint8List.fromList(ptr.asTypedList(len));
    ffi.free(ptr);
    return res;
  }

  static int write(Uint8List bytes, UtilFunc<ffi.Uint8> writeFunc) {
    final len = bytes.length;
    final ptr = ffi.allocate<ffi.Uint8>(count: len);
    ptr.asTypedList(len).setAll(0, bytes);
    var res = 0;
    // call(() => res = writeFunc(ptr));
    ffi.free(ptr);
    return res;
  }

  static String fromUtf8(ffi.Pointer<ffi.Int8> str) {
    if (str.address == 0x0) return null;
    return ffi.Utf8.fromUtf8(str.cast<ffi.Utf8>());
  }

  static ffi.Pointer<ffi.Int8> toUtf8(String str) {
    return ffi.Utf8.toUtf8(str).cast<ffi.Int8>();
  }

  static int toInt(UtilFunc<ffi.Int32> getFunc) {
    final ptr = ffi.allocate<ffi.Int32>();
    // call(() => getFunc(ptr));
    final value = ptr.value;
    ffi.free(ptr);
    return value;
  }
}
