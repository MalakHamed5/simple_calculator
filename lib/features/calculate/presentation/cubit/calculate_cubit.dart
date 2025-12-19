import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

part 'calculate_state.dart';

class CalculateCubit extends Cubit<CalculateState> {
  CalculateCubit() : super(CalculateInitial());

  addValue(String value) {
    String exp = state.expression;
    if (exp == "0") {
      emit(CalculatedUpdate(value, state.result));
      return;
    }
    emit(CalculatedUpdate(exp + value, state.result));
  }

  deleteLast() {
    String exp = state.expression;
    if (exp.isNotEmpty) {
      exp = exp.substring(0, exp.length - 1);
      emit(CalculatedUpdate(exp, state.result));
    }
  }

 void clear() {
    emit(CalculatedUpdate("0", '0'));
  }

  calculated() {
    dynamic expression = state.expression;
    try {
      Parser p = Parser();

      Expression exp = p.parse(expression);
      ContextModel cm = ContextModel();
      double evaluat = exp.evaluate(EvaluationType.REAL, cm);

      emit(CalculatedUpdate(expression, evaluat.toString()));
    } catch (e) {
      emit(CalculatedUpdate(expression, 'Error'));
    }
  }

  void persentage(String value) {
    String exp = state.expression;
    try {
      Parser p = Parser();
      Expression expression = p.parse(exp);
      ContextModel cm = ContextModel();

      final value = expression.evaluate(EvaluationType.REAL, cm);

      double percentValue = value / 100;

      emit(CalculatedUpdate(percentValue.toString(), state.result));
    } catch (e) {
      emit(CalculatedUpdate(exp, 'Error'));
    }
  }

  void addParenthesis() {
    final exp = state.expression;

    int openCount = '('.allMatches(exp).length;
    int closeCount = ')'.allMatches(exp).length;

    // لو مفيش حاجة أو آخر حاجة operator → افتحي (
    if (exp.isEmpty || '+-*/('.contains(exp.characters.last)) {
      emit(CalculatedUpdate('$exp(', state.result));
      return;
    }

    // لو في قوس مفتوح محتاج يتقفل
    if (openCount > closeCount && !'+-*/('.contains(exp.characters.last)) {
      emit(CalculatedUpdate("$exp)", state.result));
      return;
    }

    emit(CalculatedUpdate('$exp(', state.result));
  }
}
