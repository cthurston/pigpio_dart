import 'dart:io';

class SerialPortError extends OSError {
  const SerialPortError(
      [String message = '', int errorCode = OSError.noErrorCode])
      : super(message, errorCode);

  @override
  String toString() {
    return super.toString().replaceFirst('OS Error', runtimeType.toString());
  }
}
