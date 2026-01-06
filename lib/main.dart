import 'package:flutter/material.dart';
import 'package:thank_daily/globals/file_manager.dart';

import 'globals/logger.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FileManager().init();
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  String _content = '';

  Future<void> _getContent() async {
    _content = await FileManager().readAll();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _getContent();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Generated Number: $_content'),
              TextButton(
                onPressed: () {
                  LoggerService().log('Button save clicked!');
                  setState(() {});
                },
                child: const Text('Save'),
              ),
              TextButton(
                onPressed: () async {
                  await _getContent();
                  setState(() {});
                },
                child: const Text('Read'),
              ),
              TextButton(
                onPressed: () async {
                  FileManager().clear();
                  await _getContent();
                  setState(() {});
                },
                child: const Text('Clear'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
