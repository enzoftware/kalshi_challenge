import 'package:flutter/material.dart';

class KalshiLogo extends StatelessWidget {
  const KalshiLogo({this.height = 48, super.key});

  final double height;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/kalshilogo.png',
      height: height,
    );
  }
}
