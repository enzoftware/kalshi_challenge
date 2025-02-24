import 'package:flutter/material.dart';

class FinancialProgressIndicator extends StatelessWidget {
  const FinancialProgressIndicator({
    required this.value,
    required this.progressColor,
    super.key,
  });

  /// Value representing the progress state:
  /// - `0` → **Red** (Low Progress)
  /// - `1` → **Yellow** (Medium Progress)
  /// - `2` → **Green** (Full Progress)
  final int value;
  final Color progressColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 4,
      children: [
        _buildSegment(0, progressColor),
        _buildSegment(1, progressColor),
        _buildSegment(2, progressColor),
      ],
    );
  }

  Widget _buildSegment(int index, Color color) {
    final isActive = index <= value;
    return Expanded(
      child: Container(
        height: 16,
        decoration: BoxDecoration(
          color: isActive ? color : Colors.grey.shade200,
          borderRadius: BorderRadius.horizontal(
            left: index == 0 ? const Radius.circular(20) : Radius.zero,
            right: index == 2 ? const Radius.circular(20) : Radius.zero,
          ),
        ),
      ),
    );
  }
}
