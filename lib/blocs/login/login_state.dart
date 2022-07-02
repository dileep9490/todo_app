part of 'login_bloc.dart';

class LoginState {
  final bool? status;
  final bool? isLoading;
  final String? error;
  LoginState({
    this.status,
    this.isLoading,
    this.error,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is LoginState &&
        other.status == status &&
        other.isLoading == isLoading &&
        other.error == error;
  }

  LoginState copyWith({
    bool? status,
    bool? isLoading,
    String? error,
  }) {
    return LoginState(
      status: status ?? this.status,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }

  @override
  int get hashCode =>
      status.hashCode ^ isLoading.hashCode ^ error.hashCode;

  @override
  String toString() =>
      'LoginState(status: $status, isLoading: $isLoading, error: $error)';
}
