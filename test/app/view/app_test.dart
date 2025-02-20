import 'package:flutter_test/flutter_test.dart';
import 'package:kalshi_challenge/app/app.dart';
import 'package:kalshi_challenge/financial_wellness/financial_wellness.dart';

void main() {
  group('App', () {
    testWidgets('renders CounterPage', (tester) async {
      await tester.pumpWidget(const App());
      expect(find.byType(FinancialWellnessPage), findsOneWidget);
    });
  });
}
