import 'package:bloc_news/models/news_model.dart';
import 'package:bloc_news/news_state/news_state.dart';
import 'package:bloc_news/services/web_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsBloc extends Cubit<NewsState> {
  NewsBloc() : super(StateInit());
  WebService webService = WebService();

  void getNewsCubit() async {
    try {
      emit(StateLoading());
      List<NewsModel> response = await webService.getNews();
      emit(StateSuccess(response));
    } catch (e) {
      emit(StateError("Ката болду"));
      print(e);
    }
  }

  void getNewsBuCountryCubit(String country) async {
    try {
      emit(StateLoading());
      List<NewsModel> response = await webService.getNewsByCountry(country);
      emit(StateSuccess(response));
    } catch (e) {
      emit(StateError("Ката болду"));
      print(e);
    }
  }
}
