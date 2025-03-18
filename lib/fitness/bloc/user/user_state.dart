// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'user_bloc.dart';

class UserState extends Equatable {
  final Usermanager? usermanager;
  const UserState({
    this.usermanager,
  });

  @override
  List<Object?> get props => [usermanager];

  UserState copyWith({
    Usermanager? usermanager,
  }) {
    return UserState(
      usermanager: usermanager ?? this.usermanager,
    );
  }
}
