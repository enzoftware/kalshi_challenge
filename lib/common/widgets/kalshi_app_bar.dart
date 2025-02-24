import 'package:flutter/material.dart';

class KalshiAppBar extends StatelessWidget implements PreferredSizeWidget {
  const KalshiAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    const toolbarHeight = 80.0;
    return AppBar(
      toolbarHeight: toolbarHeight,
      centerTitle: true,
      title: Image.asset('assets/kalshi.png', height: 20),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(80);
}
