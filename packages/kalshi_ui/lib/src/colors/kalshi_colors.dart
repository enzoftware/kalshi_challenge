import 'dart:ui';

/// A collection of predefined colors for the **Kalshi UI Design System**.
///
/// This class provides a consistent color scheme across the application,
/// including **backgrounds, text, and status indicators**.
///
/// ## Example Usage:
/// ```dart
/// Container(
///   color: KalshiColors.primary,
///   child: Text(
///     'Hello, Kalshi!',
///     style: TextStyle(color: KalshiColors.textTitle),
///   ),
/// )
/// ```
class KalshiColors {
  /// **App Bar Background**
  ///
  /// - Used as the background color for the app bar.
  static const appBarBackground = Color(0XFFFFFFFF);

  /// **Scaffold Background**
  ///
  /// - The default background color for screens.
  static const scaffoldBackground = Color(0XFFF4F8FA);

  /// **Primary Brand Color**
  ///
  /// - Used for buttons, links, and primary UI elements.
  static const primary = Color(0XFF001C95);

  /// **Title Text Color**
  ///
  /// - Used for main headings and prominent text.
  static const textTitle = Color(0XFF1E2A32);

  /// **Subtitle / Secondary Text Color**
  ///
  /// - Used for descriptions, labels, and less prominent text.
  static const textSubtitle = Color(0XFF708797);

  /// **Amount Input Text Color**
  ///
  /// - Used for text inside financial input fields.
  static const amountInputText = Color(0XFF4D6475);

  /// **Amount Input Icon Color**
  ///
  /// - Used for icons within financial input fields.
  static const amountInputIcon = Color(0XFFCBD5DC);

  /// **Healthy Status Background**
  ///
  /// - Used to indicate a **positive financial score** or success state.
  static const healthyBackground = Color(0XFF04C761);

  /// **Average Status Background**
  ///
  /// - Used to indicate a **moderate financial score** or warning state.
  static const averageBackground = Color(0XFFFFC032);

  /// **Unhealthy Status Background**
  ///
  /// - Used to indicate a **poor financial score** or error state.
  static const unhealthyBackground = Color(0XFFD32A36);
}
