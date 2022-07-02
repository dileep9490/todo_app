part of 'login_bloc.dart';

class LoginState {
  final UserRepository? userRepository;
  final bool? isLoading;
  final String? error;
  LoginState({
    this.userRepository,
    this.isLoading,
    this.error,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is LoginState &&
        other.userRepository == userRepository &&
        other.isLoading == isLoading &&
        other.error == error;
  }

  LoginState copyWith({
    UserRepository? userRepository,
    bool? isLoading,
    String? error,
  }) {
    return LoginState(
      userRepository: userRepository ?? this.userRepository,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }

  @override
  int get hashCode =>
      userRepository.hashCode ^ isLoading.hashCode ^ error.hashCode;

  @override
  String toString() =>
      'LoginState(userRepository: $userRepository, isLoading: $isLoading, error: $error)';
}
