import 'package:finance_repository/finance_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kalshi_challenge/financial_wellness/view/financial_wellness_page.dart';
import 'package:kalshi_challenge/l10n/l10n.dart';
import 'package:kalshi_ui/kalshi_ui.dart';

class KalshiApp extends StatelessWidget {
  const KalshiApp({required this.financeRepository, super.key});

  final FinanceRepository financeRepository;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: financeRepository,
      child: MaterialApp(
        title: 'Kalshi Challenge',
        theme: KalshiTheme.theme,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: const FinancialWellnessPage(),
      ),
    );
  }
}
