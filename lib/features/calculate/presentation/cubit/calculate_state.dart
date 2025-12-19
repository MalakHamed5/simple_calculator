part of 'calculate_cubit.dart';

sealed class CalculateState extends Equatable {
  final String expression;
  final String result;
  const CalculateState(this.expression, this.result);

  @override
  List<Object> get props => [];
}

final class CalculateInitial extends CalculateState {
  const CalculateInitial() : super('0', '');
}

final class CalculatedUpdate extends CalculateState {
  const CalculatedUpdate(String expression, String result) : super(expression, result);
}
