part of 'signup_bloc.dart';

class SignUpState {
  final bool? status;
  final bool? isLoading;
  final String? error;
  SignUpState({
    this.status,
    this.isLoading,
    this.error,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SignUpState &&
        other.status == status &&
        other.isLoading == isLoading &&
        other.error == error;
  }

  SignUpState copyWith({
    bool? status,
    bool? isLoading,
    String? error,
  }) {
    return SignUpState(
      status: status ?? this.status,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }

  @override
  int get hashCode => status.hashCode ^ isLoading.hashCode ^ error.hashCode;

  @override
  String toString() =>
      'SignUpState(status: $status, isLoading: $isLoading, error: $error)';
}
