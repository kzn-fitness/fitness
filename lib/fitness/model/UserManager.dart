// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Usermanager {
  final String? userId;
  final double stepTarget;
  final double caloriesBurnTarget;
  final double sleepTarget;
  final String? image;
  final String? fullName;
  final String? nickName;
  final String? email;
  final String? phone;
  final List<String> goals;
  const Usermanager({
    this.userId,
    required this.stepTarget,
    required this.caloriesBurnTarget,
    required this.sleepTarget,
    this.image,
    this.fullName,
    this.nickName,
    this.email,
    this.phone,
    required this.goals,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userId': userId,
      'stepTarget': stepTarget,
      'caloriesBurnTarget': caloriesBurnTarget,
      'sleepTarget': sleepTarget,
      'image': image,
      'fullName': fullName,
      'nickName': nickName,
      'email': email,
      'phone': phone,
      'goals': goals,
    };
  }

  factory Usermanager.fromMap(Map<String, dynamic> map) {
    return Usermanager(
      userId: map['userId'] != null ? map['userId'] as String : null,
      stepTarget: map['stepTarget'] as double,
      caloriesBurnTarget: map['caloriesBurnTarget'] as double,
      sleepTarget: map['sleepTarget'] as double,
      image: map['image'] != null ? map['image'] as String : null,
      fullName: map['fullName'] != null ? map['fullName'] as String : null,
      nickName: map['nickName'] != null ? map['nickName'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      phone: map['phone'] != null ? map['phone'] as String : null,
      goals: (map['goals'] as List<dynamic>).map((e) => e as String).toList(),
    );
  }

  String toJson() => json.encode(toMap());

  factory Usermanager.fromJson(String source) =>
      Usermanager.fromMap(json.decode(source) as Map<String, dynamic>);

  Usermanager copyWith({
    String? userId,
    double? stepTarget,
    double? caloriesBurnTarget,
    double? sleepTarget,
    String? image,
    String? fullName,
    String? nickName,
    String? email,
    String? phone,
    List<String>? goals,
  }) {
    return Usermanager(
      userId: userId ?? this.userId,
      stepTarget: stepTarget ?? this.stepTarget,
      caloriesBurnTarget: caloriesBurnTarget ?? this.caloriesBurnTarget,
      sleepTarget: sleepTarget ?? this.sleepTarget,
      image: image ?? this.image,
      fullName: fullName ?? this.fullName,
      nickName: nickName ?? this.nickName,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      goals: goals ?? this.goals,
    );
  }
}
