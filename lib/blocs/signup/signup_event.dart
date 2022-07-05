part of 'signup_bloc.dart';

@immutable
abstract class SignupEvent {}

class SignUpEventStarted extends SignupEvent {
  String userName;
  String email;
  String password;
  SignUpEventStarted({
    required this.userName,
    required this.email,
    required this.password,
  });
}
