import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kalshi_ui/kalshi_ui.dart';

void main() {
  group('CurrencyInputFormatter', () {
    final formatter = CurrencyInputFormatter();

    test('formats input with commas correctly', () {
      const oldValue = TextEditingValue(text: '1000');
      const newValue = TextEditingValue(text: '10000');
      final formattedValue = formatter.formatEditUpdate(oldValue, newValue);

      expect(formattedValue.text, '10,000');
    });

    test('removes commas before formatting', () {
      const oldValue = TextEditingValue(text: '10,000');
      const newValue = TextEditingValue(text: '100000');
      final formattedValue = formatter.formatEditUpdate(oldValue, newValue);

      expect(formattedValue.text, '100,000');
    });

    test('handles empty input', () {
      const oldValue = TextEditingValue(text: '1000');
      const newValue = TextEditingValue.empty;
      final formattedValue = formatter.formatEditUpdate(oldValue, newValue);

      expect(formattedValue.text, '');
    });

    test('handles non-numeric input gracefully', () {
      expect(
        () => formatter.formatEditUpdate(
          const TextEditingValue(text: 'abc'),
          const TextEditingValue(text: 'abc'),
        ),
        throwsFormatException,
      );
    });
  });

  group('KalshiInput', () {
    testWidgets('renders with correct label', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: KalshiInput(label: 'Annual Income'),
          ),
        ),
      );

      expect(find.text('Annual Income'), findsOneWidget);
    });

    testWidgets('calls onChanged when text is entered', (tester) async {
      String? enteredText;
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: KalshiInput(
              label: 'Test Input',
              onChanged: (value) => enteredText = value,
            ),
          ),
        ),
      );

      await tester.enterText(find.byType(TextFormField), '5000');
      expect(enteredText, '5,000');
    });

    testWidgets('disables input field when enabled is false', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: KalshiInput(label: 'Disabled Input', enabled: false),
          ),
        ),
      );

      final textField =
          tester.widget<TextFormField>(find.byType(TextFormField));
      expect(textField.enabled, isFalse);
    });

    testWidgets('applies validation correctly', (tester) async {
      String? validator(String? value) {
        if (value == null || value.isEmpty) return 'Required field';
        return null;
      }

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Form(
              child:
                  KalshiInput(label: 'Validation Test', validator: validator),
            ),
          ),
        ),
      );

      await tester.enterText(find.byType(TextFormField), '');
      await tester.pump();

      final formField =
          tester.widget<TextFormField>(find.byType(TextFormField));
      expect(formField.validator?.call(''), 'Required field');
    });
  });
}
