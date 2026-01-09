import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';

abstract class BaseFileManager {
  BaseFileManager._internal();

  Future<void> init();

  Future<void> append(String content);

  Future<String> readAll();

  Future<void> clear();
}

@immutable
class FileManager extends BaseFileManager {
  static late File _file;
  static final _instance = FileManager._internal();

  FileManager._internal() : super._internal();

  factory FileManager() => _instance;

  @override
  Future<void> init() async {
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/thank_daily_storage.txt');
    if (!await file.exists()) {
      _file = await file.create();
      return;
    }
    _file = file;
  }

  @override
  Future<void> append(String content) async =>
      await _file.writeAsString(content, mode: FileMode.append);

  @override
  Future<String> readAll() async => await _file.readAsString();

  @override
  Future<void> clear() async => await _file.writeAsString('');
}
