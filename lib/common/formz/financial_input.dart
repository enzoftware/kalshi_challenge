import 'package:formz/formz.dart';

enum FinancialInputValidationError { invalid, empty, zero }

class FinancialInput extends FormzInput<String, FinancialInputValidationError> {
  const FinancialInput.pure() : super.pure('');
  const FinancialInput.dirty([String value = '']) : super.dirty(value);

  @override
  FinancialInputValidationError? validator(String value) {
    if (value.isEmpty) {
      return FinancialInputValidationError.empty;
    }
    final parseCurrency = value.parseCurrency;
    final number = double.tryParse(parseCurrency);
    if (number == 0) return FinancialInputValidationError.zero;
    if (number == null || number <= 0) {
      return FinancialInputValidationError.invalid;
    }
    return null;
  }
}

extension FinancialInputX on String {
  String get parseCurrency {
    final cleanedString = replaceAll(',', '');
    return cleanedString.trim();
  }
}
