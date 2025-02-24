import 'package:finance_repository/finance_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('FinanceRepositoryImpl', () {
    late FinanceRepositoryImpl financeRepository;

    setUp(() {
      financeRepository = FinanceRepositoryImpl();
    });

    test(
        'returns FinancialScoreHealthy when annual costs are <= 25% of annual '
        'net income', () async {
      final result = await financeRepository.getFinancialScore(
        annualIncome: 1000,
        monthlyCosts: 10,
      );
      expect(result, FinancialScore.healthy);
    });

    test(
        'returns FinancialScoreAverage when annual costs are > 25% and <= 75% '
        'of annual net income', () async {
      final result = await financeRepository.getFinancialScore(
        annualIncome: 1000,
        monthlyCosts: 30,
      );
      expect(result, FinancialScore.average);
    });

    test(
        'returns FinancialScoreUnhealthy when annual costs are > 75% of'
        ' annual net income', () async {
      final result = await financeRepository.getFinancialScore(
        annualIncome: 1000,
        monthlyCosts: 80,
      );
      expect(result, FinancialScore.unhealthy);
    });

    test(
        'returns FinancialScoreHealthy for edge case of exactly 25% of'
        ' annual net income', () async {
      final result = await financeRepository.getFinancialScore(
        annualIncome: 1000,
        monthlyCosts: 19.16,
      );
      expect(result, FinancialScore.healthy);
    });

    test(
        'returns FinancialScoreAverage for edge case of exactly 75% of annual'
        ' net income', () async {
      final result = await financeRepository.getFinancialScore(
        annualIncome: 1000,
        monthlyCosts: 57.5,
      );
      expect(result, FinancialScore.average);
    });
  });
}
