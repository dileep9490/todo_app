part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}

class LoginEventStarted extends LoginEvent {
  String email;
  String password;
  LoginEventStarted({
    required this.email,
    required this.password,
  });
}
