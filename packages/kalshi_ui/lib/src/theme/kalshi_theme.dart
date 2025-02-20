import 'package:flutter/material.dart';
import 'package:kalshi_ui/src/colors/colors.dart';

class KalshiTheme {
  static ThemeData theme = ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: KalshiColors.primary),
    scaffoldBackgroundColor: KalshiColors.scaffoldBackground,
    cardColor: KalshiColors.appBarBackground,
    appBarTheme: const AppBarTheme(
      backgroundColor: KalshiColors.appBarBackground,
      elevation: 0,
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}
