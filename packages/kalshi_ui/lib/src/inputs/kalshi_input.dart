import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:kalshi_ui/kalshi_ui.dart';

class CurrencyInputFormatter extends TextInputFormatter {
  final NumberFormat _formatter = NumberFormat.decimalPattern();

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.text.isEmpty) {
      return newValue.copyWith(text: '');
    }

    final newText =
        _formatter.format(int.parse(newValue.text.replaceAll(',', '')));
    return newValue.copyWith(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}

class KalshiInput extends StatelessWidget {
  const KalshiInput({
    required this.label,
    super.key,
    this.onChanged,
    this.enabled = true,
    this.validator,
  });

  final ValueChanged<String>? onChanged;
  final String label;
  final bool enabled;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: Theme.of(context).textTheme.bodyLarge),
        const SizedBox(height: 8),
        TextFormField(
          validator: validator,
          enabled: enabled,
          keyboardType: TextInputType.number,
          inputFormatters: [
            CurrencyInputFormatter(),
          ],
          onChanged: onChanged,
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
