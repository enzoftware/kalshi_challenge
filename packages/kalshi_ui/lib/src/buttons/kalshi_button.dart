import 'package:flutter/material.dart';
import 'package:kalshi_ui/src/colors/colors.dart';

/// Element that allows users to trigger actions and make choices on the UI
/// Follows Coin Design System guidelines.
///
/// ## Usage
class KalshiButton extends StatelessWidget {
  const KalshiButton({
    required this.text,
    this.radius = 32,
    this.width = double.infinity,
    this.backgroundColor = KalshiColors.primary,
    this.textColor = Colors.white,
    super.key,
    this.onPressed,
  });

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

  final String text;
  final VoidCallback? onPressed;
  final double radius;
  final Color backgroundColor;
  final Color textColor;
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
