import 'package:flutter/material.dart';
import 'package:kalshi_challenge/financial_wellness/view/financial_wellness_page.dart';
import 'package:kalshi_challenge/l10n/l10n.dart';
import 'package:kalshi_ui/kalshi_ui.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kalshi Challenge',
      theme: KalshiTheme.theme,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: const FinancialWellnessPage(),
    );
  }
}
