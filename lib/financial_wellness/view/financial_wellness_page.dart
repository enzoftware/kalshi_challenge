import 'package:finance_repository/finance_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kalshi_challenge/common/common.dart';
import 'package:kalshi_challenge/common/formz/formz.dart';
import 'package:kalshi_challenge/financial_wellness/financial_wellness.dart';
import 'package:kalshi_challenge/l10n/l10n.dart';
import 'package:kalshi_ui/kalshi_ui.dart';

class FinancialWellnessPage extends StatelessWidget {
  const FinancialWellnessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => FinancialWellnessBloc(
        financeRepository: context.read<FinanceRepository>(),
      ),
      child: const FinancialWellnessView(),
    );
  }
}

class FinancialWellnessView extends StatelessWidget {
  const FinancialWellnessView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const KalshiAppBar(),
      body: BlocBuilder<FinancialWellnessBloc, FinancialWellnessState>(
        builder: (context, state) {
          return const Padding(
            padding: EdgeInsets.all(24),
            child: SingleChildScrollView(
              child: Column(
                spacing: 36,
                children: [
                  _FinancialWellnessHeader(),
                  _FinancialWellnessBody(),
                  _FinancialWellnessFooter(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class _FinancialWellnessHeader extends StatelessWidget {
  const _FinancialWellnessHeader();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final textTheme = Theme.of(context).textTheme;
    final status = context.select(
      (FinancialWellnessBloc bloc) => bloc.state.status,
    );

    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: status == FinancialWellnessStatus.success
            ? l10n.heresYour
            : l10n.letsFindOutYour,
        style: textTheme.headlineSmall?.copyWith(
          fontSize: 27,
          color: KalshiColors.primary,
        ),
        children: [
          TextSpan(
            text: ' ${l10n.financialWellnessScore}',
            style: textTheme.headlineSmall?.copyWith(
              fontSize: 27,
              fontWeight: FontWeight.bold,
              color: KalshiColors.primary,
            ),
          ),
        ],
      ),
    );
  }
}

class _FinancialWellnessFooter extends StatelessWidget {
  const _FinancialWellnessFooter();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final textTheme = Theme.of(context).textTheme;
    return Column(
      children: [
        const Icon(
          Icons.lock_outline,
          size: 36,
          color: KalshiColors.textSubtitle,
        ),
        const SizedBox(height: 8),
        Text(
          l10n.financialInfoSecure,
          textAlign: TextAlign.center,
          style: textTheme.bodySmall?.copyWith(
            fontSize: 14,
            height: 1.5,
            color: KalshiColors.textSubtitle,
          ),
        ),
      ],
    );
  }
}

class _FinancialWellnessCalculator extends StatelessWidget {
  _FinancialWellnessCalculator();

  final _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final textTheme = Theme.of(context).textTheme;
    final annualIncomeInput = context.select(
      (FinancialWellnessBloc bloc) => bloc.state.annualIconmeInput,
    );

    final monthlyCostsInput = context.select(
      (FinancialWellnessBloc bloc) => bloc.state.monthlyCostsInput,
    );

    return Form(
      key: _key,
      child: Column(
        children: [
          const KalshiLogo(),
          const SizedBox(height: 16),
          Text(
            l10n.financialWellnessTest,
            style: textTheme.displayLarge?.copyWith(
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            l10n.enterYourFinancialInfo,
            style: textTheme.displayLarge?.copyWith(
              fontSize: 18,
              color: KalshiColors.textSubtitle,
            ),
          ),
          const SizedBox(height: 16),
          KalshiInput(
            label: l10n.annualIncome,
            validator: (v) => annualIncomeInput.validator(v ?? '')?.text(l10n),
            onChanged: (v) {
              context.read<FinancialWellnessBloc>().add(
                    FinancialWellnessAnnualIncomeChanged(v),
                  );
            },
          ),
          const SizedBox(height: 16),
          KalshiInput(
            label: l10n.monthlyCosts,
            validator: (v) => monthlyCostsInput.validator(v ?? '')?.text(l10n),
            onChanged: (value) {
              context.read<FinancialWellnessBloc>().add(
                    FinancialWellnessMonthlyCostsChanged(value),
                  );
            },
          ),
          const SizedBox(height: 16),
          KalshiButton(
            text: l10n.continueText,
            onPressed: () {
              if (!_key.currentState!.validate()) return;
              context.read<FinancialWellnessBloc>().add(
                    const FinancialWellnessGetFinancialScore(),
                  );
            },
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}

class _FinancialWellnessResult extends StatelessWidget {
  const _FinancialWellnessResult();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return BlocSelector<FinancialWellnessBloc, FinancialWellnessState,
        FinancialWellnessScore>(
      selector: (state) => state.score,
      builder: (context, score) {
        final color = score.color;
        final message = score.message(context.l10n);
        final scoreName = score.name(context.l10n);

        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const KalshiLogo(),
            const SizedBox(height: 16),
            Container(
              width: double.infinity,
              height: 16,
              color: color,
            ),
            const SizedBox(height: 32),
            Text(
              message,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.displayLarge?.copyWith(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                  ),
            ),
            const SizedBox(height: 8),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: l10n.yourFinancialWellnessScoreIs,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontSize: 18,
                      height: 1.25,
                    ),
                children: [
                  TextSpan(
                    text: ' $scoreName',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 48),
            KalshiButton.outlined(
              text: l10n.returnText,
              onPressed: () {
                context.read<FinancialWellnessBloc>().add(
                      const FinancialWellnessReset(),
                    );
              },
            ),
            const SizedBox(height: 24),
          ],
        );
      },
    );
  }
}

class _FinancialWellnessBody extends StatelessWidget {
  const _FinancialWellnessBody();

  @override
  Widget build(BuildContext context) {
    return BlocSelector<FinancialWellnessBloc, FinancialWellnessState,
        FinancialWellnessStatus>(
      selector: (state) => state.status,
      builder: (context, state) {
        return SizedBox(
          width: double.infinity,
          child: Card(
            elevation: 4,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
              child: Builder(
                builder: (context) {
                  if (state == FinancialWellnessStatus.loading) {
                    return const Center(
                      child: Padding(
                        padding: EdgeInsets.all(8),
                        child: CircularProgressIndicator.adaptive(),
                      ),
                    );
                  }
                  if (state == FinancialWellnessStatus.success) {
                    return const _FinancialWellnessResult();
                  }
                  if (state == FinancialWellnessStatus.initial) {
                    return _FinancialWellnessCalculator();
                  }

                  return const SizedBox.shrink();
                },
              ),
            ),
          ),
        );
      },
    );
  }
}

extension FinancialWellnessScoreX on FinancialWellnessScore {
  Color get color => switch (this) {
        FinancialScoreHealthy() => KalshiColors.healthyBackground,
        FinancialScoreAverage() => KalshiColors.averageBackground,
        FinancialScoreUnhealthy() => KalshiColors.unhealthyBackground,
        FinancialScoreUnknown() => KalshiColors.amountInputIcon,
      };

  String message(AppLocalizations l10n) => switch (this) {
        FinancialScoreHealthy() => l10n.congratulations,
        FinancialScoreAverage() => l10n.roomForImprovement,
        FinancialScoreUnhealthy() => l10n.caution,
        FinancialScoreUnknown() => '',
      };

  String name(AppLocalizations l10n) => switch (this) {
        FinancialScoreHealthy() => l10n.healthy,
        FinancialScoreAverage() => l10n.average,
        FinancialScoreUnhealthy() => l10n.unhealthy,
        FinancialScoreUnknown() => '',
      };
}

extension on FinancialInputValidationError {
  String text(AppLocalizations l10n) => switch (this) {
        FinancialInputValidationError.empty => l10n.thisFieldIsRequired,
        FinancialInputValidationError.invalid => l10n.invalidValue,
        FinancialInputValidationError.zero => l10n.valueShouldBeGreaterThanZero
      };
}
