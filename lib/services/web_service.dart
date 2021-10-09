import 'package:bloc_news/models/news_model.dart';
import 'package:bloc_news/utils/service_constants.dart';
import 'package:dio/dio.dart';

class WebService {
  Dio dio = Dio();

  Future<List<NewsModel>> getNewsByCountry(String country) async {
    final response = await dio.get(ServiceConstants.urlBuCountry(country));
    if (response.statusCode == 200) {
      final dynamic result = response.data;
      List list = result["articles"];
      return list.map((e) => NewsModel.fromJson(e)).toList();
    } else {
      throw Exception("your have error");
    }
  }

  Future<List<dynamic>> getNews() async {
    final response = await dio.get(ServiceConstants.webUrl);
    if (response.statusCode == 200) {
      final dynamic result = response.data;
      print(result);
      Iterable list = result["articles"];
      return list.map((e) => NewsModel.fromJson(e)).toList();
    } else {
      throw Exception("your have error");
    }
  }
}
