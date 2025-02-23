import 'package:bloc_test/bloc_test.dart';
import 'package:finance_repository/finance_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kalshi_challenge/financial_wellness/financial_wellness.dart';
import 'package:kalshi_ui/kalshi_ui.dart';
import 'package:mocktail/mocktail.dart';

class MockFinanceRepository extends Mock implements FinanceRepository {}

class MockFinancialWellnessBloc
    extends MockBloc<FinancialWellnessEvent, FinancialWellnessState>
    implements FinancialWellnessBloc {}

void main() {
  late FinancialWellnessBloc bloc;

  setUp(() {
    bloc = MockFinancialWellnessBloc();

    when(() => bloc.state).thenReturn(const FinancialWellnessState());
  });

  Widget buildTestableWidget(Widget widget) {
    return MaterialApp(
      home: BlocProvider<FinancialWellnessBloc>.value(
        value: bloc,
        child: widget,
      ),
    );
  }

  group('FinancialWellnessPage', () {
    testWidgets('renders FinancialWellnessView', (tester) async {
      await tester.pumpWidget(
        BlocProvider.value(
          value: bloc,
          child: const MaterialApp(home: FinancialWellnessView()),
        ),
      );
      expect(find.byType(FinancialWellnessView), findsOneWidget);
    });
  });

  group('FinancialWellnessView', () {
    testWidgets('renders header, body, and footer', (tester) async {
      await tester
          .pumpWidget(buildTestableWidget(const FinancialWellnessView()));

      expect(find.byType(FinancialWellnessHeader), findsOneWidget);
      expect(find.byType(FinancialWellnessBody), findsOneWidget);
      expect(find.byType(FinancialWellnessFooter), findsOneWidget);
    });

    testWidgets('shows loading indicator when state is loading',
        (tester) async {
      when(() => bloc.state).thenReturn(
        const FinancialWellnessState(status: FinancialWellnessStatus.loading),
      );

      await tester
          .pumpWidget(buildTestableWidget(const FinancialWellnessBody()));

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('displays financial result when success', (tester) async {
      when(() => bloc.state).thenReturn(
        const FinancialWellnessState(status: FinancialWellnessStatus.success),
      );

      await tester
          .pumpWidget(buildTestableWidget(const FinancialWellnessBody()));

      expect(find.byType(FinancialWellnessResult), findsOneWidget);
    });

    testWidgets('displays calculator when initial state', (tester) async {
      await tester
          .pumpWidget(buildTestableWidget(const FinancialWellnessBody()));

      expect(find.byType(FinancialWellnessCalculator), findsOneWidget);
    });
  });

  group('FinancialWellnessCalculator', () {
    testWidgets('renders inputs and button', (tester) async {
      await tester
          .pumpWidget(buildTestableWidget(FinancialWellnessCalculator()));

      expect(find.text('Annual Income'), findsOneWidget);
      expect(find.text('Monthly Costs'), findsOneWidget);
      expect(find.text('Continue'), findsOneWidget);
    });

    testWidgets('displays validation errors for empty inputs', (tester) async {
      await tester
          .pumpWidget(buildTestableWidget(FinancialWellnessCalculator()));

      await tester.tap(find.text('Continue'));
      await tester.pump();

      expect(find.text('This field is required'), findsNWidgets(2));
    });

    testWidgets('calls bloc event when input changes', (tester) async {
      when(() => bloc.state).thenReturn(const FinancialWellnessState());

      await tester
          .pumpWidget(buildTestableWidget(FinancialWellnessCalculator()));

      await tester.enterText(find.byType(KalshiInput).first, '50000');
      verify(
        () => bloc.add(const FinancialWellnessAnnualIncomeChanged('50000')),
      ).called(1);
    });

    testWidgets('triggers GetFinancialScore event when form is valid',
        (tester) async {
      await tester
          .pumpWidget(buildTestableWidget(FinancialWellnessCalculator()));

      await tester.enterText(find.byType(KalshiInput).first, '50000');
      await tester.enterText(find.byType(KalshiInput).last, '2000');

      await tester.tap(find.text('Continue'));
      await tester.pump();

      verify(() => bloc.add(const FinancialWellnessGetFinancialScore()))
          .called(1);
    });
  });

  group('FinancialWellnessResult', () {
    testWidgets('displays correct result based on score', (tester) async {
      when(() => bloc.state).thenReturn(
        const FinancialWellnessState(score: FinancialScoreHealthy()),
      );

      await tester
          .pumpWidget(buildTestableWidget(const FinancialWellnessResult()));

      expect(find.text('Congratulations!'), findsOneWidget);
      expect(
        find.text('Your Financial Wellness Score is Healthy'),
        findsOneWidget,
      );
    });

    testWidgets('triggers reset when return button is pressed', (tester) async {
      await tester
          .pumpWidget(buildTestableWidget(const FinancialWellnessResult()));

      await tester.tap(find.text('Return'));
      await tester.pump();

      verify(() => bloc.add(const FinancialWellnessReset())).called(1);
    });
  });

  group('FinancialWellnessHeader', () {
    testWidgets('displays correct header text based on state', (tester) async {
      when(() => bloc.state).thenReturn(
        const FinancialWellnessState(status: FinancialWellnessStatus.success),
      );

      await tester
          .pumpWidget(buildTestableWidget(const FinancialWellnessHeader()));

      expect(find.textContaining('Here’s your'), findsOneWidget);
    });

    testWidgets('displays different header text for initial state',
        (tester) async {
      when(() => bloc.state).thenReturn(const FinancialWellnessState());

      await tester
          .pumpWidget(buildTestableWidget(const FinancialWellnessHeader()));

      expect(find.textContaining('Let’s find out your'), findsOneWidget);
    });
  });

  group('FinancialWellnessFooter', () {
    testWidgets('displays security message', (tester) async {
      await tester
          .pumpWidget(buildTestableWidget(const FinancialWellnessFooter()));

      expect(find.text('Your financial information is secure'), findsOneWidget);
    });
  });

  group('FinancialWellnessScoreX', () {
    test('color returns correct color', () {
      expect(
        const FinancialScoreHealthy().color,
        KalshiColors.healthyBackground,
      );
      expect(
        const FinancialScoreAverage().color,
        KalshiColors.averageBackground,
      );
      expect(
        const FinancialScoreUnhealthy().color,
        KalshiColors.unhealthyBackground,
      );
      expect(
        const FinancialScoreUnknown().color,
        KalshiColors.amountInputIcon,
      );
    });
  });
}
