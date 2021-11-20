class UpdateImageResponse {
  bool success;
  String message, image;

  UpdateImageResponse(
      {this.success = false, this.message = "", this.image = ""});

  factory UpdateImageResponse.formJson(Map<String, dynamic> json) {
    return UpdateImageResponse(
        success: json['success'],
        message: json['message'],
        image: json['image']);
  }
}
