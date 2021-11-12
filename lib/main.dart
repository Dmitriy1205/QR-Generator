import 'dart:io';
import 'package:desktop_window/desktop_window.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'screen/main_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (Platform.isWindows || Platform.isMacOS) {
    DesktopWindow.setWindowSize(
      const Size(400, 720),
    );
    DesktopWindow.setMinWindowSize(
      const Size(400, 400),
    );
  }
  runApp(const MainScreen());
}
