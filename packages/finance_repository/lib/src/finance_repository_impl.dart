// ignore_for_file: inference_failure_on_instance_creation

import 'package:finance_repository/finance_repository.dart';
import 'package:finance_repository/src/finance_repository.dart';

/// {@macro finance_repository}
class FinanceRepositoryImpl extends FinanceRepository {
  @override
  Future<FinancialScore> getFinancialScore({
    required double annualIncome,
    required double monthlyCosts,
  }) async {
    await Future.delayed(const Duration(seconds: 1));

    const tax = 0.08;
    final annualMonthlyCosts = monthlyCosts * 12;
    final annualNetIncome = annualIncome - (annualIncome * tax);

    // Determine the financial score
    if (annualMonthlyCosts <= 0.25 * annualNetIncome) {
      return FinancialScore.healthy;
    } else if (annualMonthlyCosts <= 0.75 * annualNetIncome) {
      return FinancialScore.average;
    } else {
      return FinancialScore.unhealthy;
    }
  }
}
