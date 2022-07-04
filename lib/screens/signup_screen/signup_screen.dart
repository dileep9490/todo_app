import "package:flutter/material.dart";
import 'package:todo_app/utils/mixins.dart';

import '../../widgets/formfield.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);
  static const route = '/signup';

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> with InputValidators {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController confirmpasswordController;
  late TextEditingController userNameController;

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmpasswordController = TextEditingController();
    userNameController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();
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
                width: double.infinity,
                decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(blurRadius: 5, color: Colors.grey),
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                margin:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                padding:
                    const EdgeInsets.symmetric(vertical: 40, horizontal: 40),
                child: Form(
                  key: signupFormKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InputFormField(
                        labelText: "UserName",
                        controller: userNameController,
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return "UserName cannot be empty";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
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
                        height: 20,
                      ),
                      InputFormField(
                        labelText: "Confirm Password",
                        controller: confirmpasswordController,
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return "Password cannot be empty";
                          }

                          if (passwordController != confirmpasswordController) {
                            return "passwords do not match";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      GestureDetector(
                        onTap: () {
                          signupFormKey.currentState!.validate();
                        },
                        child: Container(
                          height: 45,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.green,
                          ),
                          child: const Center(
                            child: Text(
                              "SignUp",
                              style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
