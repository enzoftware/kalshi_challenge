import 'package:flutter/material.dart';
import 'package:kalshi_challenge/l10n/l10n.dart';

class FakeAppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  @override
  bool isSupported(Locale locale) => true;

  @override
  Future<AppLocalizations> load(Locale locale) async => FakeAppLocalizations();

  @override
  bool shouldReload(LocalizationsDelegate<AppLocalizations> old) => false;
}

class FakeAppLocalizations extends AppLocalizations {
  FakeAppLocalizations() : super('en');

  @override
  String get financialInfoSecure => 'Your financial information is secure';

  @override
  String get heresYour => 'Heres your';

  @override
  String get letsFindOutYour => 'Lets find out your';

  @override
  String get financialWellnessScore => 'Financial Wellness Score';

  @override
  String get annualIncome => 'Annual Income';

  @override
  String get monthlyCosts => 'Monthly Costs';

  @override
  String get continueText => 'Continue';

  @override
  String get returnText => 'Return';

  @override
  String get congratulations => 'Congratulations!';

  @override
  String get roomForImprovement => 'Room for Improvement';

  @override
  String get caution => 'Caution';

  @override
  String get healthy => 'Healthy';

  @override
  String get average => 'Average';

  @override
  String get unhealthy => 'Unhealthy';

  @override
  String get yourFinancialWellnessScoreIs => 'Your Financial Wellness Score is';

  @override
  String get thisFieldIsRequired => 'This field is required';

  @override
  String get invalidValue => 'Invalid value';

  @override
  String get valueShouldBeGreaterThanZero =>
      'Value should be greater than zero';

  @override
  String get counterAppBarTitle => '';

  @override
  String get enterYourFinancialInfo => 'Enter your financial info';

  @override
  String get financialWellnessTest => 'Financial Wellness Test';
}
