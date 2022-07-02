class UserRepository {
  final String? userName;
  final String? password;
  final String? userId;
  final String? email;
  final String? apiKey;
  UserRepository({
    this.userName,
    this.password,
    this.userId,
    this.email,
    this.apiKey,
  });

  UserRepository copyWith(
      {String? userName,
      String? password,
      String? userId,
      String? email,
      String? apiKey}) {
    return UserRepository(
      userName: userName ?? this.userName,
      password: password ?? this.password,
      userId: userId ?? this.userId,
      email: email ?? this.email,
      apiKey: apiKey ?? this.apiKey,
    );
  }

  @override
  String toString() {
    return 'UserRepository(userName: $userName, password: $password, userId: $userId, email: $email, apiKey: $apiKey)';
  }
}
