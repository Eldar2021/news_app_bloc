import 'package:hive/hive.dart';

part 'news_model.g.dart';

@HiveType(typeId: 0)
class NewsModel{
  @HiveField(0)
  final String title;
  @HiveField(1)
  final String author;
  @HiveField(2)
  final String description;
  @HiveField(3)
  final String urlImage;
  @HiveField(4)
  final String url;
  @HiveField(5)
  final String publishedAt;
  @HiveField(6)
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
