class Register {
  bool success;
  String message;

  Register({this.success = false, this.message = ''});

  factory Register.formJson(Map<String, dynamic> json) {
    return Register(success: json['success'], message: json['message']);
  }
}
