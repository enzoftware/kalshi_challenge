import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'financial_wellness_event.dart';
part 'financial_wellness_state.dart';

class FinancialWellnessBloc
    extends Bloc<FinancialWellnessEvent, FinancialWellnessState> {
  FinancialWellnessBloc() : super(const FinancialWellnessState()) {
    on<FinancialWellnessEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
