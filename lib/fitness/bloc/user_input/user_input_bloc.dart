import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fitness_app/fitness/service/fitness_target_service.dart';

part 'user_input_event.dart';
part 'user_input_state.dart';

class UserInputBloc extends Bloc<UserInputEvent, UserInputState> {
  UserInputBloc() : super(const UserInputState()) {
    on<ChangeGender>(_onChangeGender);
    on<ChangeAge>(_onChangeAge);
    on<ChangeWeight>(_onChangeWeight);
    on<ChangeHeight>(_onChangeHeight);
    on<ChangeGoal>(_onChangeGoal);
    on<ChangeLevel>(_onChangeLevel);
    on<ChangeWeightUnit>(_onChangeWeightUnit);
    on<ChangeHeightUnit>(_onChangeHeightUnit);
  }
  FutureOr<void> _onChangeGender(
      ChangeGender event, Emitter<UserInputState> emit) async {
    emit(state.copyWith(gender: event.gender));
  }

  FutureOr<void> _onChangeAge(
      ChangeAge event, Emitter<UserInputState> emit) async {
    emit(state.copyWith(age: event.age));
  }

  FutureOr<void> _onChangeWeight(
      ChangeWeight event, Emitter<UserInputState> emit) async {
    emit(state.copyWith(weight: event.weight));
  }

  FutureOr<void> _onChangeHeight(
      ChangeHeight event, Emitter<UserInputState> emit) async {
    emit(state.copyWith(height: event.height));
  }

  FutureOr<void> _onChangeGoal(
      ChangeGoal event, Emitter<UserInputState> emit) async {
    var list = List<Goal>.from(state.goal);
    if (list.contains(event.goal)) {
      list.remove(event.goal);
    } else {
      list.add(event.goal);
    }
    emit(state.copyWith(goal: list));
  }

  FutureOr<void> _onChangeLevel(
      ChangeLevel event, Emitter<UserInputState> emit) async {
    emit(state.copyWith(level: event.level));
  }

  FutureOr<void> _onChangeWeightUnit(
      ChangeWeightUnit event, Emitter<UserInputState> emit) async {
    emit(state.copyWith(weightUnit: event.weightUnit));
  }

  FutureOr<void> _onChangeHeightUnit(
      ChangeHeightUnit event, Emitter<UserInputState> emit) async {
    emit(state.copyWith(heightUnit: event.heightUnit));
  }
}
