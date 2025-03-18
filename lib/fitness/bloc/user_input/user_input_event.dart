part of 'user_input_bloc.dart';

class UserInputEvent {}

class ChangeGender extends UserInputEvent {
  final Gender gender;
  ChangeGender({required this.gender});
}

class ChangeAge extends UserInputEvent {
  final int age;
  ChangeAge({required this.age});
}

class ChangeWeight extends UserInputEvent {
  final int weight;
  ChangeWeight({required this.weight});
}

class ChangeHeight extends UserInputEvent {
  final int height;
  ChangeHeight({required this.height});
}

class ChangeGoal extends UserInputEvent {
  final Goal goal;
  ChangeGoal({required this.goal});
}

class ChangeLevel extends UserInputEvent {
  final String level;
  ChangeLevel({required this.level});
}

class ChangeWeightUnit extends UserInputEvent {
  final WeightUnit weightUnit;
  ChangeWeightUnit({required this.weightUnit});
}

class ChangeHeightUnit extends UserInputEvent {
  final HeightUnit heightUnit;
  ChangeHeightUnit({required this.heightUnit});
}
