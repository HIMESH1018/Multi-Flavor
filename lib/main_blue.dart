import 'package:flutter/material.dart';
import 'package:multi_flavour/utills/custom_colors.dart';

import 'app_env.dart';
import 'home_page.dart';

void main() {
  AppEnvironment.setupEnv(Environment.blue);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor:
        AppEnvironment.theme.cardColor
        ),
        useMaterial3: true,
      ),
      home:  MyHomePage(title: (AppEnvironment.appTitle ?? "")),
    );
  }
}


