
import 'package:flutter/material.dart';
import 'package:multi_flavour/utills/custom_colors.dart';

 abstract class AppEnvironment {
  static String? baseApiUrl;
  static String? imageUrl;
  static String? appTitle;
  static String? flavour;
  static late ThemeData theme;



  static setupEnv(Environment env) {
    switch (env) {
      case Environment.red:
        {
          appTitle = "Flavor Red";
          baseApiUrl = '';
          imageUrl = '';
          flavour = "red";
          theme = AppTheme.redAppTheme;


          break;
        }
      case Environment.blue:
        {
          appTitle = "Flavor Blue";
          baseApiUrl = '';
          imageUrl = '';
          flavour = "blue";
          theme = AppTheme.blueAppTheme;

          break;
        }
    }

  }


}

enum Environment {
  blue,
  red,
}