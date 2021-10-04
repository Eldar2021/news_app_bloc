class NewsModel {
  final String title;
  final String author;
  final String description;
  final String urlImage;
  final String url;
  final String publishedAt;
  final String content;

  NewsModel({
    required this.title,
    required this.author,
    required this.description,
    required this.urlImage,
    required this.url,
    required this.publishedAt,
    required this.content,
  });

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
      title: json["title"] ?? "eldar",
      author: json["author"] ?? "eldar",
      description: json["description"] ?? "eldar",
      urlImage: json["urlToImage"] ?? "assets/images/Без названия.jpeg",
      url: json["url"],
      publishedAt: json["publishedAt"] ?? "eldar",
      content: json["content"] ?? "eldar",
    );
  }

}
