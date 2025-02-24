import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kalshi_ui/kalshi_ui.dart';

void main() {
  group('KalshiButton', () {
    testWidgets('renders correctly with default properties', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: KalshiButton(text: 'Press Me', onPressed: () {}),
          ),
        ),
      );

      // Check if the text is displayed
      expect(find.text('Press Me'), findsOneWidget);
    });

    testWidgets('triggers onPressed callback when tapped', (tester) async {
      var wasPressed = false;
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: KalshiButton(
              text: 'Tap Me',
              onPressed: () => wasPressed = true,
            ),
          ),
        ),
      );

      await tester.tap(find.text('Tap Me'));
      await tester.pump();

      expect(wasPressed, isTrue);
    });

    testWidgets('does not trigger onPressed when disabled', (tester) async {
      const wasPressed = false;
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: KalshiButton(
              text: 'Disabled',
            ),
          ),
        ),
      );

      await tester.tap(find.text('Disabled'));
      await tester.pump();

      expect(wasPressed, isFalse);
    });

    testWidgets('renders with correct custom background color', (tester) async {
      const customColor = Colors.red;
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: KalshiButton(
              text: 'Custom Color',
              backgroundColor: customColor,
              onPressed: () {},
            ),
          ),
        ),
      );

      final button = tester.widget<TextButton>(find.byType(TextButton));
      expect(
        button.style?.backgroundColor?.resolve({}),
        customColor,
      );
    });

    testWidgets('renders as an outlined button', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: KalshiButton.outlined(text: 'Outlined', onPressed: () {}),
          ),
        ),
      );

      final button = tester.widget<TextButton>(find.byType(TextButton));
      expect(
        button.style?.backgroundColor?.resolve({}),
        Colors.transparent,
      );
    });

    testWidgets('renders correct text color', (tester) async {
      const textColor = Colors.green;
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: KalshiButton(
              text: 'Text Color',
              textColor: textColor,
              onPressed: () {},
            ),
          ),
        ),
      );

      final textWidget = tester.widget<Text>(find.text('Text Color'));
      expect(textWidget.style?.color, textColor);
    });

    testWidgets('applies correct width', (tester) async {
      const double customWidth = 200;
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: KalshiButton(
              text: 'Fixed Width',
              width: customWidth,
              onPressed: () {},
            ),
          ),
        ),
      );

      final button = tester.widget<TextButton>(find.byType(TextButton));
      final minimumSize =
          (button.style?.minimumSize as WidgetStatePropertyAll<Size?>?)
              ?.resolve(
        {},
      );

      expect(minimumSize?.width, customWidth);
    });
  });
}
