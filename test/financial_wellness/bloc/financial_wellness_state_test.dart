import 'package:flutter_test/flutter_test.dart';
import 'package:kalshi_challenge/common/formz/formz.dart';
import 'package:kalshi_challenge/financial_wellness/financial_wellness.dart';

void main() {
  group('FinancialWellnessState', () {
    test('supports value comparison', () {
      expect(
        const FinancialWellnessState(),
        equals(const FinancialWellnessState()),
      );
    });

    test('default values are correctly set', () {
      const state = FinancialWellnessState();
      expect(state.status, equals(FinancialWellnessStatus.initial));
      expect(state.score, isA<FinancialScoreUnknown>());
      expect(state.annualIconmeInput, equals(const FinancialInput.pure()));
      expect(state.monthlyCostsInput, equals(const FinancialInput.pure()));
    });

    test('copyWith updates status correctly', () {
      const state = FinancialWellnessState();
      final newState = state.copyWith(status: FinancialWellnessStatus.success);
      expect(newState.status, equals(FinancialWellnessStatus.success));
      expect(newState.score, equals(state.score));
      expect(newState.annualIconmeInput, equals(state.annualIconmeInput));
      expect(newState.monthlyCostsInput, equals(state.monthlyCostsInput));
    });

    test('copyWith updates score correctly', () {
      const state = FinancialWellnessState();
      final newState = state.copyWith(score: const FinancialScoreHealthy());
      expect(newState.score, isA<FinancialScoreHealthy>());
      expect(newState.status, equals(state.status));
      expect(newState.annualIconmeInput, equals(state.annualIconmeInput));
      expect(newState.monthlyCostsInput, equals(state.monthlyCostsInput));
    });

    test('copyWith updates annual income input correctly', () {
      const state = FinancialWellnessState();
      const updatedInput = FinancialInput.dirty('50000');
      final newState = state.copyWith(annualIconmeInput: updatedInput);
      expect(newState.annualIconmeInput, equals(updatedInput));
      expect(newState.status, equals(state.status));
      expect(newState.score, equals(state.score));
      expect(newState.monthlyCostsInput, equals(state.monthlyCostsInput));
    });

    test('copyWith updates monthly costs input correctly', () {
      const state = FinancialWellnessState();
      const updatedInput = FinancialInput.dirty('2000');
      final newState = state.copyWith(monthlyCostsInput: updatedInput);
      expect(newState.monthlyCostsInput, equals(updatedInput));
      expect(newState.status, equals(state.status));
      expect(newState.score, equals(state.score));
      expect(newState.annualIconmeInput, equals(state.annualIconmeInput));
    });

    test('copyWith with no changes returns same instance', () {
      const state = FinancialWellnessState();
      final newState = state.copyWith();
      expect(newState, equals(state));
    });

    test('props contain all fields', () {
      const state = FinancialWellnessState();
      expect(
        state.props,
        equals([
          state.status,
          state.score,
          state.annualIconmeInput,
          state.monthlyCostsInput,
        ]),
      );
    });
  });

  group('FinancialWellnessScore', () {
    test('FinancialScoreHealthy supports equality', () {
      expect(
        const FinancialScoreHealthy(),
        equals(const FinancialScoreHealthy()),
      );
    });

    test('FinancialScoreAverage supports equality', () {
      expect(
        const FinancialScoreAverage(),
        equals(const FinancialScoreAverage()),
      );
    });

    test('FinancialScoreUnhealthy supports equality', () {
      expect(
        const FinancialScoreUnhealthy(),
        equals(const FinancialScoreUnhealthy()),
      );
    });

    test('FinancialScoreUnknown supports equality', () {
      expect(
        const FinancialScoreUnknown(),
        equals(const FinancialScoreUnknown()),
      );
    });

    test('Different score types are not equal', () {
      expect(
        const FinancialScoreHealthy(),
        isNot(equals(const FinancialScoreUnhealthy())),
      );
      expect(
        const FinancialScoreAverage(),
        isNot(equals(const FinancialScoreUnknown())),
      );
    });

    test('FinancialScoreUnknown instance remains the same', () {
      const score = FinancialScoreUnknown();
      expect(score, equals(const FinancialScoreUnknown()));
    });
  });
}
