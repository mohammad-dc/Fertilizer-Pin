class Response {
  bool success;
  Map<String, dynamic> resposne;

  Response({this.success = false, this.resposne = const {}});

  factory Response.formJson(Map<String, dynamic> json) {
    return Response(success: json['success'], resposne: json['resposne']);
  }
}
