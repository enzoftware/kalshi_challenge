import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kalshi_challenge/common/common.dart';
import 'package:kalshi_challenge/financial_wellness/financial_wellness.dart';
import 'package:kalshi_challenge/l10n/l10n.dart';
import 'package:kalshi_ui/kalshi_ui.dart';

class FinancialWellnessPage extends StatelessWidget {
  const FinancialWellnessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => FinancialWellnessBloc(),
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
            child: Column(
              spacing: 36,
              children: [
                _FinancialWellnessHeader(),
                _FinancialWellnessCalculator(),
                _FinancialWellnessFooter(),
              ],
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

    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: l10n.letsFindOutYour,
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
  const _FinancialWellnessCalculator();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final textTheme = Theme.of(context).textTheme;

    return SizedBox(
      width: double.infinity,
      child: Card(
        elevation: 4,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        child: Column(
          children: [
            Image.asset(
              'assets/kalshilogo.png',
              height: 48,
            ),
            const SizedBox(height: 16),
            Text(
              l10n.financialWellnessScore,
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: KalshiButton(text: l10n.continueText),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
