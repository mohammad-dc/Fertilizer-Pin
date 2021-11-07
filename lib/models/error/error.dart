class Error {
  bool success;
  String message;

  Error({this.success = false, this.message = ""});

  factory Error.formJson(Map<String, dynamic> json) {
    return Error(success: json['success'], message: json['message']);
  }
}
