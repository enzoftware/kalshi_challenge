import 'package:formz/formz.dart';
import 'package:kalshi_challenge/common/formz/financial_input.dart';

class FinancialForm with FormzMixin {
  const FinancialForm({
    this.annualIncome = const FinancialInput.pure(),
    this.monthlyCosts = const FinancialInput.pure(),
  });
  final FinancialInput annualIncome;
  final FinancialInput monthlyCosts;

  @override
  List<FormzInput> get inputs => [annualIncome, monthlyCosts];
}
