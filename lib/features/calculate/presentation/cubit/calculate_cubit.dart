import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:math_expressions/math_expressions.dart';

part 'calculate_state.dart';

class CalculateCubit extends Cubit<CalculateState> {
  CalculateCubit() : super(CalculateInitial());

  String _expression = "";

   addValue(String value) {
    _expression += value;
    emit(CalculatedUpdate(_expression, state.result));
  }

   deleteLast() {
    if (_expression.isNotEmpty) {
      _expression = _expression.substring(0, _expression.length - 1);
      emit(CalculatedUpdate(_expression, state.result));
    }
  }

   clear() {
    _expression = "";
    emit(CalculatedUpdate(_expression, ''));
  }

   calculated() {
    try {
      Parser p = Parser();

      Expression exp = p.parse(_expression);
      ContextModel cm = ContextModel();
      double evaluat = exp.evaluate(EvaluationType.REAL, cm);

      emit(CalculatedUpdate(_expression, evaluat.toString()));
    } catch (e) {
      emit(CalculatedUpdate(_expression, 'Error'));
    }
  }
}
