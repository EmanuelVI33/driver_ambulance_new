import 'package:driver_ambulance/feactures/config/router/router.dart';
import 'package:driver_ambulance/feactures/config/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: AppTheme().getTheme(),
      routerConfig: RouterApp().router,
      debugShowCheckedModeBanner: false,
    );
  }
}
