import 'package:flutter/material.dart';
import 'package:kalshi_ui/src/colors/colors.dart';

/// **KalshiTheme** - A centralized theme configuration following Kalshi UI
/// Design System.
///
/// This theme defines the color scheme, background colors, card styles, and
/// app bar appearance.
/// It ensures **consistent styling** across the app.
class KalshiTheme {
  /// **Global Theme Configuration**
  ///
  /// - Uses `KalshiColors.primary` as the **seed color** for the theme.
  /// - Sets **scaffold background** to `KalshiColors.scaffoldBackground`.
  /// - Defines **card background** as `KalshiColors.appBarBackground`.
  /// - Customizes **app bar theme** with:
  ///   - Background color: `KalshiColors.appBarBackground`
  ///   - **No elevation** for a flat look.
  /// - Adapts visual density for different platforms
  /// (`adaptivePlatformDensity`).
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
