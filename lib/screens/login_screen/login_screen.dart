import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/blocs/login/login_bloc.dart';
import 'package:todo_app/repository/user_repository.dart';
import 'package:todo_app/screens/home_screen/home_screen.dart';
import 'package:todo_app/screens/signup_screen/signup_screen.dart';
import 'package:todo_app/services/auth.dart';
import 'package:todo_app/utils/mixins.dart';
import 'package:todo_app/widgets/formfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static const route = '/login';
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with InputValidators {
  late TextEditingController emailController;
  late TextEditingController passwordController;

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    return BlocConsumer<LoginBloc, LoginState>(
      listenWhen: (previous, current) =>
          current.error != '' || current.status == true,
      listener: ((context, state) {
        if (state.error != '') {
          final snackbar = SnackBar(
            content: Text("${state.error}"),
            backgroundColor: Colors.red,
            duration: Duration(seconds: 2),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackbar);
        } else {
          Navigator.of(context).pushNamed(HomeScreen.route);
        }
      }),
      builder: (context, state) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.only(top: 180),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "TODO APP",
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.w500,
                      color: Colors.green,
                    ),
                  ),
                  Container(
                    height: 350,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(blurRadius: 5, color: Colors.grey),
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    margin: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 20),
                    padding: const EdgeInsets.symmetric(
                        vertical: 40, horizontal: 40),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InputFormField(
                            labelText: "Email",
                            controller: emailController,
                            validator: (String? value) {
                              if (value!.isEmpty) {
                                return "Email cannot be empty";
                              }
                              // if (isEmailValid(value)) {
                              //   return "Enter a Valid Email";
                              // }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          InputFormField(
                            labelText: "Password",
                            controller: passwordController,
                            validator: (String? value) {
                              if (value!.isEmpty) {
                                return "Password cannot be empty";
                              }
                              if (isPasswordValid(value)) {
                                return 'Enter a valid password(Min. 6 characters)';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          GestureDetector(
                            onTap: () {
                              if (_formKey.currentState!.validate()) {
                                context.read<UserRepository>().copyWith(
                                      password: passwordController.text,
                                      email: emailController.text,
                                    );
                                context.read<LoginBloc>().add(
                                      LoginEventStarted(
                                          email: emailController.text,
                                          password: passwordController.text),
                                    );
                              }
                            },
                            child: state.isLoading!
                                ? const Center(
                                    child: CircularProgressIndicator(
                                      color: Colors.green,
                                    ),
                                  )
                                : Container(
                                    height: 45,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.green,
                                    ),
                                    child: const Center(
                                      child: Text(
                                        "Login",
                                        style: TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white),
                                      ),
                                    ),
                                  ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "Don't have an account?  ",
                                style: TextStyle(fontSize: 16),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context)
                                      .pushNamed(SignUpScreen.route);
                                },
                                child: const Text(
                                  "Signup",
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.blue),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
