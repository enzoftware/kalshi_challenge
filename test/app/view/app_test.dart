import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:kalshi_challenge/financial_wellness/financial_wellness.dart';

void main() {
  group('App', () {
    testWidgets('renders CounterPage', (tester) async {
      await tester.pumpWidget(Container());
      expect(find.byType(FinancialWellnessPage), findsOneWidget);
    });
  });
}
