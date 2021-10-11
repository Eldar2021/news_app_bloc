import 'package:bloc_news/models/news_model.dart';
import 'package:bloc_news/news_state/news_state.dart';
import 'package:bloc_news/services/hive_services.dart';
import 'package:bloc_news/services/web_service.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsBloc extends Cubit<NewsState> {
  NewsBloc() : super(StateInit());
  WebService webService = WebService();
  HiveService hiveService = HiveService();
  Connectivity connectivity = Connectivity();

  void getNewsCubit() async {
    await internet("NewsModel");
    try {
      emit(StateLoading());
      bool isExist = await hiveService.isExists(boxName: "NewsModel");
      if (isExist == true) {
        List<dynamic> response = await hiveService.getBoxes("NewsModel");
        emit(StateSuccess(response));
        print("data is hive");
      } else {
        List<dynamic> response = await webService.getNews();
        emit(StateSuccess(response));
        await hiveService.addBoxes(response, "NewsModel");
        print("data is dio");
      }
    } catch (e) {
      emit(StateError("Ката болду"));
      print(e);
    }
  }

  Future<void> internet(String boxName) async {
    try {
      ConnectivityResult result = await connectivity.checkConnectivity();
      print("results $result");
      if (result == ConnectivityResult.wifi) {
        hiveService.clearBoxes(boxName);
      } else if (result == ConnectivityResult.mobile) {
        hiveService.clearBoxes(boxName);
      } else {
        print("internet jok");
      }
    } catch (e) {
      print("kataaa $e");
    }
  }

  void getNewsBuCountryCubit(String country) async {
    await internet("NewsModel$country");
    try {
      emit(StateLoading());
      bool isExist = await hiveService.isExists(boxName: "NewsModel$country");
      if (isExist == true) {
        List<dynamic> response = await hiveService.getBoxes("NewsModel$country");
        emit(StateSuccess(response));
        print("data is hive");
      } else {
        List<NewsModel> response = await webService.getNewsByCountry(country);
        emit(StateSuccess(response));
        await hiveService.addBoxes(response, "NewsModel$country");
        print("data is dio");
      }
    } catch (e) {
      emit(StateError("Ката болду"));
      print(e);
    }
  }
}
