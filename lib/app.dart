import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/repository/user_repository.dart';
import 'package:todo_app/screens/login_screen/login_screen.dart';

import 'blocs/login/login_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: UserRepository(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: BlocProvider(
          create: (context) => LoginBloc(
            repository: context.read<UserRepository>(),
          ),
          child: const LoginScreen(),
        ),
      ),
    );
  }
}
