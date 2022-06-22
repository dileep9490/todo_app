import 'package:flutter/material.dart';
import 'package:todo_app/widgets/formfield.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
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
                margin:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                padding:
                    const EdgeInsets.symmetric(vertical: 40, horizontal: 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InputFormField(labelText: "Email"),
                    const SizedBox(
                      height: 20,
                    ),
                    InputFormField(labelText: "Password"),
                    const SizedBox(
                      height: 40,
                    ),
                    GestureDetector(
                      onTap: () {
                        //TODO:implement the code for login
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
                            //TODO: navigate to signup screen
                          },
                          child: const Text(
                            "Signup",
                            style: TextStyle(fontSize: 16, color: Colors.blue),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
