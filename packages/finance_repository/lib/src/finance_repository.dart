enum FinancialScore {
  healthy,
  average,
  unhealthy,
}

/// {@template finance_repository}
/// Finance repository responsible for calculating the financial score.
/// {@endtemplate}
abstract class FinanceRepository {
  /// {@macro finance_repository}
  const FinanceRepository();

  /// {@template getFinancialScore}
  /// Get the financial score based on the [annualIncome] and [monthlyCosts].
  /// Returns a [FinancialScore] instance.
  /// Throws an [Exception] if an error occurs.
  /// {@endtemplate}
  Future<FinancialScore> getFinancialScore({
    required double annualIncome,
    required double monthlyCosts,
  });
}
