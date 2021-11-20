class UpdateResponse {
  bool success;
  String message;

  UpdateResponse({this.success = false, this.message = ""});

  factory UpdateResponse.formJson(Map<String, dynamic> json) {
    return UpdateResponse(success: json['success'], message: json['message']);
  }
}
