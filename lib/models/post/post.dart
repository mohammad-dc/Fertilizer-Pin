class Post {
  int id;
  String title;
  String description;
  String createdAt;

  Post(
      {this.id = 0,
      this.title = '',
      this.description = "",
      required this.createdAt});

  factory Post.formJson(Map<String, dynamic> json) {
    return Post(
        id: json['id'],
        title: json['title'],
        description: json['description'],
        createdAt: json['created_at']);
  }
}
