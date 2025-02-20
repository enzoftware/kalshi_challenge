import 'package:flutter/material.dart';
import 'package:kalshi_ui/kalshi_ui.dart';

class KalshiInput extends StatelessWidget {
  const KalshiInput({
    required this.label,
    super.key,
    this.onChanged,
    this.enabled = true,
  });

  final VoidCallback? onChanged;
  final String label;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: Theme.of(context).textTheme.bodyLarge),
        const SizedBox(height: 8),
        TextFormField(
          enabled: enabled,
          keyboardType: TextInputType.number,
          onChanged: (value) => onChanged?.call(),
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.w700,
                fontSize: 36,
              ),
          decoration: InputDecoration(
            prefixIcon: const Icon(
              Icons.attach_money,
              size: 36,
              color: KalshiColors.amountInputIcon,
            ),
            contentPadding: const EdgeInsets.symmetric(
              vertical: 16,
              horizontal: 12,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: const BorderSide(color: KalshiColors.amountInputIcon),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: const BorderSide(color: KalshiColors.primary),
            ),
          ),
        ),
      ],
    );
  }
}
