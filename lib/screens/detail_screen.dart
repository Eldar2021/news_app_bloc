import 'package:bloc_news/models/news_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  DetailScreen({required this.article});

  final NewsModel article;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Row(
          children: <Widget>[
            Container(
              constraints: BoxConstraints(
                maxWidth: 150,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Author',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    this.article.author,
                    overflow: TextOverflow.ellipsis,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 30, right: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Stack(
                  alignment: Alignment.centerLeft,
                  children: <Widget>[
                    Divider(
                      height: 80,
                      color: Color(0xffFF8A30),
                      thickness: 20,
                    ),
                    Text(
                      ' Headline',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                Text(
                  this.article.title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    wordSpacing: 3,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  this.article.publishedAt,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  height: 200,
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: CachedNetworkImage(
                        imageUrl: article.urlImage,
                        placeholder: (context, url) =>
                            Image.asset("assets/images/Без названия.jpeg"),
                        errorWidget: (context, url, error) =>
                            Image.asset("assets/images/Без названия.jpeg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  this.article.description,
                  style: TextStyle(
                    fontSize: 16,
                    wordSpacing: 3,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  this.article.content,
                  style: TextStyle(
                    fontSize: 16,
                    wordSpacing: 3,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
