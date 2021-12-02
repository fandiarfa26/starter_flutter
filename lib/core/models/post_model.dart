class PostModel {
  PostModel({
    this.id,
    this.title,
    this.description,
  });

  int? id;
  String? title;
  String? description;

  factory PostModel.fromJson(Map<String, dynamic> json) => PostModel(
        id: json['id'],
        title: json['title'],
        description: json['body'],
      );
}
