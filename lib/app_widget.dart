import 'package:flutter/material.dart';
import 'package:mobflix/app/pages/home_page.dart';
import 'package:mobflix/app/theme/light/light_theme.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: LightTheme.theme,
      home: HomePage(),
    );
  }
}
