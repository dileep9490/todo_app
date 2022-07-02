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
        super(LoginState(isLoading: false)) {
    on<LoginEventStarted>(_onLoginEventStarted);
  }

  final UserRepository _userRepository;

  Future<void> _onLoginEventStarted(
      LoginEventStarted event, Emitter<LoginState> emit) async {
    emit(state.copyWith(isLoading: true));
    final Authservice = AuthService();
    String? apiKey;
    try {
      apiKey = await Authservice.loginService(
          email: event.email, password: event.password);
      print(apiKey);
    } on CredentialsIncorrect {
      print("Incorrect creds");
    }
  }
}
