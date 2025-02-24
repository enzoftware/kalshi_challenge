// ignore_for_file: prefer_const_constructors
import 'package:finance_repository/src/finance_repository_impl.dart';
import 'package:test/test.dart';

void main() {
  group('FinanceRepository', () {
    test('can be instantiated', () {
      expect(FinanceRepositoryImpl(), isNotNull);
    });
  });
}
