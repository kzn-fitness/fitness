part of 'user_bloc.dart';

class UserEvent {}

class SubscribeUsermanager extends UserEvent {}

class SignInGoogle extends UserEvent {
  final Usermanager usermanager;
  SignInGoogle({required this.usermanager});
}
