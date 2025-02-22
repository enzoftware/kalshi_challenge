import 'package:finance_repository/finance_repository.dart';
import 'package:kalshi_challenge/app/app.dart';
import 'package:kalshi_challenge/bootstrap.dart';

void main() {
  bootstrap(
    ({required FinanceRepository financeRepository}) => KalshiApp(
      financeRepository: financeRepository,
    ),
  );
}
