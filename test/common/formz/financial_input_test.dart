import 'package:flutter_test/flutter_test.dart';
import 'package:kalshi_challenge/common/formz/formz.dart';

void main() {
  group('FinancialInput', () {
    test('pure constructor initializes with empty value', () {
      const input = FinancialInput.pure();
      expect(input.value, '');
      expect(input.isPure, isTrue);
    });

    test('dirty constructor initializes with provided value', () {
      const input = FinancialInput.dirty('1000');
      expect(input.value, '1000');
      expect(input.isPure, isFalse);
    });

    test('returns empty error when value is empty', () {
      const input = FinancialInput.dirty();
      expect(input.validator(input.value), FinancialInputValidationError.empty);
    });

    test('returns zero error when value is "0"', () {
      const input = FinancialInput.dirty('0');
      expect(input.validator(input.value), FinancialInputValidationError.zero);
    });

    test('returns invalid error when value is negative', () {
      const input = FinancialInput.dirty('-100');
      expect(
        input.validator(input.value),
        FinancialInputValidationError.invalid,
      );
    });

    test('returns invalid error when value is non-numeric', () {
      const input = FinancialInput.dirty('abc');
      expect(
        input.validator(input.value),
        FinancialInputValidationError.invalid,
      );
    });

    test('returns null for valid positive numbers', () {
      const input = FinancialInput.dirty('1000');
      expect(input.validator(input.value), isNull);
    });

    test('parseCurrency removes commas correctly', () {
      expect('1,234,567'.parseCurrency, '1234567');
      expect('12,000'.parseCurrency, '12000');
      expect('1000'.parseCurrency, '1000');
    });

    test('handles input with spaces ', () {
      expect(' 1,000 '.parseCurrency, '1000');
    });

    test('returns invalid error for inputs with only commas', () {
      const input = FinancialInput.dirty(',,,');
      expect(
        input.validator(input.value),
        FinancialInputValidationError.invalid,
      );
    });
  });
}
