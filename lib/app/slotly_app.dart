import 'package:flutter/material.dart';
import '../core/constants/app_constants.dart';
import 'router/main_shell.dart';
import 'theme/app_theme.dart';

/// Root Application Widget for Slotly.
class SlotlyApp extends StatelessWidget {
  const SlotlyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppConstants.appName,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const MainShell(),
    );
  }
}
