import 'package:flutter_test/flutter_test.dart';
import 'package:kalshi_challenge/financial_wellness/financial_wellness.dart';

void main() {
  group('FinancialWellnessEvent', () {
    group('FinancialWellnessGetFinancialScore', () {
      test('supports value comparison', () {
        expect(
          const FinancialWellnessGetFinancialScore(),
          equals(const FinancialWellnessGetFinancialScore()),
        );
      });

      test('props should be empty', () {
        expect(const FinancialWellnessGetFinancialScore().props, isEmpty);
      });

      test('creates an instance successfully', () {
        const event = FinancialWellnessGetFinancialScore();
        expect(event, isA<FinancialWellnessGetFinancialScore>());
      });
    });

    group('FinancialWellnessAnnualIncomeChanged', () {
      test('supports value comparison', () {
        expect(
          const FinancialWellnessAnnualIncomeChanged('50000'),
          equals(const FinancialWellnessAnnualIncomeChanged('50000')),
        );
      });

      test('different values should not be equal', () {
        expect(
          const FinancialWellnessAnnualIncomeChanged('50000'),
          isNot(equals(const FinancialWellnessAnnualIncomeChanged('60000'))),
        );
      });

      test('props should contain annualIncome', () {
        const event = FinancialWellnessAnnualIncomeChanged('75000');
        expect(event.props, equals(['75000']));
      });

      test('creates an instance successfully', () {
        const event = FinancialWellnessAnnualIncomeChanged('75000');
        expect(event, isA<FinancialWellnessAnnualIncomeChanged>());
      });

      test('handles empty income value', () {
        const event = FinancialWellnessAnnualIncomeChanged('');
        expect(event.props, equals(['']));
      });
    });

    group('FinancialWellnessMonthlyCostsChanged', () {
      test('supports value comparison', () {
        expect(
          const FinancialWellnessMonthlyCostsChanged('2000'),
          equals(const FinancialWellnessMonthlyCostsChanged('2000')),
        );
      });

      test('different values should not be equal', () {
        expect(
          const FinancialWellnessMonthlyCostsChanged('2000'),
          isNot(equals(const FinancialWellnessMonthlyCostsChanged('3000'))),
        );
      });

      test('props should contain monthlyCosts', () {
        const event = FinancialWellnessMonthlyCostsChanged('1200');
        expect(event.props, equals(['1200']));
      });

      test('creates an instance successfully', () {
        const event = FinancialWellnessMonthlyCostsChanged('1200');
        expect(event, isA<FinancialWellnessMonthlyCostsChanged>());
      });

      test('handles empty cost value', () {
        const event = FinancialWellnessMonthlyCostsChanged('');
        expect(event.props, equals(['']));
      });
    });

    group('FinancialWellnessReset', () {
      test('supports value comparison', () {
        expect(
          const FinancialWellnessReset(),
          equals(const FinancialWellnessReset()),
        );
      });

      test('props should be empty', () {
        expect(const FinancialWellnessReset().props, isEmpty);
      });

      test('creates an instance successfully', () {
        const event = FinancialWellnessReset();
        expect(event, isA<FinancialWellnessReset>());
      });
    });
  });
}
