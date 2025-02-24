import 'package:bloc_test/bloc_test.dart';
import 'package:finance_repository/finance_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kalshi_challenge/common/formz/formz.dart';
import 'package:kalshi_challenge/financial_wellness/financial_wellness.dart';
import 'package:mocktail/mocktail.dart';

class MockFinanceRepository extends Mock implements FinanceRepository {}

void main() {
  late FinancialWellnessBloc bloc;
  late MockFinanceRepository financeRepository;

  setUp(() {
    financeRepository = MockFinanceRepository();
    bloc = FinancialWellnessBloc(financeRepository: financeRepository);
  });

  tearDown(() {
    bloc.close();
  });

  group('FinancialWellnessBloc', () {
    test('initial state is FinancialWellnessState', () {
      expect(bloc.state, const FinancialWellnessState());
    });

    group('FinancialWellnessReset', () {
      blocTest<FinancialWellnessBloc, FinancialWellnessState>(
        'emits default state when reset event is added',
        build: () => bloc,
        act: (bloc) => bloc.add(const FinancialWellnessReset()),
        expect: () => [const FinancialWellnessState()],
      );
    });

    group('FinancialWellnessAnnualIncomeChanged', () {
      blocTest<FinancialWellnessBloc, FinancialWellnessState>(
        'updates annual income input',
        build: () => bloc,
        act: (bloc) =>
            bloc.add(const FinancialWellnessAnnualIncomeChanged('50000')),
        expect: () => [
          const FinancialWellnessState(
            annualIconmeInput: FinancialInput.dirty('50000'),
          ),
        ],
      );
    });

    group('FinancialWellnessMonthlyCostsChanged', () {
      blocTest<FinancialWellnessBloc, FinancialWellnessState>(
        'updates monthly costs input',
        build: () => bloc,
        act: (bloc) =>
            bloc.add(const FinancialWellnessMonthlyCostsChanged('2000')),
        expect: () => [
          const FinancialWellnessState(
            monthlyCostsInput: FinancialInput.dirty('2000'),
          ),
        ],
      );
    });

    group('FinancialWellnessGetFinancialScore', () {
      blocTest<FinancialWellnessBloc, FinancialWellnessState>(
        'emits [loading, success] with FinancialScoreHealthy',
        build: () {
          when(
            () => financeRepository.getFinancialScore(
              annualIncome: any(named: 'annualIncome'),
              monthlyCosts: any(named: 'monthlyCosts'),
            ),
          ).thenAnswer((_) async => FinancialScore.healthy);
          return bloc;
        },
        act: (bloc) => bloc.add(const FinancialWellnessGetFinancialScore()),
        expect: () => [
          const FinancialWellnessState(status: FinancialWellnessStatus.loading),
          const FinancialWellnessState(
            status: FinancialWellnessStatus.success,
            score: FinancialScoreHealthy(),
          ),
        ],
      );

      blocTest<FinancialWellnessBloc, FinancialWellnessState>(
        'emits [loading, success] with FinancialScoreAverage',
        build: () {
          when(
            () => financeRepository.getFinancialScore(
              annualIncome: any(named: 'annualIncome'),
              monthlyCosts: any(named: 'monthlyCosts'),
            ),
          ).thenAnswer((_) async => FinancialScore.average);
          return bloc;
        },
        act: (bloc) => bloc.add(const FinancialWellnessGetFinancialScore()),
        expect: () => [
          const FinancialWellnessState(status: FinancialWellnessStatus.loading),
          const FinancialWellnessState(
            status: FinancialWellnessStatus.success,
            score: FinancialScoreAverage(),
          ),
        ],
      );

      blocTest<FinancialWellnessBloc, FinancialWellnessState>(
        'emits [loading, success] with FinancialScoreUnhealthy',
        build: () {
          when(
            () => financeRepository.getFinancialScore(
              annualIncome: any(named: 'annualIncome'),
              monthlyCosts: any(named: 'monthlyCosts'),
            ),
          ).thenAnswer((_) async => FinancialScore.unhealthy);
          return bloc;
        },
        act: (bloc) => bloc.add(const FinancialWellnessGetFinancialScore()),
        expect: () => [
          const FinancialWellnessState(status: FinancialWellnessStatus.loading),
          const FinancialWellnessState(
            status: FinancialWellnessStatus.success,
            score: FinancialScoreUnhealthy(),
          ),
        ],
      );

      blocTest<FinancialWellnessBloc, FinancialWellnessState>(
        'emits [loading, failure] when repository throws an error',
        build: () {
          when(
            () => financeRepository.getFinancialScore(
              annualIncome: any(named: 'annualIncome'),
              monthlyCosts: any(named: 'monthlyCosts'),
            ),
          ).thenThrow(Exception('API Error'));
          return bloc;
        },
        act: (bloc) => bloc.add(const FinancialWellnessGetFinancialScore()),
        expect: () => [
          const FinancialWellnessState(status: FinancialWellnessStatus.loading),
          const FinancialWellnessState(
            status: FinancialWellnessStatus.failure,
          ),
        ],
      );
    });
  });
}
