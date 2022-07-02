import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:todo_app/repository/user_repository.dart';
import 'package:todo_app/services/auth.dart';
import 'package:todo_app/utils/errors.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc({
    required UserRepository repository,
  })  : _userRepository = repository,
        super(LoginState(isLoading: false, error: '', status: false)) {
    on<LoginEventStarted>(_onLoginEventStarted);
  }

  final UserRepository _userRepository;

  Future<void> _onLoginEventStarted(
      LoginEventStarted event, Emitter<LoginState> emit) async {
    emit(state.copyWith(isLoading: true,error: ''));
    final AuthService authservice = AuthService();

    String? apiKey;
    try {
      apiKey = await authservice.loginService(
          email: event.email, password: event.password);

      _userRepository.copyWith(apiKey: apiKey);
      emit(state.copyWith(status: true, isLoading: false));
    } on CredentialsIncorrect {
      emit(state.copyWith(error: "Incorrect Credentials", isLoading: false));
    }
  }
}
