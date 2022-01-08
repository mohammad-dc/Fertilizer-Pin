class ReadersLogin {
  String token;

  ReadersLogin({this.token = ''});

  factory ReadersLogin.formJson(Map<String, dynamic> json) {
    return ReadersLogin(token: json['token']);
  }
}
