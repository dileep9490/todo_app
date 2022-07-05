import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:todo_app/services/auth.dart';
import 'package:todo_app/utils/errors.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignUpState> {
  SignupBloc()
      : super(SignUpState(isLoading: false, status: false, error: '')) {
    on<SignupEvent>((event, emit) {
      on<SignUpEventStarted>(_onSignUpEventStarted);
    });
  }

  Future<void> _onSignUpEventStarted(
      SignUpEventStarted event, Emitter<SignUpState> emit) async {
    final AuthService authService = AuthService();
    emit(state.copyWith(isLoading: true, error: ''));
    bool? status;
    try {
      status = await authService.singUpService(
          email: event.email,
          username: event.userName,
          password: event.password);
      emit(state.copyWith(status: true, isLoading: false));
    } on InternalServerError catch (e) {
      emit(state.copyWith(error: e.error, isLoading: false, status: false));
    }
  }
}
