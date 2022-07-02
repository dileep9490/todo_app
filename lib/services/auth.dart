/// this file holds all the functions required for authentication

import 'dart:convert';

import "package:http/http.dart" as http;
import 'package:todo_app/utils/const.dart';
import 'package:todo_app/utils/errors.dart';

class AuthService {
  Future<String?> loginService(
      {required String email, required String password}) async {
    String? apiKey;
    var url = Uri.parse('${baseUrl}auth/login');
    var response =
        await http.post(url, body: {"email": email, "password": password});
    if (response.statusCode == 404) {
      throw CredentialsIncorrect();
    } else {
      apiKey = jsonDecode(response.body)["apiKey"];
      return apiKey;
    }
  }
}
