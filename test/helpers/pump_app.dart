import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import './fake_l10n.dart';

extension PumpApp on WidgetTester {
  Future<void> pumpApp(Widget widget) async {
    await pumpWidget(
      MaterialApp(
        localizationsDelegates: [
          FakeAppLocalizationsDelegate(),
        ],
        supportedLocales: const [Locale('en')],
        locale: const Locale('en'),
        home: widget,
      ),
    );
    await pumpAndSettle();
  }
}
