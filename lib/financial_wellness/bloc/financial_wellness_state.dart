part of 'financial_wellness_bloc.dart';

enum FinancialWellnessStatus { initial, loading, success, failure }

class FinancialWellnessState extends Equatable {
  const FinancialWellnessState({
    this.status = FinancialWellnessStatus.initial,
    this.score = const FinancialScoreUnknown(),
    this.annualIconmeInput = const FinancialInput.pure(),
    this.monthlyCostsInput = const FinancialInput.pure(),
  });

  final FinancialWellnessStatus status;
  final FinancialWellnessScore score;
  final FinancialInput annualIconmeInput;
  final FinancialInput monthlyCostsInput;

  FinancialWellnessState copyWith({
    FinancialWellnessStatus? status,
    FinancialWellnessScore? score,
    FinancialInput? annualIconmeInput,
    FinancialInput? monthlyCostsInput,
  }) {
    return FinancialWellnessState(
      status: status ?? this.status,
      score: score ?? this.score,
      annualIconmeInput: annualIconmeInput ?? this.annualIconmeInput,
      monthlyCostsInput: monthlyCostsInput ?? this.monthlyCostsInput,
    );
  }

  @override
  List<Object> get props => [
        status,
        score,
        annualIconmeInput,
        monthlyCostsInput,
      ];
}

/// A sealed class representing the financial score.
sealed class FinancialWellnessScore {
  /// Creates a new instance of [FinancialWellnessScore].
  const FinancialWellnessScore(this.value);

  final int value;
}

class FinancialScoreHealthy extends FinancialWellnessScore {
  const FinancialScoreHealthy() : super(2);
}

class FinancialScoreAverage extends FinancialWellnessScore {
  const FinancialScoreAverage() : super(1);
}

class FinancialScoreUnhealthy extends FinancialWellnessScore {
  const FinancialScoreUnhealthy() : super(0);
}

class FinancialScoreUnknown extends FinancialWellnessScore {
  const FinancialScoreUnknown() : super(-1);
}
