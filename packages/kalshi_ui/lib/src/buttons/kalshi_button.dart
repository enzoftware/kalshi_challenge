import 'package:flutter/material.dart';
import 'package:kalshi_ui/src/colors/colors.dart';

/// A customizable button following the Coin Design System guidelines.
///
/// This widget provides a flexible button that can be used for triggering
/// actions or making selections in the UI. It supports both **filled**
/// and **outlined** styles.
///
/// ## Example Usage
///
/// ```dart
/// KalshiButton(
///   text: 'Continue',
///   onPressed: () => print('Button Pressed'),
/// )
/// ```
///
/// ### Outlined Button
///
/// ```dart
/// KalshiButton.outlined(
///   text: 'Cancel',
///   onPressed: () => print('Cancel Pressed'),
/// )
/// ```
class KalshiButton extends StatelessWidget {
  /// Creates a **filled button** with customizable properties.
  ///
  /// - [text] The label displayed on the button.
  /// - [radius] Defines the border radius of the button (default: `32`).
  /// - [width] The button's width (default: `double.infinity`).
  /// - [backgroundColor] The background color
  /// (default: `KalshiColors.primary`).
  /// - [textColor] The color of the text inside the button
  /// (default: `Colors.white`).
  /// - [onPressed] A callback function triggered when the button is tapped.
  const KalshiButton({
    required this.text,
    this.radius = 32,
    this.width = double.infinity,
    this.backgroundColor = KalshiColors.primary,
    this.textColor = Colors.white,
    super.key,
    this.onPressed,
  });

  /// Creates an **outlined button**, which has a transparent background
  /// and a border.
  ///
  /// - [text] The label displayed on the button.
  /// - [radius] Defines the border radius of the button (default: `32`).
  /// - [width] The button's width (default: `double.infinity`).
  /// - [textColor] The color of the text and border
  /// (default: `KalshiColors.primary`).
  /// - [onPressed] A callback function triggered when the button is tapped.
  ///
  /// Example:
  /// ```dart
  /// KalshiButton.outlined(
  ///   text: 'Cancel',
  ///   onPressed: () => print('Cancel Pressed'),
  /// )
  /// ```
  factory KalshiButton.outlined({
    required String text,
    double radius = 32,
    double width = double.infinity,
    Color textColor = KalshiColors.primary,
    Key? key,
    VoidCallback? onPressed,
  }) {
    return KalshiButton(
      text: text,
      radius: radius,
      width: width,
      backgroundColor: Colors.transparent,
      textColor: textColor,
      key: key,
      onPressed: onPressed,
    );
  }

  /// The label text displayed inside the button.
  final String text;

  /// The callback function triggered when the button is pressed.
  ///
  /// If `null`, the button will be **disabled**.
  final VoidCallback? onPressed;

  /// The border radius of the button.
  ///
  /// Defaults to `32` for a rounded appearance.
  final double radius;

  /// The background color of the button.
  ///
  /// If set to `Colors.transparent`, it will act as an **outlined** button.
  final Color backgroundColor;

  /// The color of the text displayed inside the button.
  final Color textColor;

  /// The width of the button.
  ///
  /// Defaults to `double.infinity` to take up available space.
  final double width;

  @override
  Widget build(BuildContext context) {
    const buttonHeight = 56.0;

    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        minimumSize: WidgetStateProperty.all(Size(width, buttonHeight)),
        backgroundColor: WidgetStateProperty.all(backgroundColor),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
            side: backgroundColor == Colors.transparent
                ? BorderSide(color: textColor, width: 2)
                : BorderSide.none,
          ),
        ),
      ),
      child: Text(
        text,
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: textColor,
              fontWeight: FontWeight.bold,
            ),
      ),
    );
  }
}
