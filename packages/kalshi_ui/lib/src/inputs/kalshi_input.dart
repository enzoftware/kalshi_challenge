import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:kalshi_ui/kalshi_ui.dart';

/// A formatter for currency input fields that **automatically adds commas**
/// as the user types.
///
/// ## Example:
/// ```dart
/// TextField(
///   inputFormatters: [CurrencyInputFormatter()],
///   keyboardType: TextInputType.number,
/// )
/// ```
///
/// This formatter ensures that numbers are properly formatted as currency,
/// **without decimals**, e.g., `1000` → `1,000`.
class CurrencyInputFormatter extends TextInputFormatter {
  /// Formatter for **thousands separators**, using the current locale.
  final NumberFormat _formatter = NumberFormat.decimalPattern();

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    try {
      if (newValue.text.isEmpty) {
        return newValue.copyWith(text: '');
      }

      // Remove existing commas and reformat the number
      final newText = _formatter.format(
        int.tryParse(newValue.text.replaceAll(',', '')),
      );

      return newValue.copyWith(
        text: newText,
        selection: TextSelection.collapsed(offset: newText.length),
      );
    } catch (e) {
      return newValue;
    }
  }
}

/// A **styled text input field** for currency values, following the
/// **Kalshi UI Design System**.
///
/// This input field includes:
/// - A **dollar sign ($) icon** as a prefix.
/// - **Automatic currency formatting** via [CurrencyInputFormatter].
/// - **Custom validation** via the [validator] parameter.
/// - **Customizable label** for better UX.
///
/// ## Example Usage:
/// ```dart
/// KalshiInput(
///   label: 'Annual Income',
///   onChanged: (value) {
///     print('User entered: $value');
///   },
///   validator: (value) {
///     if (value == null || value.isEmpty) return 'This field is required';
///     return null;
///   },
/// )
/// ```
class KalshiInput extends StatelessWidget {
  /// Creates a new instance of [KalshiInput].
  const KalshiInput({
    required this.label,
    super.key,
    this.onChanged,
    this.enabled = true,
    this.validator,
  });

  /// Callback function triggered **when the input value changes**.
  final ValueChanged<String>? onChanged;

  /// The label text displayed **above the input field**.
  final String label;

  /// Determines whether the input field is **enabled or disabled**.
  final bool enabled;

  /// A **custom validator function** to validate input values.
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
          inputFormatters: [CurrencyInputFormatter()],
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
