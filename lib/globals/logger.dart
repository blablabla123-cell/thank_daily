import 'package:flutter/foundation.dart';
import 'package:thank_daily/globals/file_manager.dart';

abstract class Logger {
  Logger._internal();
}

@immutable
class LoggerService extends Logger {
  static FileManager fileManager = FileManager();

  LoggerService._internal() : super._internal() {
    debugPrint('$runtimeType initialized');
    _instance = this;
  }

  static LoggerService? _instance;

  factory LoggerService() => _instance ?? LoggerService._internal();

  void log(String message, [Object? error, StackTrace? stackTrace]) {
    fileManager.append('${DateTime.now().toIso8601String()} - $message\n');
    debugPrint(message);
  }
}
