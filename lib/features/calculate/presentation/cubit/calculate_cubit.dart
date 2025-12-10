import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'calculate_state.dart';

class CalculateCubit extends Cubit<CalculateState> {
  CalculateCubit() : super(CalculateInitial());
}
