import 'package:bloc_news/models/news_model.dart';
import 'package:bloc_news/screens/detail_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NewsCard extends StatelessWidget {
  const NewsCard({
    Key? key,
    required this.newsModels,
  }) : super(key: key);

  final List<NewsModel> newsModels;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      primary: false,
      itemCount: this.newsModels.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: (MediaQuery.of(context).orientation == Orientation.portrait) ? 2 : 3),
      itemBuilder: (BuildContext _, int index) {
        final article = this.newsModels[index];
        return GestureDetector(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => DetailScreen(article: article)));
          },
          child: GridTile(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: CachedNetworkImage(
                  imageUrl: article.urlImage,
                  placeholder: (context, url) => Image.asset("assets/images/Без названия.jpeg"),
                  errorWidget: (context, url, error) =>
                      Image.asset("assets/images/Без названия.jpeg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            footer: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              alignment: Alignment.center,
              child: Text(
                article.title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        );
      },
    );
  }
}

class NowBody extends StatelessWidget {
  const NowBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: Text("bilbeym"));
  }
}

class ErrorBody extends StatelessWidget {
  const ErrorBody({
    required this.massage,
    Key? key,
  }) : super(key: key);

  final String massage;

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(massage));
  }
}

class LoadingBody extends StatelessWidget {
  const LoadingBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: CircularProgressIndicator());
  }
}

class InitStateBody extends StatelessWidget {
  const InitStateBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: Text("Башталгыс бет"));
  }
}
