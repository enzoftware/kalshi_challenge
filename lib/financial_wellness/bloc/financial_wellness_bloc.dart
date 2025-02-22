import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:finance_repository/finance_repository.dart';
import 'package:kalshi_challenge/common/formz/formz.dart';

part 'financial_wellness_event.dart';
part 'financial_wellness_state.dart';

class FinancialWellnessBloc
    extends Bloc<FinancialWellnessEvent, FinancialWellnessState> {
  FinancialWellnessBloc({
    required FinanceRepository financeRepository,
  })  : _financeRepository = financeRepository,
        super(const FinancialWellnessState()) {
    on<FinancialWellnessGetFinancialScore>(_onGetFinancialScore);
    on<FinancialWellnessAnnualIncomeChanged>(_onAnnualIncomeChanged);
    on<FinancialWellnessMonthlyCostsChanged>(_onMonthlyCostsChanged);
    on<FinancialWellnessReset>(_onReset);
  }

  final FinanceRepository _financeRepository;

  Future<void> _onReset(
    FinancialWellnessReset event,
    Emitter<FinancialWellnessState> emit,
  ) async {
    emit(const FinancialWellnessState());
  }

  Future<void> _onAnnualIncomeChanged(
    FinancialWellnessAnnualIncomeChanged event,
    Emitter<FinancialWellnessState> emit,
  ) async {
    final annualIncome = FinancialInput.dirty(event.annualIncome);
    emit(state.copyWith(annualIconmeInput: annualIncome));
  }

  Future<void> _onMonthlyCostsChanged(
    FinancialWellnessMonthlyCostsChanged event,
    Emitter<FinancialWellnessState> emit,
  ) async {
    final monthlyCosts = FinancialInput.dirty(event.monthlyCosts);
    emit(state.copyWith(monthlyCostsInput: monthlyCosts));
  }

  Future<void> _onGetFinancialScore(
    FinancialWellnessGetFinancialScore event,
    Emitter<FinancialWellnessState> emit,
  ) async {
    emit(state.copyWith(status: FinancialWellnessStatus.loading));

    try {
      final annualIncome = double.tryParse(state.annualIconmeInput.value);
      final monthlyCosts = double.tryParse(state.monthlyCostsInput.value);
      final financialScore = await _financeRepository.getFinancialScore(
        annualIncome: annualIncome ?? 0,
        monthlyCosts: monthlyCosts ?? 0,
      );
      final score = switch (financialScore) {
        FinancialScore.healthy => const FinancialScoreHealthy(),
        FinancialScore.average => const FinancialScoreAverage(),
        FinancialScore.unhealthy => const FinancialScoreUnhealthy(),
      };

      emit(
        state.copyWith(
          status: FinancialWellnessStatus.success,
          score: score,
        ),
      );
    } catch (error, stackTrace) {
      addError(error, stackTrace);
      emit(
        state.copyWith(
          status: FinancialWellnessStatus.failure,
          score: const FinancialScoreUnknown(),
        ),
      );
      return;
    }
  }
}
