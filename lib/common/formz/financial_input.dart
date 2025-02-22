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
    final number = double.tryParse(value);
    if (number == 0) return FinancialInputValidationError.zero;
    if (number == null || number <= 0) {
      return FinancialInputValidationError.invalid;
    }
    return null;
  }
}
