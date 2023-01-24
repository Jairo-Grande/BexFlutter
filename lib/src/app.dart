import 'package:bex_app_flutter/src/core/themes/custom_theme.dart';
import 'package:bex_app_flutter/src/routes/routes.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      theme: themeLight(context),
      routes: appRoutes,
      initialRoute: 'home',
    );
  }
}
