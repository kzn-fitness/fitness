// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'user_input_bloc.dart';

class UserInputState extends Equatable {
  final Gender gender;
  final HeightUnit heightUnit;
  final WeightUnit weightUnit;
  final List<Goal> goal;
  final int age;
  final int height;
  final int weight;
  final String level;
  const UserInputState(
      {this.gender = Gender.male,
      this.heightUnit = HeightUnit.cm,
      this.weightUnit = WeightUnit.kg,
      this.goal = const [],
      this.age = 22,
      this.height = 22,
      this.weight = 22,
      this.level = ""});

  @override
  List<Object?> get props =>
      [gender, heightUnit, weightUnit, goal, age, height, weight, level];

  UserInputState copyWith({
    Gender? gender,
    HeightUnit? heightUnit,
    WeightUnit? weightUnit,
    List<Goal>? goal,
    int? age,
    int? height,
    int? weight,
    String? level,
  }) {
    return UserInputState(
      gender: gender ?? this.gender,
      heightUnit: heightUnit ?? this.heightUnit,
      weightUnit: weightUnit ?? this.weightUnit,
      goal: goal ?? this.goal,
      age: age ?? this.age,
      height: height ?? this.height,
      weight: weight ?? this.weight,
      level: level ?? this.level,
    );
  }
}
