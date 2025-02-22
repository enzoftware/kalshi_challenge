part of 'financial_wellness_bloc.dart';

sealed class FinancialWellnessEvent extends Equatable {
  const FinancialWellnessEvent();

  @override
  List<Object> get props => [];
}

class FinancialWellnessGetFinancialScore extends FinancialWellnessEvent {
  const FinancialWellnessGetFinancialScore();
}

class FinancialWellnessAnnualIncomeChanged extends FinancialWellnessEvent {
  const FinancialWellnessAnnualIncomeChanged(this.annualIncome);

  final String annualIncome;

  @override
  List<Object> get props => [annualIncome];
}

class FinancialWellnessMonthlyCostsChanged extends FinancialWellnessEvent {
  const FinancialWellnessMonthlyCostsChanged(this.monthlyCosts);

  final String monthlyCosts;

  @override
  List<Object> get props => [monthlyCosts];
}

class FinancialWellnessReset extends FinancialWellnessEvent {
  const FinancialWellnessReset();
}
